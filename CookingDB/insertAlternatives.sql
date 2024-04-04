-- Insert alternative recipes
INSERT INTO AlternativeRecipes(RecipeID, AlternativeRecipesID) 
VALUES 
(1, 7),
(5, 8);

-- Insert alternative ingredients
INSERT INTO AlternativeIngredients(RecipeID, IngredientID, AlternativeIngredientID) 
VALUES 
(1, 3, 16),
(5, 14, 17);