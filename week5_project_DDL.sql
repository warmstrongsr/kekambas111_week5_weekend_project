--car DEALERSHIP WEEK 5 weekend project.

CREATE TABLE salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(75),
  phone VARCHAR(20)
);

CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(50) NULL,
  address VARCHAR(100) NULL,
  new_customer BOOLEAN
);

CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  make VARCHAR(50) NOT NULL,
  model VARCHAR(20) NOT NULL,
  color VARCHAR(50) NOT NULL,
  new_or_used VARCHAR(10) NULL,
  price NUMERIC(10,2) NULL,
  service BOOLEAN NULL,
  salesperson_id INT NULL,
  customer_id INT NULL,
  FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


CREATE TABLE service_ticket (
  ticket_id SERIAL PRIMARY KEY,
  description VARCHAR(150) NOT NULL,
  solution VARCHAR(150),
  last_update TIMESTAMP NOT NULL DEFAULT NOW(),
  car_id INT NOT NULL,
  FOREIGN KEY(car_id) REFERENCES car(car_id)
);


CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(100),
  expertise VARCHAR(100)
);

CREATE TABLE service_history (
  service_history_id SERIAL PRIMARY KEY,
  date TIMESTAMP NOT NULL,
  description VARCHAR(150) NOT NULL,
  cost NUMERIC(6,2) NOT NULL,
  car_id INT NOT NULL,
  FOREIGN KEY(car_id) REFERENCES car(car_id)
);

CREATE TABLE maintenance (
    maintenance_id SERIAL PRIMARY KEY,
    mechanic_id INT NOT NULL,
    ticket_id INT NOT NULL,
    car_id INT NOT NULL,
    assigned_date TIMESTAMP NOT NULL DEFAULT NOW(),
    completed_date TIMESTAMP,
    FOREIGN KEY(mechanic_id) REFERENCES mechanic (mechanic_id),
    FOREIGN KEY(ticket_id) REFERENCES service_ticket(ticket_id),
    FOREIGN KEY(car_id) REFERENCES car (car_id)
);

CREATE TABLE invoice (
  invoice_id SERIAL PRIMARY KEY,
  date TIMESTAMP NOT NULL,
  amount NUMERIC(10,2) NOT NULL,
  salesperson_id INT NOT NULL,
  customer_id INT NOT NULL,
  car_id INT NOT NULL,
  FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY(car_id) REFERENCES car(car_id)
);


