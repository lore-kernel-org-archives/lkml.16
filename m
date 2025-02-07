Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C0502BE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 22:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738967779; cv=fail; b=PQCSmxF5YORMymXeJOR5Nak0+o+pLbLlewto/QfE6HwNHwiAAVSvtirrZJP90+U2sG92Cq9pZIZzW7iAJkokAaUtT7WkyeoMQNHy+7LxeqLzStrGh505hHHxYQZ7FZ9ScfH+rN42pFa6ckaGB4eryOxL9zunqugoqf57xpTtTw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738967779; c=relaxed/simple;
	bh=W0KHRbXRWThYJcAieuGdKvvAeXKxmeB2XWq8qiFPIHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lSLmVcyHZUzSO8LbLXpe+iURly3GYQRCpg4aVr9HsLqPZPlbV6ZovNchd0WeK/de0pSChYol7pJH7b7lLdxk+uIhvByx0guqQdykdIQfSJil+o7Z/6GArh++xRFpVl5fR75Uju2/0Cb4XqfXzEtz6GDDgQisMRrUB92emxE7RhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kLKmCz1l; arc=fail smtp.client-ip=40.107.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kLKmCz1l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNJ+id6B6Lm3bH7S/M0wrgZiz0r9NMmpMfCmqVq/QuEkGSE9N3v+3vXuBWmCeGY0d3MJn77J+4wk8JTnnqO2VIq3JdxKbZo0Ld8+QaTo5RIH6wZeVTrA90nLLEGRFFYR8QxY161G6QRZWonS9jboq7USI86x/iKdqQ+swG4JdGxQ20zzyE/lVvO1q5Raaah15r3sp2AyL/y/l0f/jhZCPpLxaRns01jqQEmtRLotQa4DcTVIEd8WFsuRBr3EtahzpdrZ24fhgPCTDEHvbXNpI9Mszo7PLxQ7hGZeN3IF4GRXIn/OY0ELNJlTxHUfJcN8P7E3I2BfIQWt18hz+ro8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FggciOLspbAWD3aOOy9BLQHEtakI8zsFql6PWNWiSjw=;
 b=JjuZLV5nM54tFkt4jI+CxKBLp8pQ+5UyQuQUo4z/kIt7tOKFoTgomFc2Mr55SYKcmjDf7hWqIushrHQJrWxvXRarPe4X/f+2zuhhs4yLmG15xk9In23xlWuwpToLkAHUUJnEVG2RZa7sv4weW9zGHvP2R7irRCTt9FDLYku4adbv+KhDaNi6opwSQ6yxU23qNf3ZzYfhHZ2Y1BxEfy5xj8KKrqm1TSU+O2pUEaRKX5bDwq0BV1LboeFAVIyyC60ezS9VoXhUXuF6T2QYq337EJ0wRT26hr5cRTdRkrn23ZEq2ngFY3YPmAGMMm45Ln38KCdsnMul9hAl568sqppEDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FggciOLspbAWD3aOOy9BLQHEtakI8zsFql6PWNWiSjw=;
 b=kLKmCz1lQ4GOi9X7jpDAY2aD7Ya4EST5yCDEPEGnW2z4ZZJex3S9R1Kf000M/Z5di6lY1/SsG3TZT869lOizO1OM+7gKQbOu9PXTFpXjZEyaUTL3QbPXHG6MhD9nLmH6n9lJ+xZmini9K+E/0NPCTK4K6TqmthGhbvMtHzTqptyyhKSvZV2UKv9WREJBks/I1uOPUGITX6m93mw5oCC5Dg43ILKIFFvUAxW8UhQnwc8DeTSzCjuiqgjmisXMGOIPJTAH6qepvHDM0P6yxmDAiIzZ2witeJ6IVoyqEr/eIlDLuPwFc3+lkvjw5WLvePaNkGs5oF8RzVNMi1QXpBz92w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by IA0PR12MB8254.namprd12.prod.outlook.com (2603:10b6:208:408::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Fri, 7 Feb
 2025 22:36:14 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%7]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 22:36:14 +0000
Date: Fri, 7 Feb 2025 23:36:08 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: Re: [PATCH sched_ext/for-6.14-fixes 1/2] sched_ext: Implement auto
 local dispatching of migration disabled tasks
