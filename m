Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA7C1DA634
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744838664; cv=none; b=EDVHw5t07VH64+teaVCcIityjANAHeLlK4WszTb/KH8qv7d0KJjT9u4ZI46w/L+a2dklxuB29ZV35lyr3GguDkOMPNgeyCSoVh4ybDw5zVHuTftq8zFUf3YAgsCu67bwCoYaHqBMTRKqc2SRVVc765F97Wj67Sk1EXT82p9twx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744838664; c=relaxed/simple;
	bh=oOIdpPqPqawwVC4Eb6gdaErL8CtPK9bgjwuDVuHScOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtO6Z0iQVLtgt9XrdyDwEIA9a9i2nrFaF8tDtIvpvhp+ED722xqHYRlL6807gCdVuIVLwbYQbiKG3z88LmYfX5whX7jHBt1PZQmpjWSARF+S/ljHe03s2m5wGVhfPCms8SQTund+cNOm7I8qlWFob7O2VFCPn+ZXERKjz+tIkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vikCdILF; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vikCdILF"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b166fa41bso147884e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744838659; x=1745443459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKPCwVsSRj84P8iMOkHQmQ63gXozpJ8C4/vWCWBaicA=;
        b=vikCdILFuN5KDgamtNFwsdRjO6XISAoonpNxyyIx4qfvUfkATzCeoOoa0ApxP7YdUn
         akY+5Dh12Y4md6zAGkFMusYOI5HFIcBqV5XNdUcB4giN/i/wNENyQPhjqf0omYO+ySl5
         kKCZOWIBFb9Mgqz9caO8ncAm67zriz2eOr2/zthqx6OeR+5N/5ke0WnhPM9Lh8UutJUp
         Am+R1ta8vt60e+jeQ2c5KPpkVVswDIYOAwuGWh/gKZ4guhbx5nEutdFvAyCWGYvW7wPi
         XWMdGKdlWY1cqycOQqjtLntxaxgeQlS5IBZ+puLqBkGt+5eynIO4y0XXz2jvII+FrFkc
         vMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744838659; x=1745443459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKPCwVsSRj84P8iMOkHQmQ63gXozpJ8C4/vWCWBaicA=;
        b=XmdDgrED1WRKzghctwgOcEFRx4G1aDKlGbEMY41fR10tNo3TmwhH8bjZmjmVDvn0hX
         abVr16YDCXqx8fMLnNjuyWcmy/qOv0ylPXd9DREq3TXkdfuJwW4aXTe0eb+yhmatRuX7
         ZtUdhS4YtqfCSeu1GOR/1nZxvfKmtLkYSXgGoBI6S1HI4y0zykp/oeEf4BzIUep+O567
         fn8K+SJ37b84dN+SUEpSNDlh43guL+8cEv3mVyRSpO8VY7aAHOe3G4phRp4rB0LJ7mtd
         rs5hN4mGzuN+hmVXOE1uOU8DQLFGbBSuOCrktrWM0rvAeFrOsb7azz81hkAeR2ngPsI1
         xSCw==
X-Gm-Message-State: AOJu0YzoVmbmiwzAr4DkpxiC9Htet1+Fp/4Vy+Hxn9xRgN49lXLCWRZy
	/wIrrcOGUqX+s2UnGyyDTrDpHFAsDCSmcrafEvw/PGi6+78W2SE/8Y7aJCtLleCeMo1Mu07RQ+e
	cg6clCLrloXWudCNYXqFiVUvXgELS4VOf/igPxg9yaAwPwQ7wiOQ=
X-Gm-Gg: ASbGncuY05FvOCoNYH39EmbrAeTODx04BY0Bq00SHUZXTuZp5eo8w3R8Q3qMKbWH28D
	AB/R93c+QxRplQeXdWac41m/3QrJDpzwI/LMGFjOeQVP4+zTmU3bErLYdxXvSGyleuW4wy4b9uO
	P3GIi82tathheNDTN+cOCz9A==
