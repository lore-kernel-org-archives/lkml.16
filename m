Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCFA2CA6
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 05:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747547559; cv=fail; b=T0t8qcnSIWTTwnAfqzi14Qut61srI6M519be3vbz0V599p/3YaJq57soDCd/MkIZk3CO04e/3ym2tu030026WeAUg8sNGhE6kqANn7QsBHNaSDWBOHsjWsnq8tmm4bYL+HwUjFYNyIFEjOMiZdOX8jRytQ+chmnBqj5Zq0MhSqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747547559; c=relaxed/simple;
	bh=gCBWsB0flW1nZ0WIY75CcPbWj/qtTXwdnlnzUNsMdtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PLkWl00RJR7kDrbjI9fc9xAOcMcWkBJBlMISKTwC/KCNkf2Gg9gZ2Dur44jpEgKkDmkk9k9QhQQcCLqgYYRwZHhN2xv1qjJ/nJD38AEvqHCxWTnPk0mQVk+n/LuMgBVmtd27sIFepN02qN7BsURJSbCc6LNc17F6S7+ct5RXcfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=agF6OgAY; arc=fail smtp.client-ip=40.107.220.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="agF6OgAY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZNkL6gWEvoWn9v9sOp6yygpHpVbwLq9pbgjI3H8u1B8tt1PEFyZf/kZOhva28nAU5WsLc1UeL4zkj8z6utwxK5Fzz4yzyQLrFAR09ug9wOcAXVulf1FaPnDdX8vyPLLbRtLrTgTpGTK9v0Aa6Qk/uMmBrpas3m1jsGa2mzEshxo5IL/MopNqTHms5qDyWTz4p+PYbMunQNzF8HaNn7AT9nguUw+Y0iA3S5Mj/C05tpQShXZkn66uhLQdavU1PM2QRnBnNkb6+JSuwUisauDGcBDaNtv+FX0VvpzO7REUZfQmHF8fN1LiOJ4dbquqv1UPeSRDhb40zsAOkyH73YM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fW4XT7S6LZSV2T9WsF1jUJZpSXUgmu2kAoi68aLrUU=;
 b=LfZASDyOnb7ehDbvxFvqfI85G5qTAZULacayLFiH37vO5C7TCnFDp8PJemtUma4/59uP6QYV/nS70w8iOAbNSP80ZhL7Bnz3O4DuuRNBt1w8O0y6t2+ctuJ163HZtmPSBXx4i0/UvFad7gYl7pl89J19DJUpS6NLnzvyLX/o+jd+l5CIWtFnDdorzqcikglaiaMrq467KCTobNcVgQvuzOKyr1tn0bfcbV8b2u7lLG20AHd5oz/NZUaBbDEKHRW1E7+pGwXTmTObjreAPmnNmZSozTWEcbFBhKhY/kPssOLE0pWfWWunJDMOkLo6VDRzdD6cvU5YZjpQ0oASqrYfhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fW4XT7S6LZSV2T9WsF1jUJZpSXUgmu2kAoi68aLrUU=;
 b=agF6OgAYRoPR2Tl2EOgDC/ZUDZVTH2dt6FIAyUdetbw1koD8y1EJOQ1HZ/sHOI9hFzfzaSJ8+AUXUWSZIss+uYi0wyr9midZDEXmoIx/Lxu8+ZDhIB4OKXlu6vPr0hZDzaNok8LokUiXczEDrGjcvupi0J8bsquKsJFqtpvpVFbC8PBKElIuvLf3yANQwcw7JBWyGYW7GK1e4Hr44Yj0CKOqMkbbSMaa+X1oFdW20PgljJ9d1tV+7PPNpaWpMvOQez1eqFsFLhQEMb6q6rSytwErg4zyjFWe+D4OJtK4sBuwzSOpXSJnPEXDiUNyx1meEcYBsG59AEBCbyQzL7SN8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8369.namprd12.prod.outlook.com (2603:10b6:8:eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sun, 18 May
 2025 05:52:35 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 05:52:34 +0000
Date: Sun, 18 May 2025 07:52:30 +0200
From: Andrea Righi <arighi@nvidia.com>
To: David Vernet <void@manifault.com>
Cc: Tejun Heo <tj@kernel.org>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] sched_ext: idle: Allow scx_bpf_select_cpu_and() from
 unlocked context
