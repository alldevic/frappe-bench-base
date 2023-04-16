# frappe-bench-base

## Инциализация

```
cp env.example .env
```

Правим .env файл (Prefix только строчными)

```
make up sh
./init.sh
```

При создании App поля оставляем дефолтными, остальное - неважно

## Запуск сервера

```
make start
```

Сайт будет доступен на http://localhost:8000
Администратор по-умолчанию - Administrator:admin

## Остановить все контейнеры

```
make down
```

## Доступ к контейнеру бэка

```
make sh
```
