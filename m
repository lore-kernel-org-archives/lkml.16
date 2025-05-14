Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE67922A4EC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215206; cv=fail; b=X5nj+RpV1zaaPAmF5OfgP05ant1+TwAZ1CDRNtAsURj7kceYR8fGe+TmhgB1Issku9ddxmcUNPD1Ei5BVamCy1xKfvRc7wXGLVZpz+Ui3ubl10HqqllGw3DET5ZZ86T9th8uBDqQ5L6xxJNMZPuZBzoFTpitLhTFOSdAA1Xlnjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215206; c=relaxed/simple;
	bh=eQa/Ji0QvU8W1gMl7ahdoAhgQ5eM/zQ4q9hsJJpgJyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qa6QJed8FM/wF8kCXoXcwipEO7q+YjqnMT4Qz333dPi0Qmf2VnOrlBgAdswqINItXZKVJa8aIQ5UPHZg7zfXSJnisH0Lx6wjI0AmCbHNAxE1nLoJEv0r5L1/kVYslGgc6c6e8OuPMSV8FWiGZYJTxCRjnL37nRe4vVRsF+U+ZSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZVUkwxZQ; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZVUkwxZQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpiOQdQxQEQewx99bJkqglbT4l5uhm7avMyXSxQGtsyPhL6AIk66YsDT8pYPAY3AAp0M5gp63qk+WPWLWZfF3mIJihRHc0ivRog6pyg/H90MrhEiSw52wQB2WYDNQWXAYR6ntK3tdu5rnKiSDbtq7+fbXrhnxoA0+nNMr1Y6DDlge3NKaKTK+GqzV0lG6G/jKRt7lQXEhzyy9SnLOqSGnpitulmTXUdd7BE9g9ep9+26l4FD7cgiOHGKocKVkUzgHJYyspJOfFfhfZP/zjebV3U8G4HKPpo/OspuGzl1iBIuesVnmQkPHVGUdZj1RaUTVoqEroc25qqm6IkhhMKn3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKGPcC7szZYjRLspf7AFcS/dDh0p5Ajh8SVckJdAx9M=;
 b=Tdmp4D0FwZA5oODv6/cKUk7SgcxDPqK8LpngUu0pBqNX5Nclx7F6dVulN74nLp2gwtzpyOYg8IzeQ43CRVlBBJShFgsVXJlY+AZ2qPk+A18/1tWQ9/iM6p+nYINd6X8bwbdS4xJX7/6xR8IJncJm5nntzjjbGJhZcuNXkeQw9qJ9JSdVcUJzmWiVI/7sZqUF19c5tRRK+M7JD0XUbw/dpbSCR2+vn4opE62IfKNCBZ4lTuGKH8sKDeqbW67BwmgvhuZo81kOvrN3wRyYlH3mVJ7sVzDmpaSU/YTLiJ/2sn7+cVoB2yPjjLeCZwDj/uDV9sny5J6EreORkKSbec4X+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKGPcC7szZYjRLspf7AFcS/dDh0p5Ajh8SVckJdAx9M=;
 b=ZVUkwxZQt3OioEi9PSi5B/KnMPm7UxxoVLi67eibw9sTmx13izWkrsVU0wjkbq9Gib0THsq0YrNeLsdVTp2gTZ/C1lKawW5y23yDMBqhfKEikNX27SMTs5zvqmezy8Dv8kUgaH82fCSZumRHAMtNyy1d6lNlHsKSRsW6sbqbUBKmrQIoQ4ntDi7b9etXiaEnub9U2ZxDclDx2YUkEwuhkmhWACtkb4fFyk+0T5ZYrdfSz41aY2iJpRQzfw80b/v9f6tkdLg+Xp/gxn+nRfWByLhTj3um9FFTT+F3nT8Zm6ptf4O6+aoMzDDcyfWx7cW19NTugPN1sfMekTxh4ZMcfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB7453.namprd12.prod.outlook.com (2603:10b6:510:20a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 09:33:16 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 09:33:16 +0000
Date: Wed, 14 May 2025 11:33:05 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4 sched_ext/for-6.16] sched_ext: Clean up scx_root
 usages
