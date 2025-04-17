Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB31186E2E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909954; cv=none; b=FX44xJlUr86v54EG5pPATVVjzcPnlqe+zHh4SRMzC+DzleocoqVZ1rR1vauSmHi0EE3fdURgjOBJsHgn0GyfxofYBDOyXTBYJgabK/Hhv1870CAM69wsbilrO9/anBE3JzsRjCdBmJwH/SzdLmAfw4g+wuDoSD48VD2xR7GX1FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909954; c=relaxed/simple;
	bh=yepDkEMNSfA/4hXziP04dZ4nchDJ3KnrLw4+j/WRgys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RqywVRVLnGHm0Gd0KFVA9MAx98RNNzVMhuGTBFojb9dU5Ai9sjmYoUT8CAarS41U+lkniTL2QVspYMivSWSMvCeFJ78TrTtBjH97ePEy1+quIo1hbX57LNPYeJrar4uXHIF3dYtcMHniohVTCrMygznql+eICw5BrrDRVs3kCD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzItv2rp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzItv2rp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744909953; x=1776445953;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=yepDkEMNSfA/4hXziP04dZ4nchDJ3KnrLw4+j/WRgys=;
  b=VzItv2rpaAgngXOyW0LeikGDQqCF/yL+5y+LiNi11V3bSfq/Tu5LSepQ
   DZBYRFaiEG8Xh3kKJaqctG+MBuH5SrHbxbquzX7jM07xF+LuaTbSf8bdk
   FsJRLtZlVq3D6m1Yk7NADUjipUaRwLk88CvjbgSl0Xmv2wtTVB9q9LybK
   /LqfXYvE5QIJ2YDhJ/UdiZsMc4ltNmO+AkZfsFCRXSotavgv7S0vhkudO
   OafMVqukwhRuMyNvJDLgxJz9H42Q0nt8TjHBJorEIYnPcJvhTt++u5v98
   ib7TH1UMWGh/i79ncMxqAT0sxwb+6ir0GBa/Ydxitfyv7eDbCA3OBunKg
   A==;
X-CSE-ConnectionGUID: 3Cn9Lxp6S+atBeRxgepOmw==
X-CSE-MsgGUID: 3iZLt5fIRQmtZKYH3RISBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46406792"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46406792"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:12:32 -0700
X-CSE-ConnectionGUID: UESc+sx4RkiZtcjDCwf92A==
X-CSE-MsgGUID: 7kDqfIV9SFiV96Br0ktSvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130720021"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO [10.125.110.84]) ([10.125.110.84])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:12:31 -0700
Message-ID: <37f0813b205c49a8ab0e604fc1983f9f827b4454.camel@linux.intel.com>
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition
 if load balance is not due
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Doug Nelson
 <doug.nelson@intel.com>, Mohini Narkhede <mohini.narkhede@intel.com>, 
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo
 Molnar <mingo@kernel.org>, "Chen, Yu C" <yu.c.chen@intel.com>
Date: Thu, 17 Apr 2025 10:12:30 -0700
In-Reply-To: <82baaf6c-f3d9-4c3e-be69-24389eadb18c@linux.ibm.com>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
	 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
	 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
	 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
	 <23e05939e7a19151d9b17d011e48a85d650b4e8a.camel@linux.intel.com>
	 <82baaf6c-f3d9-4c3e-be69-24389eadb18c@linux.ibm.com>
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

On Thu, 2025-04-17 at 14:49 +0530, Shrikanth Hegde wrote:
>=20
> On 4/16/25 21:49, Tim Chen wrote:
> > On Wed, 2025-04-16 at 14:46 +0530, Shrikanth Hegde wrote:
> > >=20
>=20
> > >=20
> > You mean doing a should_we_balance() check?  I think we should not
> > even consider that if balance time is not due and this balance due chec=
k should
> > come first.
> >=20
> Hi Tim.
>=20
> This is the code I was suggesting.

Thanks for suggesting this alternative patch.

The way I read it, it moves the serialization check into sched_balance_rq()
so we do the serialization check after the balance due check.  Functionally
it is equivalent to my proposed patch.

However, I think your original goal is to get the CPU that could
actually balance the sched domain a chance to run in current balance period
and not get skipped over if current CPU cannot balance.
With your patch, if should_we_balance() failed, we
still advance sd->last_balance. So the CPU that could balance has to wait f=
or its
chance in the next period.  I think you'll need to pass the outcome of
should_we_balance() from sched_balance_rq() to sched_balance_domains(),
and not advance sd->last_balance when should_we_balance() failed.
This would allow the CPU that could balance a chance to run=C2=A0
in the current balance period.

That said, I'm not actually proposing that we do the above. For many large =
systems,
the overhead in balancing top domains is already high and increasing balanc=
e frequency is
not necessarily desirable.

Thanks.

Tim

