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


ALTER TABLE "AdminUsers" OWNER TO yadaguru;

--
-- Name: AdminUsers_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "AdminUsers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AdminUsers_id_seq" OWNER TO yadaguru;

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
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "BaseReminders" OWNER TO yadaguru;

--
-- Name: BaseRemindersTimeframes; Type: TABLE; Schema: public; Owner: yadaguru; Tablespace: 
--

CREATE TABLE "BaseRemindersTimeframes" (
    "BaseReminderId" integer NOT NULL,
    "TimeframeId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "BaseRemindersTimeframes" OWNER TO yadaguru;

--
-- Name: BaseReminders_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "BaseReminders_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "BaseReminders_id_seq" OWNER TO yadaguru;

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


ALTER TABLE "Categories" OWNER TO yadaguru;

--
-- Name: Categories_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Categories_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Categories_id_seq" OWNER TO yadaguru;

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


ALTER TABLE "ContentItems" OWNER TO yadaguru;

--
-- Name: ContentItems_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "ContentItems_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ContentItems_id_seq" OWNER TO yadaguru;

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
    "baseReminderId" integer NOT NULL
);


ALTER TABLE "Reminders" OWNER TO yadaguru;

--
-- Name: Reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Reminders_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Reminders_id_seq" OWNER TO yadaguru;

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


ALTER TABLE "Schools" OWNER TO yadaguru;

--
-- Name: Schools_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Schools_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Schools_id_seq" OWNER TO yadaguru;

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


ALTER TABLE "SequelizeMeta" OWNER TO yadaguru;

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


ALTER TABLE "TestDates" OWNER TO yadaguru;

--
-- Name: TestDates_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "TestDates_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "TestDates_id_seq" OWNER TO yadaguru;

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


ALTER TABLE "Tests" OWNER TO yadaguru;

--
-- Name: Tests_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Tests_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Tests_id_seq" OWNER TO yadaguru;

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


ALTER TABLE "Timeframes" OWNER TO yadaguru;

--
-- Name: Timeframes_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Timeframes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Timeframes_id_seq" OWNER TO yadaguru;

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


ALTER TABLE "Users" OWNER TO yadaguru;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: yadaguru
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Users_id_seq" OWNER TO yadaguru;

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
1	admin	$2a$10$xeJeyVeK231A3lNgWNToXuqiiRA5.98w.K/G.8KNzF1hh6yQb3CqC	2016-10-31 04:23:37.755+00	2016-10-31 04:23:37.755+00
\.


--
-- Name: AdminUsers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"AdminUsers_id_seq"', 1, true);


