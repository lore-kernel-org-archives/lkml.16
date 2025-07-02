Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1161EE7A1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447361; cv=fail; b=cQZInPyHok1sZ7KNrnYau89RA1QWq2rYWcsj5jDJqXcrR1lftgLcJQt/dKHvawBE2LwWQ4JYvefBLWbsjODjAHJPQqOz30aZqcRiAHwFf6p4WMoagzuu4dp4rvw9zFW3cyWR5bkQ+P9LbgH/UswBxAYT/2tc+oHdoGI+LSsNnuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447361; c=relaxed/simple;
	bh=2yp/rpMmgSUvgm47fMauHKfRX6bOynojo9YMukl18Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fpffCEHFmAyAxT/NYmQ9HBbk9ilBtbMfop2qQ7hWyKzHYHCTTC+Pns+3OSNaGHuNINltKZBNgVXfKX+5n2IBefJhuTi3ODl6jq0LBQ0NPYvpDz0rSOFZ7vFx2AdP2+MjYxjE7IvnrEEpcyZewiTnleasJmydguRyojXul0bVTvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BXjtw2SX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IfDz8kWK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BXjtw2SX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IfDz8kWK"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627MeLu026109;
	Wed, 2 Jul 2025 09:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KEZwDV9c3r6ixwFUWO
	U/AJ7Qr+F4rOd81Qqv86FD/SE=; b=BXjtw2SX/8lQ5LBuozNGjtiI7SbtSPwDpL
	5ShjIGq7qWP4uZJDgHGjoL7b2AfjnzQx73JbPoSpGVtHEJFldwFpPPySBJDKQhKV
	vgHPceDnqCiug1IgLEbgnfL+4uEkeLBpzvdPHNAfCAevvt+9z15x7KUjftisI4RE
	4AY0VB9VZHXrIqutzffj8n/wkr2Jjmm4qpMe43PrbSjX6Fo9AMdPBGwaK2UWjVM3
	3dIOWdQZNTWlosDKKwmJEf+Lvj1jArqGvrm8pj+XpoE6K8ysTjf9By/jhImLlf3D
	oy5EtIy2fzJWllBhQz6Y/dstDWIgb8Hf0tGxbVTxgx02kquZZZ0Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7ws26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 09:08:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56281KGn019265;
	Wed, 2 Jul 2025 09:08:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1fqaxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 09:08:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYmAy2ABD+v7IzEyLBkJycwzciOFCFGdUCFZlJ7sCfY41ZbeyVga/4nJgVe5gGz7cwl2k8wBTZBI8ivPSBnPSc9W7hq7P592GOYaotw7HtmwMjr2qg0GMgMEnEbFLAbR8bBVvsJtFmOcJfFhybYA+mPCS1+/MSU50ePQs36+nVTLwjd5bxpSJIAm7BWblMhMVClJ1UfjqT09Ae6m3pPTX7DSLLy3qdX0GS6bIHahl8Uhz5OG+kmTmknSvEP4bvu0NqkEOTE6p2duPRh53jo3ZzPGLh3AV0GJYj33GL+jPTwVtqYGmw9LlDSIhL0CAsbSOLgCzCzY5s/RLSHXLIIQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEZwDV9c3r6ixwFUWOU/AJ7Qr+F4rOd81Qqv86FD/SE=;
 b=czrIlxr1+zhNT59Uey6TtzsqG5G7UL4Ctq+GPRY8KvAvvSZxsB4bReXmBpkDgT3PuEzv6mOOx+RI5t/ru0PzopP7U3gGRSxincjHuoKJcsfaG9NyZxnzmGz96a5OTsw5qzLF1VHvHc/IN8rwuB/Qa0N5NYYcuJC9g/zBm4hLaJkSh8ZeOanQeA3CKlF9/uOG3fnaOn1JA2tGx7Y4DY8HpjBQ2L5flAMB1BBI3qllPofZN9eQ6JNznT2w+y73mxnLi5/dwRBQwcxQIM762lJpwUZfCe1gUvIkK/hlELPK/AULV0QWJD9YmdAmpMv51A7N4tU4nk5YxKz8quzA9hragA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEZwDV9c3r6ixwFUWOU/AJ7Qr+F4rOd81Qqv86FD/SE=;
 b=IfDz8kWKChQkLJNB+/D/+IrpkQjbmNKKTX9cBNPxas64jNWO6YXAwe1zm2qLvq6HZal4lgRBl8C0UU+BPXrZ5VYuSMGKybhEMpKXJZSoI2uoHcEMBk6Jz7Wc8h/chYgdVW+mXzxos5ZkX/peEEpeGvZtTRu5A0G/R9wectv/8oA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM6PR10MB4204.namprd10.prod.outlook.com (2603:10b6:5:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 09:08:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 09:08:17 +0000
Date: Wed, 2 Jul 2025 10:08:14 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
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
Subject: Re: [PATCH v1 2/4] mm: smaller folio_pte_batch() improvements
Message-ID: <14e4407c-11b2-42bf-aa63-343762018877@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-3-david@redhat.com>
 <aGTw5ipC-ITJGfv0@localhost.localdomain>
 <1d98e96b-4bc9-45c1-9861-e0f3c5930ec2@redhat.com>
 <753a8900-d9ff-436c-8758-17d363967b30@lucifer.local>
 <6092c44e-8800-47ec-9cfb-a1f062ea122a@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6092c44e-8800-47ec-9cfb-a1f062ea122a@redhat.com>
X-ClientProxiedBy: LO6P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM6PR10MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 247ccaa8-f576-4898-bcb7-08ddb947fbc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gawssFY54pVcHYYSlH4CunRqmdxj52AW9nS7S9scHTsgHS9Yhibmm39NVq1I?=
 =?us-ascii?Q?UfHQpRTkJxgEabsC+X3UFBFF1g8DPh5j147K/W/fGqGjoLZqgq9ct4lTrzEn?=
 =?us-ascii?Q?rsKLmWC8X3YlFIUKCKBWPdCI/Mr7bjHrBejtmc/fBkiIB3MJXsp0sKNSymHy?=
 =?us-ascii?Q?XsGM/qCjKrKWcp+iXiiTc29U3suSNNgadxexF1U9fwb1Io1DZ4piVUH+006/?=
 =?us-ascii?Q?/92LVIhv3iaRVOZgMQK3uwrUvAy2OsDy6GKwWBb6+V8hi+tyaYyvH39JGZYH?=
 =?us-ascii?Q?IPc7QqvBJP0nAr32HT3WjdZz/JAvai895pVwJbsHXRa+7f4WKi94Qhb2LYdD?=
 =?us-ascii?Q?Q+aGPcRDwMGTk17HzmMealEECj/+lAsk7oBflLBiykzSvnZl/i9HKEloLmHN?=
 =?us-ascii?Q?M7vggHrjgQK+MwtGFW9Qw0NmhUkEvgI/2oSXKH2XbRKwGZt72mKmGqc/sluZ?=
 =?us-ascii?Q?ouW/kH/M86jAExFgq4R8r/0uDHMAEjFIv31bJ7H+uOJWGD+ejRR/CffeVCIG?=
 =?us-ascii?Q?vOxawOXLD+piBGxBUCq3ChGNFX5RE6e8CnzDO4v3Sfj629FK/f5d2D3WVcVB?=
 =?us-ascii?Q?1MjRC+KWA+zilhy2AjHT5wd8LOgkMnqszw268y2iMrI0d0NWExvsVZt/C5iu?=
 =?us-ascii?Q?lAQoJjZmHeU8f295IlKIMVrRYmhJkjTFkOZysE50H9dMdNiBbnKjANPk9V1U?=
 =?us-ascii?Q?rsfhWjLgJzIsYJHLX/2MTDn8Jvmmu/2l2/kJsOdgi/h7/jPjurbFhQLxoq/9?=
 =?us-ascii?Q?6ERhxcrzGxsGXkSS1ZREvzS6scM3f89x6c7UtOCrgQ3PQZ/s71hN5ZnWeIWh?=
 =?us-ascii?Q?Bbn0UFP5KFD9U0f953bzLZtGWXmDMKsddEI5si+Ms0/AE9931ciQwxnspXqr?=
 =?us-ascii?Q?eEJiuroqlezTf6U9qgQXR3Q037yej784YGgpyIRo/cpGdh6CtSH2obTyzhxD?=
 =?us-ascii?Q?8COWnCpNVjBiD13Lc01kXVBsI+jVjgWV4WM4qQFuAtz2N8C6Vms6iTh8KAk0?=
 =?us-ascii?Q?JwWencxzopM+mGsHluooKsO4LleQb6C51x21jb6Lk4KMywaSJoXPlcymMUfD?=
 =?us-ascii?Q?/kifjiVEXgoyAxDNWQZdGxxaXgEFqd5c01WgiuKexh1ZDezYrn2scCY9ezzq?=
 =?us-ascii?Q?UwuFo4HFLBVYx819EQPA552eW+zRmQ/KjLZHvhQKBYHvDYjG6wTqi4LCofWJ?=
 =?us-ascii?Q?ZJW/lUiBFi/MVDxGIXy22dUZ8laf31f9OqCoN1PFgRN5+jE4gOCGGpfgh/Ff?=
 =?us-ascii?Q?TLc0esrGsSrnlX8DQoN+tBconn/n8AtSIkaGw2jE2jjryaotKJYU7vLyWTrs?=
 =?us-ascii?Q?Bqw5xJhPnPQo/1wVJxkO/7N0AZFV0ho1gums2jxEFRaOLb0Um3iMJ2SLe495?=
 =?us-ascii?Q?4eFoabS996BOZd4GmwI6xAcz1uRO1kqogZujvv3FKtFEFAysvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qAoVcW3x/OnUlGX2k7PsECzNz53OHyU4fD/Sl6aFWSNM+bAEQ+wfgKuVE4/Q?=
 =?us-ascii?Q?5JKuwekB40nAXPgth71Jel4o36zAV+p37UIv/7Q2zcFM6JSefGHamU75aeJQ?=
 =?us-ascii?Q?EWLikb6ljpHuy4JRCRv3XZc21Qmoz6RmPnkey6fcwi0UsxEeciMCqabtRKad?=
 =?us-ascii?Q?cnXwW9uqDrSLAAGysUHqesEf/8Ii43XbrP4W67JMB7XVZWRG4NEoXl8oq+p1?=
 =?us-ascii?Q?H1pJSSCfOIioKzqlKfG0utjvtkHcuFjMYHGWehHvQadfY75c8OD19piEPUQM?=
 =?us-ascii?Q?LISWRONIPZ+SH7F/oKuwfMgijyGKDIUo4LLejXiApYgHCTTh4FiyLHmClE/T?=
 =?us-ascii?Q?9kYwta5LyMQZiOCUp1a0vFy0K6nvfA3/Uo5eQFckw/XGYSLzDr4gyUZzJrFS?=
 =?us-ascii?Q?5PHcGgUNH45s7Rp6UhYxmfFYONebdEvdwa4NVFSP1Z8gN0GMuZGvotjGHcnZ?=
 =?us-ascii?Q?FbgJlApGrRnVY0pbfBtF97+PTYFnYBCPIHwOtWYzUmsAGKYHY4zaEk1OxrrB?=
 =?us-ascii?Q?qnazQw8waApE1LO1J5flAHP5Fw+8PkkoHG0IncgloxiaEnAHQC1tZQGcMk3S?=
 =?us-ascii?Q?ANErCxQXoOLqcF+qXwTiaEAp+DaB/RKEgyH/cGbqaTY/rZ8rbO+Xoki2Imsv?=
 =?us-ascii?Q?XZLPYfQUwEgFT3bXov8/QrnOHyHPQtr+FTYkilsBeBQpyyLxPhq+oLIBdKGj?=
 =?us-ascii?Q?QoY9CjHiSEkmZ4qWeaBy43X+kzXFxXFBMC+jtxWvfsgzxEbv9CYX939E3Dek?=
 =?us-ascii?Q?THTU92KMynn6eqIZEqLeaVo3xUP7jSvD+UlLPb6IglZkR1F7Cx0IrPfSbpgK?=
 =?us-ascii?Q?9qZIxVQdIr/9KGlS2bo3T5DOln7rkdRJJb72G8gHud8fGXKTyxhioVEpa5ZN?=
 =?us-ascii?Q?2I8wpp4c9EfMRExuJfQYVe4cFVee8TJGRaKSZbU10yGE7TzjF6GWitUF/onC?=
 =?us-ascii?Q?yfboUCqAf5GLlXcAlhP/v23Elpe9uzIm45QZYeiwtMsOzwGrOLGDLDeSLBT/?=
 =?us-ascii?Q?LtVOf/24GVW/vkHFGQGlJQkTpM9Sk/cCB8BN0uqmttd6pueQAz1c04fp0FCK?=
 =?us-ascii?Q?sAxVLuYz8nZlYTNEZ+sYbunEzItNMnFJI5vv6LYotD25PUmLFPeeIysgqUjr?=
 =?us-ascii?Q?u008M+LRst8wzSc4YO544G3y6FP6DyRuWnxpJy8zwl2DrYNg93Gm3ptH06a9?=
 =?us-ascii?Q?/LCeCd85AUcoUS1BHBg52+TOcMjMW0X8PLW83gIPanByDsq1qnwMr1bYt/rV?=
 =?us-ascii?Q?KKQj7koaTzbnuhiAV5NH80UWKnyvgrozfWR4OurczespoMzMcImi1z9FeLeE?=
 =?us-ascii?Q?NCTFHmZDLYsWsozpp70azY7xIsa3x6cFHQLAdsUxXXDT0INbDLS2FM3aAhd3?=
 =?us-ascii?Q?OHa3i/L6hefDB2VRBkSOlC5V30xfzn4whQusQrdTyWuTeIYiqAwvTl6brVq1?=
 =?us-ascii?Q?pSfJzYqBNS+gXOk+RkcZ/vjxOK/UQ3pI/McFZft1bOxsO3c+FyBdrNgtbNB6?=
 =?us-ascii?Q?xAZ2M7PWOLSRjZWmo109YyCRroszWqfHlEIrlxvp3eQc5tCWJD2D4fqean8V?=
 =?us-ascii?Q?Kxq/HqHN0ED6u/mw4Itbl2GXVYhvSh4Pq6VF1nWEOxSCMBSI8+8NpR9o2Bce?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	39x4z42XyW8NJBefuOejtvuFjI+cULha7ba37tNv7kKEwJTrLMkC1+Tn9+SaoMxmcGbrvMDRdyiU+BksvNXG/qhMZeAo2nyCjSxr2Jq5ATSC29VB1LdlhDdS+USYQuUoaHfe1l07YeQZ4oLw/1nMgpBL2+ckX7iMFMs+wmAGK0o5FIaEoedhQ6cyYGua2PPg4mBeoVqNYzQWZURP5n7FgsVjw8eDFqg9xtbw1TaAC47f2JkHCantlKv9jxRaGcsKUaev1lpJ4vZ1nin4kS159d3lyDDQTWAYlfbchXfZw4ZKRDM40o1PLvaZgHOoggVZt8r4ZJcy7H3D/EeoVR/1BPP9QI7IcUGUIW7jikN7zyUtf8MwjnoSGdKD9/Tq6Mx+lgIT79aLZwGxG2G5RFAsk05rpbrjwSBu8Uyjj/HnGfHhz18Xqt1b0+c5R0SwDGS6mS053on8csnHp5dpGZGO9LT3LOg6Iy9DUyjpemN0pMaxZc6ltzR4+HTrXxnte0yqP+R2NiFHu2nRWNfXjPlARIBlInUyBFGFXnz/MPQyY6ucKFkcJKlwAHE3FDCW1p/0/AT2+HlWczDHfCjucPZ10hDpdk3hjtWoDuryVSSu7Bo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247ccaa8-f576-4898-bcb7-08ddb947fbc3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:08:17.5015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oL1scUaR3CFIHE8CfmkOrps5mq/NbBfZw1tjGAOVJSb+7V2rgPx6UyICe9GD0Ne8SG6iARXvVxfkSVwvLio+Q9xeClhGRBQpkWgcfdJDmHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4204
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020073
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MiBTYWx0ZWRfXyCWzJyWQwCym XG+OX9nge2DHdxDoZKvGn1lUU/30D0e9ipXHtASwvmYPo5MuKhuFooqeBSRvWXJaWLFgmkwOZf0 f5SmG/dNvfMOphBZnRWWU/Y7buukBfaFgYe8q57K3VR207BuqCYW24VG2cNdAfcsDegaUnSyGeL
 VjJVWMi2m0zh6KNQM9nfcQlhMhitGl62mJDRDXPOp0UiYUJx9DLN1mVQPQO05m5PEySekOLGxVW Ia1+b+/Ka8OHffpFV8zVu4LINTSAoHpMYUdFaJ3I09KfdqZ+et77jOizFEOLzDqOKBWA9ZTFvYM eYBdChaR3CPYjZINN/pnvLeQ1RQj8uoERXdNJFrE4XBD+g5+rZhmDsQUxRmcXJYTTzEv/fZq7C7
 kOgMVe8zyAdF6mJlAyjH+hCuIuoN8EPntUdDj0xUfhPjHJ0TBwwz+mm22TqOpcBTcdZ+Yeqb
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=6864f705 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=-DsTEeoZ_0ACfp3EGBoA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: aectUsrR2lqPMY3PvrZBq9CiHq945yGn
X-Proofpoint-GUID: aectUsrR2lqPMY3PvrZBq9CiHq945yGn

On Wed, Jul 02, 2025 at 11:00:48AM +0200, David Hildenbrand wrote:
> On 02.07.25 10:51, Lorenzo Stoakes wrote:
> > On Wed, Jul 02, 2025 at 10:48:20AM +0200, David Hildenbrand wrote:
> > > On 02.07.25 10:42, Oscar Salvador wrote:
> > > > On Fri, Jun 27, 2025 at 01:55:08PM +0200, David Hildenbrand wrote:
> > > > > Let's clean up a bit:
> > > > >
> > > > > (1) No need for start_ptep vs. ptep anymore, we can simply use ptep
> > > > >
> > > > > (2) Let's switch to "unsigned int" for everything
> > > > >
> > > > > (3) We can simplify the code by leaving the pte unchanged after the
> > > > >       pte_same() check.
> > > > >
> > > > > (4) Clarify that we should never exceed a single VMA; it indicates a
> > > > >       problem in the caller.
> > > > >
> > > > > No functional change intended.
> > > > >
> > > > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > >
> > > > Hi David :-),
> > > >
> > > > I have to confess that I fell in the same trap as Lorenzo wrt.
> > > > __pte_batch_clear_ignored changing the pte value.
> > > > So I'm not sure if it would be nice to place a little comment in
> > > > __pte_batch_clear_ignored claryfing that pte's value remains unchanged ?
> > >
> > > I mean, that's how all our pte modification functions work, really? :)
> > >
> > > Thanks!
> >
> > I mean, it might be that me and Oscar are similarly 'challenged' in this
> > respect :P (high 5 Oscar!) but I think the issue here is that it's sort of
> > a compounded use, and in fact some functions do modify stuff, which is why
> > we end up with all the ptep ptent etc. fun.
> >
> > Up to you re: comment, but I think maybe in cases where it's a reallly
> > compounded set of stuff it's potentially useful.
> >
> > But obviously we still do do this all over the place elsewhere with no
> > comment...
>
> Well, if you are not passing in a *value* and not a pointer to a function,
> you would not expect for that *value* to change? :)
>
> Yes, once we pass pointers it's different. Or when we're using weird macros.
>
> Adding a comment that a function will not modify a value that is ...
> passed-by-value? Maybe it's just me that doesn't get why that should be
> particularly helpful :)

I think the issue is that we've passed around 'pte' as value and pointer (and of
course, via macros...)  previously so that's the cause of the confusion, often.

This is why I really am a fan of us consistently saying ptep when passing a
pointer.

Anyway, I think on balance a comment isn't useful here, agreed! ;)

>
> --
> Cheers,
>
> David / dhildenb
>
