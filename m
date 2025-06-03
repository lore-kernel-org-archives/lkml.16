Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7412289367
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976231; cv=fail; b=bVqNRd3VcrTPvx4X7lKimGOQsNXJS1VT5Gy9bCDQPM4QW/IyO3aQlTfOl8nmUF5OP36JQvwhQDJQYjAnsJGYEj2AOBQ1RV62Mw0A4eLUFVQdNvNTOIcCvvIUlvA8dh6HxVa+3rmyCkcp8rUR7rFmimVsO1KlXQMWcdnJJGuLhfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976231; c=relaxed/simple;
	bh=G8XK1SN8a+C/P/lfcNDk7+ZHtlhwwQ7va0wV91Ff4tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XEVBqIfAU6V2eBhUdZDLnNJKy0rvtZXQu0yKntVLUWi/Zif0LU7PxP2LJX+U/5Lw9jo+4XBtpnCOSBId9YkDB6r4PvVPQ3jWIxoG0LWu4H5MzX7kcWAAS6GLS7UVJDmyNBFei9QPOfhQJ5Zt3e+ZIRxem0+hK+EOODBB+S57skM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ehXwd324; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NICuk4Qg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ehXwd324";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NICuk4Qg"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553HXxLP001249;
	Tue, 3 Jun 2025 18:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=C7QckUnQ7Qgc60eXMF
	FY30LBW/onSFWXXgHZmeuVCMs=; b=ehXwd324llvbJBDk7A/wYmYh2FhjF86Irw
	MTjS8rKit4wVcZSLJFZ6csDCCKKwXGox7vxp7lPP3MQ91u+OyEiruTrwh2zz9IQT
	jPtpVp0TPd6Rg5MEHP7d8kWd9QK/lNnHur3/ef8HHustlb3tE5ngX4hO71DnzOs+
	O0qJMNJO2C5jG0vE7utOK50WKZd6I64r3SLsM/qM1LdFlkPecAdMUzIXTDFQ3C/+
	v4FJsvxXFDkb8fF3yYZ8EE0X1BHKFk5CP9rQCdjDS1FC+Ad9jubGzdS4ee6DSloD
	m5JlGO1cjgf04bk3uv4W/E6vsPlRQhSQZQ3rjtYFKKWHPASiKCgw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j2jme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 18:43:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553HYwfh016137;
	Tue, 3 Jun 2025 18:43:34 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79sun9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 18:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDPopYyd+kod92vBtOEUIf+i0F2cLFfOfuAdpgdkpUI0SZlfvLbwPnEZW7po7+uuE4qhV8RtIMpYGqDfvhUMC21aS6KRAGyBDrGE7JI08N1NJ5xix1DWxFzYgGr0nMRafiMfvhYXBsAkfpI7qWfn/WSRxZ+qKH1p56+6PVQsDSvdmjfFNbJxWqj7NOr6NUhyexfZPJi5DhBLUZ4i4DqidDOKiXSfnhTPxaxbJOKLjBoXYoLZu721ULFhAG6+/3Yyn5f6Dzxv0908TZPFKCBMwXCyPbfvjbSluW4KP05Ecu4Ef1QqBPlLQcF5Q08XibUbskTOdJYMpYxS50vkwn/azg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7QckUnQ7Qgc60eXMFFY30LBW/onSFWXXgHZmeuVCMs=;
 b=bs197WB9Wvw8wSGTjOrABslQEW/juN0/RQ2jUIGe1Y7cEIIhMGx45uQddy26THJszOvzYllJGJbKd3W94PoAezKRHSVIVi0g+yec6jE39LQnOiToIwm7t8Zrtn0ttS8MH/GTwSsTcNYynMn/vmVHHFW61YThwCZMAoK1ehwmym6pgofNg4mV9V/H4aMgo4t/IcUlZclitUshVNC6g+xp4sGS0sf59dmXylp7V8UoIpylk+FTgNCTmQO4229TpWYs5QGrGpjWXT8pm/PA51ftqCxPE9ifNZvvT7GBH2z8uT7ygBVJat2DIQxvqfJWX62YxBvZeuohSARV+PMcpLW8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7QckUnQ7Qgc60eXMFFY30LBW/onSFWXXgHZmeuVCMs=;
 b=NICuk4Qg40ENTxhqcexbDD7G4ph8XbTswWlVVBztrUCpaRjcV9VYbJKbw8aSXFDIsNUVhqoLyKhH08nnW+CvH/mNVu6LbKA1BrFmR6Su0lkIh7VIazbpgot9igv/dAENy95Ng4y5TybPxYc8CgAAz3kw45/53WhhcpafgQ3sYZ8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB6429.namprd10.prod.outlook.com (2603:10b6:a03:486::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 18:43:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 18:43:07 +0000
Date: Tue, 3 Jun 2025 19:43:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530104439.64841-1-21cnbao@gmail.com>
X-ClientProxiedBy: LO4P123CA0127.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: b7159299-6a4d-40df-85d6-08dda2ce7b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VOLwkCcSV6XQRkCIMk8v0r4/+u24G6ahRYrekHrTggKYFrCorYZjJcU244/T?=
 =?us-ascii?Q?gvWdCsVum6YhCrOpHTsLDXrcbZmZeluqD+Vm8nyb4aHfwacZ3otBcJnIMkof?=
 =?us-ascii?Q?zIgRY+6UU8fsmw584hrLlDzQwJ3WMwjkToA0+50h2eEA7h2ueCCnahSE05if?=
 =?us-ascii?Q?g3Dy+IPeahKOaL/ORSqeUvQdo3axg3F2pq1cXtRGbFUwcKcOKVDFJt3aCb3s?=
 =?us-ascii?Q?oB3M27CnAfBO6vFHAL4t1XuxmghgzyOYcGdLcY8fpUnjhMBC4wBM3BaC4tvl?=
 =?us-ascii?Q?O0CStu/4MoYUB0hYZfBgyWf+NUGy1xADnFgw8i9HnAu1UH3Lfr/0x3D/3HOG?=
 =?us-ascii?Q?d9ZItXVwUpkPHTwhgHEY8RzU7zz3cdAfgqwaMvGsjBL2T70hk5NIsnMPktzh?=
 =?us-ascii?Q?HCsmb15XIvKlIzSf6B4+xt7LF9Pc0yTWJofHvh9TqQikY1tGgOm5GwcB0csf?=
 =?us-ascii?Q?qMCw8h4uDingLmFdFs3FleBlmRfj8pEClTrryQ0fjoQVx0hKx16O6Ml2fbkt?=
 =?us-ascii?Q?VIbfKG9KatMcEbRmdZdYb0hAIEeActDjuzjwNz4t161WCg6U2mwS0Tru6sFS?=
 =?us-ascii?Q?Zl3NH08yyxNTo+G/l68phtdY9+ZvOH8dCubKNn2tq4tZjho/HFIMDb5u0iIA?=
 =?us-ascii?Q?m8K4VcCrZcHW8R9Xevsat+8TPE3Ml0ha43mfITWhPVxY8dbMd18y5N8e0D+Z?=
 =?us-ascii?Q?VzqvHrFBkA4D9IfDyvMxEvdVYE51MBo0nWR2nek1Ml68aFLnVHa3tga8fh0F?=
 =?us-ascii?Q?Hy/49PORqPc3G6H6qs8eeIY5+utWkcl7gaMHhjeJXAvb1v8K+4JHFtgltTj8?=
 =?us-ascii?Q?CwHQVwqr1ZN5cm82v77lHBuAj4MAr/jjZAPPZIEfhngODWAZkdgc55pe7GLh?=
 =?us-ascii?Q?/RBe9vSIRF4EQYeR80ruSzH2FBK+kvTeWWhuD7iWlkXlhH55oRIXVVoZd2qO?=
 =?us-ascii?Q?V8/7nCk+oJO/vvi4G7b2MHDRcB35JN3TC64t+KCTrDv4U9UTnRng0KAk4DUD?=
 =?us-ascii?Q?235EbaHltqzMAcMMNEOTJLHN7f+baGMePOFVVmcXTsGuE6743Z2J6t7Tw011?=
 =?us-ascii?Q?jEfUBKw3Xlx4UZEWamvO3LFDqU0O77f2Ypm2PXXtBm0K77sh/q2PY9bLDC9P?=
 =?us-ascii?Q?F8XRaDU/FImxND9AVV8UitOP6VVjpLbTe7nLbjGtL6g57mGFWdUmdZSTrvyE?=
 =?us-ascii?Q?7FFzZ4gtqkxoCv87IAjY6sPSFB9ycOby4aRce0sAmx1luMkQtZVEqsGOnNjJ?=
 =?us-ascii?Q?IymkRcXH15c4ZI0nXWrR1IuNhefnwOQze6/VTA+hYf/QPfKKJwM2BH8ufzii?=
 =?us-ascii?Q?LQf8gsEVNm6ViCiefEQtJbYYUzL+LxyKOWbjKWTzsIC6BL8iZY5PWjqPa2ij?=
 =?us-ascii?Q?pWZL+5dYtxo+PpT1/vMEakmF/qNL/swTXwt7gg3Z4uXx5W+duu22Un0IX4y1?=
 =?us-ascii?Q?pkdGJ616Dbc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nA0KAo2HWxNPo/inyq6U3QvkJZTQaQonmhrLtxx4DWhgqOi6PbVo2yb+4IJQ?=
 =?us-ascii?Q?NCs4JmEU4HT2bpkez1O1gxTuSWcp9K3JlGTwfI9AZXhMM4j8O5mn2qRahnRI?=
 =?us-ascii?Q?dyyx4IGz9AYCaWqSrZX3UwO4KczgN1MXKd8DW+zYuqDG1LQO7Sx5CafrzSsv?=
 =?us-ascii?Q?SkBeksURvio2BxHfCCg58k9BUEyUkRKxdM7/sJRSChb0xToGWMMgU80zzUo1?=
 =?us-ascii?Q?5bNKUWtd0b9OEJlricjouNM1uFcQlFy22MSGvrlsYplUj0fw4z2MD5FKg07O?=
 =?us-ascii?Q?tQE1T1LO6CH/NNufZBioGNgeUi+R7ZK9uIU/kgS1T7ZeI0kf3NcRdzaCSnLS?=
 =?us-ascii?Q?l/jrdfYvKMH2BZCo1kleZ1kQH3eZCxCJisl9Pk/DmM4rzj0YX1QK8kNlowQm?=
 =?us-ascii?Q?qFSMhirIsgyY54ZbhK35NWzJOJN7+SHwTQBvPQ1fLjd7ww85VkoqtcCU1lci?=
 =?us-ascii?Q?Ynv8r/gXhW6nx8EnElZgMoUmrHXUPY2vwcoDOV++MSy0JcWkLSW6xsz1inaU?=
 =?us-ascii?Q?QPvSqyHDi1P8VcTk8XwLlFVR7/rl7PoyzYSRh4ie7scu1xtRi5jWTdKpQlxe?=
 =?us-ascii?Q?zBSkK3QowC13zw+gtcJFv4mRKWTl0BGw24AFcsmbwkp+weUtOw6oOpyMJ9OI?=
 =?us-ascii?Q?aZKneIRDS7R64MGJgmYzt5V1VxHEw7KxiYWNcfmgO4hJJfNGgTEZ8bnzNqdG?=
 =?us-ascii?Q?5x7865EDM06RytbGUlFQQICVMWRXHeSfomWrykZVSq3YX9MxqmpzB+nzdtuf?=
 =?us-ascii?Q?SZSvSkyvFLCpPxteOU9mSv9D8fEB/JI9KNLUTsquAfDHVISONxzfeAw7EbIb?=
 =?us-ascii?Q?uAeBvCGz0q+qePWrD6GEJJzL/zXZ9Ef5XLli9Fc8J/10M4EFCHru9IvegMrh?=
 =?us-ascii?Q?f4pK7y7GCE1s1yLqbzZO0dYr3l038YYCwYuFFUfM/IQDn7YVewNkTC08triG?=
 =?us-ascii?Q?MteBOQOwW80EmnWl8fRFNpBgTeh/kdFYvJvU32cBexdwECOI4/2XvLJ8vZgT?=
 =?us-ascii?Q?hZi+AxvbcaUMTCb0BDkPu3y+IrsWFIEg/0LXJqXY0fTZYZaiQN7uBGNBYzPP?=
 =?us-ascii?Q?g6TPh7ee12fhAkB+4fXK0ONo7g+fwjGhx+bLKgj7oPXVU3Yk46n0jPfwLrPG?=
 =?us-ascii?Q?8R5+xwDSXmS0/cqZHZhTrYeCG/gar6g9rBGztm8u40TrUMnBBFLRgk4/XHG3?=
 =?us-ascii?Q?PpcwfRDOCn2jfS/UVmiRgdXGx5CWs6RJGu4gCz73x8e1i2Lh7bO+dyeoTBBt?=
 =?us-ascii?Q?ZSDvLTFs7y4LF4GEKZEOPewV8t59KeUR6HhZ03aSjmLHH1CKqKSwLkfkcLo4?=
 =?us-ascii?Q?YHRJuOtmsIl0lyRK9MBf0ujTsMlvN+wtZ+IkGXBxOEM5WnjcEB5lm4phgmB+?=
 =?us-ascii?Q?Zl2VVQ5s2CZ8n+LHAuEOEU1InQPI+gZCN/mXIcIg0bPQcmBn2WvLFID70HHA?=
 =?us-ascii?Q?FySyL7IUWYlRFKaWlOFtbfNqltcWKWT0BKWng4o6751Lon4Ooz05fXeTsG64?=
 =?us-ascii?Q?lvuKpPlxhO36pTmf/USdiM1Qv1jlzDhSvyI48p/A9+y7TtBzz1jcrBKdAJJU?=
 =?us-ascii?Q?FFv8IFlmBjdrvOvAFFySMHSetu/NcVnXCxgMjN7vMKpiRdRC3b5OyVV9ULQj?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a5nETDkqnZlq4ZHAuiSzzMtGQx9V7f/rYXLwhOnJPpGEdc/tbn99m4vC7u0bC1ljCmR6cJ+NBFouAfluzlgVtPeESLXtU3Y5/IwW0RueIHvVPmiNWKFkcPyDuE7p+ca6jz2zjveA9zwJ1nirwY0Z5fp8poga2ok8gO4+61KoA41V0D2PF20FhwloCbwS3d4ugv0/QFNo1HEC/yvhSbGo1Sm0Y8BWclKS+vgbFxRjQr1lY4f4nagYk1rLm7/7KWpjsGPvjlYeIsmXjJB2wl0XVPsEkcX9Sl4krpCNLUNAbX0YblnEK0xPdgiIUNavqOmGBJNn8ht/1hoKN7grApAzXZA1TKvW/+55+zLgJwo/9JsVkBI1mXHbexxHFtwLgd2IqaMabxeoikp0WYyAYhxkBeaA9S3ahBom2rdZX6ETs+BaVIVKcMNO3kO26dq/5Ndda1J1ZI9O3Qc9LSsC/oyMmpIwxbCAgEkhNmwBDhmBwlMTQ4FRyKUKyFOVDe5+dlGGcGj5Ng/9gv78BGv3eiF3p4U8TmWytW63uTa67az9EN0q7lq+SfVeFflUQRUwOl2QkgELbKGS0bQexiOSrm0Gab9wlDeLXQrlzMP9RqCx8Fk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7159299-6a4d-40df-85d6-08dda2ce7b0b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 18:43:06.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqB22Vf/tlwrpkFYQ209eyfVs20n3+f/g0TUKm20sH+C824prPHpaHjQPLobCthGhFUdWoXwguHOb3scn+8+zfvsAcEy4+IOjOJ4itta4g4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6429
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_02,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506030163
X-Proofpoint-GUID: lUX2BesDZsG_imxYNHBFQClB6hvCsKu0
X-Proofpoint-ORIG-GUID: lUX2BesDZsG_imxYNHBFQClB6hvCsKu0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE2MyBTYWx0ZWRfXz/SX/R5124W5 01zTjuugZyLCiwa2d7gjj2pLEW05uee5Jim2sC9OCRbOhBNJPIAS4bov6PKrgAG1GSYXRcLvN6i Cbnh9JSvoK9CoFgA0VCaK14/KRoUkyRShDWpedzwAcnt28N/IbyawYSL+KZbmsIjKWeZ4NFYCqg
 gyECR8MvKjY9aFiWRcs68MxfNbimjH7Z/PjKhyyQkAyVNZDVivCUrS1eM47IvJHmbVGS5su/XYK JvvABboR5bFiPCXr6WbMvrUdpasuy5isIL65YQ5OSy0Jozi9+LWbtgIEmlBMlgX/295dMFMz0/A 76AJwFSlfmWevhx9w2UETi24rJ9iYz+XbkntGOXypslT5FKKYUONgMDwSTlBouiv1lhx/W9cCUi
 bWtjcxd4x/mj/Mre/x/mvPe6U3cHm2GoAW4FeSI8fav+hgU/2fKS+302h9irwBJEWCVd+eR0
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=683f4257 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=b1CwStuDcq3lc2Qzpt4A:9 a=CjuIK1q_8ugA:10

Hi Barry,

As promised, I enclose a patch to give a sense of how I think we might
thread state through this operation.

There's a todo on the untagged stuff so you can figure that out. This is
based on the v1 so it might not encompass everything you addressed in the
v2.

Passing in madv_behavior to madvise_walk_vmas() twice kinda sucks, I
_despise_ the void *arg function ptr stuff there added just for the anon
vma name stuff (ughhh) so might be the only sensible way of threading
state.

I don't need any attribution, so please use this patch as you see
fit/adapt/delete/do whatever with it, just an easier way for me to show the
idea!

I did some very basic testing and it seems to work, but nothing deeper.

Cheers, Lorenzo

----8<----
From ff4ba0115cb31a0630b6f8c02c68f11b3fb71f7a Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Tue, 3 Jun 2025 18:22:55 +0100
Subject: [PATCH] mm/madvise: support VMA read locks for MADV_DONTNEED[_LOCKED]

Refactor the madvise() code to retain state about the locking mode utilised
for traversing VMAs.

Then use this mechanism to permit VMA locking to be done later in the
madvise() logic and also to allow altering of the locking mode to permit
falling back to an mmap read lock if required.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 174 +++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 127 insertions(+), 47 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 5f7a66a1617e..a3a6d73d0bd5 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -48,38 +48,19 @@ struct madvise_walk_private {
 	bool pageout;
 };

+enum madvise_lock_mode {
+	MADVISE_NO_LOCK,
+	MADVISE_MMAP_READ_LOCK,
+	MADVISE_MMAP_WRITE_LOCK,
+	MADVISE_VMA_READ_LOCK,
+};
+
 struct madvise_behavior {
 	int behavior;
 	struct mmu_gather *tlb;
+	enum madvise_lock_mode lock_mode;
 };

-/*
- * Any behaviour which results in changes to the vma->vm_flags needs to
- * take mmap_lock for writing. Others, which simply traverse vmas, need
- * to only take it for reading.
- */
-static int madvise_need_mmap_write(int behavior)
-{
-	switch (behavior) {
-	case MADV_REMOVE:
-	case MADV_WILLNEED:
-	case MADV_DONTNEED:
-	case MADV_DONTNEED_LOCKED:
-	case MADV_COLD:
-	case MADV_PAGEOUT:
-	case MADV_FREE:
-	case MADV_POPULATE_READ:
-	case MADV_POPULATE_WRITE:
-	case MADV_COLLAPSE:
-	case MADV_GUARD_INSTALL:
-	case MADV_GUARD_REMOVE:
-		return 0;
-	default:
-		/* be safe, default to 1. list exceptions explicitly */
-		return 1;
-	}
-}
-
 #ifdef CONFIG_ANON_VMA_NAME
 struct anon_vma_name *anon_vma_name_alloc(const char *name)
 {
@@ -1486,6 +1467,43 @@ static bool process_madvise_remote_valid(int behavior)
 	}
 }