--
-- Data for Name: BaseReminders; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "BaseReminders" (id, name, "categoryId", message, detail, "lateMessage", "lateDetail", "createdAt", "updatedAt") FROM stdin;
3	Ask Teachers for Recommendations	8	Figure out who you can ask for a recommendation for %SCHOOL%  and ask them early!	<p>Generally, you want to figure out who you will ask to write your recommendations and ask them as early as possible, ideally the summer before or right at the beginning of the school year. Remember, recommendations are a privilege, not a right, so be sure to <b><i>ask</i></b>! </p><p>Check the guidelines of your %SCHOOL%'s application to see how many recommendations you'll need, if any.  <br/><br/><b>USING COMMON, EDU,Inc. or UNIVERSAL App?</b> After you ask your teachers in person, you must &#34;invite&#34; them from your online application account. You'll need their name and working email address to accomplish this properly. (Any typos or mistakes will result in the &#34;invite&#34; getting lost in cyber space!)</p>	Do you need recommendations for your %SCHOOL% application?	<p>Generally, you want to figure out who you will ask to write your recommendations and ask them AS SOON AS POSSIBLE. Remember, recommendations are a privilege, not a right, so be sure to <b><i>ask</i></b>! </p><p>Check the guidelines of your %SCHOOL% application to see how many recommendations you'll need, if any.  <br/><br/><b>USING COMMON, EDU, Inc. or UNIVERSAL APP?</b> In order for your teachers/counselors to complete your recommendations, you must &#34;invite&#34; them from your online application account. You'll need their name and working email address to accomplish this properly. (Any typos or mistakes will result in the &#34;invite&#34; getting lost in cyber space!)</p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
4	Start Essays	9	Start getting familiar with %SCHOOL% essay questions as soon as possible.	<p>Start your essays early! </p><p>If %SCHOOL% has posted essay questions, start this in the summer, if you can. </p><p>Search online for successful college essays and get a feel for how long they are, how much content they have, and the tone. <span style="color: rgb(85, 85, 85);float: none;background-color: rgb(255, 255, 255);">Read and re-read what's required and start to think about what you will write. </span></p>	Start writing your essays right away!	Essays are usually the hardest and most time-consuming part of the application, so you should get started as soon as possible.  Read and re-read what's required for %SCHOOL% and start to think about how you will answer the essays. Be careful to note the number of essays required!	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
5	VISUAL ARTS MAJORS: Start your Portfolio	5	If you are creating a portfolio, you should start compiling the needed pieces now!	<p>Give yourself plenty of time to assemble your portfolio. </p><p>Start early, get advice about your best work from others, and maybe create a few more pieces. By thinking about this early, you'll have time to present your best works. <br/><br/>This would also be a good time to check the school's website and find out how the school wants you to submit your works. Usually it's through an online portal, so get familiar with this link and how to upload to it.</p>	If you are creating a portfolio, you should start compiling the needed pieces now!	<p>Give yourself plenty of time to assemble your portfolio. </p><p>Start early, get advice about your best work from others, and maybe create a few more.  By thinking about this early, you'll have time to present your best works. </p><p>This would also be a good time to check the school's website and find out how the school wants you to submit your works.  Usually it's through an online portal.  So get familiar with this link and how to upload to it.</p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
2	Notify Counselors	2	Have you asked your counselor to fill out any Secondary School report or a recommendation for you?	<p>On %DATE%, you only have 30 days before your application is due, and recommendations take time. All of your recommenders are busy people, so if you haven't, you should get this to them ASAP! </p><p>Four weeks is a courteous standard for any recommendations, but the sooner the better. Follow any instructions regarding Secondary School Reports, Counselor Forms, or other recommendations, if required by %SCHOOL%. You may need to download and print a physical copy, or provide your counselor with a link, if online. </p><p><title></title></p><p class="p1"><i>NOTE: If you are using </i><a href="https://www.commonapp.org/"><i>Common App</i></a><i> or </i><a href="https://www.universalcollegeapp.com/"><i>Universal Application</i></a><i>,make sure you have successfully &#34;invited&#34; your counselor to upload their recommendation for you.</i></p><p></p>	Have you already asked your counselors to fill out any Secondary School reports or recommendations, if required?	<p>If the answer is no, you're a bit behind schedule. </p><p>All of your recommenders are busy people, so you should get any Secondary School Reports, Counselor Forms, or other recommendations, if required by %SCHOOL% to your counselors ASAP! </p><p>Two weeks is a courteous standard for any recommendations...and it seems you have less than that. Check with your counselor if he/she can still get this done for you. Say please and thank you!</p><p><i><i style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);">NOTE: If you are using </i><a href="https://www.commonapp.org/" style="color: rgb(51, 122, 183);background-color: rgb(255, 255, 255);"><i>Common App</i></a><i style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"> or </i><a href="https://www.universalcollegeapp.com/" style="color: rgb(51, 122, 183);background-color: rgb(255, 255, 255);"><i>Universal Application</i></a><i style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);">,make sure you have successfully &#34;invited&#34; your counselor to upload their recommendation for you.</i></i></p><p></p>	2016-10-02 05:26:28.891+00	2016-11-26 15:08:56.095+00
6	Remind Recommenders	8	Check in with your teachers by %DATE% about the status of %SCHOOL% recommendations.	<p>Your recommenders are usually very busy humans.  A gentle and kind reminder will help them get their recommendation in on time. </p><p>Remember, it is a <i>privilege</i> to have someone write such nice things about you.  Be sure to thank them for their time!</p>	Do you know where your %SCHOOL% recommendations are?	<p>Your recommenders are usually very busy humans.  A gentle and kind reminder will help them get their recommendation in on time. Remember, it is a privilege to have someone write such nice things about you! Be sure to thank them for their time!</p><h5><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h5><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accomodate you. </li></ol>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
7	Submit Regular Mail Essays	9	If you are sending your essays to %SCHOOL% via regular mail you should send them by %DATE%	<p>Are you mailing your essays using the US Postal Service? </p><p>You'll want to mail your carefully crafted essays <b>early</b>, just in case you need to mail again. There's usually not much of a grace period if your essays or application forms come in late, so respect the deadline. Your application may get delayed, or worse, you may be disregarded completely!</p>	Did you send any essays via regular mail already?	<p>Are you mailing your essays using the US Postal Service? </p><p>You'll want to mail your carefully crafted essays <b>early</b>, just in case you need to mail again. There's usually not much of a grace period if your essays or application forms come in late, so respect the deadline. Your application may get delayed, or worse, you may be disregarded completely!</p><p></p><p>If you fear it may be late, call %SCHOOL% and ask if they will accept your essay via fax or email instead.</p><h5><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h5><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accomodate you. </li></ol>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
8	VISUAL ARTS MAJORS: Submit your Portfolio	5	VISUAL ARTS MAJORS: Time to submit that portfolio to %SCHOOL%	<p>After the paint, glue, sweat, and tears have dried, it's time to submit that portfolio! </p><p>Make sure it's been uploaded correctly, and that you actually pressed the &#34;submit&#34; button.</p><p><i>NOTE: %SCHOOL% may want you to submit your portfolio through another application like <a href="http://www.slideroom.com" target="">slideroom.com</a>.  Make sure you visit %SCHOOL%'s website and know HOW to submit that portfolio. In some cases, you may need to create a user in something like slideroom in order to submit. See our <a href="http://yadaguru.com/#/faqs" target="">FAQs </a>for more information. </i><br/></p>	Did you submit your portfolio to %SCHOOL% yet?	<p></p><p>After the paint, glue, sweat, and tears have dried, it's time to submit that portfolio! </p><p>Make sure it's been uploaded correctly, and that you actually pressed the &#34;submit&#34; button.</p><p><i>NOTE: %SCHOOL% may want you to submit your portfolio through another application like <a href="http://www.slideroom.com" target="">slideroom.com</a>.  Make sure you visit %SCHOOL%'s website and know HOW to submit that portfolio. In some cases, you may need to create a user in something like slideroom in order to submit. See our <a href="http://yadaguru.com/#/faqs" target="">FAQs </a>for more information. </i><br/></p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
9	Mailing Recommendations	8	Are your recommenders sending their letters to %SCHOOL% via regular mail?	<p>Regular mail takes time! Make sure your recommenders have had time to send their recommendations if they are mailing them via regular mail (ie not online). Politely check-in with them.</p><p>To streamline the process for them, give them an envelope already addressed to %SCHOOL%'s admission office, with plenty of stamps. </p>	Are your recommenders sending their letters to %SCHOOL% via regular mail?	<p>Regular mail takes time! Make sure your recommenders have had time to send their recommendations if they are mailing them via regular mail (ie not online). Politely check-in with them.</p><p>To streamline the process for them, give them an envelope already addressed to %SCHOOL%'s admission office, with plenty of stamps. </p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
10	Submit Online Essays	9	Are you submitting any essays online; email or upload?	<p></p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"></p><p>It's exactly a week until %SCHOOL%'s application deadline.You've been working hard on your essays, but are they ready? </p><div><br/></div><div>Ask a knowledgeable adult to check them over and get ready to submit them.If they're done, you should login to your online application system, make sure they are uploaded correctly, and press the <b>SUBMIT </b>button!</div><div><br/></div><div><i>NOTE: Have someone else spell check and grammar check your essays.</i></div>	Are those essays ready?!	<p>It's exactly a week until %SCHOOL%'s application deadline.You've been working hard on your essays, but are they ready? </p><div><br/></div><div>Ask a knowledgeable adult to check them over and get ready to submit them.If they're done, you should login to your online application system, make sure they are uploaded correctly, and press the<b><b>SUBMIT</b></b>button!</div><div><br/></div><div>NOTE: Have someone else spell check and grammar check your essays.</div>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
11	Check-in on Online Recommendation	8	Check-in with your recommenders about any online recommendations for %SCHOOL%.	<p>Did any of your recommenders complete an online, Common Application, EDU, Inc. or Universal Application recommendation for you?<br/><br/>This is a good date to check in with your recommenders to see if they have submitted online recommendations, including Common Application, EDU,Inc. and Universal Application. Even though online recommendations can usually be instantaneously uploaded, these recommendations still take time and effort to complete! Politely check-in with them now to see that they have everything that they need to accomplish it.</p>	Are any online recommendations submitted?	<p>This is a good date to check in with your recommenders to see if they have submitted online recommendations, including Common, EDU, Inc. and Universal Application. Even though it's online, these recommendations still take time so check in with them now to see that they have everything that they need to accomplish it.</p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
12	Application Submission Date	7	%SCHOOL%'s application is due %DATE%.	<p>This is the date that %SCHOOL% should have every part of your application; from essays, to recommendations, to SAT scores. Some schools require that all pieces are in, others will accept them weeks after. <br/><br/>Check with the university if you fear you might not get a piece in on time. Some colleges are more lenient but <b>don't assume.</b><br/></p>	Did you already miss your deadline?	<p>Check with the university if you fear you might not get a piece in on time. Some colleges are more lenient, but assume nothing! If it is way past the deadline and the university won't budge, you may have to readjust your expectations and plans. Take a deep breath and re-examine what you need to do to succeed. </p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
13	Request Transcripts	2	With 90 days until your application to %SCHOOL% is due, find out your high school's procedures for having transcripts sent.	<p></p><p>The most important piece of your college applications is arguably your transcript or grade record. You'll want to make sure that %SCHOOL% gets this piece as soon as possible. They usually can't process your application without it. To learn more about your transcript and its importance, check out our <a href="http://yadaguru.com/#/faqs" target="">FAQ</a>.</p><p><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="" style="background-color: rgb(255, 255, 255);">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="" style="background-color: rgb(255, 255, 255);">Universal Application</a></i><i>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><p></p><p></p>	Have you figured out how to request your transcripts to be sent to %SCHOOL%?	<p></p><p>The most important piece of your college applications is arguably your transcript or grade record. You'll want to make sure that %SCHOOL% gets this piece as soon as possible. They usually can't process your application without it. To learn more about your transcript and its importance, check out our <a href="http://yadaguru.com/#/faqs" target=";">FAQ</a>.</p><p><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="" style="background-color: rgb(255, 255, 255);">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="" style="background-color: rgb(255, 255, 255);">Universal Application</a></i><i>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><p></p><h5><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h5><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accomodate you. </li></ol>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
14	Recommendation Packet	2	Deliver needed forms for %SCHOOL% to your Recommenders and Counselors.	<p></p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"></p><p>Hopefully, you have already asked teachers and your counselor if they will write recommendations. You should give each one of them all the information they need to complete a recommendation.  This usually includes:</p><ul><li>Recommendation questions (if any) or in some cases, printed recommendation forms</li><li>Due date(s) of your application</li><li>Stamped, pre-addressed envelopes*</li><li>Any other important directions</li><li>A copy of your resume or activities list (This will help them brag about you!)</li></ul><div><br/></div><div><i>*NOTE: If the school you are applying to has an online application system for recommendations, then you do not need any envelopes or stamps. Just make sure that your recommenders know how to login to submit their recommendation.</i><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><i></i></p></div>	Deliver needed forms for %SCHOOL% to your Recommenders and Counselors	<p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"></p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"></p><p>Hopefully, you have already asked teachers and your counselor if they will write recommendations. You should give each one of them all the information they need to complete a recommendation. This usually includes:</p><div><ul><li>Recommendation questions (if any) or in some cases, printed recommendation forms</li><li>Due date(s) of your application</li><li>Stamped, pre-addressed envelopes*</li><li>Any other important directions</li><li>A copy of your resume or activities list (This will help them brag about you!)</li></ul><i>*NOTE: If the school you are applying to has an online application system for recommendations, then you do not need any envelopes or stamps. Just make sure that your recommenders know how to login to submit their recommendation.</i></div><div><i><br/></i></div><div><i><br/></i></div><h4><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h4><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accomodate you. </li></ol>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
16	Call the school	2	CALL %SCHOOL% to make sure they've received everything!	<p>Admissions offices are very busy places...and they lose things too!</p><p>If you've sent items for your application, call the school's admissions office and politely validate that they have received everything they need for your application.  If anything is missing, get busy to get it to the school before the deadline.</p><p><i>NOTE: Make sure YOU, not your parent/guardian, call the university. Admissions professionals prefer to hear from the prospective student.</i></p>	Call %SCHOOL% to make sure they've received everything.	Admissions offices are very busy places...and they lose things, too!\n\nIf you've sent items for your application, call the school's admissions office and politely validate that they have received everything they need for your application.  If anything is missing, get busy to get it to the school before the deadline.\n\n*Note: Make sure YOU -- not your parent/guardian -- call the university. Admissions professionals prefer to hear from the prospective student!	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
17	Submit Online Application	7	ONLINE APPS ONLY: Have you submitted your online application yet?	<p>Maybe this seems silly, but we'd hate for you to discover that you did not press that <b>SUBMIT</b> button!<br/><br/>If you didn't get a confirmation email or a notification in your online account within a few days after you hit &#34;SUBMIT&#34;, you'll want to check with the school. <br/><br/><i>NOTE: If there is an application fee required, it will might need to be paid or waived before you can &#34;SUBMIT.&#34;</i></p>	ONLINE APPS ONLY: Are you sure you hit "SUBMIT"?!	Go check right now. \n\nIf you didn't get a confirmation email or a notification in your online account within a few days after you think you submitted your application, you'll want to check with the school. \n\n(NOTE: If there is an application fee required, it might need to be paid or waived before you can "SUBMIT")	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
18	Ask Counselor for Recommendation	8	Have you asked your counselor to fill out any Secondary School report or a recommendation for you?	<p>Follow any instructions regarding Secondary School Reports, Counselor Forms, or other recommendations, if  required by %SCHOOL%.  You may need to download and print a physical copy, or provide your counselor with a link, if online. <br/><br/><i><b>NOTE:</b> If you are using <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a></i>, <i>make sure you have successfully &#34;invited&#34; your counselor to upload their recommendation for you.</i></p>	Have you asked your counselor to fill out any Secondary School report or a recommendation for you?	<p></p><p>Follow any instructions regarding Secondary School Reports, Counselor Forms, or other recommendations, if  required by %SCHOOL%.  You may need to download and print a physical copy, or provide your counselor with a link, if online. <br/><br/><i><b>NOTE:</b> If you are using <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a></i>, <i>make sure you have successfully &#34;invited&#34; your counselor to upload their recommendation for you.</i></p><p><i></i></p><p></p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
19	Request Transcripts	2	Request your transcripts to be sent to %SCHOOL%	<p>It's only 60 days until your application for %SCHOOL% is due!<br/><br/>Make sure you know the process, get any proper paperwork, and follow the directions of your high school regarding transcript release. They'll probably need a mailing address for the %SCHOOL% admissions office, too, so go prepared!<br/><i><br/></i></p><p><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p>	Have your requested your transcripts be sent to %SCHOOL%?	<p>Your transcript is essential:  %SCHOOL% can't process your application without it!</p><p>Make sure you know the process, get any proper paperwork, and follow the directions of your high school regarding transcript release. They'll probably need a mailing address for the %SCHOOL% admissions office, too, so go prepared.  </p><p><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><h4>You're probably a little a little late with this one.</h4><p>If you're seeing this message it's because you've passed YadaGuru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accommodate you. </li></ol>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
20	Request Transcripts	2	Have you requested your transcripts be sent to %SCHOOL% yet?	<p>It's only 21 days until your application for %SCHOOL% is due!<br/><br/>Make sure you know the process, get any proper paperwork, and follow the directions of your high school regarding transcript release. They'll probably need a mailing address for the %SCHOOL% admissions office, too, so go prepared!<br/><br/><i>NOTE<b>: </b>If this university uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p>	Have you requested your transcripts yet?	<p>Your deadline is approaching!</p><p>Make sure you know the process, get any proper paperwork, and follow the directions of your high school regarding transcript release. They'll probably need a mailing address for the %SCHOOL% admissions office, too, so go prepared!</p><p><i>NOTE<b>: </b>If this university uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><p></p><h5><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h5><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?</p><ol><li>Before %SCHOOL%'s submission date: Hustle!  Try to get this done asap.</li><li>After %SCHOOL%'s submission date: Call %SCHOOL%'s admissions office, explain the situation and see if they will accomodate you. </li></ol>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
21	Request Transcripts	2	If you haven't, request your transcripts be sent to %SCHOOL%.	<p>It's only 14 days until your application for %SCHOOL% is due! Have you asked the guidance office to send your transcripts? Make this a priority this week if you haven't yet. <br/><br/><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><p></p>	If you haven't, request your transcripts be sent to %SCHOOL%.	<p>Your deadline for %SCHOOL% is coming quickly! Make sure you know the process, get any proper paperwork, and follow the directions of your high school regarding transcript release. They'll probably need a mailing address for the %SCHOOL% admissions office, too, so go prepared!<br/><br/><i>NOTE: If %SCHOOL% uses <a href="https://www.commonapp.org/" target="">Common App</a> or <a href="https://www.universalcollegeapp.com/" target="">Universal Application</a>, make sure you &#34;invited&#34; your guidance counselor to upload your transcripts and his/her recommendation for you.</i></p><p><b></b></p><p></p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
22	Application Fee	2	Did you pay the application fee?	<p>You often have to pay the fee before colleges and universities will process your application. Sometimes you can't even submit an online application until you pay.<br/><br/>Before you pay those fees (or start worrying about them), find out if you qualify for that fee to be waived.  See our <a href="http://yadaguru.com/#/faqs" target="">FAQs</a> to learn about fee waivers.</p>	Have you paid the application fee or used a fee waiver?	You often have to pay the fee before universities will process your application. (Sometimes you can't even submit an online application until you pay!) \n\nBefore you pay those fees (or start worrying about them...) find out if you qualify for that fee to be waived!\n\nFirst, ask the college's admissions offices to see if they take or offer any college application fee waivers. Need-based college application fee waivers are available for students who are eligible. If you registered for the SAT with a testing fee waiver, you are eligible for (4) college application fee waivers; these are available on your CollegeBoard account. Ask the guidance counselor at your school if they have NACAC (National Assoc. of College Admissions Counseling) Fee Waivers available. No guidance counselor at your school? Utilize resources at PhillyGoes2College.	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
23	Essay Reminder	9	Check your progress on your required and optional essays.	<p>It's only a month until %SCHOOL%'s deadline!</p><p>If you haven't, be sure to write an essay draft and get some feedback from a teacher or other objective adult who can offer some constructive criticism. </p><p>Check out our <a href="http://yadaguru.com/#/faqs" target="">FAQs</a> for links on essay writing.</p>	Check your progress on your required and optional essays.	<p>Your deadline is coming quickly!<br/></p><p>If you haven't, be sure to write an essay draft and get some feedback from a teacher or other objective adult who can offer some constructive criticism. </p><p>Check out our <a href="http://yadaguru.com/#/faqs" target="">FAQs</a> for links on essay writing.</p><p></p><p></p><p></p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
24	VISUAL ARTS MAJORS: Prep Your Portfolio	5	VISUAL ARTS MAJORS: If you need to prepare your artwork for an online portfolio, you don't want to leave it to the last minute!	<p>While hopefully the artwork itself has been completed for a while, your portfolio will probably need to be submitted online.</p><p></p><p>%SCHOOL% may want you to submit your portfolio through another application like <a href="http://slideroom.com" target="">slideroom.com</a>.</p><p>Make sure you visit %SCHOOL%'s website and know HOW to submit that portfolio. In some cases, you may need to create a user in something like slideroom in order to submit.  See our <a href="http://yadaguru.com/#/faqs" target="">FAQs</a> for more information about submitting portfolios. </p>	VISUAL ARTS MAJORS: How are you doing on prepping your portfolio?	<p></p><p>While hopefully the artwork itself has been completed for a while, your portfolio will probably need to be submitted online.</p><p>%SCHOOL% may want you to submit your portfolio through another application like <a href="http://slideroom.com" target="">slideroom.com</a>.</p><p>Make sure you visit %SCHOOL%'s website and know HOW to submit that portfolio. In some cases, you may need to create a user in something like slideroom in order to submit.  See our <a href="http://yadaguru.com/#/faqs" target="">FAQs</a> for more information about submitting portfolios. </p><p></p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
25	Essay Reminder	9	How are those essays for %SCHOOL% coming?	<p>If you have essays to do for %SCHOOL%, you've got 60 days until your application is due. </p><p>Do you have a first and maybe second draft done yet? Identify a knowledgeable adult who can help you edit your essays so that they really reflect what you want to share.</p><p><span class=""><i>NOTE</i><b>:</b></span><i><b> </b>If you're writing the Common Application essays, beware of &#34;stealth&#34; questions; sometimes additional questions pop up after you've answered another...and they can really require some thought! The sooner you tackle the essay portions, the better off you'll be when dealing with those questions.</i></p>	How are those %SCHOOL% essays coming along?	<p>If you have essays to do for %SCHOOL%, you've got 60 days until your application is due. </p><p>Do you have a first and maybe second draft done yet? Identify a knowledgeable adult who can help you edit your essays so that they really reflect what you want to share.</p><p><span class=""><i>NOTE</i><b>:</b></span><i><b> </b>If you're writing the Common Application essays, beware of &#34;stealth&#34; questions; sometimes additional questions pop up after you've answered another...and they can really require some thought! The sooner you tackle the essay portions, the better off you'll be when dealing with those questions.</i></p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
26	FAFSA Opens	1	FREE Application for Federal Student Aid opens on October 1	<p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"></p><p><title></title></p><p class="p1"><span class="s1">Now that maybe you've finished most of your college applications, you have the task of figuring out how to pay for it! If you are a U.S. citizen, you should most definitely fill out the Free Application for Federal Student Aid -- even if you think you won't receive anything! <br/><br/>If you are attending college during the summer/fall of 2017, you can apply as early as October 1, 2016! While the federal deadline for filing the FAFSA is not until July 2017, you should note if %SCHOOL% or your home state has a <i>filing deadline </i>or <i>financial aid priority deadline </i>by which you should apply (usually in February or March!)</span></p><p class="p1"><span class="s1">For more information about the FAFSA, check out the official Federal Student Aid website: </span></p><h2 style="text-align: center;"><span class="s1"><a href="https://fafsa.ed.gov/"><b>https://fafsa.ed.gov/</b><span class="s2"><b></b></span></a></span></h2><h4><span class="s1"><i>Note: ALWAYS use the <b>.gov </b>FAFSA site.  </i></span></h4><h4><i><span class="s1">There are services that charge you to complete a FAFSA and they are tricky.  For example, one site is actually called FAFSA.<b>com. </b> I</span><span>f you use FAFSA.com, you might end up paying to file a FREE APPLICATION!</span></i></h4><h4><span class="s1"><i>REMEMBER! You don't have to pay anything to fill out FAFSA.</i></span></h4>	Free Application for Federal Student Aid opened on January 1	<p class="p1" style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><span class="s1"></span></p><p class="p1" style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><span class="s1">Now that maybe you've finished most of your college applications, you have the task of figuring out how to pay for it! If you are a U.S. citizen, you should most definitely fill out the Free Application for Federal Student Aid -- even if you think you won't receive anything!<span class="Apple-converted-space"> </span><br/><br/>The application opens January 1 and closes on June 30, but you do need to note if %SCHOOL% or your home state has a<span class="Apple-converted-space"> </span><i>filing deadline<span class="Apple-converted-space"> </span></i>or<span class="Apple-converted-space"> </span><i>financial aid priority deadline</i>.</span></p><p class="p1" style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><span class="s1">For more information about the FAFSA, check out the official Federal Student Aid website: </span></p><h2 style="color: rgb(85, 85, 85);text-align: center;background-color: rgb(255, 255, 255);"><span class="s1"><a href="https://fafsa.ed.gov/" style="color: rgb(51, 122, 183);background-color: transparent;"><b><b>https://fafsa.ed.gov/</b></b><span class="s2"><b><b></b></b></span></a></span></h2><h4 style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><span class="s1"><i>Note: ALWAYS use the<span class="Apple-converted-space"> </span><b><b>.gov<span class="Apple-converted-space"> </span></b></b>FAFSA site.  </i></span></h4><h4 style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><i><span class="s1">There are services that charge you to complete a FAFSA and they are tricky.  For example, one site is actually called FAFSA.<b><b>com.<span class="Apple-converted-space"> </span></b></b> I</span><span>f you use FAFSA.com, you might end up paying to file a FREE APPLICATION!</span></i></h4><h4 style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);"><span class="s1"><i>REMEMBER! You don't have to pay anything to fill out FAFSA.  Just go to:</i></span></h4><h2 style="color: rgb(85, 85, 85);text-align: center;background-color: rgb(255, 255, 255);"><span class="s1"><a href="https://fafsa.ed.gov/" style="color: rgb(51, 122, 183);background-color: transparent;"><b><b>https://fafsa.ed.gov/</b></b></a></span></h2><h2 style="color: rgb(85, 85, 85);text-align: center;background-color: rgb(255, 255, 255);"><span class="s1"><a href="https://fafsa.ed.gov/" style="color: rgb(51, 122, 183);background-color: transparent;"><b><b><b></b></b></b></a></span></h2>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
27	NCDD	7	National College Decision Day	<p>May 1 is National College Decision Day. If you get accepted to multiple colleges, including %SCHOOL%, you'll need to decide in which school you will enroll. Usually you must pay an enrollment or housing deposit to secure your space. </p><p>Consider -- Which school is your best fit academically and socially? Which school grants you the most affordable financial aid package? </p><p>Remember: It is best to send a deposit to only ONE school. It's generally considered unethical to send in deposits to multiple schools...not to mention awfully costly to you! Carefully consider your options and make the best choice for you. Ask for help from a knowledgable adult if you're not sure.</p>	Did you get accepted to %SCHOOL%?	<p><title></title></p><p class="p1"><span class="s1"></span></p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);">May 1 is National College Decision Day. If you get accepted to multiple colleges, including %SCHOOL%, you'll need to decide in which school you will enroll. Usually you must pay an enrollment or housing deposit to secure your space. </p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);">Consider -- Which school is your best fit academically and socially? Which school grants you the most affordable financial aid package? </p><p style="color: rgb(85, 85, 85);background-color: rgb(255, 255, 255);">Remember: It is best to send a deposit to only ONE school. It's generally considered unethical to send in deposits to multiple schools...not to mention awfully costly to you! Carefully consider your options and make the best choice for you. Ask for help from a knowledgable adult if you're not sure.</p><p>.</p><p></p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
28	Naviance	4	Update your Notes in Naviance	<p>Log into Naviance and update your guidance counselor or coach on your application progress.  Naviance is a system used by the Philadelphia School District that helps you to compare colleges using your own test scores and grades, research and apply for scholarships and more.  You may be working with a coach or a guidance counselor at school who might be putting important information specifically for you directly into Naviance.  Login here <a href="https://www.philasd.org/login/" style="color: rgb(204, 51, 51);background-color: rgb(255, 255, 255);"></a><a href="http://www.philasd.org/login" target="">www.philasd.org/login</a> and use your student ID and password in the 'students' box.  If you don't know your student ID and password, stop by your guidance  office and they will provide it to you. </p>	Update your Notes in Naviance	<p>Log into Naviance and update your guidance counselor or coach on your application progress.  Naviance is a system used by the Philadelphia School District that helps you to compare colleges using your own test scores and grades, research and apply for scholarships and more.  You may be working with a coach or a guidance counselor at school who might be putting important information specifically for you directly into Naviance.  Login here <a href="https://www.philasd.org/login/" style="background-color: rgb(255, 255, 255);color: rgb(204, 51, 51);"></a><a href="http://www.philasd.org/login" target="" style="background-color: transparent;color: rgb(51, 122, 183);">www.philasd.org/login</a> and use your student ID and password in the 'students' box.  If you don't know your student ID and password, stop by your guidance  office and they will provide it to you. <br/></p>	2016-10-02 05:26:28.891+00	2016-10-02 05:26:28.891+00
1	Start your Application	2	Start %SCHOOL%'s application %DATE%	<h4>ONLINE, COMMON APPLICATION, EDU,Inc. or UNIVERSAL APPLICATION? </h4><p>You should log into the online application system for this school and create a user, fill in your basic information and get your application started. </p><p>If %SCHOOL% uses Common Application, you should create an account on <a href="http://www.commonapp.org" target="">http://www.commonapp.org.</a>  If %SCHOOL% uses EDU, Inc. Common Black College Application, you should create an account on <a href="http://www.eduinconline.com/" target="">http://www.eduinconline.com/</a>.  If %SCHOOL% uses Universal Application, you should create an account on  <a href="http://www.universalcollegeapp.com/" target="">http://www.universalcollegeapp.com/</a>. </p><p><br/></p><h4>PAPER APPLICATION? </h4><p>If you're submitting a <b>PAPER APPLICATION,</b> download, print and/or start filling it out. Sometimes your online or print application will require an essay to be submitted with it, so make sure you check.  If you're unsure about any parts of the application, call %SCHOOL%'s admissions office to make sure you're filling it out properly.<br/></p>	<p>Have you started your %SCHOOL% application yet?</p>	<h4>ONLINE, COMMON APPLICATION, EDU,Inc. or UNIVERSAL APPLICATION? </h4><p>You should log into the online application system for this school and create a user, fill in your basic information and get your application started. </p><p>If %SCHOOL% uses Common Application, you should create an account on <a href="http://www.commonapp.org" target="">http://www.commonapp.org.</a>  If %SCHOOL% uses EDU, Inc. Common Black College Application, you should create an account on <a href="http://www.eduinconline.com/" target="">http://www.eduinconline.com/</a>.  If %SCHOOL% uses Universal Application, you should create an account on  <a href="http://www.universalcollegeapp.com/" target="">http://www.universalcollegeapp.com/</a>. </p><p><br/></p><h4>PAPER APPLICATION? </h4><p>If you're submitting a <b>PAPER APPLICATION,</b> download, print and/or start filling it out. Sometimes your online or print application will require an essay to be submitted with it, so make sure you check.  If you're unsure about any parts of the application, call %SCHOOL%'s admissions office to make sure you're filling it out properly.<br/></p>	2016-10-02 05:26:28.891+00	2016-11-19 05:06:12.473+00
15	Know your Application	2	<p>Visit %SCHOOL%'s website and get <b>familiar</b> with their application process.</p>	<p>You need to take note of key things like deadlines, essay requirements, how they want to receive your application, etc. Get organized and make sure you know <i><b>exactly</b> </i>what the school expects. Applications that are not completed properly may not even be considered.</p>	Visit %SCHOOL%'s website and get familiar with their application process.	<p>If you haven't already, s<span style="color: rgb(85, 85, 85);float: none;background-color: rgb(255, 255, 255);">pend some quality time</span> on %SCHOOL%'s website. You need to take note of key things: <i>deadlines, essay requirements, how they want to receive your application, etc.</i> Your main goal here is to get organized and make sure you know <b><i>exactly</i></b> what the school expects. Applications that are not completely properly may not be considered!</p><h4><span style="color: inherit;">You're probably a little a little late with this one.</span><br/></h4><p>If you're seeing this message it's because you've passed Yadaguru's recommended date to complete this piece.  </p><p>What to do?  Hustle!  Try to get this done asap!</p>	2016-10-02 05:26:28.891+00	2016-11-30 03:32:49.498+00
\.


