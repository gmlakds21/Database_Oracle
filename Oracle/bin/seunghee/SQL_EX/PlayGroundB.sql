Create table regions (
    region_id 	int,
    region_name varchar(1000)
);

Create table countries (
    country_id   varchar(1000),
    country_name varchar(1000),
    region_id	 int
);

Create table locations (
    location_id		int,
    street_address  varchar(1000),
    postal_code		varchar(1000),
    city			varchar(1000),
    state_province	varchar(1000),
    country_id		varchar(1000)
);

Create table departments (
    department_id	int,
    department_name	varchar(1000),
    manager_id		int,
    location_id		int
);

Create table jobs (
    job_id		varchar(1000),
    job_title	varchar(1000),
    min_salary	int,
    max_salary	int
);

Create table employees (
    employee_id		int,
    first_name		varchar(1000),
    last_name		varchar(1000),
    email			varchar(1000),
    phone_number 	varchar(1000),
    hire_date		date,
    job_id			varchar(1000),
    salary			int,
    commission_pct	decimal(20,10),
    manager_id		int,
    department_id	int
);

Create table job_history (
    employee_id		int,
    start_date		date,
    end_date		date,
    job_id			varchar(1000),
    department_id	int
);

--

Create table warehouses (
    warehouse_id	int,
    warehouse_spec	varchar(1000),
    warehouse_name	varchar(1000),
    location_id		int,
    wh_geo_location	varchar(1000)
);

Create table product_information (
    product_id			int,
    product_name		varchar(1000),
    product_description	varchar(1000),
    category_id			int,
    weight_class		int,
    warranty_period		varchar(1000),
    supplier_id			int,
    product_status		varchar(1000),
    list_price			int,
    min_price			int,
    catalog_url			varchar(1000)
);

Create table inventories (
    product_id			int,
    warehouse_id		int,
    quantity_on_hand	varchar(1000)
);

Create table product_descriptions(
    product_id				int,
    language_id				varchar(1000),
    translated_name			varchar(1000),
    translated_description  varchar(1000)
);

Create table customers (
    customer_id		int,
    cust_first_name	varchar(1000),
    cust_last_name	varchar(1000),
    cust_address	varchar(1000),
    phone_numbers	varchar(1000),
    nls_language	varchar(1000),
    nls_territory	varchar(1000),
    credit_limit	int,
    cust_email		varchar(1000),
    account_mgr_id	int,
    cust_geo_location	varchar(1000),
    date_of_birth	date,
    marital_status	varchar(1000),
    gender			varchar(1000),
    income_level	varchar(1000)
);

Create table orders (
    order_id		int,
    order_date		date,
    order_mode		varchar(1000),
    customer_id		int,
    order_status	int,
    order_total		decimal(20,10),
    sales_rep_id	int,
    promotion_id	varchar(1000)
);

Create table order_items (
    order_id	  int,
    line_item_id  int,
    product_id	  int,
    unit_price	  decimal(20,10),
    quantity	  int
);

--

alter table regions
    add constraint pk_reg primary key (region_id);
    
alter table countries
    add constraint pk_cou		primary key (country_id);
alter table countries
    add constraint fk_cou_reg 	foreign key (region_id) references regions (region_id);
    
alter table locations
    add constraint pk_loc	  primary key (location_id);
alter table locations
    add constraint fk_loc_cou foreign key (country_id) references countries (country_id);

alter table departments
    add constraint pk_dep	  primary key (department_id);
alter table departments
    add constraint fk_dep_loc foreign key (location_id) references locations (location_id);

alter table jobs
    add constraint pk_job	primary key (job_id);

alter table employees
    add constraint pk_emp	  primary key (employee_id);
alter table employees
    add constraint fk_emp_dep foreign key (department_id) 	references departments (department_id);
alter table employees
    add constraint fk_emp_job foreign key (job_id) 			references jobs (job_id);
alter table employees
    add constraint fk_emp_emp foreign key (manager_id) 		references employees (employee_id);

alter table job_history
    add constraint pk_jobh 	  primary key (employee_id, start_date);
alter table job_history
    add constraint fk_jobh_emp foreign key (employee_id)		references employees (employee_id);
alter table job_history
    add constraint fk_jobh_dep foreign key (department_id) 	references departments (department_id);
alter table job_history
    add constraint fk_jobh_job foreign key (job_id) 			references jobs (job_id);

--

alter table warehouses
    add constraint pk_war 	  primary key (warehouse_id);
alter table warehouses
    add constraint fk_war_loc foreign key (location_id) references locations (location_id);

alter table product_information
    add constraint pk_pro	primary key (product_id);

alter table inventories
    add constraint pk_inv	  primary key (product_id);
alter table inventories
    add constraint fk_inv_war foreign key (warehouse_id) references warehouses (warehouse_id);
alter table inventories
    add constraint fk_inv_pro foreign key (product_id)	 references product_information (product_id);

alter table product_descriptions
    add constraint pk_proDes	  primary key (product_id, language_id);
alter table product_descriptions
    add constraint fk_proDes_pro foreign key (product_id) references product_information (product_id);

alter table customers
    add constraint pk_cus 	  primary key (customer_id);
alter table customers
    add constraint fk_cus_emp foreign key (account_mgr_id) references employees (employee_id);

alter table orders
    add constraint pk_ord	  primary key (order_id);
alter table orders
    add constraint fk_ord_cus foreign key (customer_id)  references customers (customer_id);
alter table orders
    add constraint fk_ord_emp foreign key (sales_rep_id) references employees (employee_id);

alter table order_items
    add constraint pk_ordItm 	  primary key (order_id);
alter table order_items
    add constraint fk_ordItmm_pro foreign key (product_id) references product_information (product_id);
alter table order_items
    add constraint fk_ordItm_ord foreign key (order_id)   references orders (order_id);