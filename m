Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3008D22615
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744736713; cv=none; b=tlh0UBHHQcNRfRg1g9e4BGH7nbv5L4Pu/n4QqLVhowAjWT6ZztnvS/zyrTK0Xg5Eu5XSPWMD/byM5xgmR+quDcrTa6+mfhavTTLvyY+0Tg+ahlYfD6wwjHyS+Wg5cDjnGjg4YsWnJMrhDLucnzx+KFKdy2tlj+R/Z7g4OMriGQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744736713; c=relaxed/simple;
	bh=x5lq6H7o37ZHN9Cn5PLpYhQHqO5UPDKOOvhU9HYsm/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blktnAFuC3l986A2OKgsqeAWEy9xuzl9CUAThLjnGa+PPe3n1aniurWPjaBMWUL1sedXfQySWEoyOUcWR8fy8eU8zc8GJPKgDIwCuRk8qp1tWCYAKiEAEmBcnKxdkmiMkzxG1Vk3q8fr0S1wGxYmGUlNcBPx7Zm6FXb58thGSj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I9QXOSW7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I9QXOSW7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac298c8fa50so925465366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744736709; x=1745341509; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5ahzXGzhXonFs6CCTiBxWHa3HYJUPpp0fddlJQNU/8=;
        b=I9QXOSW7iKxOc1GvjhbdIV9KbABEhSBaUQDrHXegtrDgai+8CUoWsat5d3xkfZ7M3/
         FaMe608G3622Su0/EQcaMn3IMqC3NLnjd3QwGe/V08gmHP8/9MKg1JBgrPNyR3vim4O/
         8rMl3cERCV9CuT64D9/L9Wz69kaLWmqWzxtN7lZagbBgfTxLGO93teB0Z+Pho4bRfUOY
         Vl/voltElhCX0cq2JrzUiVcE6kIpEWUWN3vKpsrhx6F6CDaDZqXNUeAIhf1fNqZabPVT
         Cx/LB7b+ud8ofUHGVwwjllVE4RZKha64bJviiVNee37AS9xglLJWd/nQZsgT3kgO+Ls2
         zzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744736709; x=1745341509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5ahzXGzhXonFs6CCTiBxWHa3HYJUPpp0fddlJQNU/8=;
        b=g9Te75zTCROP66mvD98LAnOfFHSgkY6bvL3reBnbXt5oUGBLOnCaU8zISvr/vEcHz8
         mHZOR97sswEWKNYZhRNAVY1fsO50sTqe26h+ftL4GCcnkzlNStWgwpJhUTOFIp4tNyQV
         j1X9bJ6ThLNdVVLfsISMIMkC+BJG8GgTMyBo7ntfwIb0MGd5LCNBLEuKLawquBKKBPvn
         WTpP9dhBZhzYy2sOXrJG61YDastXycVzJU3Yn3fz3F1ctLWeU+FuvI+01Uvr+/YqZ/dm
         X/sv4SeESVMErXYZcgOvq+sncWDQZ7pir3yoCLKkx5r1AoLYsX5AVZlfyQPPhsrZrCgA
         BStQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTqrUb0fS01ePHT4RBf9qZtHk7a3xjaR/AX1/NnTcmgtlCwoBrnPIgYEuUP0jaxygcgiUrSAghbSdHpe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBE/NIICHl/6Ny7CxKyy48ZPLUKWMzmKByh18xRJBA9hsoLLfR
	A7g1ihn0jx9ccnN8ALk+yP7WO/hw9ZK591S1/9HWvo1UMVJxiXWovcyceAgcPNOjSkPG4gnodpX
	y2hf71DkiursnldQlmAdnd/Cc30981mbdha2X5Q==
X-Gm-Gg: ASbGnct8NUCU5aFhQSmIuuWszsesReK0AKmXb2Bu0aH38WLeY6IH8jg8ZhcdAO+Hnl1
	OCyKd5MMpxhJEJ+dsa6nm4D0is0M/7x2jyd3vbEgTlwj420XAM8bl4tU5JFsHQJDOjwwB5DP5EC
	40LbuOTUFT3KoKNq2l1g4dXOXHpmoOiR6e9YYk5Cj4rcekBtfL/DlQFDTB8F4gGw==
X-Google-Smtp-Source: AGHT+IHvQmZa/Beg7i4cs5kz5SJTUbmmadWxB7INtGtU0SpkF/lqiZWY5Gkb36YhBmPrK6aATFXj3wwqTjvSBRXhoX8=
X-Received: by 2002:a17:907:7b8e:b0:aca:a163:aa3d with SMTP id
 a640c23a62f3a-acad34394e3mr1465411466b.3.1744736709259; Tue, 15 Apr 2025
 10:05:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325014733.18405-1-xuewen.yan@unisoc.com>
