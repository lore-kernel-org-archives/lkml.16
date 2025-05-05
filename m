Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7D51E48A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746432201; cv=none; b=LnQirqAq/MyHnK6k7ADtqF7xSekMC0bdDh8uuNUUqxI6PkFeP/Wd9ASE6SvLMZ58/9BUrJRY8/nwxg/o1RkJeMw/6X+Fo2gQW6i7i3F1ljQ6xZnGILinfCMIY4ZaShefXKn1zk8EOQIWKvybiiaWWtsoSFXyjlV6BzEHNk4Eg2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746432201; c=relaxed/simple;
	bh=sztom6LhZE76Vm6f+ZY5pye4j/HFy8/xXDr38Ahypek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZX5tkh33E6H28K5uhxERspinC9uj9cK3nThq783VRaNb9dCFkkxpkzqUx3pL0cTmC5+YRC6ULNJR7V6wUJmJB2T3mkddeaiA2BPML0Qckte9/SE14NUyeXWoIxYmHzQFIIqibRcvcS4UfIvb8QUi9A/jxBRNNKFyVmR2fgKkNBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YOD4hGl+; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YOD4hGl+"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30ddad694c1so43015611fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746432197; x=1747036997; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c40335UloJm5Az5cwhI0TVmoaFr2koUZ2nRI7llAruc=;
        b=YOD4hGl+GNdd5H71DxsOw5tpw35PAGPJckfgshySF1PDAjv6ducP3R5lIyakVsmsQe
         UTdseyqk3MzwTIGPWTwC0TyO5azGKzxy5rFoLZ6q8iWVL0ZUgLmWyU2cI87XM37Awyvv
         Di4gY1zZzM0zQidCvGadDx8P5sasDd/inzGvxCnAmyWB4ZDEJolnjB5/r+YvrSHww7xl
         FmCn5FEUKX8AsH3KRXOS4PFRRaflg3FWCkqsWAr91oq27Vdt+PFDRYkD7ewm4dueAU5l
         UF8izBFO4PTiNkKXYkluoUdfdeMTy59+MbcwOz8h4gm6SUej58SHkVOX6zPLbS8IBvLr
         T77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746432197; x=1747036997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c40335UloJm5Az5cwhI0TVmoaFr2koUZ2nRI7llAruc=;
        b=nyfSvJCkB2PsFK/WgrYIk12Y1RLtKXq379wllP4kHc9MueDwJAZOr3f+4xghuqxcUt
         PKQHAElSDYEACFryAQU833scFoWCW+qmN0kHDFqJxjHsj9V8H257nAyLHXrybD0vWT5c
         2IrhVSa/8ie7RN+PA/3ntoB2VaEg+Zj/lOfqI/q7Iia/hk7XCrR6vB2DvcInIn2rwEnZ
         yOPrAyXLuDu2+3iQiVfRm4u2cmNDCdvR/QEBfi7Y8ZWJX2z6g9YsRPTxaI58pwTdj1m2
         irwHvrTgJX8oC3sufzAnIRpF1FhascmSTd1CzTM45bb/jG7td46ChzmHJyPIuMtuZr6t
         fIzA==
X-Forwarded-Encrypted: i=1; AJvYcCXxjyLuGMqSW2yqjVGRfxPmlTcw1f9czzZwXQn+ZKo00YhFujwcScDimyGYIgj3Or5B5FzuTSvpj0m61Wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkUwE+VdA/gSzFidMZnXaHlFMd5SUo28bue6r7BCd10uak2e2B
	F1sEsQdX8GczRzgy6sy26d06bt4sELHCl9KvAs2DZQwRX1sw27hI9ZNh/p9Qw+yt5EQCJv4kflz
	TuhXdDhI+kWEKdgTv3VTMjT1wAl9Ng6l47a2g
X-Gm-Gg: ASbGnctQSleyD5oBVUXyiGO0wOXXI33GVH7jiMkuJqhUiyDZLlBWGJ+rQqRibOj71ev
	CpMwS8AhMGhCJLpaRlRC28hR4qBwZ2vm3PRQQ1FUUYSbDPFr8DWAjXkxfIjP3+b+7N+cw3VDeao
	okgCmMquclPKCta/aGoJU3cVtOL6EMdubz3vlWq+p9QYhZN9iPn6WOmQ==
X-Google-Smtp-Source: AGHT+IF83RL8VyU5b2v69z9P4PTRZ50Y8+FQkcSp7Vs38LtbyObOIP5NPEpk9Id+WLNpTGfVw8CSnxQ1sj+aBBcD/rY=
X-Received: by 2002:a05:651c:19a2:b0:30d:62a6:4431 with SMTP id
 38308e7fff4ca-32348c448fcmr18769751fa.9.1746432196829; Mon, 05 May 2025
 01:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503003620.45072-1-namhyung@kernel.org> <aBcjwoINtWRWKMIJ@gmail.com>
 <aBfFlT0l05yBbZBj@google.com>
