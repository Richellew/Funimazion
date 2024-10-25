
INSERT INTO MsCity (CityID, CityName)
VALUES ('CI001', 'Jakarta'),
       ('CI002', 'Surabaya'),
       ('CI003', 'Bandung'),
       ('CI004', 'Medan'),
       ('CI005', 'Semarang'),
       ('CI006', 'Makassar'),
       ('CI007', 'Palembang'),
       ('CI008', 'Depok'),
       ('CI009', 'Tangerang'),
       ('CI010', 'Batam');


INSERT INTO MsStaff (StaffID, StaffName, StaffGender, StaffEmail, StaffPassword, StaffDOB, CityID)
VALUES 
  ('SF001', 'John Doe', 'Male', 'john.doe@example.com', 'Pa$$w0rd', '1991-05-15', 'CI001'),
  ('SF002', 'Jane Smith', 'Female', 'jane.smith@example.com', 'Password', '1992-02-20', 'CI002'),
  ('SF003', 'Mike Johnson', 'Male', 'mike.johnson@example.com', 'Secure1', '1991-09-12', 'CI003'),
  ('SF004', 'Lisa Anderson', 'Female', 'lisa.anderson@example.com', 'Secret', '1993-11-05', 'CI004'),
  ('SF005', 'David Brown', 'Male', 'david.brown@example.com', 'Confidential', '1990-07-28', 'CI005'),
  ('SF006', 'Sarah Davis', 'Female', 'sarah.davis@example.com', 'Protected', '1992-06-14', 'CI006'),
  ('SF007', 'Mark Wilson', 'Male', 'mark.wilson@example.com', 'Private1', '1991-03-19', 'CI007'),
  ('SF008', 'Emily Taylor', 'Female', 'emily.taylor@example.com', 'Secret123', '1992-10-25', 'CI008'),
  ('SF009', 'Chris Miller', 'Male', 'chris.miller@example.com', 'Hidden', '1993-09-01', 'CI009'),
  ('SF010', 'Jessica Clark', 'Female', 'jessica.clark@example.com', 'Protected123', '1990-12-08', 'CI010'),
  ('SF011', 'Ryan White', 'Male', 'ryan.white@example.com', 'Pa$$w0rd123', '1991-08-17', 'CI001'),
  ('SF012', 'Amanda Green', 'Female', 'amanda.green@example.com', 'SecretPass', '1992-05-21', 'CI002'),
  ('SF013', 'Matthew Martinez', 'Male', 'matthew.martinez@example.com', 'Protected1', '1991-02-28', 'CI003'),
  ('SF014', 'Stephanie Turner', 'Female', 'stephanie.turner@example.com', 'SecurePass', '1993-10-11', 'CI004'),
  ('SF015', 'Daniel Walker', 'Male', 'daniel.walker@example.com', 'Confidential1', '1990-06-24', 'CI005'),
  ('SF016', 'Rachel Hill', 'Female', 'rachel.hill@example.com', 'Secret1234', '1992-05-30', 'CI006'),
  ('SF017', 'Justin Young', 'Male', 'justin.young@example.com', 'PrivatePass', '1991-01-25', 'CI007'),
  ('SF018', 'Olivia Bennett', 'Female', 'olivia.bennett@example.com', 'Secret456', '1992-09-04', 'CI008'),
  ('SF019', 'Brandon Collins', 'Male', 'brandon.collins@example.com', 'Hidden123', '1993-08-11', 'CI009'),
  ('SF020', 'Hannah Reed', 'Female', 'hannah.reed@example.com', 'Protected456', '1990-11-14', 'CI010');


  INSERT INTO MsStudio (StudioID, StudioName, CityID)
VALUES
  ('SD001', 'Studio Bang', 'CI001'),
  ('SD002', 'Studio TopG', 'CI002'),
  ('SD003', 'Big Studio', 'CI003'),
  ('SD004', 'Studio Star Rail', 'CI004'),
  ('SD005', 'Small Studio', 'CI005'),
  ('SD006', 'DamianZtud', 'CI006'),
  ('SD007', 'Eucalyptus Studio', 'CI007'),
  ('SD008', 'Studio Fall', 'CI008'),
  ('SD009', 'New Star Studio', 'CI009'),
  ('SD010', 'Studio GrantHaven', 'CI010'),
  ('SD011', 'Studio Hay', 'CI001');


INSERT INTO MsGenre (GenreID, GenreName)
VALUES
  ('GE001', 'Drama'),
  ('GE002', 'Action'),
  ('GE003', 'Fantasy'),
  ('GE004', 'Adventure'),
  ('GE005', 'Romance'),
  ('GE006', 'Comedy'),
  ('GE007', 'Psychological'),
  ('GE008', 'Horror'),
  ('GE009', 'Sports'),
  ('GE010', 'Mystery');


