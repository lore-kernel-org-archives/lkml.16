Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D502745009
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222231; cv=none; b=E8xKf56QhLkOKVNvINtWZSZHM9igfvLt+v/9xrIt9k3Kb0C9IiO0KWsA24RphgPFP2Qa6ZXij2Z6KHgkqA30NAtBiALDKFkH851FXx4bBXB/DrvXltgoG5sLid5irsYRSpTehteIqJl29zA60pXXIM03mpfc3b8XN+i0qMUHvLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222231; c=relaxed/simple;
	bh=MP1DlX3KQk0isYvYsMaQEocILjiYOZ/JELPcnsAuWZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAHZBIR05f5u9B/7/GkiXs5yVxhuYN/d1DtU4A9puy0LAZMUdGiLstdp5xVxxqkpwsQrMyw685VPZOq1T+XtSoOOAiCN5Hn33/zubGY/2rAb9Xew4RLsP5AO9pLQ363MvWToeQR/zqwsvd6ih9HcNi8tb11BH3O2BUd5YQojYPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfvyh27C; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfvyh27C"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-601f278369bso4373581a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222228; x=1749827028; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LKFTgmexJ2tRnAKnlvK8zPAnKcYjOx7uvqLUInYgAWM=;
        b=nfvyh27C9fMKooOlxtKM/i2mO2e4IvC6XaZy3tyRtFeiOxXiozM1zf1u5BhgT1JM44
         DRpcygqh3EVIE2tWmWfVNsTWDLzSAYLYHa0T3fCLMeACHskITPz/UrIpD9UHFssVCF/B
         RU6wQZc3u1JrRJnkP6eVRHgoC0YVQDQ1IEdAr0M5KX/7R5pwT/zOgAI+XywTcoPTTSfK
         PgH33L4b2F8iqI2z/JYJ37D3QdghXneH8HRlneNPSFRZQd1uIDU0SXHBMYcMhKSFqsIZ
         yz3VtsAKESdYn4wBE86WWJUbrleHLYLpzn5J5mfgFD6bAtZ4/839F0cqFPYmPMzI4ZX9
         Iywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222228; x=1749827028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKFTgmexJ2tRnAKnlvK8zPAnKcYjOx7uvqLUInYgAWM=;
        b=bF24ZD1FLTve8vObxj/WsXNCA+FIKxZtxPoKC/lYxsyhI4IOmAPRWVa4rWOTqH0PtI
         ImMOVzqSS0zUDFsh+gDZMW8jZnyfr9w9+CUoGxbPPcMkjMDMyF+v2m63rEC9RPCqiYwJ
         cveNY7Boue8qy54rqSqMwkHyEiK4h4lgbQPD9n4d0G42yct7mECIZRzg7lQQC8cszmze
         hbwQB6gjPeiQr5cQSH12WXciqubdTES1XFSbsFPqlkXhCJ1OwA0AdwRbXDFfvaKzOZHs
         lygfXW30g0diwmpBybp7fEW54MeMC7IJDp3Fx8fZvR5ScVVB3jJiT3YqpPRFngAsLuZ5
         gRIg==
X-Forwarded-Encrypted: i=1; AJvYcCWxBqRn29vCYPlwN2RVB2SDJrUfWgD2vP2sADXVTOOQiHhdM9YPloB+TFqdrEoctrHi/dmfQkIcEn6cFsM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9scU/cePg3GijU0QoZ2maD3pt14rL/t5ED2+OSePoVXEY8n75
	yhPyEpYhrCWY2WaaHqFINgmbLjg2IE34pJ/gjOZkYZ7lQcdj7KKYBERoYK7FdUkH0tfnPnUQkx7
	Jy9fnpEdA5+J0PLsAnqxj+8GBRfogdaGtuxn+FtcxqA==
X-Gm-Gg: ASbGncuQ0vg+GxKX7TjmlI/QIs7o9hD/BA1tQQkD+f6Ccv2chu7wiV3fGZWm6SaLAp9
	qvIeG1xQ+EsGjvDeSOe6pg7RWvRrxohXvb8MhP7Tg3OOSeO7tTeckpmQ6RDS4BJgq46cutgW+wd
	teEuKJDmbmWGzjeJPC6o+L1+D95W4Um/4/mkTSUyYIKr77kDNGHVZ4WNKBsSNtyT059P07wVg8
