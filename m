Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1BD26F477
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373567; cv=fail; b=qO1rjwxPIUnOaN9p2jpBiLOoid5Mijp717Y/ES+GZiTl6FVeATWswIeEf+zASsLi/X1wjmxw7YA7im4oO5RomG8/Yuh4JB4WjHJlYekOKPmdxIYnJwi84vr+HQUnc3LhduSiveQWS6bowtdko18+a41olfcqzhbXxVTvC6veij0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373567; c=relaxed/simple;
	bh=4P1ymbxrORbi/ZElbA4TAYtCH8VcMrfA0Zs5lvLuo+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VAo6BpbTeNqL2cl1la2kgf8hMhttVY1Ls46O7/hSUJZaol1whJFH7e2cxt8ZXjmZSuFOn+9I+dKddeRQMdhqTxYuwKuaHC0+VOzgNyDgLtZvqsIp0LoPXIW5+3Xpe6jwd5C1Yaqf6fy+auED4GqaGuFpvKdc0hW5x+PLh/cFgNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KWNzPBcZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MMB7KwzH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KWNzPBcZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MMB7KwzH"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561COdEb023930;
	Tue, 1 Jul 2025 12:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=4P1ymbxrORbi/ZElbA4TAYtCH8VcMrfA0Zs5lvLuo+I=; b=
	KWNzPBcZ2GQ7KT8RvwWLryKNc4AnPHb9jNzyzIcWOc8WobHtsx6gRt4jaqjUfoAu
	5pb3HtapWXjrZxWfDx+ItcqyyCePJWmmzoQPvRL1H1LzjbLA43GexiTFYwGt6161
	BLM+wlEoviJT8jTdy3fi36cBvHPh3iH11vMKhMnBOXSGBZ2orbHLlgWUngfJDqiD
	R7i66LUQw9GBtKSsC/UV1IKfmT77yk7sNrE6Qrroi6QjZW0lk8aWfGoT0KZE2bZQ
	IvBbf11jU8e9/iXk/Jsf+xXCCl6zh3y8vRd3tXrDfkYe0qfp1Zf03cWh1UYWKUJk
	5jd9fpuwBJq0GwdqI0frsg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8ef4pmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 12:39:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561BGpFd011459;
	Tue, 1 Jul 2025 12:39:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u9f7ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 12:39:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWfl7NgiwKgmDFLjDAsVFBj1aiiZRU9SmFXlP2drXHnvr0gSVXb/QZkTsx8q1QYl2RQUVSgQKLVxyavgdnX3216sFkgFsbEdkKxV3sCTdz9qSj5iw+hwmfmx0WH0naW5YR2ILAWIU+B8erGSm3l/T42C0/iO+Ly7sY01mudoi3IQkkup45sTYk6vrFm0QnJKA2EBrstJ9AXRvi+lC7tmCE5fGz2b7BAd3TER+OUC/lQlC3+RKZSidcol19qOU+Wk1Pm+wmxHfum3m6wLRE4vgAwkNMkBtwbRTKa4kFM7+e4stkXegdBuZUE+1V8yNHKPsIT6DW589H1PEXmK9LujBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4P1ymbxrORbi/ZElbA4TAYtCH8VcMrfA0Zs5lvLuo+I=;
 b=bdjng1g1fdYYjwSnS1DKGxINC4BUfQI+PNZOyMzwiUJZKNIXBevVi56/B5y1GzTiV9GiE6KuNMLZJ1hUzbS6akvWU2mbGBBaGrjAkZ1LA3nJ1pB5XnfNS3fp5u+7jTCjOvjDYL1YBfFQHt4lHVpsq8pQfZtJn2cXipdVOVDfof/wAbytS8gOaduiaCJKyF1MMh2fn38C0+xF90ZE52ogtvrLQ237w3utESOvVGmwvNGZ75z06B/5w6SJZyP2rhvJmo0pu4UWOibHPMXqv7W2cyyY2nZAzgCwCKHnFgc8AhUMMkQJOiZdIOzonB8W43UtK8PDJLmsMGv5iLJCoqGXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4P1ymbxrORbi/ZElbA4TAYtCH8VcMrfA0Zs5lvLuo+I=;
 b=MMB7KwzHF4QZVxaEcO4bCt5yMpWRBym+N0z3n25I8FSEj9CcxaQHicnpucemFMPDp3DCHPPtALsbLG1BoxSn+8Bq02V5mh4/ns/60LpMW4eQt+wTbGwJASSHbI6AUKkbsiTcEQiRuN1mNB6AO7cGKRVZ2YLL3jL2v4FZCkuYqe8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4462.namprd10.prod.outlook.com (2603:10b6:a03:2d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 12:39:09 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 12:39:09 +0000
Date: Tue, 1 Jul 2025 13:39:06 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: siddhartha@kenip.in
Cc: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, mgorman@suse.de
Subject: Re: [PATCH] mm: limit THP alignment =?utf-8?Q?=E2=80=93_performan?=
 =?utf-8?Q?ce?= gain observed in AI inference workloads
Message-ID: <5c3d307f-d303-48c3-b730-99a83d4815ec@lucifer.local>
References: <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
 <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
 <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com>
 <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
X-ClientProxiedBy: LO6P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4462:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa52695-1012-4f16-184f-08ddb89c46ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGhPUDM3bjNtdExqS09KV284VkRnNWtMVHRpU2Q1dHFoc0g1M1FSM2FYR0R2?=
 =?utf-8?B?b1hueG9jS3FKZ3VMZlZFTExGeHQvUHhCZDVMSitXZ1FOVDNZRk12K0Y1Sjgz?=
 =?utf-8?B?Q3hzbjhYU3RMWVppSGJ3RW9jMUNJQ3pJU3ltWHZlWU9TUFY1dEpOUTNncXk5?=
 =?utf-8?B?TGM0RVJJYWxvSHdWaUE3TWlUWjAvdFdkeStuRG9mYVY5WWcxTGdOemE3Mnlk?=
 =?utf-8?B?TnRxR0xtNGtyd29jSlZyREJxQWpHUVNFdHRMSEFVUnZYMUR5dklLU0wxU0di?=
 =?utf-8?B?aGsrZHVkZVFUcmU3M0JFQURVM2NweFUyZmZFVjJoRFJ4Z1JaaVluWmdIVFcr?=
 =?utf-8?B?UkxuMS9GT3E5SGh3eTNXR3JWUHh3bG1wVUtGUjZzYUEzdm0wakxYZWlBV3Ax?=
 =?utf-8?B?QklQUXFhb1Bvb21QY25QZkI2YWNBdGFHTlZLMlYrSnpmaExFOVJRUEFOdDVM?=
 =?utf-8?B?QVJhSHc4VSs4M1NiZXV0M0ZaeTRNakY1VGhEOVdPbSt4bFN2OWRHV3laTGpB?=
 =?utf-8?B?c3k0UlR3Y0VKTERnZFhhOVY2ZWVaZTBwYWVIZk5SNGFnU0ljSUg4OXIzSXp2?=
 =?utf-8?B?bkowT0NSVStUYXBtVkY0U2pQU25iREE1d09kUXZBY2h4VWpXREtOeURrbkdx?=
 =?utf-8?B?M3kzbm1lUlFBVjBuOUFURUNVUlRuM3FWNGE4L1RwblVKQzhnSmlhNEhkOXpU?=
 =?utf-8?B?Tm5RSjY0ODRrem5yZHlvQ1Y0dk9KS09EV2QyTHBidXZPbmRsSXJiMzhXOXJa?=
 =?utf-8?B?SkdzUWdjUE1uUzcrNWpJQlVaSUpjWVVZWitpd1lkTW1FTjA4aW5IaTNmeVJF?=
 =?utf-8?B?eE5mSTNQRm9waE9CWkNWWW5LanR5RWozQjBZTE1IcXkrQWo1QUl0N1ZZTHl1?=
 =?utf-8?B?a3lwcGJidE9VYXgvR0tkdGtPaUl3aTY2SktYNWF0K2VUdEpWUTFhejF3ZTNF?=
 =?utf-8?B?ays3QVdUTGMyTmI2RGdxL3FpRzl6c2VnNzhSMk9JOXRqa2kzT3BCM2h1cyt1?=
 =?utf-8?B?MjBwZ216TGdqY3kzWVNHUzVjTWFLamNCM2hDOTY3eHBReUZNV1UvTlp0UW5B?=
 =?utf-8?B?cm9YT1FVRTJyUFFKQTZUKzZIcVYyV1hjUFczVnhwMnFnN3lqeTl2Tk9jeWJn?=
 =?utf-8?B?WVRlREtsK05rVkNpTHNSeUlUUERTTUZMYWNuK2VYbmpNVHdHRFdSMllXNlhW?=
 =?utf-8?B?aXg1SVJOUzMvZXQ4UElRUFBNaXUvZFBEQlcrVWZBZHRXek5vTHRXU1FKQmY2?=
 =?utf-8?B?TkNUMFRXSDdJVEViZUNtMHlXbVpraTNid21COERLeFQxeFF5VS9PNXNpS0Zt?=
 =?utf-8?B?bHRCYlZzNlNxdTBvZ3E4dzhyN2o3aEFGb2tLd3BPcVRzNXphbGtMbVlTMDhu?=
 =?utf-8?B?aXlSU0hlVFRNdTNTUXlRamF4N0dGUlIwOWZHNjJ2cmxKOWd6L1Fid095WGJP?=
 =?utf-8?B?YnlVRThYZDNscTFadVA5ZXQzWUxFcXR1a25TUnNvN0txcXFyN2xQVW1RNFdp?=
 =?utf-8?B?UDNKbCtvNXl4bGRpL0hVWTRjTVVGZkU3MHl2cVM4aWl2WDg0QWZmNmVqcFpt?=
 =?utf-8?B?NEpUcU1GakpYVXBhbUxxTWcxWnN2M0o5YjNYWXJ6aDVzbDRvYWF4QUhNVVdD?=
 =?utf-8?B?dEY5MGYxQTZSNjZFL3BUSitrSFZYeWtnTkhsOHZ1bE9sKzl2YS9TN0U3cXhN?=
 =?utf-8?B?anRXNUxSQnYrTzd2SE5FWDlSTStMZG1nazBiTmRkM3NVMjVvclJVOEFYdjRG?=
 =?utf-8?B?VUJCK0N5VlQ4ZXRqN25GUXZjenVSNVFyZWlwY0srV2xVYlJXVm0zcmZaUHkv?=
 =?utf-8?B?TGVDOTk2QS9Sc0lnd0syd3IyeFVPTnpvQ0RPbG4vSThwVlV1YjFBQk1QTWZp?=
 =?utf-8?B?R3VhTDk4SGRhQ1NhRDVkN2pNSU9xSHRRZHAwYklYOTg1emcrRTh0eDNONFdO?=
 =?utf-8?Q?1U5ChgsTo54=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXRJUENPWTBpNEhVVHJqc3hlT1N1RDRQOThsekVhUW4ya1ZEWUIyR1FEbUt5?=
 =?utf-8?B?YjdwU09qeW02SUlSaVB6QVI2WFh0UkI3aUZNeEVpMCsxa2tLc1NIWE9aVURJ?=
 =?utf-8?B?djFnQ2FBbnlrb2wwWVRMT0R4bDVFTWJHZGtIRG0rYkJOdTlGQng2MHM4UkZo?=
 =?utf-8?B?QWVYeEhxb3pqYTNKVUZHUG9pQlJaYjd4N3ZGU01OKzRFaXhjOXhkYk1RQUpS?=
 =?utf-8?B?Z2toV1NGMnBUQ3dKY05IVzM4UU9UaWdya1djYktOcHl1UEpBWVB2Ny9lZHAv?=
 =?utf-8?B?MkdiWnhCMkJ3TGdMZHU4cEJwMUtKMEpGWmxIQ3JyNzBRLzdvNVRBaGZBTmJY?=
 =?utf-8?B?bnNKbDRvVmt5S29heTZEWStEWUU5ZlFrbUc4clBVSERDUjEvQVFPK2pNR3g3?=
 =?utf-8?B?ekUrdi9jSG5icGJ3MFd2NUVTOVFMdmZWOWJrVStBNEZTZkoweXFYeVBVYllE?=
 =?utf-8?B?WG1sclZVWjZOWVFocmdqY3p1MGR1VGc1aitWUzEzY1pZRjJPamVhMVZKTzN3?=
 =?utf-8?B?UzZzeGphU2VVaGhUWWgxd2lPMTJBa09pOFdyQThFbTltZERNZlM0RE82TGVS?=
 =?utf-8?B?QWNvYUlXQnROeFp1SDNMUHR6bGNpZnNjL2ZSQzc4Yk9hcUlnaVVKZHVPTENl?=
 =?utf-8?B?UTNWbndhYTdaZlFDbm92TGlpb0h5R0JZUEw5Tzk3T3VrNmFya1E2ZjVhTFVs?=
 =?utf-8?B?RWx1a2sveUdxOEtYdFJYOWg4dDRrUWw0TDM5dkxDdStNSlM4OHpCaXRSQzZx?=
 =?utf-8?B?cyt6TnVTbEY0VnRpeUgxay9CWW43cSt3K1c1bWVYS1QwYnZhM0FNYzBXL0pS?=
 =?utf-8?B?dXlReG9ldGRpTjZzOVFmaDlmYkFtbHNOdzhpSUJaSGJLcnM3Y2lSbEhkWmNP?=
 =?utf-8?B?b0JKYnhsNGRzOElkZEJiTFJxakV3VDlvYm5YZ2VpUy9sWDNsV2FMZFJweHJC?=
 =?utf-8?B?aHZ5QUpHQmlubVdqa1FHdVBQUVltQ0ZINVdKU2JEQnZucFVuNkhzdS91REsw?=
 =?utf-8?B?VUx2elpqT2NCNXZ5Rkp6T2tseGRtRVA5aENDRGRjNlppSHkyT0pwRjZDRjhF?=
 =?utf-8?B?VFBjL0pDTHNCOEVwWWt6TVVpck9PaHFXWk16STRMbHJvL3FIOEJZQjMwZFBO?=
 =?utf-8?B?djdlVWt4NmZpTHJSL1U3dW9JL1lBbVNxdFJYM1lmODArL25OeVU2akcvenNE?=
 =?utf-8?B?TzZzV2JGK0ZZaGJFUUpCT3NaekVIWTl6RW94dkZaT3dUTE9QMXRoQmhDVEJU?=
 =?utf-8?B?T1hGRndkY0g1TjVldTE2eXJ5UUYvdlRPcC9xYy9RaXppOGU5S2cxNHAyY0da?=
 =?utf-8?B?MGFDKzhSS2tWSFVVclFTcHcycnFZSW1aVHpFd1JYRmlZS2RkdGNKWGgxci85?=
 =?utf-8?B?bUlNRU56YWR2Njd3S1FSTkJQSlhsTUxCU3pwTGZTT0xwaGpxNDZkbHZBMkVG?=
 =?utf-8?B?c3NTdjZOcWZaRWhGSnNLYlJ1RnlLUTREOGY4WVArZVhlOFBjR2M4aVNVSk9V?=
 =?utf-8?B?b3IyeFNmNktQSEEzNStGckNXeko0S01TSmJWMEI4akg3aTcxZGhTWlZnR1J0?=
 =?utf-8?B?dG5mZXJ0MERtM2NUNVU0MFdNaEIzZTlBS1lvMjI5WEplemRhRDFiMkZLanU5?=
 =?utf-8?B?NW51cUprc0JGcTV2dGxtYlRsQm9zY2JieFh1RFJjVjVKbEJmbzdiVkQzU1VT?=
 =?utf-8?B?V3ZCQjNDcFU1K3pYdmNmSFN2TjErS1NiWkRlZVFJdnFVV3U0RU9OZ0ZqaWRE?=
 =?utf-8?B?ck00bFZ0c3owamRmL1IxSi9ZSldXcDdHcHFHY2I5cDRocjVYckZVRG5oOE4x?=
 =?utf-8?B?Q0c1empmaXRER2dHbjc1NkpnaVlGSXdxRVhKcGw0eE83RTM4cmtEcU5PSTdp?=
 =?utf-8?B?WFFhMlgrYnhreGZycDE2LytUN0JyMGNkdUl1RXdzaWtGVjdkY29aUHN6RkxQ?=
 =?utf-8?B?ekRQK25DdTlhaHkrY3d6blRiZGNqRXNFK0RTTDFsZGdvaG9QY3A3L2xHeW1E?=
 =?utf-8?B?eGlnNDE1Z3NrSEJQaEJGcDg4R3RKdWMyOEhVdEcrMUZvNTBkdXlCSFUxWjVl?=
 =?utf-8?B?M09EbU1rUE5xNDVjdGFuRXdxYlVDeU5nVXk4S2dKTXJPQUxsNVBRT0tqY09P?=
 =?utf-8?B?R2FZMk96blpEUkxtM0paT0FjTEgvVUR5T0k3VUNZbVpvaGZzMVFPaEVOZVF2?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lRMSUyjzKcBhMvWsEjO15k6av8yclcsq9aY1qlJNx/T5BVGTAAcmTyzxeRzgTAwFINdW6xN3evY3NM6WsVyDgx5b64a+dDfGDtjX2jExsZjoO43B52AVOj4EA324Rqj16Lf8viteqeJQWIB8/3qWSAtt7jct0jaXk79AwOAw5FHvJzFcuhjkQvESvCPjwH/pQDZUkg7HJlPCu6ehqMRMDGXFgh+XEnHiz/Zwz8zxdAxlGG6Lc49Ice2NLddqSJ+KxKPRxTtQ6B7p+Gsc8Xai3Jm0Vxvnsmzgg/R732TBF5Uqv+b2FgUwekFdaAPyhGqF9cEsSYUyf5mfsX0Nn+jzausMNFsF4nCN4OkGa635VCXz4KF80lCVDZiA+eh5fOSm5q7Fy6PyQdHLe5/FD0k7g3BhgYEK5+IeeUb1OwIU1A0N8FlwwRQivQ3I/3j1vuySYvIblpp0oC004g3Zq9NSh23vU8e4nkRm4koIOqIjVaYtLjaySggBtKEI35ER7H2Nz29EB08sB0bSb3O61SdD+MpWD3xqwiRGYVvbwtlDa+1rGR4QTO/eMTS946HARy34MgE8/RviCt7hAawbITHUgyFrn9+kohRtsXiWalFUf1Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa52695-1012-4f16-184f-08ddb89c46ad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 12:39:09.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hbv3YWNKttfXjgn8z6gdq/O/gz1rwtu9EyYEh3cJ17qUV7tZMXeLW2OeL1XLC++pv9e3UVbOIrgiT4z2IBCI9Wc5RSg6fSUj9U/DpxkdwS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4462
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010079
X-Proofpoint-GUID: 5pqKYDoE-yE2xdMQundT7LeLc1dDT72-
X-Proofpoint-ORIG-GUID: 5pqKYDoE-yE2xdMQundT7LeLc1dDT72-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3OSBTYWx0ZWRfXzdr+ctGCoDLV rYk35iHuBP1o64FS415dNmKVNiqfpr21XktcVv7Tvger/MDziQAWksM82f8ytjUmcEU/chYDl+V 1Bdie8Z1HEhDNBq613rmRRnaq2A8QGGHF+VkOCgJEc85F9Pkes6OLGrgf8GUzXvntCmhpApPLxW
 GJMLgne3Fadwlzz/PnwAKUv1sPZqs/N77kfAt4o069GKhBFn7PKb9SlHarkD8sJqJbupiX0sSm5 oM5rnPuDFbjPfzmaqic5Q0k3Vzv4EDDiW6GaSmU2m/s+QbdJc0flIMiSTYk7SYX486XwPBNDA7j C6XfAlFQm6TTc5d/q1BM7UccVNDBbp1Or5IJWRPehUaHPbSyIzcMPQynQJvxvcjQgNN8YUl0zgr
 3DjD0UKzh+mS/Ler8Tj+RRzBwt3R3lkyUkceJsCSBCVwSEjcekY3OLz2+ie6/INrI+ES55WK
X-Authority-Analysis: v=2.4 cv=ONgn3TaB c=1 sm=1 tr=0 ts=6863d6f0 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=5KLPUuaC_9wA:10 a=GoEa3M9JfhUA:10 a=2rFDjVRrivpQT0tBCEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On Tue, Jul 01, 2025 at 05:45:51PM +0530, siddhartha@kenip.in wrote:
> 🧩 1. Does the patch cause VMAs to be merged eventually?
> You're correct: VMA merging only happens at mmap() time (via
> __mmap_region()). What the patch affects is the behavior of
> thp_get_unmapped_area_vmflags() before the mmap is placed.