--
-- Data for Name: BaseRemindersTimeframes; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "BaseRemindersTimeframes" ("BaseReminderId", "TimeframeId", "createdAt", "updatedAt") FROM stdin;
2	7	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
3	1	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
4	1	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
5	1	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
5	5	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
6	8	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
7	7	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
8	9	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
9	7	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
9	9	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
9	10	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
10	10	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
11	10	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
12	14	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
13	5	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
14	5	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
15	1	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
16	8	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
16	9	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
16	10	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
17	10	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
18	6	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
19	6	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
20	8	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
21	9	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
22	6	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
23	7	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
24	6	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
25	6	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
26	4	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
27	3	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
28	5	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
28	6	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
28	7	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
28	9	2016-10-02 05:26:28.903+00	2016-10-02 05:26:28.903+00
1	5	2016-11-19 04:37:17.503+00	2016-11-19 04:37:17.503+00
\.


--
-- Name: BaseReminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"BaseReminders_id_seq"', 31, true);


--
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Categories" (id, name, "createdAt", "updatedAt") FROM stdin;
2	Application	2016-10-02 05:26:28.874+00	2016-10-02 05:26:28.874+00
3	CSS Profile	2016-10-02 05:26:28.874+00	2016-10-02 05:26:28.874+00
4	Naviance	2016-10-02 05:26:28.874+00	2016-10-02 05:26:28.874+00
5	Portfolio Prep	2016-10-02 05:26:28.874+00	2016-10-02 05:26:28.874+00
6	General Reminder	2016-10-02 05:26:28.874+00	2016-10-02 05:26:28.874+00
7	Absolute Deadline	2016-10-02 05:26:28.874+00	2016-10-02 05:26:28.874+00
8	Recommendations	2016-10-02 05:26:28.874+00	2016-10-02 05:26:28.874+00
9	Essay Writing	2016-10-02 05:26:28.874+00	2016-10-02 05:26:28.874+00
10	Testing Registration	2016-10-02 05:26:28.874+00	2016-10-02 05:26:28.874+00
1	Financial Aid	2016-10-02 05:26:28.874+00	2016-11-26 18:12:34.798+00
\.


