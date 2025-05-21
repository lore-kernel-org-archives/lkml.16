Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB116EB79
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747852865; cv=fail; b=ClHaRunE6kx4qz1hweNLK6KOSROTNgxLDsOiRsoA25TqX96MBygUaEQhYeSDdw9M6i5i2zM2nX6xRLmuI8ZdGlEcxpPWFsslCjjIf36/r+5fQJm29iVQWPv9MQewsAuMrEbSCZ+CKfvnzkNrpjudgrnmutLBmzqqQfn4VtyEezY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747852865; c=relaxed/simple;
	bh=OhRXsdPzxHJ4E0+Si2vEHHj9Q7zrT6gJuq4L9AavdU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uY1fmz/rIuxkUwxnVulX0lini1shaS7P96lydvl8UGHpZytdrZOBljGwepoRGfUdMlyN8zT9MbG1snp0O6UADKnJN2KNNS4pPKI7bFzq88WbRdcJJlf7TX85H3k/mcF+pfI7MWSRRful7eVgcctEPILYW8oZvQOPmwt2FAyRiuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jmfpVhbY; arc=fail smtp.client-ip=40.107.237.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jmfpVhbY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3HHnWxuI4SBMBc9iu0sWSpHDVIxNRWdienR+ZIrx3bu+VNfPX4DZwkLHvbYYBQnZFH3lM3U3VDFHRP8XT/ut3AgCd+lTd2Y9JAX0kD+9tFHCBNhXXu9GWFDR5dnFIahcfQ5wADzNYdc8LSmoqoQeCv3TWkiuQm5D8bednXV7WjhHTBnv4ir+li1hB+6GyYoH8G/iksj3afPAa9FKjfbgr+093zZLgcmGnHg/nSMeWgkg74KnoHKVo8pW068c9cEzooLMDb54cBepMseXeRSRSbH8m1A+MWMpqkFPIw9gve0mzIdIE8w/MS8iHF1Mk/QORZmP5Bc4p8WuihYd6jp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSYZiyDWHoqEfMAXRXrs25TBGvmRnIsxgPbtVUo3t6M=;
 b=Wt52oRbSrXfPc1mL15PD8/+otX6WGg71X4GXow+S/12tEjqbRTQJ6Jzt6LdoIk0vaEJVv6uxAZHaA2imMASaLZqn5/geNy03gxNMiZ7WyWO7Wln7SohYBLv82EYQilVOykWI8aexS6Vknvhec2Ju6Um1mvsMtpN/Gpih8It13Q7HItJ9dcA1cBSR+r27Wk4P+aIcOVzZBH7aluB0z1Z9DwwSDuCKRdLR/9FuCApoqt2fycGb/qiXolZR22Nr2MERdQXSySGKhRm7DXR5CR/h3riN5kmRRKEMw+sJvBlKZGggSDmMqrgbNpgm4nad6LQkYVcpHefDOLuww7NZZcfLgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSYZiyDWHoqEfMAXRXrs25TBGvmRnIsxgPbtVUo3t6M=;
 b=jmfpVhbY7m872l6WH5Sb3C1RS22dYxnC2KSUEczTQZ9Z4IMnEAouw3oDFmKLtOSR2e+jOOqU/Tww6gIrBg+tRTV5OJ8lKisk45D/7UaLsxFn8CNlhsDl+quePUtmRuhchFfl2RwHh6pCmTCcY75fpcPleT5K7K81fYm6MkdI93f2Eb5fY7XuI0KhNYaKPuWl7kuY1PH/pJewHe4FyrMHiUz9sL2aRq4bMhMSXBROcm1DGshJpTGbRgl7KmZtQUOzokN8Z28H1WTUGrXrReFN7U4/lIzHVIoMl9AxBEHK6ReBi6qKCHe2pH50xjxUUL2zKvpan3GGW7bZx9BS1GbouQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 21 May
 2025 18:40:57 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 18:40:56 +0000
