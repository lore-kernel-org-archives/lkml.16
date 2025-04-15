Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4582DFA35
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684274; cv=none; b=crfxhNiY5hRUtyQPOw9SW4wMII2+5xcjFAaD3lbscAunDh74NP4pLWTopvoZ31AYWPtKerls84jlHOmWoLOGv18EB7kbjkHFgvb9VpAiBYvdK7bU70MoAbnsw0gflx27JzkmmtdGGrYd8RWVRupXhdpyNvuTfjLuQJOlC1+XCHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684274; c=relaxed/simple;
	bh=jlRaUSyoA2x8akbc5CpkfmG2iDOTqkDrqJEj0XHGL5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCBleFmsAf8n7aARy+kuZ/aWnD+lRliqvpF0pyvdOMlJTBYaI2wzQX7zOMKqI4rohkLyLf7+6RRhbfXteKyxir0I2QN2RCZ1205eunju3gn6RhNrBSKE/FtRTy6WLST/pcoxtUdao9TGWgwPoBWOcVgf6SoVxbuUPTN0EYSlPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjpV17Nc; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjpV17Nc"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47692b9d059so64954761cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744684272; x=1745289072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSwcevQfUAvzE+NnPd3NbYhzRMEdWLZ6xP4QF7+m9eg=;
        b=OjpV17NcdEJEGQ5KOGKvzFjCcCETH78G1/8ABfSb1XwlBl2mIrE+dJpjIkv8FmXv8x
         LrQdczS4lS33dwFGj6LQBLR3WNDKY3/HNOH8SrupLFHIuIrO7xL9PcFQUAAIvBRCTpX+
         EaEwqFAYXVTX2NtMKWSochCcTCcxEyEuCp4ovMqDHC/sRUG1qg8s3tS2H0IP6C0X9IXx
         rBDrxxD7DJ81hxGC5EcHvfCYlUD6oyyfmXCEnoG9XExaujpgFmkFD417XswvJHzuiZbs
         oAqtM1Kkar31i/6b6gvRbp1nTLu/XISYddpcT5h4wvx30JNfTFvXsRACgUbAAkvHijt+
         sWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744684272; x=1745289072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSwcevQfUAvzE+NnPd3NbYhzRMEdWLZ6xP4QF7+m9eg=;
        b=ifTojwELFhUXcMU0OKTbDVP6RqpZBPNoT7S4ZaVVazY5Uj1ixGXA2X9D5k9RJgN7iD
         XGF0FssHzsaR5qsRcpbZcXTzJpHX2lqsLyRhHglsNANcWwCPmTpcKyRaoiQeRFTe8JPi
         eqCOgjq+YcDftlhyF2XtoSaFqu7jkeg3gtbHz6o3vTPTPfY/Xcs5Ts9oxlOkcUb8llQa
         2EbXpHWn5E/1CnGsCX5m5o9/mqYlYbFJWxQDcmQdkQUMJ4c9fSfW8fMnGyE5Cekeay1B
         lOeBMELcvIjzyhjDXIzczKkkVMuBJsN8nZ/Ay7j7FUiAkjxDKJL6aiZVWZuhy7Q/SAsC
         TJ3A==
X-Forwarded-Encrypted: i=1; AJvYcCWdevzTn5P39JH2oKI2g5w1oms0exvYi/V5LJsZCPCxcYFt0zlheFMctjZ8X11FeF+AZPNPzGsDSbRz+JY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx77IVQOricp+Tlx9FSBks0+Ausf+yuth560e1Yn4nHDyVQDhKQ
	OHumBvjGBVyBzP1KKgu9Txp0WTB0JySPj1owK6yNjiCdN+ytNRp7r8vHL97sFeCOV+3IbjCwArU
	+tsJ+6+RNUxMRwUrLfRybwFqlwZU=
X-Gm-Gg: ASbGncsj5gF+40LNgH5l0PoTWGlUEXLICwA68O02PY9EzudXLuN/l68Pz/vkQIILjCW
	kCo9EisU7ejvHEQqEOr04DsKtfkh+nd4CJksA8s/Ar9RZboNVgeSt+JjVde/V5T93CCn8UVxabS
	Wpcylbb0aifoWCuOf2LdxfF7I=
X-Google-Smtp-Source: AGHT+IExUupEZwJlEuRg9QSet4SFdWLHOKbA3vWndRsqC7a29kf7DpTxZwdB2+g4ew0kefdIbLUmnBVtYUcakcOSP5k=
X-Received: by 2002:a05:622a:60f:b0:477:d00:b43e with SMTP id
 d75a77b69052e-479775d31e9mr267638421cf.38.1744684271610; Mon, 14 Apr 2025
 19:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302210539.1563190-1-vincent.guittot@linaro.org> <20250302210539.1563190-6-vincent.guittot@linaro.org>
