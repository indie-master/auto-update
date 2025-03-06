#Скрипт для автоматического обновления системы на VPS
Этот скрипт автоматически обновляет пакеты на вашем сервере, удаляет ненужные зависимости и перезагружает систему при необходимости. Он настроен для работы с Ubuntu и Debian.

##Оглавление
Требования

Установка

Настройка cron

Проверка работы

Логирование

Лицензия

Требования
Сервер на базе Ubuntu или Debian.

Доступ к терминалу с правами root или пользователя с правами sudo.

Установка
Подключитесь к серверу:
Используйте SSH для подключения к вашему VPS:

bash
Copy
ssh user@your_server_ip
Скачайте скрипт:
Склонируйте репозиторий или загрузите скрипт вручную:

bash
Copy
wget https://raw.githubusercontent.com/ваш-репозиторий/ваш-проект/main/auto-update.sh
Переместите скрипт в /usr/local/bin:

bash
Copy
sudo mv auto-update.sh /usr/local/bin/auto-update.sh
Сделайте скрипт исполняемым:

bash
Copy
sudo chmod +x /usr/local/bin/auto-update.sh
Настройка cron
Откройте crontab для редактирования:

bash
Copy
sudo crontab -e
Добавьте задачу:
Вставьте строку для выполнения скрипта, например, каждые 14 дней в полночь:

bash
Copy
0 0 */14 * * /usr/local/bin/auto-update.sh
Сохраните и закройте файл:

В nano: Ctrl + O, затем Enter, и Ctrl + X.

В vim: Esc, затем :wq и Enter.

Проверка работы
Запустите скрипт вручную:

bash
Copy
sudo /usr/local/bin/auto-update.sh
Проверьте логи:
Откройте лог в реальном времени:

bash
Copy
tail -f /var/log/auto-update.log
Вы должны увидеть что-то вроде:

Copy
Starting system update...
Packages are available for upgrade. Proceeding with upgrade...
System update completed. Waiting for 5 minutes before checking for reboot...
Проверьте перезагрузку:
Через 5 минут система должна перезагрузиться, если это необходимо.

Логирование
Логи скрипта сохраняются в файл /var/log/auto-update.log. Вы можете просматривать их с помощью команды:

bash
Copy
cat /var/log/auto-update.log
Лицензия
Этот проект распространяется под лицензией MIT.

Автор
@indie_master

GitHub: ваш-профиль

Email: indiemaster98@gmail.com

Благодарности
Спасибо сообществу за вдохновение и поддержку!
