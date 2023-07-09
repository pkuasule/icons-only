#!/bin/bash

rm -rf ./icons-vue
cp -r ./icons-svg ./icons-svg2vue
cp ./scripts/svg2vue-batch.sh ./icons-svg2vue/svg2vue-batch.sh
cp ../scripts/make-index-txt.sh make-index-txt.sh
cd icons-svg2vue
bash svg2vue-batch.sh
bash make-index-txt.sh
rm make-index-txt.sh
rm svg2vue-batch.sh
cd ..
mv icons-svg2vue icons-vue