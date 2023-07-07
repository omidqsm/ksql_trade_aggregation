#!/bin/bash

/etc/confluent/docker/run &
cub connect-ready http://localhost 8083 60

curl --location 'http://localhost:8083/connectors' \
--header 'Content-Type: application/json' \
--data '{
    "name": "postgres_ohlc_day_sink",
    "config": {
        "connector.class":"io.confluent.connect.jdbc.JdbcSinkConnector",
        "connection.url":"jdbc:postgresql://postgres:5432/postgres",
        "connection.password":"pass",
        "connection.user":"user",
        "topics":"OHLC_DAY_EXT",
        "insert.mode":"upsert",
        "poll.interval.ms":1000,
        "table.name.format":"trade_daily",
        "auto.create":true,
        "key.ignore":true,
        "transforms":"RenameField",
        "transforms.RenameField.type":"org.apache.kafka.connect.transforms.ReplaceField$Value",
        "transforms.RenameField.renames":"sum_qty:quantity",
        "pk.mode":"record_value",
        "pk.fields":"symbol,date"
    }
}'

curl --location 'http://localhost:8083/connectors' \
--header 'Content-Type: application/json' \
--data '{
    "name": "postgres_ohlc_min_sink",
    "config": {
        "connector.class":"io.confluent.connect.jdbc.JdbcSinkConnector",
        "connection.url":"jdbc:postgresql://postgres:5432/postgres",
        "connection.password":"pass",
        "connection.user":"user",
        "topics":"OHLC_MIN_EXT",
        "insert.mode":"upsert",
        "poll.interval.ms":1000,
        "table.name.format":"trade_minutely",
        "auto.create":true,
        "key.ignore":true,
        "pk.mode":"record_value",
        "pk.fields":"symbol,date,time"
    }
}'

sleep infinity