--
-- Name: Categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Categories_id_seq"', 11, true);


--
-- Data for Name: ContentItems; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "ContentItems" (id, name, content, "createdAt", "updatedAt") FROM stdin;
2	contact	<i>Contact</i> information here	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
3	disclaimer	<h2>Disclaimer</h2> goes here	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
6	help-privacy	Help page for <b>privacy</b> view	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
7	help-school	Help page for <b>school</b> view	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
8	help-reminder	Help page for <b>reminder</b> view	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
9	help-school	Help page for <b>user</b> view	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
10	faq-app-submission-date	Help for app <a href="#">submission</a> date	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
11	faq-app-find	Help for finding application	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
12	faq-regular-admissions	Help on Regular Admissions	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
13	faq-rolling-admissions	Help on Rolling Admissions	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
14	faq-early-action	Help on Early Action	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
15	faqs	Frequently Asked Questions	2016-10-29 04:06:30.375+00	2016-10-29 04:06:34.553+00
4	help-disclaimer	Help page for <b>disclaimer</b> view	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
5	help-faqs	Help page for <b>faqs</b> view	2016-10-29 04:03:48.89+00	2016-10-29 04:03:48.89+00
16	help-user	Help page for user view	2016-10-29 04:13:36.434+00	2016-10-29 04:13:38.032+00
1	privacy	<p>Privacy policy goes <b>here...</b></p>	2016-10-29 04:03:48.89+00	2016-11-30 04:27:00.051+00
\.


