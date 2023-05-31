drop table phonestore cascade;
create table PhoneStore (
    Id UUID primary key,
    Name VARCHAR(255),
    Address VARCHAR(255)
);

drop table Phone Cascade;
create table Phone (
    Id UUID primary key,
    Brand VARCHAR(255),
    Price DECIMAL(10, 2)
);

drop table feature cascade;
create table Feature(
	Id UUID primary key,
	Name VARCHAR(255)
);

drop table phonefeature cascade;
create table PhoneFeature(
	PhoneId UUID,
	FeatureId UUID,
	primary key (PhoneId, FeatureId),
	constraint FK_PhoneFeature_Phone_Id foreign key (PhoneId) references Phone(Id),
	constraint FK_PhoneFeature_Feature_Id foreign key (FeatureId) references Feature(Id)
);

drop table manufacturer cascade;
create table Manufacturer (
	Id UUID primary key,
	name VARCHAR(255)
);

alter table Phone add column ManufacturerId UUID;
alter table Phone add constraint FK_Phone_Manufacturer_Id foreign key (ManufacturerId) references Manufacturer(Id);

drop table PhoneStorePhone;
create table PhoneStorePhone(
	PhoneStoreId UUID,
	PhoneId UUID,
	constraint FK_PhoneStorePhone_PhoneStore_Id foreign key (PhoneStoreId) references PhoneStore(Id),
	constraint FK_PhoneStorePhone_Phone_Id foreign key (PhoneId) references Phone(Id)
);

INSERT INTO PhoneStore (Id, Name, Address)
VALUES
    ('4e244f2f-aaab-4988-af70-ebdb37c6e4a5', 'Phone Store 1', '123 Main St'),
    ('e308e2f1-11d0-4b14-872b-4f7e0d25f08c', 'Phone Store 2', '456 Elm St');


INSERT INTO Manufacturer (Id, name)
VALUES
    ('1f3a8121-7b26-4c6d-ae8b-8e7d2afed53a', 'Apple'),
    ('c9e8456f-8dd1-491b-9b3e-7cc1f4d6c4b0', 'Samsung'),
    ('601890de-4eaf-4e5c-9932-30413431fd35', 'Google');
   
INSERT INTO Phone (Id, Brand, Price, ManufacturerId)
VALUES
    ('6db24c3d-c2b6-45af-88d6-91b6183cf7f1', 'iPhone 12', 999.99, '1f3a8121-7b26-4c6d-ae8b-8e7d2afed53a'),
    ('e2e0d3a6-1b50-4f46-99a9-876c4a0f7d1c', 'Galaxy S21', 899.99, 'c9e8456f-8dd1-491b-9b3e-7cc1f4d6c4b0'),
    ('9a20e123-8e3c-41a9-89e3-12c78e40e1d4', 'Pixel 5', 699.99, '601890de-4eaf-4e5c-9932-30413431fd35');

INSERT INTO Feature (Id, Name)
VALUES
    ('a683764c-12c0-4b18-9338-8b611e155d7e', 'Waterproof'),
    ('8e0d8a3a-54b3-4d91-914c-271b0c29a9d6', 'Dual SIM'),
    ('6e46c602-29ed-4c8a-b4e2-869ab7c4096e', 'Face Unlock');

INSERT INTO PhoneFeature (PhoneId, FeatureId)
VALUES
    ('6db24c3d-c2b6-45af-88d6-91b6183cf7f1', 'a683764c-12c0-4b18-9338-8b611e155d7e'),
    ('6db24c3d-c2b6-45af-88d6-91b6183cf7f1', '8e0d8a3a-54b3-4d91-914c-271b0c29a9d6'),
    ('e2e0d3a6-1b50-4f46-99a9-876c4a0f7d1c', 'a683764c-12c0-4b18-9338-8b611e155d7e'),
    ('9a20e123-8e3c-41a9-89e3-12c78e40e1d4', '6e46c602-29ed-4c8a-b4e2-869ab7c4096e');


INSERT INTO PhoneStorePhone (PhoneStoreId, PhoneId)
VALUES
    ('4e244f2f-aaab-4988-af70-ebdb37c6e4a5', '6db24c3d-c2b6-45af-88d6-91b6183cf7f1'),
    ('4e244f2f-aaab-4988-af70-ebdb37c6e4a5', 'e2e0d3a6-1b50-4f46-99a9-876c4a0f7d1c'),
    ('e308e2f1-11d0-4b14-872b-4f7e0d25f08c', '9a20e123-8e3c-41a9-89e3-12c78e40e1d4');

SELECT Phone.Brand, PhoneStore.Name AS StoreName
FROM Phone
INNER JOIN PhoneStorePhone ON Phone.Id = PhoneStorePhone.PhoneId
INNER JOIN PhoneStore ON PhoneStore.Id = PhoneStorePhone.PhoneStoreId;

SELECT Manufacturer.Name, Phone.Brand
FROM Manufacturer
LEFT JOIN Phone ON Manufacturer.Id = Phone.ManufacturerId;

SELECT Phone.Brand, Manufacturer.Name
FROM Phone
LEFT JOIN Manufacturer ON Phone.ManufacturerId = Manufacturer.Id;

INSERT INTO Phone (Id, Brand, Price, ManufacturerId)
VALUES('6db24c3d-c2b6-45af-88d6-91b6183cf6d1', 'iPhone 14', 1299.99, '1f3a8121-7b26-4c6d-ae8b-8e7d2afed53a');

select phone.brand, feature.name
from phone
left join phonefeature on Phone.id=phoneFeature.phoneid
left join feature on phoneFeature.featureid = feature.id;

select feature.name, phone.brand
from feature
left join phonefeature on feature.id=phonefeature.featureid
left join phone on phonefeature.phoneid = phone.id;

select feature.name,phone.brand
from phone
right join phonefeature on Phone.id=phoneFeature.phoneid
right join feature on phoneFeature.featureid = feature.id;

