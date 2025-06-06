#!/bin/bash

BACKUP_DIR="$HOME/Documents/git/backups/features"
BACKUP_SUBDIR="zsh"
BACKUP_FILE="$BACKUP_DIR/$BACKUP_SUBDIR/zsh_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Проверяем, что директория существует
if [ ! -d "$BACKUP_DIR/$BACKUP_SUBDIR" ]; then
    echo "Создаю директорию $BACKUP_DIR/$BACKUP_SUBDIR"
    mkdir -p "$BACKUP_DIR/$BACKUP_SUBDIR"
fi

# Проверяем существование нужных файлов и папок
echo "Создаю бэкап следующих файлов и папок (если есть):"
for file in ".zshrc" ".p10k.zsh" ".oh-my-zsh"; do
    if [ -e "$HOME/$file" ]; then
        echo "✅  $file"
    else
        echo "🚫  $file (нет)"
    fi
done

# Переходим в папку с git-репозиторием
cd "$BACKUP_DIR" || { echo "Не удалось перейти в $BACKUP_DIR"; exit 1; }
git pull

# Собираем архив
tar -czvf "$BACKUP_FILE" -C "$HOME" .zshrc .p10k.zsh .oh-my-zsh 2>/dev/null

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Архив успешно создан: $BACKUP_FILE"
    git add "$BACKUP_SUBDIR/"
    git commit -m "upd: $(basename $BACKUP_FILE)"
    git push
else
    echo ""
    echo "⚠️  При создании архива возникли ошибки. Проверьте наличие файлов и прав доступа."
fi
