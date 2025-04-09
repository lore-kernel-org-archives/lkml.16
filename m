Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE6A2C9A;
	Wed,  9 Apr 2025 01:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744161477; cv=fail; b=CxTKhbXbGbPUGPaiknZYwoDafi9kk56Nk08N8DlBIjb1ZSC11ev6PitIFvUdch/Xt1s9biKbeqJGILCn928z5aq1LBd63YHFwnu5ea6lxjSi9H6C/Sjg3MupviE2RffNTww8roDC1cAGGDfUKmTz/oxz2l08m/kqTGB6d9Y6K48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744161477; c=relaxed/simple;
	bh=fUBgFe6QJMak2hRxYFNifl4M0xFmKpjJzcSWza4Y2vg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R+K+Dr/IlO/AENt4sbNJQ00/2wH/r9VpNz+QPSQU9uFu3lwwEbiTzwezqnM6F/Kmac+lU/f2QXAvf+3lU7NhFJhLPF1ukBnyiM+72Qbq6aLibv4SJEG4w4l0Tup87DdSyq20n+MR0/36P46tmwx8qh1BiQIWXE2K+QFpeYq3IkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=wgCqFP0P; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="wgCqFP0P"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5390v7IR008650;
	Tue, 8 Apr 2025 21:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uKn1F
	oDYJoHxhGDSt4Ddt7K6UuqXliZUx8H09CzojTQ=; b=wgCqFP0PdFDtqHE4vz5lQ
	c3nK0Xw14AoHsjaeO10PILxa3G6uu3sihIsB+b0bokyWJ1L1nr/FeA0d8YzLr+tc
	3Zdx02sHALuVyzzpD+CX5KQ8MCMJtqWxJFV4p6YXTRz2+HhtvGL7phlx4NEBb395
	8yt+Jb3mzVFdqjwdIudDKoGcEQOKFUWQasaLoyEEk5PLoGxv23Jvs+O3ADgUuYDq
	w6sl+J8htmyQOZDaIgy2tOomHIzGIN26mWmdV/YeqMmCyOPj4WUCtX078lY7NBtk
	MLKcWUvXW3oZvd8Kv6kU4mwyWi8k6t+xWwA+wjupsryS8NM7xynmv9U2WZpsgPmV
	g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011024.outbound.protection.outlook.com [40.93.13.24])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45tx9csdus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 21:17:33 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKLshHaooCR3vCDw2eOMm54Mov6O7wPmdr0LupvVje9V7qRO69aJBGVintmMLrEbiyDJrrd5BJOPPZUGilN3+bXv+YC/a0H0b2A4fk894GrD6YiS4+XNg5j8MWOoXRWVREhVUxTGC9S+UCZrLl/yI79Go7bW1Aimtvwg1pBGQXWGG0Kq/ORJrRLu+URxYDuOAMVAcIpx0jIa5yTX8w2xg4B8mTHbYCKjn2RMZTgxBBQPPzCJb2UEFthNANfAtme5BPQUr/7jTZ4Pbs33WyAYo7fkgIJS0PhtlqiRIGrPFmHeLrKVz5lHy3xP0qOxvnicIsAz2u5sIU7Qf8Dy3Ro45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKn1FoDYJoHxhGDSt4Ddt7K6UuqXliZUx8H09CzojTQ=;
 b=RglJx+75k1n+dh8i60THyNDsyAbroZxA3fSABu0XxxkNL/7j5KbGx6SvhPxrrlrvOnjgnVOjb9MckJMBjN7zn+RHtOn+mCuPZe1dY4ozxx/XOJJKe4OskFif0YVWIpB0FiQp1Ga4Mk8fV0w/KyEBat3jL6P1fz06xwO2JS2MTdgl7Cubeky+mXL0Cgmxcqnpv+I+QFrTtHtmjP1+Maf+FlSEt04iEZDYeEDiHe7vaT1/wwbvm3ZSY2TnViBwoaiazqgIhv+DISzZERT6/AZKJHlZv2QgvElQcrz+P20Tu71w8hlW6pcTB+4M1GtddWV1ob/RQ9/f4h0sHarVQZZUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by DM4PR03MB6999.namprd03.prod.outlook.com (2603:10b6:8:45::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 01:17:31 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354%5]) with mapi id 15.20.8583.043; Wed, 9 Apr 2025
 01:17:30 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "William A. Kennington III"
	<william@wkennington.com>