+/*
+ * Try to acquire a VMA read lock if possible.
+ *
+ * We only support this lock over a single VMA, which the input range must
+ * span.either partially or fully.
+ *
+ * This function always returns with an appropriate lock held. If a VMA read
+ * lock could be acquired, we return the locked VMA.
+ *
+ * If a VMA read lock could not be acquired, we return NULL and expect caller to
+ * fallback to mmap lock behaviour.
+ */
+static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
+		struct madvise_behavior *madv_behavior,
+		unsigned long start, unsigned long end)
+{
+	struct vm_area_struct *vma;
+
+	if (!madv_behavior || madv_behavior->lock_mode != MADVISE_VMA_READ_LOCK)
+		return NULL;
+
+	vma = lock_vma_under_rcu(mm, start);
+	if (!vma)
+		goto take_mmap_read_lock;
+	/* We must span only a single VMA, uffd unsupported. */
+	if (end > vma->vm_end || userfaultfd_armed(vma)) {
+		vma_end_read(vma);
+		goto take_mmap_read_lock;
+	}
+	return vma;
+
+take_mmap_read_lock:
+	mmap_read_lock(mm);
+	madv_behavior->lock_mode = MADVISE_MMAP_READ_LOCK;
+	return NULL;
+}
+
 /*
  * Walk the vmas in range [start,end), and call the visit function on each one.
  * The visit function will get start and end parameters that cover the overlap
@@ -1496,7 +1514,8 @@ static bool process_madvise_remote_valid(int behavior)
  */
 static
 int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
