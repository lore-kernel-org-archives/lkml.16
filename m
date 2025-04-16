Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2813123BD09
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801652; cv=none; b=CTeOtJWwp/pgUl2YWky6atwl0OmaxQIb+BcJheauAuOzUKBDOphozm2//jXtp17OLfdEz/DlgzGrCZLx7Uh09nNUVdYtQANMsBDP6w4qVp+f5FXjJicqDyQBZ6aX+5ygijXFQn+UGLmbtxQQP9niZDxeRZMLFLWuLOasZi2e9Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801652; c=relaxed/simple;
	bh=CtLi9xbq7XrbLkXN6Z0Z3c0ZV0SB8FZyBAYB6+qgZN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0t/vHaE4fVAgKiAdRpPHntgK1qm0uNV7aeVYsDYj7RUgD6r5rNowboJfS3gEG3vDEGUMkdZwH7BstKyuxxoOhJPf4IZDVAYYcYn0Oh+RI7qLGljD5/CNNKo3wALgHv/lgJsTa/xudGp/mGE4FihAUizQ7kNBSYxkKVLcMw60CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXZyK3Rx; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXZyK3Rx"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476a1acf61eso61832491cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744801649; x=1745406449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvozGn1mTv1yoqtT8xDAihZwf/uZCT93VbTr0t9x4z8=;
        b=iXZyK3RxwyGP2srctkgs88XHX8RB/zoZ1eJNlpZQEhmAfiO1iMYpCApqLSMMtA4FOn
         fbewjmPnCY2nxnk6pnD5Ke9+QvXopqCHhJBpqqx1HdfC+53QfM4BHbhv9t3LS15/WP5m
         ekmeWPm8CBb6rL6tZ2AhZpjq+ktYppEq0fivsKZHrrS6hMBmGRmVpWXhuvien3uaJGkw
         QpZLuhq4Rytd/nh9xQbaTuuC+wB+iazb6Feb/MBZfehwBSaCpKTSO9wl5AsmEcYQ7n8/
         jv0H44aZXacSE7c0M278nMbh0AuPH1J0YS5Kk85i0JfZjoDSPnqqIyXRug+awwupVoy1
         z2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801649; x=1745406449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvozGn1mTv1yoqtT8xDAihZwf/uZCT93VbTr0t9x4z8=;
        b=Q0DH23aqMObbdUCzWLs8pc5oYGUx6Q0vF6SSxfSbGN1lUmINiogyp6yxmXEEUrc5LQ
         2oA5VmDS/ZrdsuEHmKEmz+K7PYl4icXcPgircSpO7Zuq3wH7OjvWFOaluu0VmzJzXzL2
         AYkzZEBEc/6D4nWHS9uWxy7gcq4m6T+ZwaO+RTu798Zhdr+LReBvTmUDbKiGqN9ePlPa
         ChL/NNJipAv5c1Hkh7y6lBBTb/Vw8Z9brVdO4NPNYKZLLx6ayUUR/bTuqi8BAB4bCPoe
         y9SLhzXSb+sjaFxrAYugr1ZT1sd+zpUVvMun6VEeiEg+cJurYkWUQbgSFMmDqt0v69W9
         ly6w==
X-Forwarded-Encrypted: i=1; AJvYcCVb9PU5+G8m4uxoJljXynoO1OaeZtVGJIFDUtEAk2NEedtYN67EQo0QiFynFj43LKjQEIyhMP/PGYRuyF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIfIzx090ZqCAw4XRxV5ioN+l2uLrJ5+pIWP39uzNt2//rNzql
	e/ql7SU+3aCGQyf5EqXhW5z/9QM2+J+GbtQ7lTwVg5KdmIUWkn0Fctwfu3nCvnNpOr7S0LlV9Ht
	Yxg38Wa27AkXHeCZ+2OTdUCzSNQg=
X-Gm-Gg: ASbGncvL83RyyBlXNBimANYtypY02utGqGwhr/518Zw3KK8OhFXfurkFTMN8IosMmJo
	TP+BI1hEHk/lkbde3WXt5w4nkaCpkGOwISWD4wEnFVhmcpTzmKPyXVs1LqEWSPHHf16GIs+qum3
	zdQYRIhuAgSHE+KbAiSHwawwE=
X-Google-Smtp-Source: AGHT+IFzPWHnDgUDinNYe1ZEmAIzJ12MBdDWxQC/AVHPFqofe8A7VZaxHTltAJXmVlPiRtHMQZvgAdOddIQ368VSsyA=
X-Received: by 2002:a05:622a:1304:b0:474:fab0:6564 with SMTP id
 d75a77b69052e-47ad810ebe9mr20519031cf.37.1744801648774; Wed, 16 Apr 2025
 04:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325014733.18405-1-xuewen.yan@unisoc.com> <CAKfTPtA06D1EGg2VdVHt-P0PDE-1XZVJOp3myZPSNknnFT3nNg@mail.gmail.com>
 <CAB8ipk_uOKn+U0ozZyaQ8J9OjifoZWSh-9NUQ9UD+K-kLV28vw@mail.gmail.com> <CAKfTPtD2T8Qm-6Nq-9qODQASoU9Wn1Ujk4uQbbN1Dvo3+EFZFA@mail.gmail.com>