CC: Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] hwmon: max34451: Work around lost page
Thread-Topic: [PATCH v2] hwmon: max34451: Work around lost page
Thread-Index: AQHbqCrLvrx0jOj/y0ud/TRsSfihjbOaiWjA
Date: Wed, 9 Apr 2025 01:17:30 +0000
Message-ID:
 <PH0PR03MB6351903275DC93C9C543B096F1B42@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20250401220850.3189582-1-william@wkennington.com>
 <20250408011006.1314622-1-william@wkennington.com>
 <7cc91dea-c24c-4948-9916-8cad865d023e@roeck-us.net>
In-Reply-To: <7cc91dea-c24c-4948-9916-8cad865d023e@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|DM4PR03MB6999:EE_
x-ms-office365-filtering-correlation-id: 59aa1405-4d3e-417b-d703-08dd77044cdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HO57dPpbzvsIYI3esW0QV6rSskuAvO/R9McU/Cb4AK9NH7Ls6QTKUW0G1r9F?=
 =?us-ascii?Q?BadUW7iC0VO4R25fIL7tLS8De/7vkynDAowUoBiph1c0rP6buhWnrCqMLMVc?=
 =?us-ascii?Q?liWmErm3Xauo7cOfE5jJ7E/M+OVUu973FcAiLu8W+NVQuwUFcU65Sp7CAlV3?=
 =?us-ascii?Q?mfTPos5H7PoCpsH4Hxz9at9SdSrAoYfDoTEYeh/kkEYafmmhk8nGYP8bLUJr?=
 =?us-ascii?Q?cU6CToHjwVLZNT+PickEHwY9h0Gz32RZHkOEqzzytv+eD87PdVPveQJRSC8P?=
 =?us-ascii?Q?aXmuX+x3iEOrRfZPy22FY9zudU+0WSnTovuog4L2NwjdJAn82ZVTatrunH6U?=
 =?us-ascii?Q?YZXM35dtxOnwq0T4j0OE7+8X8Be4nH4hP8Ew+6B5v5Jj24p7ZqIUNvcbYJgl?=
 =?us-ascii?Q?egJd+58fZ95Y/7J8KTb4hJeGp06IcAOByJO0wfXobrDRcOONped5sOudjLLU?=
 =?us-ascii?Q?NW7CxTGToHgM5wlFVXscQNrNx36paBnWu+AOhyeZH6CsFF7WqgDhcWTai7k6?=
 =?us-ascii?Q?jNUFuvl1RgKknIXgaOJ15hixjEsLSWBBh2dD+f3heo2gqD9ZYd29raz9dP4f?=
 =?us-ascii?Q?R0WUGRjOoWvv3xaffMmzIu8+udHMq/hpuuUePs4oZ35ArsbrXgqZeDuyESPV?=
 =?us-ascii?Q?GwvZ5Ccvs+/eyFnOYXcsxSuWc/sgr/yd31/K3xL2B3CXIoAhv4bDkqWsqurp?=
 =?us-ascii?Q?weGYIeOPoxLDTra0FNWgSsbL5sf23zeTGwyTNG/B4jg4HhMjhQgus0dJ+VSK?=
 =?us-ascii?Q?AMdDHdWQDsKMWcXTGyhv2VcG+YtPXbdKFvOZAWb8AiICHPx1M4MYPhX+0UE3?=
 =?us-ascii?Q?ScciJ5bEZVb0vf8KIBIM0F0zrRK7NvxZjULfZggl/F8CdTqhaMUu/Rp+baBx?=
 =?us-ascii?Q?B5TWN5uAVrTRQxyAGub1EPdhH/WyUn3K8ZUVsdTS4WT8uQW88c6oowLFuSar?=
 =?us-ascii?Q?iyh0rqpQByrivcnA841FIhtDAqqPcGiFDJKrgV0adzA8eJhk42mm38FLUux4?=
 =?us-ascii?Q?T+34YQIRDdiMOv3o170L01QAy7pMKP8A1gRz4jryDpjCVeqwAnCE0eQwUG1l?=
 =?us-ascii?Q?gQ1Rvssmh6B3RWCDpcKkC7budb9HTbH0Gl1OpgLe0opxrRMHPoFrIiYmbi0Q?=
 =?us-ascii?Q?kbItD/4PwMHBAxLary6km8ngBzOpARI/HKM8Qj+14EQGZgypt1kIWOVXrd4X?=
 =?us-ascii?Q?2w25IaihmDgsg4/xLsyLWMIUDBoQ8CjSW2K8qNmhVDniWBCityIzkVHwcHFB?=
 =?us-ascii?Q?UudTku77Lj0n8fLsHYcufps/QIT6V/Ro3r2tFYWf3F35zn/rrXC9IxdmK+/o?=
 =?us-ascii?Q?oOy/DBksjpYEiMCGIVdXzkjfcRwuthPyN9zQ6t8Bodsu9pnRKRv5zqBl45Cj?=
 =?us-ascii?Q?6JH36GsujZFjFuAiA7aFTuGyHfk5e99EttutJiYxhYXyLcH+q3zRXbUumxgJ?=
 =?us-ascii?Q?PheYdOe5nwumUg/s4Daoyo1UZisFYX1jaEVv9G9dUiANrPNytbQxOw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dG29dFoxPa+bbi8t6Hb5rousmvTBdc5TiODoFDUWmIzu5Dp+/Zca//9rPbSX?=
 =?us-ascii?Q?uyCFtYqVwhzDS3k2JQM7xt1/OfAHVEdM52d120X0LMZWsLTv2ArY5EIsgNcL?=
 =?us-ascii?Q?MIITvRxeSrHjiVhKfA1yOptHJhYP1wAlE8w1PlhmzLT+bKEDN5o1RiIj/lvM?=
 =?us-ascii?Q?cOu35Rc6zqBELNJCt3I20rWaTFJmv1HN7C9Kzb5DQUwS5CcYMZnnYVf2C+n/?=
 =?us-ascii?Q?AAdRw6zWrSr1J+Xk+jRUpvmZ5xqE5j0k4J0hIEBOoK5x/o+Y9dnCTLgY/6bq?=
 =?us-ascii?Q?IXBdZYmqrnvwgLigeE28U95UnxhDiy8BCne+JvqpUHlubkQnwYKkAOrxEoSk?=
 =?us-ascii?Q?CwdcO4m8567O24LyNM/vUIb6UpA8aaWZSrmyCk0bzvpVTk8Ke8KPeHEk2ck8?=
 =?us-ascii?Q?E0+JQBdKo3Bt7JvQabiTZwFFbNQfOs8+j9nG+6buClGfyMHLheK0HMfYtn/U?=
 =?us-ascii?Q?B0+v2EWt/rLoquN4u/T7pOdQNUM+NmqqHqUipl/SSwUt93BOIn1OqN+KswYb?=
 =?us-ascii?Q?NW4mFurkOIrc23G70ZL0wqhPEqX0WOJ+DQsw9FgLLb2UAUvW91dp3G0I/XRr?=
 =?us-ascii?Q?vLnEukfkobxxt7xzLGGFfsdDlwYzy1T6ozRkcEeYrQx6NCF+QdiThIZMoJb1?=
 =?us-ascii?Q?Cc7ptO+2yYlY4S/4kiIgZOMWAOlWrmxgVlVQBcUsWwXXfUwx1pssRcs8B0qT?=
 =?us-ascii?Q?dlNR1oZP2lu3gtREUK5pQMdRwAZZhR1iecDMIWgXdDXh64HiSWhIEnTFwaCl?=
 =?us-ascii?Q?WNSMqnLv+atN2w/D3dYESU3CmM7nvToHBElmLHyZwTIQU4IviDVraNJAdhDE?=
 =?us-ascii?Q?V49ra+Gk0PPbcOV9R3JCvgXSNHasdQ116qKnJtIVdgI5TPdMLA2SJTvFLhwi?=
 =?us-ascii?Q?eobsg/yMf/DsCcKCMz6oTAkiiJpcEaXJ4Ja+YPG5RZOzWyzcG+jIr9zgQ/oZ?=
 =?us-ascii?Q?foe9nNb3f3M4yoZORpS2QmbEKHeLBGp4pnvROiw3xvcRLxjuJqDX8MH0j9pH?=
 =?us-ascii?Q?1N/Gsf3PkaVu/YWOppO0AGn6lhxyySQCw+A5oQz6ed6vSnva50DJ/idHSM7R?=
 =?us-ascii?Q?jqOCqHsXI/JanAyD0bYEGMwq3DKQTfY0cCK5I6cJ79x/1mcv98vBDMqc9s+v?=
 =?us-ascii?Q?TXzMEMuNkW18hMIHsymx4WEWK8NYMXf/foLCs0X33HWKCvf/sxqXfKuUO2BA?=
 =?us-ascii?Q?E5jdxxXQfYoxeedFkLoIlJ2Z6NzvgePPomdWaX9FtVW08z+A9FjoqX/swptU?=
 =?us-ascii?Q?6U2G0nzih+TxRgNjFIc6OX6pgBy6mnsTneYiUx+Q5ELsbnFXAgEYKkE+k1ZH?=
 =?us-ascii?Q?NP4vxumT7UHM5b9JxeEpoopbBGdPx5NsiiEX3Pg/FxDxSRzn5bMXdhJfe/8S?=
 =?us-ascii?Q?1QRtTPdRFDY8qsNSqDv4bVJ9N4+QKLZNH1UjuXbWiKwx6gw549qkMSHODUkb?=
 =?us-ascii?Q?ng6RA9DFCq3V4d6EBKaUD0q8SZrdZKLoUdZcq1WEb+hda7dth1Yfb9UIk0yT?=
 =?us-ascii?Q?+OYEgz8rGpmW3KkN7Vg0xfBcBfA45MBoWeA3tu1C/vtL6MfUiEzL9xakHe32?=
 =?us-ascii?Q?VUfvEgjXqKNyGH2iFKS09i/LELNaQtYXuf5gyQiNgZVtOp19KiAQtnEukZbF?=
 =?us-ascii?Q?qA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59aa1405-4d3e-417b-d703-08dd77044cdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 01:17:30.9491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9+AleQlzMZypTSbi3SOrU9vXwQo5i9ssn8SEV/MXDE9yKYrfVggsuikTXGSlipPu3VXt9rWOVra2CxQupFgFNopXJdZbsXGM8NxkrkgWF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6999
