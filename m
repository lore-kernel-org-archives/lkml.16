Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500E4AEE0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049688; cv=fail; b=g+BXw88tt57qk2oBHPuYKJa2gpbAx3sYke1uki3ebEC8SsaB0ktG8DWW72qYzoVG59LNAVHHwpOgToGHDkb3HaUZ8zdMtRLjKW2O2+JIoPa6DUQaeSWFab4vpHGZ3bA4UMKO2Bewv3WrQDXPpJJIy53zFrjCdDSLmgS/zheC42c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049688; c=relaxed/simple;
	bh=s7q+TmotzTaeb5NWDpmcYd6Bgj1D76boXAFc9O3SsWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EnfWtqRgApxIYojm6NeaamZaImpAw8VpqFWhO0O9EzyDnaKkpcjbEk9jwndJApUMqbLZV4Tp1y7XrPpAcmq59TFMxmGpmmeTrGHJstRdsPxqL3MOeXbWBV/ZJPwrS9u/y1no7mtKpZyfY60wiqAVdnUYq4OYFB1weqpPZv8e6cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X/1H4QUD; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X/1H4QUD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYg1A8xcQRzeKVtI1i7afrI3Gg/PWfTm9FHbNzwCVVT5l/RvOoaV1WcnTV6CvS8Sperwqq20qU3sq1Fxx5Zx55t4C3U9NqWkEoyD67Xl4To3mgrYBeOWYCTnmFhfwWYPRWeh0m/Up8nGWpq6sESJjf6xnLWnc0EPTFSLKRqZAqgjOcoWGcQDgc75y4uwZZ/ULkr/aMnjMl0oLSqIIC1okUE371i8jL5yvXkV1jNBhdfKqIAa7MyOHPjExAVXGLRmx69SI9Y55Fsgmt4weh2fI/dp5pkAtaJkzcDIsj7CQlWLOCZo3YWFfVwLAQgX7HKBaEyKvHa6Zbi7WAWIhSd6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wsNbqHzaOXBdFXbWEhXRUqIT104FYBvJscGGkBpn2o=;
 b=Oh05FmdehJJHfH+XPxzh5qVidXFI+TOANeDUBvteHAfAfQHNucTiQUZ1V18U1GCv58nx5Yc99k5fgewfeV3EwWzFQW8Klc9ii30oME7d19TjyI53Z+LM5ttvazXt9fIQdqZF3R4FtJQI1KkHDpkvMDnQ9+U7uTtajS+ekKdK2Ivp/Ihw656IhFWdtPmFckr0nw9At1gaaOaOBqqqXPBRJ2yv83NAz/8XOdQBIqKkZlQ5ixlzWg6SeEZe3IUAZWzkMMfdZU3XtthQbqzysz4Xs47+BmBPe3L/lAt5eL4slKmG7d2sXMnzoREKLRckQcYW+fSBB/PXcyVeIVIYpBgslg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wsNbqHzaOXBdFXbWEhXRUqIT104FYBvJscGGkBpn2o=;
 b=X/1H4QUDIkHn0dFsDg6amxI6Buc8uF2FhoIr8EC//mgdIIHbWmpeGByqQV3Twg8PGcYJl7/6Mk2UVlmEaB8LKYqo1keqPLwgKphYFj6Hf34pthCdz8/SPawoDl6vPwSs5ordqenNzVSBRPi6Bt2dTwiVHsKWAVRPw/ejdEq3U9c7X6IsS3m9fYu5GNK6wW/g/56Vh2nq5tO/uPHdPbW3W0Xwk60KHnKOgSNy6SN7f9OFgQsvOpo5YCjrRx6JGhqZDlTLRBkxxGWyu4TbVGgx1j8jTqhuD+nQ3SjfmWRE2n0Sbh+Do7zBCGVP7Z1pxiO1laXPBvAjXytSg1ycYgIHpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB8118.namprd12.prod.outlook.com (2603:10b6:806:333::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Wed, 4 Jun
 2025 15:08:03 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 15:08:03 +0000
Date: Wed, 4 Jun 2025 17:07:55 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: idle: Skip cross-node search with !CONFIG_NUMA
Message-ID: <aEBhS-WDH_kaXmVd@gpd4>
References: <20250603082201.173642-1-arighi@nvidia.com>
 <aEBSm7Lm9Gx_anMo@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEBSm7Lm9Gx_anMo@yury>
