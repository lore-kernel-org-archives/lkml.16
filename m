Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429AD2B9AA
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747522241; cv=fail; b=uBK2tJbJSyi8TzB7tUGwd6Dopz6HxuKOlmBzksgDatk+X6ZFV8thMOHP5zLx8bmZ6X7xKTSyQEDqSqXWCX7RZbihpiHswzBjBn+Iwu1NWCBjCDBbN6MkodcnG2Ri+ulX7KoN8c6s18XdFNzOakvmWZ/S2OZwscaqS3cx8bp64kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747522241; c=relaxed/simple;
	bh=tc+HMICGZyV9KFCeual7BSkn+00UXpm3j7Fw+4vdbpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B//HBY05cJRjKQLFidcN55S16IFqGfQJUJslHzttrl0iw0ELwHXcuWGaILJE4lOxrzM8If/bcGTQzZOWAYOa2UVk9/ZpJiuvKnK22pE2tMQFxobG0/z+5mXFjjNMNT68XPafslweDzA5t14v//YRiS7ruVgZQQ6hpR7mnIYQnwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LObEpJP5; arc=fail smtp.client-ip=40.107.94.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LObEpJP5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrrF0oJJ1wZZYYPfFm60O8nIG+tma+UovOhYM1Lg4peKyGu+WHJ4qSZ/VX6i6r+tr5Wy12Xs7F383nldpzcwOF4LrFneHzoqPBED5GpNjUGq31KPRkkNPqZZ6ApszQpIiIpXy9kTB2S4uoDe/2+rNPUjn8YR4vNBCmaajKJLXFAf/KVkqUDqm3+mJHk2Emd0XMD5+ZpIbtVlPqXEyE81JEY+fIfCIAwZxXElx5YMne7Zn3R8eGWNMSnLAjVULeFjCypQ/FCY9XW6BbxiZ7JiqBwio2te9Ix6HpH8CuSyMcDMEucqZeplIyHxqiDt57og8T1A8raqUyKIKtxXy0AXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPNcj+Jz60AqwcgLuqg/iA88W7yMyLHmc9okBccZecU=;
 b=oND/mjeoJJPbYwiqyP23E3nu3oGAR0R3rM4nBUKlXMimGky+JHLBAa8GAURmn/OgwO2H5veUsJmn1D8bxh9njdEt6B7DpHFNpS8XZ6fRu2PZXzNvFQt9wHHZFu2/zTYXznGvf6OA8X7ck8DLQA2vpqhbRuALWfzr0ol24TdmQhUZ2KDY5vtMFklkMXdANes7TvffGKuSHFo3ththTl5c6rMoQzyKmX/o6UkUqh06pLbEp+dg+zIEGev7lLftpDOJO8DWhUEI3BSYb0VSWrzO+c2mxWDUumjKbtbcYdbjbHcSRNU99Ab2y/BO/biJDYSVO9e8PpfntIK6sTlGHBYP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPNcj+Jz60AqwcgLuqg/iA88W7yMyLHmc9okBccZecU=;
 b=LObEpJP5cu+x4AHH/SG9F1fbLsuAxBrAWVHlSiLmy5MLikqmYTMNZ6mlYHFmwlACPHZ9RQABVxkDciJmgC6vVSHJuhzdd8TdML9oIJJOzw4MDb5Op0sA8hUEYnTRypakGGkIC0oPgRLmNQe4RgphKCqlw+R9H1+0nqeTeH2n0hvJyblqi6xwcAKan3a8jVbleHigvoGMwfkvgH8V9Zm/N6emXGvqQWk+cyZPv4cw4haiKI4A94gf/AwmgMY/5nKWgIkeYFAIgCdU2N8LrRu4ljvv7li8apuxRGfKYBKqDmdLmj6gd1+o+Cfa++WwnLd4pl9ptjAn1khIyBofzT9SwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV3PR12MB9355.namprd12.prod.outlook.com (2603:10b6:408:216::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 22:50:35 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 22:50:35 +0000
Date: Sun, 18 May 2025 00:50:29 +0200
From: Andrea Righi <arighi@nvidia.com>
To: David Vernet <void@manifault.com>
Cc: Tejun Heo <tj@kernel.org>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] sched_ext: idle: Allow scx_bpf_select_cpu_and() from
 unlocked context
