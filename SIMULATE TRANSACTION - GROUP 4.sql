

INSERT INTO MsCustomer VALUES
('CU022','Ricardo','CI001','Male','Ricardo123@gmail.com','RicardoPassword123','2004-05-29')

INSERT INTO SalesHeader VALUES
('SA032','2023-06-15','SM002','CU022')

INSERT INTO SalesDetail VALUES
('SA032','AN001','7')





-- and staffs could purchase anime from studios --
INSERT INTO MsStaff VALUES
('SF021','Sheila','Female','Sheila123@gmail.com','SheilaPassword123','1996-10-28','CI001')

INSERT INTO PurchaseHeader VALUES
('PU026','SF021','SD005','2023-06-15')

INSERT INTO PurchaseDetail VALUES
('PU026','AN009')



INSERT INTO MsStaff VALUES
('SF022','Zara','Male','Zara123@gmail.com','ZaraPassword123','1995-02-05','CI004')

INSERT INTO PurchaseHeader VALUES
('PU027','SF022','SD002','2023-06-15')

INSERT INTO PurchaseDetail VALUES
('PU027','AN001')