[...]

>
> 📐 2. Why aren’t the VMAs mergeable before the patch?
> Great question. Even if the VMA flags are identical, gaps introduced by
> forced alignment from get_unmapped_area() break the precondition for
> merging:

[...]

> 💡 4. Why this patch complements Rik’s rather than contradicts it:

I'm really perplexed as to why you felt the need to (seemingly via LLM)
reply with the explanation I've already provided here?...

There's errors in things you say here too.

With respect, please don't do this.

(I'm the co-maintainer of pretty much all the relevant code here and wrote
the VMA merge logic you're referring to.)

>
> 🤖 3. How does this impact AI workloads like Hugging Face Transformers?
> Tokenization and dynamic batching create non-deterministic memory allocation
> patterns:
>
> Models like BERT and T5 dynamically allocate intermediate buffers per
> token-length, batch size, and attention window.
>
> Hugging Face + ONNX Runtime uses multiple small-ish anonymous mmap()s, often
> 512KB–1.8MB.
>
> These allocations come in bursts — but due to forced alignment, the kernel
> was placing them with artificial gaps, defeating THP eligibility entirely.
>
> By not force-aligning non-PMD-sized mappings, we avoid injecting gaps. The
> result is that:
>
> a. VMAs remain adjacent → mergeable
>
> b. Physical memory is contiguous → eligible for khugepaged collapse
>
> c. THP utilization increases → fewer TLB misses → lower latency → higher
> throughput
>

This is very useful information and it's appreciated! Let's not drown this
out with restatements of stuff already covered.

>
> ⚙️ 5. mTHP note
> Although this patch doesn’t target mTHP directly, I believe a similar logic
> tweak could apply there too — especially with shmem-backed workloads (common
> in model servers using shared tensor memory). I’d be happy to help test any
> changes proposed there to derive the consequent results.

Dev - could we hold off on any effort to do something like this until I've
had a chance to refactor THP somewhat? This is already a mess and I'd like
to avoid us piling on more complexity.

We can revisit this at a later stage.

>
> Thanks again for the detailed discussion. Let me know if you’d like a trace
> or VMA map from a Hugging Face benchmarked run (happy to generate one
> locally).
>

Thanks! Much appreciated.

Cheers, Lorenzo
