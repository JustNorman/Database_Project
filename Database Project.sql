CREATE TABLE [CHEF_CERT] (
  [CERT_ID] INT,
  [CERT_FEE] DECIMAL(10, 2), --DECIMAL(10,2) means you can have a decimal number with a maximal total precision of 10 digits. Two (2) of them after the decimal point and eight (8) before.
  [CERT_DATE_OFFER] DATE, --In SQL, datetime date data type is used for values that contain both date and time. Microsoft defines it as a date combined with a time of day with fractional seconds that is based on a 24-hour clock.
  PRIMARY KEY ([CERT_ID])
);

CREATE TABLE [CHEF] (
  [EMP_ID] INT,
  PRIMARY KEY ([EMP_ID])
);

--BRIDGE TABLE
CREATE TABLE [CHEF_CRED] (
  [EMP_ID] INT,
  [CERT_ID] INT,
  [EXAM_DATE] DATE,
  [CERT_EXP_DATE] DATE,
  PRIMARY KEY ([EMP_ID]),
  CONSTRAINT [FK_CHEF_CRED.CERT_ID]
    FOREIGN KEY ([CERT_ID])
      REFERENCES [CHEF_CERT]([CERT_FEE]),
  CONSTRAINT [FK_CHEF_CRED.CERT_ID]
    FOREIGN KEY ([CERT_ID])
      REFERENCES [CHEF]([SOUS_CHEF])
);

CREATE TABLE [VENDOR] (
  [VEND_ID] INT,
  [VEND_NAME] VARCHAR(255), --Varchar means character data that is varying. Also known as Variable Character, it is an indeterminate length string data type. It can hold numbers, letters and special characters
  [VEND_ADDRESS] VARCHAR(255),
  [VEND_PHONE] VARCHAR(0),
  PRIMARY KEY ([VEND_ID])
);

CREATE TABLE [MANAGER] (
  [EMP_ID] INT,
  PRIMARY KEY ([EMP_ID])
);

CREATE TABLE [PRODUCT] (
  [PROD_ID] INT,
  [PROD_NAME] VARCHAR(255),
  [PROD_PRICE] DECIMAL(10, 2),
  [HIST_PRICE] DECIMAL(10, 2),
  [SERV_SIZE] VARCHAR(20),
  [PROD_SUBCAT_ID] INT,
  PRIMARY KEY ([PROD_ID])
);

CREATE TABLE [PRICE_HISTORY] (
  [PROD_ID] INT,
  [START_DATE] DATE,
  [END_DATE] DATE,
  [PRICE] DECIMAL(10, 2),
  PRIMARY KEY ([PROD_ID]),
  CONSTRAINT [FK_PRICE_HISTORY.PROD_ID]
    FOREIGN KEY ([PROD_ID])
      REFERENCES [PRODUCT]([PROD_PRICE])
);

CREATE TABLE [CUSTOMER] (
  [CUST_ID] INT,
  [CUST_FNAME] VARCHAR(255),
  [CUST_LNAME] VARCHAR(255),
  [CUST_ADDRESS] VARCHAR(255),
  [CUST_PHONE] VARCHAR(20),
  PRIMARY KEY ([CUST_ID])
);

CREATE TABLE [EMPLOYEE] (
  [EMP_ID] INT,
  [SUP_ID] INT,
  [EMP_FNAME] VARCHAR(255),
  [EMP_LNAME] VARCHAR(255),
  [EMP_ADDRESS] VARCHAR(255),
  [EMP_PHONE] VARCHAR(20),
  [EMP_DOB] DATE,
  [EMP_TITLE] VARCHAR(255),
  [TYPE] VARCHAR(20),
  PRIMARY KEY ([EMP_ID]),
  CONSTRAINT [FK_EMPLOYEE.EMP_ID]
    FOREIGN KEY ([EMP_ID])
      REFERENCES [CUSTOMER]([CUST_ID])
);

CREATE TABLE [JOB_TITLE] (
  [EMP_TITLE] VARCHAR(255),
  [JOB_DESC] VARCHAR(255),
  [JOB_SALARY] DECIMAL(10, 2),
  PRIMARY KEY ([EMP_TITLE])
);

CREATE TABLE [PROD_SUBCATEGORY] (
  [PROD_SUBCAT_ID] INT,
  [PROD_SUBCAT_DESC] VARCHAR(255),
  [PROD_CAT_ID] INT,
  PRIMARY KEY ([PROD_SUBCAT_ID])
);

CREATE TABLE [PAYMENT] (
  [PYMT_ID] INT,
  [PYMT_METHOD] VARCHAR(50),
  PRIMARY KEY ([PYMT_ID])
);

CREATE TABLE [MEMBERSHIP] (
  [MEMB_ID] INT,
  [CUST_ID] INT,
  [MEMB_POINTS] INT,
  PRIMARY KEY ([MEMB_ID])
);