In-Reply-To: <aBfFlT0l05yBbZBj@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 5 May 2025 10:03:05 +0200
X-Gm-Features: ATxdqUHaZMf7HZdOKX4lLEQEzR1TzQ0e2j5lghBsLWVH_FYpZtwX7C2kz5JET3E
Message-ID: <CACT4Y+YvWYFBkZ9jQ2kuTOHb6pZQwWXc9sOJ5Km0Wr1fLi-94A@mail.gmail.com>
Subject: Re: [RFC/PATCH] perf report: Support latency profiling in system-wide mode
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	Andi Kleen <ak@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 May 2025 at 21:52, Namhyung Kim <namhyung@kernel.org> wrote:
>
> Hi Ingo,
>
> Thanks for sharing your opinion.
>
> On Sun, May 04, 2025 at 10:22:26AM +0200, Ingo Molnar wrote:
> >
> > * Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > > When it profile a target process (and its children), it's
> > > straight-forward to track parallelism using sched-switch info.  The
> > > parallelism is kept in machine-level in this case.
> > >
> > > But when it profile multiple processes like in the system-wide mode,
> > > it might not be clear how to apply the (machine-level) parallelism to
> > > different tasks.  That's why it disabled the latency profiling for
> > > system-wide mode.
> > >
> > > But it should be able to track parallelism in each process and it'd
> > > useful to profile latency issues in multi-threaded programs.  So this
> > > patch tries to enable it.
> > >
> > > However using sched-switch info can be a problem since it may emit a lot
> > > more data and more chances for losing data when perf cannot keep up with
> > > it.
> > >
> > > Instead, it can maintain the current process for each CPU when it sees
> > > samples.  And the process updates parallelism so that it can calculate
> > > the latency based on the value.  One more point to improve is to remove
> > > the idle task from latency calculation.
> > >
> > > Here's an example:
> > >
> > >   # perf record -a -- perf bench sched messaging
> > >
> > > This basically forks each sender and receiver tasks for the run.
> > >
> > >   # perf report --latency -s comm --stdio
> > >   ...
> > >   #
> > >   #  Latency  Overhead  Command
> > >   # ........  ........  ...............
> > >   #
> > >       98.14%    95.97%  sched-messaging
> > >        0.78%     0.93%  gnome-shell
> > >        0.36%     0.34%  ptyxis
> > >        0.23%     0.23%  kworker/u112:0-
> > >        0.23%     0.44%  perf
> > >        0.08%     0.10%  KMS thread
> > >        0.05%     0.05%  rcu_preempt
> > >        0.05%     0.05%  kworker/u113:2-
> > >        ...
> >
> > Just a generic user-interface comment: I had to look up what 'latency'
> > means in this context, and went about 3 hops deep into various pieces
> > of description until I found Documentation/cpu-and-latency-overheads.txt,
> > where after a bit of head-scratching I realized that 'latency' is a
> > weird alias for 'wall-clock time'...
> >
> > This is *highly* confusing terminology IMHO.
>
> Sorry for the confusion.  I know I'm terrible at naming things. :)
>
> Actually Dmitry used the term 'wall-clock' profiling at first when he
> implemented this feature but I thought it was not clear how it meant
> for non-cycle events.  As 'overhead' is also a generic term, we ended
> up with 'latency'.

Exactly :)

I've also talked with a bunch of people about this, and everybody
proposes their own term and is confused by all other proposals.

The problem is that we did not just lack this fundamental profiling
capability in all profilers out there, but we, as a community, also
still don't know how to even talk about these things...

There is no terminology that would be clear for everybody. E.g. when
some people hear wall-clock, they imply that it samples every thread
(runnable and non-runnnable) every time unit (but that's a vastly
different profile from this one).


> > 'Latency' is a highly overloaded concept that almost never corresponds
> > to 'wall clock time'. It usually means a relative delay value, which is
> > why I initially thought this somehow means instruction-latency or
> > memory-latency profiling ...
> >
> > Ie. 'latency' in its naive meaning, is on the exact opposite side of
> > the terminology spectrum of where it should be: it suggests relative
> > time, while in reality it's connected to wall-clock/absolute time ...
> >
> > *Please* use something else. Wall-clock is fine, as
> > cpu-and-latency-overheads.txt uses initially, but so would be other
> > combinations:
> >
> >    #1: 'CPU time' vs. 'real time'
> >
> >         This is short, although a disadvantage is the possible
> >         'real-time kernel' source of confusion here.
> >
> >    #2: 'CPU time' vs. 'wall-clock time'
> >
> >         This is longer but OK and unambiguous.
> >
> >    #3: 'relative time' vs. 'absolute time'
> >
> >         This is short and straightforward, and might be my favorite
> >         personally, because relative/absolute is such an unambiguous
> >         and well-known terminology and often paired in a similar
> >         fashion.
> >
> >    #4: 'CPU time' vs. 'absolute time'
> >
> >         This is a combination of #1 and #3 that keeps the 'CPU time'
> >         terminology for relative time. The CPU/absolute pairing is not
> >         that intuitive though.
> >
> >    #5: 'CPU time' vs. 'latency'
> >
> >         This is really, really bad and unintuitive. Sorry to be so
> >         harsh and negative about this choice, but this is such a nice
> >         feature, which suffers from confusing naming. :-)
>
> Thanks for your seggestions.  My main concern is that it's not just
> about cpu-time and wallclock-time.  perf tools can measure any events
> that have different meanings.  So I think we need generic terms to cover
> them.

I did not see a conflict there. It's possible to sample, say, cache
misses per unit of CPU time or per unit of wall-clock time.
