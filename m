Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E386189B80
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805955; cv=none; b=YqFR1bg/Un2JlhLpjaepQVM0DA5ojZR28p468U0jMSZ4UjuV3asUJPGWAA+ZmFGRFQAsnTAAzeYKE72U1iQujj8YgHpmMLkVwo87Tf5ZljwRDK6vTe4w0btTZQK8L8o1pThW0NT/AFx/x0aA7LxGxf7QZx/Ki4QEUcMmfJgsz54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805955; c=relaxed/simple;
	bh=rGa+H8DL6n/xs4fshCh6R/ULl5eRKVIVIzWnvol5l7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtbwMgIzplkLkEBCki03y5kyiysgAipCxUetd0AU0RAFYgfy8vfCnuhT98W39RvIFKz6YoJLcfM1f9uzeXIUAta898RfM8dUW9RxkLK0Msi10Ifq+pi8GL2gR/+IuIEsrcWaEw1n6Eo39a1bzCYhTLK335cvPV4ZQP5LLTj4JIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=osxOoKG8; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="osxOoKG8"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so1105905066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744805952; x=1745410752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFv0OgvuvKXONjMKFGxttnL8FbJNnuqKlgUC5qjzUK0=;
        b=osxOoKG8YBXEDfjO4RZG8EfPhD2nsENyBRlQNM1ElP/r1GcKKLKtY8NY4M7Ab53ilV
         5k28cuRqxtQsrTRhgUcE1kz5IKEmtcyeck78lydFAgVDNT0Rwo/GghGVK3q7apFWkHt0
         eRd77B+6clS/PSR5YYfK1hMic+kRBZwm1+UU1dM2J+SpXO4DWqgF7KyH8k+JV3RRmCye
         96dFqzb7v8kXsxwYQUbcc6cN0vA/TWUuA1K2DOvOExkR38UYNFBKphMhIZt2kS7i6yMJ
         dxk5iI93vA68RGLWhiKT5NhEtgJgdbK3ze7cVsutxZ7GyHEFktOVUE5d6/VkMwS1CJsW
         Ez4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805952; x=1745410752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFv0OgvuvKXONjMKFGxttnL8FbJNnuqKlgUC5qjzUK0=;
        b=I1Hn5iLJiu8ePMyv9FAbp1tGO1fdEiAQLr1iGQZOEN0xPoc0+MrZ1B8RD8HDss/R3L
         8xiVBOwzbQRCTzJcAkPtB8snxAeAmhWXGafEdVazCiChzCTRw8OeJIVRoFeSmUoGl0xE
         f6JaevKjX/Aub7uq06TkPwtsUZ2EB+gSJCSbzDEsTxOP7WmUB+5H7oHZ8pSbWfOzQDsa
         EveMj7uQamBCcFWVqJ54mAuh+KkyH6w2ROGZ2acpbAwtopLqzQBUknykMQ5jvgWwcURp
         lqEqh8/rap4XBKn1ZH6aVwqpLmqfGsHD9LtE0vzlI/CI+szy0fTIj08TwRGopNwEezna
         wxyA==
X-Forwarded-Encrypted: i=1; AJvYcCWXAIZzV3gvesM6HXW2D7mbEtd9g3DPgBbQp6RSuTbYfiK+XX2mmBTcorSTlqDJ8bqu+VpRC5uq2+XXyvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFpXN6ThkYAgbwofe/WzZafPuoXp2yFg7UBzAKPJ0vNVs+BwWx
	mN40Sqt/9eNruCI/rQfLsjjdDzX863r3Q3xW7O6jKx/biUV8qbY8dxDHNm34Pi8N7jqQfluP13h
	/e3V2HlBhhrp/0HkyL8pChEsXAutWpfKEqp0FFA==
X-Gm-Gg: ASbGncsWbEGjEvvjr1e/dCc5sAx6l6CFgXSYtVlG41fadxS71d4lLEyuaYGhHZEv8KD
	U6oDCsmAYg6wjJRqyT18vNYAtwMjKjym2tuh3KFQyUNLdjSPaZSZfh33u4Who/TfGMYgkr4A4ox
	cWxaN5HA0teEJtvUisLF6xoZ6eO761xab3KTS+UKp1D4qjtysaKMBdjsGH6rismg==
