this project is a simple example for aggregation stock market trades on daily and minutely basis.

instructions:
- create docker a required docked image for kafka connect: docker build -t my-kafka-connect-image .
- start up services: 'docker compose up -d'
- after about 1 minute, tables "trade_daily" and "trade_minutely" should start to be populated with records and upsert commands