In-Reply-To: <20250302210539.1563190-6-vincent.guittot@linaro.org>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Tue, 15 Apr 2025 10:31:00 +0800
X-Gm-Features: ATxdqUEbqdk6M9ljJZQ1x0A_5V2Cam4CLlmhADiHVapkFeSM2IX7n0Kxw659Mbo
Message-ID: <CAB8ipk-MgPPptz36W0zYx3TGiESyMwoY3Xoh8xw+zubPSJsZMg@mail.gmail.com>
Subject: Re: [PATCH 5/7 v5] sched/fair: Add push task mechanism for EAS
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, lukasz.luba@arm.com, 
	rafael.j.wysocki@intel.com, pierre.gondois@arm.com, 
	linux-kernel@vger.kernel.org, qyousef@layalina.io, hongyan.xia2@arm.com, 
	christian.loehle@arm.com, luis.machado@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

On Mon, Mar 3, 2025 at 5:06=E2=80=AFAM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> EAS is based on wakeup events to efficiently place tasks on the system, b=
ut
> there are cases where a task doesn't have wakeup events anymore or at a f=
ar
> too low pace. For such situation, we can take advantage of the task being
> put back in the enqueued list to check if it should be pushed on another
> CPU. When the task is alone on the CPU, it's never put back in the enqueu=
ed
> list; In this special case, we use the tick to run the check.
>
> Wake up events remain the main way to migrate tasks but we now detect
> situation where a task is stuck on a CPU by checking that its utilization
> is larger than the max available compute capacity (max cpu capacity or
> uclamp max setting)
>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/fair.c  | 220 +++++++++++++++++++++++++++++++++++++++++++
>  kernel/sched/sched.h |   2 +
>  2 files changed, 222 insertions(+)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index a9b97bbc085f..c3e383b86808 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7051,6 +7051,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct=
 *p, int flags)
>         hrtick_update(rq);
>  }
>
> +static void fair_remove_pushable_task(struct rq *rq, struct task_struct =
*p);
>  static void set_next_buddy(struct sched_entity *se);
>
>  /*
> @@ -7081,6 +7082,8 @@ static int dequeue_entities(struct rq *rq, struct s=
ched_entity *se, int flags)
>                 h_nr_idle =3D task_has_idle_policy(p);
>                 if (task_sleep || task_delayed || !se->sched_delayed)
>                         h_nr_runnable =3D 1;
> +
> +               fair_remove_pushable_task(rq, p);
>         } else {
>                 cfs_rq =3D group_cfs_rq(se);
>                 slice =3D cfs_rq_min_slice(cfs_rq);
> @@ -8589,6 +8592,197 @@ static int find_energy_efficient_cpu(struct task_=
struct *p, int prev_cpu)
>         return target;
>  }
>
> +static inline bool task_stuck_on_cpu(struct task_struct *p, int cpu)
> +{
> +       unsigned long max_capa, util;
> +
> +       max_capa =3D min(get_actual_cpu_capacity(cpu),
> +                      uclamp_eff_value(p, UCLAMP_MAX));
> +       util =3D max(task_util_est(p), task_runnable(p));
> +
> +       /*
> +        * Return true only if the task might not sleep/wakeup because of=
 a low
> +        * compute capacity. Tasks, which wake up regularly, will be hand=
led by
> +        * feec().
> +        */
I am carefully studying this series of patches. I have some doubts
about this part.

Need we check the state?
READ_ONCE(p->__state) !=3D TASK_RUNNING;
Because the tick will check it.

On the other hand, need we check the sched_delayed?
Because it also checks it in put_prev_task_fair().

Thanks!

