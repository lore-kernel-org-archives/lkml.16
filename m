Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC6216A94A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750923900; cv=none; b=YGdecun/Elj4VW1HM5WZPuD+oAXOtKyz5rPKGSUUfELxX3a9kiUQN8XEDnKhoqlk6hk4y1+jyKDS1SkOiT1bZb+YxzmRrZta85RkUhXR6Lgd2/xHHXi0g3NmSAfY90s45MH1nA9214UzsEG1K/3lsf1Ly/S7m6o64ANiED+xexU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750923900; c=relaxed/simple;
	bh=/ThMzEMq97yGV+ecJ1/9X4Vs0dTb64spbfgajo6uLvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1o0WpW3/rZBvXj4pK6Z2WspTx2O0J2IiUf0v0cmjVK5VtElOnBX4MzWxGVvWpWlMgW4kgvEDBt3iQn8Jf8QTiR1b3LJe7tmNs4TA7PEEpgKpWjn0FI7n2N9zBalxjU2JWSPQxrCJe3tQaOx6c2Xdna8Yt1UpKRei7a79vO7FWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ghu/PUM+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ghu/PUM+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade33027bcfso114538266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750923897; x=1751528697; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cD0VqvSELG0J+uuPBKmhH7qSYefO2Euw2tyQWF1Fj8w=;
        b=ghu/PUM+KgSWa1ldcjQAk/grnaqnUOz25+V7BGLrD3gDRdQbnLSd/SGqaIBg0WMR2m
         1Hx2ys6Nq/QiAKl3c2nuL1RxMhQl6cSeBRF48Oai5j+uJ9dW+8TBzhRL4NEXQ5lXlaR5
         RriQhaF1uHBOTNbZKNXDaojlTjkfXRBbykcpDQt9/Ucc411rfVJWvyCGavpjJqPi+9DP
         AuJHRdmLzgTkVSHpAy7INY3ftGSH/cJNByVAyl5aFSYRIcJNvMbDFlEmbZR14r7L7B5u
         iPvQkZFYC7st/6dQTGAivdqf/Om8yjWdXhktaMxqDpeVeVsNsZIQzGBcfMyRqqtA7qdU
         e+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750923897; x=1751528697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cD0VqvSELG0J+uuPBKmhH7qSYefO2Euw2tyQWF1Fj8w=;
        b=BQRO23lXlBIBvFi2T/XCjhVSBPCJbk4D+Q6vZu+A79gJF+9OctvE6bWG2oq97E/APr
         68PmLCMeHSbBshX6BUQF9FVMLHgGxL65iR13CBuVZGEYuXPcvl6Rv0NmFpeOJYUmKLDb
         p7+93NB4OmfaFRBWdYnQI/qxEg2TwzJtOWR3uQxMv//20zQfcgrgaP5lowj+6yrod/Df
         kl6Patin2ugwy2NcAtNgamnmifZF+n9iIi0UjEGdGqQw65CBMv+5AmfXKPGzoTiyX7jg
         dIulPVsQB3FtYVr8BzmSKyo/IXl7cFKfWIKSIMr5VBP7l9H70kDPf5q7rSz/QV3GGwnR
         K5jw==
X-Forwarded-Encrypted: i=1; AJvYcCUNLOb7bzIytgvsV9yXsrsvsu2bDDQT+GKdqSwGRKUtTiI/kOcam8c1AsX5iAX09/AJ6Ekn3+L2oTeGnOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWsNr2irlSB45SzGnx3/wFjdSqJq6dNE9mugvco8647XJ3gEy7
	cNIgd/T0fuhwZ7HdzrDi5r81fjLi3VhztNCRwU+NVY5/cr8K4mrS3Ibka9H4oFo/Pmlk92/e07k
	czK0DfvpmyptO4fxmr5AozDT43PVdyV+7WOM6IB3NKkgQMN06EXCHu8KhAA==
X-Gm-Gg: ASbGnctcX/orf3wxwl+9QUpD4YTk0uaWST9Ci8cGyPmWadx+4cQiPRDvoZaFwXtXis9
	gQ+V4ZeSYlsPkMDUUlAkBN+Dj1+EiHiL3eQ/iiXLCe5VfxGgeTSWllTZ2qN24aH183J0oD5lTdq
	snrWyW8wUTLbP8ux2fHi28ksMPaqBCMeCXX48BGNnElYw24AiDIhJu0XRtT63kW20A6cK6VqDl
X-Google-Smtp-Source: AGHT+IHV5x1l+i6ovi8IgyzkXGTwuj2NaXpeuQ5LwePqg7X8Sxfr/UNel6gRJhihPDbSTZHV3IX4k1p3+TmwEZRLDC8=
X-Received: by 2002:a17:907:7e92:b0:ad2:313f:f550 with SMTP id
 a640c23a62f3a-ae0bee4e4dbmr674850366b.29.1750923896979; Thu, 26 Jun 2025
 00:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624204942.715206-1-clm@fb.com> <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