-		      unsigned long end, void *arg,
+		      unsigned long end, struct madvise_behavior *madv_behavior,
+		      void *arg,
 		      int (*visit)(struct vm_area_struct *vma,
 				   struct vm_area_struct **prev, unsigned long start,
 				   unsigned long end, void *arg))
@@ -1505,6 +1524,15 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	struct vm_area_struct *prev;
 	unsigned long tmp;
 	int unmapped_error = 0;
+	int error;
+
+	/* If VMA read lock supported, we apply advice to a single VMA only. */
+	vma = try_vma_read_lock(mm, madv_behavior, start, end);
+	if (vma) {
+		error = visit(vma, &prev, start, end, arg);
+		vma_end_read(vma);
+		return error;
+	}

 	/*
 	 * If the interval [start,end) covers some unmapped address
@@ -1516,8 +1544,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 		prev = vma;

 	for (;;) {
-		int error;
-
 		/* Still start < end. */
 		if (!vma)
 			return -ENOMEM;
@@ -1598,34 +1624,86 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 	if (end == start)
 		return 0;

-	return madvise_walk_vmas(mm, start, end, anon_name,
+	return madvise_walk_vmas(mm, start, end, anon_name, NULL,
 				 madvise_vma_anon_name);
 }
 #endif /* CONFIG_ANON_VMA_NAME */

