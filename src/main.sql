create database ferreteria;
use ferreteria;
-- --creacion de tablas 
create table Familias(
	FamId int not null, 
    FamNombre nvarchar(25) not null,
    FamDescripcion nvarchar(30)
);
create table Articulos(
	ArtId int not null,
    ArtNombre nvarchar(25) not null,
    ArtDescripcion nvarchar(100),
    Artprecio numeric(10,2),
    FamId int not null
);
create table Ferreterias(
	FerrId int not null,
    FerrNombre nvarchar(40) not null,
    FerrDomicilio nvarchar(70) not null,
    FerrTelefono char(10) not null
);
create table Zonas(
	ZonaId int not null,
    ZonaNombre nvarchar(25) not null
);
create table Empleados(
	EmpId int not null,
    EmpNombre nvarchar(20) not null,
    EmpApePat nvarchar(20) not null,
    EmpApeMat nvarchar(20) not null,
    EmpDomicilio nvarchar(40) not null,
    EmpTelefono char(10) null,
    EmpCelular char(10) null,
    EmpRFC char(13) not null,
    EmpCurp char(18) not null,
    EmpFechaIngreso date not null,
    EmpFechaNacimiento date not null,
    JefeID int not null,
    ZonaId int not null
);
create table Municipios(
	MunId int not null,
    MunNombre nvarchar(50) not null
);
create table Colonias(
	ColId int not null,
    ColNombre nvarchar(30) not null,
    ColCp char(5)null,
    MunId int not null
);
create table Clientes(
	CteId int not null,
    CteNombre nvarchar(20) not null,
    CteApeMat nvarchar(20) not null,
    CteApePat nvarchar(20) not null,
    CteDomicilio nvarchar(80) not null,
    CteTelefono char(10) null,
    CteCelular char(10) null,
    CteRFC char(13) not null,
    CteCurp char(18) not null,
    CteFechaNacimiento date not null,
    CteSexo nchar(1) not null,
    ColId int not null
);
create table Ventas(
	Folio int not null,
    Fecha datetime not null,
    CteId int not null,
    EmpId int not null,
    FerrId int not null
);
create table detalle(
	Folio int not null,
    ArtId int not null,
	Cantidad tinyint not null,
    precio numeric(11,2) not null
);
-- --Primary keys
alter table Articulos add constraint ArtID primary key (ArtID);
alter table Clientes add constraint CteID primary key (CteID);
alter table Colonias add constraint ColID primary key (ColID);
alter table Empleados add constraint EmpID primary key (EmpID);
alter table Familias add constraint FamID primary key (FamID);
alter table Ferreterias add constraint FerrID primary key (FerrID);
alter table Municipios add constraint MunID primary key (MunID);
alter table Ventas add constraint Folio primary key (Folio);
alter table Zonas add constraint zonaID primary key (ZonaID);

-- --Foreing keys
alter table Articulos add constraint FamIDFK foreign key(FamID) references Familias(FamID);
alter table Colonias add constraint ColIDFk foreign key(MunID) references Municipios(MunID);
alter table Clientes add constraint CteIDFK foreign key(ColID) references Colonias(ColID);
alter table Empleados add 
constraint EmppleadoIDFk foreign key(ZonaID) references Zonas(ZonaID), 
constraint JefeID foreign key(JefeID) references Empleados(EmpID);
alter table Ventas add 
constraint ClientesFK foreign key(CteID) references Clientes(CteID), 
constraint EmpleadosFK foreign key(EmpID) references Empleados(EmpID), 
constraint FerretrriaFK foreign key(FerrID) references Ferreterias(FerrID);
alter table Detalle add 
constraint FolioVentasFK foreign key(Folio) references Ventas(Folio), 
constraint ArticulosVentasFK  foreign key(ArtID) references Articulos(ArtID);
-- --llave unica
alter table Articulos add constraint ArtIDUnique unique (ArtID,ArtNombre);
alter table Clientes add constraint ClienteIDUnique unique (CteID,CteRFC,CteCelular,CteCurp);
alter table Colonias add constraint ColIDUnique unique (ColID);
alter table Empleados add constraint EmpleadoUnique unique (EmpID,EmpCelular,EmpRFC,EmpCurp);
alter table Familias add constraint FamiliaIDUnique unique (FamID,FamNombre);
alter table Ferreterias add constraint FerreteriaIDUnique unique (FerrID,FerrTelefono);
alter table Municipios add constraint MUNIcipioDUnique unique (MunID,MunNombre);
alter table Ventas add constraint FOLioUnique unique (Folio);
alter table Zonas add constraint ZonasIDUnique unique (ZonaID);
-- alter check 
alter table Clientes add constraint ClienteCCsexo check(CteSexo in('F','M'));
alter table Detalle add 
constraint MayorACeroprecioDetalle check(Precio>0),
constraint MayorACeroCantidadDetalle check(Cantidad>0);
alter table Articulos add constraint MayorACeroCantidadArti check(ArtPrecio>0);
-- alter default
ALTER TABLE EMPLEADOS ADD
CONSTRAINT DC_EMPLEADOS_DOM DEFAULT ( ' DOMICILIO CONOCIDO ' ) FOR EMPDOMICILIO,
CONSTRAINT DC_EMPLEADOS_TEL DEFAULT ( ' SIN TELEFONO ' ) FOR EMPTELEFONO;
ALTER TABLE CLIENTES ADD
CONSTRAINT DC_CLIENTES_DOM DEFAULT ( ' DOMICILIO CONOCIDO ' ) FOR CTEDOMICILIO ,
CONSTRAINT DC_CLIENTES_DOMBOD DEFAULT ( ' SIN TELEFONO ' ) FOR CTETELEFONO;
ALTER TABLE COLONIAS ADD CONSTRAINT DC_COLONIAS_CP DEFAULT (  00000  ) FOR COLCP;
-- --insert
insert into Familias values (1, 'familia1', 'abcdefghijklmnopqrstuvfxyz');
insert into Familias values (2, 'familia2', 'abcdefghijklmnopqrstuvwxyz');
insert into Familias values (3, 'familia3', 'abcdefghijklmnopqrstuvwxyz');
insert into Familias values (4, 'familia4', 'abcdefghijklmnopqrstuvwxyz');
insert into Familias values (5, 'familia5', 'abcdefghijklmnopqrstuvwxyz');

