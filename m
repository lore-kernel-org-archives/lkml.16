Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2085.outbound.protection.outlook.com [40.107.96.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27AF72630
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750439635; cv=fail; b=KBSN9L/IvVIN7z9M90Gwm9DTW0JmS9BzTCQHmRtggwJSXD5cluuspRiXpnaCRXTTQHCg1TiULtIaHksLywN7WPkMDc/dcqN0ygvH/TG1lkBTly7mLYQixtHGxB5EKqMG0cjF8/WJ1kntY9AlQX0bhNry1D6xv+AWJQP4H8EqoBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750439635; c=relaxed/simple;
	bh=ikakD20v4BaPM+/Q3lhblFfMcUAo+MaIIoyEUxmA/+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nio8KrzqrZSl8wZ+AO4zlp1NLfZTNvHfOMm1yNujIrj3vLimmZgiyc+hJoHvPtBAfasN7YqmhRs7HCEFnzV7eANNybDM6XMoVQLLbRZZPlUMyBRGYHX+CVGM1tPXjybi/nD45ochfNAxlTxhzH4TKMyT4jFCVbz2akrZYMoEcoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zi2NQzdP; arc=fail smtp.client-ip=40.107.96.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zi2NQzdP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5icVokMdaZaApfmkjiDcEig3d04D8BW9OLKrHBocpAAytkpbCTDnSSZDYs5ziV711dt5kOFUZOh2BWFW64yEh5NexiUeBiJm2TFaZKUtIYs5Vp8gd6TnpSOYY+jAiiEHvrekQNLceJE9Z/OcgdpG3G74GB9RHLxm7xF5r28qIiNG5ntGcBRIjoDwde1VWNPScpqehyyvwr0Ym9dLWHfv8nVjocB/uGT4ZfZf/eFVmj+tCOh8HrtXSWS/5tyxUBCsPC04hblzvxEsjnbzYxW3+B1F2iV3+tFVatYRZubmAoJxhpsBJ7ZbNgItV2OPmyigRjCgVpQrVnRN0u8xeDTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7+JgNPdWdWr7zbeD0QVzkXt2norW0PgLL2iVWcWe4c=;
 b=Gxusg/mGlaSYdQt3eTtHcGS8GtmYAo8GlGU7txGy42V3dHj/mPkA52ir4ELZBIdXBgvUGJAzC4RQex5zj2zo7vqdsd1968s0zoG8lKIQjTzANma39zTYy0H6Ty7cusvt7mJemxRB33QcClkEqHZ5Wgf+kf/KE+j63doYAzxL7TuKJXzOaHUM72UplT+TkJcn/0tRynrOwtYOSCoqz4HUF3k0j753E8VLVwU4UWEsHrPRXUiuv7iWnYO/qK4gl7mgnPrEP11XrFj75JHdv2Ol8ej3j+LHLO2nkQxj7MTdBXEmQCYC177jAjuoo4MRDYn0s3wyKJQUZ2JQnTb1GrKL5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7+JgNPdWdWr7zbeD0QVzkXt2norW0PgLL2iVWcWe4c=;
 b=Zi2NQzdPsRVbyJKjccS/FpNq4yE2ThrRbpqtjv4pyEihyD976t1onEGOgvxv0lPbbEzRKXwmknB91SQmifwULeNHwg/HXZNiyk/pxeurkmE455TZSdMwtQFHH2+P3iLVFu82YQjw3qDwtqnwEyHzFqXT54NfqfuJdlHitpcWrqn6C9t6GKeVRehfqbQY4F7TCBbXELP3SLPdxe0CScipCg6cP5cR5cm3OknLi/Ht35dA1gxp1IZtZOT4Z1okzN0g1gRzaKJavcQ694aKZyOywJJFbfGC5SRJnfqQYSufboMIN5mKOkw37MISjsLs6awfDQyaV7/d5OAmwB/cXIoIrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB6539.namprd12.prod.outlook.com (2603:10b6:510:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 17:13:48 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 17:13:48 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 5/5] mm/madvise: eliminate very confusing manipulation
 of prev VMA
Date: Fri, 20 Jun 2025 13:13:45 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <205C4897-7C81-4341-A1B6-8BC3E22A3B31@nvidia.com>
In-Reply-To: <63d281c5df2e64225ab5b4bda398b45e22818701.1750433500.git.lorenzo.stoakes@oracle.com>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
 <63d281c5df2e64225ab5b4bda398b45e22818701.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::16) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a66518-67d4-4122-a38d-08ddb01dd23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZvDxX1XD17Akkum4pspQOhNTqPkEUnEBNJ4wmmcMkZ81NIq8yzb4GQmGoA81?=
 =?us-ascii?Q?AwAMgNgEYlrC3SmBHoX0I2neWD0+saknP4IkvPxGCWpjLU51QYoIxp4GhvpA?=
 =?us-ascii?Q?L0ufbULXJrMHSAG9/53BuH1bhwGFE4Vs7dZvsdpQh9ORecoCkAiiDxwZcL4j?=
 =?us-ascii?Q?CtgxMOR3u3rQcY4fbaidaYbu4moAgo/NBh3lPGGVElarqg6ZtlAGwQgxbq6e?=
 =?us-ascii?Q?kCZX4AyolFQ5REaVZ00y2jP9H+d0ewXN7RYhVrps1rLR3d8IDQSkuiSe3doi?=
 =?us-ascii?Q?89O/n388j9nT2Bzrz/wi0Fk4r298I88amBvuRGUmqDCT62NUTGCfFBk///rv?=
 =?us-ascii?Q?QxlaHcyd/wt1v80Dvc8EDRrdC6XulmpHKK2vv5t4USMJR5hj8c8FLJIy2Kze?=
 =?us-ascii?Q?Ayc/+rl/HVLcP2tlv9TvHGMahhC6C55oJKqo8Vuv7SJx/ulROGSGMyc/hccc?=
 =?us-ascii?Q?3E/tdGfxCzNwyUHh/8qcPmpqmBeCmahvnMVMYPX+8/zo0evcV0TZTc/nG8nx?=
 =?us-ascii?Q?tYTGCJYLYZ2K8+1QzWWZadrqFKMVsyyDnBGKTpFTnkyKFPUOFE7X+T4JWT8C?=
 =?us-ascii?Q?S3HEFAkZJ46Rtf8g0Q62By/CG2GNEQV26jE84LJ/vmhxccth9+LfI3Gnw7/w?=
 =?us-ascii?Q?dou4d+h+rpIDZm1I2ERfl96LI/n7WfTNqh1cP7MeFLVwzAYNcx/1I3uXxYIk?=
 =?us-ascii?Q?n9QQrYpOwjghGvEZavP7UyYmZ3KQhAsb8f5Xu9VtNk6fTmyDLADP+FLxqqhT?=
 =?us-ascii?Q?mNMKS1HAGaqY3GwIKo1mkGtEDP19PTc7JKXhKJLvJ/AKTAvdupPkycSfE3OU?=
 =?us-ascii?Q?KXttxsA1hcu0o1tPdi7wA86pB8Kqt9PVr2QVo5cHPP+eBPEd6F2nvN6sr2JZ?=
 =?us-ascii?Q?F1JwWQSA72Y5b4Rc/1CKRbCvw3PK8SDhoL7Vm9bXwQhmNeku1UIgnAsIvCJi?=
 =?us-ascii?Q?QNf8i0riU5xaRWY6BKvGaa22iEMwmQ+ZwLNRYhVdYOZTSTNby0fLumqhjY8W?=
 =?us-ascii?Q?tjige7L5237tQIyegux5YvQo4M+zYvG+JCPr9/LiDDB+Cxqa9GH5/xVRM07Y?=
 =?us-ascii?Q?IyXfHK6Ad8t99zc0/V8HUmBdiDUTmUFKhtdzhEIr7jHRkQsrk+F/Sn+RtQ5x?=
 =?us-ascii?Q?ikiZ6p0xfT9gXmeJYSFFJoGdOWlWLtDxsvPIkUaZLcjI6OLCInffPHfnxuav?=
 =?us-ascii?Q?PE8iQvWEnCOTk7X8YazUfPdfu6tsysG8TlqN5Jpf8zCQganO9mDBxB4SSdJm?=
 =?us-ascii?Q?47zz1CJkUPzf8rXfjpX8Dw8x/g98jWHWiYFOabg5OaGgu4tBIYc/0eZVzTW4?=
 =?us-ascii?Q?Ex8q9nJzpbOrcxc+D/CRGL/mGbDC2RmkaFHpC/4Irz2mOtUhWLAjtUb08vSv?=
 =?us-ascii?Q?lq1DjwtSGUtKDJuuB0bhD7XLqrKZ5NoI2aKVRK7heYxVdxM4gEO+J9NkhXJz?=
 =?us-ascii?Q?yz9o7qmLqAE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bdxgj4rNpOmrriK8J/eR0Yal8j2trItzjPz2Vl5ImgqFroldC35T0CW8qKyP?=
 =?us-ascii?Q?vpOYnFQHSGcgjLlXTNj9+cNOgTE7VKqnIPLwWLUYOY/ydfOiPoSSTpq4IJGo?=
 =?us-ascii?Q?fKYCqWVFRqlABk/WmYeK7cPvOjjbwgdskxn7J3RaDQJa8StxQEIPKkCJ46ck?=
 =?us-ascii?Q?eFHPhwLz0TKtvp+4lLafDWq3QqfsO+NQFh1fdzxn1s7cyibmKFqo1CE7NSTl?=
 =?us-ascii?Q?FJ3qOLv/OctXZSuH8a6lzAXnINIFRiu89uk0lOex0hFpjfzLKsHDqtRRyL3I?=
 =?us-ascii?Q?pjmJHtHV8otMc3NHzm6ohbfmN9VtaFduyKFGQ6xjt6WvEr7CtKcxTispnWAe?=
 =?us-ascii?Q?f7A7sHnkrc4Q7GMOPCxibs5IbzrmEV1NNSjZdl8K/V9lZmjFm4u3Iu/bXg+w?=
 =?us-ascii?Q?EoW3JHSYwsc6OLHbAN0af6aJjAPU/y3LOdXKmNfVKiOyvfa8pGgxbaiagL+M?=
 =?us-ascii?Q?AkX3JQsNoDw7pMWpaxSb+GuDC1KWYbwpTMuUB/4reErz8IBpk/6pzhKnlbo6?=
 =?us-ascii?Q?4qVfGgOiw9ZXVigVgggF2J5kK5J85okLsHauK8PBBvOvpZFSSxAnw2iA0nii?=
 =?us-ascii?Q?GwcVmk63RPiMzImUwOiYZiDUfaCM24TkgUbDKS2uPXnZTsZ8MsSMVl9QxHDr?=
 =?us-ascii?Q?tFaGeJW82YWlwLRe/IkU1pM8i4u2mW4c1zfrfdzZglvN4XeuZTjENp44N9tr?=
 =?us-ascii?Q?Dk1dPbZxpt/WYBkNWoEslq7/9e3d+9hX4D/TJ8U2uABCXmopaxqOb4ykbsYS?=
 =?us-ascii?Q?Hy2MgOBL9Sa9moWO1VTXNa+L2RrB5JjTD4zSbPgRjULQRzRBLs5r6Z0H7GwU?=
 =?us-ascii?Q?a9Um6gCU8g+eqTsICY36lFXlYLn6sGgoYQ+mgiMvycIgUTjixJ8hB+YrSG1N?=
 =?us-ascii?Q?xv7b6yoBUbCrRYj4Bp6yGi6PyQ3otPJX9qM1g69NUTTkAwhzLmHh5bhdLqVV?=
 =?us-ascii?Q?sYDP0WBeImB4qIP6Ru9l03zIVTBT04EO6Pgw9TDI73XH65pS6NKv1lyBfoZo?=
 =?us-ascii?Q?7a4fx+xkTQQ9K6dp68fVmmB4PjTee4CBeDFDBcBSLFkwiI8yWfxapGQtOd9D?=
 =?us-ascii?Q?kurAnDaEHfsMsRd7vyn8qBohF8zQASwx9aiYnrctTsujlA4jSd0DPzinMQTp?=
 =?us-ascii?Q?KPpcia6xGpGREUhSBXcbBf4mwuYRTzorY9VTHu6EemMkfHKjSHGBIkj7gQsL?=
 =?us-ascii?Q?S59GLv8HbTNvqiqe+BdfY4Xfws2nwhh4XGEpYIi8mTo7v3i/kzzUVWX84PmW?=
 =?us-ascii?Q?iRvp+6Wy95MX/Zpq9DCSM5SDtKVsvmvXXZENn9Zv8h8/TU19o+WVBUqJeSTg?=
 =?us-ascii?Q?q8pzYipgBfOwPZS1EBWcyMFJf23E4IGiqdviE0Gewsnh0+YhLQ1/IvlNglpv?=
 =?us-ascii?Q?lnxEDnyD/VxiZzLmq8su8uuN+7SF11VvYkLOC9dAe2WEvMXtGR8BckMgEUOc?=
 =?us-ascii?Q?NVNJQ283xk/wVHg6hiTLjb8DUEEIFMuhDZvUeS2hgN/D7bbRfNJuAUMBQMMT?=
 =?us-ascii?Q?6F3IWn8K1prqJ6cIRSBG2BRhUJ00lBX5kzst+ALF1dMur2Elmn5uw7xzerxP?=
 =?us-ascii?Q?P5C5uV7S6P48oTRxnVZ1deB0kYE4wh5gmB1rkkZg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a66518-67d4-4122-a38d-08ddb01dd23c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 17:13:48.6429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1WhyWteRIDWvZQRZzqjAKiKSls41CPKVtJcwkrqvtP2+794ZpPN1wraXas4TnV/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539

