Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A1D5A79B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745638489; cv=none; b=RmL85kdRoAKuIMZHpnppnbZs2GMiC59zYvlqfU8uUnbs7kmG9jxWGHZMYl0V/nLbMuw9r9O/mm09rdebQU7TbviErEB2qbbkIomQY28bEdHtDVs1JfuTMZjdQvxqnj83YnCs6g7DvTRHpDro9BJPJB0KILlZ9HhU7EN0ci2aVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745638489; c=relaxed/simple;
	bh=6kPSZKgwvxp1ykXANCR76OK4bEW1m3+rPU6Y6a25mic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUOWZIYMRqlMQ0GqILp8IUvbiYO4/NTSedfmVgkNj9Q4gakrEu1pJBJRB6FAF31dA1UmB4pICS9l3xZFmWndlJfaSAnS+/y3+AiuCeje/H7f/3vSn85eNfpd2uQ/RFkTjsSfgtls+8WzVSMt+cdw2VCiXpAToCnGRqhBRrK0cFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U7JNuKKT; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U7JNuKKT"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so2684728e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745638485; x=1746243285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kPSZKgwvxp1ykXANCR76OK4bEW1m3+rPU6Y6a25mic=;
        b=U7JNuKKTuFTK89MBJZmOUSvQ1ZWpdzGn+ZM5U/+DuOBPOiyGvloS9x3WCTKA1FbQmq
         3FVuRSZ5RdZQHOBwoB/1D97KjgwAV5+eGczCpsRanvMRdTkIHplOsM6o1Ugm+ByEVvqX
         b0cEAhcaU8QCjyY4NZTrQ2tFIKn1DFQhAdsaKiWKg3ZDAakYv2glOI7abjz8Qy8OK7ll
         XLiYiB0qH+s6QKzQW38BYoS3TwRRY4cU68Tyv0mr2tQNyuSuYcIFn6GORV80rwz2rbvD
         GKkiITRZA3k0wZefaaQGEaGJ9NPlCRXwDFaXHmD4Oh6Bw6uQPFzISi5PjLokVGbXMtNz
         Z6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745638485; x=1746243285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kPSZKgwvxp1ykXANCR76OK4bEW1m3+rPU6Y6a25mic=;
        b=cjP5WS7nbEoiYtBVmwJhF9y/jqIVEq3tA9GB/LWTJV9YB9STQlXIhehHg+m2rdxXM8
         K9kxD1suMV+0aYdFc7Pj7vTAMLew57dm07dHVpoZvtA7ABnDkWearW829VbxePEfF7wU
         YMx81jYTBh49JfRhyCYMcwELp+dNvwisj1lP/cjghW6wQH+N2HxeDKnP1diuAWGxrQSR
         4M1r3uiK7zNls993APH3YImJAu5wBp0DRpHg3DtbYp8PUSoa24iA5I+KF7K2cEQ09+F7
         KJs/+MilzGFjvqzBthIzKNOHfO5HToB+gETVUNkoj+7uAgLTjXilhIsFeAheGCvoF7+s
         ItQw==
X-Gm-Message-State: AOJu0Yzksf6ojHlju17GD13Ra+OJGhZjgXV2FqJeeD4uw3fsVjFMds1X
	3zLLk7CeXq4VUQBPx8yExE2l+GdSeTHpq/cYt3zz7/Q6mpj4FajOyuSnaQmjw8a0EprYJ8RiXjX
	NeTOZfG0Cz//KEw8lAdooZTU3nrg+aj6gh1I=
X-Gm-Gg: ASbGnctS2Aja6hFrhAczro4AuXkH69185/wjqv9F3wTe1m6eh3UsQjFL1tHMW06CYZj
	YO7dv5XRYaMOus8pl6VS/yiN24LpF9VU/Zk1IotriGNGBgmV6CTUgknGxnoflOe4sQ7cbg61ZuD
	HBVU8F6486QG691y8Qq43zYoyI/Y2klMxbPDQdU+uncgqhctOzO28=
X-Google-Smtp-Source: AGHT+IGklxd34TrKXoIfOW7DcnqyAFvacBs5Dy50AyI6+T0QH3oi0SmmOddLDiXX915lGuM6yOdXwTRIg5oDvZQi1Gg=
X-Received: by 2002:a05:6512:1323:b0:54b:1055:f4c0 with SMTP id
 2adb3069b0e04-54e8cbcd2c7mr1406311e87.4.1745638485017; Fri, 25 Apr 2025
 20:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com> <20250412060258.3844594-5-jstultz@google.com>
 <20250417111235.GK38216@noisy.programming.kicks-ass.net> <CANDhNCq7SETQ7j6ifUoF_Pwiv42RNfv9V3AV+=OWg_U4+gZVbA@mail.gmail.com>
 <20250424133707.GB1166@noisy.programming.kicks-ass.net>