In-Reply-To: <CAKfTPtD2T8Qm-6Nq-9qODQASoU9Wn1Ujk4uQbbN1Dvo3+EFZFA@mail.gmail.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Wed, 16 Apr 2025 19:07:18 +0800
X-Gm-Features: ATxdqUFjiE9TA2WgqXwrZAU_FK-8AvgIgl_L6AQT61PMVJxzaYeSKDyp8bYVE5g
Message-ID: <CAB8ipk-G_Q20Cyx69GRY5pdTj9C4SyVyiuRVFi-i-otQ1zBVFg@mail.gmail.com>
Subject: Re: [PATCH v2] sched/uclamp: Align uclamp and util_est and call
 before freq update
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Xuewen Yan <xuewen.yan@unisoc.com>, dietmar.eggemann@arm.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	hongyan.xia2@arm.com, qyousef@layalina.io, ke.wang@unisoc.com, 
	di.shen@unisoc.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:42=E2=80=AFPM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Wed, 16 Apr 2025 at 04:55, Xuewen Yan <xuewen.yan94@gmail.com> wrote:
> >
> > On Wed, Apr 16, 2025 at 1:05=E2=80=AFAM Vincent Guittot
> > <vincent.guittot@linaro.org> wrote:
> > >
> > > On Tue, 25 Mar 2025 at 02:48, Xuewen Yan <xuewen.yan@unisoc.com> wrot=
e:
> > > >
> > > > When task's uclamp is set, we hope that the CPU frequency
> > > > can increase as quickly as possible when the task is enqueued.
> > > > Because the cpu frequency updating happens during the enqueue_task(=
),
> > >
> > > Strictly speaking, it doesn't happen during enqueue_task but when :
> > > - attach/detach tasks when migrating
> > > - update_load_avg decayed
> > > - io_wait
> > >
> > > This often happens during an enqueue but not always ...
> >
> > Okay, I would make some adjustments to these descriptions.
> >
> > >
> > > > so the rq's uclamp needs to be updated before the task is enqueued,
> > >
> > > this doesn't ensure that new rq's uclamp will be taken into account
> >
> > Did I miss something?
> >
> > As following stack:
> > enqueue_task_fair()
> > update_load_avg()
> > cfs_rq_util_change(cfs_rq, 0);
>
> As mentioned above, this doesn't always happen so you are not ensured
> to take uclamp into account. If you mandate to take uclamp value into
> account immediately this is not enough

I understand your point now. I think what you're referring to is a
different issue, just like what we discussed earlier with Prateek:
https://lore.kernel.org/all/CAB8ipk_1=3DU_HgVQrfQ4VRUDrcHJBQd2LJ9aXh8PG6E-Z=
4_xS+g@mail.gmail.com/

However, I think the purpose of this patch is to ensure that during
the enqueue_task process, if a frequency change is triggered, the
uclamp has already been updated before the frequency is changed.

>
> > cpufreq_update_util()
> >   sugov_update_shared()
> >     sugov_next_freq_shared()
> >      sugov_get_util()
> >         effective_cpu_util()
> >             *min =3D max(irq + cpu_bw_dl(rq), uclamp_rq_get(rq, UCLAMP_=
MIN));
> >             *max =3D min(scale, uclamp_rq_get(rq, UCLAMP_MAX));
> >
> > So, the rq's uclamp value should update before enqueue_task().
> > >
> > > > just like util_est.
> > >
> > > just like util_est
> > >
> > > > So, aline the uclamp and util_est and call before freq update.
> > >
> > > nit s/aline/align/ ?
> > align.
> > >
> > > >
> > > > For sched-delayed tasks, the rq uclamp/util_est should only be upda=
ted
> > > > when they are enqueued upon being awakened.
> > > > So simply the logic of util_est's enqueue/dequeue check.
> > > >
> > > > Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> > > > ---
> > > > v2:
> > > > - simply the util-est's en/dequeue check;
> > > > ---
> > > > Previous discussion:
> > > > https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9T=
LTWW-iWTQKiA@mail.gmail.com/
> > > > https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276dad3=
1.1740664400.git.hongyan.xia2@arm.com/T/#u
> > > > https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=3DAi7tFzO=3D=
=3D=3DmpLD3obNdV4=3DJ-A@mail.gmail.com/T/#u
> > > > https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd7036771@ar=
m.com/
> > > > ---
> > > >  kernel/sched/core.c | 17 ++++++++++-------
> > > >  kernel/sched/fair.c |  4 ++--
> > > >  2 files changed, 12 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > > index 042351c7afce..72fbe2031e54 100644
> > > > --- a/kernel/sched/core.c
> > > > +++ b/kernel/sched/core.c
> > > > @@ -1747,7 +1747,7 @@ static inline void uclamp_rq_dec_id(struct rq=
 *rq, struct task_struct *p,
> > > >         }
> > > >  }
> > > >
> > > > -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct=
 *p)