--
-- Name: ContentItems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"ContentItems_id_seq"', 17, true);


--
-- Data for Name: Reminders; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Reminders" (id, timeframe, "dueDate", "createdAt", "updatedAt", "schoolId", "userId", "baseReminderId") FROM stdin;
217	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	1
218	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	2
219	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	3
220	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	4
221	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	5
222	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	5
223	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	6
224	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	7
225	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	8
226	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	9
227	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	9
228	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	9
229	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	10
230	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	11
231	Today	2016-10-27 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	12
232	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	13
233	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	14
234	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	15
235	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	16
236	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	16
237	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	16
238	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	17
239	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	18
240	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	19
241	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	20
242	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	21
243	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	22
244	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	23
245	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	24
246	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	25
247	Oct 1 2017	2017-10-01 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	26
248	May 1 2017	2017-05-01 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	27
249	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	28
250	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	28
251	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	28
252	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:26:20.759+00	2016-10-27 04:26:20.759+00	7	6	28
253	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	1
254	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	2
255	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	3
256	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	4
257	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	5
258	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	5
259	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	6
260	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	7
261	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	8
262	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	9
263	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	9
264	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	9
265	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	10
266	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	11
267	Today	2016-10-27 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	12
268	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	13
269	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	14
270	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	15
271	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	16
272	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	16
273	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	16
274	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	17
275	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	18
276	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	19
277	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	20
278	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	21
279	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	22
280	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	23
281	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	24
282	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	25
283	Oct 1 2017	2017-10-01 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	26
284	May 1 2017	2017-05-01 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	27
285	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	28
286	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	28
287	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	28
288	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:27:18.997+00	2016-10-27 04:27:18.997+00	8	6	28
289	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	1
290	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	2
291	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	3
292	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	4
293	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	5
294	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	5
295	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	6
296	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	7
297	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	8
298	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	9
299	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	9
300	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	9
301	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	10
302	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	11
303	Today	2016-10-27 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	12
304	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	13
305	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	14
306	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	15
307	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	16
308	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	16
309	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	16
310	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	17
311	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	18
312	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	19
313	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	20
314	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	21
315	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	22
316	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	23
317	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	24
318	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	25
319	Oct 1 2017	2017-10-01 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	26
320	May 1 2017	2017-05-01 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	27
321	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	28
322	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	28
323	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	28
324	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:28:38.653+00	2016-10-27 04:28:38.653+00	9	7	28
325	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	1
326	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	2
327	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	3
328	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	4
329	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	5
330	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	5
331	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	6
332	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	7
333	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	8
334	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	9
335	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	9
336	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	9
337	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	10
338	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	11
339	Today	2016-10-27 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	12
340	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	13
341	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	14
342	Summer 2017	2017-07-01 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	15
343	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	16
344	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	16
345	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	16
346	7 Days	2017-01-25 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	17
347	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	18
348	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	19
349	21 Days	2017-01-11 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	20
350	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	21
351	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	22
352	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	23
353	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	24
354	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	25
355	Oct 1 2017	2017-10-01 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	26
356	May 1 2017	2017-05-01 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	27
357	90 Days	2016-11-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	28
358	60 Days	2016-12-03 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	28
359	30 Days	2017-01-02 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	28
360	14 Days	2017-01-18 00:00:00+00	2016-10-27 04:30:09.404+00	2016-10-27 04:30:09.404+00	10	8	28
\.