X-Google-Smtp-Source: AGHT+IHb+JIgUTS+Jy05lwbJZA4PqXBhKzT+HUFPD4/O0+x0rM7l/7JgkPmvPnA8jVqm7RQCEOc4OaSz79JZUmZz5Ik=
X-Received: by 2002:a17:907:6d0d:b0:ad5:7732:675b with SMTP id
 a640c23a62f3a-ade1ab2088cmr371102566b.40.1749222228076; Fri, 06 Jun 2025
 08:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520094538.086709102@infradead.org> <20250520101727.984171377@infradead.org>
In-Reply-To: <20250520101727.984171377@infradead.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 6 Jun 2025 17:03:36 +0200
X-Gm-Features: AX0GCFv_fVC0VUzxSff7a-L_s-fxu5T2EqxzSb-EwHgZJZPdeebuweUcX02bGVI
Message-ID: <CAKfTPtDOQVEMRWaK9xEVqSDKcvUfai4CUck6G=oOdaeRBhZQUw@mail.gmail.com>
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	clm@meta.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 May 2025 at 12:18, Peter Zijlstra <peterz@infradead.org> wrote:
>
> One of the things lost with introduction of DELAY_DEQUEUE is the
> ability of TTWU to move those tasks around on wakeup, since they're
> on_rq, and as such, need to be woken in-place.

I was thinking that you would call select_task_rq() somewhere in the
wake up path of delayed entity to get a chance to migrate it which was
one reason for the perf regression (and which would have also been
useful for EAS case) but IIUC, the task is still enqueued on the same
CPU but the target cpu will do the enqueue itself instead on the local
CPU. Or am I missing something ?