Message-ID: <aCRjUQJ_97-B0Rpo@gpd3>
References: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
X-ClientProxiedBy: MI0P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: c2496a46-0819-4b5b-a5da-08dd92ca5a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XYUYwxDmcgmH1f5lKILKk94uS1vbhv06IRQ+lgfrPh8Hm1geKLoVdshKEPtT?=
 =?us-ascii?Q?LOj9ljKTElhxduy3A3m+CWcRT9/e4ipGwA0muCnKZsOaghhaZfH5dmYQt1z9?=
 =?us-ascii?Q?ZBxsUNHzF64JhN72MBcGmDftzp7pF3iV5YHjfGKInQg8IxY0sGW7CLwGflm1?=
 =?us-ascii?Q?Nd5MtrpIkCe8Q3BYhwfxIS/e3p0PagHabL/P9aE0yBHNO5NZmBwUp9Q5da3u?=
 =?us-ascii?Q?feJ/69kfiJjZNwzNcK/DCDeK+Mk1EIKyGtJXBJCXlP8Rw0Yy2SUdcFF0woG8?=
 =?us-ascii?Q?u1Ww6slorHZtu3BR/p4V6cGEvD6Zj3WsUEsplU9vVjFE6xc7yED9CGTUrZaF?=
 =?us-ascii?Q?3Kyg82UgbDSo/K5Y8xK4stZNmga6JtlKqAI0b8c/mfhiokSbCJQjlDzOZ1el?=
 =?us-ascii?Q?Jkl2i2V49IvXhA1D4YaAftc1FZQINHBSmQ3oKnpjW106poaPNRCkQenUKykn?=
 =?us-ascii?Q?jtBhMpLaeVK29bYjqgAC4d7mClZ6TabtgQ1l+IMQS36e9AOn95ohf6pQAFJ9?=
 =?us-ascii?Q?91gpJmM4hvKWniYMLYGE/j5TDciWF0039WM55TPskAjxjed9IhhzlIwnoWhl?=
 =?us-ascii?Q?gdT9SrQXLi9f+NHv6fHpadg4LExCKtPs28paUEAUL9O+eUhPcZLUwRhUeqF2?=
 =?us-ascii?Q?HNCzh3/LnNb6I67uHXXuyTVNOGKmeRTEo2pDocRvZ5gLqheprktgvJ/GyhqZ?=
 =?us-ascii?Q?WMaimqKxvPXpzOGrcUcSSI2T4pJG9tO0yafC9wFWdKUwBKLyAdfA3SroiAZ/?=
 =?us-ascii?Q?23F5CcIu7Iwth8TNhoA2UOVLVAEY7evtYLTT300/TOFvM3B+qk6O60HrD1HK?=
 =?us-ascii?Q?w1gWHIng4lDdZgty1VQXdhMv32mS/DopVGTLndgGk81vp7JJsSi56Griom9b?=
 =?us-ascii?Q?R4mNhi5urxIw1XZeHvzF8xtJb02VEYR1U8VbF7C7gEA7iDA7fLxQwXRiplhm?=
 =?us-ascii?Q?N2BEKQOcjDFNMDHRvjj9VmZSYoOgkOnoJmJGmsH2MC9QAeV+VfniuFp9HrUa?=
 =?us-ascii?Q?0/xKenScu9EhZuV1fyEPJB/wiYT/q25J4b+leuwun2zss9TcHpviL6ltLyDo?=
 =?us-ascii?Q?VD02hmEpkyYgfDqzc1FJtjptFFtt1HoF/Lg+kxcE4H98YIWllzzV1CN7EUum?=
 =?us-ascii?Q?f557FQKtycNAeHwUsdgzzWBmD65BBQ7wpMYhIP7PlRfoRKo5Y+m4bOEYJs84?=
 =?us-ascii?Q?UEvWOysVu389+DPm9fpqgJYQeuFHp1RgMLavBQxYpjaPCDLoeGRzlV5ZfIpW?=
 =?us-ascii?Q?uBJLdKvsFFN1LGAfwdHMrCNMw8y86XUrdTI5Wr363+bPOA0LWdaa8xxVJv6E?=
 =?us-ascii?Q?mLfZFP3VM1O5CFFtLk/PrFvtd8HUYnwEOjREO7wfgjrOIyC9nMD7cfJzrS8D?=
 =?us-ascii?Q?4rpaQms4fI//FQ/P/td7R05dbTlAaNlNtagDkWlp2wuS4nKhu6Kqkh1+7iOm?=
 =?us-ascii?Q?EKGDQeYV1gM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?frwglGDtjMpZqK3XF+/K1SgzGOyBYPJAGK31SUHwXvzwBdTY7lZ1gV6G4gmb?=
 =?us-ascii?Q?k+Be/CjiDI3hYv+0/V9SMKyosdMh+4zx0hpflNUVaDvVp4Kuxf+U5StjyELV?=
 =?us-ascii?Q?U4MAM683fxqrogjFXaKYPtspWpaoTA8vMkRm5T5yjKITywQ9rKAWX7A56XA6?=
 =?us-ascii?Q?BjdqvsT42PvCiOOWmY4p5G7k1IZpsu7KoydV09AAXIy6uIBykI6SZwnRQoOz?=
 =?us-ascii?Q?tBubqQxbTbp0K8i5ej4GYtgalLkA8NvahnQRBJUkRhZFwMIllHAUF2X+M2yK?=
 =?us-ascii?Q?UykDTouciPGJwXe8rg2DqwHT2YrKJfeCAdks/i2IbPM1Oxbal0TYrHZMD89v?=
 =?us-ascii?Q?VVPpmeKHsH30/i/+AnV/VJVUdrH7j50q5iIMWQHZsDPyHBaWlEK8jYbVa8Sh?=
 =?us-ascii?Q?lqO3Z8YN3Nd2PSCmbkvRUrr/sCguvXg6eFsd9FHY+vAClvT72BRaBewxAB6O?=
 =?us-ascii?Q?+AqS1YFdfhertKFcXlJnvviUhLxckaDDcyxKB6GooxVVc/TOx7FZnWBBOo/9?=
 =?us-ascii?Q?ceXFTOoJYUeTS13mnZrubjevvX5vrkVHsb06rwa1ii8S3GT7S5xZi8KV4VmA?=
 =?us-ascii?Q?bRYrEvq99K6Zh/KEnCtwzqHr2TRp8HiACysc9lfaC3eYiHCaAmAwAH6TT46T?=
 =?us-ascii?Q?pvy9OqWoGLBImBQBqoiLYTbzxtUB+MTZhwNowStGaqTM6LakVmjPZhIaWk7s?=
 =?us-ascii?Q?mr0rdOkD94+71uU9m2h9uVidRR4tZ7MSVthtjaalNlkmDkjmIPD5T2BAmsel?=
 =?us-ascii?Q?HUsDovv7tUDiKoM92mSs/sz5Y8sGyZrc9lPZgryGOp5geDijkgvkKhubTLX9?=
 =?us-ascii?Q?wG6HAy2HAPGIlR8Ou5MhF8Vk2nPdo0nL1zotz/tjUOYMvWTPhQut6xoTfO7m?=
 =?us-ascii?Q?rQnuwjuUjL9NXiYi1PtCeM5iJeALlb+/emp/pomX6EX2rmBcxr50pSt8yg8b?=
 =?us-ascii?Q?K7x6qs/QC1E97Xp3CjnEE+LI3ZBF/nQvL98+XQY7V0stw1Eu0vpDR8tJWZ4S?=
 =?us-ascii?Q?Kqr7Jhw8ikytbwwTHevmqon6Owts9qQeCbInTq8zE87BmbTXwzq/cEGdIHAt?=
 =?us-ascii?Q?/DK/3u1H/yPQZz+bTmqngUclsAuet7OUs8p7gx8ehNtej+PwqrHw6yX9CZw6?=
 =?us-ascii?Q?DF9NpYdKXD7b3jWos4MC3sAmBgYSUPHGeJz273OGhinzSiO+DZvfA00gxOfN?=
 =?us-ascii?Q?pLfgNedMW4Y+C2+7jiIOx8d1EgsbwxMztND67wuMkN5p2jqhK1tpxSLS26xp?=
 =?us-ascii?Q?vPthFQocN6B6fUZ5g3Vf0wBOdFzTZfo66i+qZOvgiVnF5uctR8SAG3K2SS8m?=
 =?us-ascii?Q?oKOjge66/Nl/w3ugyeNJmp2yMXX58q6COOsQw+S4i5FJn4Cq+b7oMyu4tN3I?=
 =?us-ascii?Q?AP91ZV4JvaYQJOagP0v5Ia6xqx4YpRm9IfOWiVmDsjlusxgj9f+RSrqk9PWD?=
 =?us-ascii?Q?5NhuCVT8oSqhSwbUmwy/A/h4AJRXrXVTyRAruhDGQ8x+/Ta8EiCk7LN+eXRY?=
 =?us-ascii?Q?uv+uWM0ez8ANUU4ACW/0op6YXV9Hc6DkAB6vmoPeALZwUl0S9XBnRJm4Ogjv?=
 =?us-ascii?Q?9gTHpHK0QG/Tvmx8Td+kV8ye3YDBpVeX5ss+lOGL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2496a46-0819-4b5b-a5da-08dd92ca5a48
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 09:33:16.0294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5r5TiV1hdPtkqVwiOO7QXzJX+lCDH3CcuxhOCHeFUvLPp5fYN/g9RV4nYRO2snxCaJrL0JbXUsRO/HRWD2ETCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7453

