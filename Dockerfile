FROM clue/json-server
EXPOSE 80
ADD https://raw.githubusercontent.com/Edge-Hill-Univeristy-Web/Pokemon-Json-Server/main/pokemon.json /data/
ADD https://raw.githubusercontent.com/Edge-Hill-Univeristy-Web/Pokemon-Json-Server/main/routes.json /data/routes/
ADD https://raw.githubusercontent.com/Edge-Hill-Univeristy-Web/Pokemon-Json-Server/main/index.html /data/public/
ADD https://raw.githubusercontent.com/Edge-Hill-Univeristy-Web/Pokemon-Json-Server/main/main.js /data/public/
ADD https://raw.githubusercontent.com/Edge-Hill-Univeristy-Web/Pokemon-Json-Server/main/style.css data/public/
ENTRYPOINT ["json-server", "-w", "/data/pokemon.json", "--routes", "/data/routes/routes.json","--port", "80"]