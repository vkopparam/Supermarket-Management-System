/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/4/19 23:29:03                           */
/*==============================================================*/


drop table if exists complaint;

drop table if exists complaint_type;

drop table if exists department;

drop table if exists item;

drop table if exists memberacc;

drop table if exists purchase;

drop table if exists purchlist;

drop table if exists shoplist;

drop table if exists shopping;

drop table if exists staff;

drop table if exists staffacc;

drop table if exists staffacc_authtype;

drop table if exists storage;

drop table if exists storelist;

drop table if exists supplieracc;

/*==============================================================*/
/* Table: complaint                                             */
/*==============================================================*/
create table complaint
(
   comp_id              int not null auto_increment,
   mem_id               int,
   comp_type            numeric(1,0) not null,
   comp_content         text not null,
   comp_time            datetime not null,
   primary key (comp_id)
);

/*==============================================================*/
/* Table: complaint_type                                        */
/*==============================================================*/
create table complaint_type
(
   comp_type            numeric(1,0) not null,
   discomp_typename     text not null,
   primary key (comp_type)
);

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department
(
   dept_id              numeric(2,0) not null,
   dept_name            text not null,
   primary key (dept_id)
);

/*==============================================================*/
/* Table: item                                                  */
/*==============================================================*/
create table item
(
   item_id              int not null auto_increment,
   item_name            text not null,
   item_spec            text not null,
   item_cate            text not null,
   item_brand           text not null,
   item_price           float(8,2) not null,
   item_manudate        date,
   item_expidate        date,
   item_note            text,
   primary key (item_id)
);

/*==============================================================*/
/* Table: memberacc                                             */
/*==============================================================*/
create table memberacc
(
   mem_id               int not null auto_increment,
   mem_name             text not null,
   mem_psw              text not null,
   mem_phone            text,
   mem_mail             text,
   mem_regtime          datetime not null,
   mem_point            int not null,
   mem_note             text,
   primary key (mem_id)
);

/*==============================================================*/
/* Table: purchase                                              */
/*==============================================================*/
create table purchase
(
   shop_id              int not null,
   supp_id              int,
   staff_id             int,
   shop_time            datetime not null,
   shop_note            text,
   primary key (shop_id)
);

/*==============================================================*/
/* Table: purchlist                                             */
/*==============================================================*/
create table purchlist
(
   item_id              int not null,
   shop_id              int not null,
   purch_unitprice      float(8,2) not null,
   purch_unitnum        int not null,
   primary key (item_id, shop_id)
);

/*==============================================================*/
/* Table: shoplist                                              */
/*==============================================================*/
create table shoplist
(
   item_id              int not null,
   shop_id              int not null,
   item_price           float(8,2) not null,
   item_count           int not null,
   primary key (item_id, shop_id)
);

/*==============================================================*/
/* Table: shopping                                              */
/*==============================================================*/
create table shopping
(
   shop_id              int not null auto_increment,
   mem_id               int,
   staff_id             int,
   shop_time            datetime not null,
   shop_note            text,
   primary key (shop_id)
);

/*==============================================================*/
/* Table: staff                                                 */
/*==============================================================*/
create table staff
(
   staff_id             int not null auto_increment,
   dept_id              numeric(2,0) not null,
   staff_name           text not null,
   staff_idcard         text not null,
   staff_phone          text,
   staff_addr           text,
   staff_pos            text not null,
   staff_hiredate       date not null,
   staff_note           text,
   primary key (staff_id)
);

/*==============================================================*/
/* Table: staffacc                                              */
/*==============================================================*/
create table staffacc
(
   staff_id             int not null,
   staff_psw            text not null,
   staff_type           int not null,
   staff_note           text,
   primary key (staff_id)
);

/*==============================================================*/
/* Table: staffacc_authtype                                     */
/*==============================================================*/
create table staffacc_authtype
(
   staff_type           int not null,
   staff_typename       text not null,
   primary key (staff_type)
);

/*==============================================================*/
/* Table: storage                                               */
/*==============================================================*/
create table storage
(
   stor_id              int not null,
   stor_desc            text not null,
   empl_id              bigint,
   primary key (stor_id)
);

/*==============================================================*/
/* Table: storelist                                             */
/*==============================================================*/
create table storelist
(
   item_id              bigint not null,
   stor_id              int not null,
   number               int not null,
   primary key (item_id, stor_id)
);

/*==============================================================*/
/* Table: supplieracc                                           */
/*==============================================================*/
create table supplieracc
(
   supp_id              int not null auto_increment,
   supp_name            text not null,
   supp_psw             text not null,
   supp_regtime         datetime not null,
   supp_contact         text,
   supp_phone           text,
   supp_mail            text,
   supp_addr            text,
   supp_note            text,
   primary key (supp_id)
);