INSERT INTO MsAnime (AnimeID, GenreID, AnimeName, AnimePrice, AnimeDescription, AnimeAge)
VALUES
  ('AN001', 'GE001', 'Attack on Titan', 60000, 'cool', 13),
  ('AN002', 'GE002', 'One Piece', 70000, 'Pirate adventure', 17),
  ('AN003', 'GE003', 'Naruto', 55000, 'Ninja world', 21),
  ('AN004', 'GE004', 'Sword Art Online', 65000, 'Virtual reality game', 13),
  ('AN005', 'GE005', 'My Hero Academia', 75000, 'letitgo', 17),
  ('AN006', 'GE006', 'Death Note', 50000, 'Mind games', 21),
  ('AN007', 'GE007', 'Haikyuu!!', 55000, 'Volleyball team', 13),
  ('AN008', 'GE008', 'Tokyo Ghoul', 70000, 'Ghouls and humans', 17),
  ('AN009', 'GE009', 'Kurokos Basketball', 60000, 'Basketball team', 21),
  ('AN010', 'GE010', 'Detective Conan', 65000, 'Mystery cases', 13),
  ('AN011', 'GE001', 'Demon Slayer', 75000, 'Demon slayers', 17),
  ('AN012', 'GE002', 'Dragon Ball', 55000, 'Gokus journey', 21),
  ('AN013','GE003' , 'Fairy Tail', 60000, 'Guild adventures', 13),
  ('AN014', 'GE004', 'Fullmetal Alchemist', 70000, 'Alchemy and adventure', 17),
  ('AN015', 'GE005', 'Black Clover', 50000, 'Magic knights', 21),
  ('AN016', 'GE005', 'Moana', 15000, 'your welcome', 10),
  ('AN017', 'GE004', 'Doraeomon', 12000, 'Let It Go', 9)


  INSERT INTO MsCustomer (CustomerID, CustomerName, CityID, CustomerGender, CustomerEmail, CustomerPassword, CustomerDOB)
VALUES
  ('CU001', 'Putri Anggraini', 'CI001', 'Female', 'putrianggraini@gmail.com', 'Password123', '2003-03-10'),
  ('CU002', 'Andi Prasetyo', 'CI002', 'Male', 'andiprasetyo@gmail.com', 'SecurePass1', '2001-09-12'),
  ('CU003', 'Rina Fitriani', 'CI003', 'Female', 'rinafitriani@gmail.com', 'MyPassw0rd', '2002-07-05'),
  ('CU004', 'Budi Santoso', 'CI004', 'Male', 'budisantoso@gmail.com', 'Password1234', '2000-05-03'),
  ('CU005', 'Siti Nurhayati', 'CI005', 'Female', 'sitinurhayati@gmail.com', 'SecretPass1', '2005-12-14'),
  ('CU006', 'Ahmad Hidayat', 'CI006', 'Male', 'ahmadhidayat@gmail.com', 'MySecurePass', '2007-01-08'),
  ('CU007', 'Dewi Susanti', 'CI007', 'Female', 'dewisusanti@gmail.com', 'Confidential1', '2004-11-11'),
  ('CU008', 'Rudi Kurniawan', 'CI008', 'Male', 'rudikurniawan@gmail.com', 'SecretPassw0rd', '2008-02-02'),
  ('CU009', 'Linda Setiawati', 'CI009', 'Female', 'lindasetiawati@gmail.com', 'MySecretPass', '2009-04-07'),
  ('CU010', 'Ferry Wijaya', 'CI010', 'Male', 'ferrywijaya@gmail.com', 'SecurePassword1', '2006-06-15'),
  ('CU011', 'Ayu Pratiwi', 'CI001', 'Female', 'ayupratiwi@gmail.com', 'ConfidentialPass', '2001-01-11'),
  ('CU012', 'Eko Santoso', 'CI002', 'Male', 'ekosantoso@gmail.com', 'Secret123', '2000-03-02'),
  ('CU013', 'Rina Maulida', 'CI003', 'Female', 'rinamaulida@gmail.com', 'ProtectedPass', '2003-02-09'),
  ('CU014', 'Agus Setiawan', 'CI004', 'Male', 'agussetiawan@gmail.com', 'Confidential123', '2005-04-12'),
  ('CU015', 'Siti Rahayu', 'CI005', 'Female', 'sitirahayu@gmail.com', 'MyProtectedPass', '2002-07-03'),
  ('CU016', 'Joko Sutanto', 'CI006', 'Male', 'jokosutanto@gmail.com', 'Secret456', '2007-05-13'),
  ('CU017', 'Lina Dewi', 'CI007', 'Female', 'linadewi@gmail.com', 'Protected123', '2004-08-06'),
  ('CU018', 'Firman Siregar', 'CI008', 'Male', 'firmansiregar@gmail.com', 'MyConfidentialPass', '2008-11-14'),
  ('CU019', 'Maya Susanti', 'CI009', 'Female', 'mayasusanti@gmail.com', 'Secret789', '2009-09-01'),
  ('CU020', 'Hendro Kusumo', 'CI010', 'Male', 'hendrokusumo@gmail.com', 'Protected789', '2006-12-07'),
  ('CU021', 'Michael Sean', 'CI010', 'Male', 'MichaelSeano@gmail.com', 'Protected123', '1993-12-07')

  INSERT INTO PurchaseHeader (PurchaseID, StaffID, StudioID, PurchaseDate)