From: Zi Yan <ziy@nvidia.com>
To: Bharata B Rao <bharata@amd.com>
Cc: Donet Tom <donettom@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
 gourry@gourry.net, hannes@cmpxchg.org, mgorman@techsingularity.net,
 mingo@redhat.com, peterz@infradead.org, raghavendra.kt@amd.com,
 riel@surriel.com, rientjes@google.com, sj@kernel.org, weixugc@google.com,
 willy@infradead.org, ying.huang@linux.alibaba.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org, david@redhat.com
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Date: Wed, 21 May 2025 14:40:53 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <6795B38D-7858-4ADE-BB3B-71A1950A284D@nvidia.com>
In-Reply-To: <a6c42783-baf6-4463-a2f5-9a6d3e380865@linux.ibm.com>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <a6c42783-baf6-4463-a2f5-9a6d3e380865@linux.ibm.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0396.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::11) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f966a05-41dc-48bf-e644-08dd989705c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DzuO6LmPFhSgoRSuRrJJEqjdjX3v5m5Cl5KZnqO6dttvBxEXNzZ7/eCy5Xdd?=
 =?us-ascii?Q?N2awH/FS7BDRFxoTtILyEGydpqecrNW+p7lMq/nLH9SZ3BWoAJJidlM7evXA?=
 =?us-ascii?Q?vsNn4RzEUOgEUpj/zDBS+aYATipwUuTTPomebhargz7NL1RumseeoItYiPhe?=
 =?us-ascii?Q?qVXhAS1IbHwwcCDbBckU6X61XvrQEPNalQPimF0ENnIgERnXjpQf9+i5uTie?=
 =?us-ascii?Q?isbKAfxS/3+M3lCaJKjK9dEZDl1hzmA4Vyw79I8KMo7bEKCFnLIIkMzv92OT?=
 =?us-ascii?Q?hlXN6MilZxVOGKzYOx7KY7gruu+8wyxv/DtOwfGbhQkYxkftSfmcp+3/6+LB?=
 =?us-ascii?Q?honu4vmhP2ZpY3P7WgjLfUm5rhe/zg1z6+JhF75E966JUqjJyg3Y/4MOIt7U?=
 =?us-ascii?Q?TwuEjNUGPeqwH9OpXCs9NjsDHtMCkZ/KvqA2qG9RjHMT4zGysOsao9xq2+Lq?=
 =?us-ascii?Q?bX0L6vpfTHcPCyAfTF/m3RI4K2smayFmrIRGaMNi3cagxuCpKJRdeoMHbHx3?=
 =?us-ascii?Q?Q8pmwcDxt1B0jWNRVUPZS1vpb0LdUkzewTv26xpZ8Ffoet6lleak1jnzdNsu?=
 =?us-ascii?Q?CVB6S+DVt33hhAQECVXiVt5M6EhzX6MZVCMSPVlxABwIow7ZCi7RZGHlYJ/u?=
 =?us-ascii?Q?BNDjMAWYBZdroi/xeLFQY/nvjXraQxw3r5K+DbAxD68hM3nxGzdVKCpuR5JE?=
 =?us-ascii?Q?bvDro3XVR2EIf88fphc1kb3HkwZKM26tNr8VKMU/VZMcFA/q+ogc+wqPXy4K?=
 =?us-ascii?Q?XNV2YGHPikyvvbLrH2mRwsVHf/R5Rkt1MEeVLDlSkakGjAwRublNjPDZo/e+?=
 =?us-ascii?Q?3cKM0oCl5vwUqV4EBA9bdlTjNw5Ltg9XtUs0mMBh6wEO0B9cI0M2W7G9a2cn?=
 =?us-ascii?Q?UpfYiP/xIsQQ2GO57hRtlSTsHWP+PA/TrLjcjY8+Cwx/t6ovuNVlUmL5xLTS?=
 =?us-ascii?Q?k/l21Js7Kx79ZGh0eRL0vHV/ntDzmR/ux3rtFxxrLh1NF6gA2aei92x+pCiN?=
 =?us-ascii?Q?Q3MvlVWGZ25r9ZYqW+Q+rcdVy5dtN95KW+DUGq/5ahLawMaT6BL9topfuPkG?=
 =?us-ascii?Q?Y52qEvY1mGLDXFpWHcVOl06+XmGakkI2vX2P6F9CQVtdShAGS1V0NAg/AfWW?=
 =?us-ascii?Q?OTcCIgyLdEcmjSSxoKmtBL0r1Kl8j1iM+OnQ9SLjzr91Z/EKJsy2VQ6FZech?=
 =?us-ascii?Q?e891/HfMEG67to1WOI1zHi8VYDqKTyInueX8Q1OPq2/egmIUv4UTe+48Af+o?=
 =?us-ascii?Q?Ux3JDkqUbzQlKeHMyq6mOZNp0Q0XmK8OSwmMhnNszXIAm/oOPKG9fI9nhG1r?=
 =?us-ascii?Q?NuyLS1kZArnF6oy4v74E035Eo4MpxjkqkFXhdDur+5Y7B01tpZu3ef3BnJy8?=
 =?us-ascii?Q?kMkNgrp1Pw3jTkiRKPk3diO0SaGkqmPXcbrkySwgfT9kuSuYdg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SOZjOv3q1dUNVHB49a/CsL7K3V6F68YFS1cspmpCGc3wc4Kjbu/T6fVzTHZM?=
 =?us-ascii?Q?turbIrntu9ClrULQW8qDYyoc9RJT5DO15qBrJa/NnzCxXSQ5JvQgZxhkeXCS?=
 =?us-ascii?Q?+78aQReP29V5Ze7huwRh7FS1zseta2QhN7dKEU3GOmcFoYw1hHrVfhN1VigV?=
 =?us-ascii?Q?FaROqnyBVSVqMeVRTnz9MQWD6vLpFLgD6FdXUWOsg/iGEdFLtfDrmHrp4jBv?=
 =?us-ascii?Q?+bPy3KxUdo7fUP+TMRpVbkl/PPXKATBfbPqyX207cf6wTtH18oEVOjBRi7cN?=
 =?us-ascii?Q?gWomElLecK8ZUjn8WSlc4GY6ezPBCtvtRI0svs9AIiGsgJerazBVBNsm8lvG?=
 =?us-ascii?Q?E/KrGPU+/i//S+tHpaS7dZuqkVKBYk5H5fv3mm2F5PQm38vBxO2YFEpi0N41?=
 =?us-ascii?Q?a5zZJ3Lw6XvN7rZ/I3JxoFWhGieJaX74U+6i3T8ME5uKKKrHgtQTqTdYUhBm?=
 =?us-ascii?Q?p/W67c83gJhNu1JWjsarAKY3CW1i838TAZU2MkUcYzi+m1zrnnjPxflwggiA?=
 =?us-ascii?Q?lxBjFtVJbJZq6jyDl1YoJFunWhP8r86V8ZXCwY1h9dv4Qg583p3gKZgfZW07?=
 =?us-ascii?Q?AaLPq2hd+KOaIk35vNcswYOK8CEuE4dDvOJ9AY01vOFhzDLBUYihrUf+fW0R?=
 =?us-ascii?Q?14lhk+C0kinWn1wYao/g1PRs5meidHRNiZaplmzX5AG8Nq078zPoOjaMKKlU?=
 =?us-ascii?Q?5bcGSaiSfRIAsKVxXmq+UyGr8rAO6rqIWpo/eXrRuk2p3X4RvYUj6o/Q9RG+?=
 =?us-ascii?Q?fqDwar0iDJgPIgMeWaWCu036V2wnO89JAKciJrAl5yLU0aDNKdbRLzX+n3ge?=
 =?us-ascii?Q?HZplCCYpWYvwFWijFKNMHJ4sJzFQz2l3Jyu/wKDr4Shl4Tzg6Z9r6lCUsB3k?=
 =?us-ascii?Q?k2WAcKDaAQ6zJASVQNNtn8VDn5fgnSW+nfBFFkAomhC3koonSCaEAkRgRmTH?=
 =?us-ascii?Q?VfmebyoQCntwbW2q2UzccgOwRJiAzyrERtKiAb4fpnAjY91n03TPopdr29qk?=
 =?us-ascii?Q?e+VhvZkKE2SlUqJ/Fy9LLVMmeSf28PyOUArn9wAAPj3TPD5sUeiTt9kOrQlo?=
 =?us-ascii?Q?bmyKeSf6hM2MHRmAY83Qf/o8cSf/M7sNxuq69Ck9+NlKnqCRJEAsf5pWpddJ?=
 =?us-ascii?Q?GLuS83AnxuAHiF5Dzx3khosO2z/welN11yDlucaAVVvkEmwq87GrAzq6Ilg+?=
 =?us-ascii?Q?Zrj55a+TqEIQv6ceSUUF3j0NnFp6YqTNf/VnB7zmNPaoFssEOZ4O14LBQXoa?=
 =?us-ascii?Q?wPtn3D9llm/0+oqUn2FhA9REqs0CYBpC9Hw4/RLOXVLWMxjJpqyRlkt+U2+V?=
 =?us-ascii?Q?d3ZtFVrMjEStxOMi6ulUZhxI3s/1ivaJTAAb+1i6dZAjTUbWpbxkphRY2TMm?=
 =?us-ascii?Q?3xNMH+umEaqI9qwp8yDm53yA8UWAakWPfJboXL/EIJRrq/eRtA2Gif+JKIqN?=
 =?us-ascii?Q?ToHG+SdN0IZMsx9TA+eZr7DNJBzuKQEXAFc2bZWqT9oPSsOVrrzb9Im+5uDF?=
 =?us-ascii?Q?yi0iXRoAqiKhoc/EUVdEuI7cBk3guPA7K7N28155/COoAXjzjOIQnesmMiOU?=
 =?us-ascii?Q?/Z19YB8wFYWS98AVmh7Qb+hxJ//xaROA7TZFNEUB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f966a05-41dc-48bf-e644-08dd989705c4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 18:40:56.1925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqSWlrWE8pKhXB/B2ZoOkFejYzMqKOvMmVxUwVzVx8BARlWhZ1byqyUIsYb38DM/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154

