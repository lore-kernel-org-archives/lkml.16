Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6371ACEDE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725182; cv=none; b=Hzjp+TwNXR4AQeMaEbMXOWt4zXHay9aPCXKJr3c7KXEh4DtAs5kX7Ky9XuW93VxA3uiPnopq+K0Qn9PXiXhz0ceG/H+L/Z5mPeL+K9AG9f+Gu79Knj5b35yDGY61xzZBpvfBKi2wB56t+WzzkVHaV5t7Odc/y7Bu2dlpQUcQ+Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725182; c=relaxed/simple;
	bh=q/DmaL+PqLmLjvBYhmlgOORoSNjDoeQfL2FWnmXJ/5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOHfECEdxWaUedCcPG9CFEjCd/8MGIQUYguoCWZswqwzRdTSLc7d/qyFgjqRfifV8bidc72qvm+PztzYMnHnjX/h4MIuygg0VlTD0HHUi+b7ELADJzq+qRNkuBVCkajTwvZS/vDilulDdt4SaHOrhdq1W5Y3ZDZwkDMtYP3qNQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jur1qnLB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jur1qnLB"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abec8b750ebso945535766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725178; x=1745329978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ooSny9XUJhxzZTQ7SphFkbtSCGNbzJtlyoCGrcjm0uI=;
        b=Jur1qnLBVJ9J0i+KbNR4cqt04XE884GK/fDof0HROA4vW9N4azemkf+jFe7Vmf0bh4
         dpxrfa/noqHwjr/Qa3k1R9N1/kH0qMD5/zEvl/IB6EYcQpq8g17upCwKBP7EZrfoN/Fd
         5huHCjnvS/utQGYGg4q9YtdpE3FWKEMmivpYPrAyt1t27IGd01Co0BQEUV1yXRwgqs/P
         ArjmcRgjrV81O26rEjvIsosFPARk1gd3CQZHu0F64kVPln6ABhXitcyofcYdfLI8vSXV
         M7JPX2a52rWgiXCeuP/Lb9X/oU7CysEmRyqq+/aqNNX6WQMvDvktH2SCFPG8vdjxp1K7
         WUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725178; x=1745329978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooSny9XUJhxzZTQ7SphFkbtSCGNbzJtlyoCGrcjm0uI=;
        b=gAY7KNdpNhUNnjBY6u1DYDIb7ogfsNpdgG3pJKBlnWZSDDcvCpZtE2d4OSL4Nrvk8Y
         mUJSeyl8iNv5tb2PP3vh23p6uC7f8OYx48H0bAUDrlQ+PDgOMBn36RHBCsj9avuMYuUf
         +hWGOLgCosDg7WfklK/ErqWno2nGgsowQnYt0o7GQPiBm2Re7rkmKmZghDcIE2MjslB2
         TecfhOx43m3tm5Ma7FphAtPWI7zFY+yuSB7K7Jr4s/2sUIZGKqyRNTo0XATJgYMzl2FS
         /vkm1mQ5M69bBQ2ahAXUSNF2HmFkasJJy3uLe4fbJ7WFv7wbXPIRdCONIfUkGCCMOu+R
         S7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU9c7D00DQ2wMia25XNInNnpF01lWDZYCFCkhV6mRunPGfeVzAFHZKGz63P0xwetGiiwa3AOK6YzBTG6MY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy33uLfkpAGR5Z+WBR78OH8Qv2LvdQ0vhiFkE+NtN60v/oh6GPn
	3PvHfMQefjXpNfL53heSzD+7KisNRaoNtow+18TOG9bkMv0M/qdjChdanUT4s580AD8z7DZBxSa
	9XC8DBYAPn1UFUAwxm36QaLWKt4z8IZVQCyrLrQ==
X-Gm-Gg: ASbGnct7HuVPbvihSoLFekzqYtNj3Cdnut6TL8INoZzRuHcefICJWqAcKX12PqSMy66
	ZAdunMc39s8ANlqP3pAjkdJjoQqbu3jGZaSn8xf3VYVmxQIstGpuL6crCfEzzWO4fi9KmJXYjsW
	HqL+nAHDNSL4lfor02u7QPbdUDBT3EKNmQTOdrGF5zNl9W725G2+GPYZkgGGBCWw==