VALUES
  ('PU001', 'SF001', 'SD001', '2023-01-02'),
  ('PU002', 'SF002', 'SD002', '2023-01-05'),
  ('PU003', 'SF003', 'SD003', '2023-01-07'),
  ('PU004', 'SF004', 'SD004', '2023-01-12'),
  ('PU005', 'SF005', 'SD005', '2023-01-13'),
  ('PU006', 'SF006', 'SD006', '2023-01-15'),
  ('PU007', 'SF007', 'SD007', '2023-01-18'),
  ('PU008', 'SF008', 'SD008', '2023-01-20'),
  ('PU009', 'SF009', 'SD009', '2023-01-22'),
  ('PU010', 'SF010', 'SD010', '2023-01-23'),
  ('PU011', 'SF011', 'SD011', '2023-01-26'),
  ('PU012', 'SF012', 'SD001', '2023-01-28'),
  ('PU013', 'SF013', 'SD002', '2023-02-01'),
  ('PU014', 'SF014', 'SD003', '2023-02-03'),
  ('PU015', 'SF015', 'SD004', '2023-02-05'),
  ('PU016', 'SF016', 'SD005', '2023-02-06'),
  ('PU017', 'SF017', 'SD006', '2023-02-09'),
  ('PU018', 'SF018', 'SD007', '2023-02-11'),
  ('PU019', 'SF019', 'SD008', '2023-02-14'),
  ('PU020', 'SF020', 'SD009', '2023-02-16'),
  ('PU021', 'SF001', 'SD010', '2023-02-19'),
  ('PU022', 'SF002', 'SD011', '2023-02-21'),
  ('PU023', 'SF003', 'SD001', '2023-02-23'),
  ('PU024', 'SF004', 'SD002', '2023-02-24'),
  ('PU025', 'SF005', 'SD003', '2023-02-27');


  INSERT INTO PurchaseDetail (PurchaseId, AnimeId)
VALUES
  ('PU001', 'AN001'),
  ('PU002', 'AN002'),
  ('PU003', 'AN003'),
  ('PU004', 'AN004'),
  ('PU005', 'AN005'),
  ('PU006', 'AN006'),
  ('PU007', 'AN007'),
  ('PU008', 'AN008'),
  ('PU009', 'AN009'),
  ('PU010', 'AN010'),
  ('PU011', 'AN011'),
  ('PU012', 'AN012'),
  ('PU013', 'AN013'),
  ('PU014', 'AN014'),
  ('PU015', 'AN015'),
  ('PU016', 'AN015'),
  ('PU017', 'AN013'),
  ('PU018', 'AN012'),
  ('PU019', 'AN012'),
  ('PU020', 'AN011'),
  ('PU021', 'AN013'),
  ('PU022', 'AN015'),
  ('PU023', 'AN002'),
  ('PU024', 'AN003'),
  ('PU025', 'AN004')

 

  INSERT INTO SalesMethod (SalesMethodID, SalesMethodName)
VALUES
  ('SM001', 'Debit'),
  ('SM002', 'Credit');

  INSERT INTO SalesHeader (SalesID, SalesDate, SalesMethodID, CustomerID)
