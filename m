Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4996921A435
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743455182; cv=none; b=oYCnW+L+h6yaem37gx+c2yPloor9ntzQVpwD6JYEYLJLSIO2p4PeecjT7F1DFiRIRLzQVtPtMAX3s9tItqQIG06p8sn3NGpkg1XtLWdkiHwBx3zu/uQSLlSOztLgj8y+lyNWJNaFVh7fA5YLSLb/hHcOtzOX4PWMa/f7vOT+xbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743455182; c=relaxed/simple;
	bh=MQnp2uy3ZflVrGeaZcVF05TJ9zXOjsYdI6paYfPAhxw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R05gK8LDrT7vfs79z67U9nmcyJsqBUAm9otRh1uTqE+BBhlecuS+P0icuyJ6y5bfMYjMvI0W1eYU7grnE3NnmX0DVhDsWjlejvQgmYUjI03+67+/TxQdf2M4KCpg6WSoFLS3CTz1bOFg5qHubn26xzlg2QOfaCQKWTnpV6nqEOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ky77Bjpv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ky77Bjpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743455180; x=1774991180;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=MQnp2uy3ZflVrGeaZcVF05TJ9zXOjsYdI6paYfPAhxw=;
  b=Ky77BjpvM5ie/4x2jqx2KfD00l294X7qTR5GnpDL2j/Ys3B1mBMX2URR
   ekKqaIeVCrdGGXNXjOFEm3RiQZXFY7g+cyblqELy9LWNTU29bSApvXKaZ
   +lQn4vJ57dcbgTAT3PomwnXT4V71AbaQhTCyQ1Cowerj3GRRJFbcHff7J
   7GKtVogwXfeyUVMEi2fYLtU+dGQeaB8KIEokus8Ja8BESD9FUk+H05Loj
   tQdAu/W0pfPMtJ7HygEOXD2jIysZs2OOvwvK4easKmD1zpKQkSynOClTv
   gwdUN/uHrp1p+kBNnWcLW+lfaxqNRjo4xkCr/KP+nEMkbHnowMjn7uteQ
   A==;
X-CSE-ConnectionGUID: W/JeBNUiRnaHDKgoPUvwVA==
X-CSE-MsgGUID: EAe2hOLmRZqcmp/NSjCYsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48425352"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="48425352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 14:06:19 -0700
X-CSE-ConnectionGUID: 5Z83Yu72RuuoVvxkWqyjUg==
X-CSE-MsgGUID: ztKU9T0STX66+orNRmhgfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="149383684"
Received: from msatwood-mobl.amr.corp.intel.com (HELO [10.125.109.64]) ([10.125.109.64])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 14:06:17 -0700
Message-ID: <d7efe8bb02cbb3e2f6a32b350dcf0aa44d3f4091.camel@linux.intel.com>
Subject: Re: [RFC][PATCH] sched: Cache aware load-balancing
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, 
	gautham.shenoy@amd.com, kprateek.nayak@amd.com
Cc: juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,  rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com,  linux-kernel@vger.kernel.org,
 yu.c.chen@intel.com, tglx@linutronix.de
Date: Mon, 31 Mar 2025 14:06:16 -0700
In-Reply-To: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
Autocrypt: addr=tim.c.chen@linux.intel.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-03-25 at 13:09 +0100, Peter Zijlstra wrote:
> Hi all,
>=20
> One of the many things on the eternal todo list has been finishing the
> below hackery.
>=20
> It is an attempt at modelling cache affinity -- and while the patch
> really only targets LLC, it could very well be extended to also apply to
> clusters (L2). Specifically any case of multiple cache domains inside a
> node.
>=20
> Anyway, I wrote this about a year ago, and I mentioned this at the
> recent OSPM conf where Gautham and Prateek expressed interest in playing
> with this code.
>=20
> So here goes, very rough and largely unproven code ahead :-)
>=20
> It applies to current tip/master, but I know it will fail the __percpu
> validation that sits in -next, although that shouldn't be terribly hard
> to fix up.
>=20
> As is, it only computes a CPU inside the LLC that has the highest recent
> runtime, this CPU is then used in the wake-up path to steer towards this
> LLC and in task_hot() to limit migrations away from it.
>=20
> More elaborate things could be done, notably there is an XXX in there
> somewhere about finding the best LLC inside a NODE (interaction with
> NUMA_BALANCING).

Thanks for sharing the patch.

