--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Postgres.app)
-- Dumped by pg_dump version 14.18 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Degree; Type: TABLE; Schema: public; Owner: Nathan
--

CREATE TABLE public."Degree" (
    id text NOT NULL,
    name text NOT NULL,
    "fullName" text,
    description text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Degree" OWNER TO "Nathan";

--
-- Name: Insurance; Type: TABLE; Schema: public; Owner: Nathan
--

CREATE TABLE public."Insurance" (
    id text NOT NULL,
    name text NOT NULL,
    code text,
    website text,
    phone text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Insurance" OWNER TO "Nathan";

--
-- Name: Practitioner; Type: TABLE; Schema: public; Owner: Nathan
--

CREATE TABLE public."Practitioner" (
    id text NOT NULL,
    "firstName" text,
    "lastName" text NOT NULL,
    phone text,
    address text,
    state text,
    zip text,
    website text,
    "selfPayInitial" integer DEFAULT 0,
    "selfPayFollowUp" integer DEFAULT 0,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp(3) without time zone,
    borough text,
    cert text,
    lat double precision,
    long double precision,
    practice text
);


ALTER TABLE public."Practitioner" OWNER TO "Nathan";

--
-- Name: PractitionerDegree; Type: TABLE; Schema: public; Owner: Nathan
--

CREATE TABLE public."PractitionerDegree" (
    id text NOT NULL,
    "practitionerId" text NOT NULL,
    "degreeId" text NOT NULL,
    "yearObtained" integer,
    institution text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PractitionerDegree" OWNER TO "Nathan";

--
-- Name: PractitionerInsurance; Type: TABLE; Schema: public; Owner: Nathan
--

CREATE TABLE public."PractitionerInsurance" (
    id text NOT NULL,
    "practitionerId" text NOT NULL,
    "insuranceId" text NOT NULL,
    "isPreferred" boolean DEFAULT false,
    notes text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PractitionerInsurance" OWNER TO "Nathan";

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: Nathan
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO "Nathan";

--
-- Data for Name: Degree; Type: TABLE DATA; Schema: public; Owner: Nathan
--

COPY public."Degree" (id, name, "fullName", description, "createdAt", "updatedAt") FROM stdin;
cmdj5prkw0001dbrdbqiffbnc	PT	\N	\N	2025-07-25 18:30:38.048	2025-07-25 18:30:38.048
cmdj5prl40004dbrd3ofk3man	DPT	\N	\N	2025-07-25 18:30:38.056	2025-07-25 18:30:38.056
cmdj5prla0007dbrduibcdwqn	PRPC	\N	\N	2025-07-25 18:30:38.062	2025-07-25 18:30:38.062
cmdj5prli000fdbrdnl5ag8ld	OCS	\N	\N	2025-07-25 18:30:38.07	2025-07-25 18:30:38.07
cmdj5prlk000idbrdg3iv42ta	SCS	\N	\N	2025-07-25 18:30:38.072	2025-07-25 18:30:38.072
cmdj5prlm000ldbrdt7hzn259	FRCms	\N	\N	2025-07-25 18:30:38.075	2025-07-25 18:30:38.075
cmdj5prlp000odbrdb8100m5w	CMPT	\N	\N	2025-07-25 18:30:38.077	2025-07-25 18:30:38.077
cmdj5prmk001pdbrddbfg6jds	CSCS	\N	\N	2025-07-25 18:30:38.108	2025-07-25 18:30:38.108
cmdj5prmm001tdbrdeh0x3tsr	MPT	\N	\N	2025-07-25 18:30:38.111	2025-07-25 18:30:38.111
cmdj5prmq0021dbrdbo10iimq	RYT	\N	\N	2025-07-25 18:30:38.115	2025-07-25 18:30:38.115
cmdj5prms0025dbrd4l4t53or	B.Pthy	\N	\N	2025-07-25 18:30:38.117	2025-07-25 18:30:38.117
cmdj5prmu0028dbrdb2xpwukx	BFA	\N	\N	2025-07-25 18:30:38.118	2025-07-25 18:30:38.118
cmdj5prmv002bdbrdgh4rnmdv	MSKUS	\N	\N	2025-07-25 18:30:38.119	2025-07-25 18:30:38.119
cmdj5prmy002jdbrd7jpq1f0w	CAFS	\N	\N	2025-07-25 18:30:38.123	2025-07-25 18:30:38.123
cmdj5prnf003qdbrdn2b3rtta	MSPT	\N	\N	2025-07-25 18:30:38.14	2025-07-25 18:30:38.14
cmdj5prni003ydbrdb1bh4ynp	FAFS	\N	\N	2025-07-25 18:30:38.143	2025-07-25 18:30:38.143
cmdj5prns004qdbrdv4cceey3	CFMT	\N	\N	2025-07-25 18:30:38.152	2025-07-25 18:30:38.152
cmdj5prnw0055dbrdgylmmqkg	PA	\N	\N	2025-07-25 18:30:38.157	2025-07-25 18:30:38.157
cmdj5pro2005rdbrdt1ntvogw	OTD	\N	\N	2025-07-25 18:30:38.163	2025-07-25 18:30:38.163
cmdj5pro3005udbrd32q8vew4	OTR/L	\N	\N	2025-07-25 18:30:38.164	2025-07-25 18:30:38.164
cmdj5pro70069dbrd4uvbvmhr	BCB-PMD	\N	\N	2025-07-25 18:30:38.168	2025-07-25 18:30:38.168
cmdj5pro8006cdbrd02ooyquf	IF	\N	\N	2025-07-25 18:30:38.168	2025-07-25 18:30:38.168
cmdj5pro9006idbrdg74x8f9y	MDT	\N	\N	2025-07-25 18:30:38.17	2025-07-25 18:30:38.17
cmdj5proa006ldbrd7txxfyby	MLD	\N	\N	2025-07-25 18:30:38.171	2025-07-25 18:30:38.171
cmdj5proc006tdbrdnvpp8wyt	WCS	\N	\N	2025-07-25 18:30:38.173	2025-07-25 18:30:38.173
cmdj5proe006ydbrdh4tvg5yg	CLT	\N	\N	2025-07-25 18:30:38.174	2025-07-25 18:30:38.174
cmdj5proz0092dbrd7zursrcz	ATC	\N	\N	2025-07-25 18:30:38.195	2025-07-25 18:30:38.195
cmdj5prp3009hdbrdvl8bxyh0	MS	\N	\N	2025-07-25 18:30:38.199	2025-07-25 18:30:38.199
cmdj5prpm00bjdbrdbzs41kx3	C1	\N	\N	2025-07-25 18:30:38.219	2025-07-25 18:30:38.219
cmdj5prqx00gpdbrdhnmj0y6f	MS OTR/L	\N	\N	2025-07-25 18:30:38.266	2025-07-25 18:30:38.266
cmdj5prqy00gsdbrdpqb00vo1	RYT500	\N	\N	2025-07-25 18:30:38.266	2025-07-25 18:30:38.266
cmdj5prrw00kidbrdif6j8bhl	MTC	\N	\N	2025-07-25 18:30:38.301	2025-07-25 18:30:38.301
cmdj5prrx00kldbrdb5hehar7	CFC	\N	\N	2025-07-25 18:30:38.301	2025-07-25 18:30:38.301
cmdj5prrx00kodbrdadxe99pa	CKTP	\N	\N	2025-07-25 18:30:38.302	2025-07-25 18:30:38.302
cmdj5prs100l3dbrd90lm1p2t	PCES	\N	\N	2025-07-25 18:30:38.306	2025-07-25 18:30:38.306
cmdj5prsk00n6dbrdilcbiait	MA	\N	\N	2025-07-25 18:30:38.325	2025-07-25 18:30:38.325
cmdj5prti00qzdbrdjdsxn22c	NCS	\N	\N	2025-07-25 18:30:38.358	2025-07-25 18:30:38.358
cmdj5pru500tjdbrdyvhybbgc	GTS	\N	\N	2025-07-25 18:30:38.382	2025-07-25 18:30:38.382
cmdj5pru600tmdbrdde3zck71	CPT	\N	\N	2025-07-25 18:30:38.382	2025-07-25 18:30:38.382
cmdj5prum00vadbrdbhpbknwz	CMP	\N	\N	2025-07-25 18:30:38.398	2025-07-25 18:30:38.398
cmdj5prup00vldbrdoqf9cb6k	MSOT	\N	\N	2025-07-25 18:30:38.401	2025-07-25 18:30:38.401
cmdj5prvj00ywdbrd6kt010kl	EDD	\N	\N	2025-07-25 18:30:38.431	2025-07-25 18:30:38.431
cmdj5prvz010odbrdig6i28og	CAMT	\N	\N	2025-07-25 18:30:38.447	2025-07-25 18:30:38.447
cmdj5prw0010udbrd6vivsu58	Cert-MDT	\N	\N	2025-07-25 18:30:38.448	2025-07-25 18:30:38.448
cmdj5prw30117dbrdxyowz3ew	LLCC	\N	\N	2025-07-25 18:30:38.451	2025-07-25 18:30:38.451
cmdj5prw4011adbrdup99gc9i	LMHC	\N	\N	2025-07-25 18:30:38.452	2025-07-25 18:30:38.452
\.


--
-- Data for Name: Insurance; Type: TABLE DATA; Schema: public; Owner: Nathan
--

COPY public."Insurance" (id, name, code, website, phone, "isActive", "createdAt", "updatedAt") FROM stdin;
cmdj5prlz000zdbrdmido7zn6	Aetna	\N	\N	\N	t	2025-07-25 18:30:38.088	2025-07-25 18:30:38.088
cmdj5prm30012dbrdfo2t8dim	Cigna	\N	\N	\N	t	2025-07-25 18:30:38.092	2025-07-25 18:30:38.092
cmdj5prm50015dbrdnzeg72sj	United Healthcare	\N	\N	\N	t	2025-07-25 18:30:38.094	2025-07-25 18:30:38.094
cmdj5prm70018dbrd8z3du4c5	Blue Cross Blue Shield	\N	\N	\N	t	2025-07-25 18:30:38.096	2025-07-25 18:30:38.096
cmdj5prma001bdbrdhvqfti89	Oxford	\N	\N	\N	t	2025-07-25 18:30:38.098	2025-07-25 18:30:38.098
cmdj5prmc001edbrd3l4izkbw	Medicare	\N	\N	\N	t	2025-07-25 18:30:38.101	2025-07-25 18:30:38.101
cmdj5prme001hdbrdv9lp3cwl	Horizon	\N	\N	\N	t	2025-07-25 18:30:38.103	2025-07-25 18:30:38.103
cmdj5prn60031dbrdzxjr6wvq	Tricare	\N	\N	\N	t	2025-07-25 18:30:38.131	2025-07-25 18:30:38.131
cmdj5prn70034dbrdo4xganpm	AmeriHealth	\N	\N	\N	t	2025-07-25 18:30:38.132	2025-07-25 18:30:38.132
cmdj5prn80037dbrd678b5yd6	Clover Health	\N	\N	\N	t	2025-07-25 18:30:38.133	2025-07-25 18:30:38.133
cmdj5pro0005idbrdi33ugofw	Fidelis	\N	\N	\N	t	2025-07-25 18:30:38.161	2025-07-25 18:30:38.161
cmdj5pro1005ndbrdl78x4kds	Wellcare	\N	\N	\N	t	2025-07-25 18:30:38.162	2025-07-25 18:30:38.162
cmdj5prp7009ydbrd3wpaju8m	Medicaid	\N	\N	\N	t	2025-07-25 18:30:38.204	2025-07-25 18:30:38.204
cmdj5prp800a1dbrdc2fv9ibr	Magnacare	\N	\N	\N	t	2025-07-25 18:30:38.204	2025-07-25 18:30:38.204
cmdj5prp900a4dbrd6ahgv9xd	Multiplan	\N	\N	\N	t	2025-07-25 18:30:38.205	2025-07-25 18:30:38.205
cmdj5prp900a7dbrd4yaz5cb9	Humana	\N	\N	\N	t	2025-07-25 18:30:38.206	2025-07-25 18:30:38.206
cmdj5prpb00aadbrdajnhmvth	Oscar	\N	\N	\N	t	2025-07-25 18:30:38.207	2025-07-25 18:30:38.207
cmdj5prpb00addbrdwmg1u5md	Partners Health Plan	\N	\N	\N	t	2025-07-25 18:30:38.208	2025-07-25 18:30:38.208
cmdj5prpc00agdbrd4kl5e13f	Amida Care	\N	\N	\N	t	2025-07-25 18:30:38.209	2025-07-25 18:30:38.209
cmdj5prpd00ajdbrdrlepx276	ElderPlan	\N	\N	\N	t	2025-07-25 18:30:38.209	2025-07-25 18:30:38.209
cmdj5prpe00amdbrdrzn9n6qh	MetroPlus	\N	\N	\N	t	2025-07-25 18:30:38.21	2025-07-25 18:30:38.21
cmdj5prpe00apdbrdsrzmemme	Age Well	\N	\N	\N	t	2025-07-25 18:30:38.211	2025-07-25 18:30:38.211
cmdj5prpf00asdbrd0l2mlf30	Centers Plan for Healthy Living	\N	\N	\N	t	2025-07-25 18:30:38.212	2025-07-25 18:30:38.212
cmdj5prpg00avdbrdw7gzorkv	1199	\N	\N	\N	t	2025-07-25 18:30:38.212	2025-07-25 18:30:38.212
cmdj5prpt00ccdbrd79cbeyq6	Workers' Compensation	\N	\N	\N	t	2025-07-25 18:30:38.226	2025-07-25 18:30:38.226
cmdj5prq100d5dbrd8teyp0de	Healthfirst	\N	\N	\N	t	2025-07-25 18:30:38.233	2025-07-25 18:30:38.233
cmdj5prq400didbrdgr8vdxeb	VNS Choice	\N	\N	\N	t	2025-07-25 18:30:38.237	2025-07-25 18:30:38.237
cmdj5prq800dxdbrdphuiqgmz	ConnectiCare	\N	\N	\N	t	2025-07-25 18:30:38.241	2025-07-25 18:30:38.241
cmdj5prq900e0dbrdmnk1vfd1	Centerlight Healthcare	\N	\N	\N	t	2025-07-25 18:30:38.241	2025-07-25 18:30:38.241
cmdj5prqa00e5dbrd4dqc3lws	Village Care	\N	\N	\N	t	2025-07-25 18:30:38.242	2025-07-25 18:30:38.242
cmdj5prqb00e8dbrdanwlo08d	Empire Plan	\N	\N	\N	t	2025-07-25 18:30:38.243	2025-07-25 18:30:38.243
cmdj5prru00kadbrdexzu65yh	No Fault	\N	\N	\N	t	2025-07-25 18:30:38.299	2025-07-25 18:30:38.299
cmdj5prsp00nodbrd0nuef94z	EmblemHealth	\N	\N	\N	t	2025-07-25 18:30:38.329	2025-07-25 18:30:38.329
cmdj5prst00o5dbrd55n4g2zw	MVP	\N	\N	\N	t	2025-07-25 18:30:38.333	2025-07-25 18:30:38.333
cmdj5prsw00oidbrd4999vyjt	Affinity by Molina Healthcare	\N	\N	\N	t	2025-07-25 18:30:38.337	2025-07-25 18:30:38.337
cmdj5prsx00oldbrdhzqk9buj	Centivo	\N	\N	\N	t	2025-07-25 18:30:38.337	2025-07-25 18:30:38.337
\.


--
-- Data for Name: Practitioner; Type: TABLE DATA; Schema: public; Owner: Nathan
--

COPY public."Practitioner" (id, "firstName", "lastName", phone, address, state, zip, website, "selfPayInitial", "selfPayFollowUp", "createdAt", "updatedAt", borough, cert, lat, long, practice) FROM stdin;
cmdj5prkp0000dbrd6dsvneco	Alyssa	Hariprashad	862-352-9080	350 7th Ave.,Ste 500 Rm 8	NY	10001	\N	0	0	2025-07-25 18:30:38.041	2025-07-25 18:30:38.041	Manhattan	YES	40.7482132	-73.9929658	\N
cmdj5prlc000adbrdbfpkcyw3	Chad	Woodard	917-338-6268	214 W 29th St.,901	NY	10001	\N	0	0	2025-07-25 18:30:38.065	2025-07-25 18:30:38.065	Manhattan	NO	40.7481045	-73.9939226	\N
cmdj5prls000rdbrdgortr82l	Jessica	Klein	\N	244 5th Ave,6th Floor	NY	10001	\N	0	0	2025-07-25 18:30:38.08	2025-07-25 18:30:38.08	Manhattan	NO	40.7445833	-73.9876355	\N
cmdj5prlw000wdbrdjjx82u86	Vinita Chandra	Mody	212-255-5531	152 West. 25th St.,Ste 601	NY	10001	https://stromapt.com/people/vinita-chandra-mody/#:~:text=Vinita%20Chandra%20Mody%2C%20the%20visionary	400	0	2025-07-25 18:30:38.084	2025-07-25 18:30:38.084	Manhattan	YES	40.744906	-73.9939925	\N
cmdj5prmg001kdbrd38n6i5zx	Francesca	Warner	917- 300-8814	32 Union Square East. 	NY	10003	\N	0	0	2025-07-25 18:30:38.104	2025-07-25 18:30:38.104	Manhattan	NO	40.7356853	-73.9892836	\N
cmdj5prml001sdbrdsbf8rtha	Jill	Hoefs	646-328-2525	32 Union Square East,7th floor 	NY	10003	\N	0	0	2025-07-25 18:30:38.11	2025-07-25 18:30:38.11	Manhattan	NO	40.7356197	-73.9891102	\N
cmdj5prmn001wdbrdpwab97av	Stephanie	Athanas	212-253-9383	873 Broadway #501 	NY	10003	\N	0	0	2025-07-25 18:30:38.112	2025-07-25 18:30:38.112	Manhattan	NO	40.7381486	-73.9903659	\N
cmdj5prmw002edbrdmpd60wj6	Natalia	Farnsworth	646-790-7454	30 Broad St. 	NY	10004	\N	0	0	2025-07-25 18:30:38.12	2025-07-25 18:30:38.12	Manhattan	NO	40.7062816	-74.0116317	\N
cmdj5prmz002mdbrd0nr1m469	Bhumi	Patel	212-379-6414	65 Broadway,Ste 902 	NY	10006	https://redefinehealthcare.com/meet-our-new-physical-therapist-bhumi-patel/	375	0	2025-07-25 18:30:38.124	2025-07-25 18:30:38.124	Manhattan	NO	40.7071762	-74.0124086	\N
cmdj5prn9003adbrdzlbco3d4	Linnea	Petersen	212-475-8104	915 Broadway Ste 1106 	NY	10010	https://cscmgroup.com/	0	0	2025-07-25 18:30:38.133	2025-07-25 18:30:38.133	Manhattan	NO	40.7397236	-73.9898552	\N
cmdj5prnc003hdbrderaaokri	Bijal	Toprani	347-788-0891	160 W. 16th St. 	NY	10011	\N	0	0	2025-07-25 18:30:38.136	2025-07-25 18:30:38.136	Manhattan	NO	40.7395626	-73.9983832	\N
cmdj5prne003mdbrdsj61s6k8	Cailin	Dix	212-226-2066	37 W 20th St. 	NY	10011	\N	0	0	2025-07-25 18:30:38.138	2025-07-25 18:30:38.138	Manhattan	NO	40.7407938	-73.9933119	\N
cmdj5prne003ndbrd2hz8tp0x	Deena	Kimiatek	212-226-2066	37 W 20th St. 	NY	10011	\N	0	0	2025-07-25 18:30:38.138	2025-07-25 18:30:38.138	Manhattan	NO	40.7408053	-73.9931114	\N
cmdj5prng003tdbrdyt4kkf63	Morgan	Mowers	212-486- 8573	119 W. 23rd St. 	NY	10011	https://www.finishlinept.com/	250	0	2025-07-25 18:30:38.14	2025-07-25 18:30:38.14	Manhattan	NO	40.7434978	-73.9934297	\N
cmdj5prnm0048dbrd8kvma3lo	Samira	Panjaki	212-226-2066	37 W 20th St.,Ste 607 	NY	10011	https://5pointpt.com/	248	0	2025-07-25 18:30:38.146	2025-07-25 18:30:38.146	Manhattan	NO	40.7407505	-73.9931495	\N
cmdj5prnn004ddbrdqgkl7tkc	Abby	Bales	212-739-9237	650 Broadway 	NY	10012	\N	0	0	2025-07-25 18:30:38.148	2025-07-25 18:30:38.148	Manhattan	NO	40.7266714	-73.9952843	\N
cmdj5prnq004kdbrdmjuuu79e	Adam	Gvili	929-590-3445	227 Mulberry St. 	NY	10012	\N	0	0	2025-07-25 18:30:38.15	2025-07-25 18:30:38.15	Manhattan	NO	40.722631	-73.9962269	\N
cmdj5prnq004ldbrd1z52sdyu	Jessica	Babich	810.923.1483	3 Jay St. 	NY	10013	\N	0	0	2025-07-25 18:30:38.15	2025-07-25 18:30:38.15	Manhattan	NO	40.7180591	-74.0093175	\N
cmdj5prns004tdbrddnigtexa	Isa	Herrera	212-213-4660	171 Madison Ave.,STE 1600	NY	10016	\N	0	0	2025-07-25 18:30:38.153	2025-07-25 18:30:38.153	Manhattan	NO	40.7472002	-73.9831712	\N
cmdj5prnu004ydbrdbrl2m0kj	Kristen	Lettenberger	646-596-7427	9 Esat 40th St.,#12	NY	10016	https://parksportspt.com/insurance/#ins-pg-form	250	0	2025-07-25 18:30:38.154	2025-07-25 18:30:38.154	Manhattan	NO	40.7520477	-73.9809432	\N
cmdj5pro2005qdbrdrz8zgxt2	Rebecca	Arkin	646-841-1400	143 EaSt. 34th St. 	NY	10016	\N	0	0	2025-07-25 18:30:38.163	2025-07-25 18:30:38.163	Manhattan	YES	40.7463641	-73.9789855	\N
cmdj5pro4005xdbrdmxuf5721	Alexandra	Lange	212-354-2622	110 E 42nd St.,Ste 1504 	NY	10017	 https://beyondbasicsphysicaltherapy.com/	0	0	2025-07-25 18:30:38.164	2025-07-25 18:30:38.164	Manhattan	YES	40.751637	-73.9772364	\N
cmdj5pro60064dbrdxn8qmjk4	Amy	Stein	212-354-2622	110 EaSt. 42nd St.,Ste 1504 	NY	10017	https://beyondbasicsphysicaltherapy.com/	0	0	2025-07-25 18:30:38.166	2025-07-25 18:30:38.166	Manhattan	NO	40.751605	-73.977022	\N
cmdj5pro8006fdbrds4mb2j2y	Carola	Monroe	212-661-2933	6 EaSt. 45th St.,Ste #1205	NY	10017	\N	0	0	2025-07-25 18:30:38.169	2025-07-25 18:30:38.169	Manhattan	NO	40.7553527	-73.9785986	\N
cmdj5prob006odbrddq3g2bti	Claire	Hamnett	929-269-2505	315 Madison Ave. #2100 	NY	10017	\N	0	0	2025-07-25 18:30:38.171	2025-07-25 18:30:38.171	Manhattan	YES	40.7525412	-73.9792042	\N
cmdj5proe0071dbrd1p9ak9dy	Dania M.	Kafka	212-354-2622	110 EaSt. 42nd St.. Ste 1504 	NY	10017	https://beyondbasicsphysicaltherapy.com/	0	0	2025-07-25 18:30:38.175	2025-07-25 18:30:38.175	Manhattan	NO	40.7516035	-73.9770498	\N
cmdj5prog0076dbrds3b3tl4c	Erica	Azzaretto Michitsch	929-269-2505	286 Madison Ave. Ste 1601 	NY	10017	\N	0	0	2025-07-25 18:30:38.176	2025-07-25 18:30:38.176	Manhattan	NO	40.7517681	-73.9803915	\N
cmdj5prog0077dbrdcwluummh	Janaki	Amin	212-499-0848	708 3rd Ave. Ste 300 	NY	10017	https://www.hdphysicaltherapy.com/	325	0	2025-07-25 18:30:38.177	2025-07-25 18:30:38.177	Manhattan	NO	40.7524458	-73.9737053	\N
cmdj5proj007idbrdm3min7dj	Kara	Mortifoglio	929 269 2505	315 Madison Ave.,Ste 2100	NY	10017	\N	0	0	2025-07-25 18:30:38.18	2025-07-25 18:30:38.18	Manhattan	NO	40.7525412	-73.9792042	\N
cmdj5proj007jdbrd5k1zfuxw	Kathryn	Ahuja	212-354-2622	110 E 42nd St.	NY	10017	https://beyondbasicsphysicaltherapy.com/	0	0	2025-07-25 18:30:38.18	2025-07-25 18:30:38.18	Manhattan	NO	40.7515969	-73.977063	\N
cmdj5prol007qdbrdnn1zem98	Kira	Sterling	646-829-2290	630 3rd Ave. 	NY	10017	https://spearcenter.com/explore/providers/	210	0	2025-07-25 18:30:38.182	2025-07-25 18:30:38.182	Manhattan	NO	40.7500162	-73.9754028	\N
cmdj5prop0085dbrd1tj6f2e4	Megan	Young	845-826-5452	211 E 43rd St.,Ste #1101 	NY	10017	\N	0	0	2025-07-25 18:30:38.185	2025-07-25 18:30:38.185	Manhattan	NO	40.751368	-73.9729898	\N
cmdj5proq008adbrdfppip2lc	Michele	McGurk	929-445 8184	110 EaSt. 42nd St.. Ste 1504 	NY	10017	https://beyondbasicsphysicaltherapy.com/	0	0	2025-07-25 18:30:38.187	2025-07-25 18:30:38.187	Manhattan	YES	40.7516035	-73.9770498	\N
cmdj5pros008fdbrdh22x2hie	Rebecca	Arkin	929-269-2505	315 Madision Ave. 	NY	10017	\N	0	0	2025-07-25 18:30:38.188	2025-07-25 18:30:38.188	Manhattan	YES	40.7525487	-73.9791988	\N
cmdj5prou008mdbrdj1dnab3y	Riva	Preil	732-595-1378	110 EaSt. 42nd St.. Ste 1504 	NY	10017	https://beyondbasicsphysicaltherapy.com/	0	0	2025-07-25 18:30:38.19	2025-07-25 18:30:38.19	Manhattan	NO	40.7516035	-73.9770498	\N
cmdj5prox008xdbrdy9unw1wo	Stephanie	Stamas	212-354-2622	110 E 42nd St. Ste 1504 	NY	10017	\N	0	0	2025-07-25 18:30:38.194	2025-07-25 18:30:38.194	Manhattan	YES	40.7515617	-73.9771001	\N
cmdj5proz0095dbrd5b5d16l9	Tina	Cardenia	646-270-6303	110 E 42nd St. 	NY	10017	https://beyondbasicsphysicaltherapy.com/	0	0	2025-07-25 18:30:38.196	2025-07-25 18:30:38.196	Manhattan	NO	40.751637	-73.9772364	\N
cmdj5prp1009cdbrd0m46j7v9	Mahmoud	Shalaby	718-648-0888	575 8th Ave. 	NY	10018	https://www.ptofthecity.com/#FAQs	0	0	2025-07-25 18:30:38.198	2025-07-25 18:30:38.198	Manhattan	YES	40.7550226	-73.9916868	\N
cmdj5prpg00aydbrdqh5hmsxk	Melanie	Rocchio	646-478-8700	7 W 36th St. STE 401 Manhattan	NY	10018	https://fuelsportandspine.com/team/	0	0	2025-07-25 18:30:38.213	2025-07-25 18:30:38.213	Manhattan	NO	40.7502624	-73.9842445	\N
cmdj5prpi00b3dbrd9l6hc9a3	Bridgit	Shaefer	888-462-0045	119 weSt. 57th St. City	NY	10019	https://cynergypt.com/what-we-treat/pelvic-floor-physical-therapy/	200	0	2025-07-25 18:30:38.214	2025-07-25 18:30:38.214	Manhattan	NO	40.7648279	-73.9780289	\N
cmdj5prpl00bedbrdeag52z63	Sarah	Jordan	917-727-1527	244-250 WeSt. 54th St. Ste 805 	NY	10019	\N	0	0	2025-07-25 18:30:38.217	2025-07-25 18:30:38.217	Manhattan	NO	40.7642666	-73.9833057	\N
cmdj5prpn00bmdbrdhl5un3st	Evelyn	Hecht	212-288-2242	1317 Third Ave. 	NY	10021	\N	0	0	2025-07-25 18:30:38.219	2025-07-25 18:30:38.219	Manhattan	NO	40.7718491	-73.9586175	\N
cmdj5prpo00brdbrdm4xjey2d	Jasmina	Sidberry	212-288-2242	1317 Third Floor 	NY	10021	\N	0	0	2025-07-25 18:30:38.22	2025-07-25 18:30:38.22	Manhattan	YES	40.7718654	-73.9586489	\N
cmdj5prpq00c0dbrd6zdr0l17	Jennifer	Jurewicz	212-288-2242	1317 3rd Ave	NY	10021	\N	0	0	2025-07-25 18:30:38.223	2025-07-25 18:30:38.223	Manhattan	YES	40.7718654	-73.9586489	\N
cmdj5prps00c7dbrdrpkw8hf2	Irene	Hernandez	646-799-0394	333 E 56th St. 	NY	10022	https://www.suttonplacept.com/	350	0	2025-07-25 18:30:38.224	2025-07-25 18:30:38.224	Manhattan	NO	40.7582703	-73.9643154	\N
cmdj5prpu00cfdbrdbwmu94ak	Mary	Hughes	646--888-5242	515 Madison Ave. NY	NY	10022	https://www.mskcc.org/insurance-assistance/insurance-information/insurance-plans	0	0	2025-07-25 18:30:38.226	2025-07-25 18:30:38.226	Manhattan	YES	40.7597267	-73.973744	\N
cmdj5prpw00cmdbrdni81pdd6	Megan	Lavroff	646-754-2000	555 Madison Ave. 	NY	10022	https://nyulangone.org/doctors/1346728102/megan-e-lavroff	0	0	2025-07-25 18:30:38.228	2025-07-25 18:30:38.228	Manhattan	YES	40.7613149	-73.9726805	\N
cmdj5prqc00efdbrdzzu9zbsh	Ana	Wu Machuca	212-353-8693	310 WeSt. 72nd St,#1GH 	NY	10023	https://www.zionpt.com/staff	232	0	2025-07-25 18:30:38.245	2025-07-25 18:30:38.245	Manhattan	NO	40.7798545	-73.9853445	\N
cmdj5prqg00esdbrdpjiumn0y	Bianca	Ambrosino	212-353-8693	310 weSt. 72nd St. 	NY	10023	\N	0	0	2025-07-25 18:30:38.248	2025-07-25 18:30:38.248	Manhattan	NO	40.7798545	-73.9853445	\N
cmdj5prqh00ezdbrda3qxe36w	Cristina	Bateman	212-353-8693	310 W 72nd St. Unit 1G 	NY	10023	https://www.zionpt.com/staff	232	0	2025-07-25 18:30:38.25	2025-07-25 18:30:38.25	Manhattan	NO	40.7798545	-73.9853445	\N
cmdj5prql00fcdbrd66zkhi21	Kristin	Sapienza	646-678-3034	240 WeSt. 73rd St. 	NY	10023	\N	0	0	2025-07-25 18:30:38.253	2025-07-25 18:30:38.253	Manhattan	NO	40.7796854	-73.9826586	\N
cmdj5prqm00fhdbrddqqvpo5y	Meghan	Mizrachi	212-353-8693	310 WeSt. 72nd St.,Ste 1G	NY	10023	https://www.zionpt.com/staff	232	0	2025-07-25 18:30:38.254	2025-07-25 18:30:38.254	Manhattan	NO	40.7798545	-73.9853445	\N
cmdj5prqp00fudbrdkuik0pds	Natalia Marie 	Rodriguez	305-491-1166	310 W 72nd St. 	NY	10023	https://www.zionpt.com/staff	232	0	2025-07-25 18:30:38.258	2025-07-25 18:30:38.258	Manhattan	NO	40.7798545	-73.9853445	\N
cmdj5prqt00g7dbrdmxgsvgxr	Tulsi	Amin	732-794-2045	235 W 75th St. NY	NY	10023	https://spearcenter.com/explore/providers/	210	0	2025-07-25 18:30:38.261	2025-07-25 18:30:38.261	Manhattan	NO	40.7814282	-73.9817664	\N
cmdj5prqx00godbrdeqq3z2yo	Leslie	Daley	212-787-3696	246 WeSt. 80th St. 	NY	10024	\N	0	0	2025-07-25 18:30:38.265	2025-07-25 18:30:38.265	Manhattan	NO	40.7846004	-73.979946	\N
cmdj5prqy00gvdbrdxscwmm9y	Elizabeth	McAneny	212-353-8693	241 EaSt. 86th St. Ste 2B City	NY	10023	https://www.zionpt.com/staff	232	0	2025-07-25 18:30:38.267	2025-07-25 18:30:38.267	Manhattan	NO	40.7798545	-73.9853445	\N
cmdj5prr200hadbrd1bekzuzp	Lauren	Newman	212-353-8693	241 EaSt. 86th St. Ste 2B 	NY	10023	https://www.zionpt.com/staff	232	0	2025-07-25 18:30:38.271	2025-07-25 18:30:38.271	Manhattan	NO	40.7798545	-73.9853445	\N
cmdj5prr500hndbrdryj2oafd	Yael	Cohn	212-353-8693	241 EaSt. 86th St. Ste 2B 	NY	10023	https://www.zionpt.com/staff	232	0	2025-07-25 18:30:38.274	2025-07-25 18:30:38.274	Manhattan	NO	40.7798545	-73.9853445	\N
cmdj5prr900i0dbrd0uv22cte	Michele	Christian	212-255-5531	152 W 25th St. Ste 601 	NY	10001	https://stromapt.com/people/vinita-chandra-mody/#:~:text=Vinita%20Chandra%20Mody%2C%20the%20visionary	400	0	2025-07-25 18:30:38.277	2025-07-25 18:30:38.277	Manhattan	NO	40.744906	-73.9939925	\N
cmdj5prrd00ijdbrd14050j5b	Bhavti	Soni	212-402-5430	75 Maiden Ln 	NY	10038	\N	0	0	2025-07-25 18:30:38.282	2025-07-25 18:30:38.282	Manhattan	NO	40.7077599	-74.0073929	\N
cmdj5prre00imdbrd7xzw4z5g	Corey	Hazama	212-267-0240	156 William St. #800 	NY	10038	\N	0	0	2025-07-25 18:30:38.283	2025-07-25 18:30:38.283	Manhattan	YES	40.7099384	-74.0058348	\N
cmdj5prri00izdbrda2c994uc	Jessica	Nielson	212-353-8693	1556 3rd Ave. #211 	NY	10128	https://5pointpt.com/	0	0	2025-07-25 18:30:38.286	2025-07-25 18:30:38.286	Manhattan	NO	40.779794	-73.9534897	\N
cmdj5prrj00j6dbrdnx52s4qz	Staci	Levine	212-353-8693	1556 3rd Ave,Ste 211	NY	10023	https://www.zionpt.com/staff	232	0	2025-07-25 18:30:38.288	2025-07-25 18:30:38.288	Manhattan	YES	40.7798545	-73.9853445	\N
cmdj5prro00jndbrdg8c7os7y	Naeema	Haq	917-722-6883	1351 ForeSt. Ave	NY	10302	https://www.jagpt.com/physical-therapy-clinics/ny/westerleigh/	200	0	2025-07-25 18:30:38.293	2025-07-25 18:30:38.293	Staten Island	NO	40.6262208	-74.1355648	\N
cmdj5prrv00kddbrd4kk7lgwe	Katarzyna	Niebrzydowska	718-979-7013	69 Guyon Ave.	NY	10306	https://www.mcphysicaltherapy.com/brooklyn/#	0	0	2025-07-25 18:30:38.299	2025-07-25 18:30:38.299	Staten Island	YES	40.565056	-74.128405	\N
cmdj5prrz00ktdbrdxeqy8guk	Sara	Feigenbaum	347-671-7109	900 South Ave	NY	10309	\N	0	0	2025-07-25 18:30:38.303	2025-07-25 18:30:38.303	Staten Island	NO	40.6169666	-74.1727132	\N
cmdj5prs000kydbrditpa3k3d	Brandi	Childs	718-984-8400	4363 Amboy Road	NY	10302	https://www.jagpt.com/physical-therapy-clinics/ny/westerleigh/	200	0	2025-07-25 18:30:38.304	2025-07-25 18:30:38.304	Staten Island	NO	40.6262208	-74.1355648	\N
cmdj5prs700lqdbrdbif3bi5z	Cristina	Chiacchiero	347-857-6368	1598 Richmond Ave.	NY	10314	https://www.preciousmovementspt.com/new-page	0	0	2025-07-25 18:30:38.311	2025-07-25 18:30:38.311	Staten Island	NO	40.6093049	-74.1609938	\N
cmdj5prs800lvdbrder2lqwb7	Amanda	Quirk	347-782-3491	Unknown	NY	10314	\N	0	0	2025-07-25 18:30:38.313	2025-07-25 18:30:38.313	Staten Island	NO	40.6032689	-74.1441808	\N
cmdj5prs900m0dbrd2x6n5k59	Anisha K.	Balanadu	718-960-6173	4487 3rd Ave,7th floor	NY	10457	https://uchcbronx.org/services-2/	0	0	2025-07-25 18:30:38.314	2025-07-25 18:30:38.314	Bronx	NO	40.8534217	-73.8919377	\N
cmdj5prsb00m5dbrdupg6ooc6	Yaneth	Serrano	718-960-6173	4487 3rd Ave.	NY	10457	https://uchcbronx.org/services-2/	0	0	2025-07-25 18:30:38.315	2025-07-25 18:30:38.315	Bronx	NO	40.8534217	-73.8919377	\N
cmdj5prsc00m8dbrdhekzzjmj	Vimala	Thiruvengadam	718-794-0600	1250 Waters Place,Ste 710 	NY	10461	https://www.nyspineandsport.com/contact	150	0	2025-07-25 18:30:38.316	2025-07-25 18:30:38.316	Bronx	YES	40.8525458	-73.8392794	\N
cmdj5prsf00mndbrdn1tc6nnj	Marie	Pauline Mendoza	732-861-5543	5-31 50th Ave.	NY	11101	\N	0	0	2025-07-25 18:30:38.32	2025-07-25 18:30:38.32	Queens	NO	40.7431	-73.9552005	\N
cmdj5prsh00msdbrd2i309hmj	Yuting	Huang	347-396-5612	29-36 30th Ave.	NY	10017	https://www.hdphysicaltherapy.com/	325	0	2025-07-25 18:30:38.321	2025-07-25 18:30:38.321	Queens	YES	40.7524458	-73.9737053	\N
cmdj5prsj00n3dbrdh0mwkk4e	Chutima	Phanpho	347-652-8218	4141 46th St.	NY	11104	\N	0	0	2025-07-25 18:30:38.324	2025-07-25 18:30:38.324	Queens	NO	40.74517	-73.917995	\N
cmdj5prsl00n9dbrdo3sm626t	Sarah	Sinson	\N	4701 Queens Blvd	NY	11104	https://east.optum.com/providers/sarah-sinson/	0	0	2025-07-25 18:30:38.325	2025-07-25 18:30:38.325	Queens	NO	40.7434153	-73.9173877	\N
cmdj5prsy00osdbrdb7x2q5zz	Ana Samantha	Antonio	718-799-6309	3308 35th Ave.	NY	11105	\N	200	0	2025-07-25 18:30:38.339	2025-07-25 18:30:38.339	Queens	NO	40.7570733	-73.9266685	\N
cmdj5prsz00oxdbrdgd8la4oh	Maria	Muto-Rodriguez	929-335-3194	1834A 21 St. Drive 	NY	11105	\N	0	0	2025-07-25 18:30:38.34	2025-07-25 18:30:38.34	Queens	NO	40.782274	-73.9181712	\N
cmdj5prt000oydbrd00du719q	Kellen	Scantlebury	646-875-8348	2103 31 St. Ave. 	NY	11106	\N	0	0	2025-07-25 18:30:38.34	2025-07-25 18:30:38.34	Queens	NO	40.767401	-73.92946	\N
cmdj5prt100p5dbrdq0r0p6tq	Aslyn	Dindorf	332-334-7909	55 Washington St.	NY	11201	\N	0	0	2025-07-25 18:30:38.342	2025-07-25 18:30:38.342	Brooklyn	NO	40.7026493	-73.9893241	\N
cmdj5prt300padbrdryed3v28	Erin	Weber	929-203-0750	68 Jay St.,Ste 609 	NY	11201	\N	0	0	2025-07-25 18:30:38.343	2025-07-25 18:30:38.343	Brooklyn	NO	40.7027571	-73.9868342	\N
cmdj5prt400pfdbrdo4hgtoxv	Eva	Shi	212-712-2006	409 Fulton St.,2nd Floor	NY	11201	https://physiologicnyc.com/team/dr-eva-shi-dpt-physical-therapist-brooklyn-ny/	0	0	2025-07-25 18:30:38.344	2025-07-25 18:30:38.344	Brooklyn	NO	40.6921225	-73.9886067	\N
cmdj5prt500pkdbrdahezwj06	Jane	Chin	929-203-0750	68 Jay St.,#609	NY	11201	\N	0	0	2025-07-25 18:30:38.346	2025-07-25 18:30:38.346	Brooklyn	NO	40.7027687	-73.9868754	\N
cmdj5prt600ppdbrda5u80mtn	Jenna	Evans	646-790-7450	445 Gold St.	NY	10023	https://spearcenter.com/explore/providers/	210	0	2025-07-25 18:30:38.347	2025-07-25 18:30:38.347	Brooklyn	NO	40.7814282	-73.9817664	\N
cmdj5prtb00q6dbrdwfj6udt6	Leigh	Welsh	901-352-1271	137 Montague St.,Ste A #349 	NY	11201	https://www.theoriginway.com/help-articles/billing-and-insurance-faqs	150	0	2025-07-25 18:30:38.351	2025-07-25 18:30:38.351	Brooklyn	NO	40.694846	-73.9938113	\N
cmdj5prtd00qfdbrd3jx40ce7	Mahimkar	Amrita	718-522-3399	200 Livingston St.	NY	11201	https://www.centurymedicaldental.com/	0	0	2025-07-25 18:30:38.353	2025-07-25 18:30:38.353	Brooklyn	NO	40.6897086	-73.9863171	\N
cmdj5prte00qidbrdppaeo1p8	Mena	Mahmoud	718-795-2744	165 Smith St.	NY	10019	https://cynergypt.com/what-we-treat/pelvic-floor-physical-therapy/	200	0	2025-07-25 18:30:38.354	2025-07-25 18:30:38.354	Brooklyn	NO	40.7648279	-73.9780289	\N
cmdj5prtf00qpdbrdgluleeai	Molly K.	Caughlan	929-203-0750	Dumbo 68 Jay St.,Ste 609 	NY	11201	\N	0	0	2025-07-25 18:30:38.356	2025-07-25 18:30:38.356	Brooklyn	NO	40.7027687	-73.9868754	\N
cmdj5prth00qudbrdaijthjz6	Serena	Bruckman	718-772-5700	68 Jay St.,#507 	NY	11201	\N	0	0	2025-07-25 18:30:38.357	2025-07-25 18:30:38.357	Brooklyn	NO	40.7027217	-73.9868878	\N
cmdj5prti00r2dbrdi68oze20	Ayesha	Habib	718-921-2945	9000 Shore Road,East Building,Lower Lobby	NY	11209	https://www.new-dimensions-physical-therapy.com/	0	0	2025-07-25 18:30:38.359	2025-07-25 18:30:38.359	Brooklyn	YES	40.6218393	-74.0397915	\N
cmdj5prtk00r9dbrdcprqbi8m	Fay	Itzkowitz	646-450-6496	1119 East 31 	NY	10023	https://spearcenter.com/explore/providers/	210	0	2025-07-25 18:30:38.361	2025-07-25 18:30:38.361	Brooklyn	NO	40.7814282	-73.9817664	\N
cmdj5prto00rodbrd18sft56d	Gabriella	DeColli	718-369-8000	263 7th Ave.,Ste 2A	NY	11215	https://www.nyp.org/rehabmed/pelvic-health-and-rehabilitation/our-locations	0	0	2025-07-25 18:30:38.365	2025-07-25 18:30:38.365	Brooklyn	NO	40.6688414	-73.9793813	\N
cmdj5pru000sxdbrd9xp28xum	Marianna	DeCaro	646-841-1402	794 Union St.	NY	10023	https://spearcenter.com/explore/providers/	210	0	2025-07-25 18:30:38.376	2025-07-25 18:30:38.376	Brooklyn	NO	40.7814282	-73.9817664	\N
cmdj5pru400tedbrds3nqb0ut	Melanie	Carminati	929-295-6566	219 5th Ave.	NY	11215	\N	0	0	2025-07-25 18:30:38.38	2025-07-25 18:30:38.38	Brooklyn	NO	40.6759457	-73.9805466	\N
cmdj5pru600tpdbrdd4v0mod4	Shana	Handelman	718-369-8000	263 7th Ave.,Ste 2A 	NY	11215	https://www.nyp.org/rehabmed/pelvic-health-and-rehabilitation/our-locations	0	0	2025-07-25 18:30:38.383	2025-07-25 18:30:38.383	Brooklyn	NO	40.6688414	-73.9793813	\N
cmdj5pruj00uydbrdd08csdau	Yael	Avnon	646-301-5465	182 8th Ave	NY	11215	\N	0	0	2025-07-25 18:30:38.395	2025-07-25 18:30:38.395	Brooklyn	NO	40.6710027	-73.9751287	\N
cmdj5pruk00v3dbrdm27t28sv	Allison	Gould	802-343-4325	Unknown	NY	11217	\N	0	0	2025-07-25 18:30:38.397	2025-07-25 18:30:38.397	Brooklyn	NO	40.6815619	-73.9785952	\N
cmdj5prun00vddbrdmf73o3v2	Dani	Saad	646-441-1928	Unknown	NY	11217	\N	0	0	2025-07-25 18:30:38.399	2025-07-25 18:30:38.399	Brooklyn	NO	40.6815619	-73.9785952	\N
cmdj5pruo00vidbrdqsaze9nz	Katherine	Malfucci	732-788-6073	415 Argyle Rd.,Apt 3D 	NY	11218	\N	0	0	2025-07-25 18:30:38.4	2025-07-25 18:30:38.4	Brooklyn	NO	40.6392695	-73.965804	\N
cmdj5prup00vodbrdegxxgpwb	Shani	Judith Fried	718-431-0073	4911 50th St.	NY	11218	https://metrosportsmed.com/	0	0	2025-07-25 18:30:38.402	2025-07-25 18:30:38.402	Brooklyn	NO	40.5788523	-74.0111238	\N
cmdj5pruu00w9dbrd6b4ebz9s	SImona	Shubov	718-437-5225	514 49th St.	NY	10022	https://nyulangone.org/doctors/1346728102/megan-e-lavroff	0	0	2025-07-25 18:30:38.407	2025-07-25 18:30:38.407	Brooklyn	NO	40.7613149	-73.9726805	\N
cmdj5prv800xqdbrd273wn2vl	Yuchen	He	631-524-0420	463 Pulaski St,5B 	NY	11221	https://www.mimophysicaltherapy.com/	0	0	2025-07-25 18:30:38.42	2025-07-25 18:30:38.42	Brooklyn	NO	40.69456	-73.931922	\N
cmdj5prvb00y3dbrdhex41ome	Luci	Calvi	646-518-5560	258 Court St.	NY	10023	https://spearcenter.com/explore/providers/	210	0	2025-07-25 18:30:38.424	2025-07-25 18:30:38.424	Brooklyn	NO	40.7814282	-73.9817664	\N
cmdj5prvf00ykdbrd6yi9q71s	Michelle	Cizma-Fridman	347-689-8945	1539 E 31St. St. 	NY	11234	https://www.forwardptny.com/insurance/	195	0	2025-07-25 18:30:38.428	2025-07-25 18:30:38.428	Brooklyn	NO	40.6149256	-73.9429969	\N
cmdj5prvh00yrdbrd5jh33gq1	Anna	Len	347-581-4068	Unknown	NY	10018	https://www.ptofthecity.com/#FAQs	0	0	2025-07-25 18:30:38.43	2025-07-25 18:30:38.43	Brooklyn	NO	40.7550226	-73.9916868	\N
cmdj5prvt0101dbrdd41loxe9	Chelsea	Wheeler	718-702-6105	101 North 10th St.	NY	11249	https://www.bbwphysicaltherapy.com/	0	0	2025-07-25 18:30:38.441	2025-07-25 18:30:38.441	Brooklyn	NO	40.7207554	-73.9576614	\N
cmdj5prvw010edbrd66r65vra	Marlene	Handler	914-295-9252	118 N 11th St.,2nd Floor 	NY	11249	\N	0	0	2025-07-25 18:30:38.444	2025-07-25 18:30:38.444	Brooklyn	NO	40.7210978	-73.9573179	\N
cmdj5prvx010jdbrdqx5exaxx	Dawn	Chimento	718-791-2391	16059 19th Ave.	NY	11357	\N	0	0	2025-07-25 18:30:38.446	2025-07-25 18:30:38.446	Queens	NO	40.781156	-73.80071	\N
cmdj5prvz010rdbrdvjj02045	Regina	Khaimova	917-561-2555	10010 New york	NY	11375	\N	0	0	2025-07-25 18:30:38.448	2025-07-25 18:30:38.448	Queens	NO	40.718106	-73.8448469	\N
cmdj5prw0010xdbrdrw2qy2p1	Natalie Z.	Toshkoff	929-490-2131	10810 72nd Ave. 4th Floor	NY	11375	\N	0	0	2025-07-25 18:30:38.449	2025-07-25 18:30:38.449	Queens	NO	40.719526	-73.842107	\N
cmdj5prw20112dbrdisdcvjbr	Tania	Alarcon-Montalvo	347-229-8748	Unknown	NY	11215	https://www.nyp.org/rehabmed/pelvic-health-and-rehabilitation/our-locations	0	0	2025-07-25 18:30:38.45	2025-07-25 18:30:38.45	Queens	NO	40.6688414	-73.9793813	\N
cmdj5prwe012hdbrdus79lwgy	Shimon	Slepian	908-764-6679	833 Central Ave. Far Rockaway	NY	11691	\N	0	0	2025-07-25 18:30:38.463	2025-07-25 18:30:38.463	Queens	NO	40.6096551	-73.7447058	\N
cmdj5prmr0024dbrd3bqt0hy7	Steven	Lavender	212-206-1501	44 E. 12th St.,MD1	NY	10003	\N	0	0	2025-07-25 18:30:38.116	2025-07-25 18:30:38.116	Manhattan	NO	40.7332979	-73.9918352	\N
cmdj5prnj0041dbrd4uwrj7im	Samantha	Jacobsen	516-508-0795	119 W. 23rd St. #304	NY	10011	https://www.finishlinept.com/	0	0	2025-07-25 18:30:38.143	2025-07-25 18:30:38.143	Manhattan	NO	40.743592	-73.9933285	\N
\.


--
-- Data for Name: PractitionerDegree; Type: TABLE DATA; Schema: public; Owner: Nathan
--

COPY public."PractitionerDegree" (id, "practitionerId", "degreeId", "yearObtained", institution, "createdAt") FROM stdin;
cmdj5prl10003dbrd35uu89r5	cmdj5prkp0000dbrd6dsvneco	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.053
cmdj5prl70006dbrd6lc6jvtv	cmdj5prkp0000dbrd6dsvneco	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.059
cmdj5prlb0009dbrd38akb7zy	cmdj5prkp0000dbrd6dsvneco	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.064
cmdj5prle000cdbrdgr6bs61e	cmdj5prlc000adbrdbfpkcyw3	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.067
cmdj5prlg000edbrdpr6422at	cmdj5prlc000adbrdbfpkcyw3	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.069
cmdj5prlj000hdbrd9au5qlrr	cmdj5prlc000adbrdbfpkcyw3	cmdj5prli000fdbrdnl5ag8ld	\N	\N	2025-07-25 18:30:38.071
cmdj5prll000kdbrdgejn85du	cmdj5prlc000adbrdbfpkcyw3	cmdj5prlk000idbrdg3iv42ta	\N	\N	2025-07-25 18:30:38.073
cmdj5prln000ndbrd624pzqom	cmdj5prlc000adbrdbfpkcyw3	cmdj5prlm000ldbrdt7hzn259	\N	\N	2025-07-25 18:30:38.076
cmdj5prlr000qdbrdrxo3otz8	cmdj5prlc000adbrdbfpkcyw3	cmdj5prlp000odbrdb8100m5w	\N	\N	2025-07-25 18:30:38.079
cmdj5prlt000tdbrdro67fgjc	cmdj5prls000rdbrdgortr82l	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.082
cmdj5prlv000vdbrd0ibahx8z	cmdj5prls000rdbrdgortr82l	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.083
cmdj5prlx000ydbrdp46jc3a7	cmdj5prlw000wdbrdjjx82u86	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.086
cmdj5prmh001mdbrdrubmetel	cmdj5prmg001kdbrd38n6i5zx	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.106
cmdj5prmj001odbrdx9j32huq	cmdj5prmg001kdbrd38n6i5zx	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.107
cmdj5prmk001rdbrdubda3ier	cmdj5prmg001kdbrd38n6i5zx	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.109
cmdj5prmn001vdbrdl9sqhjh6	cmdj5prml001sdbrdsbf8rtha	cmdj5prmm001tdbrdeh0x3tsr	\N	\N	2025-07-25 18:30:38.111
cmdj5prmp001ydbrd2p656v0u	cmdj5prmn001wdbrdpwab97av	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.113
cmdj5prmq0020dbrd34rwilxf	cmdj5prmn001wdbrdpwab97av	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.114
cmdj5prmr0023dbrdqfvnntb2	cmdj5prmn001wdbrdpwab97av	cmdj5prmq0021dbrdbo10iimq	\N	\N	2025-07-25 18:30:38.115
cmdj5prmt0027dbrd2ffauqo1	cmdj5prmr0024dbrd3bqt0hy7	cmdj5prms0025dbrd4l4t53or	\N	\N	2025-07-25 18:30:38.117
cmdj5prmu002adbrdxmhljz2h	cmdj5prmr0024dbrd3bqt0hy7	cmdj5prmu0028dbrdb2xpwukx	\N	\N	2025-07-25 18:30:38.119
cmdj5prmv002ddbrdjboogae8	cmdj5prmr0024dbrd3bqt0hy7	cmdj5prmv002bdbrdgh4rnmdv	\N	\N	2025-07-25 18:30:38.12
cmdj5prmx002gdbrdguosvbx9	cmdj5prmw002edbrdmpd60wj6	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.121
cmdj5prmy002idbrdq8sbct8s	cmdj5prmw002edbrdmpd60wj6	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.122
cmdj5prmz002ldbrdbrkrcd2n	cmdj5prmw002edbrdmpd60wj6	cmdj5prmy002jdbrd7jpq1f0w	\N	\N	2025-07-25 18:30:38.123
cmdj5prn0002odbrd89x4n1ie	cmdj5prmz002mdbrd0nr1m469	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.125
cmdj5prn1002qdbrdld8btp5h	cmdj5prmz002mdbrd0nr1m469	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.126
cmdj5prna003cdbrdnh8qjz6c	cmdj5prn9003adbrdzlbco3d4	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.134
cmdj5prnb003edbrdigyecffo	cmdj5prn9003adbrdzlbco3d4	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.135
cmdj5prnd003jdbrdtzn3i4th	cmdj5prnc003hdbrderaaokri	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.137
cmdj5prnd003ldbrd2yxd7wrx	cmdj5prnc003hdbrderaaokri	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.138
cmdj5prnf003pdbrd77ak3kp4	cmdj5prne003ndbrd2hz8tp0x	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.139
cmdj5prng003sdbrdf1om26og	cmdj5prne003ndbrd2hz8tp0x	cmdj5prnf003qdbrdn2b3rtta	\N	\N	2025-07-25 18:30:38.14
cmdj5prnh003vdbrdwof33xa1	cmdj5prng003tdbrdyt4kkf63	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.141
cmdj5prnh003xdbrdxd5zskjt	cmdj5prng003tdbrdyt4kkf63	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.142
cmdj5prni0040dbrddhoicudv	cmdj5prng003tdbrdyt4kkf63	cmdj5prni003ydbrdb1bh4ynp	\N	\N	2025-07-25 18:30:38.143
cmdj5prnk0043dbrdgr8ichox	cmdj5prnj0041dbrd4uwrj7im	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.144
cmdj5prnl0045dbrdp0hlpqtx	cmdj5prnj0041dbrd4uwrj7im	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.145
cmdj5prnl0047dbrd7pysr0b9	cmdj5prnj0041dbrd4uwrj7im	cmdj5prni003ydbrdb1bh4ynp	\N	\N	2025-07-25 18:30:38.146
cmdj5prnn004adbrdn65lbg9i	cmdj5prnm0048dbrd8kvma3lo	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.147
cmdj5prnn004cdbrd2s78hx66	cmdj5prnm0048dbrd8kvma3lo	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.148
cmdj5prno004fdbrdq1izyeze	cmdj5prnn004ddbrdqgkl7tkc	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.149
cmdj5prnp004hdbrd15vu2rq1	cmdj5prnn004ddbrdqgkl7tkc	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.149
cmdj5prnp004jdbrdvanva2mc	cmdj5prnn004ddbrdqgkl7tkc	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.15
cmdj5prnr004ndbrdjtj56bpn	cmdj5prnq004ldbrd1z52sdyu	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.151
cmdj5prnr004pdbrdglgtpj54	cmdj5prnq004ldbrd1z52sdyu	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.152
cmdj5prns004sdbrdraosyara	cmdj5prnq004ldbrd1z52sdyu	cmdj5prns004qdbrdv4cceey3	\N	\N	2025-07-25 18:30:38.153
cmdj5prnt004vdbrdqkemtyz6	cmdj5prns004tdbrddnigtexa	cmdj5prnf003qdbrdn2b3rtta	\N	\N	2025-07-25 18:30:38.153
cmdj5prnt004xdbrduhr3plwd	cmdj5prns004tdbrddnigtexa	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.154
cmdj5prnu0050dbrdj7i9o1yl	cmdj5prnu004ydbrdbrl2m0kj	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.155
cmdj5prnv0052dbrda6tr8s7y	cmdj5prnu004ydbrdbrl2m0kj	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.155
cmdj5prnw0054dbrd2rgvlvbk	cmdj5prnu004ydbrdbrl2m0kj	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.156
cmdj5prnx0057dbrduali5tpb	cmdj5prnu004ydbrdbrl2m0kj	cmdj5prnw0055dbrdgylmmqkg	\N	\N	2025-07-25 18:30:38.157
cmdj5pro3005tdbrdzi7uey70	cmdj5pro2005qdbrdrz8zgxt2	cmdj5pro2005rdbrdt1ntvogw	\N	\N	2025-07-25 18:30:38.163
cmdj5pro4005wdbrdrr1ppvoz	cmdj5pro2005qdbrdrz8zgxt2	cmdj5pro3005udbrd32q8vew4	\N	\N	2025-07-25 18:30:38.164
cmdj5pro4005zdbrdvfsm33m8	cmdj5pro4005xdbrdmxuf5721	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.165
cmdj5pro50061dbrd5ty25d17	cmdj5pro4005xdbrdmxuf5721	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.165
cmdj5pro50063dbrd6x8k95ao	cmdj5pro4005xdbrdmxuf5721	cmdj5prli000fdbrdnl5ag8ld	\N	\N	2025-07-25 18:30:38.166
cmdj5pro60066dbrdv4tgpl2p	cmdj5pro60064dbrdxn8qmjk4	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.167
cmdj5pro70068dbrduurmhbm2	cmdj5pro60064dbrdxn8qmjk4	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.167
cmdj5pro8006bdbrdlyealrpq	cmdj5pro60064dbrdxn8qmjk4	cmdj5pro70069dbrd4uvbvmhr	\N	\N	2025-07-25 18:30:38.168
cmdj5pro8006edbrdp5h10kak	cmdj5pro60064dbrdxn8qmjk4	cmdj5pro8006cdbrd02ooyquf	\N	\N	2025-07-25 18:30:38.169
cmdj5pro9006hdbrdjsbab5tk	cmdj5pro8006fdbrds4mb2j2y	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.17
cmdj5proa006kdbrddub7r70u	cmdj5pro8006fdbrds4mb2j2y	cmdj5pro9006idbrdg74x8f9y	\N	\N	2025-07-25 18:30:38.17
cmdj5prob006ndbrdjagm4aur	cmdj5pro8006fdbrds4mb2j2y	cmdj5proa006ldbrd7txxfyby	\N	\N	2025-07-25 18:30:38.171
cmdj5prob006qdbrdajnb5o9v	cmdj5prob006odbrddq3g2bti	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.172
cmdj5proc006sdbrdb26atspu	cmdj5prob006odbrddq3g2bti	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.172
cmdj5prod006vdbrd0c29xas0	cmdj5prob006odbrddq3g2bti	cmdj5proc006tdbrdnvpp8wyt	\N	\N	2025-07-25 18:30:38.173
cmdj5prod006xdbrdvqin307f	cmdj5prob006odbrddq3g2bti	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.174
cmdj5proe0070dbrdbjxnbjro	cmdj5prob006odbrddq3g2bti	cmdj5proe006ydbrdh4tvg5yg	\N	\N	2025-07-25 18:30:38.174
cmdj5prof0073dbrdqh60m9h2	cmdj5proe0071dbrd1p9ak9dy	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.175
cmdj5prog0075dbrdczknrxmn	cmdj5proe0071dbrd1p9ak9dy	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.176
cmdj5proh0079dbrdggt3mrzv	cmdj5prog0077dbrdcwluummh	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.177
cmdj5proh007bdbrde9vlj6vb	cmdj5prog0077dbrdcwluummh	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.178
cmdj5proi007ddbrdzpiciue9	cmdj5prog0077dbrdcwluummh	cmdj5prns004qdbrdv4cceey3	\N	\N	2025-07-25 18:30:38.178
cmdj5prok007ldbrdmpwuzwol	cmdj5proj007jdbrd5k1zfuxw	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.18
cmdj5prok007ndbrd8gb91h08	cmdj5proj007jdbrd5k1zfuxw	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.181
cmdj5prol007pdbrdxdv5tofh	cmdj5proj007jdbrd5k1zfuxw	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.181
cmdj5prom007sdbrdqp3hi55r	cmdj5prol007qdbrdnn1zem98	cmdj5pro3005udbrd32q8vew4	\N	\N	2025-07-25 18:30:38.182
cmdj5proq0087dbrdbz47uav0	cmdj5prop0085dbrd1tj6f2e4	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.186
cmdj5proq0089dbrddwlvv7ag	cmdj5prop0085dbrd1tj6f2e4	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.187
cmdj5pror008cdbrdddo47q4n	cmdj5proq008adbrdfppip2lc	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.187
cmdj5pros008edbrdetyj9wjk	cmdj5proq008adbrdfppip2lc	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.188
cmdj5pros008hdbrdrb6z3vbl	cmdj5pros008fdbrdh22x2hie	cmdj5pro2005rdbrdt1ntvogw	\N	\N	2025-07-25 18:30:38.189
cmdj5prot008jdbrdamn4zexs	cmdj5pros008fdbrdh22x2hie	cmdj5pro3005udbrd32q8vew4	\N	\N	2025-07-25 18:30:38.189
cmdj5prot008ldbrd3x442wxp	cmdj5pros008fdbrdh22x2hie	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.19
cmdj5prou008odbrd9gyxcjgx	cmdj5prou008mdbrdj1dnab3y	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.191
cmdj5prov008qdbrdknzzdguv	cmdj5prou008mdbrdj1dnab3y	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.192
cmdj5prow008sdbrdy4q0xd9a	cmdj5prou008mdbrdj1dnab3y	cmdj5proc006tdbrdnvpp8wyt	\N	\N	2025-07-25 18:30:38.192
cmdj5prox008udbrd0fnhlik1	cmdj5prou008mdbrdj1dnab3y	cmdj5pro70069dbrd4uvbvmhr	\N	\N	2025-07-25 18:30:38.193
cmdj5prox008wdbrdiyxfdjsy	cmdj5prou008mdbrdj1dnab3y	cmdj5proe006ydbrdh4tvg5yg	\N	\N	2025-07-25 18:30:38.194
cmdj5proy008zdbrdxppxd3km	cmdj5prox008xdbrdy9unw1wo	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.194
cmdj5proy0091dbrd38bkliqu	cmdj5prox008xdbrdy9unw1wo	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.195
cmdj5proz0094dbrdr4zdam8y	cmdj5prox008xdbrdy9unw1wo	cmdj5proz0092dbrd7zursrcz	\N	\N	2025-07-25 18:30:38.196
cmdj5prp00097dbrdir5e6r7c	cmdj5proz0095dbrd5b5d16l9	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.196
cmdj5prp10099dbrdptoaidlf	cmdj5proz0095dbrd5b5d16l9	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.197
cmdj5prp1009bdbrd62i3mxnc	cmdj5proz0095dbrd5b5d16l9	cmdj5prns004qdbrdv4cceey3	\N	\N	2025-07-25 18:30:38.198
cmdj5prp2009edbrd67nrjyp2	cmdj5prp1009cdbrd0m46j7v9	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.198
cmdj5prp2009gdbrd965ta7og	cmdj5prp1009cdbrd0m46j7v9	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.199
cmdj5prp3009jdbrdh9e1p6bz	cmdj5prp1009cdbrd0m46j7v9	cmdj5prp3009hdbrdvl8bxyh0	\N	\N	2025-07-25 18:30:38.2
cmdj5prp4009ldbrd25nk6h0s	cmdj5prp1009cdbrd0m46j7v9	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.2
cmdj5prph00b0dbrdtzzmfb8f	cmdj5prpg00aydbrdqh5hmsxk	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.213
cmdj5prpi00b2dbrdhxrwpt8e	cmdj5prpg00aydbrdqh5hmsxk	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.214
cmdj5prpj00b5dbrdkiw4dbyr	cmdj5prpi00b3dbrd9l6hc9a3	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.215
cmdj5prpj00b7dbrdhkd8w8p8	cmdj5prpi00b3dbrd9l6hc9a3	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.216
cmdj5prpl00bgdbrdur1d1xup	cmdj5prpl00bedbrdeag52z63	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.218
cmdj5prpm00bidbrdmkw6b6zj	cmdj5prpl00bedbrdeag52z63	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.218
cmdj5prpn00bldbrdtmoy4p7x	cmdj5prpl00bedbrdeag52z63	cmdj5prpm00bjdbrdbzs41kx3	\N	\N	2025-07-25 18:30:38.219
cmdj5prpn00bodbrdopujagoo	cmdj5prpn00bmdbrdhl5un3st	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.22
cmdj5prpo00bqdbrdgk9dwcga	cmdj5prpn00bmdbrdhl5un3st	cmdj5proz0092dbrd7zursrcz	\N	\N	2025-07-25 18:30:38.22
cmdj5prpo00btdbrd9fdvw85b	cmdj5prpo00brdbrdm4xjey2d	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.221
cmdj5prpp00bvdbrdr0l8k16y	cmdj5prpo00brdbrdm4xjey2d	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.221
cmdj5prpp00bxdbrdxqv4iiyt	cmdj5prpo00brdbrdm4xjey2d	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.222
cmdj5prpq00bzdbrdh7vffrd1	cmdj5prpo00brdbrdm4xjey2d	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.223
cmdj5prpr00c2dbrd0xiizxd1	cmdj5prpq00c0dbrd6zdr0l17	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.223
cmdj5prpr00c4dbrdvaa280nr	cmdj5prpq00c0dbrd6zdr0l17	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.224
cmdj5prps00c6dbrd8aw5wbfg	cmdj5prpq00c0dbrd6zdr0l17	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.224
cmdj5prpt00c9dbrd8gdmvek2	cmdj5prps00c7dbrdrpkw8hf2	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.225
cmdj5prpv00chdbrdz7384cce	cmdj5prpu00cfdbrdbwmu94ak	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.227
cmdj5prpv00cjdbrd2arhwvcy	cmdj5prpu00cfdbrdbwmu94ak	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.227
cmdj5prpw00cldbrd3mcjbj19	cmdj5prpu00cfdbrdbwmu94ak	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.228
cmdj5prpx00codbrdm2vcxmfw	cmdj5prpw00cmdbrdni81pdd6	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.229
cmdj5prpx00cqdbrdas1nad79	cmdj5prpw00cmdbrdni81pdd6	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.23
cmdj5prpy00csdbrdvgt0g99v	cmdj5prpw00cmdbrdni81pdd6	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.23
cmdj5prqd00ehdbrdnrfr9la7	cmdj5prqc00efdbrdzzu9zbsh	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.245
cmdj5prqd00ejdbrdu5gvoy6t	cmdj5prqc00efdbrdzzu9zbsh	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.246
cmdj5prqg00eudbrdvw6qv3pk	cmdj5prqg00esdbrdpjiumn0y	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.249
cmdj5prqh00ewdbrd0ddcx990	cmdj5prqg00esdbrdpjiumn0y	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.249
cmdj5prqh00eydbrdjaa0o87x	cmdj5prqg00esdbrdpjiumn0y	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.25
cmdj5prqi00f1dbrdosmf55yx	cmdj5prqh00ezdbrda3qxe36w	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.25
cmdj5prqi00f3dbrdna6xmve2	cmdj5prqh00ezdbrda3qxe36w	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.251
cmdj5prql00fedbrdklhkke4n	cmdj5prql00fcdbrd66zkhi21	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.254
cmdj5prqm00fgdbrdsjpnrori	cmdj5prql00fcdbrd66zkhi21	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.254
cmdj5prqm00fjdbrd4nx42bzb	cmdj5prqm00fhdbrddqqvpo5y	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.255
cmdj5prqn00fldbrdfsv51zmp	cmdj5prqm00fhdbrddqqvpo5y	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.255
cmdj5prqq00fwdbrdt820v0qj	cmdj5prqp00fudbrdkuik0pds	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.258
cmdj5prqq00fydbrdl8uskrmx	cmdj5prqp00fudbrdkuik0pds	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.259
cmdj5prqt00g9dbrdt3nrudyh	cmdj5prqt00g7dbrdmxgsvgxr	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.262
cmdj5prqu00gbdbrdft42q22i	cmdj5prqt00g7dbrdmxgsvgxr	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.262
cmdj5prqx00grdbrd0cku09c8	cmdj5prqx00godbrdeqq3z2yo	cmdj5prqx00gpdbrdhnmj0y6f	\N	\N	2025-07-25 18:30:38.266
cmdj5prqy00gudbrdf7spqwno	cmdj5prqx00godbrdeqq3z2yo	cmdj5prqy00gsdbrdpqb00vo1	\N	\N	2025-07-25 18:30:38.267
cmdj5prqz00gxdbrdv3mbyts7	cmdj5prqy00gvdbrdxscwmm9y	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.267
cmdj5prqz00gzdbrdx4crnvaa	cmdj5prqy00gvdbrdxscwmm9y	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.268
cmdj5prr000h1dbrddr7h6rzx	cmdj5prqy00gvdbrdxscwmm9y	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.268
cmdj5prr300hcdbrdb0x8yox5	cmdj5prr200hadbrd1bekzuzp	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.271
cmdj5prr300hedbrd9dstlaag	cmdj5prr200hadbrd1bekzuzp	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.272
cmdj5prr600hpdbrdq78n998j	cmdj5prr500hndbrdryj2oafd	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.274
cmdj5prr600hrdbrd43th0mfb	cmdj5prr500hndbrdryj2oafd	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.275
cmdj5prr900i2dbrdt3z5gr47	cmdj5prr900i0dbrd0uv22cte	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.278
cmdj5prra00i4dbrdrgns6mra	cmdj5prr900i0dbrd0uv22cte	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.278
cmdj5prre00ildbrd1pj2kl0h	cmdj5prrd00ijdbrd14050j5b	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.282
cmdj5prrf00iodbrdr9h45z2d	cmdj5prre00imdbrd7xzw4z5g	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.283
cmdj5prrf00iqdbrdm4z0ga3v	cmdj5prre00imdbrd7xzw4z5g	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.284
cmdj5prrg00isdbrdwltyz6yj	cmdj5prre00imdbrd7xzw4z5g	cmdj5prli000fdbrdnl5ag8ld	\N	\N	2025-07-25 18:30:38.284
cmdj5prrg00iudbrdas29gc33	cmdj5prre00imdbrd7xzw4z5g	cmdj5prns004qdbrdv4cceey3	\N	\N	2025-07-25 18:30:38.285
cmdj5prrh00iwdbrd69hlkxcy	cmdj5prre00imdbrd7xzw4z5g	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.285
cmdj5prrh00iydbrdazb83ufw	cmdj5prre00imdbrd7xzw4z5g	cmdj5proc006tdbrdnvpp8wyt	\N	\N	2025-07-25 18:30:38.286
cmdj5prri00j1dbrddzo1d5s2	cmdj5prri00izdbrda2c994uc	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.287
cmdj5prrj00j3dbrd2i7iv5pd	cmdj5prri00izdbrda2c994uc	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.287
cmdj5prrj00j5dbrd9nzacv2q	cmdj5prri00izdbrda2c994uc	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.288
cmdj5prrk00j8dbrdxwi7svqx	cmdj5prrj00j6dbrdnx52s4qz	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.288
cmdj5prrk00jadbrdyx4rnvfd	cmdj5prrj00j6dbrdnx52s4qz	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.289
cmdj5prrl00jcdbrdq9t131dt	cmdj5prrj00j6dbrdnx52s4qz	cmdj5prli000fdbrdnl5ag8ld	\N	\N	2025-07-25 18:30:38.289
cmdj5prrl00jedbrdporuzeq2	cmdj5prrj00j6dbrdnx52s4qz	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.29
cmdj5prrp00jpdbrdvj2q106w	cmdj5prro00jndbrdg8c7os7y	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.293
cmdj5prrp00jrdbrdrxq4a2nw	cmdj5prro00jndbrdg8c7os7y	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.294
cmdj5prrv00kfdbrdxbiwio9p	cmdj5prrv00kddbrd4kk7lgwe	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.3
cmdj5prrw00khdbrdsciz2qe1	cmdj5prrv00kddbrd4kk7lgwe	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.3
cmdj5prrw00kkdbrdjryltl59	cmdj5prrv00kddbrd4kk7lgwe	cmdj5prrw00kidbrdif6j8bhl	\N	\N	2025-07-25 18:30:38.301
cmdj5prrx00kndbrdi61ega2f	cmdj5prrv00kddbrd4kk7lgwe	cmdj5prrx00kldbrdb5hehar7	\N	\N	2025-07-25 18:30:38.302
cmdj5prry00kqdbrdmcboyilv	cmdj5prrv00kddbrd4kk7lgwe	cmdj5prrx00kodbrdadxe99pa	\N	\N	2025-07-25 18:30:38.302
cmdj5prry00ksdbrdkt6d1jv0	cmdj5prrv00kddbrd4kk7lgwe	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.303
cmdj5prrz00kvdbrdkb5i2l4r	cmdj5prrz00ktdbrdxeqy8guk	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.304
cmdj5prs000kxdbrdrbvezbxf	cmdj5prrz00ktdbrdxeqy8guk	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.304
cmdj5prs100l0dbrdxnrjfbii	cmdj5prs000kydbrditpa3k3d	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.305
cmdj5prs100l2dbrdfm0lga2y	cmdj5prs000kydbrditpa3k3d	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.305
cmdj5prs200l5dbrdm1vgcnxq	cmdj5prs000kydbrditpa3k3d	cmdj5prs100l3dbrd90lm1p2t	\N	\N	2025-07-25 18:30:38.306
cmdj5prs800lsdbrdqik8xjoj	cmdj5prs700lqdbrdbif3bi5z	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.312
cmdj5prs800ludbrdyvnvqxrl	cmdj5prs700lqdbrdbif3bi5z	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.312
cmdj5prs900lxdbrdxzypcghz	cmdj5prs800lvdbrder2lqwb7	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.313
cmdj5prs900lzdbrdynhr952v	cmdj5prs800lvdbrder2lqwb7	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.314
cmdj5prsa00m2dbrdgx7ixbit	cmdj5prs900m0dbrd2x6n5k59	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.314
cmdj5prsa00m4dbrdh5mxquad	cmdj5prs900m0dbrd2x6n5k59	cmdj5prp3009hdbrdvl8bxyh0	\N	\N	2025-07-25 18:30:38.315
cmdj5prsb00m7dbrd4d37tvsl	cmdj5prsb00m5dbrdupg6ooc6	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.316
cmdj5prsc00madbrdp43r3igk	cmdj5prsc00m8dbrdhekzzjmj	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.317
cmdj5prsg00mpdbrdxishmh8m	cmdj5prsf00mndbrdn1tc6nnj	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.32
cmdj5prsg00mrdbrdy5thizhq	cmdj5prsf00mndbrdn1tc6nnj	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.321
cmdj5prsh00mudbrduov6g8wq	cmdj5prsh00msdbrd2i309hmj	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.322
cmdj5prsi00mwdbrddsapniir	cmdj5prsh00msdbrd2i309hmj	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.322
cmdj5prsi00mydbrd89jahfkd	cmdj5prsh00msdbrd2i309hmj	cmdj5prp3009hdbrdvl8bxyh0	\N	\N	2025-07-25 18:30:38.323
cmdj5prsk00n5dbrdcx6aadf5	cmdj5prsj00n3dbrdh0mwkk4e	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.324
cmdj5prsl00n8dbrd9hb70rmm	cmdj5prsj00n3dbrdh0mwkk4e	cmdj5prsk00n6dbrdilcbiait	\N	\N	2025-07-25 18:30:38.325
cmdj5prsl00nbdbrdh1env0g5	cmdj5prsl00n9dbrdo3sm626t	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.326
cmdj5prsm00nddbrdpxcg1gkc	cmdj5prsl00n9dbrdo3sm626t	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.326
cmdj5prsz00oudbrd2insyxv2	cmdj5prsy00osdbrdb7x2q5zz	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.339
cmdj5prsz00owdbrdmw20zyxz	cmdj5prsy00osdbrdb7x2q5zz	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.34
cmdj5prt000p0dbrdw8my0fd3	cmdj5prt000oydbrd00du719q	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.341
cmdj5prt100p2dbrd7g6810qu	cmdj5prt000oydbrd00du719q	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.341
cmdj5prt100p4dbrdcjjsu4b6	cmdj5prt000oydbrd00du719q	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.342
cmdj5prt200p7dbrdrpffitqi	cmdj5prt100p5dbrdq0r0p6tq	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.342
cmdj5prt200p9dbrdphj3qogy	cmdj5prt100p5dbrdq0r0p6tq	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.343
cmdj5prt300pcdbrdzs3tyw59	cmdj5prt300padbrdryed3v28	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.344
cmdj5prt400pedbrdj3dyp4q0	cmdj5prt300padbrdryed3v28	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.344
cmdj5prt400phdbrd8ubluky3	cmdj5prt400pfdbrdo4hgtoxv	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.345
cmdj5prt500pjdbrdue5vg2st	cmdj5prt400pfdbrdo4hgtoxv	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.346
cmdj5prt600pmdbrdu0bo617d	cmdj5prt500pkdbrdahezwj06	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.346
cmdj5prt600podbrdv1et9jrz	cmdj5prt500pkdbrdahezwj06	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.347
cmdj5prt700prdbrd17wrqh5o	cmdj5prt600ppdbrda5u80mtn	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.347
cmdj5prt700ptdbrddiflhitk	cmdj5prt600ppdbrda5u80mtn	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.348
cmdj5prtb00q8dbrdvdo875re	cmdj5prtb00q6dbrdwfj6udt6	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.352
cmdj5prtc00qadbrdgip7ttg9	cmdj5prtb00q6dbrdwfj6udt6	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.352
cmdj5prtc00qcdbrd78xb9b40	cmdj5prtb00q6dbrdwfj6udt6	cmdj5prli000fdbrdnl5ag8ld	\N	\N	2025-07-25 18:30:38.353
cmdj5prtd00qhdbrdiqr77egs	cmdj5prtd00qfdbrd3jx40ce7	cmdj5prnf003qdbrdn2b3rtta	\N	\N	2025-07-25 18:30:38.354
cmdj5prtg00qrdbrdt1ry7olm	cmdj5prtf00qpdbrdgluleeai	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.356
cmdj5prtg00qtdbrdr3mot84g	cmdj5prtf00qpdbrdgluleeai	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.357
cmdj5prth00qwdbrdgujngwmg	cmdj5prth00qudbrdaijthjz6	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.358
cmdj5prti00qydbrdsibinntv	cmdj5prth00qudbrdaijthjz6	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.358
cmdj5prti00r1dbrdj95sv71c	cmdj5prth00qudbrdaijthjz6	cmdj5prti00qzdbrdjdsxn22c	\N	\N	2025-07-25 18:30:38.359
cmdj5prtj00r4dbrdqr9yv4sp	cmdj5prti00r2dbrdi68oze20	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.359
cmdj5prtk00r6dbrdmkqxptm6	cmdj5prti00r2dbrdi68oze20	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.36
cmdj5prtk00r8dbrdrgdl5bhv	cmdj5prti00r2dbrdi68oze20	cmdj5prla0007dbrduibcdwqn	\N	\N	2025-07-25 18:30:38.361
cmdj5prtl00rbdbrdgxvxrmlk	cmdj5prtk00r9dbrdcprqbi8m	cmdj5pro3005udbrd32q8vew4	\N	\N	2025-07-25 18:30:38.361
cmdj5prtp00rqdbrdykwr8387	cmdj5prto00rodbrd18sft56d	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.365
cmdj5prtp00rsdbrd1brq1rep	cmdj5prto00rodbrd18sft56d	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.366
cmdj5pru000szdbrd5rccn5ff	cmdj5pru000sxdbrd9xp28xum	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.377
cmdj5pru100t1dbrdigy9b70s	cmdj5pru000sxdbrd9xp28xum	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.377
cmdj5pru400tgdbrdhh6plrwx	cmdj5pru400tedbrds3nqb0ut	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.381
cmdj5pru500tidbrdn4fk4v72	cmdj5pru400tedbrds3nqb0ut	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.381
cmdj5pru600tldbrd9ur9zdf4	cmdj5pru400tedbrds3nqb0ut	cmdj5pru500tjdbrdyvhybbgc	\N	\N	2025-07-25 18:30:38.382
cmdj5pru600todbrdklt219so	cmdj5pru400tedbrds3nqb0ut	cmdj5pru600tmdbrdde3zck71	\N	\N	2025-07-25 18:30:38.383
cmdj5pru700trdbrdnvkghmjc	cmdj5pru600tpdbrdd4v0mod4	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.383
cmdj5pru700ttdbrd5sot5mge	cmdj5pru600tpdbrdd4v0mod4	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.384
cmdj5pruk00v0dbrd6d85snnf	cmdj5pruj00uydbrdd08csdau	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.396
cmdj5pruk00v2dbrdlphcs6gg	cmdj5pruj00uydbrdd08csdau	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.396
cmdj5prul00v5dbrd8l106f3d	cmdj5pruk00v3dbrdm27t28sv	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.397
cmdj5prul00v7dbrdi1edwdpx	cmdj5pruk00v3dbrdm27t28sv	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.398
cmdj5prum00v9dbrdtvz483md	cmdj5pruk00v3dbrdm27t28sv	cmdj5prli000fdbrdnl5ag8ld	\N	\N	2025-07-25 18:30:38.398
cmdj5prum00vcdbrdo02jtk8q	cmdj5pruk00v3dbrdm27t28sv	cmdj5prum00vadbrdbhpbknwz	\N	\N	2025-07-25 18:30:38.399
cmdj5prun00vfdbrd099ll2xv	cmdj5prun00vddbrdmf73o3v2	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.4
cmdj5pruo00vhdbrdl4p8zn5g	cmdj5prun00vddbrdmf73o3v2	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.4
cmdj5pruo00vkdbrd9b8q91ea	cmdj5pruo00vidbrdqsaze9nz	cmdj5pro3005udbrd32q8vew4	\N	\N	2025-07-25 18:30:38.401
cmdj5prup00vndbrdae3dytsl	cmdj5pruo00vidbrdqsaze9nz	cmdj5prup00vldbrdoqf9cb6k	\N	\N	2025-07-25 18:30:38.401
cmdj5pruq00vqdbrd1rbu5hf0	cmdj5prup00vodbrdegxxgpwb	cmdj5prnf003qdbrdn2b3rtta	\N	\N	2025-07-25 18:30:38.402
cmdj5prv800xsdbrd14j7ymkt	cmdj5prv800xqdbrd273wn2vl	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.421
cmdj5prv900xudbrdrp0l2zwb	cmdj5prv800xqdbrd273wn2vl	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.421
cmdj5prv900xwdbrdqrkqtu53	cmdj5prv800xqdbrd273wn2vl	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.422
cmdj5prvc00y5dbrdxbb8yqud	cmdj5prvb00y3dbrdhex41ome	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.424
cmdj5prvc00y7dbrdlkyuyc3j	cmdj5prvb00y3dbrdhex41ome	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.425
cmdj5prvg00ymdbrdxjipep8x	cmdj5prvf00ykdbrd6yi9q71s	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.429
cmdj5prvh00yodbrdsk879yi9	cmdj5prvf00ykdbrd6yi9q71s	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.429
cmdj5prvi00ytdbrdtge2ddtk	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.43
cmdj5prvi00yvdbrd9pi91mnh	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.431
cmdj5prvj00yydbrd9gyakebx	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prvj00ywdbrd6kt010kl	\N	\N	2025-07-25 18:30:38.431
cmdj5prvj00z0dbrd97lt6d1m	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prmk001pdbrddbfg6jds	\N	\N	2025-07-25 18:30:38.432
cmdj5prvt0103dbrda3w32qaw	cmdj5prvt0101dbrdd41loxe9	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.442
cmdj5prvu0105dbrdpbq84hd5	cmdj5prvt0101dbrdd41loxe9	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.442
cmdj5prvw010gdbrd8qqtspo1	cmdj5prvw010edbrd66r65vra	cmdj5prp3009hdbrdvl8bxyh0	\N	\N	2025-07-25 18:30:38.445
cmdj5prvx010idbrd3nky9pwf	cmdj5prvw010edbrd66r65vra	cmdj5pro3005udbrd32q8vew4	\N	\N	2025-07-25 18:30:38.445
cmdj5prvy010ldbrdlcfnwwr5	cmdj5prvx010jdbrdqx5exaxx	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.446
cmdj5prvy010ndbrdupjqzxar	cmdj5prvx010jdbrdqx5exaxx	cmdj5prsk00n6dbrdilcbiait	\N	\N	2025-07-25 18:30:38.447
cmdj5prvz010qdbrdix225old	cmdj5prvx010jdbrdqx5exaxx	cmdj5prvz010odbrdig6i28og	\N	\N	2025-07-25 18:30:38.447
cmdj5prw0010tdbrdfesa3qux	cmdj5prvz010rdbrdvjj02045	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.448
cmdj5prw0010wdbrd72awi7za	cmdj5prvz010rdbrdvjj02045	cmdj5prw0010udbrd6vivsu58	\N	\N	2025-07-25 18:30:38.449
cmdj5prw1010zdbrdujhh9lt0	cmdj5prw0010xdbrdrw2qy2p1	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.449
cmdj5prw10111dbrd23orqesl	cmdj5prw0010xdbrdrw2qy2p1	cmdj5prl40004dbrd3ofk3man	\N	\N	2025-07-25 18:30:38.45
cmdj5prw20114dbrd7n0eltto	cmdj5prw20112dbrdisdcvjbr	cmdj5prkw0001dbrdbqiffbnc	\N	\N	2025-07-25 18:30:38.451
cmdj5prw30116dbrdf6vxfp7h	cmdj5prw20112dbrdisdcvjbr	cmdj5prp3009hdbrdvl8bxyh0	\N	\N	2025-07-25 18:30:38.451
cmdj5prw30119dbrdj4tdbxfs	cmdj5prw20112dbrdisdcvjbr	cmdj5prw30117dbrdxyowz3ew	\N	\N	2025-07-25 18:30:38.452
cmdj5prw4011cdbrdq5qnaq75	cmdj5prw20112dbrdisdcvjbr	cmdj5prw4011adbrdup99gc9i	\N	\N	2025-07-25 18:30:38.452
\.


--
-- Data for Name: PractitionerInsurance; Type: TABLE DATA; Schema: public; Owner: Nathan
--

COPY public."PractitionerInsurance" (id, "practitionerId", "insuranceId", "isPreferred", notes, "createdAt") FROM stdin;
cmdj5prm10011dbrdkfdkbg2v	cmdj5prlw000wdbrdjjx82u86	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.089
cmdj5prm40014dbrdzcmv2uwk	cmdj5prlw000wdbrdjjx82u86	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.093
cmdj5prm60017dbrdejrgmfi4	cmdj5prlw000wdbrdjjx82u86	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.095
cmdj5prm9001adbrd4u9a733d	cmdj5prlw000wdbrdjjx82u86	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.097
cmdj5prmb001ddbrdmzzc1psc	cmdj5prlw000wdbrdjjx82u86	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.099
cmdj5prmd001gdbrde59d42hh	cmdj5prlw000wdbrdjjx82u86	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.102
cmdj5prmf001jdbrd2sh9cie9	cmdj5prlw000wdbrdjjx82u86	cmdj5prme001hdbrdv9lp3cwl	f	\N	2025-07-25 18:30:38.104
cmdj5prn2002sdbrdqffjikp6	cmdj5prmz002mdbrd0nr1m469	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.127
cmdj5prn3002udbrd02e2et2x	cmdj5prmz002mdbrd0nr1m469	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.128
cmdj5prn4002wdbrdyrpvteqd	cmdj5prmz002mdbrd0nr1m469	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.129
cmdj5prn5002ydbrdbkyudf1x	cmdj5prmz002mdbrd0nr1m469	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.129
cmdj5prn60030dbrd54hglraq	cmdj5prmz002mdbrd0nr1m469	cmdj5prme001hdbrdv9lp3cwl	f	\N	2025-07-25 18:30:38.13
cmdj5prn70033dbrd62elytmg	cmdj5prmz002mdbrd0nr1m469	cmdj5prn60031dbrdzxjr6wvq	f	\N	2025-07-25 18:30:38.131
cmdj5prn80036dbrdzc9zi5wo	cmdj5prmz002mdbrd0nr1m469	cmdj5prn70034dbrdo4xganpm	f	\N	2025-07-25 18:30:38.132
cmdj5prn90039dbrdhaqef735	cmdj5prmz002mdbrd0nr1m469	cmdj5prn80037dbrd678b5yd6	f	\N	2025-07-25 18:30:38.133
cmdj5prnb003gdbrdsju43le9	cmdj5prn9003adbrdzlbco3d4	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.136
cmdj5prnx0059dbrddyhss8eu	cmdj5prnu004ydbrdbrl2m0kj	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.158
cmdj5prny005bdbrdg5xpantu	cmdj5prnu004ydbrdbrl2m0kj	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.158
cmdj5prny005ddbrd36kabv7v	cmdj5prnu004ydbrdbrl2m0kj	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.159
cmdj5prnz005fdbrdz4v9n8tk	cmdj5prnu004ydbrdbrl2m0kj	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.16
cmdj5pro0005hdbrdh4pmrlre	cmdj5prnu004ydbrdbrl2m0kj	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.16
cmdj5pro0005kdbrdpn9pf840	cmdj5prnu004ydbrdbrl2m0kj	cmdj5pro0005idbrdi33ugofw	f	\N	2025-07-25 18:30:38.161
cmdj5pro1005mdbrd8ix5lrah	cmdj5prnu004ydbrdbrl2m0kj	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.162
cmdj5pro2005pdbrd7d15obnj	cmdj5prnu004ydbrdbrl2m0kj	cmdj5pro1005ndbrdl78x4kds	f	\N	2025-07-25 18:30:38.162
cmdj5proi007fdbrdw17rp4v8	cmdj5prog0077dbrdcwluummh	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.179
cmdj5proj007hdbrd2ly3nt2h	cmdj5prog0077dbrdcwluummh	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.179
cmdj5prom007udbrd9d8iyd6b	cmdj5prol007qdbrdnn1zem98	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.183
cmdj5pron007wdbrdojoeext7	cmdj5prol007qdbrdnn1zem98	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.183
cmdj5pron007ydbrd3tfvwedf	cmdj5prol007qdbrdnn1zem98	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.184
cmdj5proo0080dbrdl139u0ap	cmdj5prol007qdbrdnn1zem98	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.184
cmdj5proo0082dbrdmd08z8mu	cmdj5prol007qdbrdnn1zem98	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.185
cmdj5prop0084dbrdlbqlhqm8	cmdj5prol007qdbrdnn1zem98	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.185
cmdj5prp4009ndbrdjrr8gxcq	cmdj5prp1009cdbrd0m46j7v9	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.201
cmdj5prp5009pdbrdj2bq563k	cmdj5prp1009cdbrd0m46j7v9	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.201
cmdj5prp5009rdbrd7um0x1or	cmdj5prp1009cdbrd0m46j7v9	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.202
cmdj5prp6009tdbrdafra2gr2	cmdj5prp1009cdbrd0m46j7v9	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.202
cmdj5prp6009vdbrdkg0kehvw	cmdj5prp1009cdbrd0m46j7v9	cmdj5pro0005idbrdi33ugofw	f	\N	2025-07-25 18:30:38.203
cmdj5prp7009xdbrdj49wd9tq	cmdj5prp1009cdbrd0m46j7v9	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.203
cmdj5prp800a0dbrd90zw0hwx	cmdj5prp1009cdbrd0m46j7v9	cmdj5prp7009ydbrd3wpaju8m	f	\N	2025-07-25 18:30:38.204
cmdj5prp800a3dbrdg6sjwagm	cmdj5prp1009cdbrd0m46j7v9	cmdj5prp800a1dbrdc2fv9ibr	f	\N	2025-07-25 18:30:38.205
cmdj5prp900a6dbrd9n394h6i	cmdj5prp1009cdbrd0m46j7v9	cmdj5prp900a4dbrd6ahgv9xd	f	\N	2025-07-25 18:30:38.205
cmdj5prpa00a9dbrd5erfivzt	cmdj5prp1009cdbrd0m46j7v9	cmdj5prp900a7dbrd4yaz5cb9	f	\N	2025-07-25 18:30:38.206
cmdj5prpb00acdbrd7oyh82ei	cmdj5prp1009cdbrd0m46j7v9	cmdj5prpb00aadbrdajnhmvth	f	\N	2025-07-25 18:30:38.207
cmdj5prpc00afdbrdf3pu7pc1	cmdj5prp1009cdbrd0m46j7v9	cmdj5prpb00addbrdwmg1u5md	f	\N	2025-07-25 18:30:38.208
cmdj5prpc00aidbrdzwp6a3fx	cmdj5prp1009cdbrd0m46j7v9	cmdj5prpc00agdbrd4kl5e13f	f	\N	2025-07-25 18:30:38.209
cmdj5prpd00aldbrd4hls20js	cmdj5prp1009cdbrd0m46j7v9	cmdj5prpd00ajdbrdrlepx276	f	\N	2025-07-25 18:30:38.21
cmdj5prpe00aodbrdp960crbz	cmdj5prp1009cdbrd0m46j7v9	cmdj5prpe00amdbrdrzn9n6qh	f	\N	2025-07-25 18:30:38.21
cmdj5prpf00ardbrd4pfbefpo	cmdj5prp1009cdbrd0m46j7v9	cmdj5prpe00apdbrdsrzmemme	f	\N	2025-07-25 18:30:38.211
cmdj5prpf00audbrdcsbwqtx1	cmdj5prp1009cdbrd0m46j7v9	cmdj5prpf00asdbrd0l2mlf30	f	\N	2025-07-25 18:30:38.212
cmdj5prpg00axdbrdz97aw1md	cmdj5prp1009cdbrd0m46j7v9	cmdj5prpg00avdbrdw7gzorkv	f	\N	2025-07-25 18:30:38.213
cmdj5prpk00b9dbrdx6rmpf1j	cmdj5prpi00b3dbrd9l6hc9a3	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.216
cmdj5prpk00bbdbrd8p62g6y3	cmdj5prpi00b3dbrd9l6hc9a3	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.217
cmdj5prpl00bddbrdwbdggd4b	cmdj5prpi00b3dbrd9l6hc9a3	cmdj5prpb00aadbrdajnhmvth	f	\N	2025-07-25 18:30:38.217
cmdj5prpt00cbdbrde9rbkd70	cmdj5prps00c7dbrdrpkw8hf2	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.226
cmdj5prpu00cedbrd8ew977t7	cmdj5prps00c7dbrdrpkw8hf2	cmdj5prpt00ccdbrd79cbeyq6	f	\N	2025-07-25 18:30:38.226
cmdj5prpy00cudbrd2f2ex70a	cmdj5prpw00cmdbrdni81pdd6	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.231
cmdj5prpz00cwdbrda2lo3t5v	cmdj5prpw00cmdbrdni81pdd6	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.231
cmdj5prpz00cydbrd1tz6jxs0	cmdj5prpw00cmdbrdni81pdd6	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.232
cmdj5prq000d0dbrdtpmkvmwt	cmdj5prpw00cmdbrdni81pdd6	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.232
cmdj5prq000d2dbrdcmy20lx6	cmdj5prpw00cmdbrdni81pdd6	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.233
cmdj5prq100d4dbrdjvfos6el	cmdj5prpw00cmdbrdni81pdd6	cmdj5pro0005idbrdi33ugofw	f	\N	2025-07-25 18:30:38.233
cmdj5prq100d7dbrdhyhmeui2	cmdj5prpw00cmdbrdni81pdd6	cmdj5prq100d5dbrd8teyp0de	f	\N	2025-07-25 18:30:38.234
cmdj5prq200d9dbrd9wcjdp97	cmdj5prpw00cmdbrdni81pdd6	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.234
cmdj5prq200dbdbrd7p96tldi	cmdj5prpw00cmdbrdni81pdd6	cmdj5prp7009ydbrd3wpaju8m	f	\N	2025-07-25 18:30:38.235
cmdj5prq300dddbrdpz71qrpz	cmdj5prpw00cmdbrdni81pdd6	cmdj5prp800a1dbrdc2fv9ibr	f	\N	2025-07-25 18:30:38.235
cmdj5prq300dfdbrdc98vxuln	cmdj5prpw00cmdbrdni81pdd6	cmdj5prp900a4dbrd6ahgv9xd	f	\N	2025-07-25 18:30:38.236
cmdj5prq400dhdbrdio672mtd	cmdj5prpw00cmdbrdni81pdd6	cmdj5prp900a7dbrd4yaz5cb9	f	\N	2025-07-25 18:30:38.236
cmdj5prq500dkdbrdka2hjdcv	cmdj5prpw00cmdbrdni81pdd6	cmdj5prq400didbrdgr8vdxeb	f	\N	2025-07-25 18:30:38.237
cmdj5prq500dmdbrd6skm7n0n	cmdj5prpw00cmdbrdni81pdd6	cmdj5pro1005ndbrdl78x4kds	f	\N	2025-07-25 18:30:38.238
cmdj5prq600dodbrd3q3lnlc2	cmdj5prpw00cmdbrdni81pdd6	cmdj5prn60031dbrdzxjr6wvq	f	\N	2025-07-25 18:30:38.238
cmdj5prq600dqdbrd22vvc2ei	cmdj5prpw00cmdbrdni81pdd6	cmdj5prpb00addbrdwmg1u5md	f	\N	2025-07-25 18:30:38.239
cmdj5prq700dsdbrdb8k07kg3	cmdj5prpw00cmdbrdni81pdd6	cmdj5prpc00agdbrd4kl5e13f	f	\N	2025-07-25 18:30:38.239
cmdj5prq700dudbrd0t012gz7	cmdj5prpw00cmdbrdni81pdd6	cmdj5prpd00ajdbrdrlepx276	f	\N	2025-07-25 18:30:38.24
cmdj5prq800dwdbrd75xkslus	cmdj5prpw00cmdbrdni81pdd6	cmdj5prpe00amdbrdrzn9n6qh	f	\N	2025-07-25 18:30:38.24
cmdj5prq800dzdbrdi3t82wus	cmdj5prpw00cmdbrdni81pdd6	cmdj5prq800dxdbrdphuiqgmz	f	\N	2025-07-25 18:30:38.241
cmdj5prq900e2dbrdnym55ihr	cmdj5prpw00cmdbrdni81pdd6	cmdj5prq900e0dbrdmnk1vfd1	f	\N	2025-07-25 18:30:38.242
cmdj5prqa00e4dbrdiqoht9nd	cmdj5prpw00cmdbrdni81pdd6	cmdj5prpf00asdbrd0l2mlf30	f	\N	2025-07-25 18:30:38.242
cmdj5prqa00e7dbrdhksm18h8	cmdj5prpw00cmdbrdni81pdd6	cmdj5prqa00e5dbrd4dqc3lws	f	\N	2025-07-25 18:30:38.243
cmdj5prqb00eadbrd93y6wakc	cmdj5prpw00cmdbrdni81pdd6	cmdj5prqb00e8dbrdanwlo08d	f	\N	2025-07-25 18:30:38.243
cmdj5prqc00ecdbrdyen4kkaw	cmdj5prpw00cmdbrdni81pdd6	cmdj5prpg00avdbrdw7gzorkv	f	\N	2025-07-25 18:30:38.244
cmdj5prqc00eedbrdctftqquk	cmdj5prpw00cmdbrdni81pdd6	cmdj5prpt00ccdbrd79cbeyq6	f	\N	2025-07-25 18:30:38.245
cmdj5prqe00eldbrdxogqxu6w	cmdj5prqc00efdbrdzzu9zbsh	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.246
cmdj5prqe00endbrds3lmk5fs	cmdj5prqc00efdbrdzzu9zbsh	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.247
cmdj5prqf00epdbrdqfr6g21r	cmdj5prqc00efdbrdzzu9zbsh	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.247
cmdj5prqf00erdbrdli06ycwa	cmdj5prqc00efdbrdzzu9zbsh	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.248
cmdj5prqj00f5dbrd7zpwzvjk	cmdj5prqh00ezdbrda3qxe36w	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.251
cmdj5prqj00f7dbrdwonum1ts	cmdj5prqh00ezdbrda3qxe36w	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.252
cmdj5prqk00f9dbrd4f9k3ozc	cmdj5prqh00ezdbrda3qxe36w	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.252
cmdj5prqk00fbdbrd6ypc0irf	cmdj5prqh00ezdbrda3qxe36w	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.253
cmdj5prqn00fndbrd33ad6dzi	cmdj5prqm00fhdbrddqqvpo5y	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.256
cmdj5prqo00fpdbrdd553lgzu	cmdj5prqm00fhdbrddqqvpo5y	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.256
cmdj5prqo00frdbrd3rmfn3sj	cmdj5prqm00fhdbrddqqvpo5y	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.257
cmdj5prqp00ftdbrdm4e5cyrr	cmdj5prqm00fhdbrddqqvpo5y	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.257
cmdj5prqr00g0dbrdahpwa4yr	cmdj5prqp00fudbrdkuik0pds	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.259
cmdj5prqr00g2dbrdkhzn0309	cmdj5prqp00fudbrdkuik0pds	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.26
cmdj5prqs00g4dbrdndzy38pj	cmdj5prqp00fudbrdkuik0pds	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.26
cmdj5prqs00g6dbrdd5677ftd	cmdj5prqp00fudbrdkuik0pds	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.261
cmdj5prqu00gddbrdmthv3ag3	cmdj5prqt00g7dbrdmxgsvgxr	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.263
cmdj5prqv00gfdbrdm05nn6pu	cmdj5prqt00g7dbrdmxgsvgxr	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.263
cmdj5prqv00ghdbrd7wegy5b8	cmdj5prqt00g7dbrdmxgsvgxr	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.264
cmdj5prqw00gjdbrd5h7lxmjl	cmdj5prqt00g7dbrdmxgsvgxr	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.264
cmdj5prqw00gldbrdtkobkaqm	cmdj5prqt00g7dbrdmxgsvgxr	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.265
cmdj5prqx00gndbrdcoepygij	cmdj5prqt00g7dbrdmxgsvgxr	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.265
cmdj5prr000h3dbrd39pibqn6	cmdj5prqy00gvdbrdxscwmm9y	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.269
cmdj5prr100h5dbrdil8krxs7	cmdj5prqy00gvdbrdxscwmm9y	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.269
cmdj5prr100h7dbrd9scu84vy	cmdj5prqy00gvdbrdxscwmm9y	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.27
cmdj5prr200h9dbrdufnup23l	cmdj5prqy00gvdbrdxscwmm9y	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.27
cmdj5prr400hgdbrd6fy66mzh	cmdj5prr200hadbrd1bekzuzp	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.272
cmdj5prr400hidbrdorh2nfbc	cmdj5prr200hadbrd1bekzuzp	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.273
cmdj5prr500hkdbrdpjbr7a2y	cmdj5prr200hadbrd1bekzuzp	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.273
cmdj5prr500hmdbrdf89oive8	cmdj5prr200hadbrd1bekzuzp	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.274
cmdj5prr700htdbrd6owin91h	cmdj5prr500hndbrdryj2oafd	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.275
cmdj5prr700hvdbrd99i4nj75	cmdj5prr500hndbrdryj2oafd	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.276
cmdj5prr800hxdbrdhx4e0j1c	cmdj5prr500hndbrdryj2oafd	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.276
cmdj5prr800hzdbrd5t7y00so	cmdj5prr500hndbrdryj2oafd	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.277
cmdj5prra00i6dbrdvaq7z2kj	cmdj5prr900i0dbrd0uv22cte	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.279
cmdj5prrb00i8dbrd44bu15eo	cmdj5prr900i0dbrd0uv22cte	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.279
cmdj5prrb00iadbrd2akc5by0	cmdj5prr900i0dbrd0uv22cte	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.28
cmdj5prrc00icdbrdqklte7ql	cmdj5prr900i0dbrd0uv22cte	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.28
cmdj5prrc00iedbrd2jwxqica	cmdj5prr900i0dbrd0uv22cte	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.281
cmdj5prrd00igdbrdr5qvos8u	cmdj5prr900i0dbrd0uv22cte	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.281
cmdj5prrd00iidbrdtzt5to9n	cmdj5prr900i0dbrd0uv22cte	cmdj5prme001hdbrdv9lp3cwl	f	\N	2025-07-25 18:30:38.282
cmdj5prrm00jgdbrdcyks104a	cmdj5prrj00j6dbrdnx52s4qz	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.29
cmdj5prrm00jidbrd51sdzkpj	cmdj5prrj00j6dbrdnx52s4qz	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.291
cmdj5prrn00jkdbrdedz7utjf	cmdj5prrj00j6dbrdnx52s4qz	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.291
cmdj5prrn00jmdbrd38duuetg	cmdj5prrj00j6dbrdnx52s4qz	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.292
cmdj5prrq00jtdbrd1kpukgtt	cmdj5prro00jndbrdg8c7os7y	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.294
cmdj5prrq00jvdbrdmaqtdlm8	cmdj5prro00jndbrdg8c7os7y	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.295
cmdj5prrr00jxdbrdoyeiprh0	cmdj5prro00jndbrdg8c7os7y	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.295
cmdj5prrr00jzdbrdc0qjwe5r	cmdj5prro00jndbrdg8c7os7y	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.296
cmdj5prrs00k1dbrdu1tyn242	cmdj5prro00jndbrdg8c7os7y	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.296
cmdj5prrs00k3dbrdsghuvsg8	cmdj5prro00jndbrdg8c7os7y	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.297
cmdj5prrt00k5dbrd0p0jc4v6	cmdj5prro00jndbrdg8c7os7y	cmdj5prme001hdbrdv9lp3cwl	f	\N	2025-07-25 18:30:38.297
cmdj5prrt00k7dbrd7vb6t248	cmdj5prro00jndbrdg8c7os7y	cmdj5prqb00e8dbrdanwlo08d	f	\N	2025-07-25 18:30:38.298
cmdj5prru00k9dbrdtrg1ejlk	cmdj5prro00jndbrdg8c7os7y	cmdj5prpt00ccdbrd79cbeyq6	f	\N	2025-07-25 18:30:38.298
cmdj5prru00kcdbrdxgzqys7c	cmdj5prro00jndbrdg8c7os7y	cmdj5prru00kadbrdexzu65yh	f	\N	2025-07-25 18:30:38.299
cmdj5prs200l7dbrd9maezv9z	cmdj5prs000kydbrditpa3k3d	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.307
cmdj5prs300l9dbrdeweqk9qh	cmdj5prs000kydbrditpa3k3d	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.307
cmdj5prs300lbdbrde6a1506b	cmdj5prs000kydbrditpa3k3d	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.308
cmdj5prs400lddbrdatkw72cr	cmdj5prs000kydbrditpa3k3d	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.308
cmdj5prs400lfdbrdw83dlv9j	cmdj5prs000kydbrditpa3k3d	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.309
cmdj5prs500lhdbrdxggvzedr	cmdj5prs000kydbrditpa3k3d	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.309
cmdj5prs500ljdbrdcmkkcrly	cmdj5prs000kydbrditpa3k3d	cmdj5prme001hdbrdv9lp3cwl	f	\N	2025-07-25 18:30:38.31
cmdj5prs600lldbrd84imlhaa	cmdj5prs000kydbrditpa3k3d	cmdj5prqb00e8dbrdanwlo08d	f	\N	2025-07-25 18:30:38.31
cmdj5prs600lndbrdmqmcs8t6	cmdj5prs000kydbrditpa3k3d	cmdj5prpt00ccdbrd79cbeyq6	f	\N	2025-07-25 18:30:38.311
cmdj5prs700lpdbrdd2ry0bko	cmdj5prs000kydbrditpa3k3d	cmdj5prru00kadbrdexzu65yh	f	\N	2025-07-25 18:30:38.311
cmdj5prsd00mcdbrd6lpbqfi3	cmdj5prsc00m8dbrdhekzzjmj	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.317
cmdj5prsd00medbrdoox1m455	cmdj5prsc00m8dbrdhekzzjmj	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.318
cmdj5prse00mgdbrd3mglq8yu	cmdj5prsc00m8dbrdhekzzjmj	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.318
cmdj5prse00midbrdxosdcicg	cmdj5prsc00m8dbrdhekzzjmj	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.319
cmdj5prsf00mkdbrd5ffolafw	cmdj5prsc00m8dbrdhekzzjmj	cmdj5prpe00amdbrdrzn9n6qh	f	\N	2025-07-25 18:30:38.319
cmdj5prsf00mmdbrdkeb003mh	cmdj5prsc00m8dbrdhekzzjmj	cmdj5prpg00avdbrdw7gzorkv	f	\N	2025-07-25 18:30:38.32
cmdj5prsj00n0dbrd2oipe29x	cmdj5prsh00msdbrd2i309hmj	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.323
cmdj5prsj00n2dbrdqv4vfnxb	cmdj5prsh00msdbrd2i309hmj	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.324
cmdj5prsm00nfdbrdk3zjxqwz	cmdj5prsl00n9dbrdo3sm626t	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.327
cmdj5prsn00nhdbrd6zef2lcg	cmdj5prsl00n9dbrdo3sm626t	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.327
cmdj5prsn00njdbrdb2x51yjq	cmdj5prsl00n9dbrdo3sm626t	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.328
cmdj5prso00nldbrduep7f4w4	cmdj5prsl00n9dbrdo3sm626t	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.328
cmdj5prso00nndbrdoo4rgwnh	cmdj5prsl00n9dbrdo3sm626t	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.329
cmdj5prsp00nqdbrd2ruglbuc	cmdj5prsl00n9dbrdo3sm626t	cmdj5prsp00nodbrd0nuef94z	f	\N	2025-07-25 18:30:38.33
cmdj5prsq00nsdbrd0bijbsdk	cmdj5prsl00n9dbrdo3sm626t	cmdj5pro0005idbrdi33ugofw	f	\N	2025-07-25 18:30:38.33
cmdj5prsq00nudbrd1pvxwdkn	cmdj5prsl00n9dbrdo3sm626t	cmdj5prq100d5dbrd8teyp0de	f	\N	2025-07-25 18:30:38.331
cmdj5prsr00nwdbrda56alghj	cmdj5prsl00n9dbrdo3sm626t	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.331
cmdj5prsr00nydbrd6e255by2	cmdj5prsl00n9dbrdo3sm626t	cmdj5prp7009ydbrd3wpaju8m	f	\N	2025-07-25 18:30:38.332
cmdj5prss00o0dbrdrsx3fn7u	cmdj5prsl00n9dbrdo3sm626t	cmdj5prp800a1dbrdc2fv9ibr	f	\N	2025-07-25 18:30:38.332
cmdj5prss00o2dbrdlc82gk53	cmdj5prsl00n9dbrdo3sm626t	cmdj5prp900a4dbrd6ahgv9xd	f	\N	2025-07-25 18:30:38.333
cmdj5prst00o4dbrdxkzz6pm0	cmdj5prsl00n9dbrdo3sm626t	cmdj5prp900a7dbrd4yaz5cb9	f	\N	2025-07-25 18:30:38.333
cmdj5prst00o7dbrdvkc7vddd	cmdj5prsl00n9dbrdo3sm626t	cmdj5prst00o5dbrd55n4g2zw	f	\N	2025-07-25 18:30:38.334
cmdj5prsu00o9dbrdpggqiuac	cmdj5prsl00n9dbrdo3sm626t	cmdj5pro1005ndbrdl78x4kds	f	\N	2025-07-25 18:30:38.334
cmdj5prsu00obdbrdbqej4lrb	cmdj5prsl00n9dbrdo3sm626t	cmdj5prn60031dbrdzxjr6wvq	f	\N	2025-07-25 18:30:38.335
cmdj5prsv00oddbrdebu1krrq	cmdj5prsl00n9dbrdo3sm626t	cmdj5prpb00aadbrdajnhmvth	f	\N	2025-07-25 18:30:38.335
cmdj5prsv00ofdbrdct4663ye	cmdj5prsl00n9dbrdo3sm626t	cmdj5prpb00addbrdwmg1u5md	f	\N	2025-07-25 18:30:38.336
cmdj5prsw00ohdbrd4xjbmyyf	cmdj5prsl00n9dbrdo3sm626t	cmdj5prq800dxdbrdphuiqgmz	f	\N	2025-07-25 18:30:38.336
cmdj5prsw00okdbrdjnjh63de	cmdj5prsl00n9dbrdo3sm626t	cmdj5prsw00oidbrd4999vyjt	f	\N	2025-07-25 18:30:38.337
cmdj5prsx00ondbrd05lws0dq	cmdj5prsl00n9dbrdo3sm626t	cmdj5prsx00oldbrdhzqk9buj	f	\N	2025-07-25 18:30:38.338
cmdj5prsy00opdbrd7jsdknle	cmdj5prsl00n9dbrdo3sm626t	cmdj5prqb00e8dbrdanwlo08d	f	\N	2025-07-25 18:30:38.338
cmdj5prsy00ordbrdll3nwvak	cmdj5prsl00n9dbrdo3sm626t	cmdj5prpg00avdbrdw7gzorkv	f	\N	2025-07-25 18:30:38.339
cmdj5prt800pvdbrd27ecd9jy	cmdj5prt600ppdbrda5u80mtn	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.348
cmdj5prt800pxdbrdm0kxbqmj	cmdj5prt600ppdbrda5u80mtn	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.349
cmdj5prt900pzdbrdla4sefog	cmdj5prt600ppdbrda5u80mtn	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.349
cmdj5prt900q1dbrdqdx0lz8f	cmdj5prt600ppdbrda5u80mtn	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.35
cmdj5prta00q3dbrd3f94x2a1	cmdj5prt600ppdbrda5u80mtn	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.35
cmdj5prta00q5dbrd0xi0gbuh	cmdj5prt600ppdbrda5u80mtn	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.351
cmdj5prtd00qedbrdxbe40gf7	cmdj5prtb00q6dbrdwfj6udt6	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.353
cmdj5prte00qkdbrdj21osj0t	cmdj5prte00qidbrdppaeo1p8	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.355
cmdj5prtf00qmdbrd2ojihnwc	cmdj5prte00qidbrdppaeo1p8	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.355
cmdj5prtf00qodbrdkpyylg1u	cmdj5prte00qidbrdppaeo1p8	cmdj5prpb00aadbrdajnhmvth	f	\N	2025-07-25 18:30:38.356
cmdj5prtl00rddbrdwpjjanq0	cmdj5prtk00r9dbrdcprqbi8m	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.362
cmdj5prtm00rfdbrd3bge2tz3	cmdj5prtk00r9dbrdcprqbi8m	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.362
cmdj5prtm00rhdbrdvgc4b9z2	cmdj5prtk00r9dbrdcprqbi8m	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.363
cmdj5prtn00rjdbrdshgzpmqt	cmdj5prtk00r9dbrdcprqbi8m	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.363
cmdj5prtn00rldbrdqmfs41rv	cmdj5prtk00r9dbrdcprqbi8m	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.364
cmdj5prto00rndbrdl3fsanb2	cmdj5prtk00r9dbrdcprqbi8m	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.364
cmdj5prtq00rudbrdvkm4llbg	cmdj5prto00rodbrd18sft56d	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.366
cmdj5prtq00rwdbrdnc9nlxs1	cmdj5prto00rodbrd18sft56d	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.367
cmdj5prtr00rydbrdnohw17d1	cmdj5prto00rodbrd18sft56d	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.367
cmdj5prtr00s0dbrdoh8eytw7	cmdj5prto00rodbrd18sft56d	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.368
cmdj5prts00s2dbrdjrgcog91	cmdj5prto00rodbrd18sft56d	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.368
cmdj5prts00s4dbrdej9dp6b5	cmdj5prto00rodbrd18sft56d	cmdj5prsp00nodbrd0nuef94z	f	\N	2025-07-25 18:30:38.369
cmdj5prtt00s6dbrd95qi6jao	cmdj5prto00rodbrd18sft56d	cmdj5pro0005idbrdi33ugofw	f	\N	2025-07-25 18:30:38.369
cmdj5prtt00s8dbrd3ic68l2v	cmdj5prto00rodbrd18sft56d	cmdj5prq100d5dbrd8teyp0de	f	\N	2025-07-25 18:30:38.37
cmdj5prtu00sadbrdcwvbvmud	cmdj5prto00rodbrd18sft56d	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.37
cmdj5prtu00scdbrdwsgnxciq	cmdj5prto00rodbrd18sft56d	cmdj5prp7009ydbrd3wpaju8m	f	\N	2025-07-25 18:30:38.371
cmdj5prtv00sedbrdttwkehav	cmdj5prto00rodbrd18sft56d	cmdj5prme001hdbrdv9lp3cwl	f	\N	2025-07-25 18:30:38.371
cmdj5prtv00sgdbrduglworhr	cmdj5prto00rodbrd18sft56d	cmdj5prp800a1dbrdc2fv9ibr	f	\N	2025-07-25 18:30:38.372
cmdj5prtw00sidbrdw0pajlp1	cmdj5prto00rodbrd18sft56d	cmdj5prp900a4dbrd6ahgv9xd	f	\N	2025-07-25 18:30:38.372
cmdj5prtw00skdbrd14kao0fl	cmdj5prto00rodbrd18sft56d	cmdj5prst00o5dbrd55n4g2zw	f	\N	2025-07-25 18:30:38.373
cmdj5prtx00smdbrdkalmu84v	cmdj5prto00rodbrd18sft56d	cmdj5pro1005ndbrdl78x4kds	f	\N	2025-07-25 18:30:38.373
cmdj5prtx00sodbrdg4hhb7au	cmdj5prto00rodbrd18sft56d	cmdj5prpc00agdbrd4kl5e13f	f	\N	2025-07-25 18:30:38.374
cmdj5prty00sqdbrdoc14czs5	cmdj5prto00rodbrd18sft56d	cmdj5prq800dxdbrdphuiqgmz	f	\N	2025-07-25 18:30:38.374
cmdj5prty00ssdbrdmmp0cqme	cmdj5prto00rodbrd18sft56d	cmdj5prsw00oidbrd4999vyjt	f	\N	2025-07-25 18:30:38.375
cmdj5prtz00sudbrdfr4z3snz	cmdj5prto00rodbrd18sft56d	cmdj5prqb00e8dbrdanwlo08d	f	\N	2025-07-25 18:30:38.375
cmdj5prtz00swdbrdj75c7jsd	cmdj5prto00rodbrd18sft56d	cmdj5prpg00avdbrdw7gzorkv	f	\N	2025-07-25 18:30:38.376
cmdj5pru100t3dbrdmjpd4i6l	cmdj5pru000sxdbrd9xp28xum	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.378
cmdj5pru200t5dbrdaihdsn7j	cmdj5pru000sxdbrd9xp28xum	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.378
cmdj5pru200t7dbrdkr67quzp	cmdj5pru000sxdbrd9xp28xum	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.379
cmdj5pru300t9dbrdiy2458v2	cmdj5pru000sxdbrd9xp28xum	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.379
cmdj5pru300tbdbrdq2w6fm6l	cmdj5pru000sxdbrd9xp28xum	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.38
cmdj5pru400tddbrdko2wesrl	cmdj5pru000sxdbrd9xp28xum	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.38
cmdj5pru800tvdbrdha9699ot	cmdj5pru600tpdbrdd4v0mod4	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.384
cmdj5pru800txdbrdgj1mrpcf	cmdj5pru600tpdbrdd4v0mod4	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.385
cmdj5pru900tzdbrdrr3ark0u	cmdj5pru600tpdbrdd4v0mod4	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.385
cmdj5pru900u1dbrdvqmx3eml	cmdj5pru600tpdbrdd4v0mod4	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.386
cmdj5prua00u3dbrddny91mz1	cmdj5pru600tpdbrdd4v0mod4	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.386
cmdj5prua00u5dbrd85gluskb	cmdj5pru600tpdbrdd4v0mod4	cmdj5prsp00nodbrd0nuef94z	f	\N	2025-07-25 18:30:38.387
cmdj5prub00u7dbrdwgmispqx	cmdj5pru600tpdbrdd4v0mod4	cmdj5pro0005idbrdi33ugofw	f	\N	2025-07-25 18:30:38.387
cmdj5prub00u9dbrdz9fg7w8a	cmdj5pru600tpdbrdd4v0mod4	cmdj5prq100d5dbrd8teyp0de	f	\N	2025-07-25 18:30:38.388
cmdj5pruc00ubdbrd8p7om5ef	cmdj5pru600tpdbrdd4v0mod4	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.388
cmdj5pruc00uddbrdfzp3s9xp	cmdj5pru600tpdbrdd4v0mod4	cmdj5prp7009ydbrd3wpaju8m	f	\N	2025-07-25 18:30:38.389
cmdj5prud00ufdbrdgpl90y3h	cmdj5pru600tpdbrdd4v0mod4	cmdj5prme001hdbrdv9lp3cwl	f	\N	2025-07-25 18:30:38.39
cmdj5prue00uhdbrdnq2792kz	cmdj5pru600tpdbrdd4v0mod4	cmdj5prp800a1dbrdc2fv9ibr	f	\N	2025-07-25 18:30:38.39
cmdj5pruf00ujdbrdplr0xnoy	cmdj5pru600tpdbrdd4v0mod4	cmdj5prp900a4dbrd6ahgv9xd	f	\N	2025-07-25 18:30:38.392
cmdj5prug00uldbrdczhz610s	cmdj5pru600tpdbrdd4v0mod4	cmdj5prst00o5dbrd55n4g2zw	f	\N	2025-07-25 18:30:38.392
cmdj5prug00undbrdtxmt4hrk	cmdj5pru600tpdbrdd4v0mod4	cmdj5pro1005ndbrdl78x4kds	f	\N	2025-07-25 18:30:38.393
cmdj5pruh00updbrdsoa1s6l2	cmdj5pru600tpdbrdd4v0mod4	cmdj5prpc00agdbrd4kl5e13f	f	\N	2025-07-25 18:30:38.393
cmdj5pruh00urdbrd2sdrhmrw	cmdj5pru600tpdbrdd4v0mod4	cmdj5prq800dxdbrdphuiqgmz	f	\N	2025-07-25 18:30:38.394
cmdj5prui00utdbrd4fin3k12	cmdj5pru600tpdbrdd4v0mod4	cmdj5prsw00oidbrd4999vyjt	f	\N	2025-07-25 18:30:38.394
cmdj5prui00uvdbrdgfyrsj83	cmdj5pru600tpdbrdd4v0mod4	cmdj5prqb00e8dbrdanwlo08d	f	\N	2025-07-25 18:30:38.395
cmdj5pruj00uxdbrddo1gppm3	cmdj5pru600tpdbrdd4v0mod4	cmdj5prpg00avdbrdw7gzorkv	f	\N	2025-07-25 18:30:38.395
cmdj5pruq00vsdbrdcgqoxaq4	cmdj5prup00vodbrdegxxgpwb	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.403
cmdj5prur00vudbrd5d1mtfma	cmdj5prup00vodbrdegxxgpwb	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.403
cmdj5prur00vwdbrdqszaq1q9	cmdj5prup00vodbrdegxxgpwb	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.404
cmdj5prus00vydbrdhrvuzika	cmdj5prup00vodbrdegxxgpwb	cmdj5prq100d5dbrd8teyp0de	f	\N	2025-07-25 18:30:38.404
cmdj5prus00w0dbrd26s6bpyc	cmdj5prup00vodbrdegxxgpwb	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.405
cmdj5prut00w2dbrdjb72xbod	cmdj5prup00vodbrdegxxgpwb	cmdj5prme001hdbrdv9lp3cwl	f	\N	2025-07-25 18:30:38.405
cmdj5prut00w4dbrdgl1j37y9	cmdj5prup00vodbrdegxxgpwb	cmdj5prp900a4dbrd6ahgv9xd	f	\N	2025-07-25 18:30:38.406
cmdj5pruu00w6dbrd04ky5a47	cmdj5prup00vodbrdegxxgpwb	cmdj5prpg00avdbrdw7gzorkv	f	\N	2025-07-25 18:30:38.406
cmdj5pruu00w8dbrdhn4ctchq	cmdj5prup00vodbrdegxxgpwb	cmdj5prru00kadbrdexzu65yh	f	\N	2025-07-25 18:30:38.407
cmdj5pruv00wbdbrd9vhtnr8q	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.407
cmdj5pruv00wddbrd73mja2nb	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.408
cmdj5pruw00wfdbrdp6fxc1a1	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.408
cmdj5pruw00whdbrd1yi88bf0	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.409
cmdj5prux00wjdbrdjdt5ltdg	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.409
cmdj5prux00wldbrdl9y6k07s	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5pro0005idbrdi33ugofw	f	\N	2025-07-25 18:30:38.41
cmdj5pruy00wndbrd2rsnvlei	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prq100d5dbrd8teyp0de	f	\N	2025-07-25 18:30:38.411
cmdj5pruz00wpdbrd7ark0at4	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.411
cmdj5pruz00wrdbrdesh1pkil	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prp7009ydbrd3wpaju8m	f	\N	2025-07-25 18:30:38.412
cmdj5prv000wtdbrdrsvxw89f	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prp800a1dbrdc2fv9ibr	f	\N	2025-07-25 18:30:38.412
cmdj5prv000wvdbrd6l5wbrve	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prp900a4dbrd6ahgv9xd	f	\N	2025-07-25 18:30:38.413
cmdj5prv100wxdbrdacsdpd60	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prp900a7dbrd4yaz5cb9	f	\N	2025-07-25 18:30:38.413
cmdj5prv100wzdbrd3k5cj2jd	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prq400didbrdgr8vdxeb	f	\N	2025-07-25 18:30:38.414
cmdj5prv200x1dbrdouhlpb4w	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5pro1005ndbrdl78x4kds	f	\N	2025-07-25 18:30:38.414
cmdj5prv200x3dbrdafq5g809	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prn60031dbrdzxjr6wvq	f	\N	2025-07-25 18:30:38.415
cmdj5prv300x5dbrdwztkam4c	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prpb00addbrdwmg1u5md	f	\N	2025-07-25 18:30:38.415
cmdj5prv300x7dbrdqn8rcu9z	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prpc00agdbrd4kl5e13f	f	\N	2025-07-25 18:30:38.416
cmdj5prv400x9dbrda1wnk53e	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prpd00ajdbrdrlepx276	f	\N	2025-07-25 18:30:38.416
cmdj5prv400xbdbrd2b6c80aa	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prpe00amdbrdrzn9n6qh	f	\N	2025-07-25 18:30:38.417
cmdj5prv500xddbrd4cs9avit	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prq800dxdbrdphuiqgmz	f	\N	2025-07-25 18:30:38.417
cmdj5prv500xfdbrdh7z6by4g	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prq900e0dbrdmnk1vfd1	f	\N	2025-07-25 18:30:38.418
cmdj5prv600xhdbrdf5tx12f2	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prpf00asdbrd0l2mlf30	f	\N	2025-07-25 18:30:38.418
cmdj5prv600xjdbrdu06rtkpp	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prqa00e5dbrd4dqc3lws	f	\N	2025-07-25 18:30:38.418
cmdj5prv700xldbrdq9hdmai6	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prqb00e8dbrdanwlo08d	f	\N	2025-07-25 18:30:38.419
cmdj5prv700xndbrdoq4rkkz0	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prpg00avdbrdw7gzorkv	f	\N	2025-07-25 18:30:38.419
cmdj5prv800xpdbrd7bo0vat8	cmdj5pruu00w9dbrd6b4ebz9s	cmdj5prpt00ccdbrd79cbeyq6	f	\N	2025-07-25 18:30:38.42
cmdj5prva00xydbrdmischz06	cmdj5prv800xqdbrd273wn2vl	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.422
cmdj5prva00y0dbrdhenndaky	cmdj5prv800xqdbrd273wn2vl	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.423
cmdj5prvb00y2dbrdy0sfabg0	cmdj5prv800xqdbrd273wn2vl	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.423
cmdj5prvd00y9dbrdnpv4k8oz	cmdj5prvb00y3dbrdhex41ome	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.425
cmdj5prvd00ybdbrdr80gauql	cmdj5prvb00y3dbrdhex41ome	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.426
cmdj5prve00yddbrdux37f049	cmdj5prvb00y3dbrdhex41ome	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.426
cmdj5prve00yfdbrd2ujhxej0	cmdj5prvb00y3dbrdhex41ome	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.427
cmdj5prvf00yhdbrdeu7ybkjh	cmdj5prvb00y3dbrdhex41ome	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.427
cmdj5prvf00yjdbrdb6lirxwn	cmdj5prvb00y3dbrdhex41ome	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.428
cmdj5prvh00yqdbrd1qchlkr8	cmdj5prvf00ykdbrd6yi9q71s	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.43
cmdj5prvk00z2dbrderu7cs15	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.432
cmdj5prvk00z4dbrdbqvzo1hw	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.433
cmdj5prvl00z6dbrdylp9ntkm	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.433
cmdj5prvl00z8dbrdywomou0b	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.434
cmdj5prvm00zadbrdiraj9k0t	cmdj5prvh00yrdbrd5jh33gq1	cmdj5pro0005idbrdi33ugofw	f	\N	2025-07-25 18:30:38.434
cmdj5prvm00zcdbrdksie3sy7	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.435
cmdj5prvn00zedbrd5bzjds9o	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prp7009ydbrd3wpaju8m	f	\N	2025-07-25 18:30:38.435
cmdj5prvn00zgdbrdng4eil0e	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prp800a1dbrdc2fv9ibr	f	\N	2025-07-25 18:30:38.436
cmdj5prvo00zidbrdwzmx0jf1	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prp900a4dbrd6ahgv9xd	f	\N	2025-07-25 18:30:38.436
cmdj5prvo00zkdbrdidawdc0s	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prp900a7dbrd4yaz5cb9	f	\N	2025-07-25 18:30:38.437
cmdj5prvp00zmdbrdv9wal3l6	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prpb00aadbrdajnhmvth	f	\N	2025-07-25 18:30:38.437
cmdj5prvp00zodbrdj0vpzqz4	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prpb00addbrdwmg1u5md	f	\N	2025-07-25 18:30:38.438
cmdj5prvq00zqdbrdyc3el5mp	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prpc00agdbrd4kl5e13f	f	\N	2025-07-25 18:30:38.438
cmdj5prvq00zsdbrdcenj7ihu	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prpd00ajdbrdrlepx276	f	\N	2025-07-25 18:30:38.439
cmdj5prvr00zudbrdhpz50981	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prpe00amdbrdrzn9n6qh	f	\N	2025-07-25 18:30:38.439
cmdj5prvr00zwdbrdzqn7o171	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prpe00apdbrdsrzmemme	f	\N	2025-07-25 18:30:38.44
cmdj5prvs00zydbrdqpe8xq1i	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prpf00asdbrd0l2mlf30	f	\N	2025-07-25 18:30:38.44
cmdj5prvs0100dbrda94ppdf7	cmdj5prvh00yrdbrd5jh33gq1	cmdj5prpg00avdbrdw7gzorkv	f	\N	2025-07-25 18:30:38.441
cmdj5prvu0107dbrdepsbu19e	cmdj5prvt0101dbrdd41loxe9	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.443
cmdj5prvv0109dbrdpo8r0a7b	cmdj5prvt0101dbrdd41loxe9	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.443
cmdj5prvv010bdbrdzcq26899	cmdj5prvt0101dbrdd41loxe9	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.444
cmdj5prvw010ddbrdmwlbr330	cmdj5prvt0101dbrdd41loxe9	cmdj5prpb00aadbrdajnhmvth	f	\N	2025-07-25 18:30:38.444
cmdj5prw4011edbrdwhm4rvnr	cmdj5prw20112dbrdisdcvjbr	cmdj5prlz000zdbrdmido7zn6	f	\N	2025-07-25 18:30:38.453
cmdj5prw5011gdbrdfee0e1ig	cmdj5prw20112dbrdisdcvjbr	cmdj5prm30012dbrdfo2t8dim	f	\N	2025-07-25 18:30:38.453
cmdj5prw5011idbrdugn6vpqt	cmdj5prw20112dbrdisdcvjbr	cmdj5prm50015dbrdnzeg72sj	f	\N	2025-07-25 18:30:38.454
cmdj5prw6011kdbrdrr7xrx9z	cmdj5prw20112dbrdisdcvjbr	cmdj5prm70018dbrd8z3du4c5	f	\N	2025-07-25 18:30:38.454
cmdj5prw7011mdbrdhyqoeqgn	cmdj5prw20112dbrdisdcvjbr	cmdj5prma001bdbrdhvqfti89	f	\N	2025-07-25 18:30:38.455
cmdj5prw7011odbrdjoy0dfyy	cmdj5prw20112dbrdisdcvjbr	cmdj5prsp00nodbrd0nuef94z	f	\N	2025-07-25 18:30:38.456
cmdj5prw8011qdbrd9vaei4wa	cmdj5prw20112dbrdisdcvjbr	cmdj5pro0005idbrdi33ugofw	f	\N	2025-07-25 18:30:38.456
cmdj5prw8011sdbrd9isktana	cmdj5prw20112dbrdisdcvjbr	cmdj5prq100d5dbrd8teyp0de	f	\N	2025-07-25 18:30:38.457
cmdj5prw9011udbrdc32dlu94	cmdj5prw20112dbrdisdcvjbr	cmdj5prmc001edbrd3l4izkbw	f	\N	2025-07-25 18:30:38.457
cmdj5prw9011wdbrdr8faqdfs	cmdj5prw20112dbrdisdcvjbr	cmdj5prp7009ydbrd3wpaju8m	f	\N	2025-07-25 18:30:38.458
cmdj5prwa011ydbrdt4ltlets	cmdj5prw20112dbrdisdcvjbr	cmdj5prme001hdbrdv9lp3cwl	f	\N	2025-07-25 18:30:38.458
cmdj5prwa0120dbrdwe2x6c7i	cmdj5prw20112dbrdisdcvjbr	cmdj5prp800a1dbrdc2fv9ibr	f	\N	2025-07-25 18:30:38.459
cmdj5prwb0122dbrdgirh5y6w	cmdj5prw20112dbrdisdcvjbr	cmdj5prp900a4dbrd6ahgv9xd	f	\N	2025-07-25 18:30:38.459
cmdj5prwb0124dbrdg6rtax6b	cmdj5prw20112dbrdisdcvjbr	cmdj5prst00o5dbrd55n4g2zw	f	\N	2025-07-25 18:30:38.46
cmdj5prwc0126dbrdlepciy5k	cmdj5prw20112dbrdisdcvjbr	cmdj5pro1005ndbrdl78x4kds	f	\N	2025-07-25 18:30:38.46
cmdj5prwc0128dbrd6gdx7vvn	cmdj5prw20112dbrdisdcvjbr	cmdj5prpc00agdbrd4kl5e13f	f	\N	2025-07-25 18:30:38.461
cmdj5prwd012adbrdzy160a32	cmdj5prw20112dbrdisdcvjbr	cmdj5prq800dxdbrdphuiqgmz	f	\N	2025-07-25 18:30:38.461
cmdj5prwd012cdbrd3ff69tbg	cmdj5prw20112dbrdisdcvjbr	cmdj5prsw00oidbrd4999vyjt	f	\N	2025-07-25 18:30:38.462
cmdj5prwe012edbrdz6d79lie	cmdj5prw20112dbrdisdcvjbr	cmdj5prqb00e8dbrdanwlo08d	f	\N	2025-07-25 18:30:38.462
cmdj5prwe012gdbrd2my7shfx	cmdj5prw20112dbrdisdcvjbr	cmdj5prpg00avdbrdw7gzorkv	f	\N	2025-07-25 18:30:38.463
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: Nathan
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
098f8db3-7dda-4823-a3b9-775d8b30ddf1	b8eb15694e7ae94ff9b032fbcfac54a35ae02c2cefc42bf6d1917e17d2f9aeb5	2025-07-25 14:22:57.568371-04	20250721163540_init	\N	\N	2025-07-25 14:22:57.563567-04	1
676a4255-7a2b-4bac-95fc-adfde7bf8aaf	5a01d5f3370d26b13529df271c1c7bc409ded58dbc178965c1273fb956d01f68	2025-07-25 14:22:57.570169-04	20250721165000_made_dates_optional	\N	\N	2025-07-25 14:22:57.568883-04	1
44486b23-8c37-4c57-a392-8adf4f0fcfa7	35dbf2ed06474b1fd0899ea1cd16a08db6f2203693e2357cc63b0e1293b209f1	2025-07-25 14:22:57.580366-04	20250725170943_new_insu_deg_tables	\N	\N	2025-07-25 14:22:57.570542-04	1
7264e2d5-5218-4dbd-bf1c-9d388b4cdccb	e03741ded7acb92319e45babe26c77888882db0d3b32a3fd745a31e1b186c601	2025-07-25 14:22:57.581928-04	20250725173752_updated_practitioner	\N	\N	2025-07-25 14:22:57.580606-04	1
d188abf1-9c1c-46ea-b988-d727ce4123d5	7bd2ad3574d94572224d344ec1cf9e020dc2934c008c89603762f0b499960eb7	2025-07-25 14:22:57.582995-04	20250725174338_first_name_optional	\N	\N	2025-07-25 14:22:57.582193-04	1
\.


--
-- Name: Degree Degree_pkey; Type: CONSTRAINT; Schema: public; Owner: Nathan
--

ALTER TABLE ONLY public."Degree"
    ADD CONSTRAINT "Degree_pkey" PRIMARY KEY (id);


--
-- Name: Insurance Insurance_pkey; Type: CONSTRAINT; Schema: public; Owner: Nathan
--

ALTER TABLE ONLY public."Insurance"
    ADD CONSTRAINT "Insurance_pkey" PRIMARY KEY (id);


--
-- Name: PractitionerDegree PractitionerDegree_pkey; Type: CONSTRAINT; Schema: public; Owner: Nathan
--

ALTER TABLE ONLY public."PractitionerDegree"
    ADD CONSTRAINT "PractitionerDegree_pkey" PRIMARY KEY (id);


--
-- Name: PractitionerInsurance PractitionerInsurance_pkey; Type: CONSTRAINT; Schema: public; Owner: Nathan
--

ALTER TABLE ONLY public."PractitionerInsurance"
    ADD CONSTRAINT "PractitionerInsurance_pkey" PRIMARY KEY (id);


--
-- Name: Practitioner Practitioner_pkey; Type: CONSTRAINT; Schema: public; Owner: Nathan
--

ALTER TABLE ONLY public."Practitioner"
    ADD CONSTRAINT "Practitioner_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Nathan
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Degree_name_key; Type: INDEX; Schema: public; Owner: Nathan
--

CREATE UNIQUE INDEX "Degree_name_key" ON public."Degree" USING btree (name);


--
-- Name: Insurance_code_key; Type: INDEX; Schema: public; Owner: Nathan
--

CREATE UNIQUE INDEX "Insurance_code_key" ON public."Insurance" USING btree (code);


--
-- Name: Insurance_name_key; Type: INDEX; Schema: public; Owner: Nathan
--

CREATE UNIQUE INDEX "Insurance_name_key" ON public."Insurance" USING btree (name);


--
-- Name: PractitionerDegree_practitionerId_degreeId_key; Type: INDEX; Schema: public; Owner: Nathan
--

CREATE UNIQUE INDEX "PractitionerDegree_practitionerId_degreeId_key" ON public."PractitionerDegree" USING btree ("practitionerId", "degreeId");


--
-- Name: PractitionerInsurance_practitionerId_insuranceId_key; Type: INDEX; Schema: public; Owner: Nathan
--

CREATE UNIQUE INDEX "PractitionerInsurance_practitionerId_insuranceId_key" ON public."PractitionerInsurance" USING btree ("practitionerId", "insuranceId");


--
-- Name: PractitionerDegree PractitionerDegree_degreeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Nathan
--

ALTER TABLE ONLY public."PractitionerDegree"
    ADD CONSTRAINT "PractitionerDegree_degreeId_fkey" FOREIGN KEY ("degreeId") REFERENCES public."Degree"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PractitionerDegree PractitionerDegree_practitionerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Nathan
--

ALTER TABLE ONLY public."PractitionerDegree"
    ADD CONSTRAINT "PractitionerDegree_practitionerId_fkey" FOREIGN KEY ("practitionerId") REFERENCES public."Practitioner"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PractitionerInsurance PractitionerInsurance_insuranceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Nathan
--

ALTER TABLE ONLY public."PractitionerInsurance"
    ADD CONSTRAINT "PractitionerInsurance_insuranceId_fkey" FOREIGN KEY ("insuranceId") REFERENCES public."Insurance"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PractitionerInsurance PractitionerInsurance_practitionerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Nathan
--

ALTER TABLE ONLY public."PractitionerInsurance"
    ADD CONSTRAINT "PractitionerInsurance_practitionerId_fkey" FOREIGN KEY ("practitionerId") REFERENCES public."Practitioner"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

