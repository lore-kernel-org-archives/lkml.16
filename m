Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D763F2EFD8C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750192989; cv=fail; b=K+qbIJOyMUjxO/BmvSwaxJPGVE9BuTinS2LArSwzlvclI+DwroUBPFgM+8CMGm8j9o+CkZ3d71ikoIncwNUy2mdH40KDcrtYiJG45vmdjq/rT6gRPlIQf/y2jKTHiwkRYGOCRBBH8yRhg+7jixap8TxIo5lUFb2IASNkVY39SJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750192989; c=relaxed/simple;
	bh=Sb3ai1I2wjlVAJWHLCCOie/YvP9Qh4TdGZ+y30QsOn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uMjWj1PRaAYzXkaW3GzRGZC66rGuYlpdehYafPrCIRruepe0WiTmDTlmaLgJoLF7yKk8gxGCw3Bs9j6620jytCcHlozqFdBhHRCmNNmvh93f3Y46ULikPT8BRQAeFNxbc0bAqWJvflov0pq8+/YoBzqCa+xP1EzbenKMtNUMvhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RUMw3Zuq; arc=fail smtp.client-ip=40.107.237.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RUMw3Zuq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoGyMVUF2DKB83rUCoOQdWruRg8sRSZlS8WW6xFC3HIQ/6SQnekWVSGwIwtTpsbEr9Q2KA7tiVCk9liPlp/lKzLvR1Jyjys+B0KugKMKrDh8hU0Szi2nzZmnvDLNe7yWRWF5Stds50GO/gEXIoMAdBOPV6k0dn7J0OPIehJ0dPnYhEk167bsNwrTi4kGiKaf+CIXNJ37UQlhQenamvJVhIOb6Iu+zvo9kmu4KS8MDdDukJSykkSNhtI6nDXL6zNbldHBBJpVvOHfelQcKZ07deuLIeBRz4KwIGoLxHfPZ6JoeDjYsifQHXa9+gQpX49T6tljNQp19hHHkDExGI1PnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h93VsFaJdFEgbdz2gOY68t764FSbog4OQjtnUCTT3LU=;
 b=PlXUSrz5eUetcGeNUC2WxAXsE3k+qL3RblzYKwJVHhDkUqVhEzB/oUfsyTsZBJER03CJimsEfqQlZrklSrnxOdG8kNjeasLEWkGcEwH/ds4VSJ67inAMERN1a3gFnaGcfHJl3NRgeWkYcLOn3p3haABhg1GJZigSQPa5dF7/+7o4RtFeZGUMmAHcYzlHoxYhwwrSLpl6/uDCnUcf/Yri22C0xQi5h+a5EpnK7gPjSMaS0Qxap/dSBBNEsAoHg5ca48Knd9u9U2ENYoJEpH3PnwcQlBK8jqweGsymO0o2lxmd/AIQkaucpW6pHs7Lfzo/RUu2LdgqbqmIunKnTGG3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h93VsFaJdFEgbdz2gOY68t764FSbog4OQjtnUCTT3LU=;
 b=RUMw3ZuqauFHE4oQyjQHSDf+NGpcim9bEEwpCTVm6DmhFNTb9u+LgQaBs7RM/cSvJhHR0JF/4BPcfpZAqbnsrXs/PhpHr0hRCvzFdl698RM/hjsCsfqHXFAhnOWjGEwiIPvf2V7oPuEMbGBsKZvSGpv16WeZ/uijgPCTjYXp51Y40nLITr+DtUXN35GSNw92GmBEN3j9XI47FlWJt3E09tWPGzZwMMvX5EdPWI0WVduKWTW57bxFp5Elf6f9bSDnenjMX2xb7dSVsdKusw8z/YWA38/f5udJjwv2NitAIuC7lvRDd9up+S3TZ5cytdqRvF7iIbFmp1zhW3PphiUo6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 20:43:04 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:43:04 +0000
Date: Tue, 17 Jun 2025 22:42:48 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v4 14/15] Remove the ext server BW before changing tasks
 to FAIR
Message-ID: <aFHTSJzanNYjIwJt@gpd4>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
 <20250617200523.1261231-15-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617200523.1261231-15-joelagnelf@nvidia.com>
