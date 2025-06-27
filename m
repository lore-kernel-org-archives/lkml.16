Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93843213245
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042039; cv=fail; b=Tq58rGcqxFni1o1fLdBTcJePuIVY7SPYGsqWp9TB8N+/hImaXIkK4V4D7nxhn0NIfRvzeyhs6xm77MxxVEqBcoz0uHXVRJVBsNWXRWGrhagU8BypsxtTF/RfmJUzsPiRKfpfmVXoaRPv297t6LtStEKWGbeNuJcjaXxabJhMV/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042039; c=relaxed/simple;
	bh=wa1826KAbfTrKkiMj9KuJLvdXJ+Q30DWmslGFOZh1ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=betTy+J98T/Xz+WjtLbFBw8XItsdtwg5FDlLE55NxqiYsmUvEgkb0psGNbrTti0DRB6RVS5as8uNijarHnSadxHajPj9HcgLVtKNnaESg27VUp9YaFLRUcGlEWfuFOwsiA0YxLNB4AJdgqLZJjaV56D8JU1iOOAv3ZhNXrKRYCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BdPqJ58n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ygzpo8Kt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BdPqJ58n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ygzpo8Kt"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RFdwhM001705;
	Fri, 27 Jun 2025 16:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Iq12vOgQbpP7BOfOqHq9c7ufBPaO15myxVH2da/M4Bk=; b=
	BdPqJ58n8eKO8Sbap7Y2UIfbVykHxwDHgZdsfaCN2wfYUPPLmpzchWohMlnEU7WV
	GppUGFHIngnuVAz+s0c9p15nMmzz6cXM45ZtfFlbjKktAJ4U6bGxq3NwJENgKGW5
	FrzkhIc8tF8bIEADxjta/o37+xxxLV/k/2qZs/Z1eCPzBAgFSjPog8ouIShKdDtA
	EDgw7lv9wNCohqcRxo+7VVcSXtoDKkkqQ0vrpKsvOQvZLjFY1eacq+vE8gVlkN8t
	G1sRwXC/05tb9GzC8lAMu4gf5jkBSACJAOHnRpnO9E7iIhEf1Jhy4CF7Wtu/YJt4
	eXa+n/bTlTmMffgU3xSX1Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8n44vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 16:33:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55RF66qG034165;
	Fri, 27 Jun 2025 16:33:12 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpuhsfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 16:33:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmY4BBfgSNaD20CybI7etNhF2Mk232a0RSzEMVtiEH2y3qX758L20GX+YfAB9nxgv7OGiJqinNhA1hqLzoNah/grvoUP9ZawkdInwGVcf7GWoJzQSVm1zVtkwCRwLiPxsXg4MPguMu9Cxe3osgYtXQEHes7xX03woDeGk2pKl4mPXFgfdaATYScWYIvrtVfxtXZnOVb8N3j6Rr2TMScXkHjskYL+FtRHAYwC/5lwgXAKscVg0YDTVZNbA05Cv8gn6z3UDL+URi2nYXEl5Cbr8I2qaEet09SDVbiV+CGcSHD/g3LJxQ9tv2Gx3Ir8hVDZWTLoqDRfl5e+EzPjOC7IhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iq12vOgQbpP7BOfOqHq9c7ufBPaO15myxVH2da/M4Bk=;
 b=U6lQWfwq7pme5xl7SYP1FPS/2aYh5yPsargJFOnZ5g3KpJHBNVx4615+Tfjd307riLmmXBMdnRL/4IzbgwM9UPELUVA8u6RtEI8t7j1BTm7jIq67iWOqyY9nH5GeXyeARL0oabwnGbiHFDSaGMufabOtIt2hC/heDDsv9UhSWdNuE22UGaaBHCDXPm2s82nUE39QTKtIHl/L/KUBJWbyg/f3MUXhUS9OU9zYrUXz+CERWtqDAqR9jjvaujVHf+BVLAJchMi5Rcp66zlb0Ipy7aUkcyciiOMulT8GRUfGUjtxm/BEaqLd3RzfBKT+eNKbuBgXUt5J6095EJFxaOl8oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iq12vOgQbpP7BOfOqHq9c7ufBPaO15myxVH2da/M4Bk=;
 b=ygzpo8KtiKIDaBew1UBBfVDeVLsxOtWviitZrv2QiVc0saLli1nytkzj08MEU5oQVZsTmyk2hilHWs5bDxLLwnERT3K8Cw+wC92VH2aKLzvxSsEMJtWY8dVfF0KfznHH6wFlroRxe7iNG1iX8YC1N2r4uFSwc23u9Py3W0+MMTI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5696.namprd10.prod.outlook.com (2603:10b6:a03:3ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Fri, 27 Jun
 2025 16:33:08 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 16:33:08 +0000
Date: Fri, 27 Jun 2025 17:33:06 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
Message-ID: <9427d552-b94d-4b27-a4e3-ed958c153b48@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
 <6e3df002-fd04-4acf-a670-d36d5478921a@lucifer.local>
 <fd825d4f-76b5-40ee-bad5-634b4d80506c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd825d4f-76b5-40ee-bad5-634b4d80506c@redhat.com>
X-ClientProxiedBy: LNXP265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::35) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2e6f4e-7a51-4adc-9aa6-08ddb5984c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFVDUlI5dXBUT01PU0dPTTRmaVFoanMxRTF5cXA3alJMTFI0S3dRUURURzVq?=
 =?utf-8?B?OGx6K01ZUkxPc0t3TVBHd0VvU1pscFNjNjhzSDMybTkxK2x4SHEvK3A3SGg0?=
 =?utf-8?B?SmUwWWdJWnRScHF2M05jcHlySWU3VDVrWXdPa2diNjhLRWFZcURTZE51d2hn?=
 =?utf-8?B?dmxmMDdodTI2UmJYd0cycm5vbWh1NDZGbC9KaCsrK0pTQ3c4VDR4VEt5NXph?=
 =?utf-8?B?b3k5Vnk3VGV0OU02WHc5QUN0RmhvTC82ZHFtM2s5ZnoxMmRiTHlRdUhlaklW?=
 =?utf-8?B?TUNaM29PL2s4V3Q3Q2tpelJuQjByRTV6ZTBzbHU2V2huaTFMOWRaVnoycUx5?=
 =?utf-8?B?Yy9NN2xMaDBOOGNYZlNCWE9Bb3lRUmU2d29UdUJwUHNpR2Z2RVdhcVJBSm1K?=
 =?utf-8?B?TE1Gb0NSQ2k2MVBlU3lWeEhuR2VUeWF6RzY2WGYzOXoxS2VLUXhFMVd6NVVK?=
 =?utf-8?B?cUFmZGMrSzJnSFFOZ0lFanJ2YldOeWxqYzhHc2JQOW1HU2FWM09iSkMvMHlL?=
 =?utf-8?B?OGN3dGtQSDNRbS9hWWxBeHU3bGFHS0M0ei9keGs0UWp5ZG9qNkdnQWpEQkRh?=
 =?utf-8?B?QkZlWiswWVg4WERpN0QrcUk1QXJQNWVOZXpja1NWQzNKV3gxeFUyZ01VTmsr?=
 =?utf-8?B?VEo1Qk1jd3hIUk53Sit0eGpiVzNMakd3SFJEbXBUZTRYN2c0UkRWdzFtUm0r?=
 =?utf-8?B?b0Q4TGVSU0N1RlpUZ0VFSTVGZ0JIYVl3M3lhZ24veG1PVDE5WlVweS9ka1pl?=
 =?utf-8?B?SWl3eFdVa2ttbXQrTUpDemZlNmVteHFaQnppSTMySjQ3NU83RFhQa2c5RUcw?=
 =?utf-8?B?ZXJzNUlNUTY2STZjVGtibSt2WVdQVHBuMXVEWnkzaTQ0Q1YzYUpBYzV1bFZh?=
 =?utf-8?B?MFZHT0xaYUhFUjdqek5vVVgwWFQ5MEJDQlBNaTBzK0F6d2pRY0ZFcEdFWkUw?=
 =?utf-8?B?VzNGZUFkSGk4QTFxR1NubFA1L2U4OXl3Z1Joa3JwWDFXbE5kWkRFZzhuNzFi?=
 =?utf-8?B?dytyN2pyMjJlb29NWTVrRHBMK3l4dFY1dlNFQ1RaaThJUi8xMXBudHpNNzVN?=
 =?utf-8?B?RlgzWUFUMXVFT0VIdG9hSzU0UVNMMTZzMzQrdi9hSVdabFgzaGJNamM4dXlM?=
 =?utf-8?B?cnpSZk1peG5jUjNGMW1oaXNhSEtqNzNwVjlIdGUxUi9BMW1RQXhJVzFHMWxx?=
 =?utf-8?B?aTdwNklZQTNsUGZLSVMvNm92Rk9oTEx6d3J0K0RJRWVrTVA0bk9EWWVuaE1C?=
 =?utf-8?B?VGY1bDM1KzZKajVubXE5SEQ2U0h4QjY1c09NNTNqYjdqTFMwRVd3UEFER0M3?=
 =?utf-8?B?TnJIMzNjdlZDK1RaM2pEaFBBRkRsdXdBWkY3VENtQXdwVjNLUFF4OS9kWDh5?=
 =?utf-8?B?RDRSRmFhY1NQc3UvVkl0US9QbzNaYVhrTmNlUHN1WjZ1UDd6M0llTDNacXUr?=
 =?utf-8?B?KzF2cUhHZVZNWng3OFZxNmtuZkVtQWNET3VaL1FEUFZFNlB2RlZRcXY0cGRR?=
 =?utf-8?B?eUh3bXk2Tm13M045TGRFM2VOdFV4czRkdkRhRmVlYWNzUk1JMEhIMlpvMUJE?=
 =?utf-8?B?dXYxQUdNL3BuQ3hHajd0cVlucWEwbFQvdUFFTGF5aVhvdERJVVlTR01hVU82?=
 =?utf-8?B?U1J4NHF1SFFPbklLcXZKWGlUcHRQWHh2SmRMajVXVHk1dFVhSU5YenFqNzEx?=
 =?utf-8?B?dFAva05wZEx4QlFBM2hCNm5ONzl5Ly9KTTdZeDFIQVNCU2FDbUh5TllBK2x2?=
 =?utf-8?B?WEV1N1pLN1ZlbUdIY3BtWnZ6dEl1bDlLbDY5ZHdoeEl2UkVvbzdpa3p5SnZO?=
 =?utf-8?B?aEpFaDVtVW9zL1dJTjF5b2EwZzUwQmtnOE5YeG9UeTR4VzE0U0NRTURMZ1p5?=
 =?utf-8?B?ZktRckJpZ2Z3b3VXN3JKOGhlWEpJeitDTGkxNlBtK0JHM0NvTjZJU3NtQ1lk?=
 =?utf-8?Q?D3KMeSKlLws=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDFPSXo3N2xQaG93MnFPbWozQ0NhS3RWc2pha0JLc2l0UnlnZzBFRFpXeHBL?=
 =?utf-8?B?cUtQKytOMXRPRzc5akZTWnIvUjhQV3UzSmNVaE1JcnNXK0QrdGxtWENneG43?=
 =?utf-8?B?NlYyWSthVGcxN3JHM2tzajlpNkFsY2NlYjhYVDJkbC9PQUZkZGEwYlJOZDFa?=
 =?utf-8?B?bjhhd0dTTUdOZCtuUDc5UFh1VmR6WUNqZTRGeDlQMVk0cXo1MlpGWFd5UXFJ?=
 =?utf-8?B?bG1ndmZZUXFnMCtTRzRrMEo5b1ZjeWJnSDFpSnM0eEI0cytpYk84akdKdXJv?=
 =?utf-8?B?RWs4eVRUeHdhU0VJQUJCUzU3ZXhyN1ZFZUdzL0pDNy9kcWxOc3g1ZGl5VWtG?=
 =?utf-8?B?b1R1Rm1hUlZla09XRVMxczdzVWJTUU1HVVZ1NjlyYVRDT2crY29NU0NRREo0?=
 =?utf-8?B?ZEQxcW13L3BOOFFicGo5WnNpMnJ0dEN3b0lVTHFVYUEwV1FScjlrSlVTcTEy?=
 =?utf-8?B?RDJvU2l5OWphSXozWk9NVURGdjVmMlJLOUpGYjBoNzdCQXkxcWk5ZTBUMUVS?=
 =?utf-8?B?SSttbE15a2YralpnRFJLWEc1UUx4WHl2V0dUM3FsVWpOM3hDNllGSEFsVmlY?=
 =?utf-8?B?d2FVaXM5amUvWTloa0RxclhiUjlSbHFiMlIvdklBclRWN0hLanFIRXlVWW0x?=
 =?utf-8?B?Lys5dVRkdGg1czY4RVpKQ1JFN0Y5SnIzS0xuVTN5MzQwSEJNb3dESStkVFpn?=
 =?utf-8?B?T2xkWnRIWER6VmNZUWxPMXk3dDFQdUltajVTNVRFeGtUMjg2NzRBeGhlcmFr?=
 =?utf-8?B?bG4rU3FmUWJsb1VNU0xkL0dTL1NBRHpFOUMvZW5Qa01ld2IzNWQwKzhKc1Aw?=
 =?utf-8?B?dk01Qyt1V0F5SkpPcm96VHN0d1pYM3RHVk5URmlpdWxnNHFNN3JJbm1KT0tS?=
 =?utf-8?B?VmhxOTIvOG9JU2JMYndyTUUxdy9YdTA4aW1qREVHNTNIRGpqQUxFYlVVWmtC?=
 =?utf-8?B?dlk0MHM5SXVyQmk3ZkpQZWxGLzBaMnBYL3lLNnVkbEZQaTd3eUxyUjQ5UVph?=
 =?utf-8?B?ZWNmRWRENmppK1MvWS9RdnJaMTBSNGVVeFMvMUttTzgvdFpxVXhtMlNrbUpn?=
 =?utf-8?B?YzdxRSt4c1YwVnBZN21WakEzM2VSM2FPdzFNZ2k5NTVOZy9vUEQ5S01lMGpw?=
 =?utf-8?B?dnEvc1IxYlVmNThGN0lZeXVKVWF5eVA2ckdGWXBBRVF4RUMzWG9mL09scG0y?=
 =?utf-8?B?YTV6YnpKeDJ4RkRoZ0dUM3pxYWJMVjh1RTRMQmJkRy9IanV3cEo1UlVPY1Uw?=
 =?utf-8?B?akIrcjEzMkJwSGZJY2hJU3I5Z3BsZ2JMckluWWQ5aTd6TUlqZEp5ckJEOHA4?=
 =?utf-8?B?ZVNtYlRraVZ5NDg4V1ZhQUM0amtjeS9ZazZzOHZZeElZZVZGckdiZFRGbUlw?=
 =?utf-8?B?ckJzTEJHRUZ3ajRqSVJkUzBZaE5uc0k3N01VRURZMXNlVlhyc3NFZkZ2VXp0?=
 =?utf-8?B?S1R6RTRYMGUwa0Urem5hc2hmL29MYk9paFJnMUVPUnB1S1RuN2IwR3BmcVpm?=
 =?utf-8?B?NDlWTGlLS1ZmRTZibnFCOXAvZEhZTVRZN0lyWnV0dEkwbkNJaGVmL3BhR25L?=
 =?utf-8?B?SVB2NlBEbGNtaHhHSkhFQWsvcjlpOGNFUzB3YnZzMUI3YjBYM2IvTHpnZWJF?=
 =?utf-8?B?UlA0TnYyU0FRcVRHYW00dURWWjFyY0dPaWJhbTB1VE0xMC9aSEhFcmx6emE0?=
 =?utf-8?B?a0I0amZiMUFDWG5WckdQQjlZdlVydTByUlNOeFlqMElLMW11SmVsdVp2UGhu?=
 =?utf-8?B?UFhudHJFYTYzcThBTXhQa28wbXM1VkhQUFM4L20zWTFMZ1RMdUhVNUdMY29u?=
 =?utf-8?B?ZVhlZ2ZhWUVFZzczMG0vTS9sa241N0U0Nm1QSldrdThPVjVibHpWSjYrZHlQ?=
 =?utf-8?B?SXNIUWNQa2ZKQlpRYzA0T2tQYXE2RkdjUHhlZWsxYm9IRTBuRWRUYndJcWdv?=
 =?utf-8?B?M2JKenErV3ZwaTZ2YnFyOTlQdmFYUys2R1lEdVhBR0JaYm12L0Nyc1dVMUV3?=
 =?utf-8?B?SkprcDlOVkdxZnh1MjB4c1VEMXloM0QyYXQ3TitxRXF0RkpONlNJYWwzQ25p?=
 =?utf-8?B?dzdqZE5QQUhISUwxdS9xRm52cldHMXYvRmhXdVRydHBWdmJNOTFOZ2tmUThR?=
 =?utf-8?B?WGVNUWRvREFRNytoQ09KVmM1YnE1OEdPeUJscStyYzI4WnVlOHRrYUg0cmJF?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SazD/JIPvWiFJneNbfdY7sMHiwt1B8+jJdbL1ha21paAgU8DRkAu+QNY5JMkabegNG9n6K5LRoBVJ4bONE5CCum5zFGumYFdd2is9sd2wr++t93MKbwLzfPJl5TJ6Ad44f02zAejrS8j3Hq70F2bzEm9/ueO01OeSLi/N+XikiuLdtJ+bjgKU2HLNDIR0L7dYizuq/+bRHPtZv4cJv2xxDs6rJrujTT6554sZ0ZoOC0blFBvrIG66If2o6T5tE6SNh9JpVfIf3ji6G5tJslnzIyKYwPukTzaoE8PvSLw0ctfKXfO/NXACJ0mG5cXU5y7epl17BAo8RqPdrFeUUKRPhP0ubv5wbL4A8WlGL9r/9gL4/v9/0ycvedPeSnuhv/1c4Ac7EPNloya6uO6kIhKDPy2koQnUHBpeeRf6gv6Zd8vtwWzxrqmC3A6XGckaWaKQCw6jzgcgzsZLysaYzKI+VAoQrvmZ1hGTjZQ0gY8TDqmzMlIh9Y5X2ld6naBabiIsSV4FyK05YUB2S1qQG7DYV22Hm8g/IiGYaJN4Wpt4k7IBfUKVt8rWbGxA55AZc9PXcFDj+D2eqdN71mI2y9aQKqPAL7qnGYNLPD66SQ+Nlg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2e6f4e-7a51-4adc-9aa6-08ddb5984c7e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 16:33:08.0302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEGI+9ZSBnjiZK0/eouIotmIsxnbf0RwGTWqZEohVZxNyx8egjzUMF0yRohYGXsh5MyDqUzuFVrXNA2KI0DAwObFjnyV9CDjGInO/58PQF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5696
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506270134
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685ec7c8 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=LtzktIKQi040eHscQBwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: mnU7f96F4S7MhpfSSGoeoDRXRrhbSmQU
X-Proofpoint-GUID: mnU7f96F4S7MhpfSSGoeoDRXRrhbSmQU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzNCBTYWx0ZWRfXxdK02RCsShp6 KNMejVDDXQ1tB0DtLSRrLmfZD+vE1UfrtPB7im1PhayK+kOf8FIWJL4tXAGF9+up9yeJsGhDQzf uSapcgowxHIBi9HSK1+2jhoXqayJOmTTrxQIH1P80claJLXLNQO+ji/UFkNxiTwwaQd+xDCjIsz
 By5ZyKtfEW+22CPSFEErWjbgx4xUJo32rTP28Yg1+Bn67/pdUOIGSUDpm62OfI5XAZ+2kpp/WM4 KsD9STXD5ICVQN+3rg2BOjd/LJ+2fnPq4Sj+rpDc6EUJ4zOrrgHaNUBKuUagKlgYz6bUxsPTyyE pSuqIgufe3DEfnrdVl6VcfdydxmwHM99Rms7fJJTyPqg/nZHzVN9N2GvaQTVk/zZYcYsHSHjYv+
 O9ELws257UIkoYj0MHMXA1fG2kNRn0t2bmRgarZAFkCqTIhz9q+j7hwRNh9GmmazoEOQ5D30

