Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E117D1E505
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074570; cv=fail; b=dO4X0Syt61g6ewowHps9Pe7nrxEXOFdnCeW9ubqqDo68AQSf5UfxmxqibxyD6LwEelLTSv8EmKy4Moi3zvICye5B+CsleqUx5rWeHg08mKgkTgB4iXE+ChjNDMrxTWTyT+f6NoaUQOa7v+hCLsxByO4GEfOPkzDWmpdIPkqwMAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074570; c=relaxed/simple;
	bh=wWD9OYLBtVY6AGdimwQmUd3p9HpT10rIcAJKTU8Bn54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YzIigCNueBGmNxQCuL7CsccjEHaaieUGMM8FzA6cPpavutyOMcpZGpRgjMLTCuMHcD3ar0BPi50yzo/4vZce78zZEFtGCkl2r33hIgTFarxhikKD7TDi+nQ+YT6ZLjF0b5vbvLqTzTkyszswCwJeBIrdzMrkdTjbsDCAoyy2O8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dtbRlCXV; arc=fail smtp.client-ip=40.107.94.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dtbRlCXV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gevhOcbFt+pgQZJE4k60vi/xh24Dq9aEG5am36MyikfCBt0r1sBifWuNU8Z+e1i349Dn0fAhfEHUKEXzNWK8XHzndfJbbrwEd0RX7wwHPAdfhWbX1wBZI3eNbEiWyGiQQNCBAqdUcyZurpdW39UbJGdLzQdBRN6fNEwmO/rOcM02h0ID4pdTuf4Kf9aL53HSn0+DOQUzkR44X6TghDRc4bIKI5aBS9OctBTq3tJdf4GY/PFBuJekFztZQhlwjO8ceuX5awacwbUHz8X7jJfAdna2lFioI2QOGpJObsyEsccuKiDEnGstJ8nS9jK1rMirrhAkdY7DTtmQIhmM6HT/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5soiO7QZcaXWZRo3ifjtpSukRlVYwIuz/63v46a40Is=;
 b=Fuuoxx0agKCjcArKnmBHU8/Rc3pnDD0nlDgRN/2BjrcSBl4ySBrylZValrgIpNU8OupwNbFQJ/d/l36mgLSZGflaXEG85XFdAIoCXThECbQwg3qlD/5o0pbMHCrXN9idTvffBmiE+s+eHn9Q+OJb1fWUVN1l6j+V7yJkLNU/cA06X61vD33S1fvh5hYPwmuScSGBMhmcASmaypo3JyE5BOdt7pqbgBbdMoWPPr16yAxELNAYuguAtJvEG/uwhIL1ag+aNb04m10HPh3KOmsTi2YP7Au2/2rR7Al7u57Nih/9/xelQNsAbyT+iYaRYXUJyFqDGi3fpKCITF9XX4Bgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5soiO7QZcaXWZRo3ifjtpSukRlVYwIuz/63v46a40Is=;
 b=dtbRlCXVH3BONifWyLsS13KhamkJKnNQkwl1ILFR4JL0QSDvMsOe/1ELzzFl56UFOeeJ877vhPtuCcdDN2iaUt9gxTiKl2TML+zLCyjyGfo0LbO8vZ8sFL5MxEBTGD/DkwHzrdUpx9lnacmhJjwKuYoubs7ysNjdym/FUnX0Se+gvTeLq8Yee4hVfEwkCJwasvhm2d/RRLlV1W5Q8jUNbhH0KQAxTnXlRXoymuxlMbM/CHqQjBrz/j5ETUJkJSiVlG1DvIH15Wlzg1pXmAxRrgo/6MS+Gi/4StB3cSz81j9yFEy9ANdkTvcaKdMlkYM/bSeRNIiYtGDrXdwCAzrxoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW6PR12MB8868.namprd12.prod.outlook.com (2603:10b6:303:242::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 18:29:26 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 18:29:26 +0000
Date: Mon, 12 May 2025 20:29:16 +0200
From: Andrea Righi <arighi@nvidia.com>
To: David Vernet <void@manifault.com>
Cc: Tejun Heo <tj@kernel.org>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched_ext/idle: Make scx_bpf_select_cpu_and() usable
 from any context
Message-ID: <aCI9_GBpky0cowH9@gpd3>
References: <20250512151743.42988-1-arighi@nvidia.com>
 <20250512151743.42988-3-arighi@nvidia.com>
 <bylpnof6h3mmeaovba573fer4ikrr5zhr53htbso6zzuw5czzj@tihl7ajm4eaj>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bylpnof6h3mmeaovba573fer4ikrr5zhr53htbso6zzuw5czzj@tihl7ajm4eaj>
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW6PR12MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a560245-29b0-4259-e20c-08dd9182ecbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OtKZpxpquhAM9dX94n53nAwHs4PniThcjiI3rPMHCMx8ThnrJ5qBQTeJMR1d?=
 =?us-ascii?Q?S3NAdGuZX3rxqQr2XVI82nYkU9WilqK2kvvhE/0Tp2svt045O7L7MJ4Shz7G?=
 =?us-ascii?Q?YwvMitDqdjU4NtSh0lthIp/NU9rp2Eg+Zjj/zkww+6Zzo29yZg2Q1j0HJOdw?=
 =?us-ascii?Q?yx18T1d17PMHkM2o/gP0dT6lS/6HwgpWfZ6F1a74w52JEjpDcilZgI6oshJE?=
 =?us-ascii?Q?BvNW0ce4qpAbIrZ6ha/V05vSSuF1q9wFbMmz/gBraXSJHbL9otjpFIDwxDZe?=
 =?us-ascii?Q?IWwO1cVzpbfv5AqOUohqqLUGvR97c6QbJFuEogQVHUzP6a2GyBq+8Ji9n8Fm?=
 =?us-ascii?Q?nm3b2WvKRbKTvBPiKBuasnz/jSGMXRySa9/ubdV99cXsfDnbtItmMp5K+uE9?=
 =?us-ascii?Q?rTeNvUUz73qcyKpyqsoch/vTOtIUGrHnIeiMkoR7q39vIk3OobQowJLea/ZA?=
 =?us-ascii?Q?x+OdlU8itbn+O3nhnFUp0dSetyAAcY0lS2B7z3rdb+Z49f5+uQk026vTBhZO?=
 =?us-ascii?Q?Z4LITchNObPIpNcpsbOtCNSjp2AOanrpn8RUbQzWbHxcqAGGOQjfqX3ZTL0b?=
 =?us-ascii?Q?bbUe4XAN2wLRaijmxAYyGRYlPQPlHrA175/+2hLamBiqBCC6tzhT/RQ+4TPN?=
 =?us-ascii?Q?opVzzTs6b0wI/4GpOSPDt5YXXFDeXQwMki6M3Iiou4uZOqyqS5qamiB3UHFX?=
 =?us-ascii?Q?7dad2LkSY6MHmYQTZxmQJHuvmho5RSY7808EfXKrMgpEYnxeQaCoIWGRXfru?=
 =?us-ascii?Q?30vebMLq6xHB11vP+xsTBXz4vYkUkl4byXGHQK6hsINmiqMWsN+jADngmvmR?=
 =?us-ascii?Q?vwd/B/14bhCTh4cTXGt2bsGK8PDW3XtXqU1RaczfrcabDFc2iOCbXQQj+oIE?=
 =?us-ascii?Q?q+rRl+eGd4+z+Mwe36piTeMXrO6KZ5nzXlP21+YruNv1HMuGhZmQIBMgN8WM?=
 =?us-ascii?Q?+IM2A52n2BHKwe328ibhvBVn9jsCFxy3d7zXe8eAfdNYQzoGR0GYSB4AF8RB?=
 =?us-ascii?Q?/B0zKiMtcnKesGmXfdBdjbFnPG9VtcMO62tQ8+Sfj4QhlvZrAGGdtHeyah9O?=
 =?us-ascii?Q?XiBVPY971LVV0kDBmDW/3tjQkB7rU3DHkhAJUj39uLQ8dJyswYWldgdbPt+1?=
 =?us-ascii?Q?LstOG31WfRXZKmagY4/UoJwYrx/URPhRVhOlKFfd2iCTZOkRex7KnMReyMrY?=
 =?us-ascii?Q?VUX7ZJbHXbIuSLLpTEY8BZl5X5K+mNsaUAsIzKniAc2FKRQ1ZbD2zYQYz0oc?=
 =?us-ascii?Q?5eqspvWPGg3pP1LX4pabTOwHSkOfExJF+bU4JXe9q2V96+yiOLBAmZ/AK8FD?=
 =?us-ascii?Q?EBoh9MQ0E/aRxYAIVE785xNOVkLk64Q5zHEFkDYGG7PD4iCY3sdH5e/7oqza?=
 =?us-ascii?Q?+X3R4GoHrwIqsKpaqCx97JnevSPTi4nRlajl3IP7fxyAjcu04033ijbj1jq9?=
 =?us-ascii?Q?acfBJOf3LdA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RNs9uap6vd/i60fZIcyqhFyYMgwR0ehjuASfR/gWDzwVpIZQsNzrXQQO836d?=
 =?us-ascii?Q?O12ZUkKruXbSH+8fl2VKnGBKMzRauQUTNu23oExf2qcyh01iqUlCa9S2oijk?=
 =?us-ascii?Q?brPD0XqxeANVE/kmCj8/B5WqzcqGJLTEkBXDDuq9ClszP2eV+pQloIkqR+UJ?=
 =?us-ascii?Q?LkCFEaQNltGLen4fYr8ArFho33gA+x4j9iiA3UyFnYByZAROHZiEt/8R3G/K?=
 =?us-ascii?Q?WXO9CkCGL7vxBeBLrrK0ecO/3qob7Uu3vcvvBhMtYk1/dK7Jga1ntBDY3U2l?=
 =?us-ascii?Q?I/VOl3P2QvUdjgkZQXkrbpY2f49OY2dHMod6zedpXkClLvX8hAq3BA7QsZIm?=
 =?us-ascii?Q?plwM5SwNTeWOmPLfEg2KrK6M3T3Yhx/kDLlnpEbGpyiutv+ELjS4EQ8SHNvq?=
 =?us-ascii?Q?OFuW/fqj04QhacnGNkX5F8rPRz4V4GG63rl84YYWkYYpEan8uhDR/4Icng+Q?=
 =?us-ascii?Q?X3VCGK8rCJf+qkpp7DRXy5Ltw61vFeBbYtJkf1WCb+dLKpja8oINWMknm8N3?=
 =?us-ascii?Q?R3k9wqGtbY595zGvwpwZGETScx5VcUtnlHMoiKaBgNbOVRT0U+UDuMi/1Icl?=
 =?us-ascii?Q?ofR7yemqp4vYgU5phZ0knFYf7Uo0laQrd+pihzIMuvl7ssCya02fBTGE/x30?=
 =?us-ascii?Q?6Oug4tndgGx3FX02jmEoJw+2V7RkcKAvnxLHfcZydzJqYE6c4AYs4Nnnlesh?=
 =?us-ascii?Q?mu+scgd2b0nHg68wkq7ID6UTCnYTzjku1gH0ccTuGjtcc/48jLipBHJ8Wc6p?=
 =?us-ascii?Q?pQ03hYT0yugXjf3ZkNwPhjhEhwak/VfzijSCbnWrXryQ66PnNvAAykuIZdkf?=
 =?us-ascii?Q?wj5vD/xijSXigw5SeXtNXKk1ps+0elxPT1MbrEENWgOwoiEw9oue6ZW8ph7U?=
 =?us-ascii?Q?lro0Qe53oZzGnN9AuCvJNzbsHenwz5amrRGF45EnMflreypuPUwZZwEPeSZx?=
 =?us-ascii?Q?9g+DBdY5m25LYP5k9QdCXKdrF5EQ2cNglJzQfGl//qoUr2WBlowBZE5xDrh0?=
 =?us-ascii?Q?9AVnzVaGjhTrU0o7EU9/Y0WX2B/koG9Lh4Ux3jZE5XsBdHzjkgFoOqjhvbLj?=
 =?us-ascii?Q?xumVC8iwbfKPR5E03eGXD7gaO/sAvt2fEM0lmtFukaYnDRTgABLJjF7RvbVL?=
 =?us-ascii?Q?czFmbfDQdCMx1XaDDtyCUO40IBYpS26+Ycm/xAZeEKX5rN+mLOpqG+swBIhE?=
 =?us-ascii?Q?DcH90MKtrs1Lb1iFkWN7nD1FYdPGEipyr2/4jflAklfKKE7F/m/jmXlR+YoX?=
 =?us-ascii?Q?FuUWDTWXI2b2MpZecj1fABJzoiA3/4qsh9PW8tA7uKyAcypFfxbp9Vc15YSV?=
 =?us-ascii?Q?3XlnpNdl9pJO3FqT8D64MdZVWob2lUybjB8MrLytt481dmUQwvlvvz+LO0z8?=
 =?us-ascii?Q?gou9BK4UHShIXaIOEIgd3/r8+S4ING65oHSg6zn7LNxM6hoBCGtZAHhQdZw1?=
 =?us-ascii?Q?kgmn/bgKWG4IvhUoXV+x198Tgj79Dz2AZs8Sl8exZwAsjgjSomOBgezopa9G?=
 =?us-ascii?Q?wfrTZhtbyJLqX/WqEKU3t0RQwmtXr55geik8KK/un739gMPpSJwIfsL/pD/9?=
 =?us-ascii?Q?Y+2d0nd2tECr5MR9HIvENy7qF+mZtf9pkg777cZ/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a560245-29b0-4259-e20c-08dd9182ecbe
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 18:29:26.1541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMLjhETXVsqlgrjOyNe4hOaO/FSUuEm2ScVqyiK/hSpybY50PUJiGy8/7hz7X6sncFaI9LL1xVGA63PrN3UYoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8868

Hi David,

On Mon, May 12, 2025 at 11:58:29AM -0500, David Vernet wrote:
> On Mon, May 12, 2025 at 05:14:56PM +0200, Andrea Righi wrote:
> > Allow scx_bpf_select_cpu_and() to be used from any context, not just
> > from ops.enqueue() or ops.select_cpu().
> > 
> > This enables schedulers, including user-space ones, to implement a
> > consistent idle CPU selection policy and helps reduce code duplication.
> > 
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> 
> Hi Andrea,
> 
> > ---
> >  kernel/sched/ext_idle.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> > 
> > diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
> > index 6915685cd3d6b..5373132db02b6 100644
> > --- a/kernel/sched/ext_idle.c
> > +++ b/kernel/sched/ext_idle.c
> > @@ -943,10 +943,15 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
> 
> FYI it looks like there are a few comments sprinkled around here that specify
> that only the .select_cpu() and .enqueue() ops are allowed.

Ah, good catch! I'll fix the comments.

> 
> >  	if (!check_builtin_idle_enabled())
> >  		return -EBUSY;
> >  
> > -	if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
> > -		return -EPERM;
> > -
> >  #ifdef CONFIG_SMP
> > +	/*
> > +	 * If called from an unlocked context, try to acquire
> > +	 * cpus_read_lock() to avoid races with CPU hotplug.
> > +	 */
> > +	if (scx_kf_allowed_if_unlocked())
> > +		if (!cpus_read_trylock())
> > +			return -EBUSY;
> 
> Hmm, so this now assumes that this function can be called without the rq lock
> held. I'm not sure if that's safe, as scx_select_cpu_dfl() queries p->cpus_ptr,
> which is protected by the rq lock. Additionally, scx_bpf_select_cpu_and()
> checks p->nr_cpus_allowed which is protected sometimes by pi_lock, sometimes by
> the rq lock, etc depending on its state.

Yeah, it makes locking quite tricky. Maybe we can acquire the rq lock if
called from an unlocked context, instead of cpu_read_lock(), but then we
still have to deal with pi_lock.

> 
> This might be fine in practice as I _think_ the only unsafe thing would be if
> p->cpus_ptr could have a torn read or write. scx_select_cpu_dfl() does do
> preempt_disable() so no issues in querying the per-cpu variables there.

I've been running `stress-ng --race-sched N` for a while to stress test
affinity changes  and I haven't triggered any error, but that doesn't mean
the code is safe...

> 
> As long as this is safe (or can be made safe) I don't have a strong opinion one
> way or the other. I think it's probably a good idea to allow users to remove
> code duplication, and in general it's up to the user to use this API correctly
> (e.g. if you're preempted during a call to scx_bpf_select_cpu_and() and
> prev_cpu changes out from under you due to the task being migrated, that's
> likely just a bug in the scheduler).

Right, I guess the biggest issue here is dealing with locking in a safe
way. About the scheduler not being 100% accurate with prev_cpu, etc. that's
a non-problem I think, at the end we don't need to be formally perfect, we
can tolerate little errors if this API is used from a non-atomic context.

I'll think more about it and do some experiemnts with locking.

Thanks!
-Andrea

> 
> Thanks,
> David
> 
> >  	/*
> >  	 * This may also be called from ops.enqueue(), so we need to handle
> >  	 * per-CPU tasks as well. For these tasks, we can skip all idle CPU
> > @@ -956,10 +961,16 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
> >  	if (p->nr_cpus_allowed == 1) {
> >  		if (cpumask_test_cpu(prev_cpu, cpus_allowed) &&
> >  		    scx_idle_test_and_clear_cpu(prev_cpu))
> > -			return prev_cpu;
> > -		return -EBUSY;
> > +			cpu = prev_cpu;
> > +		else
> > +			cpu = -EBUSY;
> > +		goto out_unlock;
> >  	}
> >  	cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flags);
> > +
> > +out_unlock:
> > +	if (scx_kf_allowed_if_unlocked())
> > +		cpus_read_unlock();
> >  #else
> >  	cpu = -EBUSY;
> >  #endif
> > @@ -1266,6 +1277,7 @@ BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu_node, KF_RCU)
> >  BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu, KF_RCU)
> >  BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu_node, KF_RCU)
> >  BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu, KF_RCU)
> > +BTF_ID_FLAGS(func, scx_bpf_select_cpu_and, KF_RCU)
> >  BTF_KFUNCS_END(scx_kfunc_ids_idle)
> >  
> >  static const struct btf_kfunc_id_set scx_kfunc_set_idle = {
> > @@ -1275,7 +1287,6 @@ static const struct btf_kfunc_id_set scx_kfunc_set_idle = {
> >  
> >  BTF_KFUNCS_START(scx_kfunc_ids_select_cpu)
> >  BTF_ID_FLAGS(func, scx_bpf_select_cpu_dfl, KF_RCU)
> > -BTF_ID_FLAGS(func, scx_bpf_select_cpu_and, KF_RCU)
> >  BTF_KFUNCS_END(scx_kfunc_ids_select_cpu)
> >  
> >  static const struct btf_kfunc_id_set scx_kfunc_set_select_cpu = {
> > -- 
> > 2.49.0
> > 