Message-ID: <aCkStT1QTGWZ3B50@gpd3>
References: <20250515191716.327518-1-arighi@nvidia.com>
 <20250515191716.327518-4-arighi@nvidia.com>
 <wdjlm556njybe4bgxk277xj4skryh2qnvd57yoenyf33vd4oyh@gz3ouesvc5vf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wdjlm556njybe4bgxk277xj4skryh2qnvd57yoenyf33vd4oyh@gz3ouesvc5vf>
X-ClientProxiedBy: MI1P293CA0020.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV3PR12MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: a4809474-0187-41b5-c047-08dd95953c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L78sgrjPVH8pM1/rJ6l1rlSQ6kBRATMfo5KpOursnRnZe0FICVtlhlCVDy7P?=
 =?us-ascii?Q?aPKdUqq7uRXiI8WVf8watjXRiCUGavULRKMhTCASntTrBw5niefEFFwQma90?=
 =?us-ascii?Q?mL8kYbHj4ohVfEjRTWM61rImIZQbjH2/Zj1x35PfG3BpqtuiC6vXkGfY4Zot?=
 =?us-ascii?Q?a/CGuWJ5Q3EOeSuuuiNytcsUK1f0sP/Je8yX+X91ZuzhdOVOfBfMzpglpesV?=
 =?us-ascii?Q?duWuntl8efS4zx2vD0K+/51QsFnJAL+NqGqSo9kgBgcY47eDM1p17VxkZdL4?=
 =?us-ascii?Q?9yNzlVwV1Ln4fayr33QYysYQpgVl5zIKoDfBwRrx2qAX4BtArCt7ptiPKHmC?=
 =?us-ascii?Q?LLS9GoRLshfKZ4/TveZrBrou0+TrtHggXgQdY2RMcGtziIv04L0mDpnsnXsC?=
 =?us-ascii?Q?VoOr9WvBizUEVITwrvvFP3veA9m19wRQGI09zLeW2hdIvfJLZN6mzSIfNChZ?=
 =?us-ascii?Q?CtkVXEYwpP9g7Qvtgdo/lihSSlGkORxyNy9pbcnHl3olMCBchf03MG5wKk7U?=
 =?us-ascii?Q?FTgoy8JtDQtuY+6uU2l/OzNiwA6KavUp8yagTTI+pZwsKsUdlJw16haHrgB6?=
 =?us-ascii?Q?LDyE6MSKBnPyksxJuwzbsO1nriklZgKm13scrjQKorRfetSL9eBZKFpEKwU3?=
 =?us-ascii?Q?RggvsQy21ZVrCupoLgdHtqovab5D/+H3hlIl2zonGBF4GdfrO8soMHstxah/?=
 =?us-ascii?Q?t2b+hPWa/Ay7/PDCVUre9IaWwGevD8jTgErEsLARUOtye9sIigFn+VYH5omH?=
 =?us-ascii?Q?DH5kjnoKudFm3YcKCaYnBL2ooQmtn7l7SC/7+y7N7Uey6Fq8h/bzLpBEcW5i?=
 =?us-ascii?Q?T4To8PRd7COXhYQXtuCeZLoTE4K5aL0oswXnUFQeW1D5I3Qb6zwGh26TCbWS?=
 =?us-ascii?Q?IzXPxJoX2PN0zWvLSlC9u1AOUrluDSO/vDyJBbnDKigbRnTd0aQiEsqHjfq5?=
 =?us-ascii?Q?QFsO0OXY1VlSTUDqVdjF9ML6oKmahEB1sk6XtM5W4x5xdY1YvuQ5GMJW7DZ8?=
 =?us-ascii?Q?IphEzCCjYYOtNQNJu4W1ilKPYuuoAZUmnsAbYPioDbtuKlOeSZ6cgqItW5M2?=
 =?us-ascii?Q?h6Sb2Jci8XQjfftbbhcKkC28iEdDxZIMc4u4zmXMiciqbZWxX90Y2vK0ycCy?=
 =?us-ascii?Q?bZq0F/fxvB7LWG6nvmlJl6YHqEZ9P2pJgGai9NH2pG/tufPvqHWPXOlEkxti?=
 =?us-ascii?Q?bLTD9IQ+AlEFgpfflXSPrlyNRps4gkiG9Fa8pk6OHKGsUKoLJqX3+BFCi4KT?=
 =?us-ascii?Q?/LlZL1L/7466o45BAtpwNz2NKpwRoWSs/qYmaD0tifK+6msUo2i2skL5ghPt?=
 =?us-ascii?Q?suilGjGBAzUankfwrQe1m2z9D8iiEUTjKYndY6DO1gObI1DgPLaUqBXkH13A?=
 =?us-ascii?Q?5d0TwylW5QMYCgxZ92cgBkLtjL8XWMst3c9YiMhW/8GRZj392odKoAG9KxbR?=
 =?us-ascii?Q?6NZtbbsntGY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+3KhB18rSA1ddCX3Ar0gAnuFsakp9un4FGIxoisOooHk4l/O8OyItiBAMUN0?=
 =?us-ascii?Q?8ANZZb0BJMjYzXlKr23bhVwqc7LMsMHST7p9iwZujZmHcLH7DNcL/gDdtAT6?=
 =?us-ascii?Q?MZh7fqQaRsFJ3ZFq8ZKFz95+xDju8vcp877dZE4oKy8xJZjJo9s41H3oVAa4?=
 =?us-ascii?Q?MTBDjTlh/QxqTM1qjLBv8fyKpb7KPC0WVRoNBDQruAsgoV+E4dq2+y0M23N3?=
 =?us-ascii?Q?v/F0crSlakG+09iSRKpG8Tx2nEpEs0lZxe6Ttigp6w9/+vzzUuP7jRgpWaeJ?=
 =?us-ascii?Q?HMqZ3vs8fwr3W3EBqxI3bjXWnm677evfdc9yYSFQO6rgsMJeoqUsRNUvcMES?=
 =?us-ascii?Q?n6HwWMPl6PBUDSpuAccsfBHFlDWEUj2xT7siSzsw3R976CJKPchbSBwDgWMK?=
 =?us-ascii?Q?rqvpa9Rx6rsPUXUAqgkizBYZH8uNMkO5kwLwhAYYBqQHw8+hy19rayV0xt4g?=
 =?us-ascii?Q?6a81orggL2FMaTWH5TPAt9BIQCInJj/FRv206Ru+xJXW8z1Lpe+V57aDn9kU?=
 =?us-ascii?Q?09yIlkf+22mrnWPUzAqx473VAH3UvBKjXBZo3u1g0OOhHtb7EZSEOfBl9vBe?=
 =?us-ascii?Q?UrfywBhO8loCLOohfTa9IGEb+dPCU9jtPQWsj+eYGVGoiUNbVL8yxotHkfWZ?=
 =?us-ascii?Q?6tPx9/pg4VUQfYK9lFkkw7mR0B5QQGpPw7cys/4Zwmvy2Ay94CSk86z802t4?=
 =?us-ascii?Q?TZwoWlbnsmYECc5TWvfPf6yFhYlXGzQzZ19RCPa1CtbA3SRB3WO6RcIo1/H0?=
 =?us-ascii?Q?w6aLQ7RMYybUJH+cmkBjftKGXWyW74cAh7StvibQAZWnav/b+Kevx2BIpj/R?=
 =?us-ascii?Q?KE0ozAoGFaADJO5D57Drz/q0PPW5yYRExgz7P8YEeb0xDa791TmEv81PRDPN?=
 =?us-ascii?Q?peyxBKZ5VuBv62cehpDnlEuDKzssc7x4l618kXPBwHBx0WDFnUrorG+r8l5x?=
 =?us-ascii?Q?OQrCqKgf8mk53EZsW/WKCBj2NSFxpsi3hBU38aY16X48u0y4nExzKpZwD1mD?=
 =?us-ascii?Q?3uehEMSxIiXOkiZaKPz82WrJtZYDfPrCX6MYtS0r8pEMCCnGEsZimcPNWslq?=
 =?us-ascii?Q?BPvYAojtglUHa2nDGe0Yv87oMzx4YYoUguNV6BmaLQ4LUv0Zid8+Hlm0DtNB?=
 =?us-ascii?Q?PB2w9Wp5wLjqmVxWMKNe1XERarolbxS5myyNPk9Vc7oSDnRB/zfRsyuxS1LH?=
 =?us-ascii?Q?QRLNMFxY2681Sagfr28r5Dqis68hgTI9tgIzIbZY+F+ErAhOvVrYDu4V6wQC?=
 =?us-ascii?Q?MrcmGmhC9sdqlvWD/JJH7ikFrMqdt9v1ubM7Ur8O4tk1CchaY7fO43LpDHGU?=
 =?us-ascii?Q?0u7DfQW1lic/zTppGaGOtsdJ5kxhImsKgT3juMeh3mq3blvQ2oB2S5vSUwhD?=
 =?us-ascii?Q?NJAcFsQ1zLTnKHkgaS7TMXKXbML72SBGr1UXOnN7uJDx4H49kCDFR33sNjk4?=
 =?us-ascii?Q?y7szxH1seEIc/tGkH7OyKhlzV2vQN66bzX7yiN5c1ubrw97dLxLIdjQP1dAD?=
 =?us-ascii?Q?unK/LVA30U3q9ZKQqm7SiQg+eKcl10F3N83KwV+U192xEBdJZNnR30Wkj+wH?=
 =?us-ascii?Q?g/ADunQC+bppbBe8b75oFFPFFlXFxHE/3JyFQxmi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4809474-0187-41b5-c047-08dd95953c0c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 22:50:34.9946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kW7UaCdOolhq7wnF+iS1xKedSYttaJJsiVT9fCqA+PhIgwBSDjrsNvsVdztHNArHNB3dOb++bOCgmGcG84MdJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9355

