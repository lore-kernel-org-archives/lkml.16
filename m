Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E78A25E82E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696075; cv=none; b=tOTkshtzZ0mk9wkRrKUFVqOI//PNaC+WphH+pjjKeyf60T0YGoTpmWrfTQC9S5ci4BfOO6NAE6wefF1Vd1OQbbRp9wvti1F5s3grkwvRL2JFGX7Aj4Kaz4oglg7h6FiRgfEbMYb7Gix14FYnWMQXLMrgTfX9bwrhTzlpUF+TNPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696075; c=relaxed/simple;
	bh=5lcMnt2DY2SlUeCt1z+NOFcZ8RNYta/vGWi4i6DLTOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3694JPEepWmR9s42MqWoCk+C0FawPhZEzcOxiVGv9UyLUY2I1Cwdy0OkgakaPSnrE0+rcgc/WHss1igt1+eZe9lJbpvmvtA3aqG9sKgvAgxkxjnOVoVMgncSJmvsKv0R97bFS8+NEz+EXP6a4gzkadptTv/VVGCMFoJL6WMqY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qtsW+o1A; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qtsW+o1A"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ade58ef47c0so894571366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750696072; x=1751300872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NZPzvx6YL7MORhaLHNrV+TZ8fIBGOgyAxPL9BFzUNEg=;
        b=qtsW+o1AaZSbQZ8XswKFz0SIL98DIQmCR75Vkz9cjMjXjsnf1MlTIZYRVCebr33fXk
         kvIweIFJAn3BmPimFYYIOs99asUjzonp99yTBhMY1hWB0Zb+oxDg7Y1qejlMG6EPCH3l
         AeXZeaD8K/nGA8kwGrXT3eN8d+zLu3FwG8QT7pq/5SqbqJ9R/uHuhe7bDGblrGnpSszk
         qALAjscspVi3UIqq15LWNuU4QOpLGhxcrqsOCkUx27XQmWR6/uDKdIn858j1g+NLrZJz
         dewIJxqkVt58cirgbZmyWlaSP2qUWHYDtWOX467lkJGgHV9zEWtgvWcL1yZTQHfj5gwh
         TiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696072; x=1751300872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZPzvx6YL7MORhaLHNrV+TZ8fIBGOgyAxPL9BFzUNEg=;
        b=b4z+JrDkIqIUTaksUlTN2fmIXrqOpWbWWOxsCb94KIP7JiBbkEPq/QqpoyI4OGN7EO
         c5H8bPiIyrAMYAoDpemXNxR8jPUpQmwviu9z13Bv0LNSo6b3EalfVQPD0DPUgAbUoDYK
         N5dv37J2yz5bM04Z2mfuAxlIO18sv9LpJrKQjs0Fv1xdVMO4Ha12dw6ZDIIJfSkIt1dT
         2Ka8l6pTOLG2Cj1z2hWXMOVCu+zJDpLVEQBMC07TvfcRrPm17oqq6GTm4hYpxsMxmdEO
         Q8lZj6Z/2hy574Z6MGCbnUtDGNSlQWopOgS/NJPU5PYql904NrIHRZIiqjBS9TFi1UVs
         xMQA==
X-Forwarded-Encrypted: i=1; AJvYcCVYVHcoCS9sdjCmnZvIB1Q1DDxqs7pH24dUlrcUf4HSV3qmXWl3eIEpxId/NmptdjtzM7aPEh7a7oSrkFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2lk6RQ1y5tPv7VXlri2okILW9QeUTJdoa384E8QSYAWLpdELp
	+n2+GWyyxwyNw6+8iGuynuniBY430+CytD1lLb+G9xl+5EiJYCTeXJuPYXtl9o8fOcritQL7QEu
	IWjZVhClY3n+EH1hfKPoq14betHupIEUa7OcPNEc7CA==
X-Gm-Gg: ASbGncsqVP5L3ywIwYcN/Gh7Pu1CJ3ZFlHc8TB7VVggVjZixto6Gow0J4JdJ/qJ0xyY
	QR6a6ZCRymp963Ivf1ElHYXd5RlperVYqwXjBxTToZg7ROtn9ltJsm1VRn+64zb3GxagectZvhO
	+wh+adPESb4tE2uhwG4Jww+6gEt7+dRGPfrRUkcvKoG7aEB8mT4r+auVa5k/oJzZtTVf5xiVw=
