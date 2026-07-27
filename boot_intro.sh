#!/bin/bash

# Получаем путь к домашней директории текущего пользователя автоматически
USER_HOME=$HOME

# 1. Запуск сетевых утилит в фоне
nm-applet &

# Запускаем запрет в изолированном фоновом процессе
(cd "$USER_HOME/zapret-discord-youtube-linux" && ./service.sh) &

# Безопасно убиваем старый waybar, если он остался в системе
pkill waybar

# 2. Воспроизведение анимации и последующий запуск графики
# Сначала крутится видео, и ТОЛЬКО после его успешного закрытия запускаются обои и панель
mpv --fullscreen --ontop --no-osc --no-osd-bar "$USER_HOME/Videos/win11bootanimation.mp4" && {
    swaybg -i "$USER_HOME/Pictures/linux.png" -m fill &
    waybar &
}
