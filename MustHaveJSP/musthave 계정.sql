-- 테이블 목록 조회
select * from tab;

drop table member;
drop table board;
drop sequence seq_board_num;

-- 회원 테이블 생성
create table member(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key (id)
);

-- 모델 1 방식의 게시판 테이블 생성
create table board(
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcount number(6)
);

-- 외래키 설정
alter table board
    add constraint board_mem_fk foreign key(id)
    references member (id);

-- 시퀀스 생성
create sequence seq_board_num
    increment by 1 --1씩증가
    start with 1   --시작값 1
    minvalue 1     --최소값 1
    nomaxvalue     --최댓값은 무한대
    nocycle        --순환하지않음
    nocache;       --캐시 안씀.
    
--더미 데이터 입력
insert into member (id, pass, name) values ('musthave', '1234', '머스트해브');
insert into board  (num, title, content, id, postdate, visitcount)
    values(seq_board_num.nextval, '제목1입니다', '내용1입니다',
    'musthave', sysdate, 0);
commit;

select count(*) from board where title like'%2%';
select * from board where title like '%1%';

INSERT INTO board VALUES (seq_board_num.nextval, '지금은 봄입니다', '봄의왈츠', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 여름입니다', '여름향기', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 가을입니다', '가을동화', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 겨울입니다', '겨울연가', 'musthave', sysdate, 0);

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

--12장 파일 업로드
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

--모델2 방식의 파일첨부형 게시판 테이블 생성
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

--더미 데이터 입력
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '장보고', '자료실 제목2 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '이순신', '자료실 제목3 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '대조영', '자료실 제목5 입니다.','내용','1234');

commit;




-- 회원 테이블 생성
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
values ('wodbs', '1234', '재윤', '19920424', '06991', '서울 동작구 동작대로33길 80', '2층', '(사당동)');



select * from member where id='wodbs' and pass='1234';


create sequence seq_member_num
    increment by 1 --1씩증가
    start with 1   --시작값 1
    minvalue 1     --최소값 1
    nomaxvalue     --최댓값은 무한대
    nocycle        --순환하지않음
    nocache;       --캐시 안씀.






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
























