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
	JobNumber nvarchar(64) not null primary key,         --工号
	LoginPwd nvarchar(64) not null default('123456'),    --密码
	Name nvarchar(64) not null ,                         --姓名
	Sex bit not null ,									 --性别
	WorkingAge int not null,							 --工龄
	Phone nvarchar(256) not null unique ,				 --手机号
	Birthplace nvarchar(256) not null default('梧州长洲区'), --籍贯
	EntryTime datetime not null check(EntryTime>'1980-1-1'),--入职时间
	Company nvarchar(64) not null ,							 --公司名称
	Email nvarchar(64)										--电子邮件 
)

create table Department
(
	DepartmentNumber nvarchar(32) not null primary key,			--部门编号
	DepartmentName  nvarchar(64) not null default('学术部')		--部门名称

)

create table Wage
(
	PayrollNumber nvarchar(64) not null primary key,											--工资编号
	DepartmentNumber  nvarchar(32) not null foreign key references Department(DepartmentNumber),--部门编号
	JobNumber nvarchar(64) not null foreign key references Staff(JobNumber),					--员工编号
	Wage money not null check(Wage>=0),															 --工资
	ReleaseTime datetime not null check(ReleaseTime>'2018-1-1'),								--发放时间
)

insert into Staff values('HP001','2017001','刘德华',1,'2','18777890610','柳州拉货','2016-3-1','广西厚博教育科技有限公司','516265571@qq.com')
insert into Staff values('HP002','2017002','周杰伦',1,'3','18777890611','柳州柳东','2016-3-2','广西厚博教育科技有限公司','516265572@qq.com')
insert into Staff values('HP003','2017003','马华腾',1,'1','18777890612','梧州藤县','2016-3-3','广西厚博教育科技有限公司','516265573@qq.com')
insert into Staff values('HP004','2017004','科尔',1,'4','18777890613','柳州三江','2016-3-4','广西厚博教育科技有限公司','516265574@qq.com')
insert into Staff values('HP005','2017005','杨紫',0,'2','18777890614','柳州拉货','2016-3-5','广西厚博教育科技有限公司','516265575@qq.com')
insert into Staff values('HP006','2017006','张三',1,'3','18777890616','柳州拉货','2016-3-5','广西厚博教育科技有限公司','516265576@qq.com')
insert into Staff values('HP007','2017007','刘星',1,'1','18777890617','柳州拉货','2016-3-5','广西厚博教育科技有限公司','516265577@qq.com')

insert into Department values('D001','研发部')
insert into Department values('D002','人事部')
insert into Department values('D003','财务部')
insert into Department values('D004','学术部')
insert into Department values('D005','市场部') 

insert into Wage values('PN001','D001','HP001',4500.00,'2018-4-5')
insert into Wage values('PN002','D002','HP002',4300.00,'2018-4-5')
insert into Wage values('PN003','D003','HP003',4400.00,'2018-4-5')
insert into Wage values('PN004','D004','HP004',4600.00,'2018-4-5')
insert into Wage values('PN005','D005','HP005',4800.00,'2018-4-5')
insert into Wage values('PN007','D005','HP006',4200.00,'2018-4-5')
insert into Wage values('PN008','D001','HP007',4200.00,'2018-4-5')


select * from Wage 
select * from Department