In-Reply-To: <20250424133707.GB1166@noisy.programming.kicks-ass.net>
From: John Stultz <jstultz@google.com>
Date: Fri, 25 Apr 2025 20:34:32 -0700
X-Gm-Features: ATxdqUF5wfKfwKcKFKiXXZa9854PAFf2fyEpxqUD_8etGYCzeI09lLOKWxIYu48
Message-ID: <CANDhNCq_PG6L68Qj0WoV5LyCcoNwjdxv3wOt+EnLFnkU4NAv+w@mail.gmail.com>
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

On Thu, Apr 24, 2025 at 6:37=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> On Mon, Apr 21, 2025 at 02:00:34PM -0700, John Stultz wrote:
> > On Thu, Apr 17, 2025 at 4:12=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > > So I am confused; you're accounting runtime to the actual running tas=
k,
> > > but then accounting the same runtime to the cgroup of the donor.
> > >
> > > This seems somewhat irregular.
> >
> > So, apologies, as it's been a bit since I've deeply thought on this.
> > In general we want to charge the donor for everything since it's
> > donating its time, etc. However, without this change, we got some
> > strange behavior in top, etc, because the proxy tasks that actually
> > ran didn't seem to gain any exec_runtime. So the split of charging
> > everything to the donor except the sum_exec_runtime to the actually
> > running process (the proxy) made sense.
> >
> > Now, for cgroup accounting, it seems like we'd still want to charge
> > the donor's cgroup, so whatever restrictions there are in place apply
> > to the donor, but it's just when we get to the leaf task we charge the
> > proxy instead.
> >
> > Does that sound reasonable? Or am I making a bad assumption here
> > around the cgroup logic?
>
> Its all rather confusing one way or the other I'm afraid :/
>
> This way when people go add up the task times and compare to cgroups
> it doesn't match up.

So, inherently the point of proxy is that tasks get to run on borrowed time=
.
Priority inversions from any restrictions via cgroups are resolved
only by letting the task run using the donors time. So for proxy to
work we have to allow those tasks to effectively break through their
restrictions to release the needed locks.

So I'm not sure, outside of accounting everything onto the donor
(which creates its own oddities, which motivated this patch) one could
be perfectly consistent here.

I still think the model used in this patch feels like the best
balance. But I'm wondering, would accounting the "borrowed time" and
the "donated time" separately maybe help folks interpret things more
clearly?

> Also, by adding sum_exec_runtime to curr, but
> account_group_exec_runtime() on donor, the cputimer information is
> inconsistent.

Ah! Ok, this is a good point. I misinterpreted the
account_group_exec_runtime() as being cgroup related not thread group.
Thanks for pointing this out!

>
> Whatever we do, it should be internally consistent, and this ain't it.
>

I'll take a swing at fixing the account_group_exec_runtime(), but let
me know if you have any more thoughts on how we charge cputime between
donor cgroups and proxy tasks running on the donors time.


> > > I think I've tripped over this before, on how update_curr_common() us=
es
> > > donor and update_curr() curr. This definitely needs a comment. Becaus=
e
> > > at first glance they're not the same.
> >
> > I suspect part of the incongruity/dissonance comes from the
> > cfs_rq->curr is actually the rq->donor (where rq->donor and rq->curr
> > are different), as its what the sched-class picked to run.
> >
> > Renaming that I think might clarify things, but I have been hesitant
> > to cause too much naming churn in the series, but maybe it's the right
> > time to do it if it's causing confusion.
> >
> > My other hesitancy there, is around wanting the proxy logic to be
> > focused in the core, so the sched-class "curr" can still be what the
> > class selected to run, its just proxy might pick something else to
> > actually run. But the top level rq->curr not being the cfs_rq->curr is
> > prone to confusion, and we already do have rq->donor references in
> > fair.c so its not like it's perfectly encapsulated and layered.
> >
> > But I'll take a pass at renaming cfs_rq->curr to cfs_rq->donor, unless
> > you object.
>
> I was more thinking of a comment near here to clarify. Not sure
> cfs_rq->donor makes much sense.

Ok.
/me quietly deletes that patch from his WIP series. :)

Thanks so much again for the review and feedback here! Very much appreciate=
d!
-john