> +       return (util > max_capa);
> +}
> +
> +static inline bool sched_energy_push_task(struct task_struct *p, struct =
rq *rq)
> +{
> +       if (p->nr_cpus_allowed =3D=3D 1)
> +               return false;
> +
> +       if (is_rd_overutilized(rq->rd))
> +               return false;
> +
> +       if (task_stuck_on_cpu(p, cpu_of(rq)))
> +               return true;
> +
> +       return false;
> +}
> +
> +static int active_load_balance_cpu_stop(void *data);
> +
> +static inline void check_pushable_task(struct task_struct *p, struct rq =
*rq)
> +{
> +       int new_cpu, cpu =3D cpu_of(rq);
> +
> +       if (!sched_energy_enabled())
> +               return;
> +
> +       if (WARN_ON(!p))
> +               return;
> +
> +       if (WARN_ON(!task_current(rq, p)))
> +               return;
> +
> +       if (is_migration_disabled(p))
> +               return;
> +
> +       /* If there are several task, wait for being put back */
> +       if (rq->nr_running > 1)
> +               return;
> +
> +       if (!sched_energy_push_task(p, rq))
> +               return;
> +
> +       new_cpu =3D find_energy_efficient_cpu(p, cpu);
> +
> +       if (new_cpu =3D=3D cpu)
> +               return;
> +
> +       /*
> +        * ->active_balance synchronizes accesses to
> +        * ->active_balance_work.  Once set, it's cleared
> +        * only after active load balance is finished.
> +        */
> +       if (!rq->active_balance) {
> +               rq->active_balance =3D 1;
> +               rq->push_cpu =3D new_cpu;
> +       } else
> +               return;
> +
> +       raw_spin_rq_unlock(rq);
> +       stop_one_cpu_nowait(cpu,
> +               active_load_balance_cpu_stop, rq,
> +               &rq->active_balance_work);
> +       raw_spin_rq_lock(rq);
> +}
> +
> +static inline int has_pushable_tasks(struct rq *rq)
> +{
> +       return !plist_head_empty(&rq->cfs.pushable_tasks);
> +}
> +
> +static struct task_struct *pick_next_pushable_fair_task(struct rq *rq)
> +{
> +       struct task_struct *p;
> +
> +       if (!has_pushable_tasks(rq))
> +               return NULL;
> +
> +       p =3D plist_first_entry(&rq->cfs.pushable_tasks,
> +                             struct task_struct, pushable_tasks);
> +
> +       WARN_ON_ONCE(rq->cpu !=3D task_cpu(p));
> +       WARN_ON_ONCE(task_current(rq, p));
> +       WARN_ON_ONCE(p->nr_cpus_allowed <=3D 1);
> +       WARN_ON_ONCE(!task_on_rq_queued(p));
> +
> +       /*
> +        * Remove task from the pushable list as we try only once after t=
hat
> +        * the task has been put back in enqueued list.
> +        */
> +       plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> +
> +       return p;
> +}
> +
> +/*
> + * See if the non running fair tasks on this rq can be sent on other CPU=
s
> + * that fits better with their profile.
> + */
> +static bool push_fair_task(struct rq *rq)
> +{
> +       struct task_struct *next_task;
> +       int prev_cpu, new_cpu;
> +       struct rq *new_rq;
> +
> +       next_task =3D pick_next_pushable_fair_task(rq);
> +       if (!next_task)
> +               return false;
> +
> +       if (is_migration_disabled(next_task))
> +               return true;
> +
> +       /* We might release rq lock */
> +       get_task_struct(next_task);
> +
> +       prev_cpu =3D rq->cpu;
> +
> +       new_cpu =3D find_energy_efficient_cpu(next_task, prev_cpu);
> +
> +       if (new_cpu =3D=3D prev_cpu)
> +               goto out;
> +
> +       new_rq =3D cpu_rq(new_cpu);
> +
> +       if (double_lock_balance(rq, new_rq)) {
> +               /* The task has already migrated in between */
> +               if (task_cpu(next_task) !=3D rq->cpu) {
> +                       double_unlock_balance(rq, new_rq);
> +                       goto out;
> +               }
> +
> +               deactivate_task(rq, next_task, 0);
> +               set_task_cpu(next_task, new_cpu);
> +               activate_task(new_rq, next_task, 0);
> +
> +               resched_curr(new_rq);
> +
> +               double_unlock_balance(rq, new_rq);
> +       }
> +
> +out:
> +       put_task_struct(next_task);
> +
> +       return true;
> +}
> +
> +static void push_fair_tasks(struct rq *rq)
> +{
> +       /* push_fair_task() will return true if it moved a fair task */
> +       while (push_fair_task(rq))
> +               ;
> +}
> +
> +static DEFINE_PER_CPU(struct balance_callback, fair_push_head);
> +
> +static inline void fair_queue_pushable_tasks(struct rq *rq)
> +{
> +       if (!sched_energy_enabled() || !has_pushable_tasks(rq))
> +               return;
> +
> +       queue_balance_callback(rq, &per_cpu(fair_push_head, rq->cpu), pus=
h_fair_tasks);
> +}
> +static void fair_remove_pushable_task(struct rq *rq, struct task_struct =
*p)
> +{
> +       if (sched_energy_enabled())
> +               plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> +}
> +
> +static void fair_add_pushable_task(struct rq *rq, struct task_struct *p)
> +{
> +       if (sched_energy_enabled() && task_on_rq_queued(p) && !p->se.sche=
d_delayed) {
> +               if (sched_energy_push_task(p, rq)) {
> +                       plist_del(&p->pushable_tasks, &rq->cfs.pushable_t=
asks);
> +                       plist_node_init(&p->pushable_tasks, p->prio);
> +                       plist_add(&p->pushable_tasks, &rq->cfs.pushable_t=
asks);
> +               }
> +       }
> +}
> +
>  /*
>   * select_task_rq_fair: Select target runqueue for the waking task in do=
mains
>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_W=
AKE,
> @@ -8758,6 +8952,10 @@ balance_fair(struct rq *rq, struct task_struct *pr=
ev, struct rq_flags *rf)
>         return sched_balance_newidle(rq, rf) !=3D 0;
>  }
>  #else
> +static inline void check_pushable_task(struct task_struct *p, struct rq =
*rq) {}
> +static inline void fair_queue_pushable_tasks(struct rq *rq) {}
> +static void fair_remove_pushable_task(struct rq *rq, struct task_struct =
*p) {}
> +static inline void fair_add_pushable_task(struct rq *rq, struct task_str=
uct *p) {}
>  static inline void set_task_max_allowed_capacity(struct task_struct *p) =
{}
>  #endif /* CONFIG_SMP */
>
> @@ -8947,6 +9145,12 @@ pick_next_task_fair(struct rq *rq, struct task_str=
uct *prev, struct rq_flags *rf
>                 put_prev_entity(cfs_rq, pse);
>                 set_next_entity(cfs_rq, se);
>
> +               /*
> +                * The previous task might be eligible for being pushed o=
n
> +                * another cpu if it is still active.
> +                */
> +               fair_add_pushable_task(rq, prev);
> +
>                 __set_next_task_fair(rq, p, true);
>         }
>
> @@ -9019,6 +9223,13 @@ static void put_prev_task_fair(struct rq *rq, stru=
ct task_struct *prev, struct t
>                 cfs_rq =3D cfs_rq_of(se);
>                 put_prev_entity(cfs_rq, se);
>         }
> +
> +       /*
> +        * The previous task might be eligible for being pushed on anothe=
r cpu
> +        * if it is still active.
> +        */
> +       fair_add_pushable_task(rq, prev);
> +
>  }
>
>  /*
> @@ -13151,6 +13362,7 @@ static void task_tick_fair(struct rq *rq, struct =
task_struct *curr, int queued)
>         if (static_branch_unlikely(&sched_numa_balancing))
>                 task_tick_numa(rq, curr);
>
> +       check_pushable_task(curr, rq);
>         update_misfit_status(curr, rq);
>         check_update_overutilized_status(task_rq(curr));
>
> @@ -13303,6 +13515,8 @@ static void __set_next_task_fair(struct rq *rq, s=
truct task_struct *p, bool firs
>  {
>         struct sched_entity *se =3D &p->se;
>
> +       fair_remove_pushable_task(rq, p);
> +
>  #ifdef CONFIG_SMP
>         if (task_on_rq_queued(p)) {
>                 /*
> @@ -13320,6 +13534,11 @@ static void __set_next_task_fair(struct rq *rq, =
struct task_struct *p, bool firs
>         if (hrtick_enabled_fair(rq))
>                 hrtick_start_fair(rq, p);
>
> +       /*
> +        * Try to push prev task before checking misfit for next task as
> +        * the migration of prev can make next fitting the CPU
> +        */
> +       fair_queue_pushable_tasks(rq);
>         update_misfit_status(p, rq);
>         sched_fair_update_stop_tick(rq, p);
>  }
> @@ -13350,6 +13569,7 @@ void init_cfs_rq(struct cfs_rq *cfs_rq)
>         cfs_rq->tasks_timeline =3D RB_ROOT_CACHED;
>         cfs_rq->min_vruntime =3D (u64)(-(1LL << 20));
>  #ifdef CONFIG_SMP
> +       plist_head_init(&cfs_rq->pushable_tasks);
>         raw_spin_lock_init(&cfs_rq->removed.lock);
>  #endif
>  }
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index ab16d3d0e51c..2db198dccf21 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -722,6 +722,8 @@ struct cfs_rq {
>         struct list_head        leaf_cfs_rq_list;
>         struct task_group       *tg;    /* group that "owns" this runqueu=
e */
>
> +       struct plist_head       pushable_tasks;
> +
>         /* Locally cached copy of our task_group's idle value */
>         int                     idle;
>
> --
> 2.43.0
>
>