X-ClientProxiedBy: MI1P293CA0030.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b217414-91b1-4228-f8c0-08ddaddf8ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NLuu1AxXycC/9UgOXAWu7Fum9F02sXJNIa7mpHwdCDTYHBFCRWej8Kadp8hr?=
 =?us-ascii?Q?UFj80Ky40AHlGyexEdEQhwGUkwiqGlYy0BDxTRcwMrbOG5puhiokAstP21fO?=
 =?us-ascii?Q?veBj7zb15wSeTMV622sFdXJ2qy48TSc8SqYuq6+EA5EsjcY8PlP6/zeH4th7?=
 =?us-ascii?Q?Qb7jiNF5IYmP2FoOfUsrnSu1qidTj3XN+Q34snOr/bcJ9lGuVwlZpN0KzXhQ?=
 =?us-ascii?Q?gY3mN6g2emNYFGH+kZ/4td9P+p1v5IbIbi92KwuFyrje6hkOtNwGN71lcpQx?=
 =?us-ascii?Q?o6+wS/VF8BvoqGJJkN7/YvoNKJPWNOw4+F2wRQsIe6gaC8h+k1JVrfFRd6EG?=
 =?us-ascii?Q?n/2wfhtLcr5ZS71z73CH5ASpP1vm/4pIgWU/NywV0FkMriv3+S2qKKWyPHGg?=
 =?us-ascii?Q?eV1EIHLpE6POV52SGkoFzMygD5SD+k1XOejtgoFaTliXfdpWZXz8DPd+B0lk?=
 =?us-ascii?Q?bwm7EWyhUwts7dtjMzmkXUv+V0BH9wSOC0RftEDarfX8m+Dow6XqTEIVBeAm?=
 =?us-ascii?Q?HrWEGt7UaLOZ2pG1RgKS7gbHqa/483zZTZRJrXMC1H8gFt5kuNWS00JXt1oV?=
 =?us-ascii?Q?yvsLD2w3GALTGMLzeigMONE4OraZ6HQ0j2wm6cymm6JwE5K2U44PwAumjgyq?=
 =?us-ascii?Q?ZqFZxXNzxg1BZqnNxHEsMs69jDGDbkoiIMzWm2ErHhaJTtQazTHPxYOlH3mq?=
 =?us-ascii?Q?Du2hz50PrhoSm/Ey8kB5wSRXp3WV4WjGzzaYbr3ZE1OA7C9mL7BPrZLenhjA?=
 =?us-ascii?Q?skWZGQ3wiykerDWkc47qEcoIdtPYS/gYHDCmWu+R/J7djQ2T3pB6olq3BBU4?=
 =?us-ascii?Q?bL3t//KffEkj2y7rdVTdD7Gqw3j+/CbYFHOAbHGZX7HknbUpgdyHiWQ14jKs?=
 =?us-ascii?Q?TZ1cS7zu56XPpxptI4NHytrIWQq7k+DveaVMBsenpfCiWLAu0okOHTsrKCb2?=
 =?us-ascii?Q?r2t1BV3PGlsmEk8MJM8mkRYBrdda14fi6DefCleiuNdUwPaT7Ve6bz3p4mW6?=
 =?us-ascii?Q?32tTnbPqN4gpSpSHCwggvvIkQygHIHEvnK7pYtH/55pB8dAH6FPAaNxKkg4x?=
 =?us-ascii?Q?wi7dKy7bM+ar2ulzojeFUKbSU82L/g5yzeDHuXqs4FuKygcxuZQIeMStjb6e?=
 =?us-ascii?Q?MhA6YSkfxTUuwB64Ax3roCZmpM9W1Gnd6dpbMFFBNU+9salBi28vdKAd5ttK?=
 =?us-ascii?Q?CzaM8BAPmV2YCBwvWazSbSHwq4HTfocefFnufWSSWOf8J1ZFKowJVmsrb7nA?=
 =?us-ascii?Q?iMVg4HjSksyY9eQxPbSQTXCSu4dQJSNCHNilTyWbwCGvLxXyOQuLGj5fRSDy?=
 =?us-ascii?Q?TyLl7h5v0zbusXIA7sLvf63H+CRG70tm30XAodJRKnpGGI/UlhP/tffr44qv?=
 =?us-ascii?Q?lTcT/4KAOa7DdGmZysuOSL9X/PCfUMtte7aW6YcsQePq8F81e2kv2u4X9u1c?=
 =?us-ascii?Q?4QGLUiRrzAI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rnvCyn7rLRizc0eLIGTRBbAXErUZrl/U2eXl0TY7UjtpQK1oF4WLzNVCwiYM?=
 =?us-ascii?Q?0bk0Nw1iY7L53pDfRM7lyAJXfed11vstaobmkFgMFwCpETAqZOroffj3q98S?=
 =?us-ascii?Q?z4xD56IFb13sNqSq6IXRb9btjink6KcvsU8+40SLMGjXAaYKQBLc63cbmYUS?=
 =?us-ascii?Q?ui6wfZzzDcbASq22BPukbAmwZFqC3bxF9WlRq3ewL/gtYlEvCfvwgEPTLY5t?=
 =?us-ascii?Q?C52rhnQtJx3w0wTKrRL/1LCWEDpNADHIZPK7D80/CUZgTv8yoWxUv5bR04ds?=
 =?us-ascii?Q?B1c4yMRQstof78C89D1ly87a1sYcmIE3h+44PwijelmUDeLx6Tib9sFnmUUJ?=
 =?us-ascii?Q?RxcPyAahdrIlIq4daF54MJEOlgPvgkoIEvcISoDxcv9mffU28l/EvQsLPv4t?=
 =?us-ascii?Q?OD2LZ0alVeGSHMf8EOwJhtpKavGQyFNCVeZVDQqvTKudxu6ZbJSHCDyN6RVz?=
 =?us-ascii?Q?T1qZc2nt1iQgFtK8eEjAzZvYwuoFzBNfTXfLjUYNEcHaUzxYqwFLEmqvoLvK?=
 =?us-ascii?Q?lP6OtmeVAaGS7Ldpca/SgIfnF0F94/puGY1vXRU1B9YIYUfzJgos9g/3A0Mt?=
 =?us-ascii?Q?Hx+GW8YLSMaPDnUuaBmkVSipZalpZMXnhxiz7jJ6E+ABZHb3+L1xvNf8SI8o?=
 =?us-ascii?Q?pg9j1IBBKTGu3wfWB6D9dKqcVZjisdYBYU9GexMJNIvFuj12RFffHkfQiXKK?=
 =?us-ascii?Q?80u3NHzdG92CJU76aEat5CiG/o+2Z8ETOhYuJNKzw1cQdxIhGjjrtGNQMeRZ?=
 =?us-ascii?Q?NrXdUB4Cv6NGCBkU0RwnA5VYA+k8aemoocU5Lu5GnlJrizn5koJT2S9Ril0y?=
 =?us-ascii?Q?AFUrEY2FDBseKfUQEz/nDdBSYEKS/YtoKvGIGVvWr4CyxRJfJh+76fJ3PkZO?=
 =?us-ascii?Q?NEyAx2XrOt5bvUUo5jullo5/KUczaLTE7VvxWpaQTVKO+dv/nUehRS0P3Xin?=
 =?us-ascii?Q?spHQrgefJXfY38j90dzFevw7i5ON+vQEhchd2NdrTql9CY1qSkN1QwKXwQBL?=
 =?us-ascii?Q?pqvXDv1y6UynEFL0kTDl380AoAlfP0V6dXn4vMjC+0IaAuzu5m9qmKMC4qZV?=
 =?us-ascii?Q?rqEB6ICz1WAWZ5Rw8gA4r1IlSn1DhbnsBf9EjjDmYwfFOUhDIc0fk9PNrJiL?=
 =?us-ascii?Q?edEb7cNCnIHA+LDL0qU/YQJhTQSHCaaLda9/Fguj+kzLJWhSLOvFq25QIKcc?=
 =?us-ascii?Q?R2aIUqa4IkvF6fQXRM3WmsKIyveHdTonqBnXJ88IRVlTY2XyGsz+9NVEuLco?=
 =?us-ascii?Q?bSXfexyWV60Sv1Vtvioo/g1bQo97+3fkKDhjOn9E/lnjxxaHgaWt3JRIYGM5?=
 =?us-ascii?Q?FA9diT31EHTwBQo1fkyu3RnvMHBb2e3bDj0eHBp+BpaGyXHndVx30ydxXhkx?=
 =?us-ascii?Q?2yesupS2d802EKKyS9TniK45c4tMTeGsDcqcFe/taki61GxzQjSSCRiON4WC?=
 =?us-ascii?Q?Di6wxkbuj4ORl0zrFOnMFgq1aHpn+fx5BrKkgF+RwR/JAKO5IgGBk+V3Uez6?=
 =?us-ascii?Q?U9ixS5RQ0dPwQQXMw1qApXDhLzuQdMtor/dv7ezXR0PIsVMr4CTpJY57faZh?=
 =?us-ascii?Q?4Pw56UvkAjDkRq+pqO9tFUDaM61zMu9WK1d1VtHv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b217414-91b1-4228-f8c0-08ddaddf8ea2
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:43:04.0970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMU6VJHt24KFFKVww+f5m5g7b2/7qmmqZ3A1/rR8kBRnvjBs8YQKHlSe92EkTuolTpKOP3CArxEUsm1mozb3sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409

