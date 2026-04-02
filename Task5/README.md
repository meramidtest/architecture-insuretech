
Решение: перевод REST API сервиса client-info на graphql.

Вместо трех отдельных REST-эндпоинтов (`/clients/{id}`, `/clients/{id}/documents`, `/clients/{id}/relatives`) используется единый GraphQзапрос `client(id)`, где потребитель сам выбирает нужные поля.

Пример запроса - получить только имя клиента и номера документов:
```graphql
query {
  client(id: "123") {
    name
    documents {
      number
      type
    }
  }
}
```

Пример запроса - получить все данные клиента:
```graphql
query {
  client(id: "123") {
    id
    name
    age
    documents {
      id
      type
      number
      issueDate
      expiryDate
    }
    relatives {
      id
      relationType
      name
      age
    }
  }
}
```

Схема: [schema.graphql](schema.graphql)