> +
> +static void task_cache_work(struct callback_head *work)
> +{
> +	struct task_struct *p =3D current;
> +	struct mm_struct *mm =3D p->mm;
> +	unsigned long m_a_occ =3D 0;
> +	int cpu, m_a_cpu =3D -1;
> +	cpumask_var_t cpus;
> +
> +	WARN_ON_ONCE(work !=3D &p->cache_work);
> +
> +	work->next =3D work;
> +
> +	if (p->flags & PF_EXITING)
> +		return;
> +
> +	if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
> +		return;
> +
> +	scoped_guard (cpus_read_lock) {
> +		cpumask_copy(cpus, cpu_online_mask);
> +

We can constrain the preferred LLC in the same preferred node
as that from numa balancing. Then numa balancing and preferred LLC
won't fight each other if preferred LLC falls on a different node.

Perhaps something like this here

+#ifdef CONFIG_NUMA_BALANCING
+               if (static_branch_likely(&sched_numa_balancing) &&
+                       p->numa_preferred_nid !=3D NUMA_NO_NODE)
+                       cpumask_and(cpus, cpus, cpumask_of_node(p->numa_pre=
ferred_nid));
+#endif


> +		for_each_cpu(cpu, cpus) {
> +			/* XXX sched_cluster_active */
> +			struct sched_domain *sd =3D per_cpu(sd_llc, cpu);
> +			unsigned long occ, m_occ =3D 0, a_occ =3D 0;
> +			int m_cpu =3D -1, nr =3D 0, i;
> +
> +			for_each_cpu(i, sched_domain_span(sd)) {
> +				occ =3D fraction_mm_sched(cpu_rq(i),
> +							per_cpu_ptr(mm->pcpu_sched, i));
> +				a_occ +=3D occ;
> +				if (occ > m_occ) {
> +					m_occ =3D occ;
> +					m_cpu =3D i;
> +				}
> +				nr++;
> +				trace_printk("(%d) occ: %ld m_occ: %ld m_cpu: %d nr: %d\n",
> +					     per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
> +			}
> +
> +			a_occ /=3D nr;

Is it necessary to divide by nr (#CPUs in LLC)? Suppose we have uneven
number of CPUs between LLC, but some total occupancy, we will skew towards
the smaller LLC with this division, which may not be desirable.=C2=A0Could =
happen
if some CPUs are offlined. I think the preferred LLC can be the one with
most accumulated occupancy.

> +			if (a_occ > m_a_occ) {
> +				m_a_occ =3D a_occ;
> +				m_a_cpu =3D m_cpu;
> +			}
> +
> +			trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
> +				     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
> +
> +			for_each_cpu(i, sched_domain_span(sd)) {
> +				/* XXX threshold ? */
> +				per_cpu_ptr(mm->pcpu_sched, i)->occ =3D a_occ;
> +			}
> +
> +			cpumask_andnot(cpus, cpus, sched_domain_span(sd));
> +		}
> +	}
> +
> +	/*
> +	 * If the max average cache occupancy is 'small' we don't care.
> +	 */
> +	if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
> +		m_a_cpu =3D -1;
> +
> +	mm->mm_sched_cpu =3D m_a_cpu;
> +
> +	free_cpumask_var(cpus);
> +}
> +
> +void init_sched_mm(struct task_struct *p)
> +{
> +	struct callback_head *work =3D &p->cache_work;
> +	init_task_work(work, task_cache_work);
> +	work->next =3D work;
> +}
> +
> +#else
> +
> +static inline void account_mm_sched(struct rq *rq, struct task_struct *p=
,
> +				    s64 delta_exec) { }
> +
> +
> +void init_sched_mm(struct task_struct *p) { }
> +
> +static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
> +
> +#endif
> +
> +static inline
> +void update_curr_task(struct rq *rq, struct task_struct *p, s64 delta_ex=
ec)
>  {
>  	trace_sched_stat_runtime(p, delta_exec);
>  	account_group_exec_runtime(p, delta_exec);
> +	account_mm_sched(rq, p, delta_exec);
>  	cgroup_account_cputime(p, delta_exec);
>  }
> =20
> @@ -1215,7 +1434,7 @@ s64 update_curr_common(struct rq *rq)
> =20
>  	delta_exec =3D update_curr_se(rq, &donor->se);
>  	if (likely(delta_exec > 0))
> -		update_curr_task(donor, delta_exec);
> +		update_curr_task(rq, donor, delta_exec);
> =20
>  	return delta_exec;
>  }
> @@ -1244,7 +1463,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
>  	if (entity_is_task(curr)) {
>  		struct task_struct *p =3D task_of(curr);
> =20
> -		update_curr_task(p, delta_exec);
> +		update_curr_task(rq, p, delta_exec);
> =20
>  		/*
>  		 * If the fair_server is active, we need to account for the
> @@ -7850,7 +8069,7 @@ static int select_idle_sibling(struct task_struct *=
p, int prev, int target)
>  	 * per-cpu select_rq_mask usage
>  	 */
>  	lockdep_assert_irqs_disabled();
> -
> +again:
>  	if ((available_idle_cpu(target) || sched_idle_cpu(target)) &&
>  	    asym_fits_cpu(task_util, util_min, util_max, target))
>  		return target;
> @@ -7888,7 +8107,8 @@ static int select_idle_sibling(struct task_struct *=
p, int prev, int target)
>  	/* Check a recently used CPU as a potential idle candidate: */
>  	recent_used_cpu =3D p->recent_used_cpu;
>  	p->recent_used_cpu =3D prev;
> -	if (recent_used_cpu !=3D prev &&
> +	if (prev =3D=3D p->wake_cpu &&
> +	    recent_used_cpu !=3D prev &&
>  	    recent_used_cpu !=3D target &&
>  	    cpus_share_cache(recent_used_cpu, target) &&
>  	    (available_idle_cpu(recent_used_cpu) || sched_idle_cpu(recent_used_=
cpu)) &&
> @@ -7941,6 +8161,18 @@ static int select_idle_sibling(struct task_struct =
*p, int prev, int target)
>  	if ((unsigned)i < nr_cpumask_bits)
>  		return i;
> =20
> +	if (prev !=3D p->wake_cpu && !cpus_share_cache(prev, p->wake_cpu)) {
> +		/*
> +		 * Most likely select_cache_cpu() will have re-directed
> +		 * the wakeup, but getting here means the preferred cache is
> +		 * too busy, so re-try with the actual previous.
> +		 *
> +		 * XXX wake_affine is lost for this pass.
> +		 */
> +		prev =3D target =3D p->wake_cpu;
> +		goto again;
> +	}
> +
>  	/*
>  	 * For cluster machines which have lower sharing cache like L2 or
>  	 * LLC Tag, we tend to find an idle CPU in the target's cluster
> @@ -8563,6 +8795,40 @@ static int find_energy_efficient_cpu(struct task_s=
truct *p, int prev_cpu)
>  	return target;
>  }
> =20
> +#ifdef CONFIG_SCHED_CACHE
> +static long __migrate_degrades_locality(struct task_struct *p, int src_c=
pu, int dst_cpu, bool idle);
> +
> +static int select_cache_cpu(struct task_struct *p, int prev_cpu)
> +{
> +	struct mm_struct *mm =3D p->mm;
> +	int cpu;
> +
> +	if (!mm || p->nr_cpus_allowed =3D=3D 1)
> +		return prev_cpu;
> +
> +	cpu =3D mm->mm_sched_cpu;

Some regressions seen when the preferred LLC has significant load, causing =
frequent task
migrations between preferred and other LLCs. For those cases, tasks should
stay with prev_cpu to avoid migration overhead. Perhaps we could
consider the load in preferred LLC to see if we should move a task there.=
=C2=A0
Say if preferred LLC is heavily loaded (say nr_running in LLC >=3D cpus in =
LLC),
we can stick with prev_cpu and not attempt to switch LLC.


> +	if (cpu < 0)
> +		return prev_cpu;
> +
> +
> +	if (static_branch_likely(&sched_numa_balancing) &&
> +	    __migrate_degrades_locality(p, prev_cpu, cpu, false) > 0) {
> +		/*
> +		 * XXX look for max occupancy inside prev_cpu's node
> +		 */
> +		return prev_cpu;
> +	}
> +
> +	return cpu;
> +}
> +#else
> +static int select_cache_cpu(struct task_struct *p, int prev_cpu)
> +{
> +	return prev_cpu;
> +}
> +#endif
> +
> +
>  /*
>   * select_task_rq_fair: Select target runqueue for the waking task in do=
mains
>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_W=
AKE,
> @@ -8588,6 +8854,8 @@ select_task_rq_fair(struct task_struct *p, int prev=
_cpu, int wake_flags)
>  	 * required for stable ->cpus_allowed
>  	 */
>  	lockdep_assert_held(&p->pi_lock);
> +	guard(rcu)();

Tim
