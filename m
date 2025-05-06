Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD9872623
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538552; cv=fail; b=tAE4URmo/VzFLNtwv+uH72VkJCkF5xM5ygn6y0jnx+D/lx7AiCZ0bVT1TkHzGXlpYtDr4n4rLl77eg55cRIFQMOJ4H5XaRGWuqPmhD3KUAMAcxJQ3QQxed8wG+PX1/tthf+tLKbVY9loqbQM1hSgJvmgQHhsclUjR1OVnOIRguQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538552; c=relaxed/simple;
	bh=oGMA5602lnrOoCbvYMTybzmUYjGUPjeiyLItSVLx01g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fvh5IFad6XXr7C54c4o4Bj5Ed+Q6oLcpUIP46g1U1DiORKL0nTTAbJyVPGsTLvEArQZbKpnPv1grpi21hB/lo1agPgIHvBXo6IbQg/1mCbFNrbO64sV8f3cIUDminMsDkpBFXEXKPsnQ1bwTplGPq5m8RtBm6rZTT4p9ZohcWjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EILKXHyD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X+jI4mA4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EILKXHyD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X+jI4mA4"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546D7aFw015071;
	Tue, 6 May 2025 13:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=k83A2jOyRHi/v6PV7b
	+SA3niaCdCjFiKBv9ICxOISjs=; b=EILKXHyDmSwZPLzB6HdzUqdId1PJb6ubpe
	2ZfYY47j924pbHq1WRjx6U9iQtQo5O8RZfuZUbjbeBHRTQRQU9u0LeNdcpFYFoST
	bIBQT+JPW35ZWvg5/UBV1H8xJArOvvVLiVScExXMe9KnwYIOCcag/8pc0LD/1Abe
	+9W5OLZWxadqkzhuVDVO/44pC7LL9VfmpZG9UQiG3p8ILHqz7ieOF1NjIAeURrUE
	+poBMQzYtag71Pt5fSz/sCHWWlnihadCJ570IV40SgOXo7ISHjJ+JMpPNxpoi1Ip
	5UaEZ5JZiVoxcW3JmPC5dzgbLjRt530/vshsB5sXgODVJVEA5WfA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fk1cr203-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 13:35:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546DUaUV036150;
	Tue, 6 May 2025 13:35:04 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010006.outbound.protection.outlook.com [40.93.13.6])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k91676-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 13:35:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sdd8TPmYvp51Aykh7wUlNAplcJ2RTHXC46WsteoJAs8fxM3Ro+yPublpHMwsWGR2DjGNF0trbMsu6aaSr7b6g9fl/KKnZkNJrbPPbCoagUqnO6lGzhR8C0/I8NVUvKd5Dhg/vOXYvdIwgyp8zU3L3/c0WF85tL0g2UTe8J4Hq21Tu854r8POBmWr0m3OvbEq2Eip228yWSHapDPhJIDnoplpabkXVzbEgVjbEh8ChGHSpeYagd5tgD8yw2PjRFF1IzU/pdxqSaaoLyYNieadk6rnOC5LcCLXINMxS9q5CNLPV/QX7q6aWol1AKU1eqseiEspO1/Dvk90N00vKuOX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k83A2jOyRHi/v6PV7b+SA3niaCdCjFiKBv9ICxOISjs=;
 b=BMTjRRB852uGTQbt7uh3cCVOsl0F0WU2oS+/WSK8qxsdxfNqhNHQSXFPLXOy/TAukyaPP6PSYcTt1CjmijZy6cMZ39K5Duv9s2L7Tll2DPEcCaVEzq33H/6fZY8M7UPtNxIYWmHzSGzNaZgMyVqFzwH2ZNpv5a1JJ6gj1MdYhm2TSBf81Humgwmp6fQft5RkbDyC1Ul92LflYhat684wGncHELm9UafAZgWdpkCxGreETwm2P5FTH54Jf8hkDD8dfS4tDc+ILxd/P5olW5EXYkv9o0tnUkD6koyn4bAjJWBtezL53wqMAZs1C8o5iRBcU2agNCE3FHL9WwjpUqpCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k83A2jOyRHi/v6PV7b+SA3niaCdCjFiKBv9ICxOISjs=;
 b=X+jI4mA48hYH2Fq0Q9HIv0cIF5sZkdj5fl3bq620Zi6MyeqTNYnZ43wJZls38okgVysgfVM/s6p3IUfUI64KSWvCTbmTl3ZmLChmb/S2TQFCQLio8PMIf+8n2oiO+DSOOnpq5ESmtYp4F6XhLnZoZttgsIkQvgm7cifk/1v/Tio=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB6420.namprd10.prod.outlook.com (2603:10b6:303:20e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 13:34:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 13:34:56 +0000
Date: Tue, 6 May 2025 14:34:53 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com,
        mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
        zhengqi.arch@bytedance.com, baohua@kernel.org, willy@infradead.org,
        ioworker0@gmail.com, yang@os.amperecomputing.com
Subject: Re: [PATCH 2/3] mm: Add generic helper to hint a large folio
Message-ID: <f66a7550-1e57-4a72-848b-e1c07c896818@lucifer.local>
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-3-dev.jain@arm.com>
 <f960f7c2-465f-4b18-b0b6-3db4a12104d2@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f960f7c2-465f-4b18-b0b6-3db4a12104d2@arm.com>
X-ClientProxiedBy: LO4P265CA0241.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 469f9e03-0c8d-4954-80e9-08dd8ca2ca94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?14QGspoh8HRrMus3O1YN0t0vlnnDBkKXZcSzJPv3DyR26ghjwei0sCOp5cpi?=
 =?us-ascii?Q?nk1ELsVowHWWxGT6TG54kLhT/qlt1bhyFqYmtbjPcDKQJyhhRsSJ8VbPFwX9?=
 =?us-ascii?Q?ZZ9QsmnbSPCIu08rNSUVGBK5sg/cO1ToW+stKTwV0cTxg/C3eb6l+vXYRmLL?=
 =?us-ascii?Q?X8lJhDND5BYgRMeo+NOnCAtUTc93OK8tZcUyC/W8HuyMcaXSnjvjyRHzTKXB?=
 =?us-ascii?Q?mEj9I1FBOmq7uCcCTf5jxHDh6ifsbfyetNUgI8GsZYROPtF2mW/WzLQNJEuj?=
 =?us-ascii?Q?zfBM4b1I9ZJE5NcUj4J52smRwOlyIclxGnbbKUW6zW9fGvXf93hboKAS66oc?=
 =?us-ascii?Q?HfwLzCJBfl03wC5r+AjvdqbWMMgiJ8PZBcQPEf0DWm9tp3htBuHpg1inxdUN?=
 =?us-ascii?Q?fUbZ7xZRA/5qyiopVpqQHN9lcZy/b30JJHBgmflK7g9iCnYlV+mmzB7jBap6?=
 =?us-ascii?Q?fcrRkYcufGLvr7KbmPd934cb9fTQYLFNmeyhoOD8obJuzk0H6rjMGSbAKbj0?=
 =?us-ascii?Q?fB8l6J4SRGeM0YIPBiUq7WEteUpxJ0zngw9Hv26agG03Drj4g1uz+dxcHCKO?=
 =?us-ascii?Q?Gja4ukfYVlFpklwgM0C4fuQxT4k+wO3vdGfsiOc8WI5sxmdPbgSbgBfDDpJW?=
 =?us-ascii?Q?uQHtqsHo8dJilNdypkjaP51TyaApmmRHdX4Er4l+WZO1Fv4bUCOFevyM/YHr?=
 =?us-ascii?Q?QarHUvVAguXDE8A8hhWQR+ORMRPY4ynwfjWJ0MUSyPbTJU+xKm3pTqJA1U72?=
 =?us-ascii?Q?0kxomMty7NNFdLu72B9vvBoI8FOitDRz7YNoccXF6WG0CHMyG7AHmcxM5fT5?=
 =?us-ascii?Q?kp9O4S953XS+wr14TGDcAgH957b1j6eMkFgeCBWoD5J33XtvePFbIoyZbHcz?=
 =?us-ascii?Q?vCHHw1xHidL7ezfx8tL/MKQa43flKm1kRJNbeRuSPSbJ2ZS44HVt9SDSbSMl?=
 =?us-ascii?Q?UaGxFdxyKsSQH2qsF36gTdUzs+kMWjE8Q0bBjcrgcSOxw5qrfYUKYmUvJgdy?=
 =?us-ascii?Q?7iSYEam92EMndepCk2+EcD2zWhb0hDSkTyQi7dICs104pjaO5b9/t/wc6x6J?=
 =?us-ascii?Q?EFTtF8ko7t2P7tTKCbL+O4ZVAICNSTuwHKc/QJvWGW77NVUIuns4aSl60ZXs?=
 =?us-ascii?Q?LBx83LMm2CNwAHHbhgyHQW2+zz9+IGIBXCiELm/Uryrrswd+MHOQ7xt7vH+M?=
 =?us-ascii?Q?RzatWzNMMcOZmLVw1BOExTynmHChD0Kv1CN7IXPtBc1WtTmqOvn8HFEIALvY?=
 =?us-ascii?Q?98JM3IlFPOxApuzMv8RIgDDDw/dj4cCNBVchYlF6rzZ9CrMTlwLl03hVP7pR?=
 =?us-ascii?Q?mk+HvU4OJ4NQqa/vAs49plnTepKO08vc+6vT453puZss3AtSss8ZpMcKT5NF?=
 =?us-ascii?Q?VE/HX6FQ3jRwJId/a+6h+3Dh9x19PfgNTjxZ5ayyuHHHbmjcxYr8O4V1TKFx?=
 =?us-ascii?Q?We3f0DfBe08=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j1Bl0S+PrFcNgYoqaWfiYcAFq+PAmaYmRLcgNtexVLl2cHNiTpvOTcqwd2wm?=
 =?us-ascii?Q?NAjXtNOo2ssPHOb9ka6AyTTUoPNNo5EUED+AYmwjfHXzK71tyt1k31DTkjXM?=
 =?us-ascii?Q?nsgk0u7xitjRztB1dYdea8FeffPtL3ZX6xECqK/3K6rjHfFEoAyCg5akVcKE?=
 =?us-ascii?Q?L/ZgTmvWU3/MhK5Z9n7pvqvHkDnZ3mOWqTeqjGj9EjcaO/lTYWriKaIMh3Ge?=
 =?us-ascii?Q?Mkxtycl5W/Bu/e4Utl1YKecESxIKe9jNXsgGv7VCSC5cI/12UV6ADyR667pI?=
 =?us-ascii?Q?ugNjONmnHzPRtEIHhtxyYCpgPnh7OPK8E3o3avJdm91tJqBGGOk6fFBrkLSO?=
 =?us-ascii?Q?L9SoDic09vz4nlxbs4xrHKPN5NlF/TnyvPZKvFcBLg1mhGeV/0n6Korjp/qE?=
 =?us-ascii?Q?zjNrpwtUr1Nij/vccjW84PG33bKjEHRoTS5nTCPtFvdYszTCtUPZp5Th4Xmm?=
 =?us-ascii?Q?jj+KEHlTzWjLcxlWEAzbpA/5jCZo0Js32xMtUelCQAa5IX90aDUa4Hyh16US?=
 =?us-ascii?Q?Ig9HQJYPSMjCHhyUeaovld+O2l2E/DWELR9aILI3avok0vIC7ieLVsIHBKWk?=
 =?us-ascii?Q?sxWHbAkWlBU9YFUkKxv90KbWCTZHzbCrykLySQ5dYa/BGWaEuddZscURqid1?=
 =?us-ascii?Q?kjFRPHFB4M5Xghjm7qGyyE2E9LDqJ7AJd5GmugDcuyorwzNQs1BdGJjrr8tx?=
 =?us-ascii?Q?dWeefslBRpUmR+UbHAcFXRiKJIhNn1RS2QC4DFiOnLOyOPnmG9uak2IrboGL?=
 =?us-ascii?Q?iXi3arhTAAPCaoi5N3Xu5JsoOtYU9CTu6g1Y0e5u0hyA+o75aD5B0CwlfpKh?=
 =?us-ascii?Q?e0qRoobEUxEGOZwlofpdQRBkPAt5pLLy+YsOF2GBKtvfzj9xNFmg/oeCTFbf?=
 =?us-ascii?Q?plT/llxQWcBTRp9lCcm+KtFUDPheWaSUWiJ5V4FjesPAA6sNganKLZHQ797r?=
 =?us-ascii?Q?qbdjIAEtu2cosekcTuOEPscJQmHJhYwVw/7xbZhUuqmuWgDGrS+3NZ1PGF/n?=
 =?us-ascii?Q?yyQ+Md504ZGdjARvPcHYcPBd7VttgFoVd4sFjtKYI1lcQ0MAA/KubRRdAK9R?=
 =?us-ascii?Q?3EYNR3JrDfEdv/AKVz8jMVqU2ia0vCbJgdEN/Tq4xlCY8hjyCpbeDHzRqAoh?=
 =?us-ascii?Q?Rc7Mnou+uyfRhSd8livtrcpzafQFLZZKYvGqAsSPegIk10X7DxVhyHI/A9we?=
 =?us-ascii?Q?qpVzFaiYsTpYyLeB+jmy1CSFBs3qT7qJ6NtyYloZs7n622QsNkr8m5CN4gKL?=
 =?us-ascii?Q?cwspGhrxXNzDs15LKwsexjsAjjf8qFRV1Sf5ozn153SElmKk9qY7i7jvB080?=
 =?us-ascii?Q?Ez1dnAtMsH2no7jDjVeV86nFUJQTL+8Lp8VVf0z3+ba5SZ+vieq1nUJvOVuK?=
 =?us-ascii?Q?fkmTic5jb/4nAe9B7tRQIl5K3GqHigIZ8oVHxDZKXneM1zxbIBSCpx3pBske?=
 =?us-ascii?Q?1rEGuzkMU6qrjVR7dbAUMYD7RWjsHGS+ZFAaMmsQV1d/s4M3D5a3eNI0Bsst?=
 =?us-ascii?Q?9o3hggAHyP6sAaCPyv7MuqNLEnmFJ3M0KR2wd/OxCUF+8sCJRanNcoOUUNXP?=
 =?us-ascii?Q?25AjekkS8Koj4Mqp9Xw2PgiEpFv62hMKnkwhgL9ySyvSAaEA7MKwk7t0cxjI?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HSxhhrHNRnKd3vj/0RDZJSkSRBXWe8cwiPb2enpkYEn2wGiKX8MbUJltMeJ+EUy95b0rJrhbcqDBagRnqrk6Rkmoy3lOPvbwEWMIfxBYOcQDPp6gWh9igfxOAYHiUF39gSmaRdq6k9qkBHQ9S2YXSbTxkvVN4nQ4e1m3Fo+RmfSoP1XW/5Rq+Thlc1KoOJDNSB+kblwdcMzbxu2vM1WNomXZCivbGR4lJ39ZjWqzpBQS74tUcV7viUByBBmaNlrY8rcODvh4L36FwgAHlnw349bf43frHbdDQbzdijjrb/is5ttwIXan/HQSVlf/D9xoyMNfdXb1tFo5HZDA8f6VuYAslN10k2CKC3O1YmJZHatOEGJ0ltE6uXTPEv5+Y40TNlPgL4nnZVjDxvRkYEGkLeac2GO0iY0i75NUCpEKo07aa10DPunKSUNd3h1gVaIz5gZj7EavOXoyqmhG4Lp8+9HZJf3anU7CDCHr4LyFIS5JdfKZio75kLwLirzEZtCjYtjXshDHsZJonADgSLEVzshFlMHHL0h/hYbUp7TQCs/pmL+4nJ7YquY8ZEhqwA8YwkaXemWWYFHf8n9wIN95luN3woFZO5t+8z40VxDHOEc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469f9e03-0c8d-4954-80e9-08dd8ca2ca94
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:34:56.9069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jZzynhOm2KrQBiaOeGGSo8kgDpmg2xIoX6I8qw3yLYi2+6TcD26yP/0gUc/NnMYzZPx6Syhix9cwNxYW0P5Dhp5j88WxZiP4dBnf4pxtgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6420
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=938 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505060131
X-Authority-Analysis: v=2.4 cv=Q/3S452a c=1 sm=1 tr=0 ts=681a1009 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=Pt77KK4D8ZcsnSGg2u8A:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEzMCBTYWx0ZWRfXyAmsfhr4XldP qLvbViKuRNf6siMf6pukDJl4ZiUCpYH1BSz46EbhELrdDbFE2xNNXJeD6HuduV1N6Qg0tFkvmtm VgAUK2D0liAb7L/8UktbUj1QbZ0ba6tz4gKadiabKfd8PaiwK1ttdmr9C3+zUb8RiTEW4h4C2r5
 WNPxjTE0fzOpFM68BJCGeVlrhL9lojKOaYCxVRRDKwWtbdRPVG3l0UxYjWjVcl9WFb7RP7kJ8Yc FnBrRn7JhG8FVxAkOBv1PM/UXOqlHyF1+lH1c2jPbHNcXIAYmFQDIyrp++iniHJJtqJFCFlkhtr hQMdqvnSGCkZRfz4KvGsa2s0AtG7hzAd45keRU6CqMPRV2hrRw+UZTsvJ1l7HL5NI0sKEXTOFsg
 P0Id4jx4UdHYN+0KsQZejaoYcFdgzyolNvKA2P7Laa62uDP/qZRgZFiUm9arGcc/6C/ubfVL
X-Proofpoint-ORIG-GUID: 0AW5gb_cAj18j--q_ONESUIryBB4gdgo
X-Proofpoint-GUID: 0AW5gb_cAj18j--q_ONESUIryBB4gdgo

On Tue, May 06, 2025 at 02:40:44PM +0530, Anshuman Khandual wrote:
> On 5/6/25 10:30, Dev Jain wrote:
> > To use PTE batching, we want to determine whether the folio mapped by
> > the PTE is large, thus requiring the use of vm_normal_folio(). We want
> > to avoid the cost of vm_normal_folio() if the code path doesn't already
> > require the folio. For arm64, pte_batch_hint() does the job. To generalize
> > this hint, add a helper which will determine whether two consecutive PTEs
> > point to consecutive PFNs, in which case there is a high probability that
> > the underlying folio is large.
> >
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > ---
> >  include/linux/pgtable.h | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index b50447ef1c92..28e21fcc7837 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -369,6 +369,22 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
> >  }
> >  #endif
> >
> > +/* Caller must ensure that ptep + 1 exists */
> > +static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
> > +{
> > +	pte_t *next_ptep, next_pte;
> > +
> > +	if (pte_batch_hint(ptep, pte) != 1)
> > +		return true;
> > +
> > +	next_ptep = ptep + 1;
> > +	next_pte = ptep_get(next_ptep);
> > +	if (!pte_present(next_pte))
> > +		return false;
> > +
> > +	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == PAGE_SIZE);
> > +}
> > +
> >  #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
> >  static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
> >  					    unsigned long address,
>
> As mentioned earlier, this new helper maybe_contiguous_pte_pfns() does not
> have a proposed caller. Hence please do consider folding this forward with
> the next patch where move_ptes() starts using the helper. Besides, it is
> also difficult to review this patch without a proper caller context.

Agreed, please combine the two.
