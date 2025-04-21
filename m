Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C920C490
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 21:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745269250; cv=none; b=FNBeN97fM/CdGsPSzbIgnrx2vnZSf8ClP8a66fsZV74zWXrpytIwXjZ+RvzcomfU5SRlZrCVnWHpClj0ghmHcrybDepSiYoC1g5LHcFOHdZ6KNYvl4VArm+2nCTavJ63t7Lbb/zXcdMoN8HOibV5XZbBRwnWe4T/6Vnu4jLAxWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745269250; c=relaxed/simple;
	bh=X1jHuCwUhbc8CgK4fx/1Cpo7vTjQlrGcALuCtueRpUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFcun/vd6ucb5caG70IpXeHMp9dZqP3XOEcgxsZO08hTovQvNrofuqrk3hJV9IT6UsUzpiT8Egq6M8PI6WZuNfj/L5aK0CVt9niXPiMYYbhUHvCqDc7R/gR8h6h+8o+8N9IyyCaytOZsUSTXdj01SYH4ohjHWc5QXNEKXxDhlr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JvAqL2lp; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JvAqL2lp"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so4134203e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745269246; x=1745874046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/ef0QIdsbFIRtx9jlRiRg+7C8e7blqdvxUWHcfJI5w=;
        b=JvAqL2lpIsFuOyyfW+AKFXCFddsptJkJjvL3FxRF5++ndnIPTfSoSwzHQgV3uNztHl
         G3MarAzGY0z0JS0/9ZIDKpQ9VYUEZpGCFWK9IqqM2Z2OoUXE5NGnEiVbfWXZNMFmQFDT
         y19UeUMiJJNg0StCXi87cJXMX/6Mhk/qQ9HLd4kiMe9NuOGPlttT4+qUdjw+gcLG3X7a
         uAFPigwCDmFdLD1syPRfg1LcnRnBuYulEcm0VXUBiS3DRz4zksmFtM4/A2b4DG6PFTuX
         uNE14InfETUAdBaG6wc+BGaTBQxG1JJ3qOJDcm5KwoIHUEr6usCW5i9hVBJq5V0g7Xxc
         FdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745269246; x=1745874046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/ef0QIdsbFIRtx9jlRiRg+7C8e7blqdvxUWHcfJI5w=;
        b=u26yt95jDwRhR1iWO4RKHhSNTh8jP6b6UDTW1qfvcYjfE8D51oXIUfiWqWoGAr6liT
         Jeu8t3Z00in6dtUbVL6+F0PB5fyXzcDwQKD5+fBI9e2vvPo4e5dvrRusv8p3AdFrUaHE
         oD4GNNqzWhYFdlzOImoT/6d53LtPXwCeRFfKNwALJizfUbXl4JmIWA589fQ6GcF+DFjA
         nq4chThQEV6pWjX9m/GQwVIqPR/LvX1AQXECBvRjU2t9dWzdHw5zUWJDOcG/QNotJCSV
         VZhcQ3hc+ZbXjsEJr4PxZWjCZff7yNeit+iGr0ciYejzk8UBgtQJPnGdbgwYWY+BH2Qo
         LW9A==
X-Gm-Message-State: AOJu0Yw6dra1knwnvcUnuMrVAys13qiB5Qgn2FSkdNaoHNfkX/fFyzfb
	goYjCGUjWvEJQIOV4Er9cBehfff3x7luU0iN6d7YLjDPSbNso6Cae1zSDfdIThmjpjnTmm0ggKP
	3kgxonD6abzMZGAXv1FVfIFiYG7PRV6Cb5a4=
X-Gm-Gg: ASbGncuC0rVuaxNxa/BC1+HeeYyYkf/mm3c9VN6bFGygZKzFkLsiNnagHMiy0/2Mcc+
	PSQBzR0sPrl+VAISkRA4CuRo5pAeHYhCv3TTTB7yOSzee2stEdb9Fvkkj7NlCkQF6vf1saSGCLB
	bxxG2nOfkgPKNsL/pMe3E7ffeQ0F37Btr6
X-Google-Smtp-Source: AGHT+IGWkv0PB/y8W89y57gUsBPwi6gyPbTUeNftwKo0Yk3NywqYCgiK0Ly5yDQ24nDota0iCXJSzMSb7fy/pclSEvs=
X-Received: by 2002:a05:6512:b0b:b0:54a:c514:76f0 with SMTP id
 2adb3069b0e04-54d6e6275abmr3226934e87.14.1745269246134; Mon, 21 Apr 2025
 14:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com> <20250412060258.3844594-5-jstultz@google.com>
 <20250417111235.GK38216@noisy.programming.kicks-ass.net>
