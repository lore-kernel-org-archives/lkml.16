Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77D116EB7C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725117; cv=none; b=r5dl2NJ2VdJJS/Wlw0ZbHNUFjJXYL+Damrftn3O0JouPtR762NhpnOjnir8Mn6D8zCHfA3/x/ah3RKir32sQ5FYaGlm0ZwQfI9EJH1EBFuBxqzZ+RsQ+jH1OVhAE65a58i2hOoL8fMDndJlzNlydlU7/kOp57bAYXtON0rhKN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725117; c=relaxed/simple;
	bh=47nWaL/vbOuO5xSAKBYoWdiQuuAxJbO5iOt5lZtg5lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V88iYnEJKBWCG2MqXaqXAvsyUrdB4tBFFb1FOBxsNUVNayy1RW9Tvqomaxp9DYN3x36+zVGUiFpeAJDE/cEUFcJGNyR0LB5MYgU5ra2JtdjzGgfOE3U1R2MzKUCd4a+TXSRaRuyZWq9W1mIGrYrI4FFv6eOT+4RprkudDrW1QRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c3TijjyV; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c3TijjyV"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaecf50578eso986827466b.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725114; x=1745329914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFWUawCocwYZ/e2S2TO6qXQbu9zlCC1/2CHpiFfPI7c=;
        b=c3TijjyVvAMhdQU6zGuNfmy1R+qvFbn7LWJR2rbkNHs9rOqbC4cFXMZuSzPzTGJlh3
         wWNQLIpz54JcVU/fwpXZvsUQDrAYtVp1pfvXOyVRt2I0jzHN9aGgoy3+Q2Tu7xmJmBLd
         4KgOm8V7LoQo1pBPmIMg+Uvxqe4sdsK8VhZoPurAmyxqLmx3MzaAq0NqNANKfe8Btl8R
         53PhwpoWOyLvEJ2ABxRKhFOA0evXQqaBJ2NI08oJuK6e8NN3VL+wpH9wC280JKzQZv8h
         cZHjUtdZR37AGI/wnuWS1DV8x0bHzWgw0FwwF+e3YCYH0DYx0G0JJCyEiEQgMcHcq7A7
         JWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725114; x=1745329914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFWUawCocwYZ/e2S2TO6qXQbu9zlCC1/2CHpiFfPI7c=;
        b=F1BJSoDcWXPkCddKv0EOTeGrLym8hM3zdRkeSCRMhyC22R/bmnF+laAGdn/h0WWArI
         ORj+ZZpWxAxZV00NqW+pjp0zTFr+JLTPTJh8mzxAVGtTjzRBYRC18MDLzsY9aeJTdcUG
         MUQrM7lgeNR0o03lU13UYdABj7PFL1sF7b8o9ovIr+BncITgGB32KYHsMoFFHROmu1Rd
         kgl2DmTWjBWlvsUqEmjxZ3GjKhTzrQyh5/6jCiAsuiDrTzILi8lpCsuFLTBJVcCEyGDY
         Ih+Lmn6heffWHPRisHq33Hu5yedpV7BLi6OsnxWBOyf1ii3FEQZ6SDZ2t7bmpmIofgOU
         BZxw==
X-Forwarded-Encrypted: i=1; AJvYcCVE/E4GpORhdUzjHAUBfkqB5AZGufCXmlXhyMZtrWpNS9Agx0uUg3V6G1skrw7LOlBJ/oIT1L58itwpOjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXOpoXojmmp3RjQ/K6yoipqMaK4zEhQN3dUbbkDjle0WYjHsmS
	cZhQElj0p4M+qHJ8fdeNldirLHRGKVJwKQCKknmm83hHw6Fj4BYKbVdJR4ZJ0JnzW2qpn3xi1Gm
	vWVqI45QxDYuGbS1STqpwX7tUHmQxjSGqVU9Kgw==