--
-- Name: Reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Reminders_id_seq"', 828, true);


--
-- Data for Name: Schools; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Schools" (id, "userId", name, "dueDate", "isActive", "createdAt", "updatedAt") FROM stdin;
7	6	asdf	2017-02-01 05:00:00+00	t	2016-10-27 04:26:20.687+00	2016-10-27 04:26:20.687+00
8	6	asdf	2017-02-01 05:00:00+00	t	2016-10-27 04:27:18.94+00	2016-10-27 04:27:18.94+00
9	7	asdf	2017-02-01 05:00:00+00	t	2016-10-27 04:28:38.592+00	2016-10-27 04:28:38.592+00
10	8	asdf	2017-02-01 05:00:00+00	t	2016-10-27 04:30:09.343+00	2016-10-27 04:30:09.343+00
\.


--
-- Name: Schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Schools_id_seq"', 23, true);


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
\.


--
-- Data for Name: TestDates; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "TestDates" (id, "registrationDate", "adminDate", "createdAt", "updatedAt", "testId") FROM stdin;
1	2016-05-05 00:00:00+00	2016-06-10 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	2
2	2016-08-31 00:00:00+00	2016-09-30 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	1
3	2016-10-06 00:00:00+00	2016-11-04 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	1
4	2016-11-02 00:00:00+00	2016-12-02 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	1
5	2016-12-10 00:00:00+00	2017-01-20 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	1
6	2017-02-09 00:00:00+00	2017-03-10 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	1
7	2017-04-17 00:00:00+00	2017-05-05 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	1
8	2017-05-08 00:00:00+00	2017-06-02 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	1
9	2016-09-09 00:00:00+00	2016-08-06 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	2
10	2016-09-15 00:00:00+00	2016-10-21 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	2
11	2016-11-03 00:00:00+00	2016-12-09 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	2
12	2017-01-12 00:00:00+00	2017-02-10 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	2
13	2017-03-02 00:00:00+00	2017-04-07 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	2
14	2017-05-04 00:00:00+00	2017-06-09 00:00:00+00	2016-10-02 05:26:28.915+00	2016-10-02 05:26:28.915+00	2
\.


