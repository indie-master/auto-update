#!/bin/bash

# Очистка лога
echo "" > /var/log/auto-update.log

# Обновление системы
echo "Starting system update..." >> /var/log/auto-update.log
apt-get update >> /var/log/auto-update.log 2>&1

# Проверка, есть ли пакеты для обновления
if apt list --upgradable 2>/dev/null | grep -q "upgradable"; then
    echo "Packages are available for upgrade. Proceeding with upgrade..." >> /var/log/auto-update.log
    apt-get dist-upgrade -y >> /var/log/auto-update.log 2>&1
    apt-get autoremove -y >> /var/log/auto-update.log 2>&1
else
    echo "No packages to upgrade." >> /var/log/auto-update.log
fi

# Задержка перед перезагрузкой
echo "System update completed. Waiting for 5 minutes before checking for reboot..." >> /var/log/auto-update.log
sleep 300

# Проверка необходимости перезагрузки
if [ -f /var/run/reboot-required ]; then
    echo "Reboot required. Rebooting now..." >> /var/log/auto-update.log
    reboot
else
    echo "No reboot required. Exiting..." >> /var/log/auto-update.log
fi