X-Google-Smtp-Source: AGHT+IE3mPL1KQwrd3SA4aIVCXy+41CjOy/DLWM0V3EgujKInDXcB0RlHK8jrWE3HSHaGRZIAzMgPUc817twsJX7oz4=
X-Received: by 2002:a17:906:dc92:b0:ac7:1350:e878 with SMTP id
 a640c23a62f3a-acb42ada144mr121883766b.46.1744805951746; Wed, 16 Apr 2025
 05:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325014733.18405-1-xuewen.yan@unisoc.com> <CAKfTPtA06D1EGg2VdVHt-P0PDE-1XZVJOp3myZPSNknnFT3nNg@mail.gmail.com>
 <CAB8ipk_uOKn+U0ozZyaQ8J9OjifoZWSh-9NUQ9UD+K-kLV28vw@mail.gmail.com>
 <CAKfTPtD2T8Qm-6Nq-9qODQASoU9Wn1Ujk4uQbbN1Dvo3+EFZFA@mail.gmail.com> <CAB8ipk-G_Q20Cyx69GRY5pdTj9C4SyVyiuRVFi-i-otQ1zBVFg@mail.gmail.com>
In-Reply-To: <CAB8ipk-G_Q20Cyx69GRY5pdTj9C4SyVyiuRVFi-i-otQ1zBVFg@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 16 Apr 2025 14:19:00 +0200
X-Gm-Features: ATxdqUF8DzkAqwMU6HkacoJAnzd1x_1698-R67vQ_lOpWmowiapsW2iv1LIbzYA
Message-ID: <CAKfTPtC2XA_DUy5zjPo4Xr1r7W-CFiZEwabEQcZPk0FDLxc3QQ@mail.gmail.com>
Subject: Re: [PATCH v2] sched/uclamp: Align uclamp and util_est and call
 before freq update
To: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: Xuewen Yan <xuewen.yan@unisoc.com>, dietmar.eggemann@arm.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	hongyan.xia2@arm.com, qyousef@layalina.io, ke.wang@unisoc.com, 
	di.shen@unisoc.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Apr 2025 at 13:07, Xuewen Yan <xuewen.yan94@gmail.com> wrote:
>
> On Wed, Apr 16, 2025 at 5:42=E2=80=AFPM Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Wed, 16 Apr 2025 at 04:55, Xuewen Yan <xuewen.yan94@gmail.com> wrote=
:
> > >
> > > On Wed, Apr 16, 2025 at 1:05=E2=80=AFAM Vincent Guittot
> > > <vincent.guittot@linaro.org> wrote:
> > > >
> > > > On Tue, 25 Mar 2025 at 02:48, Xuewen Yan <xuewen.yan@unisoc.com> wr=
ote:
> > > > >
> > > > > When task's uclamp is set, we hope that the CPU frequency
> > > > > can increase as quickly as possible when the task is enqueued.
> > > > > Because the cpu frequency updating happens during the enqueue_tas=
k(),
> > > >
> > > > Strictly speaking, it doesn't happen during enqueue_task but when :
> > > > - attach/detach tasks when migrating
> > > > - update_load_avg decayed
> > > > - io_wait
> > > >
> > > > This often happens during an enqueue but not always ...
> > >
> > > Okay, I would make some adjustments to these descriptions.
> > >
> > > >
> > > > > so the rq's uclamp needs to be updated before the task is enqueue=
d,
> > > >
> > > > this doesn't ensure that new rq's uclamp will be taken into account
> > >
> > > Did I miss something?
> > >
> > > As following stack:
> > > enqueue_task_fair()
> > > update_load_avg()
> > > cfs_rq_util_change(cfs_rq, 0);
> >
> > As mentioned above, this doesn't always happen so you are not ensured
> > to take uclamp into account. If you mandate to take uclamp value into
> > account immediately this is not enough
>
> I understand your point now. I think what you're referring to is a
> different issue, just like what we discussed earlier with Prateek:
> https://lore.kernel.org/all/CAB8ipk_1=3DU_HgVQrfQ4VRUDrcHJBQd2LJ9aXh8PG6E=
-Z4_xS+g@mail.gmail.com/
>
> However, I think the purpose of this patch is to ensure that during
> the enqueue_task process, if a frequency change is triggered, the
> uclamp has already been updated before the frequency is changed.

