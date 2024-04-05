# DATABASE DESIGN PROJECT - FOOD RECIPES DATABASE

## Abstract

The project is about designing a database for storing information about food recipes. The database is designed to store information about recipes, ingredients, cooking hardware, instructions, alternative recipes, and alternative ingredients. The database is implemented using Microsoft SQL Server Management Studio. The database is populated with sample data and queries are developed to demonstrate the data retrieval capabilities of the database.

## Table of contents

- [Phase 1: Planning and Design](#phase-1-planning-and-design)
  - [Description of the database](#description-of-the-database)
  - [Scope](#scope)
  - [Designed database ER diagram](#designed-database-er-diagram)
- [Phase 2: Database Implementation](#phase-2-database-implementation)
- [Phase 3: Data insertion and query development](#phase-3-data-insertion-and-query-development)
  - [Queries](#queries)
- [Phase 4: Final Database Design](#phase-4-final-database-design)
    - [Conclusion](#conclusion)

## Phase 1: Planning and Design

### Description of the database

The database is designed to store information about food recipes. The database has the following tables:

- Recipes
- Ingredients
- CookingHardware
- RecipesIngredients
- Instructions
- RecipesHardware
- AlternativeRecipes
- AlternativeIngredients

### Scope

The scope of the database is to store information about recipes, ingredients, cooking hardware, instructions, alternative recipes, and alternative ingredients. The database will be used by users who want to add, update and remove recipes. User will be able to search for recipes based on the available ingredients.

Application side will allow users to add new recipes by following steps:
- Define ingredients and total amount needed
- Define cooking hardware
- Define instructions
- Define additional information
    - Image of the final product
    - Food allergy warnings

### Designed database ER diagram

![ER Diagram](images/FirstPhaseER.png)

> Note: This ER diagram is only for the first phase of the project. The final ER diagram is updated in the last phase.


## Phase 2: Database Implementation

In this phase the database is created and tables are created. The database is implemented using Microsoft SQL Server Management Studio.

Scripts to create the database and define the tables is provided in the file [createDB.sql](#createdbsql). 

Junction tables used in the database are:
 - RecipesIngredient
 - RecipesHardware
 - AlternativeRecipes
 - AlternativeIngredients

Foreign keys are used to maintain the relationship between tables. Junction tables are used to maintain many-to-many relationships between tables.

The foreign keys for the junction tables are defined as follows:
- RecipesIngredient.RecipeID -> Recipes.RecipeID
- RecipesIngredient.IngredientID -> Ingredients.IngredientID
- RecipesHardware.RecipeID -> Recipes.RecipeID
- RecipesHardware.HardwareID -> CookingHardware.HardwareID
- AlternativeRecipes.RecipeID -> Recipes.RecipeID
- AlternativeRecipes.AlternativeRecipeID -> Recipes.RecipeID
- AlternativeIngredients.IngredientID -> Ingredients.IngredientID
- AlternativeIngredients.AlternativeIngredientID -> Ingredients.IngredientID

Other foreign key constraints are defined as follows:
- Instructions.RecipeID -> Recipes.RecipeID
- Ingredients.IngredientID -> RecipesIngredient.IngredientID
- CookingHardware.HardwareID -> RecipesHardware.HardwareID

## Phase 3: Data insertion and query development

In this phase, databas is populated with sample data to work with queries that are developed to demonstrate the data retrieval capabilities of the database.

The sample data can be inserted by using file [insertDATA.sql](#insertdatasql). After inserting this, you can insert the alternative data required for this project. You can do that by using the file [insertAlternatives.sql](#insertalternativessql).

The data is inserted in the following tables:
- From insertDATA.sql
    - Recipes
    - Ingredients
    - CookingHardware
    - RecipesIngredient
    - RecipesHardware
    - Instructions
- From insertAlternatives.sql
    - AlternativeRecipes
    - AlternativeIngredients

There are stored sample data of 8 recipes. For all of those recipes there are required ingredients, cooking hardware, instructions, alternative recipes and alternative ingredients.

### Queries

The queries that are developed to the data retrieval capabilities of the database can be found in this file [SQL_Queries.sql](#sql_queriessql).

Those queries include selecting, updating and deleting data. There is also stored procedure script that is used to retrieve all the recipe data based on the recipe id.

```sql
EXEC GetRecipeDetails @RecipeID = 5; -- specify recipeID (Check for the recipeID with SELECT * FROM Recipes;)
```

> Note! This script only works after creating the stored procedured that is in the file [SQL_Queries.sql](#sql_queriessql)

There is also another stored procedure that is used to delete the recipe and all its relations on the database.

```sql
EXEC spDeleteRecipe 1; -- specify recipeID (Check for the recipeID before deleting)
```

> Note! This script also works only after creating the stored procedured that is in the file [SQL_Queries.sql](#sql_queriessql).

## Phase 4: Final Database Design

In this phase, the final database structure is made. The final ER diagram is updated and the database is updated to reflect the final design.

The final database is implemented using **Microsoft SQL Server Management Studio**.

The final ER diagram of the database project:
![Final ER Diagram](images/FinalER.png)

All the data insertion and queries are provided in the following files:
- [createDB.sql](#createdbsql) - Create the database and tables
- [insertDATA.sql](#insertdatasql) - Insert sample data
- [insertAlternatives.sql](#insertalternativessql) - Insert alternative sample data
- [SQL_Queries.sql](#sql_queriessql) - Queries and stored procedures

### Conclusion

The database is designed with functionalities to store and provide the information about the food recipes. The database is created and developed using Microsoft SQL Server Management Studio. The database is populated with sample data and queries that are developed to demonstrate the data retrieval capabilities of the database.

The descision to use this database design looked most appropriate because of the many-to-many relationships between the tables. The database is designed to be used by users who want to add, update and remove recipes. Since there is a lot of data that is used in many other recipes it makes the database more flexibe and easy to scale.

The biggest challenge was to think of the queries and develop them so the database can be implemented in external applications. The queries are developed in that way that data is availabe for easier use. The stored procedures are also developed to make the data retrieval easier, this makes it so you are not required to write 5-6 queries to get the data you need.




---

## **createDB.sql**
```sql
CREATE DATABASE CookingDB;

USE CookingDB;

CREATE TABLE Recipes(
	RecipeID INT IDENTITY(1,1) PRIMARY KEY,
	RecipeName VARCHAR(255),
	TotalCookingTime INT,
	Category VARCHAR(255),
	ImageURL VARCHAR(255)
);

CREATE TABLE Ingredients(
	IngredientID INT IDENTITY(1,1) PRIMARY KEY,
	IngredientName VARCHAR(255),
	AllergyWarning VARCHAR (255),
);

CREATE TABLE CookingHardware(
	HardwareID INT IDENTITY(1,1) PRIMARY KEY,
	HardwareName VARCHAR(255)
);

CREATE TABLE RecipesHardware(
	RecipeID INT FOREIGN KEY REFERENCES Recipes(RecipeID),
	HardwareID INT FOREIGN KEY REFERENCES CookingHardware(HardwareID),
	PRIMARY KEY (RecipeID, HardwareID)
);


CREATE TABLE RecipesIngredient(
	RecipeID INT FOREIGN KEY REFERENCES Recipes(RecipeID),
	IngredientID INT FOREIGN KEY REFERENCES Ingredients(IngredientID),
	Amount VARCHAR(255) NOT NULL,
	Unit VARCHAR (255) NOT NULL,
	PRIMARY KEY (RecipeID, IngredientID)
);

CREATE TABLE Instructions(
	InstructionID INT IDENTITY(1,1) PRIMARY KEY,
	RecipeID INT FOREIGN KEY REFERENCES Recipes(RecipeID),
	StepNumber INT,
	StepDescription TEXT
);

CREATE TABLE AlternativeRecipes(
	RecipeID INT FOREIGN KEY REFERENCES Recipes(RecipeID),
	AlternativeRecipesID INT FOREIGN KEY REFERENCES Recipes(RecipeID)
	PRIMARY KEY (RecipeID, AlternativeRecipesID)
);

CREATE TABLE AlternativeIngredients(
	RecipeID INT FOREIGN KEY REFERENCES Recipes(RecipeID),
	IngredientID INT FOREIGN KEY REFERENCES Ingredients(IngredientID),
	AlternativeIngredientID INT FOREIGN KEY REFERENCES Ingredients(IngredientID)
	PRIMARY KEY (RecipeID, IngredientID, AlternativeIngredientID)
);
```
---
## **insertDATA.sql**
```sql
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
```
---
## **insertAlternatives.sql**
```sql
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
```

## **SQL_Queries.sql**
```sql
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

	-- Selects ingredients, amount, unit, and allergy warnings for specified recipeID
    SELECT i.IngredientName, ri.Amount, ri.Unit, i.AllergyWarning 
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
```

