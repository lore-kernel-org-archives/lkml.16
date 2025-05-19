Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6DE1EDA09
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747634465; cv=none; b=OGNCGYKwrUcsEUwkwUf05evkg+C3fZH4c7UlFoaHtZAUtExipMNQp473zXEptVZLEjYmsO+51tv0zuo8F34WB1eVjg7kd1uDbuO2fQA2xK6xNtUJmBwCL/xSvfok/QHndbUzTsAW2jmHVoLO507SFwiXTmEZaiwJW7evqgfHkhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747634465; c=relaxed/simple;
	bh=zGKLanqdBDjBH2n2RwqntomLdaHBIfd8P6s++6bckvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfQ8Di2kOKBgfs6W95zrTHcJQeeGcPqK3KCYnbzX/E+6VwymgD+/Gzc09/am/f6y2IA7LUbzCgYi8dxkxO4he7w6ICFL35Hv/CkMSAJIn8Vqo2RWXzuqtk88y5qrNdsVhrAfkLRXhWGQ1UQUAcRIxot3tjVYoKM4OFpTGu+gBz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LrmkOF2m; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LrmkOF2m"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549b116321aso4576830e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 23:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747634461; x=1748239261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=btNxEnXkCBKhDgCVf39HqiEvekCT9disq1c7ypL1rjI=;
        b=LrmkOF2mS/8B1S09A7lo9KVjNFb/J3et5lXrhut1Su+SqEntZpr8MYO1AOKcslS1jg
         CMPuENo6YwnsSl1M7T/cH1jySXYQakFCBRgENJ4oD1S1rHiAxs7SkMTLFpoMo8ygFlek
         esRZthrezwSq8zHU9mU9Zzv/bkzhR5ZJGCgXFCScqBiN8pK9oN4PFlI4PS9JZIGUIzyi
         gKtUQoEqHlT8YrgmgrA0EWvFChEdfpJpbMvR49vCX4I8jN16oqFosDZy4Hwhftuy2N/w
         RjJBIZLv8aT6D/ZPbFqjapDye1DNzPD4SOLy/dgIBrXhdj5m5toZji4GUgfoKlNYB34K
         JMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747634461; x=1748239261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btNxEnXkCBKhDgCVf39HqiEvekCT9disq1c7ypL1rjI=;
        b=UvZhEtqK1oo+ja1YS1aSPSOXcxtQFoDXAbZ6wq5LvmjSpylLgquJdxGuRRTTpB8vqo
         9P5pCmOUQEF99UI74qlFqgfhAO+UHjShDoyhQ70gTNuFizoxNR/W6MHQq69b/DvAGRR7
         Xey/ECOzhhT4BfpD8wnXpaIQUefr03MHK70BpEPwbp6vb540eVCIVu79ayZA05aSo0S7
         cYwwwwQip6g/4/yXDfZ1t1gkAtiUwE/4J1lxKR7YpjoYpBkN/8yxkvn2kg5cbX7U957f
         1OzZpAjtTR//rn4nQj4j0ookKxZnh51/0VE2wui2MHz1zXXJKDiXj5Nf5OeOicvHkoa/
         fmfA==
X-Forwarded-Encrypted: i=1; AJvYcCWDNzKS2sk4A2txnFXeoxWEjLLK3O7p7U9O/69d/J+MZBn5pCFTpMYtXesXNsvMM71Eif0I9ZR+uAchTIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs3SODcZ2eZ5D1SU1OC/ZoDEYwdT3dkNNOzfGlAKUH51zKx6F2
	nFhJr+BDcf3AGF5AEWP7lzp0XEIXKPU/2ABxHnX2BlmKPGgV4odv+9x9VpcwLAQpeSKH+FFN3Yb
	vSzKdVtooISqtaNqS41tmKaxhEBzcE16YAQeHjx43
X-Gm-Gg: ASbGncval4QAZ7WHaXT3Lv7eQMvnwd00oi4lSV4FJlRrRAkxl/jUuFoanZI4zgc4s4E
	guvETY4NdYBNxJdaez6SHrGbC0NHzaHs/j9yIlRZTQKiYiQ4Ya4/6OSAo+5l2WnG6EmyA7m4GJF
	3LXCvfc3Vgafz0JMoEbF2xuhmEgZC6wwZgA1icyHVx+MVlQyZQJj2TEG87UITnndS9Fg==