okay, so please update the commit message because " When task's uclamp
is set, we hope that the CPU frequency
 can increase as quickly as possible when the task is enqueued." is confusi=
ng

>
> >
> > > cpufreq_update_util()
> > >   sugov_update_shared()
> > >     sugov_next_freq_shared()
> > >      sugov_get_util()
> > >         effective_cpu_util()
> > >             *min =3D max(irq + cpu_bw_dl(rq), uclamp_rq_get(rq, UCLAM=
P_MIN));
> > >             *max =3D min(scale, uclamp_rq_get(rq, UCLAMP_MAX));
> > >
> > > So, the rq's uclamp value should update before enqueue_task().
> > > >
> > > > > just like util_est.
> > > >
> > > > just like util_est
> > > >
> > > > > So, aline the uclamp and util_est and call before freq update.
> > > >
> > > > nit s/aline/align/ ?
> > > align.
> > > >
> > > > >
> > > > > For sched-delayed tasks, the rq uclamp/util_est should only be up=
dated
> > > > > when they are enqueued upon being awakened.
> > > > > So simply the logic of util_est's enqueue/dequeue check.
> > > > >
> > > > > Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> > > > > ---
> > > > > v2:
> > > > > - simply the util-est's en/dequeue check;
> > > > > ---
> > > > > Previous discussion:
> > > > > https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt=
9TLTWW-iWTQKiA@mail.gmail.com/
> > > > > https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276da=
d31.1740664400.git.hongyan.xia2@arm.com/T/#u
> > > > > https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=3DAi7tFzO=
=3D=3D=3DmpLD3obNdV4=3DJ-A@mail.gmail.com/T/#u
> > > > > https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd7036771@=
arm.com/
> > > > > ---
> > > > >  kernel/sched/core.c | 17 ++++++++++-------
> > > > >  kernel/sched/fair.c |  4 ++--
> > > > >  2 files changed, 12 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > > > index 042351c7afce..72fbe2031e54 100644
> > > > > --- a/kernel/sched/core.c
> > > > > +++ b/kernel/sched/core.c
> > > > > @@ -1747,7 +1747,7 @@ static inline void uclamp_rq_dec_id(struct =
rq *rq, struct task_struct *p,
> > > > >         }
> > > > >  }
> > > > >
> > > > > -static inline void uclamp_rq_inc(struct rq *rq, struct task_stru=
ct *p)
> > > > > +static inline void uclamp_rq_inc(struct rq *rq, struct task_stru=
ct *p, int flags)
> > > > >  {
> > > > >         enum uclamp_id clamp_id;
> > > > >
> > > > > @@ -1763,7 +1763,8 @@ static inline void uclamp_rq_inc(struct rq =
*rq, struct task_struct *p)
> > > > >         if (unlikely(!p->sched_class->uclamp_enabled))
> > > > >                 return;
> > > > >
> > > > > -       if (p->se.sched_delayed)
> > > > > +       /* Only inc the delayed task which being woken up. */
> > > > > +       if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
> > > > >                 return;
> > > > >
> > > > >         for_each_clamp_id(clamp_id)
> > > > > @@ -2031,7 +2032,7 @@ static void __init init_uclamp(void)
> > > > >  }
> > > > >
> > > > >  #else /* !CONFIG_UCLAMP_TASK */
> > > > > -static inline void uclamp_rq_inc(struct rq *rq, struct task_stru=
ct *p) { }
> > > > > +static inline void uclamp_rq_inc(struct rq *rq, struct task_stru=
ct *p, int flags) { }
> > > > >  static inline void uclamp_rq_dec(struct rq *rq, struct task_stru=
ct *p) { }
> > > > >  static inline void uclamp_fork(struct task_struct *p) { }
> > > > >  static inline void uclamp_post_fork(struct task_struct *p) { }
> > > > > @@ -2067,12 +2068,14 @@ void enqueue_task(struct rq *rq, struct t=
ask_struct *p, int flags)
> > > > >         if (!(flags & ENQUEUE_NOCLOCK))
> > > > >                 update_rq_clock(rq);
> > > > >
> > > > > -       p->sched_class->enqueue_task(rq, p, flags);
> > > > >         /*
> > > > > -        * Must be after ->enqueue_task() because ENQUEUE_DELAYED=
 can clear
> > > > > -        * ->sched_delayed.
> > > > > +        * Can be before ->enqueue_task() because uclamp consider=
s the
> > > > > +        * ENQUEUE_DELAYED task before its ->sched_delayed gets c=
leared
> > > > > +        * in ->enqueue_task().
> > > > >          */
> > > > > -       uclamp_rq_inc(rq, p);
> > > > > +       uclamp_rq_inc(rq, p, flags);
> > > > > +
> > > > > +       p->sched_class->enqueue_task(rq, p, flags);
> > > > >
> > > > >         psi_enqueue(p, flags);
> > > > >
> > > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > > index c798d2795243..c92fee07fb7b 100644
> > > > > --- a/kernel/sched/fair.c
> > > > > +++ b/kernel/sched/fair.c
> > > > > @@ -6930,7 +6930,7 @@ enqueue_task_fair(struct rq *rq, struct tas=
k_struct *p, int flags)
> > > > >          * Let's add the task's estimated utilization to the cfs_=
rq's
> > > > >          * estimated utilization, before we update schedutil.
> > > > >          */
> > > > > -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || =
(flags & ENQUEUE_RESTORE))))
> > > > > +       if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
> > > >
> > > > commit message doesn't explain why you change util_est condition
> > >
> > > Because, the sched_delayed flag is set when dequeue_entity, and clear
> > > after the condition,
> > > so for migrating/prio_change, we could just check the sched_delayed.
> >
> > Why is testing sched_delayed enough for migrating/prio_change ?
> > With your change, we will remove then add back util_est when changing
> > prio of the task which is useless
>
> I sincerely apologize for any misunderstanding my previous description
> may have caused.
> When changing prio without changing class, the delayed_task's
> sched_delayed flag is not changed,
> we would not remove then add back util_est.
> If the class was changed=EF=BC=9A
>
> if (prev_class !=3D next_class && p->se.sched_delayed)
>                  dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED |
> DEQUEUE_NOCLOCK);
>
> It will dequeue the delayed-task first, and will not enqueue it.
>
> As for normal tasks which are not delayed, indeed, the issue you
> mentioned can occur, but it seems that this problem has always
> existed. Perhaps this is a new issue that has come up.