> > > > +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct=
 *p, int flags)
> > > >  {
> > > >         enum uclamp_id clamp_id;
> > > >
> > > > @@ -1763,7 +1763,8 @@ static inline void uclamp_rq_inc(struct rq *r=
q, struct task_struct *p)
> > > >         if (unlikely(!p->sched_class->uclamp_enabled))
> > > >                 return;
> > > >
> > > > -       if (p->se.sched_delayed)
> > > > +       /* Only inc the delayed task which being woken up. */
> > > > +       if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
> > > >                 return;
> > > >
> > > >         for_each_clamp_id(clamp_id)
> > > > @@ -2031,7 +2032,7 @@ static void __init init_uclamp(void)
> > > >  }
> > > >
> > > >  #else /* !CONFIG_UCLAMP_TASK */
> > > > -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct=
 *p) { }
> > > > +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct=
 *p, int flags) { }
> > > >  static inline void uclamp_rq_dec(struct rq *rq, struct task_struct=
 *p) { }
> > > >  static inline void uclamp_fork(struct task_struct *p) { }
> > > >  static inline void uclamp_post_fork(struct task_struct *p) { }
> > > > @@ -2067,12 +2068,14 @@ void enqueue_task(struct rq *rq, struct tas=
k_struct *p, int flags)
> > > >         if (!(flags & ENQUEUE_NOCLOCK))
> > > >                 update_rq_clock(rq);
> > > >
> > > > -       p->sched_class->enqueue_task(rq, p, flags);
> > > >         /*
> > > > -        * Must be after ->enqueue_task() because ENQUEUE_DELAYED c=
an clear
> > > > -        * ->sched_delayed.
> > > > +        * Can be before ->enqueue_task() because uclamp considers =
the
> > > > +        * ENQUEUE_DELAYED task before its ->sched_delayed gets cle=
ared
> > > > +        * in ->enqueue_task().
> > > >          */
> > > > -       uclamp_rq_inc(rq, p);
> > > > +       uclamp_rq_inc(rq, p, flags);
> > > > +
> > > > +       p->sched_class->enqueue_task(rq, p, flags);
> > > >
> > > >         psi_enqueue(p, flags);
> > > >
> > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > index c798d2795243..c92fee07fb7b 100644
> > > > --- a/kernel/sched/fair.c
> > > > +++ b/kernel/sched/fair.c
> > > > @@ -6930,7 +6930,7 @@ enqueue_task_fair(struct rq *rq, struct task_=
struct *p, int flags)
> > > >          * Let's add the task's estimated utilization to the cfs_rq=
's
> > > >          * estimated utilization, before we update schedutil.
> > > >          */
> > > > -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (f=
lags & ENQUEUE_RESTORE))))
> > > > +       if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
> > >
> > > commit message doesn't explain why you change util_est condition
> >
> > Because, the sched_delayed flag is set when dequeue_entity, and clear
> > after the condition,
> > so for migrating/prio_change, we could just check the sched_delayed.
>
> Why is testing sched_delayed enough for migrating/prio_change ?
> With your change, we will remove then add back util_est when changing
> prio of the task which is useless

I sincerely apologize for any misunderstanding my previous description
may have caused.
When changing prio without changing class, the delayed_task's
sched_delayed flag is not changed,
we would not remove then add back util_est.
If the class was changed=EF=BC=9A

if (prev_class !=3D next_class && p->se.sched_delayed)
                 dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED |
DEQUEUE_NOCLOCK);

It will dequeue the delayed-task first, and will not enqueue it.

As for normal tasks which are not delayed, indeed, the issue you
mentioned can occur, but it seems that this problem has always
existed. Perhaps this is a new issue that has come up.

Thanks!

---
xuewen.yan

>
>
> > And for the wakeup, because the the sched_delayed flag is cleared after=
 this,
> > so use the ENQUEUE_DELAYED flag to ensure the util_est could enqueue.
> >
> > >
> > > >                 util_est_enqueue(&rq->cfs, p);
> > > >
> > > >         if (flags & ENQUEUE_DELAYED) {
> > > > @@ -7168,7 +7168,7 @@ static int dequeue_entities(struct rq *rq, st=
ruct sched_entity *se, int flags)
> > > >   */
> > > >  static bool dequeue_task_fair(struct rq *rq, struct task_struct *p=
, int flags)
> > > >  {
> > > > -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (f=
lags & DEQUEUE_SAVE))))
> > > > +       if (!p->se.sched_delayed)
> > >
> > > same here, you should explain in commit message why it's okay to do s=
o
> >
> > Same as above,  the sched_delayed flag is set when dequeue_entity, so
> > this place,
> > the sched_delayed was not set when sleeping, If the flag is set, it
> > indicates that it
> > was migrating or prio changing.
> >
> > By the way, I will kindly update these reasons in the commit message.
> >
> > Thanks!
> >
> > BR
> > ---
> > xuewen
