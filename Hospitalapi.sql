PGDMP                         {            hospital_api    15.2    15.2 T    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16900    hospital_api    DATABASE     �   CREATE DATABASE hospital_api WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE hospital_api;
                postgres    false                        3079    16901 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            c           1247    16913    gender_enum    TYPE     E   CREATE TYPE public.gender_enum AS ENUM (
    'male',
    'female'
);
    DROP TYPE public.gender_enum;
       public          postgres    false            f           1247    16918    printed_or_drafted_enum    TYPE     U   CREATE TYPE public.printed_or_drafted_enum AS ENUM (
    'printed',
    'drafted'
);
 *   DROP TYPE public.printed_or_drafted_enum;
       public          postgres    false            i           1247    16924 	   type_enum    TYPE     E   CREATE TYPE public.type_enum AS ENUM (
    'issue',
    'receive'
);
    DROP TYPE public.type_enum;
       public          postgres    false            �            1259    16929    RefreshToken    TABLE     �   CREATE TABLE public."RefreshToken" (
    "Token_id" character varying NOT NULL,
    "userName" character varying,
    refresh_token character varying,
    "isActive" boolean
);
 "   DROP TABLE public."RefreshToken";
       public         heap    postgres    false            �            1259    16934    User    TABLE     �   CREATE TABLE public."User" (
    id integer NOT NULL,
    username character varying,
    password character varying,
    role character varying
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    16939 	   UserLogin    TABLE     �   CREATE TABLE public."UserLogin" (
    "Id" uuid NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    role text NOT NULL
);
    DROP TABLE public."UserLogin";
       public         heap    postgres    false            �            1259    16944    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    postgres    false            �            1259    16947    alembic_version    TABLE     T   CREATE TABLE public.alembic_version (
    version_num character varying NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    16952    bill    TABLE     �  CREATE TABLE public.bill (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    patient_id integer,
    patient_name character varying NOT NULL,
    patient_phone character varying NOT NULL,
    total_amount integer NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    printed_or_drafted character varying,
    patient_address character varying NOT NULL,
    is_cancelled boolean NOT NULL
);
    DROP TABLE public.bill;
       public         heap    postgres    false            �            1259    16957    billitem    TABLE     �  CREATE TABLE public.billitem (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    sales_service_item_id integer,
    name character varying NOT NULL,
    quantity integer NOT NULL,
    uom character varying,
    price integer NOT NULL,
    subtotal integer NOT NULL,
    remark character varying,
    created_user_id integer,
    updated_user_id integer,
    bill_id integer
);
    DROP TABLE public.billitem;
       public         heap    postgres    false            �            1259    16962    category    TABLE       CREATE TABLE public.category (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    description character varying,
    created_user_id integer,
    updated_user_id integer
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16967    closingbilldetail    TABLE       CREATE TABLE public.closingbilldetail (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    daily_closing_id integer,
    bill_id integer,
    amount integer,
    created_user_id integer,
    updated_user_id integer
);
 %   DROP TABLE public.closingbilldetail;
       public         heap    postgres    false            �            1259    16970    closingdepositdetail    TABLE        CREATE TABLE public.closingdepositdetail (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    daily_closing_id integer,
    deposit_id integer,
    amount integer,
    created_user_id integer,
    updated_user_id integer
);
 (   DROP TABLE public.closingdepositdetail;
       public         heap    postgres    false            �            1259    16973    dailyclosing    TABLE     �  CREATE TABLE public.dailyclosing (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    opening_balance integer NOT NULL,
    deposit_total integer NOT NULL,
    bill_total integer NOT NULL,
    grand_total integer NOT NULL,
    actual_amount integer NOT NULL,
    adjusted_amount integer NOT NULL,
    adjusted_reason character varying NOT NULL,
    created_user_id integer,
    updated_user_id integer
);
     DROP TABLE public.dailyclosing;
       public         heap    postgres    false            �            1259    16978    deposit    TABLE     ?  CREATE TABLE public.deposit (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    patient_id integer,
    amount integer NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    remark character varying,
    is_cancelled boolean NOT NULL
);
    DROP TABLE public.deposit;
       public         heap    postgres    false            �            1259    16983    depositused    TABLE     F  CREATE TABLE public.depositused (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    deposit_id integer,
    payment_id integer,
    created_user_id integer,
    updated_user_id integer,
    unpaid_amount integer NOT NULL,
    deposit_amount integer NOT NULL
);
    DROP TABLE public.depositused;
       public         heap    postgres    false            �            1259    16986    inventoryitem    TABLE     �  CREATE TABLE public.inventoryitem (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    balance integer NOT NULL,
    unit character varying NOT NULL,
    purchasing_price integer NOT NULL,
    sales_service_item_id integer,
    expiry_date date,
    batch character varying NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    is_active boolean NOT NULL
);
 !   DROP TABLE public.inventoryitem;
       public         heap    postgres    false            �            1259    16991    inventorytransaction    TABLE     �  CREATE TABLE public.inventorytransaction (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    inventory_item_id integer,
    inventory_item_name character varying NOT NULL,
    transaction_type_name character varying NOT NULL,
    quantity integer NOT NULL,
    unit character varying NOT NULL,
    purchasing_price integer NOT NULL,
    selling_price integer NOT NULL,
    note character varying,
    created_user_id integer,
    updated_user_id integer,
    opening_balance integer NOT NULL,
    closing_balance integer NOT NULL,
    transaction_type character varying NOT NULL
);
 (   DROP TABLE public.inventorytransaction;
       public         heap    postgres    false            �            1259    16996    patient    TABLE     �  CREATE TABLE public.patient (
    id integer NOT NULL,
    name character varying NOT NULL,
    gender character varying,
    date_of_birth date,
    age integer NOT NULL,
    address character varying NOT NULL,
    contact_details character varying NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    created_user_id integer,
    updated_user_id integer
);
    DROP TABLE public.patient;
       public         heap    postgres    false            �            1259    17001    payment    TABLE     �  CREATE TABLE public.payment (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    bill_id integer,
    total_amount integer NOT NULL,
    total_deposit_amount integer NOT NULL,
    collected_amount integer NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    unpaid_amount integer NOT NULL,
    is_outstanding boolean
);
    DROP TABLE public.payment;
       public         heap    postgres    false            �            1259    17004    salesserviceitem    TABLE     E  CREATE TABLE public.salesserviceitem (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying,
    price integer,
    uom_id integer,
    category_id integer,
    created_user_id integer,
    updated_user_id integer,
    is_active boolean
);
 $   DROP TABLE public.salesserviceitem;
       public         heap    postgres    false            �            1259    17009    transactiontype    TABLE       CREATE TABLE public.transactiontype (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    type character varying NOT NULL,
    created_user_id integer,
    updated_user_id integer
);
 #   DROP TABLE public.transactiontype;
       public         heap    postgres    false            �            1259    17014    uom    TABLE       CREATE TABLE public.uom (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    description character varying,
    created_user_id integer,
    updated_user_id integer
);
    DROP TABLE public.uom;
       public         heap    postgres    false            �          0    16929    RefreshToken 
   TABLE DATA           [   COPY public."RefreshToken" ("Token_id", "userName", refresh_token, "isActive") FROM stdin;
    public          postgres    false    215   �w       �          0    16934    User 
   TABLE DATA           >   COPY public."User" (id, username, password, role) FROM stdin;
    public          postgres    false    216   [x       �          0    16939 	   UserLogin 
   TABLE DATA           E   COPY public."UserLogin" ("Id", username, password, role) FROM stdin;
    public          postgres    false    217   �x       �          0    16944    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    218   y       �          0    16947    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    219   �y       �          0    16952    bill 
   TABLE DATA           �   COPY public.bill (id, created_time, updated_time, patient_id, patient_name, patient_phone, total_amount, created_user_id, updated_user_id, printed_or_drafted, patient_address, is_cancelled) FROM stdin;
    public          postgres    false    220   �y       �          0    16957    billitem 
   TABLE DATA           �   COPY public.billitem (id, created_time, updated_time, sales_service_item_id, name, quantity, uom, price, subtotal, remark, created_user_id, updated_user_id, bill_id) FROM stdin;
    public          postgres    false    221   ${       �          0    16962    category 
   TABLE DATA           w   COPY public.category (id, created_time, updated_time, name, description, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    222   �{       �          0    16967    closingbilldetail 
   TABLE DATA           �   COPY public.closingbilldetail (id, created_time, updated_time, daily_closing_id, bill_id, amount, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    223   `|       �          0    16970    closingdepositdetail 
   TABLE DATA           �   COPY public.closingdepositdetail (id, created_time, updated_time, daily_closing_id, deposit_id, amount, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    224   �|       �          0    16973    dailyclosing 
   TABLE DATA           �   COPY public.dailyclosing (id, created_time, updated_time, opening_balance, deposit_total, bill_total, grand_total, actual_amount, adjusted_amount, adjusted_reason, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    225   }       �          0    16978    deposit 
   TABLE DATA           �   COPY public.deposit (id, created_time, updated_time, patient_id, amount, created_user_id, updated_user_id, remark, is_cancelled) FROM stdin;
    public          postgres    false    226   n}       �          0    16983    depositused 
   TABLE DATA           �   COPY public.depositused (id, created_time, updated_time, deposit_id, payment_id, created_user_id, updated_user_id, unpaid_amount, deposit_amount) FROM stdin;
    public          postgres    false    227   V~       �          0    16986    inventoryitem 
   TABLE DATA           �   COPY public.inventoryitem (id, created_time, updated_time, name, balance, unit, purchasing_price, sales_service_item_id, expiry_date, batch, created_user_id, updated_user_id, is_active) FROM stdin;
    public          postgres    false    228   �~       �          0    16991    inventorytransaction 
   TABLE DATA             COPY public.inventorytransaction (id, created_time, updated_time, inventory_item_id, inventory_item_name, transaction_type_name, quantity, unit, purchasing_price, selling_price, note, created_user_id, updated_user_id, opening_balance, closing_balance, transaction_type) FROM stdin;
    public          postgres    false    229   �       �          0    16996    patient 
   TABLE DATA           �   COPY public.patient (id, name, gender, date_of_birth, age, address, contact_details, created_time, updated_time, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    230   ��       �          0    17001    payment 
   TABLE DATA           �   COPY public.payment (id, created_time, updated_time, bill_id, total_amount, total_deposit_amount, collected_amount, created_user_id, updated_user_id, unpaid_amount, is_outstanding) FROM stdin;
    public          postgres    false    231   ��       �          0    17004    salesserviceitem 
   TABLE DATA           �   COPY public.salesserviceitem (id, created_time, updated_time, name, price, uom_id, category_id, created_user_id, updated_user_id, is_active) FROM stdin;
    public          postgres    false    232   �       �          0    17009    transactiontype 
   TABLE DATA           w   COPY public.transactiontype (id, created_time, updated_time, name, type, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    233   ��       �          0    17014    uom 
   TABLE DATA           r   COPY public.uom (id, created_time, updated_time, name, description, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    234   #�       �           2606    17020    UserLogin PK_UserLogin 
   CONSTRAINT     Z   ALTER TABLE ONLY public."UserLogin"
    ADD CONSTRAINT "PK_UserLogin" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."UserLogin" DROP CONSTRAINT "PK_UserLogin";
       public            postgres    false    217            �           2606    17022 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    218            �           2606    17024    RefreshToken RefreshToken_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_pkey" PRIMARY KEY ("Token_id");
 L   ALTER TABLE ONLY public."RefreshToken" DROP CONSTRAINT "RefreshToken_pkey";
       public            postgres    false    215            �           2606    17026    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    216            �           2606    17028 $   alembic_version alembic_version_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkey PRIMARY KEY (version_num);
 N   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkey;
       public            postgres    false    219            �           2606    17030    bill bill_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.bill DROP CONSTRAINT bill_pkey;
       public            postgres    false    220            �           2606    17032    billitem billitem_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.billitem
    ADD CONSTRAINT billitem_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.billitem DROP CONSTRAINT billitem_pkey;
       public            postgres    false    221            �           2606    17034    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    222            �           2606    17036 (   closingbilldetail closingbilldetail_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.closingbilldetail
    ADD CONSTRAINT closingbilldetail_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.closingbilldetail DROP CONSTRAINT closingbilldetail_pkey;
       public            postgres    false    223            �           2606    17038 .   closingdepositdetail closingdepositdetail_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.closingdepositdetail
    ADD CONSTRAINT closingdepositdetail_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.closingdepositdetail DROP CONSTRAINT closingdepositdetail_pkey;
       public            postgres    false    224            �           2606    17040    dailyclosing dailyclosing_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.dailyclosing
    ADD CONSTRAINT dailyclosing_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.dailyclosing DROP CONSTRAINT dailyclosing_pkey;
       public            postgres    false    225            �           2606    17042    deposit deposit_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.deposit DROP CONSTRAINT deposit_pkey;
       public            postgres    false    226            �           2606    17044    depositused depositused_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.depositused
    ADD CONSTRAINT depositused_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.depositused DROP CONSTRAINT depositused_pkey;
       public            postgres    false    227            �           2606    17046     inventoryitem inventoryitem_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.inventoryitem
    ADD CONSTRAINT inventoryitem_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.inventoryitem DROP CONSTRAINT inventoryitem_pkey;
       public            postgres    false    228            �           2606    17048 .   inventorytransaction inventorytransaction_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT inventorytransaction_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT inventorytransaction_pkey;
       public            postgres    false    229            �           2606    17050    patient patient_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.patient DROP CONSTRAINT patient_pkey;
       public            postgres    false    230            �           2606    17052    payment payment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    231            �           2606    17054 &   salesserviceitem salesserviceitem_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.salesserviceitem
    ADD CONSTRAINT salesserviceitem_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.salesserviceitem DROP CONSTRAINT salesserviceitem_pkey;
       public            postgres    false    232            �           2606    17056 $   transactiontype transactiontype_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.transactiontype
    ADD CONSTRAINT transactiontype_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.transactiontype DROP CONSTRAINT transactiontype_pkey;
       public            postgres    false    233            �           2606    17058    uom uom_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.uom
    ADD CONSTRAINT uom_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.uom DROP CONSTRAINT uom_pkey;
       public            postgres    false    234            �           1259    17059 %   fki_salesserviceitem_category_id_fkey    INDEX     i   CREATE INDEX fki_salesserviceitem_category_id_fkey ON public.salesserviceitem USING btree (category_id);
 9   DROP INDEX public.fki_salesserviceitem_category_id_fkey;
       public            postgres    false    232            �           2606    17060    bill bill_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id) NOT VALID;
 C   ALTER TABLE ONLY public.bill DROP CONSTRAINT bill_patient_id_fkey;
       public          postgres    false    3299    220    230            �           2606    17065    billitem billitem_bill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billitem
    ADD CONSTRAINT billitem_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.bill(id) NOT VALID;
 H   ALTER TABLE ONLY public.billitem DROP CONSTRAINT billitem_bill_id_fkey;
       public          postgres    false    3279    221    220            �           2606    17070 ,   billitem billitem_sales_service_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billitem
    ADD CONSTRAINT billitem_sales_service_item_id_fkey FOREIGN KEY (sales_service_item_id) REFERENCES public.salesserviceitem(id) NOT VALID;
 V   ALTER TABLE ONLY public.billitem DROP CONSTRAINT billitem_sales_service_item_id_fkey;
       public          postgres    false    3304    221    232            �           2606    17075 0   closingbilldetail closingbilldetail_bill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.closingbilldetail
    ADD CONSTRAINT closingbilldetail_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.bill(id) NOT VALID;
 Z   ALTER TABLE ONLY public.closingbilldetail DROP CONSTRAINT closingbilldetail_bill_id_fkey;
       public          postgres    false    3279    223    220            �           2606    17080 9   closingbilldetail closingbilldetail_daily_closing_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.closingbilldetail
    ADD CONSTRAINT closingbilldetail_daily_closing_id_fkey FOREIGN KEY (daily_closing_id) REFERENCES public.dailyclosing(id) NOT VALID;
 c   ALTER TABLE ONLY public.closingbilldetail DROP CONSTRAINT closingbilldetail_daily_closing_id_fkey;
       public          postgres    false    225    223    3289            �           2606    17085 ?   closingdepositdetail closingdepositdetail_daily_closing_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.closingdepositdetail
    ADD CONSTRAINT closingdepositdetail_daily_closing_id_fkey FOREIGN KEY (daily_closing_id) REFERENCES public.dailyclosing(id) NOT VALID;
 i   ALTER TABLE ONLY public.closingdepositdetail DROP CONSTRAINT closingdepositdetail_daily_closing_id_fkey;
       public          postgres    false    224    225    3289            �           2606    17090 9   closingdepositdetail closingdepositdetail_deposit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.closingdepositdetail
    ADD CONSTRAINT closingdepositdetail_deposit_id_fkey FOREIGN KEY (deposit_id) REFERENCES public.deposit(id) NOT VALID;
 c   ALTER TABLE ONLY public.closingdepositdetail DROP CONSTRAINT closingdepositdetail_deposit_id_fkey;
       public          postgres    false    226    224    3291            �           2606    17095    deposit deposit_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id) NOT VALID;
 I   ALTER TABLE ONLY public.deposit DROP CONSTRAINT deposit_patient_id_fkey;
       public          postgres    false    226    230    3299            �           2606    17100 '   depositused depositused_deposit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.depositused
    ADD CONSTRAINT depositused_deposit_id_fkey FOREIGN KEY (deposit_id) REFERENCES public.deposit(id) NOT VALID;
 Q   ALTER TABLE ONLY public.depositused DROP CONSTRAINT depositused_deposit_id_fkey;
       public          postgres    false    226    3291    227            �           2606    17105 '   depositused depositused_payment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.depositused
    ADD CONSTRAINT depositused_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) NOT VALID;
 Q   ALTER TABLE ONLY public.depositused DROP CONSTRAINT depositused_payment_id_fkey;
       public          postgres    false    227    3301    231            �           2606    17110 @   inventorytransaction inventorytransaction_inventory_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT inventorytransaction_inventory_item_id_fkey FOREIGN KEY (inventory_item_id) REFERENCES public.inventoryitem(id) NOT VALID;
 j   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT inventorytransaction_inventory_item_id_fkey;
       public          postgres    false    3295    228    229            �           2606    17115    payment payment_bill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.bill(id) NOT VALID;
 F   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_bill_id_fkey;
       public          postgres    false    220    231    3279            �           2606    17120 2   salesserviceitem salesserviceitem_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.salesserviceitem
    ADD CONSTRAINT salesserviceitem_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id) NOT VALID;
 \   ALTER TABLE ONLY public.salesserviceitem DROP CONSTRAINT salesserviceitem_category_id_fkey;
       public          postgres    false    3283    232    222            �           2606    17125 -   salesserviceitem salesserviceitem_uom_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.salesserviceitem
    ADD CONSTRAINT salesserviceitem_uom_id_fkey FOREIGN KEY (uom_id) REFERENCES public.uom(id) NOT VALID;
 W   ALTER TABLE ONLY public.salesserviceitem DROP CONSTRAINT salesserviceitem_uom_id_fkey;
       public          postgres    false    232    234    3308            �   �   x���
�0  ���+A�6���èf���FE/2C�N���>�p [cȰ�(�	po��\����'�S�����zq�k7ʷT�H�	)2���x�i�� �"��6�����/��T0�e��;:�.\��^[��&^!��T?&P�vEq�d�����BW�B��+�D�������ߗ�a|�58�      �   I   x�3�,N,�442615�LL����2�,���4����U\R�X�_� �C����8�R�R!Fq:�Ec���� ��      �   B   x�3NK�0M33�5574�5153�M2NK�5J�43N33KLK4�,N,�442�r&��f�q��qqq ª�      �   u   x���K
�0 е����$ƺv[�u'�AB:�|H�^��^<��1�EKy���\׭�,A����˦�@�c���l���f$���i�}�I�s��1KI�Z�g.7�񧻃1f�p/      �      x������ � �      �   l  x���Kn�0�9�*�x~�����-IZ%�(U�}��6�$B ,���y��APH�J	>2Gb�-��`#M�kK�C��z;n7�q_W��lZT]�l�
���2}A,��\�l"�� x����]4A{��Ժ[)$N�i <k����Z�TͺmN��K5W�D1QH��yʹq@�^�����>T��%h�R�i���޶��#N=��^}���zW}n�{�K3��j�j[}'��KC�i�H�8L�Q��U�՗Z��V�/�ˋF2:�2ٺ{�9���E|��0#�V��9%�(+ο��<���F`V�|_�a���w�i`Na��b�L��Em�#4����`��;ش���J���UE�����      �   `   x�E�;
�0D��)��0�OBrAA;���*df�Ǽ̉,db��%d��-��~����H�]�l�%�ڹ.u[?xW������D���s7v�6      �   �   x�m�1n�0��Y:�����(�<K� r�,q��Co_75��-���GJ�4 d�XC�E�U}A��-�4 [��%r��܂�i������ђƬ����f�Q��e��:4r�[1�T"*$�G��&�*�Ҷ���O���*O�������'~�āOX_������?� L�:�>=���m�������K�      �   D   x�uʹ�0�X�����t��������������,x�gWu؍<�ߐ�+����LU}=I�      �   B   x�uʱ� �ڞ"}z�m̒��H
Z�+O#��
TW��V)��їp1wh�� �
�����S?      �   X   x�]�!�0PݝO������,��p��`�z�B��R��6Ћ��6��{�03��Vy!�Jf�����uL!m%�� ��f      �   �   x����J�0��u��KÙ�Lg&��F��BT�����ܴi����C���x)2WP%�^���q7(�Sa�о�������b���I�PU�f��ܸ���s���ח���[�U�fkU��f�UO�>� 
z}��K��Z)7�8�����	ϝs��)Ȭ ;\~�;=�D'�ׄ��������1�|�Ox�q,�������cN)� �"��      �   C   x�uʱ�0�X�����y�-�Z��2w����h�q�RW#O�
�����h�I{���4��      �   ,  x����N� ���)�7����Y\�ܘ.��Z�_z[��mbY@�a��3#h��8G��W�$��	�2��3jU��DA�,��q;~a��#�{^0@[����ˌ\	*Z"��2{�3�gQ����Jw/��z]�_l1z�*��-?���R�%�(�K����c���T���(���f-�6�?�,c�\�n�K��tOK�3l��9H���tH'+��/@w9CJ�Ҧ,�2�O�W_?o���嫷�;���f�1@���m��RY�����n�Z�i���u�m;c��=�9M��&V�1      �   �   x�u��
�@��٧�]vI2I�Y<n��V|}��Ed ��G>�RVDFTkD�Yf���q�6���v &--�Be!`oP��+�(��� ��E�i��=���_���m�B��R�Uf�in�y�y��-�\�9�^T1f      �     x�u��n�0E��Wh_��ɡVYt�M?�@7D,?�*b�A��#űh׆�"G<3�^*1���ۗ]� Z��б����^�$nAZ��C�8zNH�@��nlW�F=Ь�{��n�O@�9��9�O K�øڑz`��Ҭ �+[�Rђ�;���}{p��4}��1+��S��SM�����X�m��Ns�"9{��{zBn���@|��?L��O1���ٽ��M��5Um[�+M��RgR�!�pR@�c�ġ�T`�Le���-���^˲+�����lw�y؟��*��%ˏW��jk^	Qs�<�yq?N�<�j5Sx��M>b�w)�d�P[�!�o��t�0�RrL�|+x0v�F���|O[#k'�gA��LDq��a��|6rΪp}9��IMKb��`y�ML�`l�|^�77����/�
�4B��M.Ĳc�+��-/6�`�ۯ!R�W�fK����e:��j��*�Mo�t��21�L]��G�Vni��<N��3k����/��-	�      �   H   x�u�A
�0��+�K�f7�ط���E����Q��A���1US�<k�X��a�7(�2*^c�J��Ww��U9      �   �   x�uα
�0������椓���ҵC�N��S\(%�&��Ct
e�%������f�o(�,����y<^rG�#G,�kʤ�a�[��˩��E���ko�@ AF���iW榤�2K+V��qN{��*~�1��f6�      �   �   x�u�=�0�99Ev��'�����])p~*�J���{�]-D34�%�a:���5�l�b�[�'nC| TJ��{�aY����N@Ժ�_щ�lGQ�}�����vR�b�T͞��@'�o�ì__^)���/2q      �     x�}��n�0E���������iwݠQ$���DC��F�F����&`dY���,SF,�!�s3��������?��2Z-<Y�Xȥ����H�h������/쳰K�SdH%���gb�����T&�̍CJ)�s!`����S���fz ���XB���x�6Ea�ڟm��ْ���	1S��;"N�YR-+@7[����]�m��v3�[(p#�(�'W���yZ@��],�_�]�bA@L��@��f�L��t�/AҊ�6��~72����}8c��     