VALUES
  ('SA001', '2023-01-01', 'SM001', 'CU001'),
  ('SA002', '2023-01-02', 'SM002', 'CU002'),
  ('SA003', '2023-01-03', 'SM001', 'CU003'),
  ('SA004', '2023-01-04', 'SM002', 'CU004'),
  ('SA005', '2023-01-05', 'SM001', 'CU005'),
  ('SA006', '2023-01-06', 'SM002', 'CU006'),
  ('SA007', '2023-01-07', 'SM001', 'CU007'),
  ('SA008', '2023-01-08', 'SM002', 'CU008'),
  ('SA009', '2023-01-09', 'SM001', 'CU009'),
  ('SA010', '2023-01-10', 'SM002', 'CU010'),
  ('SA011', '2023-01-11', 'SM001', 'CU011'),
  ('SA012', '2023-01-12', 'SM002', 'CU012'),
  ('SA013', '2023-01-13', 'SM001', 'CU013'),
  ('SA014', '2023-01-14', 'SM002', 'CU014'),
  ('SA015', '2023-01-15', 'SM001', 'CU015'),
  ('SA016', '2023-01-16', 'SM002', 'CU016'),
  ('SA017', '2023-01-17', 'SM001', 'CU017'),
  ('SA018', '2023-01-18', 'SM002', 'CU018'),
  ('SA019', '2023-01-19', 'SM001', 'CU019'),
  ('SA020', '2023-01-20', 'SM002', 'CU020'),
  ('SA021', '2023-01-21', 'SM001', 'CU001'),
  ('SA022', '2023-01-22', 'SM002', 'CU009'),
  ('SA023', '2023-01-23', 'SM001', 'CU014'),
  ('SA024', '2023-01-24', 'SM002', 'CU001'),
  ('SA025', '2023-01-25', 'SM001', 'CU009'),
  ('SA026', '2023-01-26', 'SM002', 'CU014'),
  ('SA027', '2023-01-27', 'SM001', 'CU001'),
  ('SA028', '2023-01-28', 'SM002', 'CU009'),
  ('SA029', '2023-01-29', 'SM001', 'CU014'),
  ('SA030', '2023-01-30', 'SM002', 'CU001');

 INSERT INTO SalesHeader (SalesID, SalesDate, SalesMethodID, CustomerID)
VALUES
	  ('SA031', '2023-01-07', 'SM001', 'CU007'),
	  ('SA032', '2023-01-07', 'SM001', 'CU007'),
	  ('SA033', '2023-01-07', 'SM001', 'CU007'),
	  ('SA034', '2023-01-07', 'SM001', 'CU007'),
      ('SA035', '2023-01-07', 'SM001', 'CU007'),
	  ('SA036', '2023-01-07', 'SM001', 'CU021')
	 
INSERT INTO SalesHeader (SalesID, SalesDate, SalesMethodID, CustomerID)
VALUES
	 ('SA037', '2023-01-07', 'SM001', 'CU007'),
	 ('SA038', '2023-01-07', 'SM001', 'CU007')

	 INSERT INTO SalesHeader (SalesID, SalesDate, SalesMethodID, CustomerID)
VALUES
	 ('SA039', '2023-03-07', 'SM001', 'CU007'),
	 ('SA040', '2023-07-07', 'SM001', 'CU007'),
	 ('SA041', '2023-05-07', 'SM001', 'CU007')


  INSERT INTO SalesDetail (SalesID, AnimeID, DurationDay)
VALUES
  ('SA001', 'AN001', 5),
  ('SA002', 'AN002', 7),
  ('SA003', 'AN003', 8),
  ('SA004', 'AN004', 9),
  ('SA005', 'AN005', 12),
  ('SA006', 'AN006', 15),
  ('SA007', 'AN007', 4),
  ('SA008', 'AN008', 6),
  ('SA009', 'AN009', 10),
  ('SA010', 'AN010', 11),
  ('SA011', 'AN011', 9),
  ('SA012', 'AN012', 8),
  ('SA013', 'AN013', 6),
  ('SA014', 'AN014', 5),
  ('SA015', 'AN015', 11),
  ('SA016', 'AN002', 10),
  ('SA017', 'AN011', 7),
  ('SA018', 'AN012', 5),
  ('SA019', 'AN013', 9),
  ('SA020', 'AN004', 8),
  ('SA021', 'AN012', 7),
  ('SA022', 'AN013', 6),
  ('SA023', 'AN014', 5),
  ('SA024', 'AN015', 4),
  ('SA025', 'AN004', 3),
  ('SA026', 'AN005', 5),
  ('SA027', 'AN005', 7),
  ('SA028', 'AN006', 8),
  ('SA029', 'AN007', 9),
  ('SA030', 'AN008', 12)


   INSERT INTO SalesDetail (SalesID, AnimeID, DurationDay)
VALUES
   ('SA031', 'AN017', 1),
   ('SA032', 'AN017', 1),
   ('SA033', 'AN017', 1),
   ('SA034', 'AN017', 1),
   ('SA035', 'AN017', 1),
   ('SA036', 'AN017', 1)