X-Google-Smtp-Source: AGHT+IEol4piqZI6Yl4KkOyrpWJDQ0NRxpz331ba806EziKe1YlyaBlEBwXC/EDk8zCKPGhNab6fbJKybT0eQUA9ilQ=
X-Received: by 2002:a17:907:948e:b0:ac7:66fb:6a07 with SMTP id
 a640c23a62f3a-acad3439f1fmr1418866966b.6.1744725178174; Tue, 15 Apr 2025
 06:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302210539.1563190-1-vincent.guittot@linaro.org>
 <20250302210539.1563190-6-vincent.guittot@linaro.org> <b19a857c-4c01-471b-94be-c465de636cd9@arm.com>
In-Reply-To: <b19a857c-4c01-471b-94be-c465de636cd9@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 15 Apr 2025 15:52:46 +0200
X-Gm-Features: ATxdqUERmn6EDtKU2V_wprhveLltLu_mmBdhtZ7lcobIXZT62Zkij7ds-nVnK14
Message-ID: <CAKfTPtCr0BRFwc2z0EGVNSyKSfKWqrOfeiZLNigzxEY2W6Bocw@mail.gmail.com>
Subject: Re: [PATCH 5/7 v5] sched/fair: Add push task mechanism for EAS
To: Christian Loehle <christian.loehle@arm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, lukasz.luba@arm.com, 
	rafael.j.wysocki@intel.com, pierre.gondois@arm.com, 
	linux-kernel@vger.kernel.org, qyousef@layalina.io, hongyan.xia2@arm.com, 
	luis.machado@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Mar 2025 at 12:16, Christian Loehle <christian.loehle@arm.com> wrote:
>
> On 3/2/25 21:05, Vincent Guittot wrote:
> > EAS is based on wakeup events to efficiently place tasks on the system, but
> > there are cases where a task doesn't have wakeup events anymore or at a far
> > too low pace. For such situation, we can take advantage of the task being
> > put back in the enqueued list to check if it should be pushed on another
> > CPU. When the task is alone on the CPU, it's never put back in the enqueued
> > list; In this special case, we use the tick to run the check.
> >
> > Wake up events remain the main way to migrate tasks but we now detect
> > situation where a task is stuck on a CPU by checking that its utilization
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
> > @@ -7051,6 +7051,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
> >       hrtick_update(rq);
> >  }
> >
> > +static void fair_remove_pushable_task(struct rq *rq, struct task_struct *p);
> >  static void set_next_buddy(struct sched_entity *se);
> >
> >  /*
> > @@ -7081,6 +7082,8 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
> >               h_nr_idle = task_has_idle_policy(p);
> >               if (task_sleep || task_delayed || !se->sched_delayed)
> >                       h_nr_runnable = 1;
> > +
> > +             fair_remove_pushable_task(rq, p);
> >       } else {
> >               cfs_rq = group_cfs_rq(se);
> >               slice = cfs_rq_min_slice(cfs_rq);
> > @@ -8589,6 +8592,197 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
> >       return target;
> >  }
> >
> > +static inline bool task_stuck_on_cpu(struct task_struct *p, int cpu)
> > +{
> > +     unsigned long max_capa, util;
> > +
> > +     max_capa = min(get_actual_cpu_capacity(cpu),
> > +                    uclamp_eff_value(p, UCLAMP_MAX));
> > +     util = max(task_util_est(p), task_runnable(p));
> > +
> > +     /*
> > +      * Return true only if the task might not sleep/wakeup because of a low
> > +      * compute capacity. Tasks, which wake up regularly, will be handled by
> > +      * feec().
> > +      */
> > +     return (util > max_capa);
> > +}
> > +
> > +static inline bool sched_energy_push_task(struct task_struct *p, struct rq *rq)
> > +{
> > +     if (p->nr_cpus_allowed == 1)
> > +             return false;
> > +
> > +     if (is_rd_overutilized(rq->rd))
> > +             return false;
> > +
> > +     if (task_stuck_on_cpu(p, cpu_of(rq)))
> > +             return true;
> > +
> > +     return false;
> > +}
> > +
> > +static int active_load_balance_cpu_stop(void *data);
> > +
> > +static inline void check_pushable_task(struct task_struct *p, struct rq *rq)
> > +{
> > +     int new_cpu, cpu = cpu_of(rq);
> > +
> > +     if (!sched_energy_enabled())
> > +             return;
> > +
> > +     if (WARN_ON(!p))
> > +             return;
> > +
> > +     if (WARN_ON(!task_current(rq, p)))
> > +             return;
> > +
> > +     if (is_migration_disabled(p))
> > +             return;
> > +
> > +     /* If there are several task, wait for being put back */
> > +     if (rq->nr_running > 1)
> > +             return;
> > +
> > +     if (!sched_energy_push_task(p, rq))
> > +             return;
> > +
> > +     new_cpu = find_energy_efficient_cpu(p, cpu);
> > +
> > +     if (new_cpu == cpu)
> > +             return;
> > +
> > +     /*
> > +      * ->active_balance synchronizes accesses to
> > +      * ->active_balance_work.  Once set, it's cleared
> > +      * only after active load balance is finished.
> > +      */
> > +     if (!rq->active_balance) {
> > +             rq->active_balance = 1;
> > +             rq->push_cpu = new_cpu;
> > +     } else
> > +             return;
> > +
> > +     raw_spin_rq_unlock(rq);
> > +     stop_one_cpu_nowait(cpu,
> > +             active_load_balance_cpu_stop, rq,
> > +             &rq->active_balance_work);
> > +     raw_spin_rq_lock(rq);
> > +}
> > +
> > +static inline int has_pushable_tasks(struct rq *rq)
> > +{
> > +     return !plist_head_empty(&rq->cfs.pushable_tasks);
> > +}
> > +
> > +static struct task_struct *pick_next_pushable_fair_task(struct rq *rq)
> > +{
> > +     struct task_struct *p;
> > +
> > +     if (!has_pushable_tasks(rq))
> > +             return NULL;
> > +
> > +     p = plist_first_entry(&rq->cfs.pushable_tasks,
> > +                           struct task_struct, pushable_tasks);
> > +
> > +     WARN_ON_ONCE(rq->cpu != task_cpu(p));
> > +     WARN_ON_ONCE(task_current(rq, p));
> > +     WARN_ON_ONCE(p->nr_cpus_allowed <= 1);
> > +     WARN_ON_ONCE(!task_on_rq_queued(p));
> > +
> > +     /*
> > +      * Remove task from the pushable list as we try only once after that
> > +      * the task has been put back in enqueued list.
> > +      */
> > +     plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> > +
> > +     return p;
> > +}
> > +
> > +/*
> > + * See if the non running fair tasks on this rq can be sent on other CPUs
> > + * that fits better with their profile.
> > + */
> > +static bool push_fair_task(struct rq *rq)
> > +{
> > +     struct task_struct *next_task;
> > +     int prev_cpu, new_cpu;
> > +     struct rq *new_rq;
> > +
> > +     next_task = pick_next_pushable_fair_task(rq);
> > +     if (!next_task)
> > +             return false;
> > +
> > +     if (is_migration_disabled(next_task))
> > +             return true;
> > +
> > +     /* We might release rq lock */
> > +     get_task_struct(next_task);
> > +
> > +     prev_cpu = rq->cpu;
> > +
> > +     new_cpu = find_energy_efficient_cpu(next_task, prev_cpu);
>
> We aren't gating this on a overutilized check for both call sites of this patch

The overutilized check has been done when adding the task to the list.


> like the other feec() call and testing shows that this calls feec when OU
> relatively often.
> Why would it be OK to call feec() here when it isn't on task placement?
>
> > +
> > +     if (new_cpu == prev_cpu)
> > +             goto out;
> > +
> > +     new_rq = cpu_rq(new_cpu);
> > +
> > +     if (double_lock_balance(rq, new_rq)) {
> > +             /* The task has already migrated in between */
> > +             if (task_cpu(next_task) != rq->cpu) {
> > +                     double_unlock_balance(rq, new_rq);
> > +                     goto out;
> > +             }
> > +
> > +             deactivate_task(rq, next_task, 0);
> > +             set_task_cpu(next_task, new_cpu);
> > +             activate_task(new_rq, next_task, 0);
> > +
> > +             resched_curr(new_rq);
> > +
> > +             double_unlock_balance(rq, new_rq);
> > +     }
> > +
> > +out:
> > +     put_task_struct(next_task);
> > +
> > +     return true;
> > +}
> > +
> > +static void push_fair_tasks(struct rq *rq)
> > +{
> > +     /* push_fair_task() will return true if it moved a fair task */
>
> This isn't technically true, a bit of a nit, push_fair_task() also
> will return true when the task found wasn't moveable.
>
> [snip]
