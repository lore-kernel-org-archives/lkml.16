Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713841A255C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551684; cv=fail; b=ZB06NeECrw33SFJKGv5kcpNC12TiLP3Kl4Gx8pGsyQEbcGpaLPWF342lPwrkl83Up2jLK0S4m+P0UU56rFywQ5uX5CZvVsQaD7G8artGSgegP/BnAQUdzPWxN8XjP4XletaR7XhdkF9ZH7erDXkyaC8uthT3qkSML7IZ/z87noM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551684; c=relaxed/simple;
	bh=ad1XvlSav63UY7NBKK5KGYl1zk/OYBDJKGGcrM05uaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dB9q1FhjV1ZnSypOcpErhYlZ9pjLeSnLbbbQcVwLfDIeaKsQQyltEG/0hi17WbbWS2sIJvfIJKLWKhPVcWIU1r0wFKO9SRhXxgCc/OMTo0BtpCI0vnWmUBwPHVahA9HNmD7GzrX3FVSMirdmOK8N4+29AfRhb5HtwbyX1sE7Rkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gk88RBLx; arc=fail smtp.client-ip=40.107.244.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gk88RBLx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH93hJooGd/1a4ho/9V8vzRpp+majGGu7OzfuZfha2BStEwpQpaLBJDZkrqOiBf66xyZj3i71XUeIJIduCuxJ/Gq4bRCCXshXwU51/gMvLD+2+SJMduhMeXhF4wERBqpFickx7bwkH58Rdui1DKD4H0Sc/mKn6qLTgTgkIIoP7IdliHwIioxswTlJYMG7EIO4TFoSw7i/GjYOZxkA08uDqvjvEZr7hXCEEZRguC7lZhVvzBKfV0lVQ0GfioaHeEHAd8Y+hXLm7pTaRYmEIHo/luryJCp5qQPEpZdpiJvO6VI89S+FronWQQcG0Y3okhLh0fm9yTSGz77ROAQOIrr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHj7SvGysHcDyuYcrVplQTCNm7c1mxuJ+LgguFmPjFQ=;
 b=qMbtB8upbWCzRl4GXEvNAuzEulXPj/gr2LEnyx9BhvBt+dLYBYFmV5iGTa8pwRjYg+i7vVYbRk6VBMgDUQGc3u4Lwi2b4GpDZRDWLA8FPtrMIWmjshJQUqhBhM+5Z5qSMTKh3J/5aqRHFxLw4umCPhP/4LcMecSMcgpzXO49D0me8l9n8MRQNWV9qzS55EC7WLxtUzGPGJHRDkB3+SEP6V4Y2+iDChqJhSkEn7ZAH8eiSi85VDLM/iURcP2vcSxK1sM1LzG2gKJPGZDhUH59i072YX9i9scRtmAMuGLhjgmKqugTwDKSclxnUSA7KBXMH359fGHN5cf9EYT0np5Gqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHj7SvGysHcDyuYcrVplQTCNm7c1mxuJ+LgguFmPjFQ=;
 b=Gk88RBLxSSlCAIwFu8f6nSYyRU7VDYITZqxYhgQBawuZpUXww5hYnnuRekJWfbpThJHeWzgRH2o5BpB8sQ5B2P73kaf58GMMGMP1POvuKCpXtivdjF9+KqgLP/S7SvgjhUW2WwC+hzNX3IK1mr3NPRdBUFMmaAr6ZuLn5VYpmE/xamGBEdCHN4/xfepP1iscmLlB3rE7p5PPeKWMo5Y67YQxQampELACMSl8R4YW4b4PuDk+MsBAaJ70kSzsFmxSAa1B4ftziXnFJqx5uRfOuAE/fFTF/zfhqtbxHFQGwG3EP8OXGF7zvsHAeQPfHxiCRkKaBZl/ogaVl4Ljwpgugg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL3PR12MB9049.namprd12.prod.outlook.com (2603:10b6:208:3b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 14:07:58 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 14:07:58 +0000
From: Zi Yan <ziy@nvidia.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com,
 baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] khugepaged: Reduce race probability between migration
 and khugepaged
