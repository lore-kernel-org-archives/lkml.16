Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426B820DD6D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069234; cv=fail; b=R2qvfgExsc4rbTQzj67hiWDuvR5mag2yu1JmQ7I6kbaslzLLj1HMVAhhAeuRsVSwz63U9AxvscTzXyqd+Rb9Znejva/fsob9iZSrmCVMkB6RL48MPVx6kY5fra/J0Xpyl5cgVp+zpx0Ddmi88R2y+pLpJBPH2+9EHsu+7RJMPM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069234; c=relaxed/simple;
	bh=/4w7WslAQ9K9604P0rDQg/RgG7gkKr6KXJd/zEdznIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rz5JGzmHMtpzLftg1BseB+qaaN+jmfwNS+D4IHAqVr0ulQ4GS+frfzmn8UXumG4rARyvZr0o8ZD/a5cNjpkYSrQyG/r80n2hBYRKN99o1PODN8BfS2ALJ6Pv8PK8QBWz0JTcy+GAxqlxa8LW6EwCQbDxgjEwJi5Pu7OGa8Ti0cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YEWEUL1T; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YEWEUL1T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7rEqKk/cniWBP42PmEf1JkScbqCss0L5E4Xn9c/N39RSLw5VO4DBuaU1/JloXRJl/NMhGkdw43gEKl3hSFkH7021BtVfyn+cnGYVo9FeLBUTG+st5zlo0dkFKo23hicJXD5zhEAC7BxxFFBbFMeeV8D8HFOJj/yhLjehFDwVl+FAzpDUatKjYCKE85IFOPDz3O5Ejndthmu+Jm3B6mgTPGS/wPfGFyXAexxfVMf2gygVVdVaAgJUd2Mc33O41yE7/rQlVhGI2TJFr4WLj1m+gJBZcV4JYN6ZpRWZU+EOmKMaXOE2ResZCpE6BltsPYYDHK1MJ2DZK3varP4o8HSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuQEnIygO6FzJps6tzrupxDoAnn8Pc8R7/Lropod+N0=;
 b=BQlpzBXOolDJ1cfF8WnB33Den6iYdm+OFHz6jKHjoTY0JlDrPI2IhiUIMYaCsvMKXBaAWt3DZrlr9bZDCHDQOaQ0UWAZky4CJ3CUoEHOcojUKykbRSIrBvnO5KvCG49V6SP3RgGKUOX95QkPmKD1ejBliucZ2CQSufKEglHLbtI4WRRyn93EpkLP7vts7h2Dlu+z8rUsByIi86ycJU2+aEZw0yDaizrpjLYRSWNtUA0MQBZFwPBXGX3mXCTqkbP3dOTgX8Wn2gF8u7prcFkj18PIlgqCniSM2yRm0qZDZO74ESGt4romGLdw7hMcwHipzgCy3o0G6ke6TXz/v85XCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuQEnIygO6FzJps6tzrupxDoAnn8Pc8R7/Lropod+N0=;
 b=YEWEUL1Tn2oz8JEbI5zXSaahTIdic6CS5UZIJmF7SpPJw5Sf2aa5Jfa5sVKkSiq2+j2/5S856P/bVu/20zml3LhDsk6Ih7fcKPaMkUeCbqKiboZOeLCk2mPjUaWukkAmk9wuVmK+R03MNK2LAIWiK2lDFlSxpaPFyVp2ptVjB8b26dlsjl5wCEzPev6T35xUfPmHCLPaadecT7nEDy2KW1AnPtPFoWG6UClPjvJlyt3Cd0RJ4KUPHLqPao/K4uhL6P4f9PaKFdqXz+gT9dPTQIBBQONWboZfmFDuX4DJkfpYKvCllhNDKlnlIG49ttDXLuimFay9iyem4sMMO3XawQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH8PR12MB7183.namprd12.prod.outlook.com (2603:10b6:510:228::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 09:53:50 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 09:53:49 +0000
Date: Thu, 27 Mar 2025 10:53:39 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
Message-ID: <Z-UgI3dSwcLa-CRC@gpd3>
References: <20250325140021.73570-1-arighi@nvidia.com>
 <Z-SasIwx5hINm1sf@slm.duckdns.org>
 <Z-UEkJfkkBBKqCyU@gpd3>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-UEkJfkkBBKqCyU@gpd3>
X-ClientProxiedBy: ZR0P278CA0071.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::22) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH8PR12MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: f11ba13d-b984-49a7-2cb6-08dd6d154625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s7SMp8bmnZxgqyqD2EKZs/cTkDkzn6R5O53am2Ucrt5twNln78HYBYoM6Z2q?=
 =?us-ascii?Q?UuJMqWN/fdypMyZpPLCs2pUew8wUv2/BPTHmJwHYf/j1AVyPOzGarl97w6wx?=
 =?us-ascii?Q?yI1vXmpg8wvfJhnAOL+GRKBlGCcWgFhP/GP6KRljPhkT/dKCiFO/gkZEjOoq?=
 =?us-ascii?Q?ciAZAzLx+d3vL4BQHBVqqDCMzb/DwvsUj/Z6O0f3UKd7a91spx9KZKWg2KuJ?=
 =?us-ascii?Q?w2SSGjKh8xZ25qpizdtQr5iDWSPgUTXxPLdn0aAA+fFcxFPl+J0Rc8batrSG?=
 =?us-ascii?Q?fYA9TaA6W/97Paf4zede+pARPqg5c1WBihUzOwQ1abXJL+Ywd8SYkkKO6+kP?=
 =?us-ascii?Q?duAUc88B8akdCPE3yp1Svyh1I3t6D9KKt21VpzNBY8MnKiDxE0Id97vHCQzb?=
 =?us-ascii?Q?VkxlaPSLCIhCYUNNh82fUbm8BwFjFdGDtpRBwvuRbQAMUJE5K4aHLykgFRnS?=
 =?us-ascii?Q?Xjjuvnj3mS6vRfJSMzpXOWD7j6zQCWrb1Lm9K/Upb3rGl6+iM8VvYyFLtmFY?=
 =?us-ascii?Q?wNtrxlTwtAYJHNa/aGA5YQm5YsuhT3Xu14pgAJlWcboGptlhDKDg64yZi81E?=
 =?us-ascii?Q?DhUBHNbOL36q019PORmRWL1NOpSa5GkQmRk4cBkR/OwtyRBHFvrPvlisT/gP?=
 =?us-ascii?Q?n5ewX78ZqIHs+iZKiAkkD/ed79YVZGnnv7BXIMc8hMfAOk+mtPVBXGMTl/n5?=
 =?us-ascii?Q?7eqHOjy307Zl9hKzsbu0j1aIqf6lm3Cqz20EP+l63l7p93e7CLxwV3m+6W5e?=
 =?us-ascii?Q?njQNgLcB2t1WiD1BmgU+re7Qz/6Ry3GKMZXJWSo1Q7uOP3mbJfQ4EfcZkPIx?=
 =?us-ascii?Q?MwCTL8Tcd+pYkwpX3MWqsvXVNcC/6CaBrq44UP8drUBaKfyQ15Z4yJyTEmJF?=
 =?us-ascii?Q?tGsmzj7cDjXzpyIW3ShfS0YS5m8/xy1vN90hCZNo0JOKfzIahI8e2l5vOXr+?=
 =?us-ascii?Q?Rxg3k/zr2ZvrXZm09B2mQh6QufOjmMSnM+w/orhwTMM9wDsNLjj/0f+NpJFn?=
 =?us-ascii?Q?t0x1GQFxRGdWTw5tNBuaV/vw6KPZaDmrK9iDLyg/igV9dN53Rmoqu6Yh5q9f?=
 =?us-ascii?Q?kbNOVJHho7yRxTbzndUpoQiejbwWtyAu4Nbd71Ub5/bPWPn1pHNM7SE0IjD6?=
 =?us-ascii?Q?3JRuJGq93MGuTq2d0gGxVdPbBxcGpjCCRKvP3xrMGDR0BkCpqhSYhy3zQuBT?=
 =?us-ascii?Q?neGuODVI8lldExYrT9vlkZ/4KXVbaKFlBPM0YhTXKYOlTDbS3ggFM+LIQ0Ka?=
 =?us-ascii?Q?TKfAdOtoJXbd7nBZgZ9J+wnvk5pIhy7kKMr3HQ3Db11wNsVafNeKE/t4mule?=
 =?us-ascii?Q?cXHAaz3bFLyJXIZuwcBu2iLZqZGLwTd+rlm9N78ah4ueB4kmM7iApQ00qql1?=
 =?us-ascii?Q?3AiqZ04k191mA5ZL/3tX0Mn4hDG5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n/tI6GCrDtZEFaiuiUfb2Xw048a2KIB7y+S1pK8Fu7z7qT8ZbQ/Pzehs1Lbn?=
 =?us-ascii?Q?4hz9Gp1B3F0Giso2YpSRku2/0kRYqZ6u5HIybRb8Y0Mn8TsILOQedSqPl1CL?=
 =?us-ascii?Q?6w/CTIYNzx/bzUlzpRUFS3qpnssFCF7Bvq/JXz4okhaEuEIXyOsvGk1dc7xJ?=
 =?us-ascii?Q?gDIbdlLRQfPhWkxCQUWD6TwjXmCJYG01Cg4KjXibQt0bpB/IfdGsnEbsUCDJ?=
 =?us-ascii?Q?xdpeXb+8Kt0RoLROhj/ph4s3f9lczmgVwEuMXXADE4dr9MC21ZtJ20SeDIWP?=
 =?us-ascii?Q?gYQ6WljTez9qQbx1X7s0MjJEJG2cSwkXbMkj0n5NNmvG6PpXc5SYaaZi/KFv?=
 =?us-ascii?Q?JFfd02Z5mMv1E0iMihU+/PVpu76vFNTl03xn5NIrKjbUEA2bdLwoV18c5zSN?=
 =?us-ascii?Q?mQDKLF6Rf+31+ahDgztPiBj7xpQiUocXAiIO/fQNCDeMkQutrShU5pdpYbh/?=
 =?us-ascii?Q?5aPLT40Z3ZpjvFgQ/vxj8X7lBVY4jH7RMniMObxzLJhZXueeCe/KTvidhu98?=
 =?us-ascii?Q?EgxRrcwsBzBouw4FryFjm7e6GV8zYNxlDXuBDmbNcs8rzoe/EuIaXoUclHSK?=
 =?us-ascii?Q?eYV802SmxAS84mTO+Y6Z1/dUSof9Fx3kN3TgZrknc2hetUCy70grTpJOGxUO?=
 =?us-ascii?Q?GXtaFRwuFt9twKVdsdBNCD/ZyFn8ZL8Lw5SlD5+PIdFx4+uW3bQCYgiYYVXR?=
 =?us-ascii?Q?0zGfu0zBNQ9MNUB0tog5CicmrMMispe05uLhpnvw7tieXUPip8N6y3I7uEmm?=
 =?us-ascii?Q?ivZmNgq3QMKHrctPdt5Ovt0/G7e4Hks0DIi6g1PAtEwznd8bE4LvDUTZzX9T?=
 =?us-ascii?Q?ancRHtjqVTSevHoh2B0XU2yrkGRw56fm+46lF797+v8OlaY1EBjBlkwSnjmp?=
 =?us-ascii?Q?ectHKGPeti6RDre5atF0jGanJxQVkYmUHQmMXq0rcSKI/Cg6ktGnXV8lf/SY?=
 =?us-ascii?Q?m/KRblqMpby/HaQQM/fmzQVdlh21pVBcpW3LpWBU24a4wj6+ZuzNTsrpBZ9S?=
 =?us-ascii?Q?8ZZxV/HdnG7kILE4wKaTVhBReX/bCfXDyXghWkLWDBp/Th6KM6ElGU4fp3Yo?=
 =?us-ascii?Q?VnHc6GLKSzUvf5PMU9eErFljD9YHwPZ9AgXOquU3a8VmDny3yNBoC3gy2piO?=
 =?us-ascii?Q?klm7Si5TRBM6E9LJ113gfS3lxqdIjy8lQLd+L82B9Y/g8jT6hRQv+NZppyBC?=
 =?us-ascii?Q?rBV4tkbhoxGC3jHrgHTMm8NoP7i47rtpELPemuF8uwZ8NJiWqdZ5O1wncuBz?=
 =?us-ascii?Q?FziQYE43Xhn+AcdJTuTbnV1uWSA36SLU9OAtprNYCznzAPlvaCE/5jFp9iDl?=
 =?us-ascii?Q?+55uorEUEnkPxrcBJ8QN6FAAJIIyWW6fG5ZQoFQoYuromGr4fpjvl1GsFvi/?=
 =?us-ascii?Q?1GSzuF9i4WZjeSlRbqvm1rwm/Wa/vzcXe/PSUimXRuwiRmukbaxt1wtZmFVe?=
 =?us-ascii?Q?cSMWFmTi3yx8zEJxJL4wz2/0kFf7GGZIFLbvmrKp3RV+w3jmuqbKElZkGfXJ?=
 =?us-ascii?Q?r0fF/GWDYeo2ipCLUlwwzQn67e65pI8A2D12gjeexogZDbUcIxLiIx61qatu?=
 =?us-ascii?Q?x+ksCFOGxiD5odfDRZyMLTKGQ4udoYSBvjMZ2+2l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11ba13d-b984-49a7-2cb6-08dd6d154625
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 09:53:49.9115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wk8t1zj3++3QQ3xX/VlAOHdAxn9wqaNXurX5fIGXtwr2hViu2H8YBSyRU2mbCMw920SHNmsbSemJkljlSjJlyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7183