Hi Tejun,

On Wed, May 14, 2025 at 12:47:46AM -0400, Tejun Heo wrote:
> - Always cache scx_root into local variable sch before using.
> 
> - Don't use scx_root if cached sch is available.
> 
> - Wrap !sch test with unlikely().
> 
> - Pass @scx into scx_cgroup_init/exit().
> 
> No behavior changes intended.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>  kernel/sched/ext.c      |  157 +++++++++++++++++++++++++++++-------------------
>  kernel/sched/ext_idle.c |    4 -
>  2 files changed, 100 insertions(+), 61 deletions(-)
> 
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -2220,20 +2220,20 @@ static void do_enqueue_task(struct rq *r
>  		goto direct;
>  
>  	/* see %SCX_OPS_ENQ_EXITING */
> -	if (!(scx_root->ops.flags & SCX_OPS_ENQ_EXITING) &&
> +	if (!(sch->ops.flags & SCX_OPS_ENQ_EXITING) &&
>  	    unlikely(p->flags & PF_EXITING)) {
>  		__scx_add_event(sch, SCX_EV_ENQ_SKIP_EXITING, 1);
>  		goto local;
>  	}
>  
>  	/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
> -	if (!(scx_root->ops.flags & SCX_OPS_ENQ_MIGRATION_DISABLED) &&
> +	if (!(sch->ops.flags & SCX_OPS_ENQ_MIGRATION_DISABLED) &&
>  	    is_migration_disabled(p)) {
>  		__scx_add_event(sch, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED, 1);
>  		goto local;
>  	}
>  
> -	if (unlikely(!SCX_HAS_OP(scx_root, enqueue)))
> +	if (unlikely(!SCX_HAS_OP(sch, enqueue)))
>  		goto global;
>  
>  	/* DSQ bypass didn't trigger, enqueue on the BPF scheduler */
> @@ -2311,6 +2311,7 @@ static void clr_task_runnable(struct tas
>  
>  static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags)
>  {
> +	struct scx_sched *sch = scx_root;

Do we need to use rcu_dereference(scx_root) here, as well as in all the
occurrences above where scx_root is dereferenced?

Thanks,
-Andrea

>  	int sticky_cpu = p->scx.sticky_cpu;
>  
>  	if (enq_flags & ENQUEUE_WAKEUP)
> @@ -2340,7 +2341,7 @@ static void enqueue_task_scx(struct rq *
>  	rq->scx.nr_running++;
>  	add_nr_running(rq, 1);
>  
> -	if (SCX_HAS_OP(scx_root, runnable) && !task_on_rq_migrating(p))
> +	if (SCX_HAS_OP(sch, runnable) && !task_on_rq_migrating(p))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, runnable, rq, p, enq_flags);
>  
>  	if (enq_flags & SCX_ENQ_WAKEUP)
> @@ -2352,11 +2353,12 @@ out:
>  
>  	if ((enq_flags & SCX_ENQ_CPU_SELECTED) &&
>  	    unlikely(cpu_of(rq) != p->scx.selected_cpu))
> -		__scx_add_event(scx_root, SCX_EV_SELECT_CPU_FALLBACK, 1);
> +		__scx_add_event(sch, SCX_EV_SELECT_CPU_FALLBACK, 1);
>  }
>  
>  static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
>  {
> +	struct scx_sched *sch = scx_root;
>  	unsigned long opss;
>  
>  	/* dequeue is always temporary, don't reset runnable_at */
> @@ -2375,7 +2377,7 @@ static void ops_dequeue(struct rq *rq, s
>  		 */
>  		BUG();
>  	case SCX_OPSS_QUEUED:
> -		if (SCX_HAS_OP(scx_root, dequeue))
> +		if (SCX_HAS_OP(sch, dequeue))
>  			SCX_CALL_OP_TASK(SCX_KF_REST, dequeue, rq, p, deq_flags);
>  
>  		if (atomic_long_try_cmpxchg(&p->scx.ops_state, &opss,
> @@ -2404,6 +2406,8 @@ static void ops_dequeue(struct rq *rq, s
>  
>  static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	if (!(p->scx.flags & SCX_TASK_QUEUED)) {
>  		WARN_ON_ONCE(task_runnable(p));
>  		return true;
> @@ -2423,12 +2427,12 @@ static bool dequeue_task_scx(struct rq *
>  	 * information meaningful to the BPF scheduler and can be suppressed by
>  	 * skipping the callbacks if the task is !QUEUED.
>  	 */
> -	if (SCX_HAS_OP(scx_root, stopping) && task_current(rq, p)) {
> +	if (SCX_HAS_OP(sch, stopping) && task_current(rq, p)) {
>  		update_curr_scx(rq);
>  		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, rq, p, false);
>  	}
>  
> -	if (SCX_HAS_OP(scx_root, quiescent) && !task_on_rq_migrating(p))
> +	if (SCX_HAS_OP(sch, quiescent) && !task_on_rq_migrating(p))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, quiescent, rq, p, deq_flags);
>  
>  	if (deq_flags & SCX_DEQ_SLEEP)
> @@ -2446,9 +2450,10 @@ static bool dequeue_task_scx(struct rq *
>  
>  static void yield_task_scx(struct rq *rq)
>  {
> +	struct scx_sched *sch = scx_root;
>  	struct task_struct *p = rq->curr;
>  
> -	if (SCX_HAS_OP(scx_root, yield))
> +	if (SCX_HAS_OP(sch, yield))
>  		SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, rq, p, NULL);
>  	else
>  		p->scx.slice = 0;
> @@ -2456,9 +2461,10 @@ static void yield_task_scx(struct rq *rq
>  
>  static bool yield_to_task_scx(struct rq *rq, struct task_struct *to)
>  {
> +	struct scx_sched *sch = scx_root;
>  	struct task_struct *from = rq->curr;
>  
> -	if (SCX_HAS_OP(scx_root, yield))
> +	if (SCX_HAS_OP(sch, yield))
>  		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, rq, from, to);
>  	else
>  		return false;
> @@ -3011,7 +3017,7 @@ static int balance_one(struct rq *rq, st
>  	rq->scx.flags |= SCX_RQ_IN_BALANCE;
>  	rq->scx.flags &= ~(SCX_RQ_BAL_PENDING | SCX_RQ_BAL_KEEP);
>  
> -	if ((scx_root->ops.flags & SCX_OPS_HAS_CPU_PREEMPT) &&
> +	if ((sch->ops.flags & SCX_OPS_HAS_CPU_PREEMPT) &&
>  	    unlikely(rq->scx.cpu_released)) {
>  		/*
>  		 * If the previous sched_class for the current CPU was not SCX,
> @@ -3019,7 +3025,7 @@ static int balance_one(struct rq *rq, st
>  		 * core. This callback complements ->cpu_release(), which is
>  		 * emitted in switch_class().
>  		 */
> -		if (SCX_HAS_OP(scx_root, cpu_acquire))
> +		if (SCX_HAS_OP(sch, cpu_acquire))
>  			SCX_CALL_OP(SCX_KF_REST, cpu_acquire, rq, cpu_of(rq), NULL);
>  		rq->scx.cpu_released = false;
>  	}
> @@ -3050,7 +3056,7 @@ static int balance_one(struct rq *rq, st
>  	if (consume_global_dsq(sch, rq))
>  		goto has_tasks;
>  
> -	if (unlikely(!SCX_HAS_OP(scx_root, dispatch)) ||
> +	if (unlikely(!SCX_HAS_OP(sch, dispatch)) ||
>  	    scx_rq_bypassing(rq) || !scx_rq_online(rq))
>  		goto no_tasks;
>  
> @@ -3101,7 +3107,7 @@ no_tasks:
>  	 * %SCX_OPS_ENQ_LAST is in effect.
>  	 */
>  	if (prev_on_rq &&
> -	    (!(scx_root->ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
> +	    (!(sch->ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
>  		rq->scx.flags |= SCX_RQ_BAL_KEEP;
>  		__scx_add_event(sch, SCX_EV_DISPATCH_KEEP_LAST, 1);
>  		goto has_tasks;
> @@ -3176,6 +3182,8 @@ static void process_ddsp_deferred_locals
>  
>  static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	if (p->scx.flags & SCX_TASK_QUEUED) {
>  		/*
>  		 * Core-sched might decide to execute @p before it is
> @@ -3188,7 +3196,7 @@ static void set_next_task_scx(struct rq
>  	p->se.exec_start = rq_clock_task(rq);
>  
>  	/* see dequeue_task_scx() on why we skip when !QUEUED */
> -	if (SCX_HAS_OP(scx_root, running) && (p->scx.flags & SCX_TASK_QUEUED))
> +	if (SCX_HAS_OP(sch, running) && (p->scx.flags & SCX_TASK_QUEUED))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, running, rq, p);
>  
>  	clr_task_runnable(p, true);
> @@ -3232,6 +3240,7 @@ preempt_reason_from_class(const struct s
>  
>  static void switch_class(struct rq *rq, struct task_struct *next)
>  {
> +	struct scx_sched *sch = scx_root;
>  	const struct sched_class *next_class = next->sched_class;
>  
>  #ifdef CONFIG_SMP
> @@ -3242,7 +3251,7 @@ static void switch_class(struct rq *rq,
>  	 */
>  	smp_store_release(&rq->scx.pnt_seq, rq->scx.pnt_seq + 1);
>  #endif
> -	if (!(scx_root->ops.flags & SCX_OPS_HAS_CPU_PREEMPT))
> +	if (!(sch->ops.flags & SCX_OPS_HAS_CPU_PREEMPT))
>  		return;
>  
>  	/*
> @@ -3264,7 +3273,7 @@ static void switch_class(struct rq *rq,
>  	 *  next time that balance_scx() is invoked.
>  	 */
>  	if (!rq->scx.cpu_released) {
> -		if (SCX_HAS_OP(scx_root, cpu_release)) {
> +		if (SCX_HAS_OP(sch, cpu_release)) {
>  			struct scx_cpu_release_args args = {
>  				.reason = preempt_reason_from_class(next_class),
>  				.task = next,
> @@ -3279,10 +3288,11 @@ static void switch_class(struct rq *rq,
>  static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
>  			      struct task_struct *next)
>  {
> +	struct scx_sched *sch = scx_root;
>  	update_curr_scx(rq);
>  
>  	/* see dequeue_task_scx() on why we skip when !QUEUED */
> -	if (SCX_HAS_OP(scx_root, stopping) && (p->scx.flags & SCX_TASK_QUEUED))
> +	if (SCX_HAS_OP(sch, stopping) && (p->scx.flags & SCX_TASK_QUEUED))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, rq, p, true);
>  
>  	if (p->scx.flags & SCX_TASK_QUEUED) {
> @@ -3306,7 +3316,7 @@ static void put_prev_task_scx(struct rq
>  		 * which should trigger an explicit follow-up scheduling event.
>  		 */
>  		if (sched_class_above(&ext_sched_class, next->sched_class)) {
> -			WARN_ON_ONCE(!(scx_root->ops.flags & SCX_OPS_ENQ_LAST));
> +			WARN_ON_ONCE(!(sch->ops.flags & SCX_OPS_ENQ_LAST));
>  			do_enqueue_task(rq, p, SCX_ENQ_LAST, -1);
>  		} else {
>  			do_enqueue_task(rq, p, 0, -1);
> @@ -3381,10 +3391,12 @@ static struct task_struct *pick_task_scx
>  		}
>  
>  		if (unlikely(!p->scx.slice)) {
> -			if (!scx_rq_bypassing(rq) && !scx_root->warned_zero_slice) {
> +			struct scx_sched *sch = scx_root;
> +
> +			if (!scx_rq_bypassing(rq) && !sch->warned_zero_slice) {
>  				printk_deferred(KERN_WARNING "sched_ext: %s[%d] has zero slice in %s()\n",
>  						p->comm, p->pid, __func__);
> -				scx_root->warned_zero_slice = true;
> +				sch->warned_zero_slice = true;
>  			}
>  			refill_task_slice_dfl(p);
>  		}
> @@ -3415,12 +3427,14 @@ static struct task_struct *pick_task_scx
>  bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
>  		   bool in_fi)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	/*
>  	 * The const qualifiers are dropped from task_struct pointers when
>  	 * calling ops.core_sched_before(). Accesses are controlled by the
>  	 * verifier.
>  	 */
> -	if (SCX_HAS_OP(scx_root, core_sched_before) &&
> +	if (SCX_HAS_OP(sch, core_sched_before) &&
>  	    !scx_rq_bypassing(task_rq(a)))
>  		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, core_sched_before, NULL,
>  					      (struct task_struct *)a,
> @@ -3493,6 +3507,8 @@ static void task_woken_scx(struct rq *rq
>  static void set_cpus_allowed_scx(struct task_struct *p,
>  				 struct affinity_context *ac)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	set_cpus_allowed_common(p, ac);
>  
>  	/*
> @@ -3503,13 +3519,14 @@ static void set_cpus_allowed_scx(struct
>  	 * Fine-grained memory write control is enforced by BPF making the const
>  	 * designation pointless. Cast it away when calling the operation.
>  	 */
> -	if (SCX_HAS_OP(scx_root, set_cpumask))
> +	if (SCX_HAS_OP(sch, set_cpumask))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, NULL,
>  				 p, (struct cpumask *)p->cpus_ptr);
>  }
>  
>  static void handle_hotplug(struct rq *rq, bool online)
>  {
> +	struct scx_sched *sch = scx_root;
>  	int cpu = cpu_of(rq);
>  
>  	atomic_long_inc(&scx_hotplug_seq);
> @@ -3519,15 +3536,15 @@ static void handle_hotplug(struct rq *rq
>  	 * stable here. Note that we can't depend on scx_enabled() test as the
>  	 * hotplug ops need to be enabled before __scx_enabled is set.
>  	 */
> -	if (!scx_root)
> +	if (unlikely(!sch))
>  		return;
>  
>  	if (scx_enabled())
> -		scx_idle_update_selcpu_topology(&scx_root->ops);
> +		scx_idle_update_selcpu_topology(&sch->ops);
>  
> -	if (online && SCX_HAS_OP(scx_root, cpu_online))
> +	if (online && SCX_HAS_OP(sch, cpu_online))
>  		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, NULL, cpu);
> -	else if (!online && SCX_HAS_OP(scx_root, cpu_offline))
> +	else if (!online && SCX_HAS_OP(sch, cpu_offline))
>  		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, NULL, cpu);
>  	else
>  		scx_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
> @@ -3621,6 +3638,8 @@ void scx_tick(struct rq *rq)
>  
>  static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	update_curr_scx(rq);
>  
>  	/*
> @@ -3630,7 +3649,7 @@ static void task_tick_scx(struct rq *rq,
>  	if (scx_rq_bypassing(rq)) {
>  		curr->scx.slice = 0;
>  		touch_core_sched(rq, curr);
> -	} else if (SCX_HAS_OP(scx_root, tick)) {
> +	} else if (SCX_HAS_OP(sch, tick)) {
>  		SCX_CALL_OP_TASK(SCX_KF_REST, tick, rq, curr);
>  	}
>  
> @@ -3698,11 +3717,12 @@ static void scx_set_task_state(struct ta
>  
>  static int scx_init_task(struct task_struct *p, struct task_group *tg, bool fork)
>  {
> +	struct scx_sched *sch = scx_root;
>  	int ret;
>  
>  	p->scx.disallow = false;
>  
> -	if (SCX_HAS_OP(scx_root, init_task)) {
> +	if (SCX_HAS_OP(sch, init_task)) {
>  		struct scx_init_task_args args = {
>  			SCX_INIT_TASK_ARGS_CGROUP(tg)
>  			.fork = fork,
> @@ -3749,6 +3769,7 @@ static int scx_init_task(struct task_str
>  
>  static void scx_enable_task(struct task_struct *p)
>  {
> +	struct scx_sched *sch = scx_root;
>  	struct rq *rq = task_rq(p);
>  	u32 weight;
>  
> @@ -3765,28 +3786,30 @@ static void scx_enable_task(struct task_
>  
>  	p->scx.weight = sched_weight_to_cgroup(weight);
>  
> -	if (SCX_HAS_OP(scx_root, enable))
> +	if (SCX_HAS_OP(sch, enable))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, enable, rq, p);
>  	scx_set_task_state(p, SCX_TASK_ENABLED);
>  
> -	if (SCX_HAS_OP(scx_root, set_weight))
> +	if (SCX_HAS_OP(sch, set_weight))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, rq, p, p->scx.weight);
>  }
>  
>  static void scx_disable_task(struct task_struct *p)
>  {
> +	struct scx_sched *sch = scx_root;
>  	struct rq *rq = task_rq(p);
>  
>  	lockdep_assert_rq_held(rq);
>  	WARN_ON_ONCE(scx_get_task_state(p) != SCX_TASK_ENABLED);
>  
> -	if (SCX_HAS_OP(scx_root, disable))
> +	if (SCX_HAS_OP(sch, disable))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, disable, rq, p);
>  	scx_set_task_state(p, SCX_TASK_READY);
>  }
>  
>  static void scx_exit_task(struct task_struct *p)
>  {
> +	struct scx_sched *sch = scx_root;
>  	struct scx_exit_task_args args = {
>  		.cancelled = false,
>  	};
> @@ -3809,7 +3832,7 @@ static void scx_exit_task(struct task_st
>  		return;
>  	}
>  
> -	if (SCX_HAS_OP(scx_root, exit_task))
> +	if (SCX_HAS_OP(sch, exit_task))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, exit_task, task_rq(p), p, &args);
>  	scx_set_task_state(p, SCX_TASK_NONE);
>  }
> @@ -3915,10 +3938,12 @@ void sched_ext_free(struct task_struct *
>  static void reweight_task_scx(struct rq *rq, struct task_struct *p,
>  			      const struct load_weight *lw)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	lockdep_assert_rq_held(task_rq(p));
>  
>  	p->scx.weight = sched_weight_to_cgroup(scale_load_down(lw->weight));
> -	if (SCX_HAS_OP(scx_root, set_weight))
> +	if (SCX_HAS_OP(sch, set_weight))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, rq, p, p->scx.weight);
>  }
>  
> @@ -3928,13 +3953,15 @@ static void prio_changed_scx(struct rq *
>  
>  static void switching_to_scx(struct rq *rq, struct task_struct *p)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	scx_enable_task(p);
>  
>  	/*
>  	 * set_cpus_allowed_scx() is not called while @p is associated with a
>  	 * different scheduler class. Keep the BPF scheduler up-to-date.
>  	 */
> -	if (SCX_HAS_OP(scx_root, set_cpumask))
> +	if (SCX_HAS_OP(sch, set_cpumask))
>  		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, rq,
>  				 p, (struct cpumask *)p->cpus_ptr);
>  }
> @@ -3986,6 +4013,7 @@ static bool scx_cgroup_enabled;
>  
>  int scx_tg_online(struct task_group *tg)
>  {
> +	struct scx_sched *sch = scx_root;
>  	int ret = 0;
>  
>  	WARN_ON_ONCE(tg->scx_flags & (SCX_TG_ONLINE | SCX_TG_INITED));
> @@ -3993,7 +4021,7 @@ int scx_tg_online(struct task_group *tg)
>  	percpu_down_read(&scx_cgroup_rwsem);
>  
>  	if (scx_cgroup_enabled) {
> -		if (SCX_HAS_OP(scx_root, cgroup_init)) {
> +		if (SCX_HAS_OP(sch, cgroup_init)) {
>  			struct scx_cgroup_init_args args =
>  				{ .weight = tg->scx_weight };
>  
> @@ -4014,11 +4042,13 @@ int scx_tg_online(struct task_group *tg)
>  
>  void scx_tg_offline(struct task_group *tg)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	WARN_ON_ONCE(!(tg->scx_flags & SCX_TG_ONLINE));
>  
>  	percpu_down_read(&scx_cgroup_rwsem);
>  
> -	if (scx_cgroup_enabled && SCX_HAS_OP(scx_root, cgroup_exit) &&
> +	if (scx_cgroup_enabled && SCX_HAS_OP(sch, cgroup_exit) &&
>  	    (tg->scx_flags & SCX_TG_INITED))
>  		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, NULL, tg->css.cgroup);
>  	tg->scx_flags &= ~(SCX_TG_ONLINE | SCX_TG_INITED);
> @@ -4028,6 +4058,7 @@ void scx_tg_offline(struct task_group *t
>  
>  int scx_cgroup_can_attach(struct cgroup_taskset *tset)
>  {
> +	struct scx_sched *sch = scx_root;
>  	struct cgroup_subsys_state *css;
>  	struct task_struct *p;
>  	int ret;
> @@ -4052,7 +4083,7 @@ int scx_cgroup_can_attach(struct cgroup_
>  		if (from == to)
>  			continue;
>  
> -		if (SCX_HAS_OP(scx_root, cgroup_prep_move)) {
> +		if (SCX_HAS_OP(sch, cgroup_prep_move)) {
>  			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_prep_move, NULL,
>  					      p, from, css->cgroup);
>  			if (ret)
> @@ -4066,7 +4097,7 @@ int scx_cgroup_can_attach(struct cgroup_
>  
>  err:
>  	cgroup_taskset_for_each(p, css, tset) {
> -		if (SCX_HAS_OP(scx_root, cgroup_cancel_move) &&
> +		if (SCX_HAS_OP(sch, cgroup_cancel_move) &&
>  		    p->scx.cgrp_moving_from)
>  			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
>  				    p, p->scx.cgrp_moving_from, css->cgroup);
> @@ -4079,6 +4110,8 @@ err:
>  
>  void scx_cgroup_move_task(struct task_struct *p)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	if (!scx_cgroup_enabled)
>  		return;
>  
> @@ -4086,7 +4119,7 @@ void scx_cgroup_move_task(struct task_st
>  	 * @p must have ops.cgroup_prep_move() called on it and thus
>  	 * cgrp_moving_from set.
>  	 */
> -	if (SCX_HAS_OP(scx_root, cgroup_move) &&
> +	if (SCX_HAS_OP(sch, cgroup_move) &&
>  	    !WARN_ON_ONCE(!p->scx.cgrp_moving_from))
>  		SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, cgroup_move, NULL,
>  				 p, p->scx.cgrp_moving_from, tg_cgrp(task_group(p)));
> @@ -4100,6 +4133,7 @@ void scx_cgroup_finish_attach(void)
>  
>  void scx_cgroup_cancel_attach(struct cgroup_taskset *tset)
>  {
> +	struct scx_sched *sch = scx_root;
>  	struct cgroup_subsys_state *css;
>  	struct task_struct *p;
>  
> @@ -4107,7 +4141,7 @@ void scx_cgroup_cancel_attach(struct cgr
>  		goto out_unlock;
>  
>  	cgroup_taskset_for_each(p, css, tset) {
> -		if (SCX_HAS_OP(scx_root, cgroup_cancel_move) &&
> +		if (SCX_HAS_OP(sch, cgroup_cancel_move) &&
>  		    p->scx.cgrp_moving_from)
>  			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
>  				    p, p->scx.cgrp_moving_from, css->cgroup);
> @@ -4119,10 +4153,12 @@ out_unlock:
>  
>  void scx_group_set_weight(struct task_group *tg, unsigned long weight)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	percpu_down_read(&scx_cgroup_rwsem);
>  
>  	if (scx_cgroup_enabled && tg->scx_weight != weight) {
> -		if (SCX_HAS_OP(scx_root, cgroup_set_weight))
> +		if (SCX_HAS_OP(sch, cgroup_set_weight))
>  			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_set_weight, NULL,
>  				    tg_cgrp(tg), weight);
>  		tg->scx_weight = weight;
> @@ -4263,7 +4299,7 @@ out_unlock_rcu:
>  }
>  
>  #ifdef CONFIG_EXT_GROUP_SCHED
> -static void scx_cgroup_exit(void)
> +static void scx_cgroup_exit(struct scx_sched *sch)
>  {
>  	struct cgroup_subsys_state *css;
>  
> @@ -4283,7 +4319,7 @@ static void scx_cgroup_exit(void)
>  			continue;
>  		tg->scx_flags &= ~SCX_TG_INITED;
>  
> -		if (!scx_root->ops.cgroup_exit)
> +		if (!sch->ops.cgroup_exit)
>  			continue;
>  
>  		if (WARN_ON_ONCE(!css_tryget(css)))
> @@ -4298,7 +4334,7 @@ static void scx_cgroup_exit(void)
>  	rcu_read_unlock();
>  }
>  
> -static int scx_cgroup_init(void)
> +static int scx_cgroup_init(struct scx_sched *sch)
>  {
>  	struct cgroup_subsys_state *css;
>  	int ret;
> @@ -4318,7 +4354,7 @@ static int scx_cgroup_init(void)
>  		     (SCX_TG_ONLINE | SCX_TG_INITED)) != SCX_TG_ONLINE)
>  			continue;
>  
> -		if (!scx_root->ops.cgroup_init) {
> +		if (!sch->ops.cgroup_init) {
>  			tg->scx_flags |= SCX_TG_INITED;
>  			continue;
>  		}
> @@ -4348,8 +4384,8 @@ static int scx_cgroup_init(void)
>  }
>  
>  #else
> -static void scx_cgroup_exit(void) {}
> -static int scx_cgroup_init(void) { return 0; }
> +static void scx_cgroup_exit(struct scx_sched *sch) {}
> +static int scx_cgroup_init(struct scx_sched *sch) { return 0; }
>  #endif
>  
>  
> @@ -4792,7 +4828,7 @@ static void scx_disable_workfn(struct kt
>  	 * doesn't race against scx_exit_task().
>  	 */
>  	scx_cgroup_lock();
> -	scx_cgroup_exit();
> +	scx_cgroup_exit(sch);
>  	scx_cgroup_unlock();
>  
>  	/*
> @@ -5018,6 +5054,7 @@ static void scx_dump_task(struct seq_buf
>  			  struct task_struct *p, char marker)
>  {
>  	static unsigned long bt[SCX_EXIT_BT_LEN];
> +	struct scx_sched *sch = scx_root;
>  	char dsq_id_buf[19] = "(n/a)";
>  	unsigned long ops_state = atomic_long_read(&p->scx.ops_state);
>  	unsigned int bt_len = 0;
> @@ -5040,7 +5077,7 @@ static void scx_dump_task(struct seq_buf
>  		  p->scx.dsq_vtime, p->scx.slice, p->scx.weight);
>  	dump_line(s, "      cpus=%*pb", cpumask_pr_args(p->cpus_ptr));
>  
> -	if (SCX_HAS_OP(scx_root, dump_task)) {
> +	if (SCX_HAS_OP(sch, dump_task)) {
>  		ops_dump_init(s, "    ");
>  		SCX_CALL_OP(SCX_KF_REST, dump_task, NULL, dctx, p);
>  		ops_dump_exit();
> @@ -5059,6 +5096,7 @@ static void scx_dump_state(struct scx_ex
>  {
>  	static DEFINE_SPINLOCK(dump_lock);
>  	static const char trunc_marker[] = "\n\n~~~~ TRUNCATED ~~~~\n";
> +	struct scx_sched *sch = scx_root;
>  	struct scx_dump_ctx dctx = {
>  		.kind = ei->kind,
>  		.exit_code = ei->exit_code,
> @@ -5087,7 +5125,7 @@ static void scx_dump_state(struct scx_ex
>  		dump_stack_trace(&s, "  ", ei->bt, ei->bt_len);
>  	}
>  
> -	if (SCX_HAS_OP(scx_root, dump)) {
> +	if (SCX_HAS_OP(sch, dump)) {
>  		ops_dump_init(&s, "");
>  		SCX_CALL_OP(SCX_KF_UNLOCKED, dump, NULL, &dctx);
>  		ops_dump_exit();
> @@ -5110,7 +5148,7 @@ static void scx_dump_state(struct scx_ex
>  		idle = list_empty(&rq->scx.runnable_list) &&
>  			rq->curr->sched_class == &idle_sched_class;
>  
> -		if (idle && !SCX_HAS_OP(scx_root, dump_cpu))
> +		if (idle && !SCX_HAS_OP(sch, dump_cpu))
>  			goto next;
>  
>  		/*
> @@ -5144,7 +5182,7 @@ static void scx_dump_state(struct scx_ex
>  				  cpumask_pr_args(rq->scx.cpus_to_wait));
>  
>  		used = seq_buf_used(&ns);
> -		if (SCX_HAS_OP(scx_root, dump_cpu)) {
> +		if (SCX_HAS_OP(sch, dump_cpu)) {
>  			ops_dump_init(&ns, "  ");
>  			SCX_CALL_OP(SCX_KF_REST, dump_cpu, NULL, &dctx, cpu, idle);
>  			ops_dump_exit();
> @@ -5180,7 +5218,7 @@ static void scx_dump_state(struct scx_ex
>  	dump_line(&s, "Event counters");
>  	dump_line(&s, "--------------");
>  
> -	scx_read_events(scx_root, &events);
> +	scx_read_events(sch, &events);
>  	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
>  	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
>  	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
> @@ -5505,7 +5543,7 @@ static int scx_enable(struct sched_ext_o
>  	 * never sees uninitialized tasks.
>  	 */
>  	scx_cgroup_lock();
> -	ret = scx_cgroup_init();
> +	ret = scx_cgroup_init(sch);
>  	if (ret)
>  		goto err_disable_unlock_all;
>  
> @@ -6039,6 +6077,7 @@ static void kick_cpus_irq_workfn(struct
>   */
>  void print_scx_info(const char *log_lvl, struct task_struct *p)
>  {
> +	struct scx_sched *sch = scx_root;
>  	enum scx_enable_state state = scx_enable_state();
>  	const char *all = READ_ONCE(scx_switching_all) ? "+all" : "";
>  	char runnable_at_buf[22] = "?";
> @@ -6054,7 +6093,7 @@ void print_scx_info(const char *log_lvl,
>  	 */
>  	if (copy_from_kernel_nofault(&class, &p->sched_class, sizeof(class)) ||
>  	    class != &ext_sched_class) {
> -		printk("%sSched_ext: %s (%s%s)", log_lvl, scx_root->ops.name,
> +		printk("%sSched_ext: %s (%s%s)", log_lvl, sch->ops.name,
>  		       scx_enable_state_str[state], all);
>  		return;
>  	}
> @@ -6066,7 +6105,7 @@ void print_scx_info(const char *log_lvl,
>  
>  	/* print everything onto one line to conserve console space */
>  	printk("%sSched_ext: %s (%s%s), task: runnable_at=%s",
> -	       log_lvl, scx_root->ops.name, scx_enable_state_str[state], all,
> +	       log_lvl, sch->ops.name, scx_enable_state_str[state], all,
>  	       runnable_at_buf);
>  }
>  
> @@ -6844,7 +6883,7 @@ __bpf_kfunc s32 scx_bpf_dsq_nr_queued(u6
>  	preempt_disable();
>  
>  	sch = rcu_dereference_sched(scx_root);
> -	if (!sch) {
> +	if (unlikely(!sch)) {
>  		ret = -ENODEV;
>  		goto out;
>  	}
> @@ -6920,7 +6959,7 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(str
>  	kit->dsq = NULL;
>  
>  	sch = rcu_dereference_check(scx_root, rcu_read_lock_bh_held());
> -	if (!sch)
> +	if (unlikely(!sch))
>  		return -ENODEV;
>  
>  	if (flags & ~__SCX_DSQ_ITER_USER_FLAGS)
> --- a/kernel/sched/ext_idle.c
> +++ b/kernel/sched/ext_idle.c
> @@ -733,6 +733,7 @@ static void update_builtin_idle(int cpu,
>   */
>  void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
>  {
> +	struct scx_sched *sch = scx_root;
>  	int cpu = cpu_of(rq);
>  
>  	lockdep_assert_rq_held(rq);
> @@ -744,8 +745,7 @@ void __scx_update_idle(struct rq *rq, bo
>  	 * Idle transitions are indicated by do_notify being set to true,
>  	 * managed by put_prev_task_idle()/set_next_task_idle().
>  	 */
> -	if (SCX_HAS_OP(scx_root, update_idle) &&
> -	    do_notify && !scx_rq_bypassing(rq))
> +	if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
>  		SCX_CALL_OP(SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
>  
>  	/*
> 
