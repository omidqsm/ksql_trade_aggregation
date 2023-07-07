create table trade_daily(
    id serial primary key,
    symbol varchar(10),
    date date,
    quantity int,
    open int,
    high int,
    low int,
    close int,
    unique(symbol, date)
);

create table trade_minutely(
    id serial primary key,
    symbol varchar(10),
    date date,
    time varchar(10),
    quantity int,
    open int,
    high int,
    low int,
    close int,
    unique(symbol, date, time)
);