X-Authority-Analysis: v=2.4 cv=QdBmvtbv c=1 sm=1 tr=0 ts=67f5caad cx=c_pps a=pibkrh05mLzxjy7FsoIMmA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=L-xz6NSyAAAA:8 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=KIXJmEObq6YtfGDU-EwA:9 a=CjuIK1q_8ugA:10 a=H7nlQ9NbTXmbZqfEVjPa:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: 31B_HyH3R5yTLN23Dpio5DiP50IQLtc-
X-Proofpoint-GUID: 31B_HyH3R5yTLN23Dpio5DiP50IQLtc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090002



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Tuesday, April 8, 2025 10:06 AM
> To: William A. Kennington III <william@wkennington.com>
> Cc: Jean Delvare <jdelvare@suse.com>; linux-hwmon@vger.kernel.org; linux-
> kernel@vger.kernel.org; Torreno, Alexis Czezar
> <AlexisCzezar.Torreno@analog.com>
> Subject: Re: [PATCH v2] hwmon: max34451: Work around lost page
>=20
> [External]
>=20
> On Mon, Apr 07, 2025 at 06:10:06PM -0700, William A. Kennington III wrote=
:
> > When requesting new pages from the max34451 we sometimes see that the
> > firmware responds with stale or bad data to reads that happen
> > immediately after a page change. This is due to a lack of clock
> > stretching after page changing on the device side when it needs more
> > time to complete the operation.
> >
> > To remedy this, the manufacturer recommends we wait 50us until the
> > firmware should be ready with the new page.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
>=20
> Applied to hwmon-next.
>=20
> Alexis: Do you happen to know if the new revision of MAX34451 still has t=
his
> problem ? Also, it would be nice to get some feedback if the patch covers=
 all
