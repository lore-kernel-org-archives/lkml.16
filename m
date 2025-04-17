Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F558184E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744853974; cv=none; b=cZF9wSSk9Vq8JxzNP1vU61A3uEAgXaefR6sXxXCeTfugES8jwR7NgVceXaBLtxuDTSGZlhV6ZhUaeeHioYJMPnR7k+RikJAKuVPbapIhv8efAeshPvrD7aOvGndHHuwu9yMRW/FBTP7Ivc+gLAw1u4FEUjyZGSUYgONx0KbVgQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744853974; c=relaxed/simple;
	bh=h62JHsQmqhsDsN4CaKaBiijN1lqzL+rYXcIMo9hSL9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SACKklJAjYAOoJp0pYrt71OSskAre37hQYSfaFR66vjvB/e6yEKCq9RJppM5eRhI4LFEjD/JmpAIKkFblkdt6C875fsEgvQ3Pxed0D1YyYTuvLn1jqiUaNAbVHwtdkKjSlBj3iuciglJTFlV97Y+EoHmcA7I5NoGObMKYa0cTy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxFi7y0C; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxFi7y0C"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4774ce422easo2707741cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744853971; x=1745458771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOe1djEik/yP7e5cg6YlAaCrKcDKxWOtCMdsfblIQ2Q=;
        b=YxFi7y0CBxOinZvr7bxcnCGjvl3a7h71i3kjNxY6ZyZTnSzrbQ8tpLhFT/E6VDfeLJ
         bBrNfge44C/j8n7Xv53l9By76MDEuAgK3TgN0sfSDiNVDvkYLFL3/qooyMM20lde+Toy
         Pwrt1uebbJuoOul/prfk8ECoTUJ9TOEJtbCAeHmcFJ5w15K8xJQYl68lyYr/duJ3cL27
         cuJrjJdBS5X+CZGoOZ6Ga02TVzlS5WP0Umz5GvujOCHltX8TUJak1cYQImwcu/71BBhF
         x4UtwJ6jN73At+7bqop8ilJAeFHQemx/ymQJFNEKvqHWn9Xj3Tfqzz6+UJUWG2fz2yd8
         4wFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744853971; x=1745458771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOe1djEik/yP7e5cg6YlAaCrKcDKxWOtCMdsfblIQ2Q=;
        b=Udgl+eeKonjy4jemi70gL3QJ5y70G48iJrQgs4uLrCy6c/qjF9dQcyGzS0a8k1UFLi
         UVEYcd80aTGpwscZEBAW/RNTxAySakL+/3peu+Y7T9mXcqfmQQn+sBva/V66p2iMlylK
         gTMbSqQTeriQ7Yph2y5zgFh0LPEHIZFfhYOnjM+sUbq5DQOq4IGrBSRzVF6APyqCZ/si
         btqkNFNQ1deE/Eg1gGVY4+3oH2LJJkwphDfIohBvGXJ5cHgzGcFn/3x8M2kb6zh37T7/
         1f2ktwGQVKFAjPgCL/15GICjI8UMFp1Oapdljpq1WddwXpphkAAUr2VN8+OhEo9ktbNE
         SnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbgTT8JiZiGQ8kCbvRA1xasT3RIUvduFs4EFpOyXGYpdtLEPHIBrk0Iz/RRII53uAllgc+3jWf1XPzeUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuP24koYwcYvXgn/N7ADKyFztGpd7G4tHhqfc6POURvqypc/1r
	Zuq9ysa01R+YooccWUeP96Fq1OLmr8rR4dEQpiGg/p/jfRFt1QhLlIlV9GUWKgsiTmBfev1I2N/
	Ol76bucTaqstcDsc9VuRBjHiKsq0=
X-Gm-Gg: ASbGncvFrNTPU3deBVpvY3tFO87VlOl++M59ovRnALBrcccaRVtSpfekQNgXxOGNefj
	RHcZQlMGlmlqMA7AiSeHAOjzHJVorxaAHnscSZp6A7eYzEBRE3XL2te+XMApfic9JGzkqZvxDpz
	zq5alXFwdfxNd0QBBaK8wSD6I=
