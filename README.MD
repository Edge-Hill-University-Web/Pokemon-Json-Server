

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

* ``data.json`` - PokémonGo data represented in JSON format: It contains a **list** of ``pokemon`` represented as objects See below for an example. 

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

  **Example:** 

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



## Usage

Some example of queries include...

​	



**<field>_like** search: Used to search if a specific field contains a specific value

- **Search for Pokemon based on their type**: `http://localhost/pokemon?type_like=Ghost` will return all pokemon where their `type`contains `ghost`
- **Search for pokemon based on a weakness** : ``http://localhost/pokemon?weaknesses_like=Ghost``