>
> Doing the in-place thing adds quite a bit of cross-cpu latency, add a
> little something that gets remote CPUs to do their own in-place
> wakeups, significantly reducing the rq->lock contention.
>
> Reported-by: Chris Mason <clm@meta.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/sched/core.c     |   74 ++++++++++++++++++++++++++++++++++++++++++------
>  kernel/sched/fair.c     |    5 ++-
>  kernel/sched/features.h |    1
>  kernel/sched/sched.h    |    1
>  4 files changed, 72 insertions(+), 9 deletions(-)
>
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3784,6 +3784,8 @@ static int __ttwu_runnable(struct rq *rq
>         return 1;
>  }
>
> +static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags);
> +
>  /*
>   * Consider @p being inside a wait loop:
>   *
> @@ -3811,6 +3813,33 @@ static int __ttwu_runnable(struct rq *rq
>   */
>  static int ttwu_runnable(struct task_struct *p, int wake_flags)
>  {
> +#ifdef CONFIG_SMP
> +       if (sched_feat(TTWU_QUEUE_DELAYED) && READ_ONCE(p->se.sched_delayed)) {
> +               /*
> +                * Similar to try_to_block_task():
> +                *
> +                * __schedule()                         ttwu()
> +                *   prev_state = prev->state             if (p->sched_delayed)
> +                *   if (prev_state)                         smp_acquire__after_ctrl_dep()
> +                *     try_to_block_task()                   p->state = TASK_WAKING
> +                *       ... set_delayed()
> +                *         RELEASE p->sched_delayed = 1
> +                *
> +                * __schedule() and ttwu() have matching control dependencies.
> +                *
> +                * Notably, once we observe sched_delayed we know the task has
> +                * passed try_to_block_task() and p->state is ours to modify.
> +                *
> +                * TASK_WAKING controls ttwu() concurrency.
> +                */
> +               smp_acquire__after_ctrl_dep();
> +               WRITE_ONCE(p->__state, TASK_WAKING);
> +
> +               if (ttwu_queue_wakelist(p, task_cpu(p), wake_flags | WF_DELAYED))
> +                       return 1;
> +       }
> +#endif
> +
>         CLASS(__task_rq_lock, guard)(p);
>         return __ttwu_runnable(guard.rq, p, wake_flags);
>  }
> @@ -3830,12 +3859,41 @@ void sched_ttwu_pending(void *arg)
>         update_rq_clock(rq);
>
>         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> +               struct rq *p_rq = task_rq(p);
> +               int ret;
> +
> +               /*
> +                * This is the ttwu_runnable() case. Notably it is possible for
> +                * on-rq entities to get migrated -- even sched_delayed ones.

I haven't found where the sched_delayed task could migrate on another cpu.

> +                */
> +               if (unlikely(p_rq != rq)) {
> +                       rq_unlock(rq, &rf);
> +                       p_rq = __task_rq_lock(p, &rf);
> +               }
> +
> +               ret = __ttwu_runnable(p_rq, p, WF_TTWU);
> +
> +               if (unlikely(p_rq != rq)) {
> +                       if (!ret)
> +                               set_task_cpu(p, cpu_of(rq));
> +
> +                       __task_rq_unlock(p_rq, &rf);
> +                       rq_lock(rq, &rf);
> +                       update_rq_clock(rq);
> +               }
> +
> +               if (ret) {
> +                       // XXX ttwu_stat()
> +                       continue;
> +               }
> +
> +               /*
> +                * This is the 'normal' case where the task is blocked.
> +                */
> +
>                 if (WARN_ON_ONCE(p->on_cpu))
>                         smp_cond_load_acquire(&p->on_cpu, !VAL);
>
> -               if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
> -                       set_task_cpu(p, cpu_of(rq));
> -
>                 ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
>         }
>
> @@ -3974,7 +4032,7 @@ static inline bool ttwu_queue_cond(struc
>
>  static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
>  {
> -       bool def = sched_feat(TTWU_QUEUE_DEFAULT);
> +       bool def = sched_feat(TTWU_QUEUE_DEFAULT) || (wake_flags & WF_DELAYED);
>
>         if (!ttwu_queue_cond(p, cpu, def))
>                 return false;
> @@ -4269,8 +4327,8 @@ int try_to_wake_up(struct task_struct *p
>                  * __schedule().  See the comment for smp_mb__after_spinlock().
>                  *
>                  * Form a control-dep-acquire with p->on_rq == 0 above, to ensure
> -                * schedule()'s deactivate_task() has 'happened' and p will no longer
> -                * care about it's own p->state. See the comment in __schedule().
> +                * schedule()'s try_to_block_task() has 'happened' and p will no longer
> +                * care about it's own p->state. See the comment in try_to_block_task().
>                  */
>                 smp_acquire__after_ctrl_dep();
>
> @@ -6712,8 +6770,8 @@ static void __sched notrace __schedule(i
>         preempt = sched_mode == SM_PREEMPT;
>
>         /*
> -        * We must load prev->state once (task_struct::state is volatile), such
> -        * that we form a control dependency vs deactivate_task() below.
> +        * We must load prev->state once, such that we form a control
> +        * dependency vs try_to_block_task() below.
>          */
>         prev_state = READ_ONCE(prev->__state);
>         if (sched_mode == SM_IDLE) {
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5395,7 +5395,10 @@ static __always_inline void return_cfs_r
>
>  static void set_delayed(struct sched_entity *se)
>  {
> -       se->sched_delayed = 1;
> +       /*
> +        * See TTWU_QUEUE_DELAYED in ttwu_runnable().
> +        */
> +       smp_store_release(&se->sched_delayed, 1);
>
>         /*
>          * Delayed se of cfs_rq have no tasks queued on them.
> --- a/kernel/sched/features.h
> +++ b/kernel/sched/features.h
> @@ -82,6 +82,7 @@ SCHED_FEAT(TTWU_QUEUE, false)
>  SCHED_FEAT(TTWU_QUEUE, true)
>  #endif
>  SCHED_FEAT(TTWU_QUEUE_ON_CPU, true)
> +SCHED_FEAT(TTWU_QUEUE_DELAYED, false)

I'm not sure that the feature will be tested as people mainly test
default config

>  SCHED_FEAT(TTWU_QUEUE_DEFAULT, false)
>
>  /*
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2313,6 +2313,7 @@ static inline int task_on_rq_migrating(s
>  #define WF_RQ_SELECTED         0x80 /* ->select_task_rq() was called */
>
>  #define WF_ON_CPU              0x0100
> +#define WF_DELAYED             0x0200
>
>  #ifdef CONFIG_SMP
>  static_assert(WF_EXEC == SD_BALANCE_EXEC);
>
>
