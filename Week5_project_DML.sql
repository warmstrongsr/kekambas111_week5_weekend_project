CREATE OR REPLACE PROCEDURE add_new_salesperson(
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(75),
  phone VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO salesperson (first_name, last_name, email, phone)
  	VALUES (first_name, last_name, email, phone);
END;
$$;

CALL add_new_salesperson ('Juvie', 'theGreat','4@gmail.com','8883838383');
CALL add_new_salesperson ('Olivia', 'Johnson','OJdid_it@yahoo.com','888-111-2340');
---------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE add_customer(
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(50),
  address VARCHAR(100),
  new_customer BOOLEAN
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(first_name, last_name, email, phone, address, new_customer)
  	VALUES (first_name, last_name, email, phone, address, new_customer);
END;
$$;

CALL add_customer('Tom', 'Ford','123-777-9090', 'tford@aol.com','123 South 10th st',TRUE);

INSERT INTO customer(first_name, last_name, phone, address, new_customer) 
VALUES ('Willie', 'Grayson', '318-450-5049','347 Abagail Lane',FALSE);

CALL add_customer('Sarah','Parker','123-555-9090','sparker_jane@gmail.com','n/a',FALSE);

INSERT INTO customer(first_name, last_name, phone, email, address, new_customer) 
VALUES ('Travez', 'Adams', '333-333-4444','twash2012@yahoo.com','201 Gayton St.',TRUE);

SELECT * FROM customer;
-----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE add_car_sale(
  year INT, 
  make VARCHAR(50), 
  model VARCHAR(20), 
  color VARCHAR(50), 
  price NUMERIC(8,2),
  service BOOLEAN,
  new_or_used VARCHAR(4),
  salesperson_id INT,
  customer_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car (year, make, model, color, price,service, new_or_used, salesperson_id, customer_id)
  	VALUES (year, make, model, color, price,service, new_or_used, salesperson_id, customer_id);
END;
$$;

CALL add_car_sale(2023, 'Toyota', 'Camry', 'Black', 25000.00,FALSE,'new',1,1);
CALL add_car_sale(2016, 'Buick', 'LeSabre', 'Burgundy', 12000.00,FALSE,'used',2,2);

-----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE serviced_vehicle(
  service BOOLEAN,
  year INT, 
  make VARCHAR(50), 
  model VARCHAR(20), 
  color VARCHAR(50),
  new_or_used VARCHAR(4),
  customer_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car (service, year, make, model, color, new_or_used, customer_id)
  	VALUES (service, year, make, model, color, new_or_used, customer_id);
END;
$$;
CALL serviced_vehicle(TRUE,2012, 'Toyaota', 'Tundra', 'Blue','used', 3);
CALL serviced_vehicle(TRUE,2019, 'Chevy', 'Impala', 'Gray','used', 4);

SELECT * FROM car;

-----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE add_service_ticket(
  description VARCHAR(150),
  solution VARCHAR(150),
  car_id INT,
  last_update TIMESTAMP
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO service_ticket (description, solution, car_id, last_update)
  VALUES (description, solution, car_id, last_update);
END;
$$;

CALL add_service_ticket('oil_change'::VARCHAR, 'changed'::VARCHAR, 3::INT, now()::TIMESTAMP);

INSERT INTO service_ticket (description, solution, car_id,last_update)
VALUES('alternator', 'replaced', 4, now());

SELECT * FROM service_ticket; 
-----------------------------------------------------------------

INSERT INTO mechanic (first_name, last_name, phone, expertise)
VALUES('Bob', 'Barker','123-654-3210','motor');

INSERT INTO mechanic (first_name, last_name, phone, email, expertise)
VALUES('Joel', 'Riser','123-875-9076','jrkingdom@yahoo.com','alternators');

INSERT INTO mechanic (first_name, last_name, phone, email, expertise)
VALUES('Markus', 'Yarbrough','123-456-3256','yarbroughm@aol.com','electical');

SELECT * FROM mechanic;

-----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE add_service_history(
  date TIMESTAMP, 
  description VARCHAR(150), 
  cost NUMERIC(6,2),
  car_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO service_history (date, description, cost, car_id)
  	VALUES (date, description, cost, car_id);
END;
$$;

CALL add_service_history('2022-12-17 ', 'oil_change', 50.90, 3);
CALL add_service_history('2023-03-19 ', 'alternator_repair', 450.00, 4);

SELECT * FROM service_history ;
-----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE add_maintenance(
  mechanic_id INT, 
  ticket_id INT,
  car_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO maintenance (mechanic_id, ticket_id, car_id)
    VALUES (mechanic_id, ticket_id, car_id);
END;
$$;

CALL add_maintenance(1, 1, 3);
CALL add_maintenance(2, 2, 4);

SELECT * FROM maintenance;
-----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE add_invoice(
  date TIMESTAMP, 
  amount NUMERIC(6,2),
  salesperson_id INT,
  customer_id INT,
  car_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO invoice (date, amount, salesperson_id, customer_id, car_id)
    VALUES (date, amount, salesperson_id, customer_id, car_id);
END;
$$;

CALL add_invoice('2022-11-23 ',25000.00, 1, 1, 1);
CALL add_invoice('2022-11-23 ',12000.00, 2, 2, 2);

SELECT *FROM invoice;