X-Google-Smtp-Source: AGHT+IHmNzUvpkCP3LaZQZ2t1mPyUDUkFC0ewOzgseX8R3Whoth9RBFCwFyaUATu13s7KSKYxpL2cBB79USyXuUg2jA=
X-Received: by 2002:a05:6512:a92:b0:549:39ca:13fc with SMTP id
 2adb3069b0e04-550e9938627mr2467673e87.49.1747634461101; Sun, 18 May 2025
 23:01:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503003620.45072-1-namhyung@kernel.org> <CACT4Y+Yr7vffLYG+YmyB=9Vn_oxdQqR_6U4d-_WeQoOtPXZ6iw@mail.gmail.com>
 <aBmei7cMf-MzzX5W@google.com> <CACT4Y+ameQFd3n=u+bjd+vKR6svShp3NNQzjsUo_UUBCZPzrBw@mail.gmail.com>
 <aBmvmmRKpeVd6aT3@google.com> <CACT4Y+bm4gCO_sGvEkxLQfw8JyrWvCzqV_H5h+oebt8kk1_Hwg@mail.gmail.com>
 <aBm1x2as1fraHXHz@google.com> <CACT4Y+aiU-dHVgTKEpyJtn=RUUyYJp8U5BjyWSOHm6b2ODp9cA@mail.gmail.com>
 <aBvwFPRwA2LVQJkO@google.com> <CACT4Y+YacgzrUL1uTqxkPOjQm6ryn2R_nPs8dgnrP_iKA9yasQ@mail.gmail.com>
 <aCdo6Vz2MVv3N0kk@google.com>
