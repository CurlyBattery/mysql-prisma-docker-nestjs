# Пример приложения по запуску mysql с prisma в докер контейнере

---

## Для запуска миграций: ##
```bash
$ docker-compose -f docker-compose.migrate.yaml up --abort-on-container-exit
```

## Для запуска приложения ##
```bash
$ docker-compose up
```