X-Gm-Gg: ASbGnctfUisxNMAvea6OfNwGTFss6jyeNy5GoPBYjOFcmBtVToe+Nss/h72L/7DldQI
	K5T7lB81qmTogNnZFjluYejmxazoPzhwHtBF+Zb7eAgoXK/aJsL+Rhw4htY0ZIzpJ4Go0vCB9uv
	/16uXxjAxRBHcc1XxJiqooqUYJ9dnG/a0jTLj7X8sm0deLhT63zopnlezjsMzDFw==
X-Google-Smtp-Source: AGHT+IFfo2F3FIDea0CR9KzbIeJCB1p9UTsvMuHYhYxysX0XzOJM0h1wK0PUI4CNzHxmcoAWmQPinQFLdDhQg3snkyY=
X-Received: by 2002:a17:907:1b02:b0:ac3:8516:9cf2 with SMTP id
 a640c23a62f3a-acad36d7628mr1525013266b.55.1744725114035; Tue, 15 Apr 2025
 06:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302210539.1563190-1-vincent.guittot@linaro.org>
 <20250302210539.1563190-6-vincent.guittot@linaro.org> <CAB8ipk-MgPPptz36W0zYx3TGiESyMwoY3Xoh8xw+zubPSJsZMg@mail.gmail.com>
In-Reply-To: <CAB8ipk-MgPPptz36W0zYx3TGiESyMwoY3Xoh8xw+zubPSJsZMg@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 15 Apr 2025 15:51:42 +0200
X-Gm-Features: ATxdqUEmiqwN_nK7-0HVeDZZIyuXdXL3K2J0bsEZSrVNgrEaXTEvb25MUcBSFvI
Message-ID: <CAKfTPtAbz1mBxgMdPH+FZesX0hVnmYCdapygaZY19DH1O8LJ5g@mail.gmail.com>
Subject: Re: [PATCH 5/7 v5] sched/fair: Add push task mechanism for EAS
To: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, lukasz.luba@arm.com, 
	rafael.j.wysocki@intel.com, pierre.gondois@arm.com, 
	linux-kernel@vger.kernel.org, qyousef@layalina.io, hongyan.xia2@arm.com, 
	christian.loehle@arm.com, luis.machado@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Apr 2025 at 04:31, Xuewen Yan <xuewen.yan94@gmail.com> wrote:
>
> Hi Vincent,
>
> On Mon, Mar 3, 2025 at 5:06=E2=80=AFAM Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > EAS is based on wakeup events to efficiently place tasks on the system,=
 but
> > there are cases where a task doesn't have wakeup events anymore or at a=
 far
> > too low pace. For such situation, we can take advantage of the task bei=
ng
> > put back in the enqueued list to check if it should be pushed on anothe=
r
> > CPU. When the task is alone on the CPU, it's never put back in the enqu=
eued
> > list; In this special case, we use the tick to run the check.
> >
> > Wake up events remain the main way to migrate tasks but we now detect
> > situation where a task is stuck on a CPU by checking that its utilizati=
on
> > is larger than the max available compute capacity (max cpu capacity or
> > uclamp max setting)
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c  | 220 +++++++++++++++++++++++++++++++++++++++++++
> >  kernel/sched/sched.h |   2 +
> >  2 files changed, 222 insertions(+)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index a9b97bbc085f..c3e383b86808 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -7051,6 +7051,7 @@ enqueue_task_fair(struct rq *rq, struct task_stru=
ct *p, int flags)
> >         hrtick_update(rq);
> >  }
> >
> > +static void fair_remove_pushable_task(struct rq *rq, struct task_struc=
t *p);
> >  static void set_next_buddy(struct sched_entity *se);
> >
> >  /*
> > @@ -7081,6 +7082,8 @@ static int dequeue_entities(struct rq *rq, struct=
 sched_entity *se, int flags)
> >                 h_nr_idle =3D task_has_idle_policy(p);
> >                 if (task_sleep || task_delayed || !se->sched_delayed)
> >                         h_nr_runnable =3D 1;
> > +
> > +               fair_remove_pushable_task(rq, p);
> >         } else {
> >                 cfs_rq =3D group_cfs_rq(se);
> >                 slice =3D cfs_rq_min_slice(cfs_rq);
> > @@ -8589,6 +8592,197 @@ static int find_energy_efficient_cpu(struct tas=
k_struct *p, int prev_cpu)
> >         return target;
> >  }
> >
> > +static inline bool task_stuck_on_cpu(struct task_struct *p, int cpu)
> > +{
> > +       unsigned long max_capa, util;
> > +
> > +       max_capa =3D min(get_actual_cpu_capacity(cpu),
> > +                      uclamp_eff_value(p, UCLAMP_MAX));
> > +       util =3D max(task_util_est(p), task_runnable(p));
> > +
> > +       /*
> > +        * Return true only if the task might not sleep/wakeup because =
of a low
> > +        * compute capacity. Tasks, which wake up regularly, will be ha=
ndled by
> > +        * feec().
> > +        */
> I am carefully studying this series of patches. I have some doubts
> about this part.
>
> Need we check the state?
> READ_ONCE(p->__state) !=3D TASK_RUNNING;
> Because the tick will check it.
>
> On the other hand, need we check the sched_delayed?
> Because it also checks it in put_prev_task_fair().