-- --William can you finish replacing the placeholders <type> with actual data types like I've done above please. I'll provide some notes of what certain data types means. Once you're done you cane delete the notes I've provide so it'll look less messy
-- --BRIDGE TABLE
CREATE TABLE [INVENTORY] (
  [INV_ID] INT,
  [PROD_ID] INT,
  [INV_QUANTITY] INT,
  [INV_SUBCAT_ID] INT,
  [VEND_ID] INT,
  PRIMARY KEY ([INV_ID]),
  CONSTRAINT [FK_INVENTORY.INV_QUANTITY]
    FOREIGN KEY ([INV_QUANTITY])
      REFERENCES [VENDOR]([VEND_NAME])
);

--BRIDGE TABLE
CREATE TABLE [ORDER] (
  [ORD_ID] INT,
  [CUST_ID] INT,
  [EMP_ID] INT,
  [PYMT_ID] INT,
  PRIMARY KEY ([ORD_ID]),
  CONSTRAINT [FK_ORDER.ORD_ID]
    FOREIGN KEY ([ORD_ID])
      REFERENCES [EMPLOYEE]([EMP_ID]),
  CONSTRAINT [FK_ORDER.ORD_ID]
    FOREIGN KEY ([ORD_ID])
      REFERENCES [PAYMENT]([PYMT_ID])
);

--BRIDGE TABLE
CREATE TABLE [EMPLYMENT_HISTORY] (
  [EMP_TITLE] VARCHAR(255),
  [START_DATE] DATE,
  [END_DATE] DATE,
  [SALARY] DECIMAL(10, 2),
  PRIMARY KEY ([EMP_TITLE]),
  CONSTRAINT [FK_EMPLYMENT_HISTORY.EMP_TITLE]
    FOREIGN KEY ([EMP_TITLE])
      REFERENCES [EMPLOYEE]([EMP_PHONE])
);

--BRIDGE TABLE
CREATE TABLE [CLOCK_IN] (
  [SHIFT_ID] INT,
  [EMP_NUM] INT,
  [START_TIME] TIME,
  [END_TIME] TIME,
  PRIMARY KEY ([SHIFT_ID], [EMP_NUM])
);

CREATE TABLE [SHIFT] (
  [SHIFT_ID] INT,
  [SHIFT_START] TIME,
  [SHIFT_END] TIME,
  [BREAK] INT,
  PRIMARY KEY ([SHIFT_ID]),
  CONSTRAINT [FK_SHIFT.SHIFT_START]
    FOREIGN KEY ([SHIFT_START])
      REFERENCES [CLOCK_IN]([EMP_NUM])
);

CREATE TABLE [INVENTORY_SUBCATEGORY] (
  [INV_SUBCAT_ID] INT,
  [INV_SUBCAT_DESC] VARCHAR(255),
  [INV_CAT_ID] INT,
  PRIMARY KEY ([INV_SUBCAT_ID])
);

CREATE TABLE [PROD_CATEGORY] (
  [PROD_CAT_ID] INT,
  [PROD_CAT_DESC] VARCHAR(255),
  PRIMARY KEY ([PROD_CAT_ID])
);

CREATE TABLE [SALRY] (
  [EMP_ID] INT,
  PRIMARY KEY ([EMP_ID])
);

CREATE TABLE [WAGE] (
  [EMP_ID] INT,
  PRIMARY KEY ([EMP_ID])
);

-- CREATE TABLE [MAN_CERT] (
--   [CERT_ID] <type>,
--   [CERT_FEE] <type>,
--   [CERT_DATE_OFFER] <type>,
--   PRIMARY KEY ([CERT_ID])
-- );


-- CREATE TABLE [MAN_CRED] (
--   [EMP_ID] <type>,
--   [CERT_ID] <type>,
--   [EXAM_DATE] <type>,
--   [CERT_EXP_DATE] <type>,
--   PRIMARY KEY ([EMP_ID]),
--   CONSTRAINT [FK_MAN_CRED.EXAM_DATE]
--     FOREIGN KEY ([EXAM_DATE])
--       REFERENCES [MAN_CERT]([CERT_FEE]),
--   CONSTRAINT [FK_MAN_CRED.EXAM_DATE]
--     FOREIGN KEY ([EXAM_DATE])
--       REFERENCES [MANAGER]([GEN_MAN])
-- );

-- CREATE TABLE [ORDER_DETAIL] (
--   [ORD_DET_ID] <type>,
--   [ORD_ID] <type>,
--   [PROD_ID] <type>,
--   [ORD_PRICE] <type>,
--   PRIMARY KEY ([ORD_DET_ID])
-- );

-- CREATE TABLE [INVENTORY_CATEGORY] (
--   [INV_CAT_ID] <type>,
--   [INV_CAT_DESC] <type>,
--   PRIMARY KEY ([INV_CAT_ID])
-- );