On Fri, Jun 27, 2025 at 06:30:13PM +0200, David Hildenbrand wrote:
> On 27.06.25 18:28, Lorenzo Stoakes wrote:
> > On Fri, Jun 27, 2025 at 01:55:07PM +0200, David Hildenbrand wrote:
> > > Honoring these PTE bits is the exception, so let's invert the meaning.
> > >
> > > With this change, most callers don't have to pass any flags.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> >
> > This is a nice change, it removes a lot of code I really didn't enjoy
> > looking at for introducing these flags all over the place.
> >
> > But a nit on the naming below, I'm not a fan of 'honor' here :)
> >
> > > ---
> > >   mm/internal.h  | 16 ++++++++--------
> > >   mm/madvise.c   |  3 +--
> > >   mm/memory.c    | 11 +++++------
> > >   mm/mempolicy.c |  4 +---
> > >   mm/mlock.c     |  3 +--
> > >   mm/mremap.c    |  3 +--
> > >   mm/rmap.c      |  3 +--
> > >   7 files changed, 18 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/mm/internal.h b/mm/internal.h
> > > index e84217e27778d..9690c75063881 100644
> > > --- a/mm/internal.h
> > > +++ b/mm/internal.h
> > > @@ -202,17 +202,17 @@ static inline void vma_close(struct vm_area_struct *vma)
> > >   /* Flags for folio_pte_batch(). */
> > >   typedef int __bitwise fpb_t;
> > >
> > > -/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
> > > -#define FPB_IGNORE_DIRTY		((__force fpb_t)BIT(0))
> > > +/* Compare PTEs honoring the dirty bit. */
> > > +#define FPB_HONOR_DIRTY		((__force fpb_t)BIT(0))
> >
> > Hm not to be petty but... :)
> >
> > I'm not sure I find 'honor' very clear here. Ignore is very clear, 'honor' (God
> > the British English in me wants to say honour here but stipp :P) doesn't
> > necessarily tell you what is going to happen.
> >
> > Perhaps PROPAGATE? or OBEY?
>
> RESPECT? :)

🎵 R-E-S-P-E-C-T find out what it means to me... ;) 🎵

This works too :>)

>
> --
> Cheers,
>
> David / dhildenb
>