Date: Thu, 03 Jul 2025 10:07:55 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <1B1A99C7-035B-423B-A389-7BB43D858439@nvidia.com>
In-Reply-To: <20250703054823.49149-1-dev.jain@arm.com>
References: <20250703054823.49149-1-dev.jain@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::12) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL3PR12MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef1e4db-27ff-4c48-d6d7-08ddba3b0379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MzKLlH2Blzon0AUFJCRos9VWyvsJbcL1RgZrMYzYmU6tmQ3/R1+Zl1tIBfsO?=
 =?us-ascii?Q?dD8Ve60JE3proxpmRuYeFaolJ+SPSBTGuqTl+SE/KemGPXRsMe4G39Q1vsTH?=
 =?us-ascii?Q?WamZv2MUGfIzvYboIxBNBRIThvvYmKaKOcKlthh1TSmbBieXT2skA+ave1wQ?=
 =?us-ascii?Q?5Wl72qWZUoxpU4XAYleCQ5voqZNakuUL0cD8NhEmCbU+RL3WXdRoKsGqLCrD?=
 =?us-ascii?Q?9CT2XPPe/xw4CCXjk/J7u18ojco+K5DLBy1R6Hc0HT1/sAePPxMpGOx94WWu?=
 =?us-ascii?Q?yVDQMAfEnsGLmWKI3Ur93wchYZma6kCFLPIVjX0TLTLvxoOboDHcOkAFkZfq?=
 =?us-ascii?Q?SurUlrvUNV5UPgFzQB/Ykf5NQGmjklh2wWpdHDgVcfgHZgbFx0p3wfgj7FsK?=
 =?us-ascii?Q?ioyA5B0pNTysgBk+75qEQHylbLYVkrrZ8FRq+XjOFqQLZhLrDuEEfaPaYsFG?=
 =?us-ascii?Q?sGkyi0q4YuKxj5LfU572C0qeyRsI946JZTVuBLW5IpkWtATaNNw8ZkCAmibf?=
 =?us-ascii?Q?do3rqqaFsYV3r2S20TE8ql82zYkapK2raE9cIylsuNq/h3SrlCJ4nVWX4TMw?=
 =?us-ascii?Q?pAE3AismWBmf7Qr15dyLKmfy+04Jqh8fGPNBM6srVPSEqE+cPH/12FQB/B/W?=
 =?us-ascii?Q?O7wbwmdAQ9jvNmlF4X3KHSCGnLlTyr37vzDzxmoVsPZY6PiI5hqWOevj13O+?=
 =?us-ascii?Q?v+yrRpIz6w+ifiqNvzk983BNQPmM/+NeFnajnUglTTV29atZD9vCiFejbLMH?=
 =?us-ascii?Q?tS9VkMCed8QJywVPPO6wnMOvAUnb8cQ5wCLtRfXn2Ogh0LnkK3BSvh9kr+Dy?=
 =?us-ascii?Q?OgZxEqNv5FP0P2ZHbqpCZppttcOhagOW6wf0ZFXSXz1T4dh9C0cfs3TPX/3I?=
 =?us-ascii?Q?p6GJBUreNIMA42daCW0QF772PqxDDLYT5qmLV62ZwKTOqCfZEWgAR3vsHCNM?=
 =?us-ascii?Q?MwaNUxPtVAgLgYgTN1z9vPhFJupzBmLG6giNwPOdOkkeQskW94V+W9oY0jnA?=
 =?us-ascii?Q?PWDTexEkhtoePFqwSVo/mnkqUrINREKTbAQ1fbtbUyFidooFaDdKu5ef1CLt?=
 =?us-ascii?Q?RkYrBewMnd9ddd/Hfd3zHP5sXDUoYJRFPXCmd33Eu8XH+CFaToq97JV69Fab?=
 =?us-ascii?Q?jDFyVu85PMb43d2zydg6+4fhEUXU/Fkp0N+/qSVoWzA32iT8N8SFvGD1xl5F?=
 =?us-ascii?Q?McXChoBlUXuvL6BVefL6jmPqhGI+5F+g7k+PYgp1xDN34qfOjLwvZzcJkjI1?=
 =?us-ascii?Q?xJB+A4eJXdPo7eV5JNJzyg7hes6j1w46tFfLxyCDIHRnnamjfssYqfdfA0KP?=
 =?us-ascii?Q?3m5DIwOP2mgrbiSQoq6Y6KVUVDOxxjlo3h39H/JIMW8PobfyVMGlD0VAOz+f?=
 =?us-ascii?Q?2MDDcqrYwv1Nak3E3Eu0WIhtJbqcEnKv1+2Vb4/UWgLzZCtcxoP7XW29Pugh?=
 =?us-ascii?Q?IPIzX2Skvuw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mJgBBjAPDRQgsDFF3ljYTE/7mTH4/E9OVfSv1cIX7n+PXSVoU95uoCK8qf4/?=
 =?us-ascii?Q?YdrfIRsVr67FXdQ5WdvAgQhX3uwFjD3xyUhPrpifNyH75GrUbHm6e+P8XS+B?=
 =?us-ascii?Q?d1SVavzRSVmr1K5bSZHC6GUkcLbtj+KN/nzWQRRC7WJIVCHY6t+j6HqSLmuX?=
 =?us-ascii?Q?lvwM45qXBOz8L4c8WTU/cMBoZIwn8YZKWmqmd1n2xd2aplHWfMoR+HuZ1ozB?=
 =?us-ascii?Q?i+FdLH0kI0wIeOIgW25vOXbUacMS8IOQpqud8bQqW3S1tm3q5FyQDN811qgi?=
 =?us-ascii?Q?2AJRJnGnom+eBi4Tw6XZ1AHmSCfFF2f8d32GCCKKKXqA4DOc4mV1QG9uF/RA?=
 =?us-ascii?Q?FrRIgvnpRVRnQp8fq6yK4RQ5gvkr3qyOuM7ACy/XCMADk5gZKIzVydXLNQeR?=
 =?us-ascii?Q?O3oH0gLMXUlxIyRoS9OhjaQ0V83bMFkyKxSeELfcr2EhBUhKGd47W/ToGI1G?=
 =?us-ascii?Q?w7C7kkvfpOj+w6fQTP0AKeaIF1f9KgVxmHqvXKG3ZdzWMf+JyDZpE7YWY335?=
 =?us-ascii?Q?cLwBTBTMwG+J6fMs3R5a649Zwbzg4zfCT4WRizui4S9kziH0yhCsB7ECncOx?=
 =?us-ascii?Q?68YZRVLA412ljTtsJiJqagzv16dxnm4OUE5QbI7zzT587tK0R3e2iGuFTgNq?=
 =?us-ascii?Q?43/AX6pn7hSCuITSy/i/IbDGwglJL6qOb2ZLOQ490q1mWygCcL11TDPDhIjv?=
 =?us-ascii?Q?PZHlJdG+SoSL9ITNkTDm1sqcw/9wtNAxeTi5huHGwbW+Hs0E3hRBugLtW8H5?=
 =?us-ascii?Q?/JZlhIA9R7MOxvtU8coRaXhUXYikf1DAwjGrKi4MyYNtL4REvh9sxIhNwri7?=
 =?us-ascii?Q?Tfb6NWOAEJiWG5rOANko3ND0FZOEnyei9lTzGvXpMuLUYTOjHfLAMX+WlmUG?=
 =?us-ascii?Q?4C9CB7GDR1RPt/BN01nEFLhpbZfqKk54vEMxMRkvxMwsEuk5zSoi3xVYbRGc?=
 =?us-ascii?Q?1S5FRPyW+CZ3kJMUo4AREG7SsIXOs+oDqidw+onuo1z4vQHYMZadua4rYu/6?=
 =?us-ascii?Q?o2Y8N1hrM7pY0+/Bc0DQ5Etdbp8qTNLk4HFJaTUFLgao/fHACrzkIGNKqE21?=
 =?us-ascii?Q?9KlWuF0qymRkYehedNJSesR9vVoiZ9Mxv5Eh2YY2RQE1djtkGBgk9ajBMuXP?=
 =?us-ascii?Q?6hsz3NGtPosG1pZH4iu+LOUqUlweoE8yyTsA9RzqzrZJ4z+qgHTbrcbDllDj?=
 =?us-ascii?Q?y+/ikf3JLeNZlu1YBnL0WkCDBA+CA2wCCDsYH/9comkMLkreOm3EvAm+mxR4?=
 =?us-ascii?Q?ITPjqRLZOJj4NoRiz5Ww6qYdg2Z5IvLzvI03oSCmFXn194gj//amEKDxFoVf?=
 =?us-ascii?Q?NRiBrKSMRmNuOwqeBB0ubUnZiaYUh/XIHUimi0TG5+95KkBolyc7BCIAcTjx?=
 =?us-ascii?Q?D5qIX1InsOa/fJturFRIrzXJD2fGn1JGDh8FXD058EupecI4pbTsD2ILjSM6?=
 =?us-ascii?Q?Q+VVmCgAgCFi2Dfzrgm2Qs3CaGbzd3CWJTLSpNLs29HGYGQ00mPivGxqdMw8?=
 =?us-ascii?Q?8kbFWrHG17IBgxJFukewc9/NNcJtXiLZBMVmJCdPwtrCeNMO8M0YJC5+brX6?=
 =?us-ascii?Q?XDuNWtRs1TNPUclwGbUO3IOq/NGvkS5lAIIJk2vk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef1e4db-27ff-4c48-d6d7-08ddba3b0379
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:07:58.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xfKQU02PrMOwW2RIM6vu5kBotUJZPoDiOpkl+7DU8r+nqI/VoIHxJrJln2xZRPO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9049

On 3 Jul 2025, at 1:48, Dev Jain wrote:

> Suppose a folio is under migration, and khugepaged is also trying to
> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
> page cache via filemap_lock_folio(), thus taking a reference on the folio
> and sleeping on the folio lock, since the lock is held by the migration
> path. Migration will then fail in
> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
> such a race happening (leading to migration failure) by bailing out
> if we detect a PMD is marked with a migration entry.
>
> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>
> Note that, this is not a "fix" since it only reduces the chance of
> interference of khugepaged with migration, wherein both the kernel
> functionalities are deemed "best-effort".
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>
> v1->v2:
>  - Remove SCAN_PMD_MIGRATION, merge into SCAN_PMD_MAPPED (David, Anshuman)
>  - Add a comment (Lorenzo)
>
> v1:
>  - https://lore.kernel.org/all/20250630044837.4675-1-dev.jain@arm.com/
>
>  mm/khugepaged.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
