<h3>This project is a simple example for aggregation stock market trades on daily and minutely basis.</h3>

Instructions:
- Create docker a required docked image for kafka connect: <code>docker build -t my-kafka-connect-image .</code>
- Start up services: <code>docker compose up -d</code>
- After about 1 minute, tables <b>"trade_daily"</b> and <b>"trade_minutely"</b> should start to be populated with records and upsert commands