Hi Joel,

On Tue, Jun 17, 2025 at 04:05:17PM -0400, Joel Fernandes wrote:
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  kernel/sched/ext.c | 39 +++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 84ccab8cb838..23e5711bc4fc 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -4960,6 +4960,31 @@ static void scx_disable_workfn(struct kthread_work *work)
>  
>  	scx_init_task_enabled = false;
>  
> +	for_each_possible_cpu(cpu) {
> +		struct rq *rq = cpu_rq(cpu);
> +		struct rq_flags rf;
> +
> +		/*
> +		 * Invalidate all the rq clocks to prevent getting outdated
> +		 * rq clocks from a previous scx scheduler.
> +		 */
> +		scx_rq_clock_invalidate(rq);

We're also calling scx_rq_clock_invalidate(rq) twice (see below).

> +
> +		/*
> +		 * We are unloading the sched_ext scheduler, we do not need its
> +		 * DL server bandwidth anymore, remove it for all CPUs. Whenever
> +		 * the first SCX task is enqueued (when scx is re-loaded), its DL
> +		 * server bandwidth will be re-initialized.
> +		 */
> +		rq_lock_irqsave(rq, &rf);
> +		update_rq_clock(rq);
> +		if (dl_server_active(&rq->ext_server))
> +			dl_server_stop(&rq->ext_server);
> +		dl_server_remove_params(&rq->ext_server);
> +		rq_unlock_irqrestore(rq, &rf);
> +	}
> +
> +
>  	scx_task_iter_start(&sti);
>  	while ((p = scx_task_iter_next_locked(&sti))) {
>  		const struct sched_class *old_class = p->sched_class;
> @@ -4985,26 +5010,12 @@ static void scx_disable_workfn(struct kthread_work *work)
>  
>  	for_each_possible_cpu(cpu) {
>  		struct rq *rq = cpu_rq(cpu);
> -		struct rq_flags rf;
>  
>  		/*
>  		 * Invalidate all the rq clocks to prevent getting outdated
>  		 * rq clocks from a previous scx scheduler.
>  		 */
>  		scx_rq_clock_invalidate(rq);
> -
> -		/*
> -		 * We are unloading the sched_ext scheduler, we do not need its
> -		 * DL server bandwidth anymore, remove it for all CPUs. Whenever
> -		 * the first SCX task is enqueued (when scx is re-loaded), its DL
> -		 * server bandwidth will be re-initialized.
> -		 */
> -		rq_lock_irqsave(rq, &rf);
> -		update_rq_clock(rq);
> -		if (dl_server_active(&rq->ext_server))
> -			dl_server_stop(&rq->ext_server);
> -		dl_server_remove_params(&rq->ext_server);
> -		rq_unlock_irqrestore(rq, &rf);
>  	}

We should probably remove this for_each_possible_cpu() completely.

>  
>  	/* no task is on scx, turn off all the switches and flush in-progress calls */
> -- 
> 2.43.0
> 

Thanks,
-Andrea