X-Google-Smtp-Source: AGHT+IHLFEGnsnz/A7PMGzkHiB7EB+L+kYeTk3TNV3Pu5ivO4IWuJvNlG33dcAmcUCnvaiFqGlS89axp8Oha5cbekvk=
X-Received: by 2002:a05:622a:110:b0:476:7ff5:cc27 with SMTP id
 d75a77b69052e-47ad81369d4mr54399261cf.51.1744853970800; Wed, 16 Apr 2025
 18:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325014733.18405-1-xuewen.yan@unisoc.com> <CAKfTPtA06D1EGg2VdVHt-P0PDE-1XZVJOp3myZPSNknnFT3nNg@mail.gmail.com>
 <CAB8ipk_uOKn+U0ozZyaQ8J9OjifoZWSh-9NUQ9UD+K-kLV28vw@mail.gmail.com>
 <CAKfTPtD2T8Qm-6Nq-9qODQASoU9Wn1Ujk4uQbbN1Dvo3+EFZFA@mail.gmail.com>
 <CAB8ipk-G_Q20Cyx69GRY5pdTj9C4SyVyiuRVFi-i-otQ1zBVFg@mail.gmail.com> <CAKfTPtC2XA_DUy5zjPo4Xr1r7W-CFiZEwabEQcZPk0FDLxc3QQ@mail.gmail.com>
In-Reply-To: <CAKfTPtC2XA_DUy5zjPo4Xr1r7W-CFiZEwabEQcZPk0FDLxc3QQ@mail.gmail.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 17 Apr 2025 09:39:20 +0800
X-Gm-Features: ATxdqUG7uw4wqEJrmgqfbfOZatsx4xEaRx63LWD7GmG-cKLy-tUrpnQ-Vz6_M0U
Message-ID: <CAB8ipk-d2Yj8kEaEHBFvM7w1kedocStS8U2L0Ypv0mgbiK5MHQ@mail.gmail.com>
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

On Wed, Apr 16, 2025 at 8:19=E2=80=AFPM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Wed, 16 Apr 2025 at 13:07, Xuewen Yan <xuewen.yan94@gmail.com> wrote:
> >
> > On Wed, Apr 16, 2025 at 5:42=E2=80=AFPM Vincent Guittot
> > <vincent.guittot@linaro.org> wrote:
> > >
> > > On Wed, 16 Apr 2025 at 04:55, Xuewen Yan <xuewen.yan94@gmail.com> wro=
te:
> > > >
> > > > On Wed, Apr 16, 2025 at 1:05=E2=80=AFAM Vincent Guittot
> > > > <vincent.guittot@linaro.org> wrote:
> > > > >
> > > > > On Tue, 25 Mar 2025 at 02:48, Xuewen Yan <xuewen.yan@unisoc.com> =
wrote:
> > > > > >
> > > > > > When task's uclamp is set, we hope that the CPU frequency
> > > > > > can increase as quickly as possible when the task is enqueued.
> > > > > > Because the cpu frequency updating happens during the enqueue_t=
ask(),
> > > > >
> > > > > Strictly speaking, it doesn't happen during enqueue_task but when=
 :
> > > > > - attach/detach tasks when migrating
> > > > > - update_load_avg decayed
> > > > > - io_wait
> > > > >
> > > > > This often happens during an enqueue but not always ...
> > > >
> > > > Okay, I would make some adjustments to these descriptions.
> > > >
> > > > >
> > > > > > so the rq's uclamp needs to be updated before the task is enque=
ued,
> > > > >
> > > > > this doesn't ensure that new rq's uclamp will be taken into accou=
nt
> > > >
> > > > Did I miss something?
> > > >
> > > > As following stack:
> > > > enqueue_task_fair()
> > > > update_load_avg()
> > > > cfs_rq_util_change(cfs_rq, 0);
> > >
> > > As mentioned above, this doesn't always happen so you are not ensured
> > > to take uclamp into account. If you mandate to take uclamp value into
> > > account immediately this is not enough
> >
> > I understand your point now. I think what you're referring to is a
> > different issue, just like what we discussed earlier with Prateek:
> > https://lore.kernel.org/all/CAB8ipk_1=3DU_HgVQrfQ4VRUDrcHJBQd2LJ9aXh8PG=
6E-Z4_xS+g@mail.gmail.com/
> >
> > However, I think the purpose of this patch is to ensure that during
> > the enqueue_task process, if a frequency change is triggered, the
> > uclamp has already been updated before the frequency is changed.
>
> okay, so please update the commit message because " When task's uclamp
> is set, we hope that the CPU frequency
>  can increase as quickly as possible when the task is enqueued." is confu=
sing
Okay.