X-ClientProxiedBy: MI1P293CA0010.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::7)
 To LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 40acbcdb-8d9d-4313-fb9c-08dda3799a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bQlEGJeoBFDPEA9vzb7920LjN9KJV4l8frf9B2Bm7vD4Hg0YNDEHZFf5CSU9?=
 =?us-ascii?Q?n81pk9Ng4di+SXz3khnfwjhkOKfPDo+A78VDVvP7ZdgW5JnDec+XkG4pfnth?=
 =?us-ascii?Q?JmH7LlEY+PLX0ue1kHXNeWzoB6AM/YMPGZPMmDozYUw5Tn5Br1RiKe40cFWO?=
 =?us-ascii?Q?vzBuIvqFJt/Xcx6K7WcjpdhmD1b5Pux19zkOfibDaNpW4qqn7Ax7H/rncaf5?=
 =?us-ascii?Q?1QqPVQLsddYUyce7QprJ0xIqmHXWCbXvOZpyHzjxPucMwzOdxDtvHPJgs8C6?=
 =?us-ascii?Q?oKOYYUo6Bq8sIctzFz3oFYD3SYFSrZeKUrm4vw2ZLt6ccGiS3fPlTudRpfsX?=
 =?us-ascii?Q?F1D0LDVtAD1RDceIBwB/cJsGDFmTnBIjyr9W6FQ7qvapXQYnmVB7F251hQqB?=
 =?us-ascii?Q?keeBomqZhbQUgL1Yjw1qrHknaponJ73AUmvqXegWIIMlBH7i/4Wit523TOdV?=
 =?us-ascii?Q?mvpxOaFj/QyaOmzKYqyxet72LYCF3Pubr52foeBby5ZpKPl1FB/NpuVRitTE?=
 =?us-ascii?Q?xsVAnnRQ8l5HLlg4frb5MrXCWrswmQEiI3N/fFRC+58gacrujl+q2w5LkDSn?=
 =?us-ascii?Q?8vbUsRRVWn/sPsc479rPK60lTCAdljUrrlDWEoC282+2HyF1ZXScbWm21u9N?=
 =?us-ascii?Q?c7I/tG3/EqK3BnFoj6k8rGUMuMyWf73AnlXyQO6lwMYI8aE5JvbiiLSNJoTc?=
 =?us-ascii?Q?cUUlRYPFt1aNKyhTZTHPQE38QxTU3YIAwZ+XrJW+1U15YUngTBbsvy3WSmKf?=
 =?us-ascii?Q?4us+yJE1W+yeQKo5Bpi6mrDITNuSogFx0vplqOHXwzVy6JCvjpv5/EnFTq83?=
 =?us-ascii?Q?N2QLjmQFNP2wjtaGr2mlu/du6/XlF/W9wN+YGuCW7Ih16j/FPbE5TKZqDu+D?=
 =?us-ascii?Q?RhCNS6oa0hxJouy8C9aOVwztmGes2XXPjJKCZ5NxkqFf+7Z4vPMyY+KHrVfz?=
 =?us-ascii?Q?WDuDQDdqEQEt6d/zWe0/WL8IJWOFOmauJzpjqZXHM1fxEowlAAtaBiXQKu5O?=
 =?us-ascii?Q?FDTWlBQrSNANOSwL4GxpbTxAumP+5pGuYT2Za8TQ24fB9DBbrsbqLOVt6qgg?=
 =?us-ascii?Q?njGy/3FgYA9Zhbl0yW5fEiRPeudDJ6jsg2qAgn3duX0UHkIPN8EDB72wHhu1?=
 =?us-ascii?Q?wmBQqRI7qOjGPCic73q3t12J9vtAHnOIatSBWZigb0SQ6Nyr227ZwJse9oAV?=
 =?us-ascii?Q?Ujx04H9GVEn83YGf9h0x9LzlIanCOt2phaPFaXI4EwFCRUGOEVMPewMzNbc2?=
 =?us-ascii?Q?2aFNZK1719cZqKF99plt3k7bmlmpZl4pT6kj8Ku3D7C+QStQtDUOjNo1EHSx?=
 =?us-ascii?Q?b1X8a8LWa2nVCW2lK6psjvk0YdbPUfTk4FMTayehxDXja1kbqPVmkGrkWdft?=
 =?us-ascii?Q?y8mAakR2+SAWqXkOstgoxphTYJ9NglS2NStu4RxPPTWYUBm+UVzd2VXbzFID?=
 =?us-ascii?Q?c8uPsJ7dxS0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p0dpcLFy7VOjsFev422shqnbOO3rqywXwA0cjvrAps74GVLFxBCAOZ3GlfNF?=
 =?us-ascii?Q?tF1qbbCgWvz3ElXvVoRmV3RPMA14SDLoj0pAP6UiMfRpYvVitZdHH9BPUM8G?=
 =?us-ascii?Q?plcyLhDoR6/3rti9EQH6X5JjcEm6T/YKAu0BgzqbZoEVss7Y6+GQ+d6VXId/?=
 =?us-ascii?Q?0e4PnW0SEIBxCadICQwL/nWfkEb1wuitiPFcdmcRZAfc0DN74ihkPPqXnAnb?=
 =?us-ascii?Q?S27IwAw6GPUVBMP+Y7RMr656dUluQ1GHSXt6PnaS6xFu4if3g4wkbf3x4Pha?=
 =?us-ascii?Q?5MUQJraIhsFz2KpZZNd+dV6TVnhXe1dmigwLUHGlvedTWEwGNM84oHPnSPA6?=
 =?us-ascii?Q?qdtx0a7h5YjEa/q8KgVNuHVsJap+Li289wU7UcOSxg+dhoalU3Rz6rAjpzS6?=
 =?us-ascii?Q?x/iku4M9p1PNSbUHlEondCSYULh1NXOhvGY87GPb2Zovztt8FCsIFNF7MtCm?=
 =?us-ascii?Q?NxiP4CVfmiWm1gzknQW/aSkvdPAEqxVg7Hp/cLqG0ACJp+BwBW0Va2Xf+4P3?=
 =?us-ascii?Q?12zC4C4dNJgHgD+Mc5IGQuQDAuNK3Bf5qsfe2hY8/FZT1b1K106vUlZylC5Y?=
 =?us-ascii?Q?vh0OcmqIGC0mmR7KDlxdDNMz+ZRJ8mDbgbYmJHYvsxphpRhTnuTRH0l6GIw4?=
 =?us-ascii?Q?2QuqafIYq6POX0AxwdR+1XHJabZsNweivQtJjdr5MssvCa3zG2Rqb+NVimDq?=
 =?us-ascii?Q?AUGPgKOc7pGzqvwi4kY2in2JWmEgtfXHvTgtFI66B2Le3EPEL2t90qnNTCQh?=
 =?us-ascii?Q?3qZ8o+VIV7M74tBZ+JN7uvOPD4JtInT6yt6g8sgOWYBHAyw9bBuyJguJJtES?=
 =?us-ascii?Q?vFXSqqyheriNFjQ9ad7qah1LUt5ycvFZzvq93KJ16uwP+rzzVwhHoqeXqYkF?=
 =?us-ascii?Q?qXKII3ER6RvmOMrvoX1T143Jn7zXYBbe47BmfGwKbhN6zPDZQXV5bOq/SmqA?=
 =?us-ascii?Q?UQz4C/sCY7tXMoXe+ofFG4nCnGCqXumXoP7bADUAwUmoNcvaidbhPuXLTode?=
 =?us-ascii?Q?jCKpDIyUTIrn6jkuPwywzTPzN2I8cX9k0D9oPDjn2p7frQ6/s7JQJoFE9r61?=
 =?us-ascii?Q?xeAchB5cEOUiJYWuS6oyFgNs303LC4GExQbpNROJgGGpcjS1a55nUhnOUHPj?=
 =?us-ascii?Q?YoVZiZxxidKRWWdVS7ul/qlSWv7EtZY4jmXZIHMF8z8YjFN1EmZEeGE33iB7?=
 =?us-ascii?Q?ijX6AXnmew+HnYYkUZLDwX8s8edzpgdloyvD6Tz4eCmm3UjP6/gpU34JgU4Z?=
 =?us-ascii?Q?OV04ojG20nL6WBSuQ8hzNR8gqgUOgFIgxvdlD+gjh+Qg01GNBuEB1a6sDS00?=
 =?us-ascii?Q?KxCRVXmYbWDykzn4oubfp9PA16Mk0fjZocxf5o4+VVK0Que6jY3LuE4YO+lN?=
 =?us-ascii?Q?rWBy7KaQa5HJwudrFIV4u3jPKvMRbBX24X7BzpxXDhgkfdXGWUIaMI+6zZB3?=
 =?us-ascii?Q?nEty243MvUo4bIcbNFlWrJmEuhGQPHF6hAZbSLmYLHjaOfw3NP4mJsUzIfMT?=
 =?us-ascii?Q?rsNwNb5v+l8nAqCjSqNKbUVj4r93ZPVkehSz765nsn2zppz+lw2CoPBcdBbY?=
 =?us-ascii?Q?d86pI01+1xJV1q5rh9JWeBjNNOMf06SxL5zQENVC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40acbcdb-8d9d-4313-fb9c-08dda3799a4d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 15:08:03.3041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V1dt3ojgc71j1s5gae1Ii2/pdvZOlHVIhTWkhR/hVXbbuHvPEn51abn9nzWZSbz24m+EgSQ9v/HheNtNEuu1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8118

