-- Create test database:
CREATE DATABASE yadaguru_test WITH OWNER=yadaguru
                                        LC_COLLATE='en_US.utf8'
                                        LC_CTYPE='en_US.utf8'
                                        ENCODING='UTF8'
                                        TEMPLATE=template0;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: AdminUsers; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "AdminUsers" (
    id integer NOT NULL,
    "userName" character varying(255),
    password character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."AdminUsers" OWNER TO yadaguru;

--
-- Name: AdminUsers_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "AdminUsers_id_seq"
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AdminUsers_id_seq" OWNER TO yadaguru;

--
-- Name: AdminUsers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yadaguru
--

ALTER SEQUENCE "AdminUsers_id_seq" OWNED BY "AdminUsers".id;


--
-- Name: BaseReminders; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "BaseReminders" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "categoryId" integer NOT NULL,
    message text NOT NULL,
    detail text NOT NULL,
    "lateMessage" text,
    "lateDetail" text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "smsMessage" character varying(255)
);


ALTER TABLE public."BaseReminders" OWNER TO yadaguru;

--
-- Name: BaseRemindersTimeframes; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "BaseRemindersTimeframes" (
    "BaseReminderId" integer NOT NULL,
    "TimeframeId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."BaseRemindersTimeframes" OWNER TO yadaguru;

--
-- Name: BaseReminders_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "BaseReminders_id_seq"
    START WITH 31
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BaseReminders_id_seq" OWNER TO yadaguru;

--
-- Name: BaseReminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yadaguru
--

ALTER SEQUENCE "BaseReminders_id_seq" OWNED BY "BaseReminders".id;


--
-- Name: Categories; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "Categories" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Categories" OWNER TO yadaguru;

--
-- Name: Categories_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Categories_id_seq"
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Categories_id_seq" OWNER TO yadaguru;

--
-- Name: Categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yadaguru
--

ALTER SEQUENCE "Categories_id_seq" OWNED BY "Categories".id;


--
-- Name: ContentItems; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "ContentItems" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."ContentItems" OWNER TO yadaguru;

--
-- Name: ContentItems_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "ContentItems_id_seq"
    START WITH 16
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ContentItems_id_seq" OWNER TO yadaguru;

--
-- Name: ContentItems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yadaguru
--

ALTER SEQUENCE "ContentItems_id_seq" OWNED BY "ContentItems".id;


--
-- Name: Reminders; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "Reminders" (
    id integer NOT NULL,
    timeframe character varying(255) NOT NULL,
    "dueDate" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "schoolId" integer NOT NULL,
    "userId" integer NOT NULL,
    "baseReminderId" integer NOT NULL,
    "isSent" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."Reminders" OWNER TO yadaguru;

--
-- Name: Reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Reminders_id_seq"
    START WITH 44
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Reminders_id_seq" OWNER TO yadaguru;

--
-- Name: Reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yadaguru
--

ALTER SEQUENCE "Reminders_id_seq" OWNED BY "Reminders".id;


--
-- Name: Schools; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "Schools" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    name character varying(255) NOT NULL,
    "dueDate" timestamp with time zone NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Schools" OWNER TO yadaguru;

--
-- Name: Schools_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Schools_id_seq"
    START WITH 68
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Schools_id_seq" OWNER TO yadaguru;

--
-- Name: Schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yadaguru
--

ALTER SEQUENCE "Schools_id_seq" OWNED BY "Schools".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO yadaguru;

--
-- Name: TestDates; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "TestDates" (
    id integer NOT NULL,
    "registrationDate" timestamp with time zone NOT NULL,
    "adminDate" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "testId" integer NOT NULL
);


ALTER TABLE public."TestDates" OWNER TO yadaguru;

--
-- Name: TestDates_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "TestDates_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TestDates_id_seq" OWNER TO yadaguru;

--
-- Name: TestDates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yadaguru
--

ALTER SEQUENCE "TestDates_id_seq" OWNED BY "TestDates".id;


--
-- Name: Tests; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "Tests" (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    "adminMessage" text NOT NULL,
    "adminDetail" text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "registrationMessage" text DEFAULT ''::text NOT NULL,
    "registrationDetail" text DEFAULT ''::text NOT NULL
);


ALTER TABLE public."Tests" OWNER TO yadaguru;

--
-- Name: Tests_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Tests_id_seq"
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tests_id_seq" OWNER TO yadaguru;

--
-- Name: Tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yadaguru
--

ALTER SEQUENCE "Tests_id_seq" OWNED BY "Tests".id;


--
-- Name: Timeframes; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "Timeframes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    formula character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Timeframes" OWNER TO yadaguru;

--
-- Name: Timeframes_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Timeframes_id_seq"
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Timeframes_id_seq" OWNER TO yadaguru;

--
-- Name: Timeframes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yadaguru
--

ALTER SEQUENCE "Timeframes_id_seq" OWNED BY "Timeframes".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    "phoneNumber" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "confirmCode" character varying(255),
    "confirmCodeTimestamp" timestamp with time zone,
    "sponsorCode" character varying(255)
);


ALTER TABLE public."Users" OWNER TO yadaguru;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 38
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO yadaguru;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yadaguru
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "AdminUsers" ALTER COLUMN id SET DEFAULT nextval('"AdminUsers_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "BaseReminders" ALTER COLUMN id SET DEFAULT nextval('"BaseReminders_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "Categories" ALTER COLUMN id SET DEFAULT nextval('"Categories_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "ContentItems" ALTER COLUMN id SET DEFAULT nextval('"ContentItems_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "Reminders" ALTER COLUMN id SET DEFAULT nextval('"Reminders_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "Schools" ALTER COLUMN id SET DEFAULT nextval('"Schools_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "TestDates" ALTER COLUMN id SET DEFAULT nextval('"TestDates_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "Tests" ALTER COLUMN id SET DEFAULT nextval('"Tests_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "Timeframes" ALTER COLUMN id SET DEFAULT nextval('"Timeframes_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Data for Name: AdminUsers; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "AdminUsers" (id, "userName", password, "createdAt", "updatedAt") FROM stdin;
1	yadamin	$2a$10$HUcIXxmUdS0DPVTZlelpv.MgSK0UcNJ67ThOMh/NMYutQf8mJwX0i	2016-11-30 22:42:25.953-05	2016-11-30 22:42:25.953-05
\.


--
-- Name: AdminUsers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"AdminUsers_id_seq"', 1, true);


--
-- Data for Name: BaseReminders; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "BaseReminders" (id, name, "categoryId", message, detail, "lateMessage", "lateDetail", "createdAt", "updatedAt", "smsMessage") FROM stdin;
18	Ask Counselor for Recommendation	8	Have you asked your counselor to fill out any Secondary School report or a recommendation for you?	<p>Follow any instructions regarding Secondary School Reports, Counselor Forms, or other recommendations, if  required by %SCHOOL%.  You may need to download and print a physical copy, or provide your counselor with a link, if online. <br/><br/><i><b>NOTE:</b> If you are using <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a></i>, <i>make sure you have successfully &#34;invited&#34; your counselor to upload their recommendation for you.</i></p>	Have you asked your counselor to fill out any Secondary School report or a recommendation for you?	<p></p><p>Follow any instructions regarding Secondary School Reports, Counselor Forms, or other recommendations, if  required by %SCHOOL%.  You may need to download and print a physical copy, or provide your counselor with a link, if online. <br/><br/><i><b>NOTE:</b> If you are using <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a></i>, <i>make sure you have successfully &#34;invited&#34; your counselor to upload their recommendation for you.</i></p><p><i></i></p><p></p>	2016-11-10 23:51:21.187-05	2016-11-10 23:51:21.187-05	Ask Counselor for Recommenda
6	Remind Recommenders	8	<p>Check in with your teachers by %Reminder_Date% about the status of %SCHOOL% recommendations.</p>	<p>Your recommenders are usually very busy humans.  A gentle and kind reminder will help them get their recommendation in on time. </p><p>Remember, it is a <i>privilege</i> to have someone write such nice things about you.  Be sure to thank them for their time!</p>	Do you know where your %SCHOOL% recommendations are?	<p>Your recommenders are usually very busy humans.  A gentle and kind reminder will help them get their recommendation in on time. Remember, it is a privilege to have someone write such nice things about you! Be sure to thank them for their time!</p><h5><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h5><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accomodate you. </li></ol>	2016-11-10 23:51:21.187-05	2016-12-27 17:04:26.074-05	Remind Recommenders
30	Register for Tests	10	<p>Figure out when you should register to take your standardized test (SAT, SAT Subject Test, ACT).</p>	<p>Most schools will want to you to demonstrate your knowledge by taking one or more standardized tests.  Check with the admissions offices of schools you are applying to find out what they require.  The best time to take the tests is in the summer between junior and senior year, and very early fall of your senior year.  The tests are tough, not only because you have to know a lot, but because they take a long time to finish, usually 3 -5 hours.  It's hard to stay focused for that length of time, even with a break.   You can think of taking the tests like this:</p><ul><li>Prep and Practice</li><li>Register and Send</li><li>Take</li></ul><p><b>Start Prep and Practice in your junior year. </b> And yes, practice mean sitting for three hours and practicing a full test. Also - you probably want to walk around with a stack of vocubulary words to practice.  There are lots of SAT/ACT books and practices sites, so get familiar with those and practice, practice practice.</p><p><br/></p><p><b>Register at least a month early before the test date.</b>   First, you'll have to pay to take the test.  So you'll want to either plan for that or yourself or tell someone who is helping with the cost.  Second, you have to register at least a month in advance for the test.  When you register, <b>be sure to have your scores sent to the schools of your choice.</b>   </p><p><br/></p><p><b>Take. Don't Forget Your Test! </b> We at Yadaguru are working on ways to help you remember.  One thing we'll do is bug you about it 90 days before your application submission date.  But honestly, it's a shame how many kids forget they are taking the SAT or ACT on the day of test! Don't let that be you!</p><p><br/></p><p>Here are the Registration and Test Dates for the SAT<a href=" https://collegereadiness.collegeboard.org/sat/register/dates-deadlines" target=""> https://collegereadiness.collegeboard.org/sat/register/dates-deadlines</a></p><p>Here are the Registration and Test Dates for the ACT <a href="http://www.act.org/content/act/en/products-and-services/the-act/taking-the-test.html#testdates" target="">http://www.act.org/content/act/en/products-and-services/the-act/taking-the-test.html#testdates</a></p><p><br/></p><p><br/></p>	<p>Figure out when you should register to take your standardized test (SAT, SAT Subject Test, ACT).<br/></p>	<p style="font-size: 14px;">Most schools will want to you to demonstrate your knowledge by taking one or more standardized tests.  Check with the admissions offices of schools you are applying to find out what they require.  The best time to take the tests is in the summer between junior and senior year, and very early fall of your senior year.  The tests are tough, not only because you have to know a lot, but because they take a long time to finish, usually 3 -5 hours.  It's hard to stay focused for that length of time, even with a break.   You can think of taking the tests like this:</p><ul style="font-size: 14px;"><li>Prep and Practice</li><li>Register and Send</li><li>Take</li></ul><p style="font-size: 14px;"><b>Start Prep and Practice in your junior year. </b> And yes, practice mean sitting for three hours and practicing a full test. Also - you probably want to walk around with a stack of vocubulary words to practice.  There are lots of SAT/ACT books and practices sites, so get familiar with those and practice, practice practice.</p><p style="font-size: 14px;"><br/></p><p style="font-size: 14px;"><b>Register at least a month early before the test date.</b>   First, you'll have to pay to take the test.  So you'll want to either plan for that or yourself or tell someone who is helping with the cost.  Second, you have to register at least a month in advance for the test.  When you register, <b>be sure to have your scores sent to the schools of your choice.</b>   </p><p style="font-size: 14px;"><br/></p><p style="font-size: 14px;"><b>Take. Don't Forget Your Test! </b> We at Yadaguru are working on ways to help you remember.  One thing we'll do is bug you about it 90 days before your application submission date.  But honestly, it's a shame how many kids forget they are taking the SAT or ACT on the day of test! Don't let that be you!</p><p style="font-size: 14px;"><br/></p><p style="font-size: 14px;">Here are the Registration and Test Dates for the SAT<a href="https://collegereadiness.collegeboard.org/sat/register/dates-deadlines" target="" style="background-color: transparent;color: rgb(51, 122, 183);"> https://collegereadiness.collegeboard.org/sat/register/dates-deadlines</a></p><p style="font-size: 14px;">Here are the Registration and Test Dates for the ACT <a href="http://www.act.org/content/act/en/products-and-services/the-act/taking-the-test.html#testdates" target="" style="background-color: transparent;color: rgb(51, 122, 183);">http://www.act.org/content/act/en/products-and-services/the-act/taking-the-test.html#testdates</a></p>	2016-12-27 16:33:19.427-05	2016-12-27 17:57:09.499-05	Register for Tests
19	Request Transcripts	2	Request your transcripts to be sent to %SCHOOL%	<p>It's only 60 days until your application for %SCHOOL% is due!<br/><br/>Make sure you know the process, get any proper paperwork, and follow the directions of your high school regarding transcript release. They'll probably need a mailing address for the %SCHOOL% admissions office, too, so go prepared!<br/><i><br/></i></p><p><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p>	Have your requested your transcripts be sent to %SCHOOL%?	<p>Your transcript is essential:  %SCHOOL% can't process your application without it!</p><p>Make sure you know the process, get any proper paperwork, and follow the directions of your high school regarding transcript release. They'll probably need a mailing address for the %SCHOOL% admissions office, too, so go prepared.  </p><p><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><h4>You're probably a little a little late with this one.</h4><p>If you're seeing this message it's because you've passed YadaGuru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accommodate you. </li></ol>	2016-11-10 23:51:21.187-05	2016-11-10 23:51:21.187-05	Request Transcripts
20	Request Transcripts	2	Have you requested your transcripts be sent to %SCHOOL% yet?	<p>It's only 21 days until your application for %SCHOOL% is due!<br/><br/>Make sure you know the process, get any proper paperwork, and follow the directions of your high school regarding transcript release. They'll probably need a mailing address for the %SCHOOL% admissions office, too, so go prepared!<br/><br/><i>NOTE<b>: </b>If this university uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p>	Have you requested your transcripts yet?	<p>Your deadline is approaching!</p><p>Make sure you know the process, get any proper paperwork, and follow the directions of your high school regarding transcript release. They'll probably need a mailing address for the %SCHOOL% admissions office, too, so go prepared!</p><p><i>NOTE<b>: </b>If this university uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><p></p><h5><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h5><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accomodate you. </li></ol>	2016-11-10 23:51:21.187-05	2016-12-27 17:08:48.968-05	Request Transcripts
14	Deliver Forms	2	Deliver needed forms for %SCHOOL% to your Recommenders and Counselors.	<p></p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"></p><p>Hopefully, you have already asked teachers and your counselor if they will write recommendations. You should give each one of them all the information they need to complete a recommendation.  This usually includes:</p><ul><li>Recommendation questions (if any) or in some cases, printed recommendation forms</li><li>Due date(s) of your application</li><li>Stamped, pre-addressed envelopes*</li><li>Any other important directions</li><li>A copy of your resume or activities list (This will help them brag about you!)</li></ul><div><br/></div><div><i>*NOTE: If the school you are applying to has an online application system for recommendations, then you do not need any envelopes or stamps. Just make sure that your recommenders know how to login to submit their recommendation.</i><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><i></i></p></div>	Deliver needed forms for %SCHOOL% to your Recommenders and Counselors	<p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"></p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"></p><p>Hopefully, you have already asked teachers and your counselor if they will write recommendations. You should give each one of them all the information they need to complete a recommendation. This usually includes:</p><div><ul><li>Recommendation questions (if any) or in some cases, printed recommendation forms</li><li>Due date(s) of your application</li><li>Stamped, pre-addressed envelopes*</li><li>Any other important directions</li><li>A copy of your resume or activities list (This will help them brag about you!)</li></ul><i>*NOTE: If the school you are applying to has an online application system for recommendations, then you do not need any envelopes or stamps. Just make sure that your recommenders know how to login to submit their recommendation.</i></div><div><i><br/></i></div><div><i><br/></i></div><h4><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h4><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accomodate you. </li></ol>	2016-11-10 23:51:21.187-05	2016-12-27 17:57:47.65-05	Deliver Forms
1	Start your Application	2	<p>%SCHOOL%'s application is due %APPLICATION_DATE%.  <b>It's now 90 days before the application is due</b>.  Time to get a move on. <br/></p>	<h4>ONLINE, COMMON APPLICATION, EDU,Inc. or UNIVERSAL APPLICATION? </h4><p>%SCHOOL%'s application is due %APPLICATION_DATE%.  <b>It's now 90 days before the application is due. </b> So...time to get a move on.  Start the application by going to the school's website and becoming really familiar with what you need to do.  Then use our reminders to help remind you along the way.  Good luck grasshopper!  You can do this!</p><p>You should log into the online application system for this school and create a user, fill in your basic information and get your application started. </p><p>If %SCHOOL% uses Common Application, you should create an account on <a href="http://www.commonapp.org" target="">http://www.commonapp.org.</a>  If %SCHOOL% uses EDU, Inc. Common Black College Application, you should create an account on <a href="http://www.eduinconline.com/" target="">http://www.eduinconline.com/</a>.  If %SCHOOL% uses Universal Application, you should create an account on  <a href="http://www.universalcollegeapp.com/" target="">http://www.universalcollegeapp.com/</a>. </p><p><br/></p><h4>PAPER APPLICATION? </h4><p>If you're submitting a <b>PAPER APPLICATION,</b> download, print and/or start filling it out. Sometimes your online or print application will require an essay to be submitted with it, so make sure you check.  If you're unsure about any parts of the application, call %SCHOOL%'s admissions office to make sure you're filling it out properly.<br/></p>	Have you started your %SCHOOL% application yet?	<h4>ONLINE, COMMON APPLICATION, EDU,Inc. or UNIVERSAL APPLICATION? </h4><p>You should log into the online application system for this school and create a user, fill in your basic information and get your application started. </p><p>If %SCHOOL% uses Common Application, you should create an account on <a href="http://www.commonapp.org" target="">http://www.commonapp.org.</a>  If %SCHOOL% uses EDU, Inc. Common Black College Application, you should create an account on <a href="http://www.eduinconline.com/" target="">http://www.eduinconline.com/</a>.  If %SCHOOL% uses Universal Application, you should create an account on  <a href="http://www.universalcollegeapp.com/" target="">http://www.universalcollegeapp.com/</a>. </p><p><br/></p><h4>PAPER APPLICATION? </h4><p>If you're submitting a <b>PAPER APPLICATION,</b> download, print and/or start filling it out. Sometimes your online or print application will require an essay to be submitted with it, so make sure you check.  If you're unsure about any parts of the application, call %SCHOOL%'s admissions office to make sure you're filling it out properly.<br/></p>	2016-11-10 23:51:21.187-05	2016-12-27 17:05:14.586-05	Start your Application
15	Know your Application	2	Visit %SCHOOL%'s website and get familiar with their application process.	<p>You need to take note of key things like deadlines, essay requirements, how they want to receive your application, etc. Get organized and make sure you know <i><b>exactly</b> </i>what the school expects. Applications that are not completed properly may not even be considered.</p>	Visit %SCHOOL%'s website and get familiar with their application process.	<p>If you haven't already, s<span style="color: rgb(85, 85, 85);float: none;background-color: rgb(255, 255, 255);">pend some quality time</span> on %SCHOOL%'s website. You need to take note of key things: <i>deadlines, essay requirements, how they want to receive your application, etc.</i> Your main goal here is to get organized and make sure you know <b><i>exactly</i></b> what the school expects. Applications that are not completely properly may not be considered!</p><h4><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h4><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?  Hustle!  Try to get this done asap!</p>	2016-11-10 23:51:21.187-05	2016-12-27 18:01:39.589-05	Know your Application
4	Start Essays	9	Start getting familiar with %SCHOOL% essay questions as soon as possible.	<p>Start your essays early! </p><p>If %SCHOOL% has posted essay questions, start this in the summer, if you can. </p><p>Search online for successful college essays and get a feel for how long they are, how much content they have, and the tone. <span style="color: rgb(85, 85, 85);float: none;background-color: rgb(255, 255, 255);">Read and re-read what's required and start to think about what you will write. </span></p>	Start writing your essays right away!	Essays are usually the hardest and most time-consuming part of the application, so you should get started as soon as possible.  Read and re-read what's required for %SCHOOL% and start to think about how you will answer the essays. Be careful to note the number of essays required!	2016-11-10 23:51:21.187-05	2016-11-30 22:46:27.316-05	Start Essays
2	Notify Counselor	8	Have you asked your counselor to fill out any Secondary School report or a recommendation for you?	<p>On %REMINDER_DATE%, you only have 30 days before your application is due, and recommendations take time. All of your recommenders are busy people, so if you haven't, you should get this to them ASAP! </p><p>Four weeks is a courteous standard for any recommendations, but the sooner the better. Follow any instructions regarding Secondary School Reports, Counselor Forms, or other recommendations, if required by %SCHOOL%. You may need to download and print a physical copy, or provide your counselor with a link, if online. </p><p><title></title></p><p class="p1"><i>NOTE: If you are using </i><a href="https://www.commonapp.org/"><i>Common App</i></a><i> or </i><a href="https://www.universalcollegeapp.com/"><i>Universal Application</i></a><i>,make sure you have successfully &#34;invited&#34; your counselor to upload their recommendation for you.</i></p><p></p>	Have you already asked your counselors to fill out any Secondary School reports or recommendations, if required?	<p>If the answer is no, you're a bit behind schedule. </p><p>All of your recommenders are busy people, so you should get any Secondary School Reports, Counselor Forms, or other recommendations, if required by %SCHOOL% to your counselors ASAP! </p><p>Two weeks is a courteous standard for any recommendations...and it seems you have less than that. Check with your counselor if he/she can still get this done for you. Say please and thank you!</p><p><i><i style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);">NOTE: If you are using </i><a href="https://www.commonapp.org/" style="color: rgb(51, 122, 183);background-color: rgb(255, 255, 255);"><i>Common App</i></a><i style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"> or </i><a href="https://www.universalcollegeapp.com/" style="color: rgb(51, 122, 183);background-color: rgb(255, 255, 255);"><i>Universal Application</i></a><i style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);">,make sure you have successfully &#34;invited&#34; your counselor to upload their recommendation for you.</i></i></p><p></p>	2016-11-10 23:51:21.187-05	2016-12-27 17:06:09.643-05	Notify Counselor
23	Essay Reminder	9	Check your progress on your required and optional essays.	<p>It's only a month until %SCHOOL%'s deadline!</p><p>If you haven't, be sure to write an essay draft and get some feedback from a teacher or other objective adult who can offer some constructive criticism. </p><p>Check out our <a href="http://yadaguru.com/#/faqs" target="">FAQs</a> for links on essay writing.</p>	Check your progress on your required and optional essays.	<p>Your deadline is coming quickly!<br/></p><p>If you haven't, be sure to write an essay draft and get some feedback from a teacher or other objective adult who can offer some constructive criticism. </p><p>Check out our <a href="http://yadaguru.com/#/faqs" target="">FAQs</a> for links on essay writing.</p><p></p><p></p><p></p>	2016-11-10 23:51:21.187-05	2016-11-10 23:51:21.187-05	Essay Reminder
25	Essay Reminder	9	How are those essays for %SCHOOL% coming?	<p>If you have essays to do for %SCHOOL%, you've got 60 days until your application is due. </p><p>Do you have a first and maybe second draft done yet? Identify a knowledgeable adult who can help you edit your essays so that they really reflect what you want to share.</p><p><span class=""><i>NOTE</i><b>:</b></span><i><b> </b>If you're writing the Common Application essays, beware of &#34;stealth&#34; questions; sometimes additional questions pop up after you've answered another...and they can really require some thought! The sooner you tackle the essay portions, the better off you'll be when dealing with those questions.</i></p>	How are those %SCHOOL% essays coming along?	<p>If you have essays to do for %SCHOOL%, you've got 60 days until your application is due. </p><p>Do you have a first and maybe second draft done yet? Identify a knowledgeable adult who can help you edit your essays so that they really reflect what you want to share.</p><p><span class=""><i>NOTE</i><b>:</b></span><i><b> </b>If you're writing the Common Application essays, beware of &#34;stealth&#34; questions; sometimes additional questions pop up after you've answered another...and they can really require some thought! The sooner you tackle the essay portions, the better off you'll be when dealing with those questions.</i></p>	2016-11-10 23:51:21.187-05	2016-11-10 23:51:21.187-05	Essay Reminder
26	FAFSA Opens	1	FREE Application for Federal Student Aid opens on October 1	<p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"></p><p><title></title></p><p class="p1"><span class="s1">Now that maybe you've finished most of your college applications, you have the task of figuring out how to pay for it! If you are a U.S. citizen, you should most definitely fill out the Free Application for Federal Student Aid -- even if you think you won't receive anything! <br/><br/>If you are attending college during the summer/fall of 2017, you can apply as early as October 1, 2016! While the federal deadline for filing the FAFSA is not until July 2017, you should note if %SCHOOL% or your home state has a <i>filing deadline </i>or <i>financial aid priority deadline </i>by which you should apply (usually in February or March!)</span></p><p class="p1"><span class="s1">For more information about the FAFSA, check out the official Federal Student Aid website: </span></p><h2 style="text-align: center;"><span class="s1"><a href="https://fafsa.ed.gov/"><b>https://fafsa.ed.gov/</b><span class="s2"><b></b></span></a></span></h2><h4><span class="s1"><i>Note: ALWAYS use the <b>.gov </b>FAFSA site.  </i></span></h4><h4><i><span class="s1">There are services that charge you to complete a FAFSA and they are tricky.  For example, one site is actually called FAFSA.<b>com. </b> I</span><span>f you use FAFSA.com, you might end up paying to file a FREE APPLICATION!</span></i></h4><h4><span class="s1"><i>REMEMBER! You don't have to pay anything to fill out FAFSA.</i></span></h4>	Free Application for Federal Student Aid opened on January 1	<p class="p1" style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><span class="s1"></span></p><p class="p1" style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><span class="s1">Now that maybe you've finished most of your college applications, you have the task of figuring out how to pay for it! If you are a U.S. citizen, you should most definitely fill out the Free Application for Federal Student Aid -- even if you think you won't receive anything!<span class="Apple-converted-space"> </span><br/><br/>The application opens January 1 and closes on June 30, but you do need to note if %SCHOOL% or your home state has a<span class="Apple-converted-space"> </span><i>filing deadline<span class="Apple-converted-space"> </span></i>or<span class="Apple-converted-space"> </span><i>financial aid priority deadline</i>.</span></p><p class="p1" style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><span class="s1">For more information about the FAFSA, check out the official Federal Student Aid website: </span></p><h2 style="color: rgb(85, 85, 85);text-align: center;background-color: rgb(255, 255, 255);"><span class="s1"><a href="https://fafsa.ed.gov/" style="color: rgb(51, 122, 183);background-color: transparent;"><b><b>https://fafsa.ed.gov/</b></b><span class="s2"><b><b></b></b></span></a></span></h2><h4 style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><span class="s1"><i>Note: ALWAYS use the<span class="Apple-converted-space"> </span><b><b>.gov<span class="Apple-converted-space"> </span></b></b>FAFSA site.  </i></span></h4><h4 style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><i><span class="s1">There are services that charge you to complete a FAFSA and they are tricky.  For example, one site is actually called FAFSA.<b><b>com.<span class="Apple-converted-space"> </span></b></b> I</span><span>f you use FAFSA.com, you might end up paying to file a FREE APPLICATION!</span></i></h4><h4 style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><span class="s1"><i>REMEMBER! You don't have to pay anything to fill out FAFSA.  Just go to:</i></span></h4><h2 style="color: rgb(85, 85, 85);text-align: center;background-color: rgb(255, 255, 255);"><span class="s1"><a href="https://fafsa.ed.gov/" style="color: rgb(51, 122, 183);background-color: transparent;"><b><b>https://fafsa.ed.gov/</b></b></a></span></h2><h2 style="color: rgb(85, 85, 85);text-align: center;background-color: rgb(255, 255, 255);"><span class="s1"><a href="https://fafsa.ed.gov/" style="color: rgb(51, 122, 183);background-color: transparent;"><b><b><b></b></b></b></a></span></h2>	2016-11-10 23:51:21.187-05	2016-11-10 23:51:21.187-05	FAFSA Opens
7	Submit Regular Mail Essays	9	<p>If you are sending your essays to %SCHOOL% via regular mail you should send them by %REMINDER_DATE%.</p>	<p>Are you mailing your essays using the US Postal Service? </p><p>You'll want to mail your carefully crafted essays <b>early</b>, just in case you need to mail again. There's usually not much of a grace period if your essays or application forms come in late, so respect the deadline. Your application may get delayed, or worse, you may be disregarded completely!</p>	Did you send any essays via regular mail already?	<p>Are you mailing your essays using the US Postal Service? </p><p>You'll want to mail your carefully crafted essays <b>early</b>, just in case you need to mail again. There's usually not much of a grace period if your essays or application forms come in late, so respect the deadline. Your application may get delayed, or worse, you may be disregarded completely!</p><p></p><p>If you fear it may be late, call %SCHOOL% and ask if they will accept your essay via fax or email instead.</p><h5><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h5><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accomodate you. </li></ol>	2016-11-10 23:51:21.187-05	2016-12-27 17:08:27.042-05	Submit Regular Mail Essays
10	Submit Online Essays	9	Are you submitting any essays online; email or upload?	<p></p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"></p><p>It's exactly a week until %SCHOOL%'s application deadline.You've been working hard on your essays, but are they ready? </p><div><br/></div><div>Ask a knowledgeable adult to check them over and get ready to submit them.If they're done, you should login to your online application system, make sure they are uploaded correctly, and press the <b>SUBMIT </b>button!</div><div><br/></div><div><i>NOTE: Have someone else spell check and grammar check your essays.</i></div>	Are those essays ready?!	<p>It's exactly a week until %SCHOOL%'s application deadline.You've been working hard on your essays, but are they ready? </p><div><br/></div><div>Ask a knowledgeable adult to check them over and get ready to submit them.If they're done, you should login to your online application system, make sure they are uploaded correctly, and press the<b><b>SUBMIT</b></b>button!</div><div><br/></div><div>NOTE: Have someone else spell check and grammar check your essays.</div>	2016-11-10 23:51:21.187-05	2016-12-27 17:08:35.975-05	Submit Online Essays
9	Notify Recommenders	8	Are your recommenders sending their letters to %SCHOOL% via regular mail?	<p>Regular mail takes time! Make sure your recommenders have had time to send their recommendations if they are mailing them via regular mail (ie not online). Politely check-in with them.</p><p>To streamline the process for them, give them an envelope already addressed to %SCHOOL%'s admission office, with plenty of stamps. </p>	Are your recommenders sending their letters to %SCHOOL% via regular mail?	<p>Regular mail takes time! Make sure your recommenders have had time to send their recommendations if they are mailing them via regular mail (ie not online). Politely check-in with them.</p><p>To streamline the process for them, give them an envelope already addressed to %SCHOOL%'s admission office, with plenty of stamps. </p>	2016-11-10 23:51:21.187-05	2016-12-27 17:23:06.7-05	Notify Recommenders
13	Request Transcripts	2	With 90 days until your application to %SCHOOL% is due, find out your high school's procedures for having transcripts sent.	<p></p><p>The most important piece of your college applications is arguably your transcript or grade record. You'll want to make sure that %SCHOOL% gets this piece as soon as possible. They usually can't process your application without it. To learn more about your transcript and its importance, check out our <a href="http://yadaguru.com/#/faqs" target="">FAQ</a>.</p><p><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="" style="background-color: rgb(255, 255, 255);">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="" style="background-color: rgb(255, 255, 255);">Universal Application</a></i><i>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><p></p><p></p>	Have you figured out how to request your transcripts to be sent to %SCHOOL%?	<p></p><p>The most important piece of your college applications is arguably your transcript or grade record. You'll want to make sure that %SCHOOL% gets this piece as soon as possible. They usually can't process your application without it. To learn more about your transcript and its importance, check out our <a href="http://yadaguru.com/#/faqs" target=";">FAQ</a>.</p><p><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="" style="background-color: rgb(255, 255, 255);">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="" style="background-color: rgb(255, 255, 255);">Universal Application</a></i><i>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><p></p><h5><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h5><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accomodate you. </li></ol>	2016-11-10 23:51:21.187-05	2016-11-10 23:51:21.187-05	Request Transcripts
12	Application Submission Date	7	<p>%SCHOOL%'s application is due %APPLICATION_DATE%.</p>	<p>This is the date that %SCHOOL% should have every part of your application; from essays, to recommendations, to SAT scores. Some schools require that all pieces are in, others will accept them weeks after. <br/><br/>Check with the university if you fear you might not get a piece in on time. Some colleges are more lenient but <b>don't assume.</b><br/></p>	Did you already miss your deadline?	<p>Check with the university if you fear you might not get a piece in on time. Some colleges are more lenient, but assume nothing! If it is way past the deadline and the university won't budge, you may have to readjust your expectations and plans. Take a deep breath and re-examine what you need to do to succeed. </p>	2016-11-10 23:51:21.187-05	2016-12-20 18:33:47.215-05	Application Submission Date
11	Check Online Recommendations	8	Check-in with your recommenders about any online recommendations for %SCHOOL%.	<p>Did any of your recommenders complete an online, Common Application, EDU, Inc. or Universal Application recommendation for you?<br/><br/>This is a good date to check in with your recommenders to see if they have submitted online recommendations, including Common Application, EDU,Inc. and Universal Application. Even though online recommendations can usually be instantaneously uploaded, these recommendations still take time and effort to complete! Politely check-in with them now to see that they have everything that they need to accomplish it.</p>	Are any online recommendations submitted?	<p>This is a good date to check in with your recommenders to see if they have submitted online recommendations, including Common, EDU, Inc. and Universal Application. Even though it's online, these recommendations still take time so check in with them now to see that they have everything that they need to accomplish it.</p>	2016-11-10 23:51:21.187-05	2016-12-27 17:57:29.274-05	Check Online Recommendations
16	Call the school	2	CALL %SCHOOL% to make sure they've received everything!	<p>Admissions offices are very busy places...and they lose things too!</p><p>If you've sent items for your application, call the school's admissions office and politely validate that they have received everything they need for your application.  If anything is missing, get busy to get it to the school before the deadline.</p><p><i>NOTE: Make sure YOU, not your parent/guardian, call the university. Admissions professionals prefer to hear from the prospective student.</i></p>	Call %SCHOOL% to make sure they've received everything.	Admissions offices are very busy places...and they lose things, too!\n\nIf you've sent items for your application, call the school's admissions office and politely validate that they have received everything they need for your application.  If anything is missing, get busy to get it to the school before the deadline.\n\n*Note: Make sure YOU -- not your parent/guardian -- call the university. Admissions professionals prefer to hear from the prospective student!	2016-11-10 23:51:21.187-05	2016-11-10 23:51:21.187-05	Call the school
17	Submit Online Application	7	ONLINE APPS ONLY: Have you submitted your online application yet?	<p>Maybe this seems silly, but we'd hate for you to discover that you did not press that <b>SUBMIT</b> button!<br/><br/>If you didn't get a confirmation email or a notification in your online account within a few days after you hit &#34;SUBMIT&#34;, you'll want to check with the school. <br/><br/><i>NOTE: If there is an application fee required, it will might need to be paid or waived before you can &#34;SUBMIT.&#34;</i></p>	ONLINE APPS ONLY: Are you sure you hit "SUBMIT"?!	Go check right now. \n\nIf you didn't get a confirmation email or a notification in your online account within a few days after you think you submitted your application, you'll want to check with the school. \n\n(NOTE: If there is an application fee required, it might need to be paid or waived before you can "SUBMIT")	2016-11-10 23:51:21.187-05	2016-11-10 23:51:21.187-05	Submit Online Application
21	Request Transcripts	2	If you haven't, request your transcripts be sent to %SCHOOL%.	<p>It's only 14 days until your application for %SCHOOL% is due! Have you asked the guidance office to send your transcripts? Make this a priority this week if you haven't yet. <br/><br/><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><p></p>	If you haven't, request your transcripts be sent to %SCHOOL%.	<p>Your deadline for %SCHOOL% is coming quickly! Make sure you know the process, get any proper paperwork, and follow the directions of your high school regarding transcript release. They'll probably need a mailing address for the %SCHOOL% admissions office, too, so go prepared!<br/><br/><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><p><b></b></p><p></p>	2016-11-10 23:51:21.187-05	2016-11-10 23:51:21.187-05	Request Transcripts
22	Pay Application Fee	2	Did you pay the application fee?	<p>You often have to pay the fee before colleges and universities will process your application. Sometimes you can't even submit an online application until you pay.<br/><br/>Before you pay those fees (or start worrying about them), find out if you qualify for that fee to be waived.  See our <a href="http://yadaguru.com/#/faqs" target="">FAQs</a> to learn about fee waivers.</p>	Have you paid the application fee or used a fee waiver?	You often have to pay the fee before universities will process your application. (Sometimes you can't even submit an online application until you pay!) \n\nBefore you pay those fees (or start worrying about them...) find out if you qualify for that fee to be waived!\n\nFirst, ask the college's admissions offices to see if they take or offer any college application fee waivers. Need-based college application fee waivers are available for students who are eligible. If you registered for the SAT with a testing fee waiver, you are eligible for (4) college application fee waivers; these are available on your CollegeBoard account. Ask the guidance counselor at your school if they have NACAC (National Assoc. of College Admissions Counseling) Fee Waivers available. No guidance counselor at your school? Utilize resources at PhillyGoes2College.	2016-11-10 23:51:21.187-05	2016-12-27 17:58:03.754-05	Pay Application Fee
27	NCDD	7	National College Decision Day	<p>May 1 is National College Decision Day. If you get accepted to multiple colleges, including %SCHOOL%, you'll need to decide in which school you will enroll. Usually you must pay an enrollment or housing deposit to secure your space. </p><p>Consider -- Which school is your best fit academically and socially? Which school grants you the most affordable financial aid package? </p><p>Remember: It is best to send a deposit to only ONE school. It's generally considered unethical to send in deposits to multiple schools...not to mention awfully costly to you! Carefully consider your options and make the best choice for you. Ask for help from a knowledgable adult if you're not sure.</p>	Did you get accepted to %SCHOOL%?	<p><title></title></p><p class="p1"><span class="s1"></span></p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);">May 1 is National College Decision Day. If you get accepted to multiple colleges, including %SCHOOL%, you'll need to decide in which school you will enroll. Usually you must pay an enrollment or housing deposit to secure your space. </p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);">Consider -- Which school is your best fit academically and socially? Which school grants you the most affordable financial aid package? </p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);">Remember: It is best to send a deposit to only ONE school. It's generally considered unethical to send in deposits to multiple schools...not to mention awfully costly to you! Carefully consider your options and make the best choice for you. Ask for help from a knowledgable adult if you're not sure.</p><p>.</p><p></p>	2016-11-10 23:51:21.187-05	2016-11-10 23:51:21.187-05	NCDD
3	Ask Teachers for Recommendations	8	Figure out who you can ask for a recommendation for %SCHOOL%  and ask them early!	<p>Generally, you want to figure out who you will ask to write your recommendations and ask them as early as possible, ideally the summer before or right at the beginning of the school year. Remember, recommendations are a privilege, not a right, so be sure to <b><i>ask</i></b>! </p><p>Check the guidelines of your %SCHOOL%'s application to see how many recommendations you'll need, if any.  <br/><br/><b>USING COMMON, EDU,Inc. or UNIVERSAL App?</b> After you ask your teachers in person, you must &#34;invite&#34; them from your online application account. You'll need their name and working email address to accomplish this properly. (Any typos or mistakes will result in the &#34;invite&#34; getting lost in cyber space!)</p>	Do you need recommendations for your %SCHOOL% application?	<p>Generally, you want to figure out who you will ask to write your recommendations and ask them AS SOON AS POSSIBLE. Remember, recommendations are a privilege, not a right, so be sure to <b><i>ask</i></b>! </p><p>Check the guidelines of your %SCHOOL% application to see how many recommendations you'll need, if any.  <br/><br/><b>USING COMMON, EDU, Inc. or UNIVERSAL APP?</b> In order for your teachers/counselors to complete your recommendations, you must &#34;invite&#34; them from your online application account. You'll need their name and working email address to accomplish this properly. (Any typos or mistakes will result in the &#34;invite&#34; getting lost in cyber space!)</p>	2016-11-10 23:51:21.187-05	2016-12-27 17:21:28.944-05	Ask Teachers for Recommendat
28	Naviance (Philly Kids)	4	Update your Notes in Naviance	<p>Log into Naviance and update your guidance counselor or coach on your application progress.  Naviance is a system used by the Philadelphia School District that helps you to compare colleges using your own test scores and grades, research and apply for scholarships and more.  You may be working with a coach or a guidance counselor at school who might be putting important information specifically for you directly into Naviance.  Login here <a href="https://www.philasd.org/login/" style="color: rgb(204, 51, 51);background-color: rgb(255, 255, 255);"></a><a href="http://www.philasd.org/login" target="">www.philasd.org/login</a> and use your student ID and password in the 'students' box.  If you don't know your student ID and password, stop by your guidance  office and they will provide it to you. </p>	Update your Notes in Naviance	<p>Log into Naviance and update your guidance counselor or coach on your application progress.  Naviance is a system used by the Philadelphia School District that helps you to compare colleges using your own test scores and grades, research and apply for scholarships and more.  You may be working with a coach or a guidance counselor at school who might be putting important information specifically for you directly into Naviance.  Login here <a href="https://www.philasd.org/login/" style="background-color: rgb(255, 255, 255);color: rgb(204, 51, 51);"></a><a href="http://www.philasd.org/login" target="" style="background-color: transparent;color: rgb(51, 122, 183);">www.philasd.org/login</a> and use your student ID and password in the 'students' box.  If you don't know your student ID and password, stop by your guidance  office and they will provide it to you. <br/></p>	2016-11-10 23:51:21.187-05	2016-12-27 17:59:07.984-05	Naviance (Philly Kids)
\.


--
-- Data for Name: BaseRemindersTimeframes; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "BaseRemindersTimeframes" ("BaseReminderId", "TimeframeId", "createdAt", "updatedAt") FROM stdin;
1	5	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
2	7	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
3	1	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
4	1	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
6	8	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
7	7	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
9	7	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
9	9	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
9	10	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
10	10	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
11	10	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
13	5	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
15	1	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
16	8	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
16	9	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
16	10	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
17	10	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
18	6	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
19	6	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
20	8	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
21	9	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
22	6	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
23	7	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
25	6	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
26	4	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
27	3	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
28	5	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
28	6	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
28	7	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
28	9	2016-11-10 23:51:21.214-05	2016-11-10 23:51:21.214-05
12	13	2016-12-20 18:33:47.229-05	2016-12-20 18:33:47.229-05
30	1	2016-12-27 16:33:19.469-05	2016-12-27 16:33:19.469-05
30	5	2016-12-27 16:33:19.469-05	2016-12-27 16:33:19.469-05
3	5	2016-12-27 17:21:28.954-05	2016-12-27 17:21:28.954-05
14	6	2016-12-27 17:35:02.873-05	2016-12-27 17:35:02.873-05
15	5	2016-12-27 18:01:39.603-05	2016-12-27 18:01:39.603-05
\.


--
-- Name: BaseReminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"BaseReminders_id_seq"', 30, true);


--
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Categories" (id, name, "createdAt", "updatedAt") FROM stdin;
1	Financial Aid	2016-11-10 23:51:21.155-05	2016-11-10 23:51:21.155-05
2	Application	2016-11-10 23:51:21.155-05	2016-11-10 23:51:21.155-05
3	CSS Profile	2016-11-10 23:51:21.155-05	2016-11-10 23:51:21.155-05
4	Naviance	2016-11-10 23:51:21.155-05	2016-11-10 23:51:21.155-05
5	Portfolio Prep	2016-11-10 23:51:21.155-05	2016-11-10 23:51:21.155-05
6	General Reminder	2016-11-10 23:51:21.155-05	2016-11-10 23:51:21.155-05
7	Absolute Deadline	2016-11-10 23:51:21.155-05	2016-11-10 23:51:21.155-05
8	Recommendations	2016-11-10 23:51:21.155-05	2016-11-10 23:51:21.155-05
9	Essay Writing	2016-11-10 23:51:21.155-05	2016-11-10 23:51:21.155-05
10	Testing Registration	2016-11-10 23:51:21.155-05	2016-11-10 23:51:21.155-05
\.


--
-- Name: Categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Categories_id_seq"', 11, true);


--
-- Data for Name: ContentItems; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "ContentItems" (id, name, content, "createdAt", "updatedAt") FROM stdin;
12	faq-app-find	<p>You can find the Application Submission Date on the school's undergraduate admissions web page. </p>	2016-11-10 23:51:21.265-05	2016-12-01 12:16:23.001-05
10	help-user	<h1><b><span id="selectionBoundary_1480612751527_11271324634740609" class="rangySelectionBoundary">&#65279;</span>Sponsor Code</b></h1><p><span id="selectionBoundary_1480612751527_806321578064817" class="rangySelectionBoundary">&#65279;</span>Some schools or institutions are helping to pay for text messages for a group of students.  These students will receive a 'sponsor code'.   The student can enter the sponsor code into YadaGuru to ensure that they will be able to use YadaGuru for free (baring any text costs through their mobile provider). </p><p><br/></p><h1>Forget My Number</h1><p>Forget my number will erase your number from our database.  If you have any schools set up, it will erase that school data as well.  No worries, you can always set them back up again.  If you just want to stop getting text messages, there's a text message on/off switch on the school.  You can switch it to off to stop getting text messages without having YadaGuru completely forget you. </p>	2016-11-10 23:51:21.265-05	2016-12-01 12:22:25.921-05
8	help-school	<h1>View by School</h1><p>This view allows you to see dates for just the one school that you tapped (or clicked on).</p><p><br/></p><h1>View by Date</h1><p>This view allows you to see all the things to do on certain dates, for all the schools you've set up in YadaGuru. </p>	2016-11-10 23:51:21.265-05	2016-12-01 12:23:53.263-05
9	help-reminder	<h1>How This Page Works</h1><p>The blue bars show a date.  If you tap(click) on the bar, you'll see the things that you have to do on that date.  If you tap (click) on the thing you have to do, you'll get all the details and advice YadaGuru has to give you. Tap (click) on the bar to close it up again. </p>	2016-11-10 23:51:21.265-05	2016-12-01 12:26:08.827-05
7	help-privacy	<p>A 'Privacy Policy' talks about what data we collect from you and how we use it. </p>	2016-11-10 23:51:21.265-05	2016-12-01 12:41:29.227-05
6	help-faqs	<p>Lots of stuff here, who we are, how to connect and gory details about college apps.  Have fun. </p>	2016-11-10 23:51:21.265-05	2016-12-01 12:42:32.19-05
5	help-disclaimer	<p>This is where we tell you about our limitations. Please read the disclaimer. </p>	2016-11-10 23:51:21.265-05	2016-12-01 12:45:59.828-05
1	privacy	<p><br/>This privacy policy has been compiled to better serve those who are concerned with how their 'Personally identifiable information' (PII) is being used online. PII, as used in US privacy law and information security, is information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual in context. Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Personally Identifiable Information in accordance with our website.<br/><br/><br/>What personal information do we collect from the people that visit our blog, website or app?<br/><br/><br/>When ordering or registering on our site, as appropriate, you may be asked to enter your Mobile Phone Number or other details to help you with your experience.<br/><br/><br/>When do we collect information?<br/><br/><br/>We collect information from you when you fill out a form or enter information on our site.<br/><br/><br/><br/><br/>How do we use your information?<br/><br/><br/>We may use the information we collect from you when you register, make a purchase, sign up for our newsletter, respond to a survey or marketing communication, surf the website, or use certain other site features in the following ways:<br/><br/><br/>      • To personalize user's experience and to allow us to deliver the type of content and product offerings in which you are most interested.<br/>      • To administer a contest, promotion, survey or other site feature.<br/><br/><br/>How do we protect visitor information?<br/><br/><br/>We do not use vulnerability scanning and/or scanning to PCI standards.<br/>We do not use Malware Scanning.<br/><br/><br/>We do not use an SSL certificate<br/>      • We only provide articles and information, we never ask for personal or private information like email addresses, or credit card numbers.<br/><br/><br/>Do we use 'cookies'?<br/><br/><br/>Yes. Cookies are small files that a site or its service provider transfers to your computer's hard drive through your Web browser (if you allow) that enables the site's or service provider's systems to recognize your browser and capture and remember certain information. For instance, we use cookies to help us remember and process the items in your shopping cart. They are also used to help us understand your preferences based on previous or current site activity, which enables us to provide you with improved services. We also use cookies to help us compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future.<br/><br/><br/>We use cookies to:<br/>      • Understand and save user's preferences for future visits.<br/><br/><br/>You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies. You do this through your browser (like Internet Explorer) settings. Each browser is a little different, so look at your browser's Help menu to learn the correct way to modify your cookies.<br/><br/><br/>If users disable cookies in their browser:<br/><br/><br/>If you disable cookies off, some features will be disabled It will turn off some of the features that make your site experience more efficient and some of our services will not function properly.<br/><br/><br/>However, users will not be able to administer the text messages they receive.<br/><br/><br/><br/><br/><br/><br/>Third Party Disclosure<br/><br/><br/>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information.<br/><br/><br/>Third party links<br/><br/><br/>We do not include or offer third party products or services on our website.<br/><br/><br/>Google<br/><br/><br/>We use a first-party Google Analytics cookie and a YadaGuru cookie. We use The Google Analytics cookie to understand how many people are using our site and how often, so that we can forecast text messaging costs.  We use the YadaGuru cookie to save user text message preferences.<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>California Online Privacy Protection Act<br/><br/><br/>CalOPPA is the first state law in the nation to require commercial websites and online services to post a privacy policy. The law's reach stretches well beyond California to require a person or company in the United States (and conceivably the world) that operates websites collecting personally identifiable information from California consumers to post a conspicuous privacy policy on its website stating exactly the information being collected and those individuals with whom it is being shared, and to comply with this policy. - See more at: http://consumercal.org/california-online-privacy-protection-act-caloppa/#sthash.0FdRbT51.dpuf<br/><br/><br/>According to CalOPPA we agree to the following:<br/>Users can visit our site anonymously.<br/><br/><br/>Once this privacy policy is created, we will add a link to it on our home page, or as a minimum on the first significant page after entering our website.<br/><br/><br/>Our Privacy Policy link includes the word 'Privacy', and can be easily be found on the page specified above.<br/><br/><br/>Users will be notified of any privacy policy changes:<br/>      • On our Privacy Policy Page<br/>Users are able to change their personal information:<br/>      • By logging in to their account<br/><br/><br/>How does our site handle do not track signals?<br/>We don't honor do not track signals and do not track, plant cookies, or use advertising when a Do Not Track (DNT) browser mechanism is in place. We don't honor them because:<br/>we don't use third party tracking.<br/><br/><br/>Does our site allow third party behavioral tracking?<br/>It's also important to note that we do not allow third party behavioral tracking.<br/><br/><br/>COPPA (Children Online Privacy Protection Act)<br/><br/><br/>When it comes to the collection of personal information from children under 13, the Children's Online Privacy Protection Act (COPPA) puts parents in control. The Federal Trade Commission, the nation's consumer protection agency, enforces the COPPA Rule, which spells out what operators of websites and online services must do to protect children's privacy and safety online.<br/><br/><br/>We do not specifically market to children under 13.<br/><br/><br/>Fair Information Practices<br/><br/><br/>The Fair Information Practices Principles form the backbone of privacy law in the United States and the concepts they include have played a significant role in the development of data protection laws around the globe. Understanding the Fair Information Practice Principles and how they should be implemented is critical to comply with the various privacy laws that protect personal information.<br/><br/><br/>In order to be in line with Fair Information Practices we will take the following responsive action, should a data breach occur:<br/>We will notify the users via in site notification<br/>      • Within 7 business days<br/><br/><br/>We also agree to the individual redress principle, which requires that individuals have a right to pursue legally enforceable rights against data collectors and processors who fail to adhere to the law. This principle requires not only that individuals have enforceable rights against data users, but also that individuals have recourse to courts or a government agency to investigate and/or prosecute non-compliance by data processors.<br/><br/><br/>CAN SPAM Act<br/><br/><br/>The CAN-SPAM Act is a law that sets the rules for commercial email, establishes requirements for commercial messages, gives recipients the right to have emails stopped from being sent to them, and spells out tough penalties for violations.<br/><br/><br/>We collect your email address in order to:<br/><br/><br/>To be in accordance with CANSPAM we agree to the following:<br/><br/><br/>If at any time you would like to unsubscribe from receiving future emails, you can email us at<br/>and we will promptly remove you from ALL correspondence.<br/><br/><br/><br/><br/>Contacting Us<br/><br/><br/>If there are any questions regarding this privacy policy you may contact us using the information below.<br/><br/><br/>http://www.yadaguru.com<br/>903 North Third<br/>PHiladelphia, Pennsylvania 09102<br/>US<br/>yadaguru@gmail.com<br/><br/><br/>Last Edited on 2015-11-01<b></b></p>	2016-11-10 23:51:21.265-05	2016-12-01 11:59:48.537-05
4	faqs	<h1>college application questions<br/></h1><p><br/> <!--[if !supportLineBreakNewLine]--><br/> <!--[endif]--><span style="color: inherit;"></span></p><h2>The college application process really confuses <span style="color: inherit;">me!</span></h2><p>You are not alone. Most college-bound students experience degrees of confusion about this process. While YadaGuru will help you organize and remember key dates in the college application process, you're probably also asking questions like:</p><p>These are great questions, and Philadelphia students will find some solid answers at <a href="http://www.stepuptocollege.org/">http://www.stepuptocollege.org/</a> and with our friends at <a href="http://phillygoestocollege.com/">PhillyGoes2College</a>.  We also suggest that you watch <a href="https://youtu.be/oc7TeAfOyH4">this video</a> and go through <a href="http://www.stepuptocollege.org/images/stepuppptpdf/Step-Up-to-College-Applying-to-College.ppt">this powerpoint</a> to understand the whole process.</p><p></p><p>One thing we <i>can</i> tell you at YadaGuru is that one of the most important things to do is start your application process <i>early</i>. We suggest utilizing the summer before your senior year of high school to tackle the initial stages of applying to college. If you're a little behind, you'll have to get organized and move more quickly, but you can still find YadaGuru helpful.</p><p><i>You can do this! Breathe and embrace this crazy and exciting time of your life!</i></p><h2>You said this was only for Regular Decision?  What does that mean?</h2><p>When it comes to applying for college, most schools give a date by which they need all your application materials so that the admissions committees can decide if you should attend their school. <b>A Regular Decision application means that you'll be applying by the latest date the school allows.</b> Some schools allow options for early application. Others are more relaxed about submission dates and will allow you to apply at any time. </p><p>YadaGuru is built around the <b>Regular Decision Process</b>. To learn more about other types of college admissions go to <a href="http://www.campusexplorer.com/college-advice-tips/FC3F1C62/College-Admissions-Options-Early-Decision-Early-Action-Rolling-Regular/">http://www.campusexplorer.com/college-advice-tips/FC3F1C62/College-Admissions-Options-Early-Decision-Early-Action-Rolling-Regular/</a></p><h2>What about Test Scores? What's the best time to take the SAT or the ACT? </h2><p>Some schools will require test scores from the SAT or the ACT, and any AP tests. You'll want to <b>take tests at least three months before the submission date</b>. This is because the College Board needs time to score your test (usually about a month) and then send your scores to the schools of your choice (assume another month).  If you wait to take the test a few months before your application is due, it's possible that the school may not receive your scores from the College Board on time. If that happens, they may not consider you for admission. That's why we advise that you take tests at least three months before your application is due. Keep in mind that College Board does allow you to expedite your test scores, at extra cost to you. </p><h2><span style="color: inherit;">What is the FAFSA and when do I have to fill it out?</span></h2><p>There's lots of different aid sources out there, so get ready to do some digging! </p><p>The FAFSA is the FREE Application for Federal Student Aid. This is the gateway to accessing most need-based financial aid -- from your colleges, the government, and external organizations. Starting with the 2017–18 FAFSA, the application will open October 1. </p><p><b>The 2017–18 FAFSA will request information from applicants' 2015 tax returns.</b>  Unlike the former process, the current FAFSA will request data from tax returns that should already have been filed. You’ll be able to <b>import tax information directly</b> using the <b><u><span style="color: blue;">IRS Data Retrieval Tool</span></u></b> simplifying the process for applicants.</p><p>In order to complete your FAFSA, you will need to <b>create a personal FSA ID</b>. To do this go to <a href="http://studentaid.ed.gov/fsaid" target="_blank"><b>StudentAid.gov/fsaid</b></a> and it will provide helpful information such as what you should gather beforehand, and a link—plus it will walk you through the entire process.</p><p>Further details and information for students is available at <a href="https://studentaid.ed.gov/sa/about/announcements/fafsa-changes" target="_blank"><b>StudentAid.gov/fafsa-changes</b></a>. Or head over to <b><u><span style="color: blue;"><a href="http://fafsa.ed.gov/" target="_blank"><span style="color: #1155cc;">fafsa.ed.gov</span></a></span></u></b> to log in to your account.</p><h2>Wow, do all college applications ask a lot of questions? </h2><p>Yes, they usually do! Most basic college applications will ask about: </p><p>All college applications will ask some combination of these items, give or take a few, whether they are online or a printed copy. You should note that the Common and Universal Application allows you to fill out all this basic information once for multiple colleges. Check out the <b>Common Application</b> <a href="http://www.commonapplication.org/" target="_blank">here</a>, and<b> Universal Application</b> <a href="https://www.universalcollegeapp.com/">here</a>. </p><h2>I'm an art major and I have to submit a portfolio. How does that work?</h2><p class="p1">About four months before your school's submission date, you should start assembling your best works.</p><p class="p1">Give yourself plenty of time to assemble your portfolio. Start early, get advice about your best work from others, and maybe create a few more pieces. By thinking about this early, you'll have time to present your best works. This would also be a good time to check the school's website and find out how the school wants you to submit your works. Usually it's through an online portal, like <a href="http://www.slideroom.com/">slideroom.com</a>, so get familiar with this link and how to upload to it.</p><p class="p1">To give you an idea of preparation you'll need, you will probably need to take high quality pictures of your artwork, or scan your work, or upload files, or probably write an artist statement. You might need to find a photographer or a friend who has a good high quality camera, and find a good place with the right lighting to show the highlights of your work.  Don't leave this to a cell phone photo of your work on the dining room table the night before you have to upload it. </p><h2>When should I start my Essays? </h2><p>Essays are the most time-consuming parts of the application process, because they require a lot of thinking, writing, and editing. </p><p>Even if an essay is optional, you should still consider taking the time to write one. Essays are a unique opportunity to share with the university something important they should know about you, but will not easily discover by reading the other parts of your application. </p><p>The essay is your chance to answer the questions running through the mind of the admissions counselor:</p><p>You should start and finish these essays as soon as possible, leaving enough time for proofreading, spellchecking, and feedback by a knowledgeable adult.&#65279;</p><h2>What should I know about Transcripts?</h2><p>A 'Transcript' is a copy of all your grades from ninth grade to present. It also has any disciplinary actions that school may have taken, like a suspension. Transcripts are sometimes also called 'Grade Reports' or 'School Reports'. The important thing to remember is that most schools will need you to go to the guidance office and request that the school send your transcript to the colleges and universities you are applying to. </p><p></p><p>Your school has to send the transcript directly to the schools you are applying to. That means a couple of things:</p><p></p><p>Additionally, some college and universities will want your transcript throughout your senior year. So they may want a mid-year transcript in December and a final transcript after you've graduated. Obviously, this takes a little bit of forethought, so YadaGuru encourages you to do this very early in the process. YadaGuru will also remind you during the year to check back with your guidance office to ensure the transcripts were sent. Each guidance office has a request process that you should get to know, so stop by the guidance office and get familiar with their policies.</p><p></p><h2>What should I know about Recommendations?</h2><p>First, most colleges and universities will need to have someone recommend you, which means that this person will have to write a letter about how great you are or fill out a form about how great you are, or both.</p><p>The schools will want your recommender to send the recommendation directly to them, without you seeing it. </p><p>Recommendations can be sent online through Common App or Universal App. They can also be sent through the mail. Read your school's policy and direction on how recommendations should be requested and sent. If the recommendation should be delivered online, then somewhere on the online application, there will be a place for you to invite your recommenders to your application, so that they can login independently and fill out the form and/or write a letter. If the recommendations should be delivered by regular mail, make it easy for your recommender. Print out multiple copies of the form and/or recommendation letter question from the school's application. This allows your recommender to recover if they make a mistake. And then give them envelopes addressed directly to the school, with stamps already attached. </p><p>Second, if you want someone to talk about how great you are, you definitely want to give them lots of time to do so. And usually, you aren't the only person asking them for a recommendation. So we recommend that you politely and gratefully ask your potential recommenders very early in the process. In fact, we ask that you start thinking about who can recommend you the summer before you start working on your application.</p><p>The more time you give yourself and your recommender, the less stress you'll feel.  </p><p>Third, remember that recommenders are human and very busy. So forgive them if they forget your recommendation. Just keep politely reminding them of your need for your recommendation, and keep politely reminding them of the date by which the school needs the recommendation.   </p><p>YadaGuru will help you remember to help them get the recommendations in on time. </p><h2>What are college application fee waivers?</h2><p>You often have to pay the fee before universities will process your application. Sometimes you can't even submit an online application until you pay.</p><p>Before you pay those fees (or start worrying about them), find out if you qualify for that fee to be waived.</p><p>First, call the college's admissions offices to see if they offer any institutional college application fee waivers. Sometimes they have promotions for application times or methods (i.e. applying online) in which they waive the fee. If they don't offer institutional fee waivers, ask them if they accept needs-based fee waivers like NACAC (say &#34;NACK-ack&#34;) or CollegeBoard fee waivers. </p><p>If they say YES, read on.</p><p>Need-based college application fee waivers are available for students who are financially eligible. </p><p><b>COLLEGE BOARD FEE WAIVERS: </b>If you registered for the SAT with a testing-fee waiver, you are eligible for (4) college application-fee waivers; these are available to print out from your CollegeBoard account. They get mailed to the college.</p><p><b>NACAC FEE WAIVERS</b>: Ask the guidance counselor at your school if they have NACAC (National Association of College Admissions Counseling) Fee Waivers available. No guidance counselor at your school? You can access the fee waiver here: <a href="http://www.nacacnet.org/studentinfo/feewaiver/pages/default.aspx">http://www.nacacnet.org/studentinfo/feewaiver/pages/default.aspx</a>.</p><p></p><p></p><h1>YadaGuru Questions</h1><p></p><h2>What does 'YadaGuru' mean?</h2><p><span style="color: #555555;">'Yada' means 'to Remember' in Hindi. A 'Guru' is an influential teacher or popular expert. 'Yada' also means 'To Know' in Yiddish.</span></p><p><span style="color: #555555;">YadaGuru will be your personal-reminder guru to help you remember everything you have to do to send in your college applications. </span></p><p><span style="color: #555555;"></span></p><h2>Are these dates accurate? </h2><p class="p1"><span class="s1">The dates on YadaGuru are <i>approximate</i>.  </span></p><p class="p1"><span class="s1"><b>They should be considered to be <i>recommended</i> best dates. You, the student, are ultimately responsible for understanding application dates, and all the pieces of the application. </b></span></p><p class="p1"><span class="s1">Our dates are always best practice dates; meaning that experience has proven that certain time-frames are the best times to successfully begin, check-in, remind, or submit in the application process.</span></p><p class="p1"><span class="s1">Our Advisory Panel is composed of actual high school guidance counselors with years of experience guiding students through the college application process. These counselors have written the reminders and also directed the dates by which the reminder should be sent.</span></p><p class="p2"></p><h2>Do I have to have a Google Calendar account for this to work?</h2><p><b><span style="color: #555555;">Short Answer</span></b><span style="color: #555555;">: Yes, it helps.</span></p><p><b><span style="color: #555555;">Long Answer</span></b><span style="color: #555555;">.  Google calendar is free and it's the easiest way to configure reminders.  If you have a smart phone, you can sync your Google calendar with your smart phone calendar.  You can also download the Google calendar app.  Either way, the beauty of Google calendar is that<i> you can tell it when to remind you about dates.</i>  You could choose to get reminded on the day of, or a week before, or 30 minutes before or something custom.  And you can set it up to text you, email you or just pop up a reminder on your phone or computer.  </span></p><p><span style="color: #555555;">You can use YadaGuru without Google calendar.  There's a <i>download iCal</i> button that downloads a universal iCal format (*.ics) that can work in any calendar program.  You might do this so that you can upload the *.ics file to Outlook for example. There's a &#34;S<i>ave PDF&#34; </i>button as well.  This enables you to download a PDF file that you can then print, or save on your phone, record on a printed calendar, or send to your mom etc. </span></p><h2><span style="color: #555555;">How does YadaGuru help me?</span></h2><p><span style="color: #555555;">YadaGuru helps you deliver college applications completely and on time. </span></p><p><span style="color: #555555;">In the college application world, lots of advice is available about the <i>content </i>of an application; how to write essays, what to include in your extra curricular activities, who to ask to recommend you. But even students who have all the right content can fail on the logistics of delivering a complete application on time.</span></p><p><span style="color: #555555;">YadaGuru’s niche is that it focuses on the mechanics of delivery. YadaGuru provides a set of reminders based on best practices from guidance counselors about when to perform each step of the college application process, from signing-in to online application portals, to asking someone to write a letter of recommendation for you, to registering for the SAT, to remembering to hit the submit button.</span></p><p><span style="color: #555555;">Content preparation is up to the student, but YadaGuru is a key tool for ensuring delivery of all materials to the school on time.</span></p><h3>Supporting Data</h3><p><span style="color: #555555;">Brookings Institution &#34;..demonstrated that the majority of high-achieving, low-income students do not apply to any selective colleges despite apparently being well qualified for admission&#34; and suggest that targeted information, like YadaGuru, can encourage more successful applications.  Check out thier <a href="http://www.brookings.edu/~/media/projects/bpea/spring-2013/2013a_hoxby.pdf">full study. </a> </span></p><h2><span style="color: #555555;">Give me an Example </span></h2><h5><span style="color: #555555;">LIMITED SUPPORT TO LEARN HOW TO SUBMIT A COLLEGE APPLICATION</span></h5><p><span style="color: #555555;">Anthony is a high school junior. It’s August and he’s thinking of applying to college next year. He goes to a Philadelphia public school. His cousin went to college but is busy working and doesn’t have a lot of time to help him with the application process. There are two guidance counselors for 1500 kids at his school, so it’s hard to get their time. Anthony’s mom works nights at a hospital and can’t make some of the college-prep meetings at school so he knows that if he wants to go to college he’s got to figure it out on his own. He’s visited one of the Philly Goes to College hotspots and talked to the counselor there. While there he got a stack of information about how to be a good candidate; what kind of essays to write, and identified his extra-curricular activities that he needs to talk about in his application.</span></p><h5><span style="color: #555555;">NOT JUST CONTENT, BUT SUCCESSFUL APPLICATION DELIVERY</span></h5><p><span style="color: #555555;">With YadaGuru, the counselor at the hotspot could also give him the <i>dates </i>by which he would need to get everything to the school on time. So not only would the content of his application be great, <b><i>but his delivery would be successful</i></b>. Together they could review <i>the dates by which he needs to begin </i>to get everything done. Then Anthony can push the reminders to his Google calendar so that he can be reminded not just of when something is due, but more importantly, when he needs to start working on something to get it done in time and to the school by the due date.</span></p><h5><span style="color: #555555;">BUILDING A COMMUNITY OF SUPPORT WITH KNOWLEDGE OF SUCCESSFUL APPLICATION DELIVERY</span></h5><p><span style="color: #555555;">Anthony’s pastor is also very involved in supporting him. Pastor Charles has gone to YadaGuru and printed out the list of reminders so he makes sure to ask Anthony about his next steps every time he sees him at church on Sunday.</span></p><h2></h2><h2>I know YadaGuru is meant for the Philadelphia area, but we'd like to use it in our school district. How can we adapt it for our school district?</h2><p>As long as you follow the license policy, you are free to<a href="https://github.com/yadaguru/yadaguru-app"><span> get the code from GitHub</span></a>, host the software on your own site and modify as you will. This would be a great project for a code class. </p><h2>I'm a developer, are you covered by any software licenses?</h2><p>(i.e, the &#34;License Policy&#34;)</p><p>Yadadguru is covered by two licenses:</p><p><a href="http://www.gnu.org/licenses/gpl.html">The GNU General Public License</a>, with the exception that under section 4 we allow no price to be charged for any copies of this application.</p><p><a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">The Creative Commons BY-NC-SA license </a></p><h2></h2><h2></h2><h2 style="font-size: 30px;">All About YadaGuru (our one pager)<br/></h2><h2 style="font-size: 30px;"><a href="https://drive.google.com/file/d/0ByhE21JsXwS-aXQ2azQxajlIVGc/view?usp=sharing" style="background-color: transparent;color: rgb(51, 122, 183);">Here's the PDF One Pager </a></h2><h2 style="font-size: 30px;"><a href="https://phillycollegeapps.wordpress.com/2016/08/13/who-we-are-and-why-we-do-what-we-do/" style="background-color: transparent;color: rgb(51, 122, 183);">Here's Our History - How We Got Started and Our Motivation </a></h2><h2><br/></h2><h2>Feedback</h2><p>Got Feedback for us?  Email us at <a href="mailto:comms@codeforphilly.flowdock.com">comms@codeforphilly.flowdock.com</a>.  Wanna keep in touch? <a href="https://twitter.com/yadaguru">Follow us on Twitter</a>.</p><p></p>	2016-11-10 23:51:21.265-05	2016-12-04 09:53:06.743-05
3	disclaimer	<h2>Disclaimer</h2><p><span style="font-size: 11.9px;text-align: center;float: none;">All dates on this site are approximate and reflect the best practice cadence of dates for a </span><em style="font-size: 11.9px;text-align: center;">Regular Decision</em><span style="font-size: 11.9px;text-align: center;float: none;"> type application. This means that ultimately you the student are responsible for knowing dates and that you should use another method if you are applying early decision, early acceptance or anything other than Regular Decision. Also, if you are very late in the process, for example, using Yadaguru one month before a submission date, Yadaguru will display dates by which actions should have been taken in the past. To understand the different types of admission, please see About Yadaguru. </span></p>	2016-11-10 23:51:21.265-05	2016-12-01 12:01:35.868-05
14	faq-rolling-admissions	<p>Rolling Admissions is when the school gives you a time frame, instead of a date,  in which to submit your application. So for example, a school might allow applications to be submitted between January 1 and May 1, with the very latest date being May 1.  For YadaGuru, choose the earliest date that applications are accepted.  In the example, that would be January 1. <br/></p>	2016-11-10 23:51:21.265-05	2016-12-01 12:12:37.99-05
15	faq-early-action	<p>We currently don't handle early action/early decision.  Please read our FAQs to understand our thinking on this. </p>	2016-11-10 23:51:21.265-05	2016-12-01 12:13:11.898-05
13	faq-regular-admissions	<p><span>The date that all parts of the application must be delivered to the school. Transcripts, essays, recommendation, test scores...everything.</span><br/></p><p>Many schools allow you to apply early, before the standard deadline.  They call this ‘early action’ or ‘early decision’.   If you apply early, you have to follow certain rules.  Check with the school on that.  Regular admissions are basically not early, but the standard date when all non-early applications are due. </p>	2016-11-10 23:51:21.265-05	2016-12-01 12:14:11.358-05
11	faq-app-submission-date	<p>The date that all parts of the application must be delivered to the school. Transcripts, essays, recommendation, test scores...everything.</p>	2016-11-10 23:51:21.265-05	2016-12-01 12:15:48.776-05
2	contact	<p><i></i></p><h1>About Us</h1><div><p>YadaGuru is a <a href="https://codeforphilly.org/" target="">CodeForPhilly</a> project.  It's a totally free app built by civically minded developers who dedicated personal time to help kids in Philly with the application process.  Learn more about<a href="https://codeforphilly.org/projects/yadaguru" target=""> our journey to bring you Yadaguru </a>through our CodeForPhily project page and <a href="https://codeforphilly.org/projects/yadaguru" target="">our blog</a>.</p><h1>Want the Code?</h1><p>Sure!  Here's our <a href="https://github.com/yadaguru" target="">GitHub Page.</a>  Please don't monetize this app.  See our Privacy Policy for license info. </p></div><h1>Got Feedback?</h1><p>Got Feedback for us?  Email us at <a href="mailto:yadaguru@gmail.com" target="">yadaguru@gmail.com</a>.  Wanna keep in touch? <a href="https://twitter.com/yadaguru">Follow us on Twitter</a> or join our <a href="https://www.facebook.com/YadaGuru/" target="">Facebook page.</a> </p><p></p>	2016-11-10 23:51:21.265-05	2016-12-27 17:25:50.687-05
\.


--
-- Name: ContentItems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"ContentItems_id_seq"', 15, true);


--
-- Data for Name: Reminders; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Reminders" (id, timeframe, "dueDate", "createdAt", "updatedAt", "schoolId", "userId", "baseReminderId", "isSent") FROM stdin;
1	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	4	f
2	90 Days	2016-11-02 20:00:00-04	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	1	f
3	30 Days	2017-01-01 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	2	f
4	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	3	f
2053	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	1	f
2054	21 Days	2017-04-09 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	6	f
7	21 Days	2017-01-10 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	6	f
8	30 Days	2017-01-01 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	7	f
2055	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	30	f
10	7 Days	2017-01-24 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	9	f
11	14 Days	2017-01-17 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	9	f
12	30 Days	2017-01-01 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	9	f
13	7 Days	2017-01-24 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	10	f
14	7 Days	2017-01-24 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	11	f
15	Today	2016-11-10 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	12	f
16	90 Days	2016-11-02 20:00:00-04	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	13	f
17	90 Days	2016-11-02 20:00:00-04	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	14	f
18	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	15	f
19	7 Days	2017-01-24 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	16	f
20	14 Days	2017-01-17 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	16	f
21	21 Days	2017-01-10 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	16	f
22	7 Days	2017-01-24 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	17	f
23	60 Days	2016-12-02 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	18	f
24	60 Days	2016-12-02 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	19	f
25	21 Days	2017-01-10 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	20	f
26	14 Days	2017-01-17 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	21	f
27	60 Days	2016-12-02 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	22	f
28	30 Days	2017-01-01 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	23	f
2056	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	30	f
30	60 Days	2016-12-02 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	25	f
31	Oct 1 2017	2017-09-30 20:00:00-04	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	26	f
32	May 1 2017	2017-04-30 20:00:00-04	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	27	f
33	14 Days	2017-01-17 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	28	f
34	30 Days	2017-01-01 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	28	f
35	60 Days	2016-12-02 19:00:00-05	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	28	f
36	90 Days	2016-11-02 20:00:00-04	2016-11-11 00:50:00.524-05	2016-11-11 00:50:00.524-05	1	1	28	f
37	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	4	f
38	90 Days	2016-11-15 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	1	f
39	30 Days	2017-01-14 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	2	f
40	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	3	f
2057	21 Days	2017-04-09 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	20	f
2058	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	14	f
43	21 Days	2017-01-23 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	6	f
44	30 Days	2017-01-14 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	7	f
2059	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	15	f
46	7 Days	2017-02-06 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	9	f
47	14 Days	2017-01-30 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	9	f
48	30 Days	2017-01-14 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	9	f
49	7 Days	2017-02-06 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	10	f
50	7 Days	2017-02-06 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	11	f
51	Today	2016-11-10 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	12	f
52	90 Days	2016-11-15 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	13	f
53	90 Days	2016-11-15 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	14	f
54	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	15	f
55	7 Days	2017-02-06 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	16	f
56	14 Days	2017-01-30 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	16	f
57	21 Days	2017-01-23 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	16	f
58	7 Days	2017-02-06 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	17	f
59	60 Days	2016-12-15 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	18	f
60	60 Days	2016-12-15 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	19	f
61	21 Days	2017-01-23 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	20	f
62	14 Days	2017-01-30 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	21	f
63	60 Days	2016-12-15 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	22	f
64	30 Days	2017-01-14 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	23	f
2060	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	15	f
66	60 Days	2016-12-15 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	25	f
67	Oct 1 2017	2017-09-30 20:00:00-04	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	26	f
68	May 1 2017	2017-04-30 20:00:00-04	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	27	f
69	14 Days	2017-01-30 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	28	f
70	30 Days	2017-01-14 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	28	f
71	60 Days	2016-12-15 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	28	f
72	90 Days	2016-11-15 19:00:00-05	2016-11-11 01:12:05.985-05	2016-11-11 01:12:05.985-05	2	1	28	f
325	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	4	f
326	90 Days	2016-11-30 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	1	f
327	30 Days	2017-01-29 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	2	f
328	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	3	f
2061	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	4	f
2062	30 Days	2017-03-31 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	2	f
331	21 Days	2017-02-07 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	6	f
332	30 Days	2017-01-29 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	7	f
2063	30 Days	2017-03-31 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	7	f
334	7 Days	2017-02-21 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	9	f
335	14 Days	2017-02-14 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	9	f
336	30 Days	2017-01-29 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	9	f
337	7 Days	2017-02-21 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	10	f
338	7 Days	2017-02-21 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	11	f
339	Today	2016-11-10 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	12	f
340	90 Days	2016-11-30 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	13	f
341	90 Days	2016-11-30 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	14	f
342	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	15	f
343	7 Days	2017-02-21 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	16	f
344	14 Days	2017-02-14 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	16	f
345	21 Days	2017-02-07 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	16	f
346	7 Days	2017-02-21 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	17	f
347	60 Days	2016-12-30 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	18	f
348	60 Days	2016-12-30 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	19	f
349	21 Days	2017-02-07 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	20	f
350	14 Days	2017-02-14 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	21	f
351	60 Days	2016-12-30 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	22	f
352	30 Days	2017-01-29 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	23	f
2064	7 Days	2017-04-23 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	10	f
354	60 Days	2016-12-30 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	25	f
355	Oct 1 2017	2017-09-30 20:00:00-04	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	26	f
356	May 1 2017	2017-04-30 20:00:00-04	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	27	f
357	14 Days	2017-02-14 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	28	f
358	30 Days	2017-01-29 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	28	f
359	60 Days	2016-12-30 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	28	f
360	90 Days	2016-11-30 19:00:00-05	2016-11-11 15:15:50.281-05	2016-11-11 15:15:50.281-05	10	8	28	f
109	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	4	f
110	90 Days	2016-11-02 20:00:00-04	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	1	f
111	30 Days	2017-01-01 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	2	f
112	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	3	f
2065	7 Days	2017-04-23 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	9	f
2066	14 Days	2017-04-16 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	9	f
115	21 Days	2017-01-10 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	6	f
116	30 Days	2017-01-01 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	7	f
2067	30 Days	2017-03-31 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	9	f
118	7 Days	2017-01-24 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	9	f
119	14 Days	2017-01-17 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	9	f
120	30 Days	2017-01-01 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	9	f
121	7 Days	2017-01-24 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	10	f
122	7 Days	2017-01-24 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	11	f
123	Today	2016-11-10 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	12	f
124	90 Days	2016-11-02 20:00:00-04	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	13	f
125	90 Days	2016-11-02 20:00:00-04	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	14	f
126	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	15	f
127	7 Days	2017-01-24 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	16	f
128	14 Days	2017-01-17 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	16	f
129	21 Days	2017-01-10 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	16	f
130	7 Days	2017-01-24 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	17	f
131	60 Days	2016-12-02 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	18	f
132	60 Days	2016-12-02 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	19	f
133	21 Days	2017-01-10 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	20	f
134	14 Days	2017-01-17 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	21	f
135	60 Days	2016-12-02 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	22	f
136	30 Days	2017-01-01 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	23	f
2068	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	13	f
138	60 Days	2016-12-02 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	25	f
139	Oct 1 2017	2017-09-30 20:00:00-04	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	26	f
140	May 1 2017	2017-04-30 20:00:00-04	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	27	f
141	14 Days	2017-01-17 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	28	f
142	30 Days	2017-01-01 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	28	f
143	60 Days	2016-12-02 19:00:00-05	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	28	f
144	90 Days	2016-11-02 20:00:00-04	2016-11-11 07:54:04.242-05	2016-11-11 07:54:04.242-05	4	3	28	f
361	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	4	f
362	90 Days	2015-12-01 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	1	f
363	30 Days	2016-01-30 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	2	f
364	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	3	f
2069	1 Day	2017-04-29 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	12	f
2070	7 Days	2017-04-23 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	11	f
367	21 Days	2016-02-08 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	6	f
368	30 Days	2016-01-30 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	7	f
2071	7 Days	2017-04-23 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	16	f
370	7 Days	2016-02-22 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	9	f
371	14 Days	2016-02-15 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	9	f
372	30 Days	2016-01-30 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	9	f
373	7 Days	2016-02-22 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	10	f
374	7 Days	2016-02-22 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	11	f
375	Today	2016-11-10 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	12	f
376	90 Days	2015-12-01 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	13	f
377	90 Days	2015-12-01 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	14	f
378	Summer 2017	2017-06-30 20:00:00-04	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	15	f
379	7 Days	2016-02-22 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	16	f
380	14 Days	2016-02-15 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	16	f
381	21 Days	2016-02-08 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	16	f
382	7 Days	2016-02-22 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	17	f
383	60 Days	2015-12-31 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	18	f
384	60 Days	2015-12-31 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	19	f
385	21 Days	2016-02-08 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	20	f
386	14 Days	2016-02-15 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	21	f
387	60 Days	2015-12-31 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	22	f
388	30 Days	2016-01-30 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	23	f
2072	14 Days	2017-04-16 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	16	f
390	60 Days	2015-12-31 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	25	f
391	Oct 1 2017	2017-09-30 20:00:00-04	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	26	f
392	May 1 2017	2017-04-30 20:00:00-04	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	27	f
393	14 Days	2016-02-15 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	28	f
394	30 Days	2016-01-30 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	28	f
395	60 Days	2015-12-31 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	28	f
396	90 Days	2015-12-01 19:00:00-05	2016-11-11 15:18:25.362-05	2016-11-11 15:18:25.362-05	11	8	28	f
2073	21 Days	2017-04-09 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	16	f
2074	7 Days	2017-04-23 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	17	f
2075	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	18	f
2076	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	19	f
2077	14 Days	2017-04-16 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	21	f
2078	30 Days	2017-03-31 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	23	f
2079	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	25	f
2080	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	26	f
2081	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	22	f
2082	May 1 2017	2017-04-30 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	27	f
2083	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	3	f
2084	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	3	f
2085	14 Days	2017-04-16 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	28	f
2086	30 Days	2017-03-31 20:00:00-04	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	28	f
2087	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	28	f
2088	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:02:54.545-05	2016-12-27 18:02:54.545-05	58	35	28	f
2341	90 Days	2017-01-03 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	1	f
2342	21 Days	2017-03-13 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	6	f
2343	90 Days	2017-01-03 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	30	f
2344	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	30	f
2345	21 Days	2017-03-13 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	20	f
2346	60 Days	2017-02-02 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	14	f
2347	90 Days	2017-01-03 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	15	f
2348	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	15	f
2349	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	4	f
2350	30 Days	2017-03-04 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	2	f
2351	30 Days	2017-03-04 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	7	f
2352	7 Days	2017-03-27 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	10	f
2353	7 Days	2017-03-27 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	9	f
2354	14 Days	2017-03-20 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	9	f
2355	30 Days	2017-03-04 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	9	f
2356	90 Days	2017-01-03 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	13	f
2357	1 Day	2017-04-02 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	12	f
2358	7 Days	2017-03-27 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	11	f
2359	7 Days	2017-03-27 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	16	f
2360	14 Days	2017-03-20 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	16	f
433	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	4	f
434	90 Days	2016-10-01 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	1	f
435	30 Days	2016-11-30 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	2	f
436	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	3	f
2361	21 Days	2017-03-13 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	16	f
2362	7 Days	2017-03-27 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	17	f
439	21 Days	2016-12-09 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	6	f
440	30 Days	2016-11-30 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	7	f
2363	60 Days	2017-02-02 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	18	f
442	7 Days	2016-12-23 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	9	f
443	14 Days	2016-12-16 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	9	f
444	30 Days	2016-11-30 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	9	f
445	7 Days	2016-12-23 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	10	f
446	7 Days	2016-12-23 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	11	f
447	Today	2016-11-11 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	12	f
448	90 Days	2016-10-01 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	13	f
449	90 Days	2016-10-01 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	14	f
450	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	15	f
451	7 Days	2016-12-23 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	16	f
452	14 Days	2016-12-16 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	16	f
453	21 Days	2016-12-09 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	16	f
454	7 Days	2016-12-23 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	17	f
455	60 Days	2016-10-31 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	18	f
456	60 Days	2016-10-31 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	19	f
457	21 Days	2016-12-09 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	20	f
458	14 Days	2016-12-16 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	21	f
459	60 Days	2016-10-31 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	22	f
460	30 Days	2016-11-30 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	23	f
2364	60 Days	2017-02-02 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	19	f
462	60 Days	2016-10-31 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	25	f
463	Oct 1 2017	2017-09-30 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	26	f
464	May 1 2017	2017-04-30 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	27	f
465	14 Days	2016-12-16 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	28	f
466	30 Days	2016-11-30 19:00:00-05	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	28	f
467	60 Days	2016-10-31 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	28	f
468	90 Days	2016-10-01 20:00:00-04	2016-11-12 10:14:10.771-05	2016-11-12 10:14:10.771-05	13	10	28	f
469	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	4	f
470	90 Days	2016-10-02 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	1	f
471	30 Days	2016-12-01 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	2	f
472	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	3	f
2365	14 Days	2017-03-20 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	21	f
2366	30 Days	2017-03-04 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	23	f
475	21 Days	2016-12-10 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	6	f
476	30 Days	2016-12-01 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	7	f
478	7 Days	2016-12-24 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	9	f
479	14 Days	2016-12-17 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	9	f
480	30 Days	2016-12-01 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	9	f
481	7 Days	2016-12-24 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	10	f
482	7 Days	2016-12-24 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	11	f
483	Today	2016-11-11 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	12	f
484	90 Days	2016-10-02 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	13	f
485	90 Days	2016-10-02 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	14	f
486	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	15	f
487	7 Days	2016-12-24 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	16	f
488	14 Days	2016-12-17 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	16	f
489	21 Days	2016-12-10 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	16	f
490	7 Days	2016-12-24 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	17	f
491	60 Days	2016-11-01 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	18	f
492	60 Days	2016-11-01 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	19	f
493	21 Days	2016-12-10 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	20	f
494	14 Days	2016-12-17 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	21	f
495	60 Days	2016-11-01 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	22	f
496	30 Days	2016-12-01 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	23	f
2089	90 Days	2015-11-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	1	f
498	60 Days	2016-11-01 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	25	f
499	Oct 1 2017	2017-09-30 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	26	f
500	May 1 2017	2017-04-30 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	27	f
501	14 Days	2016-12-17 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	28	f
502	30 Days	2016-12-01 19:00:00-05	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	28	f
503	60 Days	2016-11-01 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	28	f
504	90 Days	2016-10-02 20:00:00-04	2016-11-12 10:16:09.216-05	2016-11-12 10:16:09.216-05	14	10	28	f
2090	21 Days	2016-01-10 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	6	f
2091	90 Days	2015-11-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	30	f
2092	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	30	f
2093	21 Days	2016-01-10 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	20	f
2094	60 Days	2015-12-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	14	f
2095	90 Days	2015-11-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	15	f
2096	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	15	f
2097	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	4	f
2098	30 Days	2016-01-01 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	2	f
2099	30 Days	2016-01-01 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	7	f
2100	7 Days	2016-01-24 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	10	f
2101	7 Days	2016-01-24 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	9	f
2102	14 Days	2016-01-17 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	9	f
2103	30 Days	2016-01-01 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	9	f
2104	90 Days	2015-11-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	13	f
2105	1 Day	2016-01-30 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	12	f
2106	7 Days	2016-01-24 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	11	f
2107	7 Days	2016-01-24 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	16	f
2108	14 Days	2016-01-17 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	16	f
2109	21 Days	2016-01-10 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	16	f
2110	7 Days	2016-01-24 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	17	f
2111	60 Days	2015-12-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	18	f
2112	60 Days	2015-12-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	19	f
2113	14 Days	2016-01-17 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	21	f
2114	30 Days	2016-01-01 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	23	f
2115	60 Days	2015-12-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	25	f
2116	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	26	f
2117	60 Days	2015-12-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	22	f
2118	May 1 2017	2017-04-30 20:00:00-04	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	27	f
2119	90 Days	2015-11-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	3	f
2120	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	3	f
2121	14 Days	2016-01-17 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	28	f
2122	30 Days	2016-01-01 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	28	f
2123	60 Days	2015-12-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	28	f
2124	90 Days	2015-11-02 19:00:00-05	2016-12-27 18:05:31.428-05	2016-12-27 18:05:31.428-05	59	35	28	f
2367	60 Days	2017-02-02 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	25	f
541	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	4	f
542	90 Days	2016-11-30 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	1	f
543	30 Days	2017-01-29 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	2	f
544	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	3	f
2368	Oct 1 2017	2017-09-30 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	26	f
2369	60 Days	2017-02-02 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	22	f
547	21 Days	2017-02-07 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	6	f
548	30 Days	2017-01-29 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	7	f
550	7 Days	2017-02-21 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	9	f
551	14 Days	2017-02-14 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	9	f
552	30 Days	2017-01-29 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	9	f
553	7 Days	2017-02-21 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	10	f
554	7 Days	2017-02-21 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	11	f
555	Today	2016-11-11 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	12	f
556	90 Days	2016-11-30 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	13	f
557	90 Days	2016-11-30 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	14	f
558	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	15	f
559	7 Days	2017-02-21 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	16	f
560	14 Days	2017-02-14 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	16	f
561	21 Days	2017-02-07 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	16	f
562	7 Days	2017-02-21 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	17	f
563	60 Days	2016-12-30 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	18	f
564	60 Days	2016-12-30 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	19	f
565	21 Days	2017-02-07 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	20	f
566	14 Days	2017-02-14 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	21	f
567	60 Days	2016-12-30 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	22	f
568	30 Days	2017-01-29 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	23	f
2125	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	1	f
570	60 Days	2016-12-30 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	25	f
571	Oct 1 2017	2017-09-30 20:00:00-04	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	26	f
572	May 1 2017	2017-04-30 20:00:00-04	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	27	f
573	14 Days	2017-02-14 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	28	f
574	30 Days	2017-01-29 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	28	f
575	60 Days	2016-12-30 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	28	f
576	90 Days	2016-11-30 19:00:00-05	2016-11-12 12:35:23.259-05	2016-11-12 12:35:23.259-05	16	11	28	f
577	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	4	f
578	90 Days	2016-11-30 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	1	f
579	30 Days	2017-01-29 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	2	f
580	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	3	f
2126	21 Days	2017-04-09 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	6	f
2127	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	30	f
583	21 Days	2017-02-07 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	6	f
584	30 Days	2017-01-29 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	7	f
2128	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	30	f
586	7 Days	2017-02-21 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	9	f
587	14 Days	2017-02-14 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	9	f
588	30 Days	2017-01-29 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	9	f
589	7 Days	2017-02-21 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	10	f
590	7 Days	2017-02-21 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	11	f
591	Today	2016-11-11 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	12	f
592	90 Days	2016-11-30 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	13	f
593	90 Days	2016-11-30 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	14	f
594	Summer 2017	2017-06-30 20:00:00-04	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	15	f
595	7 Days	2017-02-21 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	16	f
596	14 Days	2017-02-14 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	16	f
597	21 Days	2017-02-07 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	16	f
598	7 Days	2017-02-21 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	17	f
599	60 Days	2016-12-30 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	18	f
600	60 Days	2016-12-30 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	19	f
601	21 Days	2017-02-07 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	20	f
602	14 Days	2017-02-14 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	21	f
603	60 Days	2016-12-30 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	22	f
604	30 Days	2017-01-29 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	23	f
2129	21 Days	2017-04-09 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	20	f
606	60 Days	2016-12-30 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	25	f
607	Oct 1 2017	2017-09-30 20:00:00-04	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	26	f
608	May 1 2017	2017-04-30 20:00:00-04	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	27	f
609	14 Days	2017-02-14 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	28	f
610	30 Days	2017-01-29 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	28	f
611	60 Days	2016-12-30 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	28	f
612	90 Days	2016-11-30 19:00:00-05	2016-11-12 18:36:18.455-05	2016-11-12 18:36:18.455-05	17	4	28	f
2130	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	14	f
2131	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	15	f
2132	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	15	f
2133	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	4	f
2134	30 Days	2017-03-31 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	2	f
2135	30 Days	2017-03-31 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	7	f
2136	7 Days	2017-04-23 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	10	f
2137	7 Days	2017-04-23 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	9	f
2138	14 Days	2017-04-16 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	9	f
2139	30 Days	2017-03-31 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	9	f
2140	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	13	f
2141	1 Day	2017-04-29 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	12	f
2142	7 Days	2017-04-23 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	11	f
2143	7 Days	2017-04-23 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	16	f
2144	14 Days	2017-04-16 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	16	f
2145	21 Days	2017-04-09 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	16	f
2146	7 Days	2017-04-23 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	17	f
2147	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	18	f
2148	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	19	f
2149	14 Days	2017-04-16 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	21	f
2150	30 Days	2017-03-31 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	23	f
2151	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	25	f
2152	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	26	f
2153	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	22	f
2154	May 1 2017	2017-04-30 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	27	f
2155	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	3	f
2156	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	3	f
2157	14 Days	2017-04-16 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	28	f
2158	30 Days	2017-03-31 20:00:00-04	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	28	f
2159	60 Days	2017-03-01 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	28	f
2160	90 Days	2017-01-30 19:00:00-05	2016-12-27 18:07:17.946-05	2016-12-27 18:07:17.946-05	60	35	28	f
2370	May 1 2017	2017-04-30 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	27	f
2371	90 Days	2017-01-03 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	3	f
2372	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	3	f
2373	14 Days	2017-03-20 20:00:00-04	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	28	f
2374	30 Days	2017-03-04 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	28	f
2375	60 Days	2017-02-02 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	28	f
1185	14 Days	2017-02-14 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	28	f
1186	30 Days	2017-01-29 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	28	f
1187	60 Days	2016-12-30 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	28	f
1188	90 Days	2016-11-30 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	28	f
1205	90 Days	2016-11-30 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	14	f
1206	Summer 2017	2017-06-30 20:00:00-04	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	15	f
1207	7 Days	2017-02-21 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	16	f
2161	90 Days	2016-12-31 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	1	f
2162	21 Days	2017-03-10 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	6	f
2163	90 Days	2016-12-31 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	30	f
2164	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	30	f
2165	21 Days	2017-03-10 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	20	f
2166	60 Days	2017-01-30 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	14	f
2167	90 Days	2016-12-31 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	15	f
2168	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	15	f
2169	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	4	f
2170	30 Days	2017-03-01 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	2	f
2171	30 Days	2017-03-01 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	7	f
2172	7 Days	2017-03-24 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	10	f
2173	7 Days	2017-03-24 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	9	f
2174	14 Days	2017-03-17 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	9	f
2175	30 Days	2017-03-01 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	9	f
2176	90 Days	2016-12-31 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	13	f
2177	1 Day	2017-03-30 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	12	f
2178	7 Days	2017-03-24 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	11	f
2179	7 Days	2017-03-24 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	16	f
2180	14 Days	2017-03-17 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	16	f
2181	21 Days	2017-03-10 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	16	f
2182	7 Days	2017-03-24 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	17	f
2183	60 Days	2017-01-30 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	18	f
2184	60 Days	2017-01-30 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	19	f
2185	14 Days	2017-03-17 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	21	f
2186	30 Days	2017-03-01 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	23	f
2187	60 Days	2017-01-30 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	25	f
2188	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	26	f
2189	60 Days	2017-01-30 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	22	f
2190	May 1 2017	2017-04-30 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	27	f
2191	90 Days	2016-12-31 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	3	f
2192	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	3	f
2193	14 Days	2017-03-17 20:00:00-04	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	28	f
2194	30 Days	2017-03-01 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	28	f
2195	60 Days	2017-01-30 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	28	f
2196	90 Days	2016-12-31 19:00:00-05	2016-12-27 20:31:35.396-05	2016-12-27 20:31:35.396-05	61	25	28	f
1117	Summer 2017	2017-06-30 20:00:00-04	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	4	f
1118	90 Days	2016-11-30 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	1	f
1119	30 Days	2017-01-29 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	2	f
1120	Summer 2017	2017-06-30 20:00:00-04	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	3	f
2376	90 Days	2017-01-03 19:00:00-05	2017-01-10 10:23:57.227-05	2017-01-10 10:23:57.227-05	66	5	28	f
1123	21 Days	2017-02-07 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	6	f
1124	30 Days	2017-01-29 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	7	f
1126	7 Days	2017-02-21 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	9	f
1127	14 Days	2017-02-14 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	9	f
1128	30 Days	2017-01-29 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	9	f
1129	7 Days	2017-02-21 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	10	f
1130	7 Days	2017-02-21 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	11	f
1131	Today	2016-12-03 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	12	f
1132	90 Days	2016-11-30 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	13	f
1133	90 Days	2016-11-30 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	14	f
1134	Summer 2017	2017-06-30 20:00:00-04	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	15	f
1135	7 Days	2017-02-21 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	16	f
1136	14 Days	2017-02-14 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	16	f
1137	21 Days	2017-02-07 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	16	f
1138	7 Days	2017-02-21 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	17	f
1139	60 Days	2016-12-30 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	18	f
1140	60 Days	2016-12-30 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	19	f
1141	21 Days	2017-02-07 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	20	f
1142	14 Days	2017-02-14 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	21	f
1143	60 Days	2016-12-30 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	22	f
1144	30 Days	2017-01-29 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	23	f
1146	60 Days	2016-12-30 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	25	f
1147	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	26	f
1148	May 1 2017	2017-04-30 20:00:00-04	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	27	f
1149	14 Days	2017-02-14 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	28	f
1150	30 Days	2017-01-29 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	28	f
1151	60 Days	2016-12-30 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	28	f
1152	90 Days	2016-11-30 19:00:00-05	2016-12-04 09:40:26.225-05	2016-12-04 09:40:26.225-05	32	19	28	f
1189	Summer 2017	2017-06-30 20:00:00-04	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	4	f
1190	90 Days	2016-11-30 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	1	f
1191	30 Days	2017-01-29 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	2	f
1192	Summer 2017	2017-06-30 20:00:00-04	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	3	f
1195	21 Days	2017-02-07 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	6	f
1196	30 Days	2017-01-29 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	7	f
1198	7 Days	2017-02-21 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	9	f
1199	14 Days	2017-02-14 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	9	f
1200	30 Days	2017-01-29 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	9	f
1201	7 Days	2017-02-21 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	10	f
1202	7 Days	2017-02-21 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	11	f
1203	Today	2016-12-03 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	12	f
1204	90 Days	2016-11-30 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	13	f
1009	Summer 2017	2017-06-30 20:00:00-04	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	4	f
1010	90 Days	2015-12-01 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	1	f
1011	30 Days	2016-01-30 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	2	f
1012	Summer 2017	2017-06-30 20:00:00-04	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	3	f
2197	90 Days	2016-12-31 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	1	f
2198	21 Days	2017-03-10 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	6	f
1015	21 Days	2016-02-08 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	6	f
1016	30 Days	2016-01-30 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	7	f
2199	90 Days	2016-12-31 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	30	f
1018	7 Days	2016-02-22 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	9	f
1019	14 Days	2016-02-15 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	9	f
1020	30 Days	2016-01-30 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	9	f
757	Summer 2017	2017-06-30 20:00:00-04	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	4	f
758	90 Days	2016-11-02 20:00:00-04	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	1	f
759	30 Days	2017-01-01 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	2	f
760	Summer 2017	2017-06-30 20:00:00-04	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	3	f
2200	Summer 2017	2017-06-30 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	30	f
2201	21 Days	2017-03-10 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	20	f
763	21 Days	2017-01-10 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	6	f
764	30 Days	2017-01-01 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	7	f
2202	60 Days	2017-01-30 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	14	f
766	7 Days	2017-01-24 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	9	f
767	14 Days	2017-01-17 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	9	f
768	30 Days	2017-01-01 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	9	f
769	7 Days	2017-01-24 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	10	f
770	7 Days	2017-01-24 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	11	f
771	Today	2016-11-14 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	12	f
772	90 Days	2016-11-02 20:00:00-04	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	13	f
773	90 Days	2016-11-02 20:00:00-04	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	14	f
774	Summer 2017	2017-06-30 20:00:00-04	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	15	f
775	7 Days	2017-01-24 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	16	f
776	14 Days	2017-01-17 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	16	f
777	21 Days	2017-01-10 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	16	f
778	7 Days	2017-01-24 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	17	f
779	60 Days	2016-12-02 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	18	f
780	60 Days	2016-12-02 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	19	f
781	21 Days	2017-01-10 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	20	f
782	14 Days	2017-01-17 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	21	f
783	60 Days	2016-12-02 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	22	f
784	30 Days	2017-01-01 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	23	f
2203	90 Days	2016-12-31 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	15	f
786	60 Days	2016-12-02 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	25	f
787	Oct 1 2017	2017-09-30 20:00:00-04	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	26	f
788	May 1 2017	2017-04-30 20:00:00-04	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	27	f
789	14 Days	2017-01-17 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	28	f
790	30 Days	2017-01-01 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	28	f
791	60 Days	2016-12-02 19:00:00-05	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	28	f
792	90 Days	2016-11-02 20:00:00-04	2016-11-15 06:30:56.866-05	2016-11-15 06:30:56.866-05	22	11	28	f
1021	7 Days	2016-02-22 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	10	f
1022	7 Days	2016-02-22 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	11	f
1023	Today	2016-11-30 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	12	f
1024	90 Days	2015-12-01 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	13	f
1025	90 Days	2015-12-01 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	14	f
1026	Summer 2017	2017-06-30 20:00:00-04	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	15	f
1027	7 Days	2016-02-22 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	16	f
1028	14 Days	2016-02-15 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	16	f
1029	21 Days	2016-02-08 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	16	f
1030	7 Days	2016-02-22 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	17	f
1031	60 Days	2015-12-31 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	18	f
1032	60 Days	2015-12-31 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	19	f
1033	21 Days	2016-02-08 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	20	f
1034	14 Days	2016-02-15 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	21	f
1035	60 Days	2015-12-31 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	22	f
1036	30 Days	2016-01-30 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	23	f
2204	Summer 2017	2017-06-30 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	15	f
1038	60 Days	2015-12-31 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	25	f
1039	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	26	f
1040	May 1 2017	2017-04-30 20:00:00-04	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	27	f
1041	14 Days	2016-02-15 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	28	f
1042	30 Days	2016-01-30 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	28	f
1043	60 Days	2015-12-31 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	28	f
1044	90 Days	2015-12-01 19:00:00-05	2016-12-01 16:55:18.239-05	2016-12-01 16:55:18.239-05	29	18	28	f
1153	Summer 2017	2017-06-30 20:00:00-04	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	4	f
1154	90 Days	2016-11-30 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	1	f
1155	30 Days	2017-01-29 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	2	f
1156	Summer 2017	2017-06-30 20:00:00-04	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	3	f
2205	Summer 2017	2017-06-30 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	4	f
2206	30 Days	2017-03-01 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	2	f
1159	21 Days	2017-02-07 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	6	f
1160	30 Days	2017-01-29 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	7	f
2207	30 Days	2017-03-01 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	7	f
1162	7 Days	2017-02-21 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	9	f
1163	14 Days	2017-02-14 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	9	f
1164	30 Days	2017-01-29 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	9	f
2208	7 Days	2017-03-24 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	10	f
2209	7 Days	2017-03-24 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	9	f
2210	14 Days	2017-03-17 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	9	f
2211	30 Days	2017-03-01 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	9	f
2212	90 Days	2016-12-31 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	13	f
2213	1 Day	2017-03-30 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	12	f
2214	7 Days	2017-03-24 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	11	f
2215	7 Days	2017-03-24 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	16	f
2216	14 Days	2017-03-17 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	16	f
2217	21 Days	2017-03-10 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	16	f
2218	7 Days	2017-03-24 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	17	f
2219	60 Days	2017-01-30 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	18	f
2220	60 Days	2017-01-30 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	19	f
2221	14 Days	2017-03-17 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	21	f
2222	30 Days	2017-03-01 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	23	f
2223	60 Days	2017-01-30 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	25	f
2224	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	26	f
2225	60 Days	2017-01-30 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	22	f
2226	May 1 2017	2017-04-30 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	27	f
2227	90 Days	2016-12-31 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	3	f
2228	Summer 2017	2017-06-30 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	3	f
2229	14 Days	2017-03-17 20:00:00-04	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	28	f
2230	30 Days	2017-03-01 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	28	f
2231	60 Days	2017-01-30 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	28	f
2232	90 Days	2016-12-31 19:00:00-05	2016-12-29 17:52:03.392-05	2016-12-29 17:52:03.392-05	62	36	28	f
2377	90 Days	2017-01-31 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	1	f
2378	21 Days	2017-04-10 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	6	f
2379	90 Days	2017-01-31 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	30	f
2380	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	30	f
2381	21 Days	2017-04-10 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	20	f
2382	60 Days	2017-03-02 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	14	f
2383	90 Days	2017-01-31 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	15	f
2384	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	15	f
2385	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	4	f
2386	30 Days	2017-04-01 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	2	f
2387	30 Days	2017-04-01 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	7	f
1045	Summer 2017	2017-06-30 20:00:00-04	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	4	f
1046	90 Days	2016-11-30 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	1	f
1047	30 Days	2017-01-29 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	2	f
1048	Summer 2017	2017-06-30 20:00:00-04	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	3	f
2388	7 Days	2017-04-24 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	10	f
2389	7 Days	2017-04-24 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	9	f
1051	21 Days	2017-02-07 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	6	f
1052	30 Days	2017-01-29 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	7	f
2390	14 Days	2017-04-17 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	9	f
1054	7 Days	2017-02-21 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	9	f
1055	14 Days	2017-02-14 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	9	f
1056	30 Days	2017-01-29 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	9	f
1057	7 Days	2017-02-21 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	10	f
1058	7 Days	2017-02-21 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	11	f
1059	Today	2016-11-30 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	12	f
1060	90 Days	2016-11-30 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	13	f
1061	90 Days	2016-11-30 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	14	f
1062	Summer 2017	2017-06-30 20:00:00-04	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	15	f
1063	7 Days	2017-02-21 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	16	f
1064	14 Days	2017-02-14 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	16	f
1065	21 Days	2017-02-07 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	16	f
1066	7 Days	2017-02-21 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	17	f
1067	60 Days	2016-12-30 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	18	f
1068	60 Days	2016-12-30 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	19	f
1069	21 Days	2017-02-07 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	20	f
1070	14 Days	2017-02-14 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	21	f
1071	60 Days	2016-12-30 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	22	f
1072	30 Days	2017-01-29 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	23	f
2391	30 Days	2017-04-01 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	9	f
1074	60 Days	2016-12-30 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	25	f
1075	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	26	f
1076	May 1 2017	2017-04-30 20:00:00-04	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	27	f
1077	14 Days	2017-02-14 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	28	f
1078	30 Days	2017-01-29 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	28	f
1079	60 Days	2016-12-30 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	28	f
1080	90 Days	2016-11-30 19:00:00-05	2016-12-01 16:56:16.372-05	2016-12-01 16:56:16.372-05	30	18	28	f
1165	7 Days	2017-02-21 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	10	f
1166	7 Days	2017-02-21 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	11	f
1167	Today	2016-12-03 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	12	f
1168	90 Days	2016-11-30 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	13	f
1169	90 Days	2016-11-30 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	14	f
1170	Summer 2017	2017-06-30 20:00:00-04	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	15	f
1171	7 Days	2017-02-21 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	16	f
1172	14 Days	2017-02-14 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	16	f
1173	21 Days	2017-02-07 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	16	f
1174	7 Days	2017-02-21 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	17	f
1175	60 Days	2016-12-30 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	18	f
1176	60 Days	2016-12-30 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	19	f
1177	21 Days	2017-02-07 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	20	f
1178	14 Days	2017-02-14 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	21	f
1179	60 Days	2016-12-30 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	22	f
1180	30 Days	2017-01-29 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	23	f
2392	90 Days	2017-01-31 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	13	f
1182	60 Days	2016-12-30 19:00:00-05	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	25	f
1183	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	26	f
1184	May 1 2017	2017-04-30 20:00:00-04	2016-12-04 18:21:24.737-05	2016-12-04 18:21:24.737-05	33	21	27	f
1208	14 Days	2017-02-14 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	16	f
1209	21 Days	2017-02-07 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	16	f
1210	7 Days	2017-02-21 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	17	f
1211	60 Days	2016-12-30 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	18	f
1212	60 Days	2016-12-30 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	19	f
1213	21 Days	2017-02-07 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	20	f
1214	14 Days	2017-02-14 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	21	f
1215	60 Days	2016-12-30 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	22	f
1216	30 Days	2017-01-29 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	23	f
2233	90 Days	2017-01-03 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	1	f
1218	60 Days	2016-12-30 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	25	f
1219	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	26	f
1220	May 1 2017	2017-04-30 20:00:00-04	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	27	f
1221	14 Days	2017-02-14 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	28	f
1222	30 Days	2017-01-29 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	28	f
1223	60 Days	2016-12-30 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	28	f
1224	90 Days	2016-11-30 19:00:00-05	2016-12-04 18:21:43.454-05	2016-12-04 18:21:43.454-05	34	21	28	f
2234	21 Days	2017-03-13 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	6	f
2235	90 Days	2017-01-03 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	30	f
2236	Summer 2017	2017-06-30 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	30	f
2237	21 Days	2017-03-13 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	20	f
2238	60 Days	2017-02-02 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	14	f
2239	90 Days	2017-01-03 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	15	f
2240	Summer 2017	2017-06-30 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	15	f
2241	Summer 2017	2017-06-30 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	4	f
2242	30 Days	2017-03-04 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	2	f
2243	30 Days	2017-03-04 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	7	f
2244	7 Days	2017-03-27 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	10	f
2245	7 Days	2017-03-27 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	9	f
2246	14 Days	2017-03-20 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	9	f
2247	30 Days	2017-03-04 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	9	f
2248	90 Days	2017-01-03 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	13	f
2249	1 Day	2017-04-02 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	12	f
2250	7 Days	2017-03-27 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	11	f
2251	7 Days	2017-03-27 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	16	f
2252	14 Days	2017-03-20 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	16	f
2253	21 Days	2017-03-13 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	16	f
2254	7 Days	2017-03-27 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	17	f
2255	60 Days	2017-02-02 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	18	f
2256	60 Days	2017-02-02 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	19	f
2257	14 Days	2017-03-20 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	21	f
2258	30 Days	2017-03-04 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	23	f
2259	60 Days	2017-02-02 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	25	f
2260	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	26	f
2261	60 Days	2017-02-02 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	22	f
2262	May 1 2017	2017-04-30 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	27	f
2263	90 Days	2017-01-03 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	3	f
2264	Summer 2017	2017-06-30 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	3	f
2265	14 Days	2017-03-20 20:00:00-04	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	28	f
2266	30 Days	2017-03-04 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	28	f
2267	60 Days	2017-02-02 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	28	f
2268	90 Days	2017-01-03 19:00:00-05	2016-12-29 17:55:16.116-05	2016-12-29 17:55:16.116-05	63	37	28	f
2393	1 Day	2017-04-30 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	12	f
1261	Summer 2017	2017-06-30 20:00:00-04	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	4	f
1262	90 Days	2017-11-02 20:00:00-04	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	1	f
1263	30 Days	2018-01-01 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	2	f
1264	Summer 2017	2017-06-30 20:00:00-04	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	3	f
2394	7 Days	2017-04-24 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	11	f
2395	7 Days	2017-04-24 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	16	f
1267	21 Days	2018-01-10 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	6	f
1268	30 Days	2018-01-01 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	7	f
2396	14 Days	2017-04-17 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	16	f
1270	7 Days	2018-01-24 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	9	f
1271	14 Days	2018-01-17 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	9	f
1272	30 Days	2018-01-01 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	9	f
1273	7 Days	2018-01-24 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	10	f
1274	7 Days	2018-01-24 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	11	f
1275	Today	2016-12-08 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	12	f
1276	90 Days	2017-11-02 20:00:00-04	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	13	f
1277	90 Days	2017-11-02 20:00:00-04	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	14	f
1278	Summer 2017	2017-06-30 20:00:00-04	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	15	f
1279	7 Days	2018-01-24 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	16	f
1280	14 Days	2018-01-17 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	16	f
1281	21 Days	2018-01-10 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	16	f
1282	7 Days	2018-01-24 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	17	f
1283	60 Days	2017-12-02 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	18	f
1284	60 Days	2017-12-02 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	19	f
1285	21 Days	2018-01-10 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	20	f
1286	14 Days	2018-01-17 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	21	f
1287	60 Days	2017-12-02 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	22	f
1288	30 Days	2018-01-01 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	23	f
2397	21 Days	2017-04-10 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	16	f
1290	60 Days	2017-12-02 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	25	f
1291	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	26	f
1292	May 1 2017	2017-04-30 20:00:00-04	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	27	f
1293	14 Days	2018-01-17 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	28	f
1294	30 Days	2018-01-01 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	28	f
1295	60 Days	2017-12-02 19:00:00-05	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	28	f
1296	90 Days	2017-11-02 20:00:00-04	2016-12-09 17:11:02.605-05	2016-12-09 17:11:02.605-05	36	1	28	f
1693	90 Days	2016-12-31 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	1	f
1694	90 Days	2016-12-31 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	30	f
1695	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	30	f
1696	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	4	f
1697	30 Days	2017-03-01 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	2	f
1698	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	3	f
2269	90 Days	2017-01-31 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	1	f
2270	21 Days	2017-04-10 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	6	f
1701	21 Days	2017-03-10 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	6	f
1702	30 Days	2017-03-01 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	7	f
2271	90 Days	2017-01-31 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	30	f
1704	7 Days	2017-03-24 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	9	f
1705	14 Days	2017-03-17 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	9	f
1706	30 Days	2017-03-01 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	9	f
1707	7 Days	2017-03-24 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	10	f
1708	7 Days	2017-03-24 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	11	f
1709	90 Days	2016-12-31 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	13	f
1710	90 Days	2016-12-31 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	14	f
1711	Summer 2017	2017-06-30 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	15	f
1712	1 Day	2017-03-30 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	12	f
1713	7 Days	2017-03-24 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	16	f
1714	14 Days	2017-03-17 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	16	f
1715	21 Days	2017-03-10 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	16	f
1716	7 Days	2017-03-24 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	17	f
1717	60 Days	2017-01-30 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	18	f
1718	60 Days	2017-01-30 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	19	f
1719	21 Days	2017-03-10 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	20	f
1720	14 Days	2017-03-17 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	21	f
1721	60 Days	2017-01-30 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	22	f
1722	30 Days	2017-03-01 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	23	f
2272	Summer 2017	2017-06-30 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	30	f
1724	60 Days	2017-01-30 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	25	f
1725	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	26	f
1726	May 1 2017	2017-04-30 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	27	f
1727	14 Days	2017-03-17 20:00:00-04	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	28	f
1728	30 Days	2017-03-01 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	28	f
1729	60 Days	2017-01-30 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	28	f
1730	90 Days	2016-12-31 19:00:00-05	2016-12-27 16:42:02.172-05	2016-12-27 16:42:02.172-05	48	31	28	f
2273	21 Days	2017-04-10 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	20	f
2274	60 Days	2017-03-02 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	14	f
2275	90 Days	2017-01-31 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	15	f
2276	Summer 2017	2017-06-30 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	15	f
2277	Summer 2017	2017-06-30 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	4	f
2278	30 Days	2017-04-01 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	2	f
2279	30 Days	2017-04-01 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	7	f
2280	7 Days	2017-04-24 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	10	f
2281	7 Days	2017-04-24 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	9	f
2282	14 Days	2017-04-17 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	9	f
2283	30 Days	2017-04-01 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	9	f
2284	90 Days	2017-01-31 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	13	f
2285	1 Day	2017-04-30 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	12	f
2286	7 Days	2017-04-24 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	11	f
2287	7 Days	2017-04-24 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	16	f
2288	14 Days	2017-04-17 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	16	f
2289	21 Days	2017-04-10 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	16	f
2290	7 Days	2017-04-24 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	17	f
2291	60 Days	2017-03-02 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	18	f
2292	60 Days	2017-03-02 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	19	f
2293	14 Days	2017-04-17 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	21	f
2294	30 Days	2017-04-01 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	23	f
2295	60 Days	2017-03-02 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	25	f
2296	Oct 1 2017	2017-09-30 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	26	f
2297	60 Days	2017-03-02 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	22	f
2298	May 1 2017	2017-04-30 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	27	f
2299	90 Days	2017-01-31 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	3	f
2300	Summer 2017	2017-06-30 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	3	f
2301	14 Days	2017-04-17 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	28	f
2302	30 Days	2017-04-01 20:00:00-04	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	28	f
2303	60 Days	2017-03-02 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	28	f
2304	90 Days	2017-01-31 19:00:00-05	2017-01-07 03:24:32.855-05	2017-01-07 03:24:32.855-05	64	35	28	f
2398	7 Days	2017-04-24 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	17	f
2399	60 Days	2017-03-02 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	18	f
1369	Summer 2017	2017-06-30 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	4	f
1370	90 Days	2016-12-31 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	1	f
1371	30 Days	2017-03-01 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	2	f
1372	Summer 2017	2017-06-30 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	3	f
2400	60 Days	2017-03-02 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	19	f
2401	14 Days	2017-04-17 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	21	f
1375	21 Days	2017-03-10 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	6	f
1376	30 Days	2017-03-01 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	7	f
2402	30 Days	2017-04-01 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	23	f
1378	7 Days	2017-03-24 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	9	f
1379	14 Days	2017-03-17 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	9	f
1380	30 Days	2017-03-01 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	9	f
1381	7 Days	2017-03-24 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	10	f
1382	7 Days	2017-03-24 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	11	f
1383	Today	2016-12-12 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	12	f
1384	90 Days	2016-12-31 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	13	f
1385	90 Days	2016-12-31 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	14	f
1386	Summer 2017	2017-06-30 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	15	f
1387	7 Days	2017-03-24 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	16	f
1388	14 Days	2017-03-17 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	16	f
1389	21 Days	2017-03-10 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	16	f
1390	7 Days	2017-03-24 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	17	f
1391	60 Days	2017-01-30 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	18	f
1392	60 Days	2017-01-30 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	19	f
1393	21 Days	2017-03-10 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	20	f
1394	14 Days	2017-03-17 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	21	f
1395	60 Days	2017-01-30 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	22	f
1396	30 Days	2017-03-01 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	23	f
2305	90 Days	2017-01-30 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	1	f
1398	60 Days	2017-01-30 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	25	f
1399	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	26	f
1400	May 1 2017	2017-04-30 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	27	f
1401	14 Days	2017-03-17 20:00:00-04	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	28	f
1402	30 Days	2017-03-01 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	28	f
1403	60 Days	2017-01-30 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	28	f
1404	90 Days	2016-12-31 19:00:00-05	2016-12-13 02:02:05.997-05	2016-12-13 02:02:05.997-05	39	25	28	f
1405	Summer 2017	2017-06-30 20:00:00-04	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	4	f
1406	90 Days	2016-11-30 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	1	f
1407	30 Days	2017-01-29 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	2	f
1408	Summer 2017	2017-06-30 20:00:00-04	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	3	f
2306	21 Days	2017-04-09 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	6	f
2307	90 Days	2017-01-30 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	30	f
1411	21 Days	2017-02-07 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	6	f
1412	30 Days	2017-01-29 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	7	f
2308	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	30	f
1414	7 Days	2017-02-21 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	9	f
1415	14 Days	2017-02-14 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	9	f
1416	30 Days	2017-01-29 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	9	f
1417	7 Days	2017-02-21 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	10	f
1418	7 Days	2017-02-21 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	11	f
1419	Today	2016-12-15 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	12	f
1420	90 Days	2016-11-30 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	13	f
1421	90 Days	2016-11-30 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	14	f
1422	Summer 2017	2017-06-30 20:00:00-04	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	15	f
1423	7 Days	2017-02-21 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	16	f
1424	14 Days	2017-02-14 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	16	f
1425	21 Days	2017-02-07 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	16	f
1426	7 Days	2017-02-21 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	17	f
1427	60 Days	2016-12-30 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	18	f
1428	60 Days	2016-12-30 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	19	f
1429	21 Days	2017-02-07 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	20	f
1430	14 Days	2017-02-14 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	21	f
1431	60 Days	2016-12-30 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	22	f
1432	30 Days	2017-01-29 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	23	f
2309	21 Days	2017-04-09 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	20	f
1434	60 Days	2016-12-30 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	25	f
1435	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	26	f
1436	May 1 2017	2017-04-30 20:00:00-04	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	27	f
1437	14 Days	2017-02-14 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	28	f
1438	30 Days	2017-01-29 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	28	f
1439	60 Days	2016-12-30 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	28	f
1440	90 Days	2016-11-30 19:00:00-05	2016-12-15 19:16:04.63-05	2016-12-15 19:16:04.63-05	40	27	28	f
1441	Summer 2017	2017-06-30 20:00:00-04	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	4	f
1442	90 Days	2016-11-30 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	1	f
1443	30 Days	2017-01-29 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	2	f
1444	Summer 2017	2017-06-30 20:00:00-04	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	3	f
2310	60 Days	2017-03-01 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	14	f
2311	90 Days	2017-01-30 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	15	f
1447	21 Days	2017-02-07 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	6	f
1448	30 Days	2017-01-29 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	7	f
2312	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	15	f
1450	7 Days	2017-02-21 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	9	f
1451	14 Days	2017-02-14 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	9	f
1452	30 Days	2017-01-29 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	9	f
1453	7 Days	2017-02-21 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	10	f
1454	7 Days	2017-02-21 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	11	f
1455	Today	2016-12-17 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	12	f
1456	90 Days	2016-11-30 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	13	f
1457	90 Days	2016-11-30 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	14	f
1458	Summer 2017	2017-06-30 20:00:00-04	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	15	f
1459	7 Days	2017-02-21 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	16	f
1460	14 Days	2017-02-14 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	16	f
1461	21 Days	2017-02-07 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	16	f
1462	7 Days	2017-02-21 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	17	f
1463	60 Days	2016-12-30 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	18	f
1464	60 Days	2016-12-30 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	19	f
1465	21 Days	2017-02-07 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	20	f
1466	14 Days	2017-02-14 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	21	f
1467	60 Days	2016-12-30 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	22	f
1468	30 Days	2017-01-29 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	23	f
2313	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	4	f
1470	60 Days	2016-12-30 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	25	f
1471	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	26	f
1472	May 1 2017	2017-04-30 20:00:00-04	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	27	f
1473	14 Days	2017-02-14 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	28	f
1474	30 Days	2017-01-29 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	28	f
1475	60 Days	2016-12-30 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	28	f
1476	90 Days	2016-11-30 19:00:00-05	2016-12-18 12:54:48.505-05	2016-12-18 12:54:48.505-05	41	25	28	f
1477	Summer 2017	2017-06-30 20:00:00-04	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	4	f
1478	90 Days	2016-12-01 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	1	f
1479	30 Days	2017-01-30 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	2	f
1480	Summer 2017	2017-06-30 20:00:00-04	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	3	f
2314	30 Days	2017-03-31 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	2	f
2315	30 Days	2017-03-31 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	7	f
1483	21 Days	2017-02-08 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	6	f
1484	30 Days	2017-01-30 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	7	f
2316	7 Days	2017-04-23 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	10	f
1486	7 Days	2017-02-22 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	9	f
1487	14 Days	2017-02-15 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	9	f
1488	30 Days	2017-01-30 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	9	f
1489	7 Days	2017-02-22 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	10	f
1490	7 Days	2017-02-22 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	11	f
1491	Today	2016-12-19 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	12	f
1492	90 Days	2016-12-01 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	13	f
1493	90 Days	2016-12-01 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	14	f
1494	Summer 2017	2017-06-30 20:00:00-04	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	15	f
1495	7 Days	2017-02-22 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	16	f
1496	14 Days	2017-02-15 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	16	f
1497	21 Days	2017-02-08 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	16	f
1498	7 Days	2017-02-22 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	17	f
1499	60 Days	2016-12-31 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	18	f
1500	60 Days	2016-12-31 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	19	f
1501	21 Days	2017-02-08 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	20	f
1502	14 Days	2017-02-15 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	21	f
1503	60 Days	2016-12-31 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	22	f
1504	30 Days	2017-01-30 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	23	f
2317	7 Days	2017-04-23 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	9	f
1506	60 Days	2016-12-31 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	25	f
1507	Oct 1 2017	2017-09-30 20:00:00-04	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	26	f
1508	May 1 2017	2017-04-30 20:00:00-04	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	27	f
1509	14 Days	2017-02-15 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	28	f
1510	30 Days	2017-01-30 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	28	f
1511	60 Days	2016-12-31 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	28	f
1512	90 Days	2016-12-01 19:00:00-05	2016-12-20 06:46:38.821-05	2016-12-20 06:46:38.821-05	42	28	28	f
2318	14 Days	2017-04-16 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	9	f
2319	30 Days	2017-03-31 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	9	f
2320	90 Days	2017-01-30 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	13	f
2321	1 Day	2017-04-29 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	12	f
2322	7 Days	2017-04-23 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	11	f
2323	7 Days	2017-04-23 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	16	f
2324	14 Days	2017-04-16 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	16	f
2325	21 Days	2017-04-09 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	16	f
2326	7 Days	2017-04-23 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	17	f
2327	60 Days	2017-03-01 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	18	f
2328	60 Days	2017-03-01 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	19	f
2329	14 Days	2017-04-16 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	21	f
2330	30 Days	2017-03-31 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	23	f
2331	60 Days	2017-03-01 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	25	f
2332	Oct 1 2017	2017-09-30 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	26	f
2333	60 Days	2017-03-01 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	22	f
2334	May 1 2017	2017-04-30 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	27	f
2335	90 Days	2017-01-30 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	3	f
2336	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	3	f
2337	14 Days	2017-04-16 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	28	f
2338	30 Days	2017-03-31 20:00:00-04	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	28	f
2339	60 Days	2017-03-01 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	28	f
2340	90 Days	2017-01-30 19:00:00-05	2017-01-10 10:23:34.309-05	2017-01-10 10:23:34.309-05	65	5	28	f
2403	60 Days	2017-03-02 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	25	f
2404	Oct 1 2017	2017-09-30 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	26	f
2405	60 Days	2017-03-02 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	22	f
2406	May 1 2017	2017-04-30 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	27	f
2407	90 Days	2017-01-31 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	3	f
2408	Summer 2017	2017-06-30 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	3	f
2409	14 Days	2017-04-17 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	28	f
2410	30 Days	2017-04-01 20:00:00-04	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	28	f
2411	60 Days	2017-03-02 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	28	f
2412	90 Days	2017-01-31 19:00:00-05	2017-01-10 21:12:42.784-05	2017-01-10 21:12:42.784-05	67	35	28	f
\.


--
-- Name: Reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Reminders_id_seq"', 2412, true);


--
-- Data for Name: Schools; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Schools" (id, "userId", name, "dueDate", "isActive", "createdAt", "updatedAt") FROM stdin;
48	31	Cccp	2017-04-01 00:00:00-04	t	2016-12-27 16:42:02.119-05	2016-12-27 16:42:02.119-05
1	1	Temple	2017-02-01 00:00:00-05	t	2016-11-11 00:50:00.416-05	2016-11-11 01:08:43.242-05
2	1	Drexel	2017-02-14 00:00:00-05	t	2016-11-11 01:12:05.926-05	2016-11-11 01:12:05.926-05
4	3	Nyu	2017-02-01 00:00:00-05	t	2016-11-11 07:54:04.179-05	2016-11-11 07:54:04.179-05
58	35	Columbia	2017-05-01 00:00:00-04	t	2016-12-27 18:02:54.513-05	2016-12-27 18:02:54.513-05
59	35	Drexel	2016-02-01 00:00:00-05	t	2016-12-27 18:05:31.363-05	2016-12-27 18:05:31.363-05
60	35	Penn	2017-05-01 00:00:00-04	t	2016-12-27 18:07:17.892-05	2016-12-27 18:07:17.892-05
61	25	Penn	2017-04-01 00:00:00-04	t	2016-12-27 20:31:35.35-05	2016-12-27 20:31:35.35-05
62	36	Prinetom	2017-04-01 00:00:00-04	t	2016-12-29 17:52:03.343-05	2016-12-29 17:52:03.343-05
63	37	Kean University	2017-04-04 00:00:00-04	t	2016-12-29 17:55:16.066-05	2016-12-29 17:55:21.322-05
65	5	Temple University	2017-05-01 00:00:00-04	t	2017-01-10 10:23:34.235-05	2017-01-10 10:23:34.235-05
10	8	Harvard	2017-03-01 00:00:00-05	t	2016-11-11 15:15:50.233-05	2016-11-11 15:15:50.233-05
11	8	Columbia	2016-03-01 00:00:00-05	t	2016-11-11 15:18:25.32-05	2016-11-11 15:18:25.32-05
66	5	Havard	2017-04-04 00:00:00-04	t	2017-01-10 10:23:57.191-05	2017-01-10 10:23:57.191-05
13	10	Bryn Mawr	2016-12-31 00:00:00-05	t	2016-11-12 10:14:10.713-05	2016-11-12 10:14:10.713-05
14	10	University of Maryland	2017-01-01 00:00:00-05	t	2016-11-12 10:16:09.181-05	2016-11-12 10:16:09.181-05
67	35	Princeton	2017-05-02 00:00:00-04	t	2017-01-10 21:12:42.744-05	2017-01-10 21:12:42.744-05
64	35	Temple	2017-05-02 00:00:00-04	f	2017-01-07 03:24:32.797-05	2017-01-10 21:12:44.093-05
16	11	Harvard	2017-03-01 00:00:00-05	t	2016-11-12 12:35:23.216-05	2016-11-12 12:35:50.259-05
17	4	Temple University	2017-03-01 00:00:00-05	t	2016-11-12 18:36:18.413-05	2016-11-12 18:36:18.413-05
22	11	Princeton	2017-02-01 00:00:00-05	t	2016-11-15 06:30:56.807-05	2016-11-15 06:30:56.807-05
29	18	Harvard	2016-03-01 00:00:00-05	t	2016-12-01 16:55:18.196-05	2016-12-01 16:55:18.196-05
30	18	Harvard	2017-03-01 00:00:00-05	t	2016-12-01 16:56:16.331-05	2016-12-01 16:56:16.331-05
32	19	Pri	2017-03-01 00:00:00-05	t	2016-12-04 09:40:26.189-05	2016-12-04 09:40:26.189-05
33	21	Rowan	2017-03-01 00:00:00-05	t	2016-12-04 18:21:24.67-05	2016-12-04 18:21:24.67-05
34	21	Rowan	2017-03-01 00:00:00-05	t	2016-12-04 18:21:43.375-05	2016-12-04 18:21:43.375-05
36	1	Temple	2018-02-01 00:00:00-05	t	2016-12-09 17:11:02.541-05	2016-12-09 17:11:02.541-05
39	25	Harvard	2017-04-01 00:00:00-04	t	2016-12-13 02:02:05.951-05	2016-12-13 02:02:05.951-05
40	27	Rowan	2017-03-01 00:00:00-05	t	2016-12-15 19:16:04.561-05	2016-12-15 19:16:04.561-05
41	25	Harvard	2017-03-01 00:00:00-05	t	2016-12-18 12:54:48.411-05	2016-12-18 12:54:48.411-05
42	28	Princeton	2017-03-02 00:00:00-05	t	2016-12-20 06:46:38.769-05	2016-12-20 06:46:38.769-05
\.


--
-- Name: Schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Schools_id_seq"', 67, true);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "SequelizeMeta" (name) FROM stdin;
20160619200503-create-user.js
20160712045748-AddUserColumns.js
20160718024658-ChangePhoneNumberToString.js
20160726030044-add-categories-table.js
20160727041508-categories-missing-fields.js
20160727050657-create-base-reminder.js
20160727051531-create-timeframe.js
20160727051957-create-basereminder-timeframe.js
20160728025052-create-school.js
20160728032344-create-reminder.js
20160728033158-create-test.js
20160728033347-create-test-dates.js
20160728040906-create-content-item.js
20160823033414-add-users-to-reminders.js
20160907031304-create-admin-user.js
20160913031028-reminders-table-changes.js
20161015110758-split-test-message-columns.js
20161227050703-smsText.js
20161227051413-isSent.js
\.


--
-- Data for Name: TestDates; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "TestDates" (id, "registrationDate", "adminDate", "createdAt", "updatedAt", "testId") FROM stdin;
\.


--
-- Name: TestDates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"TestDates_id_seq"', 15, true);


--
-- Data for Name: Tests; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Tests" (id, type, "adminMessage", "adminDetail", "createdAt", "updatedAt", "registrationMessage", "registrationDetail") FROM stdin;
1	SAT	<p>Reminders for the day of the test</p>	<p>Reminder details for the day of the test</p>	2016-11-10 23:51:21.248-05	2016-11-10 23:51:21.248-05	If you're planning on taking the SAT Test on %TESTDATE%, you must register by %REGDATE%.	<p>Go to the College Board site and register to take the SAT.  Go to <a href="https://sat.collegeboard.org/register" target="">https://sat.collegeboard.org/register</a>.  Remember to include the schools you are applying to as a recipient of your test scores.</p>
2	ACT	<p>Reminders for the day of the test</p>	<p>Reminder details for the day of the test</p>	2016-11-10 23:51:21.248-05	2016-11-10 23:51:21.248-05	If you're planning on taking the ACT Test on %TESTDATE%, you must register by %REGDATE%.	<p>Go to <a href="http://actstudent.org" target="">actstudent.org </a>to register for your ACT test  Remember to include the schools you are applying to as a recipient of your test scores.</p>
\.


--
-- Name: Tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Tests_id_seq"', 3, true);


--
-- Data for Name: Timeframes; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Timeframes" (id, name, type, formula, "createdAt", "updatedAt") FROM stdin;
1	Summer 2017	absolute	2017-07-01	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
2	Jan 1 2017	absolute	2017-01-01	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
3	May 1 2017	absolute	2017-05-01	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
4	Oct 1 2017	absolute	2017-10-01	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
5	90 Days	relative	90	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
6	60 Days	relative	60	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
7	30 Days	relative	30	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
8	21 Days	relative	21	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
9	14 Days	relative	14	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
10	7 Days	relative	7	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
11	5 Days	relative	5	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
12	2 Days	relative	2	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
13	1 Day	relative	1	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
14	Today	now	\N	2016-11-10 23:51:21.172-05	2016-11-10 23:51:21.172-05
\.


--
-- Name: Timeframes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Timeframes_id_seq"', 15, true);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Users" (id, "phoneNumber", "createdAt", "updatedAt", "confirmCode", "confirmCodeTimestamp", "sponsorCode") FROM stdin;
1	6099229905	2016-11-11 00:49:30.255-05	2016-12-09 17:10:19.865-05	999999	2016-12-09 17:10:19-05	123456
3	6093143629	2016-11-11 07:53:11.821-05	2016-11-11 07:53:11.821-05	999999	2016-11-11 07:53:11-05	\N
24	3014420037	2016-12-11 11:52:44.343-05	2016-12-11 11:52:44.343-05	999999	2016-12-11 11:52:44-05	\N
7	3014424636	2016-11-11 12:25:31.485-05	2016-11-11 12:51:17.443-05	999999	2016-11-11 12:51:17-05	\N
6	9493389683	2016-11-11 11:31:19.101-05	2016-11-11 13:56:48.188-05	999999	2016-11-11 13:56:48-05	\N
26	3014420059	2016-12-15 19:14:11.196-05	2016-12-15 19:14:22.357-05	999999	2016-12-15 19:14:22-05	\N
27	3014420088	2016-12-15 19:15:36.688-05	2016-12-15 19:15:36.688-05	999999	2016-12-15 19:15:36-05	\N
8	8565360496	2016-11-11 15:15:22.559-05	2016-11-11 15:15:22.559-05	999999	2016-11-11 15:15:22-05	\N
28	3024423333	2016-12-20 06:45:54.867-05	2016-12-20 06:46:13.711-05	999999	2016-12-20 06:46:13-05	\N
10	2409885980	2016-11-12 10:13:29.721-05	2016-11-12 10:13:29.721-05	999999	2016-11-12 10:13:29-05	\N
4	9208517783	2016-11-11 08:40:18.211-05	2016-11-12 18:35:51.64-05	999999	2016-11-12 18:35:51-05	\N
11	2402711828	2016-11-12 12:33:50.556-05	2016-11-15 06:27:20.504-05	999999	2016-11-15 06:27:20-05	\N
13	2404182751	2016-11-15 22:57:25.178-05	2016-11-15 23:00:16.684-05	999999	2016-11-15 23:00:16-05	\N
31	3914446677	2016-12-27 16:41:37.254-05	2016-12-27 16:41:48.056-05	999999	2016-12-27 16:41:48-05	\N
17	4444445555	2016-12-01 16:54:12.28-05	2016-12-01 16:54:12.28-05	999999	2016-12-01 16:54:12-05	\N
18	4444446666	2016-12-01 16:54:40.517-05	2016-12-01 16:55:53.086-05	999999	2016-12-01 16:55:53-05	\N
19	5555555566	2016-12-04 09:22:50.542-05	2016-12-04 09:38:30.198-05	999999	2016-12-04 09:38:30-05	\N
20	4445556666	2016-12-04 09:41:07.945-05	2016-12-04 09:41:07.945-05	999999	2016-12-04 09:41:07-05	\N
21	3014420447	2016-12-04 18:21:03.301-05	2016-12-04 18:21:03.301-05	999999	2016-12-04 18:21:03-05	\N
25	8565360497	2016-12-13 02:01:06.559-05	2016-12-27 20:50:44.884-05	999999	2016-12-27 20:50:44-05	\N
36	8565360487	2016-12-29 17:34:10.101-05	2016-12-29 17:34:10.101-05	999999	2016-12-29 17:34:10-05	\N
37	8623714408	2016-12-29 17:53:57.814-05	2016-12-29 17:54:20.854-05	999999	2016-12-29 17:54:20-05	\N
5	9999999999	2016-11-11 11:30:53.951-05	2017-01-10 10:25:36.74-05	999999	2017-01-09 14:28:37-05	99999
35	3014420047	2016-12-27 18:02:16.461-05	2017-01-14 19:04:15.144-05	999999	2017-01-14 19:04:15-05	\N
\.


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Users_id_seq"', 37, true);


--
-- Name: AdminUsers_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "AdminUsers"
    ADD CONSTRAINT "AdminUsers_pkey" PRIMARY KEY (id);


--
-- Name: AdminUsers_userName_key; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "AdminUsers"
    ADD CONSTRAINT "AdminUsers_userName_key" UNIQUE ("userName");


--
-- Name: BaseRemindersTimeframes_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "BaseRemindersTimeframes"
    ADD CONSTRAINT "BaseRemindersTimeframes_pkey" PRIMARY KEY ("BaseReminderId", "TimeframeId");


--
-- Name: BaseReminders_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "BaseReminders"
    ADD CONSTRAINT "BaseReminders_pkey" PRIMARY KEY (id);


--
-- Name: Categories_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);