>=20
> ---
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0c19459c8042..e712934973e7 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -11723,6 +11723,21 @@ static void update_lb_imbalance_stat(struct lb_e=
nv *env, struct sched_domain *sd
>                  break;
>          }
>   }
> +/*
> + * This flag serializes load-balancing passes over large domains
> + * (above the NODE topology level) - only one load-balancing instance
> + * may run at a time, to reduce overhead on very large systems with
> + * lots of CPUs and large NUMA distances.
> + *
> + * - Note that load-balancing passes triggered while another one
> + *   is executing are skipped and not re-tried.
> + *
> + * - Also note that this does not serialize rebalance_domains()
> + *   execution, as non-SD_SERIALIZE domains will still be
> + *   load-balanced in parallel.
> + */
> +static atomic_t sched_balance_running =3D ATOMIC_INIT(0);
> +
>  =20
>   /*
>    * Check this_cpu to ensure it is balanced within domain. Attempt to mo=
ve
> @@ -11738,6 +11753,7 @@ static int sched_balance_rq(int this_cpu, struct =
rq *this_rq,
>          struct rq *busiest;
>          struct rq_flags rf;
>          struct cpumask *cpus =3D this_cpu_cpumask_var_ptr(load_balance_m=
ask);
> +       int need_serialize =3D 0;
>          struct lb_env env =3D {
>                  .sd             =3D sd,
>                  .dst_cpu        =3D this_cpu,
> @@ -11760,6 +11776,12 @@ static int sched_balance_rq(int this_cpu, struct=
 rq *this_rq,
>                  goto out_balanced;
>          }
>  =20
> +       need_serialize =3D (idle!=3DCPU_NEWLY_IDLE) && sd->flags & SD_SER=
IALIZE;
> +       if (need_serialize) {
> +               if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
> +                       return ld_moved;
> +       }
> +
>          group =3D sched_balance_find_src_group(&env);
>          if (!group) {
>                  schedstat_inc(sd->lb_nobusyg[idle]);
> @@ -11884,6 +11906,8 @@ static int sched_balance_rq(int this_cpu, struct =
rq *this_rq,
>                          if (!cpumask_subset(cpus, env.dst_grpmask)) {
>                                  env.loop =3D 0;
>                                  env.loop_break =3D SCHED_NR_MIGRATE_BREA=
K;
> +                               if (need_serialize)
> +                                       atomic_set_release(&sched_balance=
_running, 0);
>                                  goto redo;
>                          }
>                          goto out_all_pinned;
> @@ -12000,6 +12024,9 @@ static int sched_balance_rq(int this_cpu, struct =
rq *this_rq,
>              sd->balance_interval < sd->max_interval)
>                  sd->balance_interval *=3D 2;
>   out:
> +       if (need_serialize)
> +               atomic_set_release(&sched_balance_running, 0);
> +
>          return ld_moved;
>   }
>  =20
> @@ -12124,21 +12151,6 @@ static int active_load_balance_cpu_stop(void *da=
ta)
>          return 0;
>   }
>  =20
> -/*
> - * This flag serializes load-balancing passes over large domains
> - * (above the NODE topology level) - only one load-balancing instance
> - * may run at a time, to reduce overhead on very large systems with
> - * lots of CPUs and large NUMA distances.
> - *
> - * - Note that load-balancing passes triggered while another one
> - *   is executing are skipped and not re-tried.
> - *
> - * - Also note that this does not serialize rebalance_domains()
> - *   execution, as non-SD_SERIALIZE domains will still be
> - *   load-balanced in parallel.
> - */
> -static atomic_t sched_balance_running =3D ATOMIC_INIT(0);
> -
>   /*
>    * Scale the max sched_balance_rq interval with the number of CPUs in t=
he system.
>    * This trades load-balance latency on larger machines for less cross t=
alk.
> @@ -12188,7 +12200,7 @@ static void sched_balance_domains(struct rq *rq, =
enum cpu_idle_type idle)
>          /* Earliest time when we have to do rebalance again */
>          unsigned long next_balance =3D jiffies + 60*HZ;
>          int update_next_balance =3D 0;
> -       int need_serialize, need_decay =3D 0;
> +       int need_decay =3D 0;
>          u64 max_cost =3D 0;
>  =20
>          rcu_read_lock();
> @@ -12213,12 +12225,6 @@ static void sched_balance_domains(struct rq *rq,=
 enum cpu_idle_type idle)
>  =20
>                  interval =3D get_sd_balance_interval(sd, busy);
>  =20
> -               need_serialize =3D sd->flags & SD_SERIALIZE;
> -               if (need_serialize) {
> -                       if (atomic_cmpxchg_acquire(&sched_balance_running=
, 0, 1))
> -                               goto out;
> -               }
> -
>                  if (time_after_eq(jiffies, sd->last_balance + interval))=
 {
>                          if (sched_balance_rq(cpu, rq, sd, idle, &continu=
e_balancing)) {
>                                  /*
> @@ -12232,9 +12238,7 @@ static void sched_balance_domains(struct rq *rq, =
enum cpu_idle_type idle)
>                          sd->last_balance =3D jiffies;
>                          interval =3D get_sd_balance_interval(sd, busy);
>                  }
> -               if (need_serialize)
> -                       atomic_set_release(&sched_balance_running, 0);
> -out:
> +
>                  if (time_after(next_balance, sd->last_balance + interval=
)) {
>                          next_balance =3D sd->last_balance + interval;
>                          update_next_balance =3D 1;
>=20

