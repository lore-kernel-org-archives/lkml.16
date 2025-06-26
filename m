Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B81AAA1B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947975; cv=none; b=I5B3faL+4jPqOiHBWbVy2oFR4BV7e+O9nWhx7ZqqXoVw0li7GneiUdqlXnkOmGfvBNNTmEw8+J8o80F+F9UzYM3AGKqRVk/Ch/SKVs8nCBTQAgqyyU07VAYpb6InUDqhlOppdheIEhtk02vTIeCSbwMHbCF0UscU64dK5npnyik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947975; c=relaxed/simple;
	bh=IDf6tQ1neJo89VMMIOdOWhDhzfP988IR4KGqwK4alj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AE7VMktXxVdEp7wjdjyWKyjfjOxbdeHS/jfi4But2Snb6S3eEn/CpUbwIKeURrqShftsGXVcVZKrFqglLgUEoXrhZ4uGjgQscn4JHqRW254nRje7IC7SoXwZ3edYeV5zGiQDLXZFKPj79F1JYAZLbw+gAARNyocFdn7Pch6/N5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=po5zMxuk; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="po5zMxuk"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0d935020eso143970766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750947972; x=1751552772; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EpCoCN5KHi2gAgKqZxS9lJWnDglZXNBveKfOcEmUyUk=;
        b=po5zMxuk861nYTEsqVuj9i5aJpxlQZUoJ+mEhg1JGRz4h6poc1PF/TvSrgRExH6aVH
         eKcSPv2pmOtpyZK4Ef/XZB9dF0+soITaFgYLBznI/MOx8Q1jst0uj5bO0Ke7FPweXjvF
         /hyLbJIyCVPdiRSoxwaEPNzD0ev98JL8tMzMguTEb6fSho3EZzignZruZr+MeRUIFIfY
         ew5Q9QAzdfidPG9MJbOK5Sw7hogaY6Hn80gZaV7Yp7qCRKQVHSxzNqJyyX/tBRZOnvEH
         JZivnEIJbsR0jIVOIc7MA5L0YmI+ZK8jIyKRGZaZvLN3YaNbz351FOh70HqHMDKJoyg5
         JInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947972; x=1751552772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpCoCN5KHi2gAgKqZxS9lJWnDglZXNBveKfOcEmUyUk=;
        b=VqpLIBqwb77IhIKsogjPADc2jecIRQo1NUE9LQ05S+OzbQzcSlo42tnKNrAqAHHTdU
         rvK8JIdQCj9vOpH7qrlr/vOGRyoV41r81a92d1gfPsU56Jo8GS7y0jLOJ0fBatcwfGfI
         BA94E9B9h99pklPiQUTq0FzF9+aDE5+C1PG30dSvuf/H3wTxTRxk9Lfj6RI9aEAW1E7w
         NA8qDzD6TsnJ5Xd9wv8ASRtOlcHny8tuYErYQctx6nQvABm4288GHjMgTBP7OgSJen+Y
         cee4s5Dm+wJ1sO7vmOUSpZTHIum8nqfCl00+UoiMaGl15Mfd5W0XkpL3yUEK+ENafhYM
         F87g==
X-Forwarded-Encrypted: i=1; AJvYcCVJ0byUq6eOJgdJaoUXr14SHwawyjgGuPPsfjDpFEAFo8MQtbwwqNwG5N3fAaF1JaS4vhsV9tUG2xL/K84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzgf5wFjDiHOu8/JQuy6qNnh98bixFnHPlX7JOzvxPTFLzqxUO
	JZMR00SQv17InjUDZFSe3bIFHyeop+3uaMhRe90aKm8/o6C0kusDlZ0fMQn/bP+7WiLXtIJ9W0i
	iKHBkeQjVk3nW4j6auR4VebzMlQGC8+goVfZFtW1v+A==
X-Gm-Gg: ASbGncvkytPfn+Lx1UdTl5j23s2vsVkqhjpXQWHcFp2QyVRb1shL4RxWOLzqj4omy6s
	44lY91vd9uy9D2kDNmuuSfpzUhE4TRxSYH5ymbOc9bvpnY1VHAhoDfyo92mjBmxVk9XoQD9prDK
	tVBxzKUkWoJ1BSMaD/fI62JdnP7LXq1kubRt5O4fhlp4v4ycUgmJXpEhq704MsBe+x3Mf6VZc+
X-Google-Smtp-Source: AGHT+IG+2mwl2iCCvVEsS8jKiCzpX3yfqy4Q/QHhORvPnDw+xKLtwvmrkRacQbfrcrkgiVc37c5AX3YGEecsVuBTv/c=
X-Received: by 2002:a17:907:9085:b0:ad8:9909:20b5 with SMTP id
 a640c23a62f3a-ae0beecd49emr580341266b.56.1750947972033; Thu, 26 Jun 2025
 07:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624204942.715206-1-clm@fb.com> <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
 <872c057e-5e2f-4cbf-943a-072b6015fee9@meta.com>
In-Reply-To: <872c057e-5e2f-4cbf-943a-072b6015fee9@meta.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 26 Jun 2025 16:26:00 +0200
X-Gm-Features: Ac12FXyA03t1Zk91d8p9WakJhvF1enao7-IBmoFgX_zcaWrTWhjZBDdyTh8W9sk
Message-ID: <CAKfTPtBE0_77+J-A7vWRKsHCCmuX1jWTbPYWGVPg1MYq_rv8Og@mail.gmail.com>
Subject: Re: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when newidle
 balance fails
To: Chris Mason <clm@meta.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Chris Mason <clm@fb.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Jun 2025 at 12:58, Chris Mason <clm@meta.com> wrote:
>
> On 6/26/25 3:00 AM, Peter Zijlstra wrote:
> > On Tue, Jun 24, 2025 at 01:48:08PM -0700, Chris Mason wrote:
>
> [ ... ]
>
> > For the non-RFC version, please split this into a code move and a code
> > change -- I had to stare waaay to long to spot the difference (if we
> > keep this code movement at all).
>
> Sure
>
> >
> >>  /*
> >>   * Check this_cpu to ensure it is balanced within domain. Attempt to move
> >>   * tasks if there is an imbalance.
> >> @@ -11782,12 +11808,14 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
> >>
> >>      group = sched_balance_find_src_group(&env);
> >>      if (!group) {
> >> +            update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
> >>              schedstat_inc(sd->lb_nobusyg[idle]);
> >>              goto out_balanced;
> >>      }
> >>
> >>      busiest = sched_balance_find_src_rq(&env, group);
> >>      if (!busiest) {
> >> +            update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
> >>              schedstat_inc(sd->lb_nobusyq[idle]);
> >>              goto out_balanced;
> >>      }
> >
> > So sched_balance_rq() is used for pretty much all load-balancing, not
> > just newidle.
> >
> > Either make this conditional like:
> >
> >       if (idle == CPU_NEWLY_IDLE)
> >               update_newidle_cost(...);
> >
> > or do it all the callsite, where we find !pulled_task (ie failure).
> >
> > Specifically, we already do update_newidle_cost() there, perhaps inflate
> > the cost there instead?
> >
> >       if (!pulled_tasks)
> >               domain_cost += sysctl_sched_migration_cost;
>
> Got it, I'll play with that.  Vincent, was there a benchmark I can use
> to see if I've regressed the case you were focused on?

It's not a public benchmark but I had some unitary tests with tasks
waiting on a busy CPU while other CPUs become idle for a "long" time
(but still less than 500us in average). This is even more true with
frequency scaling which will minimize the idle duration by decreasing
the frequency

>
> -chris
>
