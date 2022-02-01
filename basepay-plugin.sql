create table basepay_hpp_requests (
  record_id serial
, kb_account_id char(36) not null
, kb_payment_id char(36) default null
, kb_payment_transaction_id char(36) default null
, telephone_number varchar(15) not null
, callback_url varchar(250) not null
, amount int default null
, created_at timestamp not null default current_timestamp
, kb_tenant_id char(36) not null
, primary key(record_id)
) /*! CHARACTER SET utf8 COLLATE utf8_bin */;
create index basepay_hpp_requests_kb_account_id on basepay_hpp_requests(kb_account_id);
create index basepay_hpp_requests_kb_payment_transaction_id on basepay_hpp_requests(kb_payment_transaction_id);

create table basepay_responses (
  record_id serial
, kb_account_id char(36) not null
, kb_payment_id char(36) not null
, kb_payment_transaction_id char(36) not null
, transaction_type varchar(32) not null
, amount numeric(15,9)
, currency char(3)
, basepay_id varchar(255) not null
, additional_data longtext default null
, created_at timestamp not null default current_timestamp
, kb_tenant_id char(36) not null
, primary key(record_id)
) /*! CHARACTER SET utf8 COLLATE utf8_bin */;
create index basepay_responses_kb_payment_id on basepay_responses(kb_payment_id);
create index basepay_responses_kb_payment_transaction_id on basepay_responses(kb_payment_transaction_id);
create index basepay_responses_basepay_id on basepay_responses(basepay_id);

create table basepay_payment_methods (
  record_id serial
, kb_account_id char(36) not null
, kb_payment_method_id char(36) not null
, basepay_id varchar(255) not null
, is_default smallint not null default 0
, is_deleted smallint not null default 0
, additional_data longtext default null
, created_at timestamp not null default current_timestamp
, updated_date datetime not null
, kb_tenant_id char(36) not null
, primary key(record_id)
) /*! CHARACTER SET utf8 COLLATE utf8_bin */;
create unique index basepay_payment_methods_kb_payment_id on basepay_payment_methods(kb_payment_method_id);
create index basepay_payment_methods_basepay_id on basepay_payment_methods(basepay_id);