Message-ID: <Z6aK2J4F7fnzugxs@gpd3>
References: <Z6Zz79AUub1YuHwD@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Zz79AUub1YuHwD@slm.duckdns.org>
X-ClientProxiedBy: FR4P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::9) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|IA0PR12MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 1690fec6-4f1a-4c9e-cbaa-08dd47c7d3fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pzKcb8pyaPvocGMOpG9SbVfc0SeN1X/1gCrlgIaL3ZI6yv+771EFSBnSxoPD?=
 =?us-ascii?Q?MDUqzoE8D+qq8DkreO0cDVHpf7SHLVsEpFwUbRcktd3CwUh5fzZn2a1Mp6Iz?=
 =?us-ascii?Q?vXzioHkTBJCsja5kTEPBjDabOLpLkgMFwfG5q57Ngg63jTUqVGO/pnjDzYox?=
 =?us-ascii?Q?3U/5JDZk4L4ZM3Rs4mHqmwFtEAiXX/4WPuforIu8oWZiEO4AD/E/einWtfPg?=
 =?us-ascii?Q?60qtajOTOY+fwBKz72bupoAAGgTTZRXfv5nk75QMFzElLWd3vW9/egJ8wQLh?=
 =?us-ascii?Q?i7y5Vl8WNYrmS1dTHiWSuSdvEzvKXXUtL8Bq6YfiONzJcKFya8UZ4qOJl2Dy?=
 =?us-ascii?Q?ftThuCnQJeuehHG6X7ra1xPZzTWULXcYQg9IgcEaoEwblW+wWBXeyRr0OHTe?=
 =?us-ascii?Q?3EvEFXX3FcuOenUU9YcM9/mpMmcUcN9yeYtMfm4kH8FLxu7lFN+5P91x+LSh?=
 =?us-ascii?Q?5Nl9Wmx4jNmdQ98B29xJRVct+rQBEtZzvhWM9S25pHfEG08dua+9TOMJRAm0?=
 =?us-ascii?Q?+uEWhItrFq/5bsq5k89Q9bxIgpj9OgudRnB4ne1MIZq7vhl1nmYEHLT/9Ygx?=
 =?us-ascii?Q?xl4wOMSkf8zGzdzCxtaiHCk+h5rtFAbocbXMYQYY+VdUb53FC8QJ8gEBGsaD?=
 =?us-ascii?Q?9QrxC6NRseseITy3mdE09WyKNE8bavp2wohVUjIQxLL0Tu8txCRF8DTu34Xe?=
 =?us-ascii?Q?uU/Z33IUSYnMfhAZvJv+Ak/6ArCLQFMGgCd49NAJXeEn7nccJSzenQsCETg8?=
 =?us-ascii?Q?rLkgeGVFoO9SpvSFZ/Jj4FjQIEsaQSNRDAUsCvEKRTFR3mvSFsopm54nTSTT?=
 =?us-ascii?Q?wCpeQkK5xcijKM20n1CIb/2PlR5ItzlJmFDEXVuArK+QBECkqELdJJA2l7cy?=
 =?us-ascii?Q?x25XnIBVTFgpycFUVKOoXFM0+9xTDBOspV2Fuzll7c77mkPqcpAEITX7XZYA?=
 =?us-ascii?Q?F86+LA+amqCwPL8Bjqt8ympZ5elBusumSA3h1q1YTmejF4EbgDB9pGFP6a69?=
 =?us-ascii?Q?IuKx5dm4HitHaMiHbkrJM3Xa1+A3isanEPi5gqY3d2E+rVqmNlTrZjNOeOQR?=
 =?us-ascii?Q?ivmUgubg5Ub35iqukAl6gbu0UAUpaMCuy7wT5pTyoUWFSV61bH1KQzmOEuu3?=
 =?us-ascii?Q?3aVSpR70JrRqrU22F3pbeZE20D9Faib4DvragXNDVrYwLVpQ8Eb6oun22zMn?=
 =?us-ascii?Q?/8DwvKfO0768NnebnLNbYwioHIM4g5YwkxEN27+WwSxFWdESdXYxnAgjjayv?=
 =?us-ascii?Q?HVLaQdLG2IRZrTULC89jniney+Z+MosJAKfYFnpyY7aVHWheL90lXCcLm67t?=
 =?us-ascii?Q?sTVpGz95Y2RV3+nWkuLY2VmtRLnH5kCIkc4fmaCoNpPRXnAd+jmr06ASz6pw?=
 =?us-ascii?Q?Ks2nxxqJl8mTpdm9kaKjOGPEU3VY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1JCHOvZT2glhY7nO2FZfWt8Ba/iqYeH/07JUkk5rTmVvq2ttMFbbpATHHsl4?=
 =?us-ascii?Q?42/ZzQuRwd5diWvddHsUKisb9LHQT6suWiYZanh0josJFLm2YGxma/ola53i?=
 =?us-ascii?Q?L/afaWgM3mzRMCEhltvFS7EtjpCTMIlpaEtnWmbUOKTHXGj4MbFrGQ0Gw/kZ?=
 =?us-ascii?Q?QSAvfD1W2Zr168X+bU0lDVjwCY2a5HP/Vm7FJZMAOsS4KnuxOuqOj9YRFq6D?=
 =?us-ascii?Q?Ct7ZM1y7DWZO6HETG4327zDvJ+CSL/4ggQ1kLU1Zo6VcY6SFXTAcX+2GuAxb?=
 =?us-ascii?Q?Qetn+7FTGWftZhNi8zPlKgAR7HQlPErWJ23uWh257h+Om0P/mU7lYxclVseb?=
 =?us-ascii?Q?GZs6foIJ4kvp5+nH05V8FGIjeOGU0DIDy0ufmbHahYnafRJTVHASa5/NZfBF?=
 =?us-ascii?Q?4kc6SbVef077TvRq5eVYax+81mdyJSikssZTv6KE97XrVNyWeHGFLns3PLP7?=
 =?us-ascii?Q?tqiPDuAHjuNFYgNEHmr4xh9sM9FO3cZhwOOt8Wslr30MLiF/IzHXGUkj7cBc?=
 =?us-ascii?Q?8gv9odGQxKjzhi0s5h1+1Hxd+eF72CEEDmOK0M7GF98an7AmEpBUMIKLAH3S?=
 =?us-ascii?Q?IrA20mV3sWxKpnJEBa8CFbAHTuxmwJdg9fMEqo/t8Gi+kq4hhZZs1DT3UdZx?=
 =?us-ascii?Q?aCu4PVHkZnL9Wmy6lSoDYecxUUaS9/51Cd4B1fvAUoBmd0kwD+piKHo6yJzq?=
 =?us-ascii?Q?tNJkrJD+LmtsddE0qVWb2NQmxdeDtKGgdFJ+pLq+NnpHwDuPiXBG+uZl9obw?=
 =?us-ascii?Q?B1QTkrmenRX6p7Sn/3UnNz812ve9zYpT83iZERqLbO/7zw1MR3k9iz3Ouqd1?=
 =?us-ascii?Q?awYwErkUhrTCRjk+wdWSSbP3k3tux6oIWur+wXecx8VdKIfy1HO5fox7K+k0?=
 =?us-ascii?Q?thtD5Ck7/iEk6cnmE7Xv7RhWQU67Igz9bERlranOQBPBgSzbg+d+/JPkS/4d?=
 =?us-ascii?Q?tJdM9VQFxr0IVJLwEyjUTFIL74EGBM56FbPRRakXv7V2nyGTOnfTH6tfMEe3?=
 =?us-ascii?Q?XiYuBuD2cBuPoiUjaoXx70FAk3Sh9r2TpMCkXPp3+d2Wc+aSjoqWjdvglGr/?=
 =?us-ascii?Q?Fu/CHfEt2VY9wKFmAawu5M7bK0fMWc6e3ZEuCdxs9BgbH5TLd/8HmxGRqgH6?=
 =?us-ascii?Q?7BmHSc/QUEi9x7Nsb25ijZkwFOpL/Zdj2SjxxOVYgXn/vXyR+LUvABY7kche?=
 =?us-ascii?Q?iEoMXL6AGVrTU35jyEAk8tLs94knxr+3HPJv79KXnSXy9Wwwap8S55tpSPEm?=
 =?us-ascii?Q?TjJI66MipSIyxK4zkQI6cC5W/93bnwXhaXcM/ZBkQpCaHpmceIZ++Rx7xLLY?=
 =?us-ascii?Q?EVfQ2qNdb5eGUlKwbyrRNNRxLrettqvwmegOxsXwzV89NrdFr2bnoMqPkx5D?=
 =?us-ascii?Q?xoC8lGE4yiLIYGQBL30lIi7HXc+UJPC2AgAJzrdCNgVi1uZkbVBeOmr8lA5D?=
 =?us-ascii?Q?PNAW5CGJX5h26+R3D/q0UZ4Gw+AMGh8Sb3xL1NndRL7CYkaDIJYxmayWPvCM?=
 =?us-ascii?Q?NFvqRVFhBY3RMaCA9/EXq4JH1RACtd0e6eisU+4ViftbRy/vgklb/urvZvpw?=
 =?us-ascii?Q?kYqiq0O3icTCsitVQ69mj+XvkPDkVoQtjwu3h+Ge?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1690fec6-4f1a-4c9e-cbaa-08dd47c7d3fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 22:36:14.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJ1brgZCI8iCsqdwZVc9oTyWFp4NP4OJ2sGaVeBvZkxgpo++CqmqMIxSBT3fnYzJckTXS4ue9KukKZCTEiC7eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8254

