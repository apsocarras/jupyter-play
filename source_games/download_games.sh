#!/bin/bash

script_dir=$(dirname "$(realpath "$0")")
par_dir=$(dirname "$script_dir")

## All games come from Steven Lambert. I may be adding the extra features he mentions in his overviews at some point!
urls=(
    "https://gist.githubusercontent.com/straker/ff00b4b49669ad3dec890306d348adc4/raw/315d16d17bca6920cd1ae9192dca647ccb3e0d5d/snake.html"
    "https://gist.githubusercontent.com/straker/81b59eecf70da93af396f963596dfdc5/raw/a54a0d874ea87ef07ac5b76d032868a3a702c4b6/pong.html"
    "https://gist.githubusercontent.com/straker/3c98304f8a6a9174efd8292800891ea1/raw/e9b66fcd426978276b19318b1c5df5c4270220e3/tetris.html"
    "https://gist.githubusercontent.com/straker/82a4368849cbd441b05bd6a044f2b2d3/raw/4515c66f6b5d98b1e7a10a87632957d7c40a559c/frogger.html"
    "https://gist.githubusercontent.com/straker/afc4e2a30b6df772a5f9f6ef01751d41/raw/3759888bb43036975f32e5c034162c1bed0b4746/missile-command.html"
    "https://gist.githubusercontent.com/straker/2fddb507d4bb6bec54ea2fdb022d020c/raw/a10532dce3d1590b8e3c494648b9978c5d724bf8/sokoban.html"
    "https://gist.githubusercontent.com/straker/b96a4a68bd6d79cf75a833d98a2b654f/raw/8b5212708d8993dbc79e36951d0ead27a09f3485/doodle-jump.html"
    "https://gist.githubusercontent.com/straker/afc5bedc7f4b4bc65ba8b05c435f6d32/raw/b29e165aa7ce56b5a8ed741a4ae5199a970db148/puzzle-bobble.html"
    "https://gist.githubusercontent.com/straker/0d25ae9d235f6a62f8287fd36a097043/raw/3e69a2e87014de4e78ce831adf30e6faf7cee2fb/helicopter.html"
    "https://gist.githubusercontent.com/straker/769fb461e066147ea16ac2cb9463beae/raw/69c6ac1e80d48983c26a2135b50489850d7ca175/bomberman.html"
    "https://gist.githubusercontent.com/straker/98a2aed6a7686d26c04810f08bfaf66b/raw/b719c921ab8eec8cf255734f8cf43f12fddfb098/breakout.html"
)
for url in "${urls[@]}"; do
    file_name=$(echo $url | sed -E 's#.*/([a-zA-Z0-9_-]+)\.html$#\1#')
    file_path="$script_dir/$file_name.html"
    
    if [ -f "$file_path" ]; then
        echo "File '$file_path' already exists. Skipping download."
    else
        echo "Downloading $file_name..."
        curl "$url" -k -o "$file_path"
    fi
done

# Create a zip file without retaining directory paths
cd "$script_dir"
zip -j html_games.zip ./*.html

# Move the zip file to the target directory
mv html_games.zip "$par_dir/src/jupyter_play/"