X-Google-Smtp-Source: AGHT+IHABUySX6StpQWhZQgloYypWxxnxRx4juOs90skO3UY0aNcTv61TDqJX0NDfozu/KHd8pe8S4XTKquwfOuk4a0=
X-Received: by 2002:a17:907:7e9c:b0:ade:3a1b:88b2 with SMTP id
 a640c23a62f3a-ae0a7474963mr10703866b.29.1750696071336; Mon, 23 Jun 2025
 09:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613140514.2781138-1-vincent.guittot@linaro.org>
 <20250617092208.GQ1613376@noisy.programming.kicks-ass.net>
 <CAKfTPtA-2YjQ-9jgrAZPT6v0R5X04Q5PoZ6Pa0TzAZji3=jiyg@mail.gmail.com>
 <CAKfTPtCRBMYue3smo-iXEXSzeFGYSJs5mp50zwQZLRvfL-szVg@mail.gmail.com>
 <20250620084228.GP1613376@noisy.programming.kicks-ass.net>
 <CAKfTPtAvuuOTmuMpzs8GUpUebL76h7F8zuN1tnJz_KFYxAFN3w@mail.gmail.com> <20250623111628.GS1613200@noisy.programming.kicks-ass.net>
In-Reply-To: <20250623111628.GS1613200@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 23 Jun 2025 18:27:39 +0200
X-Gm-Features: AX0GCFueV67qb7jB59L5yL6H-fmVMInalTrIoBQ4OSVhbYNil8ueUqHQgAknvto
Message-ID: <CAKfTPtD1KXMF9Ak6r2XDrZqAM8kkTGbQ0qsfZJVjq_N_Yj6jBQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] sched/fair: Manage lag and run to parity with
 different slices
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jun 2025 at 13:16, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Jun 20, 2025 at 12:29:27PM +0200, Vincent Guittot wrote:
>
> > yes but at this point any waking up task is either the next running
> > task or enqueued in the rb tree
>
> The scenario I was thinking of was something like:
>
> A (long slice)
> B (short slice)
> C (short slice)
>
>   A wakes up and goes running
>
> Since A is the only task around, it gets normal protection
>
>   B wakes up and doesn't win
>
> So now we have A running with long protection and short task on-rq
>
>   C wakes up ...
>
> Whereas what we would've wanted to end up with for C is A running with
> short protection.

I will look at this case more deeply. We might want to update the
slice protection with the new min slice even if B doesn't preempt A.
That's part of a smarter check_preempt_wakeup_fair that I mentioned
below.
In case of B deadline not being before A, we don't need to update the
protection as the remaining protect duration is already shorter than
the new slice
In case of B not eligible and already on the cpu, B is already
enqueued (delayed dequeue) so its short slice is already accounted in
set protection. I still have to look at B being migrated from another
CPU with negative lag

>
> > > Which is why I approached it by moving the protection to after pick;
> > > because then we can directly compare the task we're running to the
> > > best pick -- which includes the tasks that got woken. This gives
> > > check_preempt_wakeup_fair() better chances.
> >
> > we don't always want to break the run to parity but only when a task
> > wakes up and should preempt current or decrease the run to parity
> > period. Otherwise, the protection applies for a duration that is short
> > enough to stay fair for others
> >
> > I will see if check_preempt_wakeup_fair can be smarter when deciding
> > to cancel the protection
>
> Thanks. In the above scenario B getting selected when C wakes up would
> be a clue I suppose :-)

yes, fixing the comment :
* Note that even if @p does not turn out to be the most eligible
* task at this moment, current's slice protection will be lost.

>
> > > To be fair, I did not get around to testing the patches much beyond
> > > booting them, so quite possibly they're buggered :-/
> > >
> > > > Also, my patchset take into account the NO_RUN_TO_PARITY case by
> > > > adding a notion of quantum execution time which was missing until now
> > >
> > > Right; not ideal, but I suppose for the people that disable
> > > RUN_TO_PARITY it might make sense. But perhaps there should be a little
> > > more justification for why we bother tweaking a non-default option.
> >
> > Otherwise disabling RUN_TO_PARITY to check if it's the root cause of a
> > regression or a problem becomes pointless because the behavior without
> > the feature is wrong.
>
> Fair enough.
>
> > And some might not want to run to parity but behave closer to the
> > white paper with a pick after each quantum with quantum being
> > something in the range [0.7ms:2*tick)
> >
> > >
> > > The problem with usage of normalized_sysctl_ values is that you then get
> > > behavioural differences between 1 and 8 CPUs or so. Also, perhaps its
> >
> > normalized_sysctl_ values don't scale with the number of CPUs. In this
> > case, it's always 0.7ms which is short enough compare to 1ms tick
> > period to prevent default irq accounting to keep current for another
> > tick
>
> Right; but it not scaling means it is the full slice on UP, half the
> slice on SMP-4 and a third for SMP-8 and up or somesuch.

Yes, the goal is to implement a kind of quantum of time which doesn't
scale with number CPUs unlike the default slice duration

>
> It probably doesn't matter much, but its weird.