On Thu, Mar 27, 2025 at 08:56:12AM +0100, Andrea Righi wrote:
> On Wed, Mar 26, 2025 at 02:24:16PM -1000, Tejun Heo wrote:
> > Hello, Andrea.
> > 
> > On Tue, Mar 25, 2025 at 03:00:21PM +0100, Andrea Righi wrote:
> > > @@ -7114,12 +7114,22 @@ __bpf_kfunc void scx_bpf_cpuperf_set(s32 cpu, u32 perf)
> > >  
> > >  	if (ops_cpu_valid(cpu, NULL)) {
> > >  		struct rq *rq = cpu_rq(cpu);
> > > +		struct rq_flags rf;
> > > +		bool rq_unlocked;
> > > +
> > > +		preempt_disable();
> > > +		rq_unlocked = (rq != this_rq()) || scx_kf_allowed_if_unlocked();
> > > +		if (rq_unlocked) {
> > > +			rq_lock_irqsave(rq, &rf);
> > 
> > I don't think this is correct:
> > 
> > - This is double-locking regardless of the locking order and thus can lead
> >   to ABBA deadlocks.
> > 
> > - There's no guarantee that the locked rq is this_rq(). e.g. In wakeup path,
> >   the locked rq is on the CPU that the wakeup is targeting, not this_rq().
> > 
> > Hmm... this is a bit tricky. SCX_CALL_OP*() always knows whether the rq is
> > locked or not. We might as well pass it the currently locked rq and remember
> > that in a percpu variable, so that scx_bpf_*() can always tell whether and
> > which cpu is rq-locked currently. If unlocked, we can grab the rq lock. If
> > the traget cpu is not the locked one, we can either fail the operation (and
> > trigger ops error) or bounce it to an irq work.
> 
> Hm... that's right, it looks like this requires a bit more work than
> expected, but saving the currently locked rq might be helpful also for
> other kfuncs, I'll take a look at this.

What if we lock the rq in the scx_kf_allowed_if_unlocked() case, and for
all the other cases we ignore locking if rq == this_rq(). If we need to
operate on a different rq than the current one we could either defer the
work or just trigger an ops error. Something like:

	if (scx_kf_allowed_if_unlocked()) {
		rq_lock_irqsave(rq, &rf);
		update_rq_clock(rq);
	} else if (rq != this_rq()) {
		// defer work or ops error
		return;
	}

	lockdep_assert_rq_held(rq);
	rq->scx.cpuperf_target = perf;
	cpufreq_update_util(rq, 0);

	if (scx_kf_allowed_if_unlocked())
		rq_unlock_irqrestore(rq, &rf);

AFAICS all the current scx schedulers call scx_bpf_cpuperf_set() from
ops.running(), ops.tick() or ops.init(), so even with the ops error we
should cover all the existent cases.

The only unsupported scenario is calling scx_bpf_cpuperf_set() from
ops.enqueue() / ops.select_cpu(), but maybe we could add the deferred work
later to handle that if needed.

Thanks,
-Andrea
