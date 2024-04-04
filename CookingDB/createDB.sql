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

