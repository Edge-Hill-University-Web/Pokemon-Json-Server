FROM clue/json-server
EXPOSE 80
ADD https://raw.githubusercontent.com/Edge-Hill-Univeristy-Web/Pokemon-Json-Server/main/pokemon.json /data/
ENTRYPOINT ["json-server", "/data/pokemon.json", "--port", "80"]