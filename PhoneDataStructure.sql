create table PhoneStore (
    Id INT primary key,
    Name VARCHAR(255),
    Address VARCHAR(255)
);

create table Phone (
    Id INT primary key,
    Brand VARCHAR(255),
    Price DECIMAL(10, 2),
    PhoneStoreId INT,
    constraint FK_PHONE_STORE_ID foreign key (PhoneStoreId) references PhoneStore(Id)
);

create table Feature(
	Id INT primary key,
	Name VARCHAR(255)
);


create table PhoneFeature(
	PhoneId INT,
	FeatureId INT,
	primary key (PhoneId, FeatureId),
	constraint FK_PhoneFeature_Phone_Id foreign key (PhoneId) references Phone(Id),
	constraint FK_PhoneFeature_Feature_Id foreign key (FeatureId) references Feature(Id)
);

create table Manufacturer (
	Id INT primary key,
	name VARCHAR(255)
);

alter table Phone add column ManufacturerId INT;
alter table Phone add constraint FK_Phone_Manufacturer_Id foreign key (ManufacturerId) references Manufacturer(Id);
alter table Manufacturer add column PhoneId INT unique;
alter table Manufacturer add constraint FK_Manufacturer_Phone_Id foreign key (PhoneId) references Phone(Id);