In-Reply-To: <aCdo6Vz2MVv3N0kk@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 19 May 2025 08:00:49 +0200
X-Gm-Features: AX0GCFt1vMv0b_iYLCvuOizirg0AVrg_V3aEGQp5wYPG0FItQmCpSkJp3EqikN4
Message-ID: <CACT4Y+YHxXjCU2jySTUO5kH=xC8scdzTTuP2qEBc5zMber44Aw@mail.gmail.com>
Subject: Re: [RFC/PATCH] perf report: Support latency profiling in system-wide mode
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-perf-users@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 May 2025 at 18:33, Namhyung Kim <namhyung@kernel.org> wrote:
>
> Hello,
>
> Sorry for the delay.
>
> On Thu, May 08, 2025 at 02:24:08PM +0200, Dmitry Vyukov wrote:
> > On Thu, 8 May 2025 at 01:43, Namhyung Kim <namhyung@kernel.org> wrote:
> > >
> > > On Tue, May 06, 2025 at 09:40:52AM +0200, Dmitry Vyukov wrote:
> > > > On Tue, 6 May 2025 at 09:10, Namhyung Kim <namhyung@kernel.org> wrote:
> > > > > > > > Where does the patch check that this mode is used only for system-wide profiles?
> > > > > > > > Is it that PERF_SAMPLE_CPU present only for system-wide profiles?
> > > > > > >
> > > > > > > Basically yes, but you can use --sample-cpu to add it.
> > > > > >
> > > > > > Are you sure? --sample-cpu seems to work for non-system-wide profiles too.
> > > > >
> > > > > Yep, that's why I said "Basically".  So it's not 100% guarantee.
> > > > >
> > > > > We may disable latency column by default in this case and show warning
> > > > > if it's requested.  Or we may add a new attribute to emit sched-switch
> > > > > records only for idle tasks and enable the latency report only if the
> > > > > data has sched-switch records.
> > > > >
> > > > > What do you think?
> > > >
> > > > Depends on what problem we are trying to solve:
> > > >
> > > > 1. Enabling latency profiling for system-wide mode.
> > > >
> > > > 2. Switch events bloating trace too much.
> > > >
> > > > 3. Lost switch events lead to imprecise accounting.
> > > >
> > > > The patch mentions all 3 :)
> > > > But I think 2 and 3 are not really specific to system-wide mode.
> > > > An active single process profile can emit more samples than a
> > > > system-wide profile on a lightly loaded system.
> > >
> > > True.  But we don't need to care about lightly loaded systems as they
> > > won't cause problems.
> > >
> > >
> > > > Similarly, if we rely on switch events for system-wide mode, then it's
> > > > equally subject to the lost events problem.
> > >
> > > Right, but I'm afraid practically it'll increase the chance of lost
> > > in system-wide mode.  The default size of the sample for system-wide
> > > is 56 byte and the size of the switch is 48 byte.  And the default
> > > sample frequency is 4000 Hz but it cannot control the rate of the
> > > switch.  I saw around 10000 Hz of switches per CPU on my work env.
> > >
> > > >
> > > > For problem 1: we can just permit --latency for system wide mode and
> > > > fully rely on switch events.
> > > > It's not any worse than we do now (wrt both profile size and lost events).
> > >
> > > This can be an option and it'd work well on lightly loaded systems.
> > > Maybe we can just try it first.  But I think it's better to have an
> > > option to make it work on heavily loaded systems.
> > >
> > > >
> > > > For problem 2: yes, we could emit only switches to idle tasks. Or
> > > > maybe just a fake CPU sample for an idle task? That's effectively what
> > > > we want, then your current accounting code will work w/o any changes.
> > > > This should help wrt trace size only for system-wide mode (provided
> > > > that user already enables CPU accounting for other reasons, otherwise
> > > > it's unclear what's better -- attaching CPU to each sample, or writing
> > > > switch events).
> > >
> > > I'm not sure how we can add the fake samples.  The switch events will be
> > > from the kernel and we may add the condition in the attribute.
> > >
> > > And PERF_SAMPLE_CPU is on by default in system-wide mode.
> > >
> > > >
> > > > For problem 3: switches to idle task won't really help. There can be
> > > > lots of them, and missing any will lead to wrong accounting.
> > >
> > > I don't know how severe the situation will be.  On heavily loaded
> > > systems, the idle task won't run much and data size won't increase.
> > > On lightly loaded systems, increased data will likely be handled well.
> > >
> > >
> > > > A principled approach would be to attach a per-thread scheduler
> > > > quantum sequence number to each CPU sample. The sequence number would
> > > > be incremented on every context switch. Then any subset of CPU should
> > > > be enough to understand when a task was scheduled in and out
> > > > (scheduled in on the first CPU sample with sequence number N, and
> > > > switched out on the last sample with sequence number N).
> > >
> > > I'm not sure how it can help.  We don't need the switch info itself.
> > > What's needed is when the CPU was idle, right?
> >
> > I mean the following.
> > Each sample has a TID.
> > We add a SEQ field, which is per-thread and is incremented after every
> > rescheduling of the thread.
> >
> > When we see the last sample for (TID,SEQ), we pretend there is SCHED
> > OUT event for this thread at this timestamp. When we see the first
> > sample for (TID,SEQ+1), we pretend there is SCHED IN event for this
> > thread at this timestamp.
> >
> > These SCHED IN/OUT events are not injected by the kernel. We just
> > pretend they happen for accounting purposes. We may actually
> > materialize them in the perf tool, or me may just update parallelism
> > as if they happen.
>
> Thanks for the explanation.  But I don't think it needs the SEQ and
> SCHED IN/OUT generated from it to track lost records.  Please see below.
>
> >
> > With this scheme we can lose absolutely any subset of samples, and
> > still get very precise accounting. When we lose samples, the profile
> > of course becomes a bit less precise, but the effect is local and
> > recoverable.
> >
> > If we lose the last/first event for (TID,SEQ), then we slightly
> > shorten/postpone the thread accounting in the process parallelism
> > level. If we lose a middle (TID,SEQ), then parallelism is not
> > affected.
>
> I'm afraid it cannot check parallelism by just seeing the current thread.
> I guess it would need information from other threads even if it has same
> SEQ.

Yes, we still count parallelism like you do in this patch, we just use
the SEQ info instead of CPU numbers and explicit switch events.

> Also postpone thread accounting can be complex.  I think it should wait
> for all other threads to get a sample.  Maybe some threads exited and
> lost too.

Yes, in order to understand what's the last event for (TID,SEQ) we
need to look ahead and find the event (TID,SEQ+1). The easiest way to
do it would be to do 2 passes over the trace. That's the cost of
saving trace space + being resilient to lost events.

Do you see any other issues with this scheme besides requiring 2 passes?


> In my approach, I can clear the current thread from all CPUs when it
> sees a LOST record and restart calculation of parallelism.
>
> >
> > The switches from a thread to itself is not a problem. We will just
> > inject a SCHED OUT followed by SCHED IN. But exactly the same happens
> > now when the kernel injects these events.
> >
> > But if we switch to idle task and got no samples for some period of
> > time on the CPU, then we properly inject SCHED OUT/IN that will
> > account for the thread not actually running.
>
> Hmm.. ok.  Maybe we can save the timestamp of the last sample on each
> CPU and clear the current thread after some period (2x of given freq?).
> But it may slow down perf report as it'd check all CPUs for each sample.
>
> Thanks,
> Namhyung
>
