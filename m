Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E203191F91
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501961; cv=fail; b=RblaLlSwxpZJoowHgc5BV2svyOUZDtfSrF262sWIObdXVXHqEF2VL/dtqourIDzw9rmSFagGMf92qtkVAqIQdE0e6duyWgCwNz65oVDUzlx8PAJtzbwuXQb5k+2amhWEUBxd36QdWDvWagIR9OzGB4XC6HHF9JGYsPHn4u0pfAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501961; c=relaxed/simple;
	bh=aLzwH5DwNZh5DZ0zHsFh+wDaVpLfxQQ/AUlA0MZjJ5I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Teht9zwKF9Vppppha2l9igkaHLvVSlTqfOOHQbzQ5likugsJfgNQEBu/wG7vAVdbmo/Z5FJrCUuJ7GjlZPPLRIKRVfup26VKfcqDCbHd8THiz2Uh54Ymv2mcXOxhIklHYZbHqZ3ELpgqIQKJG6R1pdeDjKxQ5SQyYxA+Pi7qiAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=ISrYUdx9; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="ISrYUdx9"
Received: from pps.filterd (m0355087.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAjOOn003491;
	Thu, 24 Apr 2025 13:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=MFCc0bbVd4e52Y7UKTg8aNck+E27qBaSATCSDNbWcOo=; b=ISrYUdx92Fm2
	Cejsqjjgsdsc6YTpQFUd2YM/sP9NvCBGZCaKTqEm0falEUxdRriMRY5BPVTxZMoU
	ytNpHJXzAgn2QJV3ihqFCOZwTrGJZzimq3dEDzX2vds1snwMKZFq6aQMKEw3EI2m
	651dYIi6SmxCCmSsaF68wt2A8XSAcm9jRqZlX7IxDNKFw2boCfCkQHuMPGtW76Lo
	/bh3QxlEhDqGMGpayjTy/6pARGZuie5zTK5ySkxQi28DnzOh2mmVuNQ3kiGT02VC
	pO7DDlQ42VkOUAQwX5VKaDJ1pGGTSWKOTYEJMEQ/ayX5mcYZFFgYV5MUSuFuv2IU
	B7oqgLDL+w==
Received: from tydpr03cu002.outbound.protection.outlook.com (mail-japaneastazlp17013074.outbound.protection.outlook.com [40.93.73.74])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 466jjdwx0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 13:39:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzrJDUcqVaHqm6qDbtyR/nw9swe9UrU1Gvsl+I/Z0a6jHqKmn9SLjuhcLD0XRxd1QThehh66RuravsJ7+egdKDBJFlxCjGH1mN+zbEcdzriS0o4RuP9TLZwPeArHFhDPTsRQhXl+mDI1miz1g0jey1ZY+JotnwDoisvnRYKBNoutUkwxKU5oRn3QIxiUUCMa7+quQiLAbqPlE2fMDsNGgVFIO67oBhfHtSCbadk5TWm0QjJWbCnwgX5q8PGdM0poKVXQ7cqePS8ZfaSnfN1w2yZPlfWTXRrSAKOQESpvex5m4t08g7wurfjbiC9h516F3K53wlSilpwDJ4VXY/8brQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFCc0bbVd4e52Y7UKTg8aNck+E27qBaSATCSDNbWcOo=;
 b=AQwx07zT+gyOUHSZyIbUQeL3fRodXcJbrtMZPX8LyDD6V4hDHUJZAkofWdniGbC7DMT0AT85YkzulGui2pJFh5rS9Ha9C6mm9QgikYRzZ/hwAOLdMPoKvw7CF5pGwx9sl7/tR2dHOWGsx2J2ZRyhf8agjHjf0K6Usb+HPvFiASlh75OhZnlahn/MT2y0msD0oNA6k7hiDk0ITqhm4fROZx1dJAWTJrcOkvCgrYhZ/5lhd8dbkfoSD8xFjzn0TQM7K8+k5PRAtfsR479H5xhzdis5eGzbXyt/ulCm6jaZ91HEcpejLvJg/Z+zYNIzifFX4Xhspw/DkwuB7VtjLUj++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from TYZPR03MB6192.apcprd03.prod.outlook.com (2603:1096:400:130::9)
 by TYSPR03MB7762.apcprd03.prod.outlook.com (2603:1096:400:413::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.25; Thu, 24 Apr
 2025 13:38:57 +0000
Received: from TYZPR03MB6192.apcprd03.prod.outlook.com
 ([fe80::54ac:ace0:dab9:cf27]) by TYZPR03MB6192.apcprd03.prod.outlook.com
 ([fe80::54ac:ace0:dab9:cf27%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 13:38:57 +0000
From: Adrian Huang12 <ahuang12@lenovo.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
        Andrew Morton
	<akpm@linux-foundation.org>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>,
        LKML
	<linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
        Christoph
 Hellwig <hch@infradead.org>,
        Oleksiy Avramchenko
	<oleksiy.avramchenko@sony.com>,
        Mateusz Guzik <mjguzik@gmail.com>
Subject: RE: [PATCH 4/4] vmalloc: Align nr_vmalloc_pages and vmap_lazy_nr
Thread-Topic: [PATCH 4/4] vmalloc: Align nr_vmalloc_pages and vmap_lazy_nr
Thread-Index: AQHbtR46mU/VYMV66EWs4KZEcctmjQ==
Date: Thu, 24 Apr 2025 13:38:57 +0000
Message-ID:
 <TYZPR03MB61927CAD315EEC000854481BB3852@TYZPR03MB6192.apcprd03.prod.outlook.com>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-4-urezki@gmail.com>
In-Reply-To: <20250417161216.88318-4-urezki@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6192:EE_|TYSPR03MB7762:EE_
x-ms-office365-filtering-correlation-id: 16865155-4c09-4b78-e7ad-08dd83355d4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ULE4idwvTReWzHRb3O4QIukx3a5S4oeeY2EsdsYWvnJ1fZoWbG9vHrEgeZoa?=
 =?us-ascii?Q?LkIk04qZzKxK3MWdHc9mYGbXXziLmBhpARJVk5b5CMTFhZo/TduLIGnhoZx+?=
 =?us-ascii?Q?nVrBP/yOeQGpDidvxOmsye8qJeUfVYwSjQnaWH//wqVjGHy3L5Bfw3PWAHfn?=
 =?us-ascii?Q?T53dNGjASPgBxUfhPH0uCZi40l52xvWKC5x/IoDeR0hooTgUBAMrucDC2VIG?=
 =?us-ascii?Q?Ln0aWyno7dvwSr4gcqjmxL3FVMjBqa4Og/gPtVB/vY7YlbLUD+yc9qV6Hvf2?=
 =?us-ascii?Q?UUsXYvOjcPMRDN43o8FzgN2bf1ItPcEBYbZ3weE9qqxYH/Cty5SfJ0MGV7Oc?=
 =?us-ascii?Q?/ejfWcv8fOsfeuxnkYp3vyzZ0Lo/uMBeZ9LTkET5ScE79/kDB1M4gNEIknUf?=
 =?us-ascii?Q?cGO6erWJwD5awdrlcjVSAENpiElKd/brMJ9sbdWr/K7+ZgT2dkSnSuVHzd0Z?=
 =?us-ascii?Q?rHG3wdDdMlXx1x0oitYZn6oqFUnmMy1tWS6BkH+z5Lt1gPu8maIRUERv44kD?=
 =?us-ascii?Q?zeTgpC1Ni8xWNdxv+oOQf6dOsNpnKp6kUS1eC7wDCXyk3tA6R3xFfufdQ6hk?=
 =?us-ascii?Q?b3trv1xUF+YLU+HrZ1bkhnh+mjElD3SoI5W8lJA3Pk1fI1AS3aOH+SnUvySD?=
 =?us-ascii?Q?kX5koyezE7T+lUmdxoMsPhB6pyZ13wz5PFPc07rEwKR7wIMyC7GurMUvbgvH?=
 =?us-ascii?Q?JkmIDhG8DrbKLuZWyR3kdFwEB0vK/hK2XYL3/Mh8LJ+4RX2cYhWhUxiSewBQ?=
 =?us-ascii?Q?UH7Kdja59EcFpAYspbKeGCVZPUBrgExTyF3Q74PgD7WXzCJN9gBNITDGOgEe?=
 =?us-ascii?Q?4un7C4S+NDlxRiVedveLplFoUuapD8w9ctaqTPhCcPZ32QmTZXNKeAL+1Su+?=
 =?us-ascii?Q?DCXZhufs4SMRi20oxiFEFqFUcOfl8VM4XKK8FW0MMn3IF0bgOwtO92xfwbYN?=
 =?us-ascii?Q?qcgNbxqOpca6aR3Nl4FqGEq+2ewbtMKejjJwueHMF4mRNMhY7fGTlgi6tqgZ?=
 =?us-ascii?Q?5Jx5hqogSyH0MB/Ehd29PQBEi5Y4mnA80nBh3cu822R6FB6U0F8dv8vU8FV6?=
 =?us-ascii?Q?236vWMh3cNMPGjkrlwqmengPcpVjayFJ7s+HWiPX+XZ7oEYnradFiPNKX4aW?=
 =?us-ascii?Q?HUB3QoIhHQ/Lmd2Yp+HgKKR6ROfVNHwK0vA6DbECzeN0u0uvK9IcEIDbxXCh?=
 =?us-ascii?Q?WeHGAWZJf4AH1rPgicX+PGHlZu98tiRpE3sjIxs/QA2pT7rue/43t6wSL57d?=
 =?us-ascii?Q?YHovjLGeZJvuz8/4UAA61N63ffYB9OFN2Tbswtkqa/AEFVLJthyr6HMxsCdj?=
 =?us-ascii?Q?gYfITr1GXOv+5SgVc/W1PXHc5DtLisxaihU1lqAmVxUDwaZtPBEQFtCr6D6d?=
 =?us-ascii?Q?5bv3Env5Us1yGnFH53GW9H1MjYaOSyo45sxKEQAN9dUX5kNWOAeccN5LXijY?=
 =?us-ascii?Q?zfiCenX7NjbUbAslE1zQUwGvqKzIuvDAy8Kv/oM/xHUBlf0dMkFuKQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6192.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uBjM7xXQTAQyGlhfTaWT2Rko7iKsB9GVosMsRbO03A1U+IzP9fZJY0qzJBcn?=
 =?us-ascii?Q?n3MhYtyB+KeeiiS3JJxRsXT79yg4bEJyA2CbMVX5xrlodrCrGVufntX/y9gB?=
 =?us-ascii?Q?1joQ8E3DJZ6/CxkAmdcs99cjXUuwJZ6XwNnurJt5LUrbueunRGP0f9khRL4Z?=
 =?us-ascii?Q?++sIDf0qfJqM+0t+8V0ZYt+m6dnr45TMgo0iHqunFwmVC25VafqOY7tr+Y3w?=
 =?us-ascii?Q?+SyO2sw+zQOjPwkmSMLRJcJLwmoy2hEo7yxbi0uKO4MSjZ1nnK4bQnGdCGte?=
 =?us-ascii?Q?HaZZMv85i5KvHjd7+PFZDCRIDzAsq+ScnZLO/CKByuNEMnnYtj3/J8MEraTk?=
 =?us-ascii?Q?60IPipDlA1E0MsKXH8v3eoqRlSzYwk4/9a36dDDiWyieGXK2IDHFG5PduZyK?=
 =?us-ascii?Q?saDfyIpetlTtSWQDYKm88gjT2AK0jfJqsjRq2Wbs46HKcUcxIG+hYJjPPvmf?=
 =?us-ascii?Q?NhYRV2D/krQee/J2S8Sw2Qa7kjBQAUfCBlIeGSoM+Eq9vPfdU7dx8b9iQyvY?=
 =?us-ascii?Q?xbQkB0hlS1K+9EUSHIWhnfcfs1fQV2ZTceNxedqLGxlbq/n8zgMUDHs70Ty6?=
 =?us-ascii?Q?+97q6MypjAsz6oNyQhWnGzbPQ8cGVL/0izp3YGX6e6zqR7v7BqvcpH2jF4YL?=
 =?us-ascii?Q?K/VZsbhEUpcqpOxOSHH5RcwyWQO9JJZWLz2FO8jWrG1iu1z03NiZdSikVcfa?=
 =?us-ascii?Q?7KcAXeNn0FEsLmh3UhOI1D31tElGr8HE8T3Sg/kPEM//pUHKu+CQKGk9wb5w?=
 =?us-ascii?Q?FeVtF7juf3v3+IjxpCDX8viqYN7VxO1+TPWihy14z0ACgIdltNPjECpx/Fxi?=
 =?us-ascii?Q?0h/2CLIpxWvOFIRowkQGjspQoLtxfFUjjqKwvqKoZBerTFWx/1LtUqnyHwpY?=
 =?us-ascii?Q?Oa8FG13Ez3oFmjTnL+5Z6wfC2GjxpSZreqCrg6wfX9vDTi9FEzTB0caIee1W?=
 =?us-ascii?Q?PeMI18ZRs7CxASYCOFHxFNE/nNjeZQ9iyOb8SAEen3/+JG40xXB+X6MHD0dD?=
 =?us-ascii?Q?qEEKhehdRtePhl1BMhVehktms8WDO0riJlngbHDomhrnU9WCgFki5G5zq4cs?=
 =?us-ascii?Q?qB/rGaZZHLPat5Q/5v6U9xEBI3GLnn8ZFOBXy6Qd5cTx5vKyT3LhHv4ifbew?=
 =?us-ascii?Q?N28dfrDVn+1yte4Qw29vZ3lPg8DgIvEcOy49QzSvzl+BLCTvFUnttZrnawRo?=
 =?us-ascii?Q?Pxetrc49zkjtcZwkPEYadcjpfR/ISLnyOVWH3p6ItDJ/7hLkwZNGjAvmXHsG?=
 =?us-ascii?Q?oZHzQa7ryKVxje4PmsIOeV0+2h5hWo7Dcsq6lyG3P5iOi+AukSxUhkyEKZB8?=
 =?us-ascii?Q?+vC8veCD0cvFh3aaDDXjcPhPOf9x7oui2Cqql32+uwahO/FHxk3TsDpECi7f?=
 =?us-ascii?Q?nBoxUk+y7VkiUg4uiPwaxwmePKutIZE4vdFrg15aLfBXtoM6iaGrnX+XtwKG?=
 =?us-ascii?Q?KWR4B9K62wkCle/35UDyu/yDIZUTxy9+hOamfHscb8aA/GHoBRW0VLAvEUk4?=
 =?us-ascii?Q?4knhM0qzTQ0EXdgj3maFbDQVyj1j2n0dutIdQ418rXT9uGVrNFAc4tR+X72z?=
 =?us-ascii?Q?Fv9P4OXPOJoMQfSjJxF0Lex+bWaG2UAYvEtb+U4z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6192.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16865155-4c09-4b78-e7ad-08dd83355d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 13:38:57.7901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FvoqyMG2Y5Xsv1XmEiS7YN2EHEXa+X57zoUk48xxUPvuTu3Tw7HaJ8HmJhVCXEcG7Y+cLPMZ82qxSHMxWjUZbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7762
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA5MiBTYWx0ZWRfX0vuGGCSNEbVL k/Qw1650iYresBzTuYCtblHK01z70awI7BWDqaveqavz55bFBSnqQjZk8OzsRk9T6FgzpUwl7Hd jIuEFqyjYzag/eNIVKNc+BP8YY3b1JP4YVosE7F4pGDCBU8Uhfr0F3Zb9bYNyv4FuM5SqN/vmiM
 lVJkCgKiYpgT745krzr7jGk4H3W4In/2DSkVmjPbEGuYA97msYOZe5TNa75hkf9HhVAUjsP5Hjd zoiRYU6tdswqVaGmxH2DwPzRR9LWl1j3bNi08QWiWqanmwXyEoacODNTBC22Ck9bIZLWp6xLVLW Pl1BiEUzQdh9t2HsyKR2D53Zs8xKWJMVEP83PpTUil6ZqaL78H3W9hpQ1EYuPUjbBvWVFaT0GLo
 WCZMxCsQDj9DGiMCYrTQ6fPd5hhoua5yGO/pgzp+xuVpPWCNpwCRxnck263SrSMJp5goZwpi
X-Proofpoint-ORIG-GUID: 6eXeN0SakoOtnUZiyjLGlhjca2z_wKrB
X-Authority-Analysis: v=2.4 cv=LpuSymdc c=1 sm=1 tr=0 ts=680a3ef5 cx=c_pps a=rVaYo2yDyVrP2ZXdFTXc3g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=37rDS-QxAAAA:8 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=z6gsHLkEAAAA:8 a=8k6WQxmsAAAA:8 a=FCVqZKk2aljoOxJBG1QA:9 a=CjuIK1q_8ugA:10 a=k1Nq6YrhK2t884LQW06G:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 6eXeN0SakoOtnUZiyjLGlhjca2z_wKrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1011 adultscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240092

> -----Original Message-----
> From: owner-linux-mm@kvack.org <owner-linux-mm@kvack.org> On Behalf
> Of Uladzislau Rezki (Sony)
> Sent: Friday, April 18, 2025 12:12 AM
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org; LKML <linux-kernel@vger.kernel.org>; Baoquan He
> <bhe@redhat.com>; Christoph Hellwig <hch@infradead.org>; Uladzislau Rezki
> <urezki@gmail.com>; Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>;
> Mateusz Guzik <mjguzik@gmail.com>
> Subject: [External] [PATCH 4/4] vmalloc: Align nr_vmalloc_pages and
> vmap_lazy_nr
>=20
> Currently both atomics share one cache-line:
>=20
> <snip>
> ...
> ffffffff83eab400 b vmap_lazy_nr
> ffffffff83eab408 b nr_vmalloc_pages
> ...
> <snip>
>=20
> those are global variables and they are only 8 bytes apart.
> Since they are modified by different threads this causes a false sharing.=
 This
> can lead to a performance drop due to unnecessary cache invalidations.
>=20
> After this patch it is aligned to a cache line boundary:
>=20
> <snip>
> ...
> ffffffff8260a600 d vmap_lazy_nr
> ffffffff8260a640 d nr_vmalloc_pages
> ...
> <snip>
>=20
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  mm/vmalloc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Adrian Huang <ahuang12@lenovo.com>
Tested-by: Adrian Huang <ahuang12@lenovo.com>

> diff --git a/mm/vmalloc.c b/mm/vmalloc.c index
> 77da4613f07ff..54f60d62051da 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1008,7 +1008,8 @@ static BLOCKING_NOTIFIER_HEAD(vmap_notify_list);
>  static void drain_vmap_area_work(struct work_struct *work);  static
> DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
>=20
> -static atomic_long_t nr_vmalloc_pages;
> +static __cacheline_aligned_in_smp atomic_long_t nr_vmalloc_pages;
> +static __cacheline_aligned_in_smp atomic_long_t vmap_lazy_nr;
>=20
>  unsigned long vmalloc_nr_pages(void)
>  {
> @@ -2117,8 +2118,6 @@ static unsigned long lazy_max_pages(void)
>  	return log * (32UL * 1024 * 1024 / PAGE_SIZE);  }
>=20
> -static atomic_long_t vmap_lazy_nr =3D ATOMIC_LONG_INIT(0);
> -
>  /*
>   * Serialize vmap purging.  There is no actual critical section protecte=
d
>   * by this lock, but we want to avoid concurrent calls for performance
> --
> 2.39.5
>=20

