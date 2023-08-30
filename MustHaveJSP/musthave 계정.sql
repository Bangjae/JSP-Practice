-- ���̺� ��� ��ȸ
select * from tab;

drop table member;
drop table board;
drop sequence seq_board_num;

-- ȸ�� ���̺� ����
create table member(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key (id)
);

-- �� 1 ����� �Խ��� ���̺� ����
create table board(
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcount number(6)
);

-- �ܷ�Ű ����
alter table board
    add constraint board_mem_fk foreign key(id)
    references member (id);

-- ������ ����
create sequence seq_board_num
    increment by 1 --1������
    start with 1   --���۰� 1
    minvalue 1     --�ּҰ� 1
    nomaxvalue     --�ִ��� ���Ѵ�
    nocycle        --��ȯ��������
    nocache;       --ĳ�� �Ⱦ�.
    
--���� ������ �Է�
insert into member (id, pass, name) values ('musthave', '1234', '�ӽ�Ʈ�غ�');
insert into board  (num, title, content, id, postdate, visitcount)
    values(seq_board_num.nextval, '����1�Դϴ�', '����1�Դϴ�',
    'musthave', sysdate, 0);
commit;

select count(*) from board where title like'%2%';
select * from board where title like '%1%';

INSERT INTO board VALUES (seq_board_num.nextval, '������ ���Դϴ�', '���ǿ���', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �����Դϴ�', '�������', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �����Դϴ�', '������ȭ', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �ܿ��Դϴ�', '�ܿ￬��', 'musthave', sysdate, 0);

commit;

desc member;
select * from member;
select id, pass, rownum from member;

select * from (
    select Tb.*, rownum rNum from(
        select * from board order by num desc
        )Tb
)
where rNum between 1 and 10;

--12�� ���� ���ε�
create table myfile(
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    cate varchar2(100),
    ofile varchar2(100) not null,
    sfile varchar2(50) not null,
    postdate date default sysdate not null
);
    
    
drop table myfile;

--��2 ����� ����÷���� �Խ��� ���̺� ����
create table mvcboard (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    postdate date default sysdate not null,
    ofile varchar2(200),
    sfile varchar2(50),
    downcount number(5) default 0 not null,
    pass varchar2(50) not null,
    visitcount number default 0 not null
);

--���� ������ �Է�
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '������', '�ڷ�� ����1 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '�庸��', '�ڷ�� ����2 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '�̼���', '�ڷ�� ����3 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '������', '�ڷ�� ����4 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '������', '�ڷ�� ����5 �Դϴ�.','����','1234');

commit;




-- ȸ�� ���̺� ����
create table member(
    id varchar2(50) not null,
    pass varchar2(50) not null,
    name varchar2(50) not null,
    birth varchar2(50),
    zipcode varchar2(100) not null,
    address varchar2(200) not null,
    detailaddress varchar2(100) not null,
    chamgo varchar2(50),
    primary key (id)
);


insert into member (id, pass, name, birth, zipcode, address, detailaddress, chamgo) 
values ('wodbs', '1234', '����', '19920424', '06991', '���� ���۱� ���۴��33�� 80', '2��', '(��絿)');



select * from member where id='wodbs' and pass='1234';


create sequence seq_member_num
    increment by 1 --1������
    start with 1   --���۰� 1
    minvalue 1     --�ּҰ� 1
    nomaxvalue     --�ִ��� ���Ѵ�
    nocycle        --��ȯ��������
    nocache;       --ĳ�� �Ⱦ�.






create table members(
    id varchar2(50) not null,
    pass varchar2(50) not null,
    name varchar2(50) not null,
    birth varchar2(50),
    zipcode varchar2(100) not null,
    address varchar2(200) not null,
    detailaddress varchar2(100) not null,
    chamgo varchar2(50),
    primary key (id)
);

commit;

select count(*) from members where id='test' and pass='1234';
 
create table Boards (
    idx number primary key,                             
    id varchar2(30) not null references members(id),   
    title varchar2(200) not null,                    
    content varchar2(2000) not null,                     
    postdate date default sysdate not null,              
    ofile varchar2(200),                
    sfile varchar2(30),  
    downcount number(5)  default 0 not null,                             
    visitcount number default 0 not null                               
);
























