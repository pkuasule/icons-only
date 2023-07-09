# Update Workflow
1. Update svg files in /icons-svg
2. Auto-update vue files
```bash
$ bash ./scripts/auto-update-vue.sh
```
or
```bash
$ rm -rf ./icons-vue
$ cp -r ./icons-svg ./icons-svg2vue
$ cp ./scripts/svg2vue-batch.sh ./icons-svg2vue/svg2vue-batch.sh
$ cd icons-svg2vue
$ bash svg2vue-batch.sh
$ cp ../scripts/make-index-txt.sh make-index-txt.sh
$ bash make-index-txt.sh
$ rm make-index-txt.sh
$ rm svg2vue-batch.sh
$ cd ..
$ mv icons-svg2vue icons-vue
```
3. Auto-update pdf files
```bash
$ bash ./scripts/auto-update-pdf.sh
```
or
```bash
$ rm -rf ./icons-pdf
$ cp -r ./icons-svg ./icons-svg2pdf
$ cp ./scripts/svg2pdf-batch.sh ./icons-svg2pdf/svg2pdf-batch.sh
$ cd icons-svg2pdf
$ bash svg2pdf-batch.sh
$ cp ../scripts/make-index-txt.sh make-index-txt.sh
$ bash make-index-txt.sh
$ rm make-index-txt.sh
$ rm svg2pdf-batch.sh
$ cd ..
$ mv icons-svg2pdf icons-pdf
```

4. Move the content of icons-vue into /slidev-theme-xxx/components/icons

5. Add all, commit, then push.