On 20 Jun 2025, at 11:33, Lorenzo Stoakes wrote:

> The madvise code has for the longest time had very confusing code around
> the 'prev' VMA pointer passed around various functions which, in all cases
> except madvise_update_vma(), is unused and instead simply updated as soon
> as the function is invoked.
>
> To compound the confusion, the prev pointer is also used to indicate to the
> caller that the mmap lock has been dropped and that we can therefore not
> safely access the end of the current VMA (which might have been updated by
> madvise_update_vma()).
>
> Clear up this confusion by not setting prev = vma anywhere except in
> madvise_walk_vmas(), update all references to prev which will always be
> equal to vma after madvise_vma_behavior() is invoked, and adding a flag to
> indicate that the lock has been dropped to make this explicit.
>
> Additionally, drop a redundant BUG_ON() from madvise_collapse(), which is
> simply reiterating the BUG_ON(mmap_locked) above it (note that BUG_ON() is
> not appropriate here, but we leave existing code as-is).
>
> We finally adjust the madvise_walk_vmas() logic to be a little clearer -
> delaying the assignment of the end of the range to the start of the new
> range until the last moment and handling the lock being dropped scenario
> immediately.
>
> Additionally add some explanatory comments.
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  include/linux/huge_mm.h |  9 +++--
>  mm/khugepaged.c         |  9 ++---
>  mm/madvise.c            | 77 +++++++++++++++++++++--------------------
>  3 files changed, 47 insertions(+), 48 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
