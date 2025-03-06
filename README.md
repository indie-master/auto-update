# Скрипт для автоматического обновления системы на VPS
Этот скрипт автоматически обновляет пакеты на вашем сервере, удаляет ненужные зависимости и перезагружает систему при необходимости. Он настроен для работы с Ubuntu и Debian.

## Оглавление
1. Требования
2. Установка
3. Настройка cron
4. Проверка работы
5. Логирование
6. Лицензия

## Требования
* Сервер на базе Ubuntu или Debian.
* Доступ к терминалу с правами root или пользователя с правами sudo.

## Установка
### 1. Подключитесь к серверу.
Используйте SSH для подключения к вашему VPS:
```
ssh user@your_server_ip
```
### 2. Скачайте скрипт.
Склонируйте репозиторий или загрузите скрипт вручную:
```
wget https://raw.githubusercontent.com/indie-master/auto-update/refs/heads/main/auto-update.sh
```
### 3. Переместите скрипт в ```/usr/local/bin```:
```
sudo mv auto-update.sh /usr/local/bin/auto-update.sh
```
### 4. Сделайте скрипт исполняемым:
```
sudo chmod +x /usr/local/bin/auto-update.sh
```
## Настройка cron
### 1. Откройте crontab для редактирования:
```
sudo crontab -e
```
### 2. Добавьте задачу:
Вставьте строку для выполнения скрипта, например, каждые 14 дней в полночь:
```
0 0 */14 * * /usr/local/bin/auto-update.sh
```
### 3. Сохраните и закройте файл:
* В ```nano```: ```Ctrl + O```, затем ```Enter```, и ```Ctrl + X```.
* В ```vim```: ```Esc```, затем ```:wq``` и ```Enter```.
## Проверка работы
### 1. Запустите скрипт вручную:
```
sudo /usr/local/bin/auto-update.sh
```
### 2. Проверьте логи:
Откройте лог в реальном времени:
```
tail -f /var/log/auto-update.log
```
Вы должны увидеть что-то вроде:
```
Starting system update...
Packages are available for upgrade. Proceeding with upgrade...
System update completed. Waiting for 5 minutes before checking for reboot...
```
### 3. Проверьте перезагрузку:
Через 5 минут система должна перезагрузиться, если это необходимо.

## Логирование
Логи скрипта сохраняются в файл ```/var/log/auto-update.log```. Вы можете просматривать их с помощью команды:
```
cat /var/log/auto-update.log
```
## Лицензия
Этот проект распространяется под лицензией [MIT](https://opensource.org/license/mit).

## Автор
* [@indie_master](https://t.me/indie_master)

* GitHub: [indie-master](https://github.com/indie-master)

* Email: indiemaster98@gmail.com

## Благодарности
* Спасибо сообществу за вдохновение и поддержку!
