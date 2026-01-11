Установка [lazydocker](https://github.com/jesseduffield/lazydocker#installation) на unix машину:

```
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
sudo ln -s "$HOME/.local/bin/lazydocker" /usr/local/bin/ld
```

Добавление user к использованию рутового docker
```
sudo usermod -aG docker deploy
```
