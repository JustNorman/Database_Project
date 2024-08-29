-- Insert data into CHEF_CERT table
INSERT INTO [CHEF_CERT] ([CERT_ID], [CERT_FEE], [CERT_DATE_OFFER])
VALUES
  (1, 100.00, '2023-01-15'), --Placeholders for the values to be inserted
  (2, 150.00, '2023-02-20'),
  (3, 120.00, '2023-03-10');

-- Insert data into CHEF table
INSERT INTO [CHEF] ([EMP_ID])
VALUES
  (101), --Placeholders for the values to be inserted
  (102),
  (103);

-- Insert data into CHEF_CRED table
INSERT INTO [CHEF_CRED] ([EMP_ID], [CERT_ID], [EXAM_DATE], [CERT_EXP_DATE])
VALUES
  (101, 1, '2023-01-01', '2025-01-01'), --Placeholders for the values to be inserted
  (102, 2, '2023-02-01', '2025-02-01'),
  (103, 3, '2023-03-01', '2025-03-01');

-- Insert data into MAN_CERT table
INSERT INTO [MAN_CERT] ([CERT_ID], [CERT_FEE], [CERT_DATE_OFFER])
VALUES
  (1, 200.00, '2023-01-15'), --Placeholders for the values to be inserted
  (2, 250.00, '2023-02-20'),
  (3, 300.00, '2023-03-25');

-- Insert data into MANAGER table
INSERT INTO [MANAGER] ([EMP_ID])
VALUES
  (1), -- Assuming EMP_ID 1 is a manager
  (3), -- Assuming EMP_ID 3 is another manager
  (5); -- Assuming EMP_ID 5 is yet another manager

--test