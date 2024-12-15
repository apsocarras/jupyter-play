#!/bin/bash

## All games come from Steven Lambert. I may be adding the extra features he mentions in his overviews at some point!
urls=(
    "https://gist.github.com/straker/ff00b4b49669ad3dec890306d348adc4#file-snake-html"
    "https://gist.github.com/straker/81b59eecf70da93af396f963596dfdc5#file-pong-html"
    "https://gist.github.com/straker/3c98304f8a6a9174efd8292800891ea1#file-tetris-html"
    "https://gist.github.com/straker/82a4368849cbd441b05bd6a044f2b2d3#file-frogger-html"
    "https://gist.github.com/straker/afc4e2a30b6df772a5f9f6ef01751d41#file-missile-command-html"
    "https://gist.github.com/straker/2fddb507d4bb6bec54ea2fdb022d020c#file-sokoban-html"
    "https://gist.github.com/straker/b96a4a68bd6d79cf75a833d98a2b654f#file-doodle-jump-html"
    "https://gist.github.com/straker/afc5bedc7f4b4bc65ba8b05c435f6d32#file-puzzle-bobble-html"
    "https://gist.github.com/straker/0d25ae9d235f6a62f8287fd36a097043#file-helicopter-html"
    "https://gist.github.com/straker/769fb461e066147ea16ac2cb9463beae#file-bomberman-html"
    "https://gist.github.com/straker/98a2aed6a7686d26c04810f08bfaf66b#file-breakout-html"
)
for url in "${urls[@]}"; do
    file_name=$(echo $url | sed -E 's/.*#file-(.*)-html/\1/')
    
    if [ -f "raw_data/$file_name.html" ]; then
        echo "File 'raw_data/$file_name.html' already exists. Skipping download."
    else
        echo "Downloading $file_name..."
        curl "$url" -k -o "raw_data/$file_name.html"
    fi
done

zip ../src/jupyter_play/html_games.zip *.html 