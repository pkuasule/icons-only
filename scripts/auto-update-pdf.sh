#!/bin/bash

cp -r ./icons-svg ./icons-svg2pdf
cp ./scripts/svg2pdf-batch.sh ./icons-svg2pdf/svg2pdf-batch.sh
cd icons-svg2pdf
bash svg2pdf-batch.sh
cp ../scripts/make-index-txt.sh make-index-txt.sh
bash make-index-txt.sh
rm make-index-txt.sh
rm svg2pdf-batch.sh
cd ..
mv icons-svg2pdf icons-pdf