In the case of tick, the task is the current task and the only one running


>
> Thanks!
>
> > +       return (util > max_capa);
> > +}
> > +
> > +static inline bool sched_energy_push_task(struct task_struct *p, struc=
t rq *rq)
> > +{
> > +       if (p->nr_cpus_allowed =3D=3D 1)
> > +               return false;
> > +
> > +       if (is_rd_overutilized(rq->rd))
> > +               return false;
> > +
> > +       if (task_stuck_on_cpu(p, cpu_of(rq)))
> > +               return true;
> > +
> > +       return false;
> > +}
> > +
> > +static int active_load_balance_cpu_stop(void *data);
> > +
> > +static inline void check_pushable_task(struct task_struct *p, struct r=
q *rq)
> > +{
> > +       int new_cpu, cpu =3D cpu_of(rq);
> > +
> > +       if (!sched_energy_enabled())
> > +               return;
> > +
> > +       if (WARN_ON(!p))
> > +               return;
> > +
> > +       if (WARN_ON(!task_current(rq, p)))
> > +               return;
> > +
> > +       if (is_migration_disabled(p))
> > +               return;
> > +
> > +       /* If there are several task, wait for being put back */
> > +       if (rq->nr_running > 1)
> > +               return;
> > +
> > +       if (!sched_energy_push_task(p, rq))
> > +               return;
> > +
> > +       new_cpu =3D find_energy_efficient_cpu(p, cpu);
> > +
> > +       if (new_cpu =3D=3D cpu)
> > +               return;
> > +
> > +       /*
> > +        * ->active_balance synchronizes accesses to
> > +        * ->active_balance_work.  Once set, it's cleared
> > +        * only after active load balance is finished.
> > +        */
> > +       if (!rq->active_balance) {
> > +               rq->active_balance =3D 1;
> > +               rq->push_cpu =3D new_cpu;
> > +       } else
> > +               return;
> > +
> > +       raw_spin_rq_unlock(rq);
> > +       stop_one_cpu_nowait(cpu,
> > +               active_load_balance_cpu_stop, rq,
> > +               &rq->active_balance_work);
> > +       raw_spin_rq_lock(rq);
> > +}
> > +
> > +static inline int has_pushable_tasks(struct rq *rq)
> > +{
> > +       return !plist_head_empty(&rq->cfs.pushable_tasks);
> > +}
> > +
> > +static struct task_struct *pick_next_pushable_fair_task(struct rq *rq)
> > +{
> > +       struct task_struct *p;
> > +
> > +       if (!has_pushable_tasks(rq))
> > +               return NULL;
> > +
> > +       p =3D plist_first_entry(&rq->cfs.pushable_tasks,
> > +                             struct task_struct, pushable_tasks);
> > +
> > +       WARN_ON_ONCE(rq->cpu !=3D task_cpu(p));
> > +       WARN_ON_ONCE(task_current(rq, p));
> > +       WARN_ON_ONCE(p->nr_cpus_allowed <=3D 1);
> > +       WARN_ON_ONCE(!task_on_rq_queued(p));
> > +
> > +       /*
> > +        * Remove task from the pushable list as we try only once after=
 that
> > +        * the task has been put back in enqueued list.
> > +        */
> > +       plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> > +
> > +       return p;
> > +}
> > +
> > +/*
> > + * See if the non running fair tasks on this rq can be sent on other C=
PUs
> > + * that fits better with their profile.
> > + */
> > +static bool push_fair_task(struct rq *rq)
> > +{
> > +       struct task_struct *next_task;
> > +       int prev_cpu, new_cpu;
> > +       struct rq *new_rq;
> > +
> > +       next_task =3D pick_next_pushable_fair_task(rq);
> > +       if (!next_task)
> > +               return false;
> > +
> > +       if (is_migration_disabled(next_task))
> > +               return true;
> > +
> > +       /* We might release rq lock */
> > +       get_task_struct(next_task);
> > +
> > +       prev_cpu =3D rq->cpu;
> > +
> > +       new_cpu =3D find_energy_efficient_cpu(next_task, prev_cpu);
> > +
> > +       if (new_cpu =3D=3D prev_cpu)
> > +               goto out;
> > +
> > +       new_rq =3D cpu_rq(new_cpu);
> > +
> > +       if (double_lock_balance(rq, new_rq)) {
> > +               /* The task has already migrated in between */
> > +               if (task_cpu(next_task) !=3D rq->cpu) {
> > +                       double_unlock_balance(rq, new_rq);
> > +                       goto out;
> > +               }
> > +
> > +               deactivate_task(rq, next_task, 0);
> > +               set_task_cpu(next_task, new_cpu);
> > +               activate_task(new_rq, next_task, 0);
> > +
> > +               resched_curr(new_rq);
> > +
> > +               double_unlock_balance(rq, new_rq);
> > +       }
> > +
> > +out:
> > +       put_task_struct(next_task);
> > +
> > +       return true;
> > +}
> > +
> > +static void push_fair_tasks(struct rq *rq)
> > +{
> > +       /* push_fair_task() will return true if it moved a fair task */
> > +       while (push_fair_task(rq))
> > +               ;
> > +}
> > +
> > +static DEFINE_PER_CPU(struct balance_callback, fair_push_head);
> > +
> > +static inline void fair_queue_pushable_tasks(struct rq *rq)
> > +{
> > +       if (!sched_energy_enabled() || !has_pushable_tasks(rq))
> > +               return;
> > +
> > +       queue_balance_callback(rq, &per_cpu(fair_push_head, rq->cpu), p=
ush_fair_tasks);
> > +}
> > +static void fair_remove_pushable_task(struct rq *rq, struct task_struc=
t *p)
> > +{
> > +       if (sched_energy_enabled())
> > +               plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> > +}
> > +
> > +static void fair_add_pushable_task(struct rq *rq, struct task_struct *=
p)
> > +{
> > +       if (sched_energy_enabled() && task_on_rq_queued(p) && !p->se.sc=
hed_delayed) {
> > +               if (sched_energy_push_task(p, rq)) {
> > +                       plist_del(&p->pushable_tasks, &rq->cfs.pushable=
_tasks);
> > +                       plist_node_init(&p->pushable_tasks, p->prio);
> > +                       plist_add(&p->pushable_tasks, &rq->cfs.pushable=
_tasks);
> > +               }
> > +       }
> > +}
> > +
> >  /*
> >   * select_task_rq_fair: Select target runqueue for the waking task in =
domains
> >   * that have the relevant SD flag set. In practice, this is SD_BALANCE=
_WAKE,
> > @@ -8758,6 +8952,10 @@ balance_fair(struct rq *rq, struct task_struct *=
prev, struct rq_flags *rf)
> >         return sched_balance_newidle(rq, rf) !=3D 0;
> >  }
> >  #else
> > +static inline void check_pushable_task(struct task_struct *p, struct r=
q *rq) {}
> > +static inline void fair_queue_pushable_tasks(struct rq *rq) {}
> > +static void fair_remove_pushable_task(struct rq *rq, struct task_struc=
t *p) {}
> > +static inline void fair_add_pushable_task(struct rq *rq, struct task_s=
truct *p) {}
> >  static inline void set_task_max_allowed_capacity(struct task_struct *p=
) {}
> >  #endif /* CONFIG_SMP */
> >
> > @@ -8947,6 +9145,12 @@ pick_next_task_fair(struct rq *rq, struct task_s=
truct *prev, struct rq_flags *rf
> >                 put_prev_entity(cfs_rq, pse);
> >                 set_next_entity(cfs_rq, se);
> >
> > +               /*
> > +                * The previous task might be eligible for being pushed=
 on
> > +                * another cpu if it is still active.
> > +                */
> > +               fair_add_pushable_task(rq, prev);
> > +
> >                 __set_next_task_fair(rq, p, true);
> >         }
> >
> > @@ -9019,6 +9223,13 @@ static void put_prev_task_fair(struct rq *rq, st=
ruct task_struct *prev, struct t
> >                 cfs_rq =3D cfs_rq_of(se);
> >                 put_prev_entity(cfs_rq, se);
> >         }
> > +
> > +       /*
> > +        * The previous task might be eligible for being pushed on anot=
her cpu
> > +        * if it is still active.
> > +        */
> > +       fair_add_pushable_task(rq, prev);
> > +
> >  }
> >
> >  /*
> > @@ -13151,6 +13362,7 @@ static void task_tick_fair(struct rq *rq, struc=
t task_struct *curr, int queued)
> >         if (static_branch_unlikely(&sched_numa_balancing))
> >                 task_tick_numa(rq, curr);
> >
> > +       check_pushable_task(curr, rq);
> >         update_misfit_status(curr, rq);
> >         check_update_overutilized_status(task_rq(curr));
> >
> > @@ -13303,6 +13515,8 @@ static void __set_next_task_fair(struct rq *rq,=
 struct task_struct *p, bool firs
> >  {
> >         struct sched_entity *se =3D &p->se;
> >
> > +       fair_remove_pushable_task(rq, p);
> > +
> >  #ifdef CONFIG_SMP
> >         if (task_on_rq_queued(p)) {
> >                 /*
> > @@ -13320,6 +13534,11 @@ static void __set_next_task_fair(struct rq *rq=
, struct task_struct *p, bool firs
> >         if (hrtick_enabled_fair(rq))
> >                 hrtick_start_fair(rq, p);
> >
> > +       /*
> > +        * Try to push prev task before checking misfit for next task a=
s
> > +        * the migration of prev can make next fitting the CPU
> > +        */
> > +       fair_queue_pushable_tasks(rq);
> >         update_misfit_status(p, rq);
> >         sched_fair_update_stop_tick(rq, p);
> >  }
> > @@ -13350,6 +13569,7 @@ void init_cfs_rq(struct cfs_rq *cfs_rq)
> >         cfs_rq->tasks_timeline =3D RB_ROOT_CACHED;
> >         cfs_rq->min_vruntime =3D (u64)(-(1LL << 20));
> >  #ifdef CONFIG_SMP
> > +       plist_head_init(&cfs_rq->pushable_tasks);
> >         raw_spin_lock_init(&cfs_rq->removed.lock);
> >  #endif
> >  }
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index ab16d3d0e51c..2db198dccf21 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -722,6 +722,8 @@ struct cfs_rq {
> >         struct list_head        leaf_cfs_rq_list;
> >         struct task_group       *tg;    /* group that "owns" this runqu=
eue */
> >
> > +       struct plist_head       pushable_tasks;
> > +
> >         /* Locally cached copy of our task_group's idle value */
> >         int                     idle;
> >
> > --
> > 2.43.0
> >
> >