On 21 May 2025, at 14:25, Donet Tom wrote:

> On 5/21/25 1:32 PM, Bharata B Rao wrote:
>> Currently the folios identified as misplaced by the NUMA
>> balancing sub-system are migrated one by one from the NUMA
>> hint fault handler as and when they are identified as
>> misplaced.
>>
>> Instead of such singe folio migrations, batch them and
>> migrate them at once.
>>
>> Identified misplaced folios are isolated and stored in
>> a per-task list. A new task_work is queued from task tick
>> handler to migrate them in batches. Migration is done
>> periodically or if pending number of isolated foios exceeds
>> a threshold.
>>
>> The PTEs for the isolated folios are restored to PRESENT
>> state right after isolation.
>>
>> The last_cpupid field of isolated folios is used to store
>> the target_nid to which the folios need to be migrated to.
>> This needs changes to (at least) a couple of places where
>> last_cpupid field is updated/reset which now should happen
>> conditionally. The updation in folio_migrate_flags() isn't
>> handled yet but the reset in write page fault case is
>> handled.
>>
>> The failed migration count isn't fed back to the scan period
>> update heuristics currently.
>>
>> Signed-off-by: Bharata B Rao <bharata@amd.com>
>> ---
>>   include/linux/sched.h |  4 +++
>>   init/init_task.c      |  2 ++
>>   kernel/sched/fair.c   | 64 +++++++++++++++++++++++++++++++++++++++++=
++
>>   mm/memory.c           | 44 +++++++++++++++--------------
>>   4 files changed, 93 insertions(+), 21 deletions(-)
>>
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index f96ac1982893..4177ecf53633 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -1360,6 +1360,8 @@ struct task_struct {
>>   	u64				last_task_numa_placement;
>>   	u64				last_sum_exec_runtime;
>>   	struct callback_head		numa_work;
>> +	struct callback_head		numa_mig_work;
>> +	unsigned long			numa_mig_interval;
>>    	/*
>>   	 * This pointer is only modified for current in syscall and
>> @@ -1397,6 +1399,8 @@ struct task_struct {
>>   	unsigned long			numa_faults_locality[3];
>>    	unsigned long			numa_pages_migrated;
>> +	struct list_head		migrate_list;
>> +	unsigned long			migrate_count;
>>   #endif /* CONFIG_NUMA_BALANCING */
>>    #ifdef CONFIG_RSEQ
>> diff --git a/init/init_task.c b/init/init_task.c
>> index e557f622bd90..997af6ab67a7 100644
>> --- a/init/init_task.c
>> +++ b/init/init_task.c
>> @@ -187,6 +187,8 @@ struct task_struct init_task __aligned(L1_CACHE_BY=
TES) =3D {
>>   	.numa_preferred_nid =3D NUMA_NO_NODE,
>>   	.numa_group	=3D NULL,
>>   	.numa_faults	=3D NULL,
>> +	.migrate_count	=3D 0,
>> +	.migrate_list	=3D LIST_HEAD_INIT(init_task.migrate_list),
>>   #endif
>>   #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>>   	.kasan_depth	=3D 1,
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 0fb9bf995a47..d6cbf8be76e1 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -49,6 +49,7 @@
>>   #include <linux/ratelimit.h>
>>   #include <linux/task_work.h>
>>   #include <linux/rbtree_augmented.h>
>> +#include <linux/migrate.h>
>>    #include <asm/switch_to.h>
>>  @@ -1463,6 +1464,8 @@ unsigned int sysctl_numa_balancing_scan_delay =3D=
 1000;
>>   /* The page with hint page fault latency < threshold in ms is consid=
ered hot */
>>   unsigned int sysctl_numa_balancing_hot_threshold =3D MSEC_PER_SEC;
>>  +#define NUMAB_BATCH_MIGRATION_THRESHOLD	512
>> +
>>   struct numa_group {
>>   	refcount_t refcount;
>>  @@ -3297,6 +3300,46 @@ static bool vma_is_accessed(struct mm_struct *=
mm, struct vm_area_struct *vma)
>>    #define VMA_PID_RESET_PERIOD (4 * sysctl_numa_balancing_scan_delay)=

>>  +/*
>> + * TODO: Feed failed migration count back to scan period update
>> + * mechanism.
>> + */
>> +static void migrate_queued_pages(struct list_head *migrate_list)
>> +{
>> +	int cur_nid, nid;
>> +	struct folio *folio, *tmp;
>> +	LIST_HEAD(nid_list);
>> +
>> +	folio =3D list_entry(migrate_list, struct folio, lru);
>> +	cur_nid =3D folio_last_cpupid(folio);
>
> Hi Bharatha,
>
> This is target node ID right?

In memory tiering mode, folio_last_cpupid() gives page access time
for slow memory folios. In !folio_use_access_time() case,
folio_last_cpupid() gives last cpupid. Now it is reused for node
id. It is too confusing. At least, a new function like folio_get_target_n=
id()
should be added to return a nid only if folio is isolated.

>
>
>> +
>> +	list_for_each_entry_safe(folio, tmp, migrate_list, lru) {
>> +		nid =3D folio_xchg_last_cpupid(folio, -1);
>
> Just one doubt: to get the last CPU ID (target node ID) here, folio_xch=
g_last_cpupid()
>
> is used, whereas earlier folio_last_cpupid() was used. Is there a speci=
fic reason for
>
> using different functions?
>
>
> Thanks
> Donet
>
>> +
>> +		if (cur_nid !=3D nid) {
>> +			migrate_misplaced_folio_batch(&nid_list, cur_nid);
>> +			cur_nid =3D nid;
>> +		}
>> +		list_move(&folio->lru, &nid_list);
>> +	}
>> +	migrate_misplaced_folio_batch(&nid_list, cur_nid);
>> +}
>> +
>> +static void task_migration_work(struct callback_head *work)
>> +{
>> +	struct task_struct *p =3D current;
>> +
>> +	WARN_ON_ONCE(p !=3D container_of(work, struct task_struct, numa_mig_=
work));
>> +
>> +	work->next =3D work;
>> +
>> +	if (list_empty(&p->migrate_list))
>> +		return;
>> +
>> +	migrate_queued_pages(&p->migrate_list);
>> +	p->migrate_count =3D 0;
>> +}
>> +
>>   /*
>>    * The expensive part of numa migration is done from task_work conte=
xt.
>>    * Triggered from task_tick_numa().
>> @@ -3567,14 +3610,19 @@ void init_numa_balancing(unsigned long clone_f=
lags, struct task_struct *p)
>>   	p->numa_migrate_retry		=3D 0;
>>   	/* Protect against double add, see task_tick_numa and task_numa_wor=
k */
>>   	p->numa_work.next		=3D &p->numa_work;
>> +	p->numa_mig_work.next		=3D &p->numa_mig_work;
>> +	p->numa_mig_interval			=3D 0;
>>   	p->numa_faults			=3D NULL;
>>   	p->numa_pages_migrated		=3D 0;
>>   	p->total_numa_faults		=3D 0;
>>   	RCU_INIT_POINTER(p->numa_group, NULL);
>>   	p->last_task_numa_placement	=3D 0;
>>   	p->last_sum_exec_runtime	=3D 0;
>> +	p->migrate_count		=3D 0;
>> +	INIT_LIST_HEAD(&p->migrate_list);
>>    	init_task_work(&p->numa_work, task_numa_work);
>> +	init_task_work(&p->numa_mig_work, task_migration_work);
>>    	/* New address space, reset the preferred nid */
>>   	if (!(clone_flags & CLONE_VM)) {
>> @@ -3596,6 +3644,20 @@ void init_numa_balancing(unsigned long clone_fl=
ags, struct task_struct *p)
>>   	}
>>   }
>>  +static void task_check_pending_migrations(struct task_struct *curr)
>> +{
>> +	struct callback_head *work =3D &curr->numa_mig_work;
>> +
>> +	if (work->next !=3D work)
>> +		return;
>> +
>> +	if (time_after(jiffies, curr->numa_mig_interval) ||
>> +	    (curr->migrate_count > NUMAB_BATCH_MIGRATION_THRESHOLD)) {
>> +		curr->numa_mig_interval =3D jiffies + HZ;
>> +		task_work_add(curr, work, TWA_RESUME);
>> +	}
>> +}
>> +
>>   /*
>>    * Drive the periodic memory faults..
>>    */
>> @@ -3610,6 +3672,8 @@ static void task_tick_numa(struct rq *rq, struct=
 task_struct *curr)
>>   	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || work-=
>next !=3D work)
>>   		return;
>>  +	task_check_pending_migrations(curr);
>> +
>>   	/*
>>   	 * Using runtime rather than walltime has the dual advantage that
>>   	 * we (mostly) drive the selection from busy threads and that the
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 49199410805c..11d07004cb04 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -3375,8 +3375,13 @@ static inline void wp_page_reuse(struct vm_faul=
t *vmf, struct folio *folio)
>>   		 * Clear the folio's cpupid information as the existing
>>   		 * information potentially belongs to a now completely
>>   		 * unrelated process.
>> +		 *
>> +		 * If the page is found to be isolated pending migration,
>> +		 * then don't reset as last_cpupid will be holding the
>> +		 * target_nid information.
>>   		 */
>> -		folio_xchg_last_cpupid(folio, (1 << LAST_CPUPID_SHIFT) - 1);
>> +		if (folio_test_lru(folio))
>> +			folio_xchg_last_cpupid(folio, (1 << LAST_CPUPID_SHIFT) - 1);
>>   	}
>>    	flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
>> @@ -5766,12 +5771,13 @@ static void numa_rebuild_large_mapping(struct =
vm_fault *vmf, struct vm_area_stru
>>    static vm_fault_t do_numa_page(struct vm_fault *vmf)
>>   {
>> +	struct task_struct *task =3D current;
>>   	struct vm_area_struct *vma =3D vmf->vma;
>>   	struct folio *folio =3D NULL;
>>   	int nid =3D NUMA_NO_NODE;
>>   	bool writable =3D false, ignore_writable =3D false;
>>   	bool pte_write_upgrade =3D vma_wants_manual_pte_write_upgrade(vma);=

>> -	int last_cpupid;
>> +	int last_cpupid =3D (-1 & LAST_CPUPID_MASK);
>>   	int target_nid;
>>   	pte_t pte, old_pte;
>>   	int flags =3D 0, nr_pages;
>> @@ -5807,6 +5813,13 @@ static vm_fault_t do_numa_page(struct vm_fault =
*vmf)
>>   	nid =3D folio_nid(folio);
>>   	nr_pages =3D folio_nr_pages(folio);
>>  +	/*
>> +	 * If it is a non-LRU folio, it has been already
>> +	 * isolated and is in migration list.
>> +	 */
>> +	if (!folio_test_lru(folio))
>> +		goto out_map;
>> +
>>   	target_nid =3D numa_migrate_check(folio, vmf, vmf->address, &flags,=

>>   					writable, &last_cpupid);
>>   	if (target_nid =3D=3D NUMA_NO_NODE)
>> @@ -5815,28 +5828,17 @@ static vm_fault_t do_numa_page(struct vm_fault=
 *vmf)
>>   		flags |=3D TNF_MIGRATE_FAIL;
>>   		goto out_map;
>>   	}
>> -	/* The folio is isolated and isolation code holds a folio reference.=
 */
>> -	pte_unmap_unlock(vmf->pte, vmf->ptl);
>>   	writable =3D false;
>>   	ignore_writable =3D true;
>> +	nid =3D target_nid;
>>  -	/* Migrate to the requested node */
>> -	if (!migrate_misplaced_folio(folio, target_nid)) {
>> -		nid =3D target_nid;
>> -		flags |=3D TNF_MIGRATED;
>> -		task_numa_fault(last_cpupid, nid, nr_pages, flags);
>> -		return 0;
>> -	}
>> -
>> -	flags |=3D TNF_MIGRATE_FAIL;
>> -	vmf->pte =3D pte_offset_map_lock(vma->vm_mm, vmf->pmd,
>> -				       vmf->address, &vmf->ptl);
>> -	if (unlikely(!vmf->pte))
>> -		return 0;
>> -	if (unlikely(!pte_same(ptep_get(vmf->pte), vmf->orig_pte))) {
>> -		pte_unmap_unlock(vmf->pte, vmf->ptl);
>> -		return 0;
>> -	}
>> +	/*
>> +	 * Store target_nid in last_cpupid field for the isolated
>> +	 * folios.
>> +	 */
>> +	folio_xchg_last_cpupid(folio, target_nid);
>> +	list_add_tail(&folio->lru, &task->migrate_list);
>> +	task->migrate_count +=3D nr_pages;
>>   out_map:
>>   	/*
>>   	 * Make it present again, depending on how arch implements


--
Best Regards,
Yan, Zi