I have been confused by the patch that added  the condition "if
(!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags &
ENQUEUE_RESTORE))))". I wrongly thought it was for
dequeue_save/enqueue_restore

Could you please split this in 2 patches :
patch 1 updates condition for util_est_dequeue/enqueue  and a
description why it's safe
patch 2 for aligning uclamp with util_est

Thanks

>
> Thanks!
>
> ---
> xuewen.yan
>
> >
> >
> > > And for the wakeup, because the the sched_delayed flag is cleared aft=
er this,
> > > so use the ENQUEUE_DELAYED flag to ensure the util_est could enqueue.
> > >
> > > >
> > > > >                 util_est_enqueue(&rq->cfs, p);
> > > > >
> > > > >         if (flags & ENQUEUE_DELAYED) {
> > > > > @@ -7168,7 +7168,7 @@ static int dequeue_entities(struct rq *rq, =
struct sched_entity *se, int flags)
> > > > >   */
> > > > >  static bool dequeue_task_fair(struct rq *rq, struct task_struct =
*p, int flags)
> > > > >  {
> > > > > -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || =
(flags & DEQUEUE_SAVE))))
> > > > > +       if (!p->se.sched_delayed)
> > > >
> > > > same here, you should explain in commit message why it's okay to do=
 so
> > >
> > > Same as above,  the sched_delayed flag is set when dequeue_entity, so
> > > this place,
> > > the sched_delayed was not set when sleeping, If the flag is set, it
> > > indicates that it
> > > was migrating or prio changing.
> > >
> > > By the way, I will kindly update these reasons in the commit message.
> > >
> > > Thanks!
> > >
> > > BR
> > > ---
> > > xuewen
