Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306AC27FB2E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415384; cv=none; b=U8SvQoJYO3Xp6917pEwDHDiHq9qt00KtQmRGdx4l/NKAySwFxHslWJKnUB07wodh2LsrJRvKm8DEhsgwPi+/VH9Hg5wgF5AsNG3HnejUg5BViUthmO7/sCRnitv7hVciM++UazT2ZdM7V+O5MKhsNoOc0ZsmT3w+Bm7+dMNqXi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415384; c=relaxed/simple;
	bh=U5UC/336twKWLnroA1q+Hf1W2PXume4Hmh/JwRbd4lA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlK/6dqr+BtUEnJUbkplZULmhgE7qoZiBMrR/nbumkOo02O/48Z3jjPAiV0Er2oKx0eMRci9rXSYVFG1RUhjNXJnD/c9ruHKN+c+X3D4NLWdnb4aTqwmdMif11vP/gGNGT9OyykGkhpsQiwcYkIGTSmUEd70pV6w2nIRe39Z73Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPr6KRnf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPr6KRnf"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-adb4e36904bso333064466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750415380; x=1751020180; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QaXsq5LFuX791J3EQ8Lpq/fQ/qmAGUibsPPydrm8M2w=;
        b=WPr6KRnfH3D0nJt8OOjBXaKDA/3uuBLZcIqsTHfOlTLgbo2gOO8eI5kLS6hzDpDdFc
         LMLcwfNEtRa75b2NKNHrvuAbXbO0KdpBT/cXfNYraq6h4AZs8C6J8N/ClXQ/2tAWC99I
         hk+HFSzaCMg31GLaXy2qcNTT7755EIriIc0UwcF4bnkitoYab1RUyF6o3DfYYO+I95x8
         rn4aNr2FBkC0m4XDmQifhXMSlDSCSEeVCUVyWfL3t4jYzrGeCM3JF/Ws02PLDJ/WyI/P
         6NQPUwYYJNxnw25yGcnRqhECF488ehcWy+blmD61bNr6jEDS5qGj+yrAZRqJGRWWOi8i
         qHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415380; x=1751020180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaXsq5LFuX791J3EQ8Lpq/fQ/qmAGUibsPPydrm8M2w=;
        b=Z4XAWqcQt+Ygtnz1R01Tlp+IJNMM0Fdhlmhl40ezFwEh3xfPIlh49/x5ZF+PZ/Th6o
         ovDgLg+fJOUuTOmXeC7M+/jFu9Oqiw0Bh0OaYCHoNzfu8CktcQeMWzYWWyBoubkYU8Sv
         qTiQUJpsAWITXugj0qFrnJY6AtZTxgBFjO+eOwNSTgmE5BOXoWtvQzH6xkU2D0Yaf0xW
         ZuuAn6AAvTZaMAMVVDtCrZhKXsf4YgU6LQASlEIcF6ZVJxA5G+peny5+YDwKO29/NiX9
         RhHfoXyG3U2Xt1MB6/wfP+a3CO6pXLUitvU3H/vzXMoPjeic99BUJkqgdb2I6XZvbosK
         /CvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3qp0MgbBmO+8HGnA/anfYakdOQkNA2l1Nan62E9YJf9vy/JMAKg40uuQYq9Yht/f6IEd/1I+QTNYmL2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHn1rPY2dsWjsl8PShibnOWhF5g7Tu2O2+VvMAYj3hl8W98mlz
	Dmx5Vy0Bcn8PLpk2c0XIgE+ES2KDy+qmvcl+AX4GHpbKjrB8z99G5F/OKHa7uQ+/zI4f+hUXpQT
	cpn6hIDhrpZ3B5W+jQmDheg/6hk2dRp1oA8JImlSpwtaZCdS5gpP6KD+8qQ==
X-Gm-Gg: ASbGncvzvWw9SvzsT+tRrm/DGCfGwUrCpEfT2g5c84DjceoM3pXI0/qYf8xKhzC4ZM/
	G/L9ZKN7TgOjpiINLOEVwsZ4ijmHqNveVN+9eBtMfnvXU3t2HNUT0zE4eozAGzlIwYPW/5BJOiI
	e3WF8rfAFljlNfH9u0zSSygdznayj/PI1ircB4sbJGzyIBmhDmlxSloijECWUCjjj627yWHTxI