-static int madvise_lock(struct mm_struct *mm, int behavior)
+
+/*
+ * Any behaviour which results in changes to the vma->vm_flags needs to
+ * take mmap_lock for writing. Others, which simply traverse vmas, need
+ * to only take it for reading.
+ */
+static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavior)
 {
+	int behavior = madv_behavior->behavior;
+
 	if (is_memory_failure(behavior))
-		return 0;
+		return MADVISE_NO_LOCK;

-	if (madvise_need_mmap_write(behavior)) {
+	switch (behavior) {
+	case MADV_REMOVE:
+	case MADV_WILLNEED:
+	case MADV_COLD:
+	case MADV_PAGEOUT:
+	case MADV_FREE:
+	case MADV_POPULATE_READ:
+	case MADV_POPULATE_WRITE:
+	case MADV_COLLAPSE:
+	case MADV_GUARD_INSTALL:
+	case MADV_GUARD_REMOVE:
+		return MADVISE_MMAP_READ_LOCK;
+	case MADV_DONTNEED:
+	case MADV_DONTNEED_LOCKED:
+		return MADVISE_VMA_READ_LOCK;
+	default:
+		return MADVISE_MMAP_WRITE_LOCK;
+	}
+}
+
+static int madvise_lock(struct mm_struct *mm,
+		struct madvise_behavior *madv_behavior)
+{
+	enum madvise_lock_mode lock_mode = get_lock_mode(madv_behavior);
+
+	switch (lock_mode) {
+	case MADVISE_NO_LOCK:
+		break;
+	case MADVISE_MMAP_WRITE_LOCK:
 		if (mmap_write_lock_killable(mm))
 			return -EINTR;
-	} else {
+		break;
+	case MADVISE_MMAP_READ_LOCK:
 		mmap_read_lock(mm);
+		break;
+	case MADVISE_VMA_READ_LOCK:
+		/* We will acquire the lock per-VMA in madvise_walk_vmas(). */
+		break;
 	}
+
+	madv_behavior->lock_mode = lock_mode;
 	return 0;
 }

-static void madvise_unlock(struct mm_struct *mm, int behavior)
+static void madvise_unlock(struct mm_struct *mm,
+		struct madvise_behavior *madv_behavior)
 {
-	if (is_memory_failure(behavior))
+	switch (madv_behavior->lock_mode) {
+	case  MADVISE_NO_LOCK:
 		return;
-
-	if (madvise_need_mmap_write(behavior))
+	case MADVISE_MMAP_WRITE_LOCK:
 		mmap_write_unlock(mm);
-	else
+		break;
+	case MADVISE_MMAP_READ_LOCK:
 		mmap_read_unlock(mm);
+		break;
+	case MADVISE_VMA_READ_LOCK:
+		/* We will drop the lock per-VMA in madvise_walk_vmas(). */
+		break;
+	}
+
+	madv_behavior->lock_mode = MADVISE_NO_LOCK;
 }

 static bool madvise_batch_tlb_flush(int behavior)
@@ -1721,6 +1799,8 @@ static int madvise_do_behavior(struct mm_struct *mm,

 	if (is_memory_failure(behavior))
 		return madvise_inject_error(behavior, start, start + len_in);
+
+	// TODO: handle untagged stuff here...
 	start = untagged_addr(start); //untagged_addr_remote(mm, start);
 	end = start + PAGE_ALIGN(len_in);

@@ -1729,7 +1809,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
 		error = madvise_populate(mm, start, end, behavior);
 	else
 		error = madvise_walk_vmas(mm, start, end, madv_behavior,
-					  madvise_vma_behavior);
+					  madv_behavior, madvise_vma_behavior);
 	blk_finish_plug(&plug);
 	return error;
 }