--
-- Name: ContentItems_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "ContentItems"
    ADD CONSTRAINT "ContentItems_pkey" PRIMARY KEY (id);


--
-- Name: Reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "Reminders"
    ADD CONSTRAINT "Reminders_pkey" PRIMARY KEY (id);


--
-- Name: Schools_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "Schools"
    ADD CONSTRAINT "Schools_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: TestDates_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "TestDates"
    ADD CONSTRAINT "TestDates_pkey" PRIMARY KEY (id);


--
-- Name: Tests_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "Tests"
    ADD CONSTRAINT "Tests_pkey" PRIMARY KEY (id);


--
-- Name: Timeframes_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "Timeframes"
    ADD CONSTRAINT "Timeframes_pkey" PRIMARY KEY (id);


--
-- Name: Users_phoneNumber_key; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_phoneNumber_key" UNIQUE ("phoneNumber");


--
-- Name: Users_pkey; Type: CONSTRAINT; Schema: public; Owner: yadaguru; Tablespace: 
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: BaseRemindersTimeframes_BaseReminderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "BaseRemindersTimeframes"
    ADD CONSTRAINT "BaseRemindersTimeframes_BaseReminderId_fkey" FOREIGN KEY ("BaseReminderId") REFERENCES "BaseReminders"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BaseRemindersTimeframes_TimeframeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "BaseRemindersTimeframes"
    ADD CONSTRAINT "BaseRemindersTimeframes_TimeframeId_fkey" FOREIGN KEY ("TimeframeId") REFERENCES "Timeframes"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BaseReminders_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "BaseReminders"
    ADD CONSTRAINT "BaseReminders_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Categories"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Reminders_baseReminderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "Reminders"
    ADD CONSTRAINT "Reminders_baseReminderId_fkey" FOREIGN KEY ("baseReminderId") REFERENCES "BaseReminders"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Reminders_schoolId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "Reminders"
    ADD CONSTRAINT "Reminders_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "Schools"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Reminders_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "Reminders"
    ADD CONSTRAINT "Reminders_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Schools_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "Schools"
    ADD CONSTRAINT "Schools_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TestDates_testId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yadaguru
--

ALTER TABLE ONLY "TestDates"
    ADD CONSTRAINT "TestDates_testId_fkey" FOREIGN KEY ("testId") REFERENCES "Tests"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