Message-ID: <aCl1nq0hUJ7IdtC5@gpd3>
References: <20250515191716.327518-1-arighi@nvidia.com>
 <20250515191716.327518-4-arighi@nvidia.com>
 <wdjlm556njybe4bgxk277xj4skryh2qnvd57yoenyf33vd4oyh@gz3ouesvc5vf>
 <aCkStT1QTGWZ3B50@gpd3>
 <py6tcjya3nxhmicvdhytyuu43rdw3j5wjw3bc5j66tsj2ngcax@gzifqgx72um6>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <py6tcjya3nxhmicvdhytyuu43rdw3j5wjw3bc5j66tsj2ngcax@gzifqgx72um6>
X-ClientProxiedBy: MI2P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a78337f-a9e3-45c6-6ea6-08dd95d02fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VIIJB5yjppSQp7esBlMU8sIcTRN/IPcu8QTASOan/RA6QJ9sk+rXVMOFUT23?=
 =?us-ascii?Q?Cju72JQEEi63nkxL1Cv3iO6loXffz8sntVDoktLRkim6Y2ozY51c84gxrC9E?=
 =?us-ascii?Q?d2rWva7dmlpsxgsXj3g+hjl+o48ayC0bSqA9rrHfW0woQMVm32sGGyF6E20x?=
 =?us-ascii?Q?L3nORa7ig/VbkdYM+4blsl6oA94jl3wnXJAZOB484fOxTcpwi1QHFcnQvrfW?=
 =?us-ascii?Q?Wts+2tHOx4dIpcu4zyAPdZ2jBJZ+0r7mN6v2T/PyFdBAxqevajgrffkee8zm?=
 =?us-ascii?Q?0JUO9RApYbZdhCvoU6/w0jhMELFa2s2sesxjb6oG7Crx7V5fP9eFPp4Kvxry?=
 =?us-ascii?Q?QiVRKSreHaoCo3mdaPnnJri16hCjXesxgK30sTjvF07BKJoPMkzyBqBVjEjr?=
 =?us-ascii?Q?VH1SN6iY4/veDPOAeveoilr+Jz3aDrFP+YH2srQjMjb6sO4hNs8tBwvgyVi6?=
 =?us-ascii?Q?aMeje7RO2nvvfNs28pdW09yYiftH8xi66m31/rkE8wH9qUC9Co95n7oP2eFK?=
 =?us-ascii?Q?UJ2NtnmFtxUc7hAksJI6J6x5vlMBySs6VSj5Sm252w16GNj/c/ZgsqVKidk4?=
 =?us-ascii?Q?zCgtEK332b1aIWI8tsKtOZSZH0q9eXysIWjyNxS6rifoFiluKarP8DlYiC+Q?=
 =?us-ascii?Q?FYLdm/7sWgPWqBc/7uN12ofzc4r/LheTghFJp9hcYJmJ5181FIQKb0LZ5erQ?=
 =?us-ascii?Q?VCdTmJsSqSpl9ge1TiwNst4H0PqEr7892mL+xUvzjarCeiypKKtKX/rHYidO?=
 =?us-ascii?Q?gBO9SvxiOH4t1VwnE2oiUcmjYNVqOdwS/8G+dwvh6J0PiPP6QjTNfYVwdICq?=
 =?us-ascii?Q?PK4Hzzzew3x21GYSTJ7zJz7ZpfpCpTpSme8zRI0T1wSFTK5JpckTXIjs1UQz?=
 =?us-ascii?Q?/Syq47RSfn+0FDWU6H+M6az9tVeQDtPZ6tYfmM3r79BCHhVpzQS/Qa5U4sCj?=
 =?us-ascii?Q?r+u5BDAugc51kJt+/gacfu3fZY2jNVsISqk8IvQU+pqdzxfywtdRd7ZtMcME?=
 =?us-ascii?Q?Yb1DeGFZlTQtpNI5tx9sfGrwT1/OmhCYj1UtBKl6tMR1unZ1qODfYRjJ31Vr?=
 =?us-ascii?Q?uyLrr/5fFrPm6ixTuvh/TpoGayWtf+q5II/tfC8bXQrSVBsJ9azGGicw2pXC?=
 =?us-ascii?Q?fCFIFxY43J/ieqMu5fPLVSj2mw28ilWHx6SVUYFhSXMSpw3u65I82AH5Przx?=
 =?us-ascii?Q?A2Glxyl8UKQ4e96061yYXZ/BIhQpyATy4gHcRKnnfzDjJqAdC5ffRj7x4lFG?=
 =?us-ascii?Q?XoigwbItgtQd4K6zjB5vNqQisSZWx+tshzSglYTUV3/VCXQZ2aFhmGneDVr0?=
 =?us-ascii?Q?eXADrhh8qbB5HSjGfkg1cTJ/LCtE+Xp++wWMpOO7UhgnbgKp84qkTSKcuFCk?=
 =?us-ascii?Q?CV6DcPanjS0hq37m/c10xyiJQ94H11kAMlDkixs+8Fttq1Hcmh9RhgpBldn5?=
 =?us-ascii?Q?A6mfxBoXVMc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8cvopJkTtdiPd8FRsj0zkmVSF+1soQ4M8R7IdOG7yXgqaD5+1v5q09Y7c1kE?=
 =?us-ascii?Q?5B87QHfb8ZgiQjIXcr3xu2oGLxORKCVR8sKaXQv5fIYgkafYIBIeU/oNOrmE?=
 =?us-ascii?Q?zoK5rs0FPVqE4QBEew4n7fuWMgFliKOE3VT4SqLP92VdRUWe8/ggLboDE8+a?=
 =?us-ascii?Q?GAB1dNbCGwayEREb5a4DEsFypn/7EHlMFGY5TEJgi5nqqacY1zuYUacpieZ6?=
 =?us-ascii?Q?Ih2saZbfE7j92OsKqMcxaOHmN44/TLM09wA6wcI5sc+JeaazlLi4Z+hmZs6J?=
 =?us-ascii?Q?2NWqq51zs8isjnQkfhGElVrgptRJm9zX5+nNgLCBqgFqU0SfEwv8/4fq/Y3C?=
 =?us-ascii?Q?/RIaZcggW6n6ltvY3ANah2IDv3eIzfwGG0REs1Ly32k3cadvK2PM0WabF7Z4?=
 =?us-ascii?Q?6oOzwYa94h6I4CdJ+MQsO/LsBPh+oDgXTUuXZ0UKmFeN9EltsGf1u25Nbj2+?=
 =?us-ascii?Q?dpqphOtH2SMSBoS9VDXTI4xoFphc9/6Nj0vBfp53pcxvDwwvk97GjUc4e+y9?=
 =?us-ascii?Q?pp7or5vhmpQkS8v8LEovcG7XeqPxcuEIRjLk8ARVgX3aXLSeRAZLy9ZdvaPH?=
 =?us-ascii?Q?P0zGAe5zjuKtwJDySfs9vbCuOq1qmVvt/1bUCr67NEKjuHbJRQzDsNKrUSRw?=
 =?us-ascii?Q?mNa3qpXXaDQNhg2wFXFX1zek9zyKgN/tyY9U0FSDY2DYd89aO1BF7ngcSzwI?=
 =?us-ascii?Q?arAXXYHy9kWXMdvZl65RL/HhGgSg+p1Sf+vo1xc16qcGR2LkFAvjX+Z5xGnb?=
 =?us-ascii?Q?5X6rgP/kHmpyFOs4b5Gs+ZRHaf89MzkitOQGbiN7ERYQFCdRnQZifCW0Q6kt?=
 =?us-ascii?Q?B9RBV6yl/21G0A2vJdFhOzXjYM48yyYAiDzhszVNPBqIbEfUze5sWc5Vt8xZ?=
 =?us-ascii?Q?1P4RYC/Zb+Yo6FQ0FT0VcfhrlIeHv5eWnoW/YbT7XrtVKo+qugGaq3u++L2G?=
 =?us-ascii?Q?kIS/lX+8LsKpgNAXwEE27DaOU15W6ycU7n5hIqJKIRhRSXFbPb1JLpEHFZhh?=
 =?us-ascii?Q?jxCo4I4ctJIlDMmraDbvfpUTTUYVE6gfEirmWv8vziPiHBnA5R+cQNSoueDB?=
 =?us-ascii?Q?MiQfS2wYF7yGRKF8LGb7l5oryTblUGlyyX40eBJc8CPuQakrcpzpK989velZ?=
 =?us-ascii?Q?tc5GZS9exefazXV1pbcMsBJB35WCtpOzytwyRGz6z12MbML+C/ydhub5dB2B?=
 =?us-ascii?Q?rMjgAmqMnRlc9m4MbBytxeGD8KMo0WgrT4httXi2Bp1rd3xiYeunReyvxJ+5?=
 =?us-ascii?Q?+V/3NwQZbBeT5ImSn0PYmcTOatS8J9b89Adp8JHJaWygqJdemyI8VXezZrGR?=
 =?us-ascii?Q?PGJvSuWNCxpscBsFffviYo4RVZ6buOsnp3nyGF6AHM5HJq+6+nZjH0h+bciw?=
 =?us-ascii?Q?mi4BsB4PQk0dQrVUUlYngej66KOzkMjaNW4cwTHQoUiW8Jq4PEABa8+NpoOy?=
 =?us-ascii?Q?VdBzgrG396sHjq9nll8Ww0mLc1Xk4uki5V9FqdcJpP8rm4kXKG6VTUnQCOTG?=
 =?us-ascii?Q?hZpjm7FWaofuEo63HyiYy66mkb5Fc9xxsfrC389QufAUPrt+9NUsMuoCS3mK?=
 =?us-ascii?Q?1E11Utdm5hfIv/4usjkjezVoLILipIST+5rwxTxH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a78337f-a9e3-45c6-6ea6-08dd95d02fbb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 05:52:34.5630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zABJ6UoeTGDRabeyquecqSgrgznoZ8CgzY8MoAZlwH3lmn/TbHBWpULtD8eh7aOq1N682tCU8n3TWLI5znpFjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8369