Hi Yuri,

On Wed, Jun 04, 2025 at 10:05:15AM -0400, Yury Norov wrote:
> Hi Andrea!
> 
> On Tue, Jun 03, 2025 at 10:22:01AM +0200, Andrea Righi wrote:
> > In the idle CPU selection logic, attempting cross-node searches adds
> > unnecessary complexity when CONFIG_NUMA is disabled.
> > 
> > Since there's no meaningful concept of nodes in this case, simplify the
> > logic by restricting the idle CPU search to the current node only.
> > 
> > Fixes: 48849271e6611 ("sched_ext: idle: Per-node idle cpumasks")
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >  kernel/sched/ext_idle.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
> > index 66da03cc0b338..8660d9ae40169 100644
> > --- a/kernel/sched/ext_idle.c
> > +++ b/kernel/sched/ext_idle.c
> > @@ -138,6 +138,7 @@ static s32 pick_idle_cpu_in_node(const struct cpumask *cpus_allowed, int node, u
> >  		goto retry;
> >  }
> >  
> > +#ifdef CONFIG_NUMA
> 
> It would be more natural if you move this inside the function body,
> and not duplicate the function declaration.

I was trying to catch both the function and the per_cpu_unvisited with a
single #ifdef, but I can definitely split that and add another #ifdef
inside the function body.

