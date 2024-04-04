-- Fetch all recipes
SELECT * FROM Recipes;

--- Fetch all ingredients used in a specific recipe (e.g., recipe with ID 1):
SELECT Ingredients.* 
FROM Ingredients 
INNER JOIN RecipesIngredient ON Ingredients.IngredientID = RecipesIngredient.IngredientID 
WHERE RecipesIngredient.RecipeID = 1;

-- Fetch all alternative recipes for a specific recipe (e.g., recipe with ID 5):
SELECT Recipes.* 
FROM Recipes 
INNER JOIN AlternativeRecipes ON Recipes.RecipeID = AlternativeRecipes.AlternativeRecipesID 
WHERE AlternativeRecipes.RecipeID = 5;

-- Fetch all alternative ingredients for a specific recipe (e.g., recipe with ID 5):
SELECT Ingredients.* 
FROM Ingredients 
INNER JOIN AlternativeIngredients ON Ingredients.IngredientID = AlternativeIngredients.AlternativeIngredientID 
WHERE AlternativeIngredients.RecipeID = 5;

-- Script to fetch all the recipe details by specifying the recipeID
CREATE PROCEDURE GetRecipeDetails @RecipeID INT AS
BEGIN
	-- Selects recipe by using specific ID
    SELECT * FROM Recipes WHERE RecipeID = @RecipeID;

	-- Selects ingredients, amount and unit for specified recipeID
    SELECT i.IngredientName, ri.Amount, ri.Unit 
    FROM RecipesIngredient ri 
    INNER JOIN Ingredients i ON ri.IngredientID = i.IngredientID 
    WHERE ri.RecipeID = @RecipeID;

	-- Selects required hardware for specified recipeID
    SELECT ch.HardwareName 
    FROM RecipesHardware rh 
    INNER JOIN CookingHardware ch ON rh.HardwareID = ch.HardwareID 
    WHERE rh.RecipeID = @RecipeID;

	-- Selects instructions for specified recipeID
    SELECT StepNumber, StepDescription 
    FROM Instructions 
    WHERE RecipeID = @RecipeID
    ORDER BY StepNumber;

	-- Selects alternative recipes that can be made by using the same ingredients by specified RecipeID
    SELECT r2.RecipeName 
    FROM AlternativeRecipes ar 
    INNER JOIN Recipes r2 ON ar.AlternativeRecipesID = r2.RecipeID 
    WHERE ar.RecipeID = @RecipeID;

	-- Selects alternative ingredients that can be used in for alternative recipes by specified RecipeID
    SELECT i.IngredientName, ai2.IngredientName AS AlternativeIngredient 
    FROM RecipesIngredient ri 
    INNER JOIN Ingredients i ON ri.IngredientID = i.IngredientID 
    LEFT JOIN AlternativeIngredients ai ON ai.IngredientID = i.IngredientID AND ai.RecipeID = @RecipeID
    LEFT JOIN Ingredients ai2 ON ai.AlternativeIngredientID = ai2.IngredientID
    WHERE ri.RecipeID = @RecipeID;
END

-- After creating PROCEDURE you can execute this to select the details of any recipe
EXEC GetRecipeDetails @RecipeID = 5; -- specify recipeID from 1-8


-- Update the name of a recipe (e.g., recipe with ID 1 to 'Vegan Spaghetti Bolognese'):
UPDATE Recipes SET RecipeName = 'Vegan Spaghetti Bolognese' WHERE RecipeID = 1;

-- Update the allergy warning of an ingredient (e.g., ingredient with ID 2 to 'None'):
UPDATE Ingredients SET AllergyWarning = 'None' WHERE IngredientID = 2;

-- Update the amount of an ingredient in a recipe (e.g., ingredient with ID 2 in recipe with ID 1 to '250 Grams'):
UPDATE RecipesIngredient SET Amount = '250' WHERE RecipeID = 1 AND IngredientID = 2;

-- Script to delete the recipe and its relations
CREATE PROCEDURE spDeleteRecipe
    @RecipeID INT
AS
BEGIN
    -- Delete related entries in child tables
    DELETE FROM RecipesIngredient WHERE RecipeID = @RecipeID;
    DELETE FROM RecipesHardware WHERE RecipeID = @RecipeID;
    DELETE FROM Instructions WHERE RecipeID = @RecipeID;
    DELETE FROM AlternativeRecipes WHERE RecipeID = @RecipeID;
    DELETE FROM AlternativeIngredients WHERE RecipeID = @RecipeID;
    DELETE FROM AlternativeRecipes WHERE AlternativeRecipesID = @RecipeID;

    -- delete the recipe
    DELETE FROM Recipes WHERE RecipeID = @RecipeID;
END;

-- After creating PROCEDURE you execute it to delete all the recipe and its relations
EXEC spDeleteRecipe 1;