In-Reply-To: <20250325014733.18405-1-xuewen.yan@unisoc.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 15 Apr 2025 19:04:57 +0200
X-Gm-Features: ATxdqUGQlIwvXnVWuZ4qVOdVDTuOYQRCU3r_DVN8iQem0nwp47UbzFrfGEevccw
Message-ID: <CAKfTPtA06D1EGg2VdVHt-P0PDE-1XZVJOp3myZPSNknnFT3nNg@mail.gmail.com>
Subject: Re: [PATCH v2] sched/uclamp: Align uclamp and util_est and call
 before freq update
To: Xuewen Yan <xuewen.yan@unisoc.com>
Cc: dietmar.eggemann@arm.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, hongyan.xia2@arm.com, 
	qyousef@layalina.io, ke.wang@unisoc.com, di.shen@unisoc.com, 
	linux-kernel@vger.kernel.org, xuewen.yan94@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Mar 2025 at 02:48, Xuewen Yan <xuewen.yan@unisoc.com> wrote:
>
> When task's uclamp is set, we hope that the CPU frequency
> can increase as quickly as possible when the task is enqueued.
> Because the cpu frequency updating happens during the enqueue_task(),

Strictly speaking, it doesn't happen during enqueue_task but when :
- attach/detach tasks when migrating
- update_load_avg decayed
- io_wait

This often happens during an enqueue but not always ...

> so the rq's uclamp needs to be updated before the task is enqueued,

this doesn't ensure that new rq's uclamp will be taken into account

> just like util_est.

just like util_est

> So, aline the uclamp and util_est and call before freq update.

nit s/aline/align/ ?

>
> For sched-delayed tasks, the rq uclamp/util_est should only be updated
> when they are enqueued upon being awakened.
> So simply the logic of util_est's enqueue/dequeue check.
>
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---
> v2:
> - simply the util-est's en/dequeue check;
> ---
> Previous discussion:
> https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9TLTWW-iWTQKiA@mail.gmail.com/
> https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276dad31.1740664400.git.hongyan.xia2@arm.com/T/#u
> https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=Ai7tFzO===mpLD3obNdV4=J-A@mail.gmail.com/T/#u
> https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd7036771@arm.com/
> ---
>  kernel/sched/core.c | 17 ++++++++++-------
>  kernel/sched/fair.c |  4 ++--
>  2 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 042351c7afce..72fbe2031e54 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1747,7 +1747,7 @@ static inline void uclamp_rq_dec_id(struct rq *rq, struct task_struct *p,
>         }
>  }
>
> -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
> +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags)
>  {
>         enum uclamp_id clamp_id;
>
> @@ -1763,7 +1763,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
>         if (unlikely(!p->sched_class->uclamp_enabled))
>                 return;
>
> -       if (p->se.sched_delayed)
> +       /* Only inc the delayed task which being woken up. */
> +       if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
>                 return;
>
>         for_each_clamp_id(clamp_id)
> @@ -2031,7 +2032,7 @@ static void __init init_uclamp(void)
>  }
>
>  #else /* !CONFIG_UCLAMP_TASK */
> -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p) { }
> +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags) { }
>  static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) { }
>  static inline void uclamp_fork(struct task_struct *p) { }
>  static inline void uclamp_post_fork(struct task_struct *p) { }
> @@ -2067,12 +2068,14 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
>         if (!(flags & ENQUEUE_NOCLOCK))
>                 update_rq_clock(rq);
>
> -       p->sched_class->enqueue_task(rq, p, flags);
>         /*
> -        * Must be after ->enqueue_task() because ENQUEUE_DELAYED can clear
> -        * ->sched_delayed.
> +        * Can be before ->enqueue_task() because uclamp considers the
> +        * ENQUEUE_DELAYED task before its ->sched_delayed gets cleared
> +        * in ->enqueue_task().
>          */
> -       uclamp_rq_inc(rq, p);
> +       uclamp_rq_inc(rq, p, flags);
> +
> +       p->sched_class->enqueue_task(rq, p, flags);
>
>         psi_enqueue(p, flags);
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index c798d2795243..c92fee07fb7b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6930,7 +6930,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>          * Let's add the task's estimated utilization to the cfs_rq's
>          * estimated utilization, before we update schedutil.
>          */
> -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & ENQUEUE_RESTORE))))
> +       if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))

commit message doesn't explain why you change util_est condition

>                 util_est_enqueue(&rq->cfs, p);
>
>         if (flags & ENQUEUE_DELAYED) {
> @@ -7168,7 +7168,7 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
>   */
>  static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  {
> -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
> +       if (!p->se.sched_delayed)

same here, you should explain in commit message why it's okay to do so

>                 util_est_dequeue(&rq->cfs, p);
>
>         util_est_update(&rq->cfs, p, flags & DEQUEUE_SLEEP);
> --
> 2.25.1
>