>
> >
> > >
> > > > cpufreq_update_util()
> > > >   sugov_update_shared()
> > > >     sugov_next_freq_shared()
> > > >      sugov_get_util()
> > > >         effective_cpu_util()
> > > >             *min =3D max(irq + cpu_bw_dl(rq), uclamp_rq_get(rq, UCL=
AMP_MIN));
> > > >             *max =3D min(scale, uclamp_rq_get(rq, UCLAMP_MAX));
> > > >
> > > > So, the rq's uclamp value should update before enqueue_task().
> > > > >
> > > > > > just like util_est.
> > > > >
> > > > > just like util_est
> > > > >
> > > > > > So, aline the uclamp and util_est and call before freq update.
> > > > >
> > > > > nit s/aline/align/ ?
> > > > align.
> > > > >
> > > > > >
> > > > > > For sched-delayed tasks, the rq uclamp/util_est should only be =
updated
> > > > > > when they are enqueued upon being awakened.
> > > > > > So simply the logic of util_est's enqueue/dequeue check.
> > > > > >
> > > > > > Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> > > > > > ---
> > > > > > v2:
> > > > > > - simply the util-est's en/dequeue check;
> > > > > > ---
> > > > > > Previous discussion:
> > > > > > https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBG=
tt9TLTWW-iWTQKiA@mail.gmail.com/
> > > > > > https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276=
dad31.1740664400.git.hongyan.xia2@arm.com/T/#u
> > > > > > https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=3DAi7tFzO=
=3D=3D=3DmpLD3obNdV4=3DJ-A@mail.gmail.com/T/#u
> > > > > > https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd703677=
1@arm.com/
> > > > > > ---
> > > > > >  kernel/sched/core.c | 17 ++++++++++-------
> > > > > >  kernel/sched/fair.c |  4 ++--
> > > > > >  2 files changed, 12 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > > > > index 042351c7afce..72fbe2031e54 100644
> > > > > > --- a/kernel/sched/core.c
> > > > > > +++ b/kernel/sched/core.c
> > > > > > @@ -1747,7 +1747,7 @@ static inline void uclamp_rq_dec_id(struc=
t rq *rq, struct task_struct *p,
> > > > > >         }
> > > > > >  }
> > > > > >
> > > > > > -static inline void uclamp_rq_inc(struct rq *rq, struct task_st=
ruct *p)
> > > > > > +static inline void uclamp_rq_inc(struct rq *rq, struct task_st=
ruct *p, int flags)
> > > > > >  {
> > > > > >         enum uclamp_id clamp_id;
> > > > > >
> > > > > > @@ -1763,7 +1763,8 @@ static inline void uclamp_rq_inc(struct r=
q *rq, struct task_struct *p)
> > > > > >         if (unlikely(!p->sched_class->uclamp_enabled))
> > > > > >                 return;
> > > > > >
> > > > > > -       if (p->se.sched_delayed)
> > > > > > +       /* Only inc the delayed task which being woken up. */
> > > > > > +       if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
> > > > > >                 return;
> > > > > >
> > > > > >         for_each_clamp_id(clamp_id)
> > > > > > @@ -2031,7 +2032,7 @@ static void __init init_uclamp(void)
> > > > > >  }
> > > > > >
> > > > > >  #else /* !CONFIG_UCLAMP_TASK */
> > > > > > -static inline void uclamp_rq_inc(struct rq *rq, struct task_st=
ruct *p) { }
> > > > > > +static inline void uclamp_rq_inc(struct rq *rq, struct task_st=
ruct *p, int flags) { }
> > > > > >  static inline void uclamp_rq_dec(struct rq *rq, struct task_st=
ruct *p) { }
> > > > > >  static inline void uclamp_fork(struct task_struct *p) { }
> > > > > >  static inline void uclamp_post_fork(struct task_struct *p) { }
> > > > > > @@ -2067,12 +2068,14 @@ void enqueue_task(struct rq *rq, struct=
 task_struct *p, int flags)