> 
> >  /*
> >   * Tracks nodes that have not yet been visited when searching for an idle
> >   * CPU across all available nodes.
> > @@ -186,6 +187,13 @@ static s32 pick_idle_cpu_from_online_nodes(const struct cpumask *cpus_allowed, i
> >  
> >  	return cpu;
> >  }
> > +#else
> > +static inline s32
> > +pick_idle_cpu_from_online_nodes(const struct cpumask *cpus_allowed, int node, u64 flags)
> > +{
> > +	return -EBUSY;
> > +}
> 
> This is misleading errno. The system is nut busy, it is disabled. If
> it was a syscall, I would say you should return ENOSYS. ENODATA is
> another candidate. Or you have a special policy for the subsystem/

So, this function is called only from scx_pick_idle_cpu(), that can still
call pick_idle_cpu_from_online_nodes() even on kernels with !CONFIG_NUMA,
if the BPF scheduler enables the per-node idle cpumask (setting the flag
SCX_OPS_BUILTIN_IDLE_PER_NODE).

We can return -ENOSYS, but then we still need to return -EBUSY from
scx_pick_idle_cpu(), since its logic is host-wide, so the choice of -EBUSY
was to be consistent with that.

However, I don't have a strong opinion, if you think it's clearer to return
-ENOSYS/ENODATA from pick_idle_cpu_from_online_nodes() I can change that,
but I'd still return -EBUSY from scx_pick_idle_cpu().

> 
> The above pick_idle_cpu_in_node() doesn't have CONFIG_NUMA protection
> as well. Is it safe against CONFIG_NUMA?

pick_idle_cpu_in_node() is always called with a validated node (when passed
from BPF) or a node from the kernel and idle_cpumask() is handling the
NUMA_NO_NODE case, so that should be fine in theory.

Thanks,
-Andrea

PS Tejun already applied this patch to his tree, so I'll send all the
changes as a followup patch, at least the original bug is fixed. :)
