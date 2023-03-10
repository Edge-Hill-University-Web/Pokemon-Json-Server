

<div style="display: flex; justify-content: left; align-items: center;"><img src="https://articles.pokebattler.com/wp-content/uploads/2018/08/pokedex-kanto-1.jpg" style="zoom: 10%"><h1 style="zoom: 110%; padding-left: 20px">A REST API Based Pokédex</h1> </div>

**About:** A REST based API serving as a Pokédex for PokémonGo using JSON Sever.



## **Requirements:** 

This project requires:

* Docker Desktop is installed on your machine

## Contents

* ``Dockerfile`` : Used to deploy the JSON server, expose port `80` and configure the **data** and **index** page.

  * ```dockerfile
    FROM clue/json-server
    EXPOSE 80
    ADD <URL_TO_JSON_DATA> /data/
    ADD <URL_TO_INDEX_PAGE> /data/public/
    ENTRYPOINT ["json-server", "/data/<filename>.json", "--port", "80"]
    ```

* ``index.html`` - Serves as an index page for the server.

* `routes.json` - Defines the routing of the REST API.

* ``data.json`` - PokémonGo data represented in JSON format: It contains a **list** of ``pokemon`` represented as objects with various attributes. 

  

   **See below for an example.** 

  ```json
  {
     "pokemon":[
        {
           "id":1,
           "num":"001",
           "name":"Bulbasaur",
           "img":"http://www.serebii.net/pokemongo/pokemon/001.png",
           "type":[
              "Grass",
              "Poison"
           ],
           "height":"0.71 m",
           "weight":"6.9 kg",
           "candy":"Bulbasaur Candy",
           "candy_count":25,
           "egg":"2 km",
           "spawn_chance":0.69,
           "avg_spawns":69,
           "spawn_time":"20:00",
           "multipliers":[
              1.58
           ],
           "weaknesses":[
              "Fire",
              "Ice",
              "Flying",
              "Psychic"
           ],
           "next_evolution":[
              {
                 "num":"002",
                 "name":"Ivysaur"
              },
              {
                 "num":"003",
                 "name":"Venusaur"
              }
           ]
        }
     ]
  }
  ```

  **Example: ** Bulbasuar  

  <div style="border: 1px solid #ccc!important; display: flex; justify-content: left; align-items: center;"><img src="http://www.serebii.net/pokemongo/pokemon/001.png"><p><b>Pokédex Entry</b>:  1,</br> <b>Name</b>: Bulbasaur,</br><b>Type</b>: Grass and Poison</p> </div>



## Build and Deployment

To **build** the **image**, ensure that docker is running and open up your terminal and run the following command:

```bash
docker build -t pokedex:json-server .
```

Then to **delpoy** the **container** run the following command:

```bash
docker run --name pokedex -p 80:80 pokedex:json-server 
```

Upon success you should see output in your terminal windows like this...

```text
  \{^_^}/ hi!

  Loading /data/db.json
  Done

  Resources
  http://localhost:80/pokemon

  Home
  http://localhost:80

  Type s + enter at any time to create a snapshot of the database
  Watching...
```





## HTTP Methods

The Pokédex supports the following HTTP Methods

 `GET`, `POST`, `PUSH`, `PATCH`,  `UPDATE` , `DELETE` and `OPTIONS` HTTP methods.



## Usage

The following showcases some of the functionality of the Pokédex.



### URL Queries

Some example of URL based queries include:



#### Full Text Search

**?q=**: Full text search

- **Any pokemon object that contains the following string `Mew`**: `http://localhost/pokemon?Mew` will return the pokemon Mew and Mewtwo.

  

- **Any pokemon object that contains the following string `Ice`** `http://localhost/pokemon?q=Ice` will return the who's type and weakness contain ICE.



#### Search an Attribute

**?`<attribute>`=** search for something in a specific attribute that is equal to the value

- **Search based on Id**: `http://localhost/pokemon?id=151` will return the pokemon Mew
- **Search based on Type**: `http://localhost/pokemon?Type=Bug` will return whos type is exclusively `Bug`



#### Contains

This can accept regular expressions too!

**?`<attribute>`_like** search: Used to search if a specific field contains a specific value

- **Search for Pokemon based on their type**: `http://localhost/pokemon?type_like=Ghost` will return all pokemon where their `type`contains `ghost`
- **Search for pokemon based on a weakness** : ``http://localhost/pokemon?weaknesses_like=Ghost``



#### Range

**?`<attribute>`_gte=**

- **Search for Pokemon based on their spawn chance of greater than or equal to 0.5**: `http://localhost/pokemon?spawn_chance_gte=0.5`

**?`<attribute>`_lte=**

- **Search for Pokemon based on their spawn chance of less than or equal to 0.1**: `http://localhost/pokemon?spawn_chance_lte=0.1`



#### Filtering 

You can use any combination of the above to filter your data using the concatination operator `&`.

- **Filter Pokemon based on an exclusive type `Bug`** and `spawn_chance` greater than or eqal to 3: `http://localhost/pokemon?type=Bug&spawn_chance_gte=3`

  

- **Filter Pokemon based on an non exclusive type `Physic`** and `spawn_chance` greater than or eqal to 3: `http://localhost/pokemon?type_like=Psychic&spawn_chance_gte=3`



## Built in Routes

The following routes (endpoints) are preconfigured in the `routes.json` file

- `/pokemon/` - 
  - Allows you to perform full text search on all fields within the database.

- `/pokemon/id/`**:id** -
  - Enables you to search for a Pokémon by their **id**
-  `/pokemon/name/`**:name** -> /pokemon?name=:name
  - Enables you to Find a pokemon based on their **name** 
-  `/pokemon/type/`**:type** -> /pokemon?type_like=:type
  - Enables you to Search for pokemon based on their **type** 



## Resources



JSON Sever Documentaion : JSON Server Documentation: [link](https://github.com/typicode/json-server)