In-Reply-To: <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 26 Jun 2025 09:44:45 +0200
X-Gm-Features: Ac12FXwFBJLhvX_rpxcmPVdEmG2P03pw4xPEqeZFQ_w5vvPEjlfOVnBIXz8LNSg
Message-ID: <CAKfTPtCiyXCxAiU8YZUq6fVOY5MmKN7wXeW8Jm1=GWOEghcVBw@mail.gmail.com>
Subject: Re: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when newidle
 balance fails
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chris Mason <clm@fb.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Jun 2025 at 09:00, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Jun 24, 2025 at 01:48:08PM -0700, Chris Mason wrote:
> > schbench (https://github.com/masoncl/schbench.git) is showing a
> > regression from previous production kernels that bisected down to:
> >
> > sched/fair: Remove sysctl_sched_migration_cost condition (c5b0a7eefc)
> >
> > The schbench command line was:
> >
> > schbench -L -m 4 -M auto -t 256 -n 0 -r 0 -s 0
> >
> > This creates 4 message threads pinned to CPUs 0-3, and 256x4 worker
> > threads spread across the rest of the CPUs.  Neither the worker threads
> > or the message threads do any work, they just wake each other up and go
> > back to sleep as soon as possible.
> >
> > The end result is the first 4 CPUs are pegged waking up those 1024
> > workers, and the rest of the CPUs are constantly banging in and out of
> > idle.  If I take a v6.9 Linus kernel and revert that one commit,
> > performance goes from 3.4M RPS to 5.4M RPS.
> >
> > schedstat shows there are ~100x  more new idle balance operations, and
> > profiling shows the worker threads are spending ~20% of their CPU time
> > on new idle balance.  schedstats also shows that almost all of these new
> > idle balance attemps are failing to find busy groups.
> >
> > The fix used here is to crank up the cost of the balance whenever it
> > fails to find a busy group or busy queue.
> >
> > Signed-off-by: Chris Mason <clm@fb.com>
> > ---
> >  kernel/sched/fair.c | 52 ++++++++++++++++++++++++---------------------
> >  1 file changed, 28 insertions(+), 24 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 7a14da5396fb2..0c4701564ce01 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -11744,6 +11744,32 @@ static void update_lb_imbalance_stat(struct lb_env *env, struct sched_domain *sd
> >       }
> >  }
> >
> > +static inline bool update_newidle_cost(struct sched_domain *sd, u64 cost)
> > +{
> > +     if (cost > sd->max_newidle_lb_cost) {
> > +             /*
> > +              * Track max cost of a domain to make sure to not delay the
> > +              * next wakeup on the CPU.   Add a bit to the min so we don't
> > +              * have to worry about <= vs <, and to handle the sysctl set at
> > +              * zero.
> > +              */
> > +             sd->max_newidle_lb_cost = min(cost, sysctl_sched_migration_cost + 200);
> > +             sd->last_decay_max_lb_cost = jiffies;
> > +     } else if (time_after(jiffies, sd->last_decay_max_lb_cost + HZ)) {
> > +             /*
> > +              * Decay the newidle max times by ~1% per second to ensure that
> > +              * it is not outdated and the current max cost is actually
> > +              * shorter.
> > +              */
> > +             sd->max_newidle_lb_cost = (sd->max_newidle_lb_cost * 253) / 256;
> > +             sd->last_decay_max_lb_cost = jiffies;
> > +
> > +             return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +
>
> For the non-RFC version, please split this into a code move and a code
> change -- I had to stare waaay to long to spot the difference (if we
> keep this code movement at all).
>
> >  /*
> >   * Check this_cpu to ensure it is balanced within domain. Attempt to move
> >   * tasks if there is an imbalance.
> > @@ -11782,12 +11808,14 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
> >
> >       group = sched_balance_find_src_group(&env);
> >       if (!group) {
> > +             update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
> >               schedstat_inc(sd->lb_nobusyg[idle]);
> >               goto out_balanced;
> >       }
> >
> >       busiest = sched_balance_find_src_rq(&env, group);
> >       if (!busiest) {
> > +             update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
> >               schedstat_inc(sd->lb_nobusyq[idle]);
> >               goto out_balanced;
> >       }
>
> So sched_balance_rq() is used for pretty much all load-balancing, not
> just newidle.
>
> Either make this conditional like:
>
>         if (idle == CPU_NEWLY_IDLE)
>                 update_newidle_cost(...);
>
> or do it all the callsite, where we find !pulled_task (ie failure).
>
> Specifically, we already do update_newidle_cost() there, perhaps inflate
> the cost there instead?
>
>         if (!pulled_tasks)
>                 domain_cost += sysctl_sched_migration_cost;

yeah, sched_balance_newidle() looks like a better place to
artificially increase the cost

>
> or whatever.
>