@@ -1817,13 +1897,13 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh

 	if (madvise_should_skip(start, len_in, behavior, &error))
 		return error;
-	error = madvise_lock(mm, behavior);
+	error = madvise_lock(mm, &madv_behavior);
 	if (error)
 		return error;
 	madvise_init_tlb(&madv_behavior, mm);
 	error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, behavior);
+	madvise_unlock(mm, &madv_behavior);

 	return error;
 }
@@ -1847,7 +1927,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,

 	total_len = iov_iter_count(iter);

-	ret = madvise_lock(mm, behavior);
+	ret = madvise_lock(mm, &madv_behavior);
 	if (ret)
 		return ret;
 	madvise_init_tlb(&madv_behavior, mm);
@@ -1880,8 +1960,8 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,

 			/* Drop and reacquire lock to unwind race. */
 			madvise_finish_tlb(&madv_behavior);
-			madvise_unlock(mm, behavior);
-			ret = madvise_lock(mm, behavior);
+			madvise_unlock(mm, &madv_behavior);
+			ret = madvise_lock(mm, &madv_behavior);
 			if (ret)
 				goto out;
 			madvise_init_tlb(&madv_behavior, mm);
@@ -1892,7 +1972,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		iov_iter_advance(iter, iter_iov_len(iter));
 	}
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, behavior);
+	madvise_unlock(mm, &madv_behavior);

 out:
 	ret = (total_len - iov_iter_count(iter)) ? : ret;
--
2.49.0