In-Reply-To: <20250417111235.GK38216@noisy.programming.kicks-ass.net>
From: John Stultz <jstultz@google.com>
Date: Mon, 21 Apr 2025 14:00:34 -0700
X-Gm-Features: ATxdqUGfzeYq0nzoLy5kG6ahO8saQ7Hj_B7WutzXpWQXC49dEudfwojD7EyjMSY
Message-ID: <CANDhNCq7SETQ7j6ifUoF_Pwiv42RNfv9V3AV+=OWg_U4+gZVbA@mail.gmail.com>
Subject: Re: [PATCH v16 4/7] sched: Fix runtime accounting w/ split exec &
 sched contexts
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 4:12=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> On Fri, Apr 11, 2025 at 11:02:38PM -0700, John Stultz wrote:
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index e43993a4e5807..da8b0970c6655 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -1143,22 +1143,33 @@ static void update_tg_load_avg(struct cfs_rq *c=
fs_rq)
> >  }
> >  #endif /* CONFIG_SMP */
> >
> > -static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
> > +static s64 update_se_times(struct rq *rq, struct sched_entity *se)
>
> update_se()

Sure thing!

> >  {
> >       u64 now =3D rq_clock_task(rq);
> >       s64 delta_exec;
> >
> > -     delta_exec =3D now - curr->exec_start;
> > +     delta_exec =3D now - se->exec_start;
> >       if (unlikely(delta_exec <=3D 0))
> >               return delta_exec;
> >
> > -     curr->exec_start =3D now;
> > -     curr->sum_exec_runtime +=3D delta_exec;
> > +     se->exec_start =3D now;
> > +     if (entity_is_task(se)) {
> > +             struct task_struct *running =3D rq->curr;
> > +             /*
> > +              * If se is a task, we account the time against the runni=
ng
> > +              * task, as w/ proxy-exec they may not be the same.
> > +              */
> > +             running->se.exec_start =3D now;
> > +             running->se.sum_exec_runtime +=3D delta_exec;
> > +     } else {
> > +             /* If not task, account the time against se */
> > +             se->sum_exec_runtime +=3D delta_exec;
> > +     }
>
>
> So I am confused; you're accounting runtime to the actual running task,
> but then accounting the same runtime to the cgroup of the donor.
>
> This seems somewhat irregular.

So, apologies, as it's been a bit since I've deeply thought on this.
In general we want to charge the donor for everything since it's
donating its time, etc. However, without this change, we got some
strange behavior in top, etc, because the proxy tasks that actually
ran didn't seem to gain any exec_runtime. So the split of charging
everything to the donor except the sum_exec_runtime to the actually
running process (the proxy) made sense.

Now, for cgroup accounting, it seems like we'd still want to charge
the donor's cgroup, so whatever restrictions there are in place apply
to the donor, but it's just when we get to the leaf task we charge the
proxy instead.

Does that sound reasonable? Or am I making a bad assumption here
around the cgroup logic?

> Please consider all of update_curr_task(), and if they all want to be
> against rq->curr, rather than rq->donor then more changes are needed.

So I think we are ok here, but it is confusing... see more below.


> > @@ -1213,7 +1224,7 @@ s64 update_curr_common(struct rq *rq)
> >       struct task_struct *donor =3D rq->donor;
> >       s64 delta_exec;
> >
> > -     delta_exec =3D update_curr_se(rq, &donor->se);
> > +     delta_exec =3D update_se_times(rq, &donor->se);
> >       if (likely(delta_exec > 0))
> >               update_curr_task(donor, delta_exec);
> >
> > @@ -1233,7 +1244,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
> >       if (unlikely(!curr))
> >               return;
> >
> > -     delta_exec =3D update_curr_se(rq, curr);
> > +     delta_exec =3D update_se_times(rq, curr);
> >       if (unlikely(delta_exec <=3D 0))
> >               return;
>
> I think I've tripped over this before, on how update_curr_common() uses
> donor and update_curr() curr. This definitely needs a comment. Because
> at first glance they're not the same.

I suspect part of the incongruity/dissonance comes from the
cfs_rq->curr is actually the rq->donor (where rq->donor and rq->curr
are different), as its what the sched-class picked to run.

Renaming that I think might clarify things, but I have been hesitant
to cause too much naming churn in the series, but maybe it's the right
time to do it if it's causing confusion.

My other hesitancy there, is around wanting the proxy logic to be
focused in the core, so the sched-class "curr" can still be what the
class selected to run, its just proxy might pick something else to
actually run. But the top level rq->curr not being the cfs_rq->curr is
prone to confusion, and we already do have rq->donor references in
fair.c so its not like it's perfectly encapsulated and layered.

But I'll take a pass at renaming cfs_rq->curr to cfs_rq->donor, unless
you object.

thanks
-john