X-Google-Smtp-Source: AGHT+IGFH/njvHHO91bIszd3f7i8vZGtHF7Z3ZxsgLsJcovfufICmlp+8ummlJh0FIOJqGbYUAssfeH+SpC4epXEhx8=
X-Received: by 2002:a17:907:7214:b0:ade:7bd:e0ec with SMTP id
 a640c23a62f3a-ae057fa0dfemr211287266b.56.1750415380379; Fri, 20 Jun 2025
 03:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613140514.2781138-1-vincent.guittot@linaro.org>
 <20250617092208.GQ1613376@noisy.programming.kicks-ass.net>
 <CAKfTPtA-2YjQ-9jgrAZPT6v0R5X04Q5PoZ6Pa0TzAZji3=jiyg@mail.gmail.com>
 <CAKfTPtCRBMYue3smo-iXEXSzeFGYSJs5mp50zwQZLRvfL-szVg@mail.gmail.com> <20250620084228.GP1613376@noisy.programming.kicks-ass.net>
In-Reply-To: <20250620084228.GP1613376@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 20 Jun 2025 12:29:27 +0200
X-Gm-Features: Ac12FXwZfheBAteQ6ak8evqmJwhS0Eb-0wDQ3-7fQnhDZRDn4gAaekfmQZdB10c
Message-ID: <CAKfTPtAvuuOTmuMpzs8GUpUebL76h7F8zuN1tnJz_KFYxAFN3w@mail.gmail.com>
Subject: Re: [PATCH 0/4] sched/fair: Manage lag and run to parity with
 different slices
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jun 2025 at 10:42, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Jun 19, 2025 at 02:27:43PM +0200, Vincent Guittot wrote:
> > On Wed, 18 Jun 2025 at 09:03, Vincent Guittot
> > <vincent.guittot@linaro.org> wrote:
> > >
> > > On Tue, 17 Jun 2025 at 11:22, Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > On Fri, Jun 13, 2025 at 04:05:10PM +0200, Vincent Guittot wrote:
> > > > > Vincent Guittot (3):
> > > > >   sched/fair: Use protect_slice() instead of direct comparison
> > > > >   sched/fair: Limit run to parity to the min slice of enqueued entities
> > > > >   sched/fair: Improve NO_RUN_TO_PARITY
> > > >
> > > > Ah. I wrote these here patches and then totally forgot about them :/.
> > > > They take a different approach.
> > > >
> > > > The approach I took was to move decision to stick with curr after pick,
> > > > instead of before it. That way we can evaluate the tree at the time of
> > > > preemption.
> > >
> > > Let me have a look at your patches
> >
> > I have looked and tested your patches but they don't solve the lag and
> > run to parity issues not sur what he's going wrong.
>
> Humm.. So what you do in patch 3, setting the protection to min_slice
> instead of the deadline, that only takes into account the tasks present
> at the point we schedule.

yes but at this point any waking up task is either the next running
task or enqueued in the rb tree

>
> Which is why I approached it by moving the protection to after pick;
> because then we can directly compare the task we're running to the
> best pick -- which includes the tasks that got woken. This gives
> check_preempt_wakeup_fair() better chances.

we don't always want to break the run to parity but only when a task
wakes up and should preempt current or decrease the run to parity
period. Otherwise, the protection applies for a duration that is short
enough to stay fair for others

I will see if check_preempt_wakeup_fair can be smarter when deciding
to cancel the protection

>
> To be fair, I did not get around to testing the patches much beyond
> booting them, so quite possibly they're buggered :-/
>
> > Also, my patchset take into account the NO_RUN_TO_PARITY case by
> > adding a notion of quantum execution time which was missing until now
>
> Right; not ideal, but I suppose for the people that disable
> RUN_TO_PARITY it might make sense. But perhaps there should be a little
> more justification for why we bother tweaking a non-default option.

Otherwise disabling RUN_TO_PARITY to check if it's the root cause of a
regression or a problem becomes pointless because the behavior without
the feature is wrong.
And some might not want to run to parity but behave closer to the
white paper with a pick after each quantum with quantum being
something in the range [0.7ms:2*tick)

>
> The problem with usage of normalized_sysctl_ values is that you then get
> behavioural differences between 1 and 8 CPUs or so. Also, perhaps its

normalized_sysctl_ values don't scale with the number of CPUs. In this
case, it's always 0.7ms which is short enough compare to 1ms tick
period to prevent default irq accounting to keep current for another
tick

> time to just nuke that whole scaling thing (I'm sure someone mentioned
> that a short while ago).
>
> > Regarding the "fix delayed requeue", I already get an update of
> > current before requeueing a delayed task. Do you have a use case in
> > mind ?
>
> Ah, it was just from reading code, clearly I missed something. Happy to
> forget about that patch :-)