--
-- Name: TestDates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"TestDates_id_seq"', 15, true);


--
-- Data for Name: Tests; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Tests" (id, type, "adminMessage", "adminDetail", "createdAt", "updatedAt", "registrationMessage", "registrationDetail") FROM stdin;
1	SAT	If you're planning on taking the SAT Test on %TESTDATE%, you must register by %REGDATE%.	<p>Go to the College Board site and register to take the SAT.  Go to <a href="https://sat.collegeboard.org/register" target="">https://sat.collegeboard.org/register</a>.  Remember to include the schools you are applying to as a recipient of your test scores.</p>	2016-10-02 05:26:28.912+00	2016-11-30 03:31:55.649+00	<p>Registration message here</p>	<p>Registration detail here</p>
2	ACT	If you're planning on taking the ACT Test on %TESTDATE%, you must register by %REGDATE%.	<p>Go to <a href="http://actstudent.org" target="">actstudent.org </a>to register for your ACT test  Remember to include the schools you are applying to as a recipient of your test scores.</p>	2016-10-02 05:26:28.912+00	2016-11-30 03:44:52.782+00	<p>Registration Message here</p>	<p>Registration detail Here</p>
\.


--
-- Name: Tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Tests_id_seq"', 3, true);


--
-- Data for Name: Timeframes; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Timeframes" (id, name, type, formula, "createdAt", "updatedAt") FROM stdin;
3	May 1 2017	absolute	2017-05-01	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
4	Oct 1 2017	absolute	2017-10-01	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
6	60 Days	relative	60	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
7	30 Days	relative	30	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
8	21 Days	relative	21	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
9	14 Days	relative	14	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
10	7 Days	relative	7	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
11	5 Days	relative	5	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
12	2 Days	relative	2	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
13	1 Day	relative	1	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
14	Today	now	\N	2016-10-02 05:26:28.883+00	2016-10-02 05:26:28.883+00
1	Summer 2017	absolute	2017-07-01T00:00:00.000Z	2016-10-02 05:26:28.883+00	2016-11-29 05:04:34.485+00
2	Jan 1 2017	absolute	2017-01-01T00:00:00.000Z	2016-10-02 05:26:28.883+00	2016-11-29 05:22:39.081+00
5	90 Days	relative	90	2016-10-02 05:26:28.883+00	2016-11-29 05:49:38.763+00
\.


--
-- Name: Timeframes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Timeframes_id_seq"', 15, true);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: yadaguru
--

COPY "Users" (id, "phoneNumber", "createdAt", "updatedAt", "confirmCode", "confirmCodeTimestamp", "sponsorCode") FROM stdin;
6	6099229906	2016-10-27 04:25:57.012+00	2016-10-27 04:27:00.167+00	789527	2016-10-27 04:27:00+00	\N
7	6099229907	2016-10-27 04:28:14.882+00	2016-10-27 04:28:14.882+00	104141	2016-10-27 04:28:14+00	\N
8	6099229908	2016-10-27 04:29:43.484+00	2016-10-27 04:29:43.484+00	277935	2016-10-27 04:29:43+00	\N
\.


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yadaguru
--

SELECT pg_catalog.setval('"Users_id_seq"', 14, true);


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

