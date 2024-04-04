# DATABASE DESIGN PROJECT - FOOD RECIPES DATABASE

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

Scripts to create the database and define the tables is provided in the file [createDB.sql](createDB.sql). 

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