Hi Tejun,

On Fri, Feb 07, 2025 at 10:58:23AM -1000, Tejun Heo wrote:
> Migration disabled tasks are special and pinned to their previous CPUs. They
> tripped up some unsuspecting BPF schedulers as their ->nr_cpus_allowed may
> not agree with the bits set in ->cpus_ptr. Make it easier for BPF schedulers
> by automatically dispatching them to the pinned local DSQs by default. If a
> BPF scheduler wants to handle migration disabled tasks explicitly, it can
> set SCX_OPS_ENQ_MIGRATION_DISABLED.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>  kernel/sched/ext.c |   23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -123,6 +123,19 @@ enum scx_ops_flags {
>  	SCX_OPS_SWITCH_PARTIAL	= 1LLU << 3,
>  
>  	/*
> +	 * A migration disabled task can only execute on its current CPU. By
> +	 * default, such tasks are automatically put on the CPU's local DSQ with
> +	 * the default slice on enqueue. If this ops flag is set, they also go
> +	 * through ops.enqueue().
> +	 *
> +	 * A migration disabled task never invokes ops.select_cpu() as it can
> +	 * only select the current CPU. Also, p->cpus_ptr will only contain its
> +	 * current CPU while p->nr_cpus_allowed keeps tracking p->user_cpus_ptr
> +	 * and thus may disagree with cpumask_weight(p->cpus_ptr).
> +	 */
> +	SCX_OPS_ENQ_MIGRATION_DISABLED = 1LLU << 4,
> +
> +	/*
>  	 * CPU cgroup support flags
>  	 */
>  	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* cpu.weight */
> @@ -130,6 +143,7 @@ enum scx_ops_flags {
>  	SCX_OPS_ALL_FLAGS	= SCX_OPS_KEEP_BUILTIN_IDLE |
>  				  SCX_OPS_ENQ_LAST |
>  				  SCX_OPS_ENQ_EXITING |
> +				  SCX_OPS_ENQ_MIGRATION_DISABLED |
>  				  SCX_OPS_SWITCH_PARTIAL |
>  				  SCX_OPS_HAS_CGROUP_WEIGHT,
>  };
> @@ -882,6 +896,7 @@ static bool scx_warned_zero_slice;
>  
>  static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_last);
>  static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_exiting);
> +static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_migration_disabled);
>  static DEFINE_STATIC_KEY_FALSE(scx_ops_cpu_preempt);
>  static DEFINE_STATIC_KEY_FALSE(scx_builtin_idle_enabled);
>  
> @@ -2014,6 +2029,11 @@ static void do_enqueue_task(struct rq *r
>  	    unlikely(p->flags & PF_EXITING))
>  		goto local;
>  
> +	/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
> +	if (!static_branch_unlikely(&scx_ops_enq_migration_disabled) &&
> +	    is_migration_disabled(p))
> +		goto local;

Maybe not in this patch set, but it'd be nice to have an event counter for
this, as skipping ops.enqueue() might introduce latency issues. Having a
feedback could help to determine if we need to enable
SCX_OPS_ENQ_MIGRATION_DISABLED in some schedulers.

I'm also a bit conflicted if the default should be on or off, we're
changing the previous behavior, but OTOH this is going to prevent some
potential breakage (due to the nr_cpus_allowed mismatch) and server
workload is going to benefit from this, so it seems that there are more
pros than cons at dispatching migration_disabled tasks directly by default.

And I also did a quick test with this and it seems good, so:

Acked-by: Andrea Righi <arighi@nvidia.com>

-Andrea