On Sat, May 17, 2025 at 07:40:22PM -0500, David Vernet wrote:
> On Sun, May 18, 2025 at 12:50:29AM +0200, Andrea Righi wrote:
> 
> Hey Andrea,
> 
> [...]
> 
> > > I wonder if we should just bring this into scx_select_cpu_dfl()? It seems like
> > > it would makes sense to do this optimization whether we're looking at
> > > cpus_allowed here, or p->cpus_ptr in scx_select_cpu_dfl(). I seem to recall us
> > > having this in there before so there may be a reason we removed it, but I've
> > > been out of the game for a while so I'm not sure.
> > 
> > Trying to remember... probably it was removed because ops.select_cpu() is
> > never called for tasks that can only run on 1 CPU.
> 
> Hmmm, I think it is called even for pcpu tasks, no?

IIUC ops.select_cpu() is triggered by select_task_rq(), but only if
p->nr_cpus_allowed > 1 and it's not a migration-disabled task, see:

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/sched/core.c#n3582

> 
> > > Anyways, if we could do this, then we could bring both scx_bpf_select_cpu_and()
> > > and scx_select_cpu_dfl() into the scx_kfunc_ids_idle kfunc group and remove
> > > scx_kfunc_ids_select_cpu.
> > > 
> > > What do you think?
> > 
> > Are you suggesting that scx_bpf_select_cpu_dfl() should also be allowed in
> > the same contexts as scx_bpf_select_cpu_and()?
> 
> Yep that's what I was thinking.
> 
> > I did consider that, but was initially concerned about the potential
> > overhead of handling different contexts, even though these extra checks to
> > manage the contexts would likely be negligible in terms of overhead. And it
> > would give the possibility to use scx_bpf_select_cpu_dfl() in ops.enqueue()
> > as well, so overall I see more pros than cons.
> 
> Now that you mention it I don't see any reason that scx_bpf_select_cpu_dfl()
> couldn't be called from ops.enqueue() even now, as we do hold the rq lock on
> that path. But in general I think that if we want to make
> scx_bpf_select_cpu_and() callable without the rq lock held, that we might as
> well do it for both as I don't think there's any semantic difference between
> the two to the user; it's just that one version also does an AND.

Semantically speaking, yes, like you say, they're the same, except that one
also accepts an additional AND cpumask.

The only reason to keep them separate might be the slight overhead of
managing contexts, but, again, that should be negligible and not worth
preserving a different and potentially confusing semantic.

> 
> As I mentioned in the other thread, I don't have a strong opinion either way,
> but in my opinion it seems more consistent to move the extra context-handling
> logic into scx_bpf_select_cpu_dfl() if we do decide to allow callers to use
> this.

I think I agree, I'll send another patch on top to unify the two kfuncs.

Thanks,
-Andrea