Hi David,

On Sat, May 17, 2025 at 12:54:29PM -0500, David Vernet wrote:
> On Thu, May 15, 2025 at 09:11:44PM +0200, Andrea Righi wrote:
> > Allow scx_bpf_select_cpu_and() to be used from an unlocked context, in
> > addition to ops.enqueue() or ops.select_cpu().
> > 
> > This enables schedulers, including user-space ones, to implement a
> > consistent idle CPU selection policy and helps reduce code duplication.
> > 
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> 
> Hey Andrea,
> 
> Nice, this looks correct and reasonable to me. Just left one suggestion below
> that I'd be curious to hear your thoughts on.

Thanks for looking at this!

> 
> > ---
> >  kernel/sched/ext_idle.c | 37 +++++++++++++++++++++++++++----------
> >  1 file changed, 27 insertions(+), 10 deletions(-)
> > 
> > diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
> > index 716863f1f8cee..37279a09900ca 100644
> > --- a/kernel/sched/ext_idle.c
> > +++ b/kernel/sched/ext_idle.c
> > @@ -922,9 +922,10 @@ __bpf_kfunc s32 scx_bpf_select_cpu_dfl(struct task_struct *p, s32 prev_cpu,
> >   * @cpus_allowed: cpumask of allowed CPUs
> >   * @flags: %SCX_PICK_IDLE* flags
> >   *
> > - * Can only be called from ops.select_cpu() or ops.enqueue() if the
> > - * built-in CPU selection is enabled: ops.update_idle() is missing or
> > - * %SCX_OPS_KEEP_BUILTIN_IDLE is set.
> > + * Can be called from ops.select_cpu(), ops.enqueue(), or from an unlocked
> > + * context such as a BPF test_run() call, as long as built-in CPU selection
> > + * is enabled: ops.update_idle() is missing or %SCX_OPS_KEEP_BUILTIN_IDLE
> > + * is set.
> >   *
> >   * @p, @prev_cpu and @wake_flags match ops.select_cpu().
> >   *
> > @@ -936,6 +937,7 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
> >  				       const struct cpumask *cpus_allowed, u64 flags)
> >  {
> >  	struct rq *rq;
> > +	struct rq_flags rf;
> >  	s32 cpu;
> >  
> >  	if (!kf_cpu_valid(prev_cpu, NULL))
> > @@ -944,15 +946,26 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
> >  	if (!check_builtin_idle_enabled())
> >  		return -EBUSY;
> >  
> > -	if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
> > -		return -EPERM;
> > +	/*
> > +	 * If called from an unlocked context, acquire the task's rq lock,
> > +	 * so that we can safely access p->cpus_ptr and p->nr_cpus_allowed.
> > +	 *
> > +	 * Otherwise, allow to use this kfunc only from ops.select_cpu()
> > +	 * and ops.select_enqueue().
> > +	 */
> > +	if (scx_kf_allowed_if_unlocked()) {
> > +		rq = task_rq_lock(p, &rf);
> > +	} else {
> > +		if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
> > +			return -EPERM;
> > +		rq = scx_locked_rq();
> > +	}
> >  
> >  	/*
> >  	 * Validate locking correctness to access p->cpus_ptr and
> >  	 * p->nr_cpus_allowed: if we're holding an rq lock, we're safe;
> >  	 * otherwise, assert that p->pi_lock is held.
> >  	 */
> > -	rq = scx_locked_rq();
> >  	if (!rq)
> >  		lockdep_assert_held(&p->pi_lock);
> >  
> > @@ -966,13 +979,17 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
> >  	if (p->nr_cpus_allowed == 1) {
> >  		if (cpumask_test_cpu(prev_cpu, cpus_allowed) &&
> >  		    scx_idle_test_and_clear_cpu(prev_cpu))
> > -			return prev_cpu;
> > -		return -EBUSY;
> > +			cpu = prev_cpu;
> > +		else
> > +			cpu = -EBUSY;
> > +	} else {
> > +		cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flags);
> 
> I wonder if we should just bring this into scx_select_cpu_dfl()? It seems like
> it would makes sense to do this optimization whether we're looking at
> cpus_allowed here, or p->cpus_ptr in scx_select_cpu_dfl(). I seem to recall us
> having this in there before so there may be a reason we removed it, but I've
> been out of the game for a while so I'm not sure.

Trying to remember... probably it was removed because ops.select_cpu() is
never called for tasks that can only run on 1 CPU.

> 
> Anyways, if we could do this, then we could bring both scx_bpf_select_cpu_and()
> and scx_select_cpu_dfl() into the scx_kfunc_ids_idle kfunc group and remove
> scx_kfunc_ids_select_cpu.
> 
> What do you think?

Are you suggesting that scx_bpf_select_cpu_dfl() should also be allowed in
the same contexts as scx_bpf_select_cpu_and()?

I did consider that, but was initially concerned about the potential
overhead of handling different contexts, even though these extra checks to
manage the contexts would likely be negligible in terms of overhead. And it
would give the possibility to use scx_bpf_select_cpu_dfl() in ops.enqueue()
as well, so overall I see more pros than cons.

Thanks,
-Andrea
