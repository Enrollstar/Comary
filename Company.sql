use master 
go
if exists( select * from  sysdatabases where name='Company')
	drop database Company
go
create database Company
go
use Company
go
create table Staff
(
	JobNumber nvarchar(64) not null primary key,         --����
	LoginPwd nvarchar(64) not null default('123456'),    --����
	Name nvarchar(64) not null ,                         --����
	Sex bit not null ,									 --�Ա�
	WorkingAge int not null,							 --����
	Phone nvarchar(256) not null unique ,				 --�ֻ���
	Birthplace nvarchar(256) not null default('���ݳ�����'), --����
	EntryTime datetime not null check(EntryTime>'1980-1-1'),--��ְʱ��
	Company nvarchar(64) not null ,							 --��˾����
	Email nvarchar(64)										--�����ʼ� 
)

create table Department
(
	DepartmentNumber nvarchar(32) not null primary key,			--���ű��
	DepartmentName  nvarchar(64) not null default('ѧ����')		--��������

)

create table Wage
(
	PayrollNumber nvarchar(64) not null primary key,											--���ʱ��
	DepartmentNumber  nvarchar(32) not null foreign key references Department(DepartmentNumber),--���ű��
	JobNumber nvarchar(64) not null foreign key references Staff(JobNumber),					--Ա�����
	Wage money not null check(Wage>=0),															 --����
	ReleaseTime datetime not null check(ReleaseTime>'2018-1-1'),								--����ʱ��
)

insert into Staff values('HP001','2017001','���»�',1,'2','18777890610','��������','2016-3-1','�����񲩽����Ƽ����޹�˾','516265571@qq.com')
insert into Staff values('HP002','2017002','�ܽ���',1,'3','18777890611','��������','2016-3-2','�����񲩽����Ƽ����޹�˾','516265572@qq.com')
insert into Staff values('HP003','2017003','����',1,'1','18777890612','��������','2016-3-3','�����񲩽����Ƽ����޹�˾','516265573@qq.com')
insert into Staff values('HP004','2017004','�ƶ�',1,'4','18777890613','��������','2016-3-4','�����񲩽����Ƽ����޹�˾','516265574@qq.com')
insert into Staff values('HP005','2017005','����',0,'2','18777890614','��������','2016-3-5','�����񲩽����Ƽ����޹�˾','516265575@qq.com')
insert into Staff values('HP006','2017006','����',1,'3','18777890616','��������','2016-3-5','�����񲩽����Ƽ����޹�˾','516265576@qq.com')
insert into Staff values('HP007','2017007','����',1,'1','18777890617','��������','2016-3-5','�����񲩽����Ƽ����޹�˾','516265577@qq.com')

insert into Department values('D001','�з���')
insert into Department values('D002','���²�')
insert into Department values('D003','����')
insert into Department values('D004','ѧ����')
insert into Department values('D005','�г���') 

insert into Wage values('PN001','D001','HP001',4500.00,'2018-4-5')
insert into Wage values('PN002','D002','HP002',4300.00,'2018-4-5')
insert into Wage values('PN003','D003','HP003',4400.00,'2018-4-5')
insert into Wage values('PN004','D004','HP004',4600.00,'2018-4-5')
insert into Wage values('PN005','D005','HP005',4800.00,'2018-4-5')
insert into Wage values('PN007','D005','HP006',4200.00,'2018-4-5')
insert into Wage values('PN008','D001','HP007',4200.00,'2018-4-5')


select * from Wage 
select * from Department