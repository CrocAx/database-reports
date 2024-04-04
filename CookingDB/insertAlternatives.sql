-- Insert alternative recipes
INSERT INTO AlternativeRecipes(RecipeID, AlternativeRecipesID) 
VALUES 
(1, 7),
(5, 8),
(5, 6),
(6, 5);

-- Insert alternative ingredients
INSERT INTO AlternativeIngredients(RecipeID, IngredientID, AlternativeIngredientID) 
VALUES 
(1, 3, 16),
(5, 14, 17),
(5, 12, 15),
(6, 15, 12);