Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA31487D1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749580291; cv=none; b=kna9o0jeRPswuL2gAPwr/Al7NRPvSCfpKBbwactTGnGytW6lmUXlki0sbMVCGukhx7azTZJ59F5KEKGUtU2Y3UM5fL0smYBFEVs8jk8gijE6HzMVc0Q1jf3oQ3VB4m2n3C6Qg1DFmvjSORxMmr8NdDegqkNnFQpYR2kW9oDp9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749580291; c=relaxed/simple;
	bh=E8XqcwdsNNWpw6uZ9YmZxqybI06IKcJfrKYJybCfHm8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DuFnKrDtyuhC4DnjGM3/YXMm1lAvxD9uFLAZpnLzlQsQ0poAHxl/A3VvRXtwU0Mq3LVVBSsclw1jjjezv6ntu/tzgQ+mRF1qS1lfJEVD6/cDBLW/QPKjdbcToN1rIQGM5s1nV19IxzPp84jLlKtQOom1V5Up7ysffRoD/Q7jLng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca; spf=pass smtp.mailfrom=gianis.ca; dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b=VxTa8r74; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gianis.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b="VxTa8r74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gianis.ca;
	s=protonmail; t=1749580284; x=1749839484;
	bh=AjYACY9r2SnXHCSGXldKUiuZBnOjF586F6MufeOrzL4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=VxTa8r74l2B+RhlcVjKr6A5ByP0zTLBnBHzaSC+AEd8utDgPFh65fL8fiuzWFAoeJ
	 BI0K+e6NlsDlq1NpCgZfAC3lbr7k+7yKNcC3FAu00vA6BbJTvjbjwzXIUXMVDKouPv
	 NvJX0eKVddAr5rNNtBBhBARne9KYxvRoqUXY2erpqiIO7YYDfHL8L2mTX6rMSzjUdA
	 CHm5M7pnflhyPXkjRmH/DbMmPMXYFKRfRDT0QfnwoZoMVNUZ7VAK1r9INLydKMlS4f
	 nsX4yc226TC7WBw+dICjpg2URLHV/Nzn0Pmeb3H/cYGVYT4iM/OORgfwFUX8kJrrZO
	 ReBFjWyY+T2Hw==
