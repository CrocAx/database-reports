-- Insert recipes
INSERT INTO Recipes(RecipeName, TotalCookingTime, Category, ImageURL) 
VALUES 
('Spaghetti Bolognese', 60, 'Italian', 'https://recipetineats.com/wp-content/uploads/2018/07/Spaghetti-Bolognese.jpg'),
('Lasagna', 120, 'Italian', 'https://thecozycook.com/wp-content/uploads/2022/04/Lasagna-Recipe-f.jpg'),
('Chicken Tikka Masala', 50, 'Indian', 'https://www.allrecipes.com/thmb/1ul-jdOz8H4b6BDrRcYOuNmJgt4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/239867chef-johns-chicken-tikka-masala-ddmfs-3X4-0572-e02a25f8c7b745459a9106e9eb13de10.jpg'),
('Cheeseburger', 30, 'American', 'https://s7d1.scene7.com/is/image/mcdonalds/Header_Cheeseburger_832x472:1-3-product-tile-desktop?wid=763&hei=472&dpr=off'),
('Blueberry pie', 40, 'Desert', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGHY57Thf29xbicszQ_qfgT_7xM9gbItGyIRgiHBrV0w&s'),
('Redberry pie', 40, 'Desert', 'https://thumbs.dreamstime.com/z/red-berry-pies-wooden-background-traditional-pie-tart-cake-pastry-food-selective-focus-conceptual-image-sweet-baking-79156332.jpg'),
('Vegetarian Spaghetti Bolognese', 60, 'Italian', 'https://biancazapatka.com/wp-content/uploads/2018/11/lentil-bolognese-with-spaghetti-vegan-easy-recipe.jpg'),
('Gluten-Free Blueberry Pie', 40, 'Desert', 'https://cupcakesandkalechips.com/wp-content/uploads/2021/07/Gluten-Free-Blueberry-Pie-H.jpeg');

-- Insert ingredients
INSERT INTO Ingredients(IngredientName, AllergyWarning) 
VALUES 
('Tomato', 'None'), 
('Spaghetti', 'Gluten'), 
('Ground Beef', 'None'), 
('Garlic', 'None'), 
('Cheese', 'Lactose'), 
('Lasagna Noodles', 'Gluten'), 
('Chicken', 'None'), 
('Spices', 'None'), 
('Rice', 'None'), 
('Bun', 'Gluten'), 
('Lettuce', 'None'), 
('Blueberries', 'None'), 
('Sugar', 'None'), 
('Pie Crust', 'Gluten'), 
('Redberries', 'None'),
('Lentils', 'None'),
('Gluten-Free Pie Crust', 'None');


-- Insert cooking hardware
INSERT INTO CookingHardware(HardwareName) 
VALUES 
('Pot'), 
('Frying pan'), 
('Oven'), 
('Baking Dish'),
('Grill'), 
('Spatula'), 
('Pie Dish');

-------------------------------------------------------------------
-- Insert recipe-ingredient relationships for the first recipe (Spaghetti bolognese)
INSERT INTO RecipesIngredient(RecipeID, IngredientID, Amount, Unit) 
VALUES 
(1, 1, '2', 'Cups'),
(1, 2, '200', 'Grams'),
(1, 3, '500', 'Grams'),
(1, 4, '3', 'Cloves'),
(1, 5, '100', 'Grams');

-- Insert recipe-ingredient relationships for the second recipe (Lasagna)
INSERT INTO RecipesIngredient(RecipeID, IngredientID, Amount, Unit) 
VALUES 
(2, 1, '3', 'Cups'),
(2, 3, '500', 'Grams'),
(2, 4, '3', 'Cloves'),
(2, 5, '200', 'Grams'),
(2, 6, '12', 'Pieces');

-- Insert recipe-ingredient relationships for the third recipe (Chicken Tikka Masala)
INSERT INTO RecipesIngredient(RecipeID, IngredientID, Amount, Unit) 
VALUES 
(3, 7, '500', 'Grams'),
(3, 4, '3', 'Cloves'),
(3, 8, '1', 'to taste'),
(3, 9, '2', 'Cups');

-- Insert recipe-ingredient relationships for the fourth recipe (Cheeseburger)
INSERT INTO RecipesIngredient(RecipeID, IngredientID, Amount, Unit) 
VALUES 
(4, 3, '150', 'Grams'),
(4, 5, '50', 'Grams'),
(4, 10, '1', 'Piece'),
(4, 11, '1', 'Piece'),
(4, 1, '1', 'Piece');

-- Insert recipe-ingredient relationships for the fifth recipe (Blueberry Pie)
INSERT INTO RecipesIngredient(RecipeID, IngredientID, Amount, Unit) 
VALUES 
(5, 12, '2', 'Cups'),
(5, 13, '1', 'Cup'),
(5, 14, '1', 'Piece');

-- Insert recipe-ingredient relationships for the sixth recipe (Redberry Pie)
INSERT INTO RecipesIngredient(RecipeID, IngredientID, Amount, Unit) 
VALUES 
(6, 15, '2', 'Cups'),
(6, 13, '1', 'Cup'),
(6, 14, '1', 'Piece');

-- Insert recipe-ingredient relationships for the seventh recipe (Vegetarian Spaghetti Bolognese)
INSERT INTO RecipesIngredient(RecipeID, IngredientID, Amount, Unit) 
VALUES 
(7, 1, '2', 'Cups'),
(7, 2, '200', 'Grams'),
(7, 16, '500', 'Grams'),
(7, 4, '3', 'Cloves'),
(7, 5, '100', 'Grams');

-- Insert recipe-ingredient relationships for the eight recipe (Gluten-Free Blueberry Pie)
INSERT INTO RecipesIngredient(RecipeID, IngredientID, Amount, Unit) 
VALUES 
(8, 17, '2', 'Cups'),
(8, 12, '2', 'Cups'),
(8, 13, '1', 'Cup');

--------------------------------------------------------------
-- Insert recipe-hardware relationships for the first recipe (Spaghetti bolognese)
INSERT INTO RecipesHardware(RecipeID, HardwareID) 
VALUES 
(1, 1), 
(1, 2);

-- Insert recipe-hardware relationships for the second recipe (Lasagna)
INSERT INTO RecipesHardware(RecipeID, HardwareID) 
VALUES 
(2, 3), 
(2, 4);

-- Insert recipe-hardware relationships for the third recipe (Chicken Tikka Masala)
INSERT INTO RecipesHardware(RecipeID, HardwareID) 
VALUES 
(3, 1), 
(3, 2);

-- Insert recipe-hardware relationships for the fourth recipe (Cheeseburger)
INSERT INTO RecipesHardware(RecipeID, HardwareID) 
VALUES 
(4, 5),
(4, 6);

-- Insert recipe-hardware relationships for the fifth recipe (Blueberry Pie)
INSERT INTO RecipesHardware(RecipeID, HardwareID) 
VALUES 
(5, 3),
(5, 7);

-- Insert recipe-hardware relationships for the sixth recipe (Redberry Pie)
INSERT INTO RecipesHardware(RecipeID, HardwareID) 
VALUES 
(6, 3),
(6, 7);

-- Insert recipe-hardware relationships for the seventh recipe (Vegetarian Spaghetti Bolognese)
INSERT INTO RecipesHardware(RecipeID, HardwareID) 
VALUES 
(7, 1), 
(7, 2);

-- Insert recipe-hardware relationships for the eight recipe (Gluten-Free Blueberry Pie)
INSERT INTO RecipesHardware(RecipeID, HardwareID) 
VALUES 
(8, 3),
(8, 7);
-------------------------------------------------------------------
-- Insert instructions for the first recipe (Spaghetti Bolognese)
INSERT INTO Instructions(RecipeID, StepNumber, StepDescription) 
VALUES 
(1, 1, 'Boil water in a pot.'),
(1, 2, 'Cook spaghetti in the boiling water.'),
(1, 3, 'Fry ground beef in a frying pan.'),
(1, 4, 'Add tomatoes and garlic to the frying pan.'),
(1, 5, 'Serve spaghetti with the sauce from the frying pan.');

-- Insert instructions for the second recipe (Lasagna)
INSERT INTO Instructions(RecipeID, StepNumber, StepDescription) 
VALUES 
(2, 1, 'Cook ground beef in a frying pan.'),
(2, 2, 'Add tomatoes, garlic, and cheese to the beef.'),
(2, 3, 'Layer the beef, cheese, and lasagna noodles in a baking dish.'),
(2, 4, 'Bake in the oven for 45 minutes.'),
(2, 5, 'Serve the lasagna hot.');

-- Insert instructions for the third recipe (Chicken Tikka Masala)
INSERT INTO Instructions(RecipeID, StepNumber, StepDescription) 
VALUES 
(3, 1, 'Fry chicken pieces in a frying pan.'),
(3, 2, 'Add tikka masala sauce to the pan.'),
(3, 3, 'Simmer until chicken is fully cooked.'),
(3, 4, 'Serve hot with rice.');

-- Insert instructions for the fourth recipe (Cheeseburger)
INSERT INTO Instructions(RecipeID, StepNumber, StepDescription) 
VALUES 
(4, 1, 'Grill the beef patties on a grill.'),
(4, 2, 'Flip the patties using a spatula until cooked to desired level.'),
(4, 3, 'Place cheese on the patties and let it melt.'),
(4, 4, 'Serve the patties in a bun with toppings of choice.');

-- Insert instructions for the fifth recipe (Blueberry Pie)
INSERT INTO Instructions(RecipeID, StepNumber, StepDescription) 
VALUES 
(5, 1, 'Mix blueberries, sugar, and flour for the filling.'),
(5, 2, 'Place the filling in a pie dish lined with pie dough.'),
(5, 3, 'Cover with another layer of pie dough.'),
(5, 4, 'Bake in the oven until golden brown.'),
(5, 5, 'Serve the pie warm.');

-- Insert instructions for the sixth recipe (Redberry Pie)
INSERT INTO Instructions(RecipeID, StepNumber, StepDescription) 
VALUES 
(6, 1, 'Mix redberry, sugar, and flour for the filling.'),
(6, 2, 'Place the filling in a pie dish lined with pie dough.'),
(6, 3, 'Cover with another layer of pie dough.'),
(6, 4, 'Bake in the oven until golden brown.'),
(6, 5, 'Serve the pie warm.');

-- Insert instructions for the seventh recipe (Vegetarian Spaghetti Bolognese)
INSERT INTO Instructions(RecipeID, StepNumber, StepDescription) 
VALUES 
(7, 1, 'Boil water in a pot.'),
(7, 2, 'Cook spaghetti in the boiling water.'),
(7, 3, 'Fry lentils in a frying pan.'),
(7, 4, 'Add tomatoes and garlic to the frying pan.'),
(7, 5, 'Serve spaghetti with the sauce from the frying pan.');

-- Insert instructions for the eighth recipe (Gluten-Free Blueberry Pie)
INSERT INTO Instructions(RecipeID, StepNumber, StepDescription) 
VALUES 
(8, 1, 'Mix blueberries, sugar, and flour for the filling.'),
(8, 2, 'Place the filling in a pie dish lined with gluten-free pie dough.'),
(8, 3, 'Cover with another layer of gluten-free pie dough.'),
(8, 4, 'Bake in the oven until golden brown.'),
(8, 5, 'Serve the pie warm.');