> > > > > >         if (!(flags & ENQUEUE_NOCLOCK))
> > > > > >                 update_rq_clock(rq);
> > > > > >
> > > > > > -       p->sched_class->enqueue_task(rq, p, flags);
> > > > > >         /*
> > > > > > -        * Must be after ->enqueue_task() because ENQUEUE_DELAY=
ED can clear
> > > > > > -        * ->sched_delayed.
> > > > > > +        * Can be before ->enqueue_task() because uclamp consid=
ers the
> > > > > > +        * ENQUEUE_DELAYED task before its ->sched_delayed gets=
 cleared
> > > > > > +        * in ->enqueue_task().
> > > > > >          */
> > > > > > -       uclamp_rq_inc(rq, p);
> > > > > > +       uclamp_rq_inc(rq, p, flags);
> > > > > > +
> > > > > > +       p->sched_class->enqueue_task(rq, p, flags);
> > > > > >
> > > > > >         psi_enqueue(p, flags);
> > > > > >
> > > > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > > > index c798d2795243..c92fee07fb7b 100644
> > > > > > --- a/kernel/sched/fair.c
> > > > > > +++ b/kernel/sched/fair.c
> > > > > > @@ -6930,7 +6930,7 @@ enqueue_task_fair(struct rq *rq, struct t=
ask_struct *p, int flags)
> > > > > >          * Let's add the task's estimated utilization to the cf=
s_rq's
> > > > > >          * estimated utilization, before we update schedutil.
> > > > > >          */
> > > > > > -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) |=
| (flags & ENQUEUE_RESTORE))))
> > > > > > +       if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
> > > > >
> > > > > commit message doesn't explain why you change util_est condition
> > > >
> > > > Because, the sched_delayed flag is set when dequeue_entity, and cle=
ar
> > > > after the condition,
> > > > so for migrating/prio_change, we could just check the sched_delayed=
.
> > >
> > > Why is testing sched_delayed enough for migrating/prio_change ?
> > > With your change, we will remove then add back util_est when changing
> > > prio of the task which is useless
> >
> > I sincerely apologize for any misunderstanding my previous description
> > may have caused.
> > When changing prio without changing class, the delayed_task's
> > sched_delayed flag is not changed,
> > we would not remove then add back util_est.
> > If the class was changed=EF=BC=9A
> >
> > if (prev_class !=3D next_class && p->se.sched_delayed)
> >                  dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED |
> > DEQUEUE_NOCLOCK);
> >
> > It will dequeue the delayed-task first, and will not enqueue it.
> >
> > As for normal tasks which are not delayed, indeed, the issue you
> > mentioned can occur, but it seems that this problem has always
> > existed. Perhaps this is a new issue that has come up.
>
> I have been confused by the patch that added  the condition "if
> (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags &
> ENQUEUE_RESTORE))))". I wrongly thought it was for
> dequeue_save/enqueue_restore
>
> Could you please split this in 2 patches :
> patch 1 updates condition for util_est_dequeue/enqueue  and a
> description why it's safe
> patch 2 for aligning uclamp with util_est
>
Alright, I will make the changes in patch-v3 as well.

Thanks!

> Thanks
>
> >
> > Thanks!
> >
> > ---
> > xuewen.yan
> >
> > >
> > >
> > > > And for the wakeup, because the the sched_delayed flag is cleared a=
fter this,
> > > > so use the ENQUEUE_DELAYED flag to ensure the util_est could enqueu=
e.
> > > >
> > > > >
> > > > > >                 util_est_enqueue(&rq->cfs, p);
> > > > > >
> > > > > >         if (flags & ENQUEUE_DELAYED) {
> > > > > > @@ -7168,7 +7168,7 @@ static int dequeue_entities(struct rq *rq=
, struct sched_entity *se, int flags)
> > > > > >   */
> > > > > >  static bool dequeue_task_fair(struct rq *rq, struct task_struc=
t *p, int flags)
> > > > > >  {
> > > > > > -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) |=
| (flags & DEQUEUE_SAVE))))
> > > > > > +       if (!p->se.sched_delayed)
> > > > >
> > > > > same here, you should explain in commit message why it's okay to =
do so
> > > >
> > > > Same as above,  the sched_delayed flag is set when dequeue_entity, =
so
> > > > this place,
> > > > the sched_delayed was not set when sleeping, If the flag is set, it
> > > > indicates that it
> > > > was migrating or prio changing.
> > > >
> > > > By the way, I will kindly update these reasons in the commit messag=
e.
> > > >
> > > > Thanks!
> > > >
> > > > BR
> > > > ---
> > > > xuewen