> affected devices.
>=20

I unfortunately am not aware of this. Let me see if can get an answer from =
the
engr of the part.

>=20
> > ---
> > V1 -> V2: Make all page changes delay the required 50us
> >
> >  drivers/hwmon/pmbus/max34440.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/max34440.c
> > b/drivers/hwmon/pmbus/max34440.c index c9dda33831ff..0d9cb39a9cc6
> > 100644
> > --- a/drivers/hwmon/pmbus/max34440.c
> > +++ b/drivers/hwmon/pmbus/max34440.c
> > @@ -12,10 +12,19 @@
> >  #include <linux/init.h>
> >  #include <linux/err.h>
> >  #include <linux/i2c.h>
> > +#include <linux/delay.h>
> >  #include "pmbus.h"
> >
> >  enum chips { max34440, max34441, max34446, max34451, max34460,
> > max34461 };
> >
> > +/*
> > + * Firmware is sometimes not ready if we try and read the
> > + * data from the page immediately after setting. Maxim
> > + * recommends 50us delay due to the chip failing to clock
> > + * stretch long enough here.
> > + */
> > +#define MAX34440_PAGE_CHANGE_DELAY 50
> > +
> >  #define MAX34440_MFR_VOUT_PEAK		0xd4
> >  #define MAX34440_MFR_IOUT_PEAK		0xd5
> >  #define MAX34440_MFR_TEMPERATURE_PEAK	0xd6
> > @@ -238,6 +247,7 @@ static int max34451_set_supported_funcs(struct
> > i2c_client *client,
> >
> >  	for (page =3D 0; page < 16; page++) {
> >  		rv =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> > +		fsleep(MAX34440_PAGE_CHANGE_DELAY);
> >  		if (rv < 0)
> >  			return rv;
> >
> > @@ -312,6 +322,7 @@ static struct pmbus_driver_info max34440_info[] =3D=
 {
> >  		.read_byte_data =3D max34440_read_byte_data,
> >  		.read_word_data =3D max34440_read_word_data,
> >  		.write_word_data =3D max34440_write_word_data,
> > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> >  	},
> >  	[max34441] =3D {
> >  		.pages =3D 12,
> > @@ -355,6 +366,7 @@ static struct pmbus_driver_info max34440_info[] =3D=
 {
> >  		.read_byte_data =3D max34440_read_byte_data,
> >  		.read_word_data =3D max34440_read_word_data,
> >  		.write_word_data =3D max34440_write_word_data,
> > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> >  	},
> >  	[max34446] =3D {
> >  		.pages =3D 7,
> > @@ -392,6 +404,7 @@ static struct pmbus_driver_info max34440_info[] =3D=
 {
> >  		.read_byte_data =3D max34440_read_byte_data,
> >  		.read_word_data =3D max34440_read_word_data,
> >  		.write_word_data =3D max34440_write_word_data,
> > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> >  	},
> >  	[max34451] =3D {
> >  		.pages =3D 21,
> > @@ -415,6 +428,7 @@ static struct pmbus_driver_info max34440_info[] =3D=
 {
> >  		.func[20] =3D PMBUS_HAVE_TEMP |
> PMBUS_HAVE_STATUS_TEMP,
> >  		.read_word_data =3D max34440_read_word_data,
> >  		.write_word_data =3D max34440_write_word_data,
> > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> >  	},
> >  	[max34460] =3D {
> >  		.pages =3D 18,
> > @@ -445,6 +459,7 @@ static struct pmbus_driver_info max34440_info[] =3D=
 {
> >  		.func[17] =3D PMBUS_HAVE_TEMP |
> PMBUS_HAVE_STATUS_TEMP,
> >  		.read_word_data =3D max34440_read_word_data,
> >  		.write_word_data =3D max34440_write_word_data,
> > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> >  	},
> >  	[max34461] =3D {
> >  		.pages =3D 23,
> > @@ -480,6 +495,7 @@ static struct pmbus_driver_info max34440_info[] =3D=
 {
> >  		.func[21] =3D PMBUS_HAVE_TEMP |
> PMBUS_HAVE_STATUS_TEMP,
> >  		.read_word_data =3D max34440_read_word_data,
> >  		.write_word_data =3D max34440_write_word_data,
> > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> >  	},
> >  };
> >
