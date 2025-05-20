Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D458A20FA94;
	Tue, 20 May 2025 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732657; cv=fail; b=RhkPE/GwqfKs9uy3BCfYZJ3kbk4OUl2bazHwTQ5nI1KOwwEQE6YzFkv2SyM+e4zEps2tNWKYsWb1nV+ZtX0+vw2AAV0L7raJKkdIJoowHzFn70nfegXWasOa6Kp2Tdt82BV2ON4Be1SyMziHt7k49WZURxMfTyJLp+PVEE8Awu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732657; c=relaxed/simple;
	bh=UUkHGVAwhQiwrJ4yoB6+WYyJDsTbaKvBzoJkgQWPovE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fMQz/GzveQiZYnednbPCDbBYoUw5JUk10ZGuvLs79P6OKs0kZe3Ftbzai/XWvTU6coEezSuprHdeb/XGcyWntSrfx99cKo5niD1eY8T1M1gBNYHhKpJnfLDZ6YAyseyqY5+iXNAm9RiDIcde9b9E65/AaTKzNp0SHc8jamO5ceM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hIKeoEtL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hkL3mgRz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hIKeoEtL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hkL3mgRz"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8fX8r012962;
	Tue, 20 May 2025 09:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=VTR9Lm95RGJujCuzB8nbYytc7T9VKjfhrmMc57AI9Q0=; b=
	hIKeoEtL0h3Yzou/igsYxc/TA1nk8dfahwNudFYtjdrMjPPluIEEsqDH8Uol92vA
	M2FIj25NG18aL/4ViowZQxJ5+w3Z8EalfERVn2vto9PBUjTTXEKoXKYWPTP3smRA
	jx2AZ6Te/n40ys/6p9rzQxD6PhGLeQhUpt2ekxHiNPZf3/Q6dDL7+BwFRYkJeBfy
	JQinXrgAH+yVMBFpGvkIWrkw345PjVTksXA2KEGWt+DA6azljDQWAjOPaSBXk02b
	2d1U+sjFM64Rng2wmRu+T8WVewtLtvxkKhOecH7A84VMuwg+YK9NwqyGTbnHWC9q
	RJ6yC8N/nyZOef0FZ3HKTQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46rdny8ub3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 09:16:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7ooo5000931;
	Tue, 20 May 2025 09:16:47 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012033.outbound.protection.outlook.com [40.93.1.33])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw7s4wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 09:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG6xmwgGh46oxtyyHO4Qndsp6wKPzdT4b20mwkD2oQR9EmTrl9/WiegGI09Rrwx8tJgtcrRDA//05+30TxHdxSchzX/zBCjFiEjoaUNNCbQau0DNgB+VZPuV5P7mcMtclMHsLULIj8PhRxSXwWbsM1fowYSDv+g7iDwAAIBqpxHhBBNvG7AEa9EhbAUSC493LPN0f+mtmLe5GmCPUmzaceuBnADnChZsLdSi53I0LRoW+PYti+oS0R9wKJ9ToacfW1VvIhMFM43Gjmv05L++aK2h7ywQESrFxaIGfdB1TAcdGLLYTbUAYqSfm0cX/WklDhQM8VUdy6XNpIzSfWpQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTR9Lm95RGJujCuzB8nbYytc7T9VKjfhrmMc57AI9Q0=;
 b=VrOsPr8Zt3atAQvkLT5TGfcJWa1u8DY1QKxZ1+8ZKd5ya/Kcw8qf/a2SUzuMTBMMOQoKv+cOLWY64E1k+aBDyum/3NJjjnbg5cURxcMTCzNRA/Gdr/5BuxVKvCxDnI0bj9heLtAb8asV41l+7iPaQKrk45t9YmUXnJhbVC9cOOj0P57eMG0V10udIBOmDpNOpIn9FT+LZQ6hB05DmHlty7mutWWT416Lnt17tl9zyJqz4gbuLUpcb5pcoEwh9WfKCmKUfcg3BxWHHNV0sn76MWg7/jqj178tKqMtYIArdBmsknSU99ZnD4CXcLm0DK4tIrQpC4kw+Y1jAFsuLCR8sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTR9Lm95RGJujCuzB8nbYytc7T9VKjfhrmMc57AI9Q0=;
 b=hkL3mgRzuBBcHeVGprg6BYa0yO3JdGPH2LCSqU7B3/NWQw0ov/jGqlC8jrby5s0jrGkaL/yWZf+N5KiE+Wq9lLjyGIt53vqkAkYd6lNNGhtnpKTf5aok6zoW92Tkph2nm6NWI6+KGRv9DcCwXGboVFAfRLxd3ThylJPrUQZxRac=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPFE654FA166.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7da) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 09:16:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 09:16:44 +0000