insert into Articulos values (1, 'Articulo1', 'abcdefghijklmnopqrstuvwxyz',20,1);
insert into Articulos values (2, 'Articulo2', 'abcdefghijklmnopqrstuvwxyz',10,2);
insert into Articulos values (3, 'Articulo3', 'abcdefghijklmnopqrstuvwxyz',100,5);
insert into Articulos values (4, 'Articulo4', 'abcdefghijklmnopqrstuvwxyz',50,3);
insert into Articulos values (5, 'Articulo5', 'abcdefghijklmnopqrstuvwxyz',1000,2);

insert into Ferreterias values (1, 'Ferreteria1','centro',1234567890);
insert into Ferreterias values (2, 'Ferreteria2','centro',1234567810);
insert into Ferreterias values (3, 'Ferreteria3','sur',1234467890);
insert into Ferreterias values (4, 'Ferreteria3','sur',1534467890);
insert into Ferreterias values (5, 'Ferreteria5','sur',1234967890);

insert into Zonas values (1, 'Zonas1');
insert into Zonas values (2, 'Zonas2');
insert into Zonas values (3, 'Zonas3');
insert into Zonas values (4, 'Zonas4');
insert into Zonas values (5, 'Zonas5');

insert into Municipios values (1, 'Municipio1');
insert into Municipios values (2, 'Municipio2');
insert into Municipios values (3, 'Municipio3');
insert into Municipios values (4, 'Municipio4');
insert into Municipios values (5, 'Municipio5');

insert into Colonias values (1, 'Colonia1',12345,1);
insert into Colonias values (2, 'Colonia2',12335,4);
insert into Colonias values (3, 'Colonia3',11345,5);
insert into Colonias values (4, 'Colonia4',12385,1);
insert into Colonias values (5, 'Colonia5',12445,2); 

insert into Clientes values (1, 'juan','rodriguez','perez','calle 1','9087654321','1029384756','ad456567aa','asad4636','12-12-12','M',1);
insert into Clientes values (2, 'jose','rodriguez','perez','calle 2','6687654321','1449384756','uure6567aa','5s5s5s54636','11-11-12','M',1);
insert into Clientes values (3, 'julian','zazueta','perez','calle 1-7','9087654567','102912356','ah856897aa','askk4636','12-10-10','M',3);
insert into Clientes values (4, 'joel','rodriguez','uriarte','calle 87243','9090654321','1027874756','lkj567aa','lkjh4636','3-12-7','M',1);
insert into Clientes values (5, 'valentin','payan','perez','calle 43342 ssd','9087666771','1088884756','ttt56567aa','nbnd4636','12-6-7','M',5);

insert into Empleados values (1, 'juan','rodriguez','perez','calle 1','9087654321','1029384756','ad456567aa','asad4636','12-12-12','10-12-12',1,1);
insert into Empleados values (2, 'jose','rodriguez','perez','calle 2','6687654321','1449384756','uure6567aa','5s5s5s54636','11-11-12','12-12-12',1,1);
insert into Empleados values (3, 'julian','zazueta','perez','calle 1-7','9087654567','102912356','ah856897aa','askk4636','12-10-10','12-12-12',1,3);
insert into Empleados values (4, 'joel','rodriguez','uriarte','calle 87243','9090654321','1027874756','lkj567aa','lkjh4636','3-12-7','12-12-12',1,1);
insert into Empleados values (5, 'valentin','payan','perez','calle 43342 ssd','9087666771','1088884756','ttt56567aa','nbnd4636','12-6-7','12-12-12',1,5);

insert into ventas values (1, '7-7-7',1,2,3);
insert into ventas values (2, '7-7-6',5,2,3);
insert into ventas values (3, '7-8-7',1,5,3);
insert into ventas values (4, '9-7-7',4,2,3);
insert into ventas values (5, '7-7-7',4,5,3);

insert into detalle values (1,3,10,4);
insert into detalle values (2,4,100,49);
insert into detalle values (3,2,113,433);
insert into detalle values (1,2,60,444);
insert into detalle values (1,4,6,4447);