X-Google-Smtp-Source: AGHT+IGdImyW1z+VKkhsRqxKUdZamVTEqgHO+oKTL97A5BWerRyMHh0mT7T3e0cmB/5rcH+X1XSZzD0jJ+HkcBdbI5Y=
X-Received: by 2002:a05:6512:3e05:b0:54b:117c:a06d with SMTP id
 2adb3069b0e04-54d64af2cecmr1109152e87.54.1744838658905; Wed, 16 Apr 2025
 14:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com> <20250412060258.3844594-2-jstultz@google.com>
 <Z_zMWkvtACZxahu-@jlelli-thinkpadt14gen4.remote.csb>
In-Reply-To: <Z_zMWkvtACZxahu-@jlelli-thinkpadt14gen4.remote.csb>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 14:24:06 -0700
X-Gm-Features: ATxdqUFnQ2hqG-BXrsr-1Cey8-rT8VWQSbAlAe-MN8wMOkxW2BG4aOIgMVMLOpY
Message-ID: <CANDhNCocQLnYxzYYv17prsm7iJSE5032o_00XR0t8d1=gB4CVw@mail.gmail.com>
Subject: Re: [PATCH v16 1/7] sched: Add CONFIG_SCHED_PROXY_EXEC & boot
 argument to enable/disable
To: Juri Lelli <juri.lelli@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
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

On Mon, Apr 14, 2025 at 1:50=E2=80=AFAM Juri Lelli <juri.lelli@redhat.com> =
wrote:
> On 11/04/25 23:02, John Stultz wrote:
> > Add a CONFIG_SCHED_PROXY_EXEC option, along with a boot argument
> > sched_proxy_exec=3D that can be used to disable the feature at boot
> > time if CONFIG_SCHED_PROXY_EXEC was enabled.
> >
> > Cc: Joel Fernandes <joelagnelf@nvidia.com>
> > Cc: Qais Yousef <qyousef@layalina.io>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Juri Lelli <juri.lelli@redhat.com>
> > Cc: Vincent Guittot <vincent.guittot@linaro.org>
> > Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> > Cc: Valentin Schneider <vschneid@redhat.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Ben Segall <bsegall@google.com>
> > Cc: Zimuzo Ezeozue <zezeozue@google.com>
> > Cc: Mel Gorman <mgorman@suse.de>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Waiman Long <longman@redhat.com>
> > Cc: Boqun Feng <boqun.feng@gmail.com>
> > Cc: "Paul E. McKenney" <paulmck@kernel.org>
> > Cc: Metin Kaya <Metin.Kaya@arm.com>
> > Cc: Xuewen Yan <xuewen.yan94@gmail.com>
> > Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Suleiman Souhlal <suleiman@google.com>
> > Cc: kernel-team@android.com
> > Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> > Signed-off-by: John Stultz <jstultz@google.com>
> > ---
>
> ...
>
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index 47972f34ea701..154f0aa0c6322 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -1149,10 +1149,15 @@ struct rq {
> >        */
> >       unsigned int            nr_uninterruptible;
> >
> > +#ifdef CONFIG_SCHED_PROXY_EXEC
> > +     struct task_struct __rcu        *donor;  /* Scheduling context */
> > +     struct task_struct __rcu        *curr;   /* Execution context */
> > +#else
> >       union {
> >               struct task_struct __rcu *donor; /* Scheduler context */
> >               struct task_struct __rcu *curr;  /* Execution context */
> >       };
> > +#endif
> >       struct sched_dl_entity  *dl_server;
> >       struct task_struct      *idle;
> >       struct task_struct      *stop;
> > @@ -1347,10 +1352,17 @@ DECLARE_PER_CPU_SHARED_ALIGNED(struct rq, runqu=
eues);
> >  #define cpu_curr(cpu)                (cpu_rq(cpu)->curr)
> >  #define raw_rq()             raw_cpu_ptr(&runqueues)
> >
> > +#ifdef CONFIG_SCHED_PROXY_EXEC
> > +static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
> > +{
> > +     rcu_assign_pointer(rq->donor, t);
> > +}
> > +#else
> >  static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
> >  {
> >       /* Do nothing */
> >  }
> > +#endif
>
> Does this chunk belong here?

Uhm. It's there intentionally (as with the config option we actually
have the potential for the two contexts to be different), but I'm open
to move it elsewhere if you think it sticks out oddly here and would
fit better in a later change.

Maybe, would adding a note in the commit message to clarify that this
patch also adds the ability for the donor and curr contexts to be
different, help?

thanks
-john