Date: Tue, 20 May 2025 10:16:42 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Jann Horn <jannh@google.com>, Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        vbabka@suse.cz, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH v3 2/7] prctl: introduce PR_DEFAULT_MADV_HUGEPAGE for the
 process
Message-ID: <342e6924-cc3f-4877-96e4-ee8936ab644f@lucifer.local>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
 <20250519223307.3601786-3-usamaarif642@gmail.com>
 <CAG48ez2y_PP7Uba8uq_Y+auKRUHPcJ19Nnn15GAaVS=M4DC73g@mail.gmail.com>
 <13d618ed-2cdb-4a5b-9dd4-189f65244a60@lucifer.local>
 <6e27e97c-db1a-437e-93ac-f7c1329b0e00@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e27e97c-db1a-437e-93ac-f7c1329b0e00@redhat.com>
X-ClientProxiedBy: LO2P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPFE654FA166:EE_
X-MS-Office365-Filtering-Correlation-Id: ae79a59a-5101-49d6-2888-08dd977f0a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2s4cE53WlVIT0hoRThvZXJUNzQxc3NxV3grcFdpcnNrekpQSmxlMnZaQXUv?=
 =?utf-8?B?TU1wWE5OR2dUb3RvNDZEN3Erd0VqajFkTWxnc0NmZEJYeDhzcXZ5THRiK1VK?=
 =?utf-8?B?UEZCaEhVV25oUWdsQTI0aHBOSFllY3hmN2dKUGVCbmZranNjY2tJYlVLYmdp?=
 =?utf-8?B?NjF2UHhLYVI2dUY1ZE51c3RpaURRMHdDc1BSZlV6ZE1IQXpFZFNEL21tQnN3?=
 =?utf-8?B?ajhZUldvS1BMQnlNdStYUnpzWGE4akpKamV5M1Axd3JTT292OEVKaEJnVkE3?=
 =?utf-8?B?ZFVBbmZWM0M0MXlBRDdLMngrWEprakxFZVV2MkRCbmNFY1pxK3F6STlmV1hT?=
 =?utf-8?B?cit6Vk9FdXdlaFFhQitzODhpSlRKU1VFZVNrWXIrTmlLZndnYkhLZDYrNisv?=
 =?utf-8?B?REJXckMranpjNWJ2Qk9PcnFVNi9wM25zcFFYU20vcDhQU2ZzcThwVkYrRnRW?=
 =?utf-8?B?WHBjb3o4K3I1S3B5U2c1Uk5sWDFvYlp4eGNwbFlGYjJLV3VmRThBMzFjNlpQ?=
 =?utf-8?B?Zk1qVDB0cWt3T2JGbkw5L1BJcVJKMWRvYis3ODBkV2E2andOS3A5dmFLU3g4?=
 =?utf-8?B?SG04L1c4bGk0VGZWY0pucWttSGdTczE5Ly9nR0V0cEtIdkpNRDA0SFRYOFVo?=
 =?utf-8?B?OVMrSHdIOVc4RUFPWnc5ZVhCQVppQzZGMEdoVU1UdGhtM0N0R3h1L0ZZY05v?=
 =?utf-8?B?Y1RZRzRsZkVIMHNrdFdRUGRRcm5JUUNZTGhtdmlaQWlFYmxDeTloNitzTy9O?=
 =?utf-8?B?dmhPejBHb21UQWdib2NzWTdFSzBzWHlHb242M0RzalZnNmZBWWdEaDVyZHgr?=
 =?utf-8?B?eXBUdXdOTi9DRTI1L3p2dFE2ZytUSVppZ0kyN2tkWXY4Y1h2UEhoS2tTYnRz?=
 =?utf-8?B?blg5bk1TV0FBYlZ6N3dZc2RQT05nRXVtRHhPNTRqNS90d1k4a09mcGdtMXlu?=
 =?utf-8?B?a0V4N3ZuYnlRSGtxWmJ0SFNSTFhSNlNaR1Via01xTXhCajNad2ZHenZ4WGFq?=
 =?utf-8?B?T3pJSWR5TWN6YW1vK2lsM0hqS2tJeTBMWEN2VjBtcW9JMHpkK3g0MVJ1akkv?=
 =?utf-8?B?WU00Y1l6ZFMwZWY5WjNUZGNLa1ZsSWNYMHI2VGpLby9Uamc5SFQ0am9LeVNH?=
 =?utf-8?B?TDZIVkN5RXlKQ3JiUVlPNUkyWkV0YWtNSGNyTTJja05ia1dEVlRSem1ZS0R4?=
 =?utf-8?B?UnlQZGUwUjJmVGZJYTZYQzh5c3FrTkpKVy82ckdjeFh4WWdaS1FpVlRySUJs?=
 =?utf-8?B?dTZSbWdCVVZEb3RWVTdXbXZvQWk0YU5iSXFCRmhjMWY5YWZNOXZJakh0elVD?=
 =?utf-8?B?TklnWDZhcEdZUHE3SUozNUYwOVVBWUdmWUdQSjdBV3JBRE02aTV1MTRVZlhK?=
 =?utf-8?B?K2wrT0VVUXhRZ2lZa3NWbzZVVDVsOFh4TWNxTUJPcG16V3VGWXRYVS9VNVZN?=
 =?utf-8?B?NDFPVU9CZnhKTFNCdnZacUwzNzVLNkgzOFl2aHpPS0V2ZTZKeVFsUEw2Tzlw?=
 =?utf-8?B?MDNiT3R5V3RJSGRDSlJ3UGt0Vlcxay9KMnNDTXpyWmE1ZHBkOFlKSHkxNW9H?=
 =?utf-8?B?RERWYzZEREZOYVhObkVaby9YcnNvbXR6TldmODY3ZUZBcDdJTlJacEExOHdM?=
 =?utf-8?B?QlVvVDhicDdXek9IT29TRGgwUGVKYmlNczZOWEcrczNPdTg4Wm5EQjN1ZmJJ?=
 =?utf-8?B?SHllT2lGSmRhTG9XV0FaczVIQ1lJOHBOSUhaWUJ6K2VPT2xyYmNBWDFjR3BM?=
 =?utf-8?B?Wjl0TWJ6Nnp2UXVZR1FwTXJyOHA1S3VUSzdVZTZoOUJEUmx5YVNEMkthT3Nl?=
 =?utf-8?Q?o+3V1yGkr4YDYNiFFQblHK96/53lsKA6oAowg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3Mxcm5CSGNyUU9WK1EvTVhTSkdnMVdRSWhiTWpKajYzaEZ1QVJMMWpsWHFj?=
 =?utf-8?B?QWxaZ2pRQ3FyYXVCalhNYUU2WG11NXZYK3pEQThqRWNJbDZEZjdvYXRKcWFP?=
 =?utf-8?B?Y0tBWUFZSmorUWhiOE40MnNZczJmdXpqazUyTFNoYUdIeUVORlBsRGlqam1R?=
 =?utf-8?B?QlQ4L2V5ZjBCTWpFVWd4ZHNNcTNrT3hjcXFqOGtZNnZqOUwwUzZ3SWJrQjls?=
 =?utf-8?B?WVBwY1c3VDQyNm1ZVzJmeGF0U291NDBEU2p6K3lnbW9mVTZHUVp1c0I2L3NN?=
 =?utf-8?B?MGN2TW9pUnJNcHhlQTBJZFpXZW0zdlJlL21KNTk3bFg5MTZYRWRvV3R6VnhK?=
 =?utf-8?B?VlUvdWVPbGRMY1VmVmVGV1p3QXdIaVM5Ylk1My9QOC9oUUVpRmNOV1JweTFQ?=
 =?utf-8?B?OVcrbzhzNUROQy8xa3dCSUEwdWYzUEdqNTJlMTJxOThXeW9JYko1MkYxbmsr?=
 =?utf-8?B?UkdwSFJLWncwQnNGbVgza21CRE9FMmxnazR3OU55TkJMbk1USnY1MHp2aU1Q?=
 =?utf-8?B?eGVPYVdNQVIvalUzbmx3eGxsa1dvemlWenlRdVgwR0JiRGhmd3NUcVZGM0RW?=
 =?utf-8?B?V3ZFcUE2U20rTThFNm1meDhGZ3ZjTjRXL2hrOVQ2UzR5ZmdsWkIvSTRncTh4?=
 =?utf-8?B?TkgvdkJXeThVVmY1Ym1aY0NSWTF2d1h2R1ZQTnBvTEZyWVZwTHQvVHpRS2FJ?=
 =?utf-8?B?N0xnT1BCQVVuSFd1d3lWNVdja0U5cnpsRlFLNWFXQ0RuU0tEZ1BiS1pRMU9F?=
 =?utf-8?B?eDdrVUpOaG91VEdtNUhpbk4zTzl0ZExBWENsNGROYStOUE1VTFNEb3NHQWps?=
 =?utf-8?B?czFjdjFNYmdDcXVvVHBZNjVjZlM5KzQzWDQ5Wi9EVEo2TXNmdmJFT0tXS0Qx?=
 =?utf-8?B?YUNmbkY1Vmh5WCtsZWcwYllyS0RNUG1jeW5RZTQzemQ1VCsxaVZQMmlNN2FP?=
 =?utf-8?B?L0xxa0Uycy9hOWxlcGdiR0lZSmwyRmFuSFcvc09mbU1SUFZ4OHl4VzhLR1FE?=
 =?utf-8?B?WmowSzV5Z2MvekNGRGI0Z0FyS3NFQ2JhcUIvRytFMFRsaXZGMHp3R0hkTFU0?=
 =?utf-8?B?eHpVaXFhQlBXeExXdEhQM3ZqRmRHU1RUbmlxVVlBMU9zVVU0dXFtL3Z1anQw?=
 =?utf-8?B?SWxSdFpMc2Rsenl4RVBraHVDNCtiVWk2S3VYdlkzcmpnTUJJYisyWFNuT0pX?=
 =?utf-8?B?TzdBTFJUTUg5Q1JVcU1wT2MrRitxTzlSU1pINjBXalg5eVE3c3U3bVBRR0ll?=
 =?utf-8?B?djhmOWZPVTNCQ1NDb3Z5dFkxNWhiRDJ2NUNNV1hVd1ZPWXlLRGlqanlLVWQx?=
 =?utf-8?B?dmlvbHR6RTFvMXhQbTlMQ21oUFp4T2dobEdUY0loT3B1K3dIY2Y2djY0cmw3?=
 =?utf-8?B?U3o0T1pFL3lpMHR5Q2dRTUxlZUNzQUpQQmlicWZNSnRpcHppR0k5Q3VlZXlJ?=
 =?utf-8?B?QnpoTlFSZk5kV0VUT1BFaHpIN2RNWGl2aDJQSXBzK01lMGQ1Qy9razFXN2Jl?=
 =?utf-8?B?ZDg0c2RnSmdSUmthY25PZmlHZHdMVjZxTUthcE9LUzZYMW56MVI4bmFiUXBx?=
 =?utf-8?B?WWVQMTlVRjNJL0wrOE4ycFJaZ2FzdEVQSDhTWnNHWWxrdzh1bU1nakpzOTNu?=
 =?utf-8?B?VHRhdFhodUNUNHFlbmFMK1FtR05kVGFVUnZOaEFxNG0yWkx4R0JRSEdFem40?=
 =?utf-8?B?SWFteHlLcThWVEJrTmlPTG1tejR4YmhpdjFGVTkvVkVYWjk1bjE5SnBhc2VL?=
 =?utf-8?B?bkh4OEkyeTJGZW9MMUNONXJBckpEY1NHWWkyc1F2TkhoOWFPTWMvaEZpTE1V?=
 =?utf-8?B?cFZOajNuOTNWTy9CMlNYTDJ0U3NrUThNVVBuUmlONGRqUUNaVmVMRGlzNEpR?=
 =?utf-8?B?T1Z5QUJUTitzakdSRXlWOFNPaW9DL0xLdHVpSFNUU081MndBdnYyaE9jOW1t?=
 =?utf-8?B?OERaaXBsOWJJZXhEbnJIMjRteTV0VnhacWQ1cXpqelA2TGh2aytLeVNaV0Q4?=
 =?utf-8?B?b1BsRjBDN09LdDUwZzYwWllxdjM5Y2dJbWtvRXA3V3dFM3hYcXE0QXlESnBT?=
 =?utf-8?B?c0djWTFLMHZJU3VaNXh2SHVIeGFrVkpmcDN1RExIeEdnK0JOdVdIQmtsV3Nl?=
 =?utf-8?B?dW9mOERnL3hyUEppdEEyS1F0bjdMdkIzbWE3cUJJOXN3Z01EeXNxNjR6dEVD?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LOEGk3fTxnyrvMSEurTI/pq8JdIjQIw1K06YR9rjsP8QkZuEmqSpYn/OtQUAd5wODTDiSYjvegfOwsPfcnjgJdoS7yVtWgk7k7y134Shdcy8Ek0NhWoW4MDfTBXhaZiucu/aGZdMuSvAlIcnb46LE/Mi3niApQqQDiFSt0iNyXM4xZyzxlxcSyZrS4nn0okfFSkkoszEW8pkaxmUbdr5rgENtM8592yqhMOdkCFpdC7gAbsLygeFqbQ8LkJYiXI/QRUM8oZM2eysBSOXByZculfiITXURb85iDB0hB1WQfOgt22ps8mGlQ/idZuPq5BrDnoKRODEC7t5x7g070VFVTqKlA8Z6WlXDzmAZT0E49dS/AWaOgVVO19R7dwSPxWCsZH6zJYZ0unpyIE6uxv6CVBRZzhr/u9dSD07ob8axhjkxkW65fuKzVl0b1/9jKLS7X/5074QNbfaN9V9IFCkxXnyi5xKx3GtgaOWiq4mAEqwkEx8b/lYfKA0Oo9+R4duPCV4M40Czl+kCWZ9RmnK3G/8kumENVmko0UZro2ZsY2VTJP+Uqi0BOfhztARw+pcVHFYmXoHahm6NxnAoH+01Q0tu87hdJq33QRZE4q+2dY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae79a59a-5101-49d6-2888-08dd977f0a3f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:16:44.5699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEyBNjzoWUGinKj1GjnRDss93oIJ4nP/vzztXlJoHlVTK/HHHpBqr/A6HRRoz6JRjcqY82lM+QxPEiCs23FVGWcKZpLV/8g7ASA1GZSZa4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE654FA166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=816
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505200075
X-Authority-Analysis: v=2.4 cv=S93ZwJsP c=1 sm=1 tr=0 ts=682c4880 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=SqInQvk15OgGHviEjnUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3NiBTYWx0ZWRfXwmfzoxR+n2PO tjCWOFSQL6sffcWFHkAMDG9//Jh8JI/x6zsmkUWA9ih4eZYoFGjzX7F53lP8sm0m/LpBRUWrvmf wWS8Zp0HBhwb3i3Z3tFe2/XZXdv0viTO0fEfBBZgQ2zlqDq3st0WSL6lRzJWQQyCCmv0bZWo8el
 WrbxDQ5Z+8fJijXldZnpskdcAAETBrZmavoYaIM8G2GbzM30/OxqTT77xKTagwQMsjTTyjyOLRF EyGp6+lzfhQA4AVqDoBmNbwrkvTejfr12kY20krwwI6+qS5SmwJA9Dj1GyEFfgBxjki9pLYFJmU B+abjSU/AHv1+oRdf4YDIjf+2YMZ0Cunx5n5ugnQT9/EbeeVun+8b2r2hPsVY4nRweIFEGxhPJg
 XSh3ryOwZFfFYaGwqrDl08UwxYfNuEvc/AnQoJW7mvirs52C4aWIrnPVdcr9WML0ilZbRsQ1
