# FantasyRPG_SQLBackend
 This was the personal project for the SQL with Python course attended from 10/30/21-11/20/21, data included in the project is incomplete, and was used to test and practice skills learned in the course.
 
 **Description**: 
 
 This project is the theoretical back end for a Fantasy RPG game and includes the ER diagram as well as the SQL statements to create the entire SQL database for the game. I additionally set up a REST API endpoint on the characters database that allows for the following:
 
**Get** -> baseURL/characters 
  
  Returns all characters in the Database

**Post** -> baseURL/characters + JSON payload
  
  Creates a new characters with a name, race, class, and optionally a level (no level specified defaults to level 1).
    Example Payload:
            {
	          "name": "Mathias Thunderbeard",
	          "race": "dwarf",
	          "class": "cleric"
             }
**Get** -> baseURL/characters/characterName
  
  Returns all of the information on a specific character by the Primary Key which is Name.

**Put/Patch** -> baseURL/characters/characterName + JSON payload
  
  Updates existing characters name and/or level based on the JSON payload.
    Example URL: baseURL/characters/Mathias%20Thunderbeard
    Example Payload: 
            {
	          "name": "Mathias Thunderbrand",
	          "level": 10
            }
       
**Delete** -> baseURL/characters/characterName
  
  Removes specified character from the database
 
 
 In this project the following tools/packages were used:
  - Docker
  - Flask
  - VENV virtual environment
  - PostgreSQL
  - DrawIO
  - Insomnia
  
**Project Retrospective:**  
1. How did the project's design evolve over time?
  Over time there were changes to the original ER Diagram that were columns that I had overlooked before starting to code as well as some changes in inheritance that were made    to reduce any duplication of data that would have been needed. Specifically I had originally planned to tie a mob (generic monster that a player fights) directly into            abilities, when instead it made more sense to say that a mob has a specific class, for example a goblin sorcerer would be similar to a human sorcerer in that they are both       sorcerers and therefor both would be able to cast a basic Fire Bolt spell.

2. Did you choose to use an ORM or raw SQL? Why?
  When given the choice between the two, I chose to use ORM to build out the API because I already felt comfortable with SQL and since the whole purpose of this class is to        learn, I chose to go with the new concept to better understand it. That being said, I still used raw SQL queries to create, and add testing data to the database.

3. What future improvements are in store, if any?  
  I don't know that I will actually make any further improvements to this code, as it was never meant for production purposes. However I may go back and play with it some more      at a later date. There is definitely a lot that could still be done.
  