Date: Tue, 10 Jun 2025 18:31:17 +0000
To: Chris Hyser <chris.hyser@oracle.com>
From: Dhaval Giani <dhaval@gianis.ca>
Cc: Peter Zijlstra <peterz@infradead.org>, Mel Gorman <mgorman@techsingularity.net>, longman@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched/numa: Add ability to override task's numa_preferred_nid.
Message-ID: <aEh57Evd4WmrrvJx@fedora>
In-Reply-To: <20250415013625.3922497-1-chris.hyser@oracle.com>
References: <20250415013625.3922497-1-chris.hyser@oracle.com>
Feedback-ID: 128275035:user:proton
X-Pm-Message-ID: 90d4a2606a44807fb094d3a81946aa08cbd9fbad
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 09:35:51PM -0400, Chris Hyser wrote:
> From: chris hyser <chris.hyser@oracle.com>
>=20
> This patch allows directly setting and subsequent overriding of a task's
> "Preferred Node Affinity" by setting the task's numa_preferred_nid and
> relying on the existing NUMA balancing infrastructure.
>=20
> NUMA balancing introduced the notion of tracking and using a task's
> preferred memory node for both migrating/consolidating the physical pages
> accessed by a task and to assist the scheduler in making NUMA aware
> placement and load balancing decisions.
>=20
> The existing mechanism for determining this, Auto NUMA Balancing, relies
> on periodic removal of virtual mappings for blocks of a task's address
> space. The resulting faults can indicate a preference for an accessed
> node.
>=20
> This has two issues that this patch seeks to overcome:
>=20
> - there is a trade-off between faulting overhead and the ability to detec=
t
>   dynamic access patterns. In cases where the task or user understand the
>   NUMA sensitivities, this patch can enable the benefits of setting a
>   preferred node used either in conjunction with Auto NUMA Balancing's
>   default parameters or adjusting the NUMA balance parameters to reduce t=
he
>   faulting rate (potentially to 0).
>=20
> - memory pinned to nodes or to physical addresses such as RDMA cannot be
>   migrated and have thus far been excluded from the scanning. Not taking
>   those faults however can prevent Auto NUMA Balancing from reliably
>   detecting a node preference with the scheduler load balancer then
>   possibly operating with incorrect NUMA information.
>=20
> The following results were from TPCC runs on an Oracle Database. The syst=
em
> was a 2-node Intel machine with a database running on each node with loca=
l
> memory allocations. No tasks or memory were pinned.
>=20
> There are four scenarios of interest:
>=20
> - Auto NUMA Balancing OFF.
>     base value
>=20
> - Auto NUMA Balancing ON.
>     1.2% - ANB ON better than ANB OFF.
>=20
> - Use the prctl(), ANB ON, parameters set to prevent faulting.
>     2.4% - prctl() better then ANB OFF.
>     1.2% - prctl() better than ANB ON.
>=20
> - Use the prctl(), ANB parameters normal.
>     3.1% - prctl() and ANB ON better than ANB OFF.
>     1.9% - prctl() and ANB ON better than just ANB ON.
>     0.7% - prctl() and ANB ON better than prctl() and ANB ON/faulting off
>=20
> In benchmarks pinning large regions of heavily accessed memory, the
> advantages of the prctl() over Auto NUMA Balancing alone is significantly
> higher.
>=20
> Signed-off-by: Chris Hyser <chris.hyser@oracle.com>
> ---
>  include/linux/sched.h |  1 +
>  init/init_task.c      |  1 +
>  kernel/sched/core.c   |  5 ++++-
>  kernel/sched/debug.c  |  1 +
>  kernel/sched/fair.c   | 15 +++++++++++++--
>  5 files changed, 20 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index f96ac1982893..373046c82b35 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1350,6 +1350,7 @@ struct task_struct {
>  =09short=09=09=09=09pref_node_fork;
>  #endif
>  #ifdef CONFIG_NUMA_BALANCING
> +=09int=09=09=09=09numa_preferred_nid_force;
>  =09int=09=09=09=09numa_scan_seq;
>  =09unsigned int=09=09=09numa_scan_period;
>  =09unsigned int=09=09=09numa_scan_period_max;
> diff --git a/init/init_task.c b/init/init_task.c
> index e557f622bd90..1921a87326db 100644
> --- a/init/init_task.c
> +++ b/init/init_task.c
> @@ -184,6 +184,7 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES=
) =3D {
>  =09.vtime.state=09=3D VTIME_SYS,
>  #endif
>  #ifdef CONFIG_NUMA_BALANCING
> +=09.numa_preferred_nid_force =3D NUMA_NO_NODE,
>  =09.numa_preferred_nid =3D NUMA_NO_NODE,
>  =09.numa_group=09=3D NULL,
>  =09.numa_faults=09=3D NULL,
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 79692f85643f..7d1532f35d15 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7980,7 +7980,10 @@ void sched_setnuma(struct task_struct *p, int nid)
>  =09if (running)
>  =09=09put_prev_task(rq, p);
>=20
> -=09p->numa_preferred_nid =3D nid;
> +=09if (p->numa_preferred_nid_force !=3D NUMA_NO_NODE)
> +=09=09p->numa_preferred_nid =3D p->numa_preferred_nid_force;
> +=09else
> +=09=09p->numa_preferred_nid =3D nid;
>=20
>  =09if (queued)
>  =09=09enqueue_task(rq, p, ENQUEUE_RESTORE | ENQUEUE_NOCLOCK);
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 56ae54e0ce6a..4cba21f5d24d 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -1154,6 +1154,7 @@ static void sched_show_numa(struct task_struct *p, =
struct seq_file *m)
>  =09=09P(mm->numa_scan_seq);
>=20
>  =09P(numa_pages_migrated);
> +=09P(numa_preferred_nid_force);
>  =09P(numa_preferred_nid);
>  =09P(total_numa_faults);
>  =09SEQ_printf(m, "current_node=3D%d, numa_group_id=3D%d\n",
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0c19459c8042..79d3d0840fb2 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -2642,9 +2642,15 @@ static void numa_migrate_preferred(struct task_str=
uct *p)
>  =09unsigned long interval =3D HZ;
>=20
>  =09/* This task has no NUMA fault statistics yet */
> -=09if (unlikely(p->numa_preferred_nid =3D=3D NUMA_NO_NODE || !p->numa_fa=
ults))
> +=09if (unlikely(p->numa_preferred_nid =3D=3D NUMA_NO_NODE))
>  =09=09return;
>=20
> +=09/* Execute rest of function if forced PNID */

This comment had me confused, expecially since you check for
NUMA_NO_NODE and exit right after. Move it to after please.

> +=09if (p->numa_preferred_nid_force =3D=3D NUMA_NO_NODE) {
> +=09=09if (unlikely(!p->numa_faults))
> +=09=09=09return;
> +=09}
> +

I am in two minds with this one here -> Why the unlikely for
p->numa_faults, and can we just make it one single if function?

>  =09/* Periodically retry migrating the task to the preferred node */
>  =09interval =3D min(interval, msecs_to_jiffies(p->numa_scan_period) / 16=
);
>  =09p->numa_migrate_retry =3D jiffies + interval;
> @@ -3578,6 +3584,7 @@ void init_numa_balancing(unsigned long clone_flags,=
 struct task_struct *p)
>=20
>  =09/* New address space, reset the preferred nid */
>  =09if (!(clone_flags & CLONE_VM)) {
> +=09=09p->numa_preferred_nid_force =3D NUMA_NO_NODE;
>  =09=09p->numa_preferred_nid =3D NUMA_NO_NODE;
>  =09=09return;
>  =09}
> @@ -9301,7 +9308,11 @@ static long migrate_degrades_locality(struct task_=
struct *p, struct lb_env *env)
>  =09if (!static_branch_likely(&sched_numa_balancing))
>  =09=09return 0;
>=20
> -=09if (!p->numa_faults || !(env->sd->flags & SD_NUMA))
> +=09/* Execute rest of function if forced PNID */

Same here.

> +=09if (p->numa_preferred_nid_force =3D=3D NUMA_NO_NODE && !p->numa_fault=
s)
> +=09=09return 0;
> +
> +=09if (!(env->sd->flags & SD_NUMA))
>  =09=09return 0;
>=20
>  =09src_nid =3D cpu_to_node(env->src_cpu);
> --
> 2.43.5
>=20
>=20