X-Proofpoint-GUID: QYF-GHq1I7A6lCgFcDGHpx-wxHGfwnbD
X-Proofpoint-ORIG-GUID: QYF-GHq1I7A6lCgFcDGHpx-wxHGfwnbD

On Tue, May 20, 2025 at 11:09:05AM +0200, David Hildenbrand wrote:
> On 20.05.25 07:23, Lorenzo Stoakes wrote:
> > On Tue, May 20, 2025 at 01:01:38AM +0200, Jann Horn wrote:
> > > On Tue, May 20, 2025 at 12:33 AM Usama Arif <usamaarif642@gmail.com> wrote:
> > > > This is set via the new PR_SET_THP_POLICY prctl. It has 2 affects:
> > > > - It sets VM_HUGEPAGE and clears VM_NOHUGEPAGE on the default VMA flags
> > > >    (def_flags). This means that every new VMA will be considered for
> > > >    hugepage.
> > > > - Iterate through every VMA in the process and call hugepage_madvise
> > > >    on it, with MADV_HUGEPAGE policy.
> > > > The policy is inherited during fork+exec.
> > >
> > > As I replied to Lorenzo's series
> > > (https://lore.kernel.org/all/CAG48ez3-7EnBVEjpdoW7z5K0hX41nLQN5Wb65Vg-1p8DdXRnjg@mail.gmail.com/),
> > > it would be nice if you could avoid introducing new flags that have
> > > the combination of all the following properties:
> > >
> > > 1. persists across exec
> > > 2. not cleared on secureexec execution
> > > 3. settable without ns_capable(CAP_SYS_ADMIN)
> > > 4. settable without NO_NEW_PRIVS
> > >
> > > Flags that have all of these properties need to be reviewed extra
> > > carefully to see if there is any way they could impact the security of
> > > setuid binaries, for example by changing mmap() behavior in a way that
> > > makes addresses significantly more predictable.
> >
> > Indeed, this series was meant to be as RFC as mine while we still figured this
> > out :) grr. Well, with the NACK it is - in effect - now an RFC.
> >
> > Yes having something persistent like this is not great, the idea of
> > introducing this in my series was to provide an alternative generic version
> > of this approach that can be better controlled and isn't just a 'tacked on'
> > change specific to one company's needs but rather a more general idea of
> > 'madvise() by default'.
> >
> > I do wonder in this case, whether we need be so cautious however given the
> > _relatively_ safe nature of these flags?
>
> Yes. Changing VM_HUGEPAGE / VM_NOHUGEPAGE defaults should have little
> impact, but we better be careful.
>
> setuid execution is certainly an interesting point. Maybe the general rule
> should be, that it is not inherited over secureexec unless CAP_SYS_ADMIN?

I think probably we should just restrict this operation to system admins
anyway. This will be the most cautious option, and simplifies things as we
then don't have to especially check for things at certain points?

>
> --
> Cheers,
>
> David / dhildenb
>
