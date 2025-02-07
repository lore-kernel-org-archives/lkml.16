Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B441D61AC
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935584; cv=none; b=NymK4IdCp0TUt3GI9IPN0u8vME5vM+ti4OWRuHtLWtCxul4qQeLt/Q+q4ldZoYfk64KSWEGKCy49kJJhTEaJSowv0y9cgAvpv4k6ZsvD9zAwLb5cfq2UquV8dGh/cszQDcEg3ECHRsiL17BtiuLMFbDJKSVqFi3xsSuIqrI05IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935584; c=relaxed/simple;
	bh=wowofrBe++KFtQ8Dvbd0CdajtSk++TCZNH+MJ8Xhjw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDAK2nAy1O3fImmX9jRoGSjSQczU+BoX/rgI6Zhvq4Vfx5UBQxXE2L79g4YcpXBUpZb9U8ozy2TH/h72Z90nqaEW3PtUEDQMHoBcfZxn+CiqmEJGqvdyh3GIl7wPMygqzE0ZDQ7AJeJU8AX7O9iT2GtThKGtW5k/mPh6zuRrFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yy6TaH8g; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yy6TaH8g"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dcf0de81ebso4039344a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 05:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738935580; x=1739540380; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HcW7Gp3pVhpO6eJ9Mi4pi6FwdC2NbUnnUZ+cKN7+9Cc=;
        b=Yy6TaH8gH+lDD/Qxagk3h70my86eFbKGkbEluvTkJC5jhk99j0vnmoRszSyn7jXX3L
         pK0HT8weW86ET9unrdUOUKiPHtHMRgRq2H/0DPnEoifn4h9uoUMVM8wNYTg0O9+vHdP/
         zRuiWfEnETm76WEr7FuASVglQOLLoNaGHmdahvbssrpF4izTFkmh9nXyl3++uHOHSL7w
         JZqr7/mbedj5h0kOAd4G8dC0r8OhVF0meWpTTNzByMSqI3ioSNMPZs4V/r69EImtReAA
         L0uT67jd3bM8NOZGdn8CgYizFOgVrUKumPYaPGB9QvVKqoLGPzZXvpjNcweE52blKkc7
         2sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738935580; x=1739540380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcW7Gp3pVhpO6eJ9Mi4pi6FwdC2NbUnnUZ+cKN7+9Cc=;
        b=YBQ8c3GwhUCG6wcVzi2chrph6ciNrymoO+MnDC66h5hwcSE9w4CYjVTMLon7jlbwUa
         Mcz/O/8E4yMbKk4lMgbGN9f+Kb4cDjMVkXY+QT2K+qfeWQKI+3SNNaXHmQA4eD8gf1Oj
         dW2/vmG58dWbPayUlbvHHnLvkuCruntiFOb7QZRoHdH3wlTg8KrO7W3586VB+I0BGkYK
         q4LXLOz9y0OR6Cims0Fcn1LQm8TbPnErOi0vWsCY6dE6QFYt86o4V7NE6Zmtm5p1+iwK
         Gx/NS47NfQQG4zWDFZwv2hng+KhEST0k6Sod9de9OQOf2O5gr7SkcDO+SQXLWt3e26vw
         nBPA==
X-Forwarded-Encrypted: i=1; AJvYcCVnl3AkPXK5C7GAlwZ5ppNo7weU/aSwvqs7g2D+ofKjLMap8r+4qzq9Uut6CQklHnzN1lPYk18xxhNc1ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YznMyLYPMesmxxdobdvMqedvBgjk8itjgpveL4mqmht8WHKHXgI
	8OHw6x3Re7gDpHiRiuiTerlkdWgF5gil7oes0golLlHVXiun62UVhPYAr0+SP8+FPC8vidKAgzS
	2L05OTF9r7avtSMMV6Qc9z8BcruZRE2wwesvRmQ==
X-Gm-Gg: ASbGnctHNduBOn65TuWdaF69CeZ+sP5pdamzosEg9UJSg9DPs+g7tP3yIn6V73n4qbs
	SYL8Kqe02O3pU6KH/kL8Z65wMkO7AfNOuQPS53pgzdQI5Y8ZSPYV2h3aYvDZtu8/3Smvdk3H0Xq
	dMj1koUpJDrBQL1ZbrzHLWmFJQTQ==
X-Google-Smtp-Source: AGHT+IEWVL4Sim+T3FAY/UDUdRDNxxVc6c+Wv/v0to4I5m9+Aim2ODMXFyXpLS2ckFWThEA0WngTV+m1xKW7T6is1Lw=
X-Received: by 2002:a05:6402:5290:b0:5dc:74fd:ac0a with SMTP id
 4fb4d7f45d1cf-5de45046dc3mr3113627a12.8.1738935580159; Fri, 07 Feb 2025
 05:39:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230531115839.089944915@infradead.org> <20230531124603.794929315@infradead.org>
 <20250207-petite-eminent-husky-7d1704@leitao> <20250207111141.GD7145@noisy.programming.kicks-ass.net>
 <20250207-economic-complex-rottweiler-ccc45f@leitao>
In-Reply-To: <20250207-economic-complex-rottweiler-ccc45f@leitao>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 7 Feb 2025 14:39:28 +0100
X-Gm-Features: AWEUYZkIKymLUAP32204eqP0sl_YqMocKabVQb6pl9fNTKeb1y6QVWhFTYBoiv8
Message-ID: <CAKfTPtAZM8Y6bcJ9fTEz5C__ohNwhQEiaNEZBMXK-0xDs0_kvw@mail.gmail.com>
Subject: Re: [PATCH 03/15] sched/fair: Add lag based placement
To: Breno Leitao <leitao@debian.org>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, linux-kernel@vger.kernel.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, corbet@lwn.net, 
	qyousef@layalina.io, chris.hyser@oracle.com, patrick.bellasi@matbug.net, 
	pjt@google.com, pavel@ucw.cz, qperret@google.com, tim.c.chen@linux.intel.com, 
	joshdon@google.com, timj@gnu.org, kprateek.nayak@amd.com, yu.c.chen@intel.com, 
	youssefesmat@chromium.org, joel@joelfernandes.org, efault@gmx.de, 
	tglx@linutronix.de, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 14:38, Breno Leitao <leitao@debian.org> wrote:
>
> On Fri, Feb 07, 2025 at 12:11:41PM +0100, Peter Zijlstra wrote:
> > On Fri, Feb 07, 2025 at 02:07:18AM -0800, Breno Leitao wrote:
> > > Hello Peter,
> > >
> > > On Wed, May 31, 2023 at 01:58:42PM +0200, Peter Zijlstra wrote:
> > > >
> > > >  place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int initial)
> > > >  {
> > > <snip>
> > > > -         vruntime -= thresh;
> > > > +         lag *= load + se->load.weight;
> > > > +         if (WARN_ON_ONCE(!load))
> > >
> > > I have 6.13 running on some hosts, and in some cases, where the system
> > > is getting some OOMs, I see the following stack:
> > >
> > >           WARNING: CPU: 29 PID: 593474 at kernel/sched/fair.c:5250 place_entity+0x199/0x1b0
> > >
> > >            Call Trace:
> > >             <TASK>
> > >             ? place_entity+0x199/0x1b0
> > >             reweight_entity+0x188/0x200
> > >             enqueue_task_fair.llvm.15448040313737105663+0x28c/0x560
> > >             enqueue_task+0x30/0x120
> > >             ttwu_do_activate+0x99/0x230
> > >             try_to_wake_up+0x25a/0x4a0
> > >             ? hrtimer_dummy_timeout+0x10/0x10
> > >             hrtimer_wakeup+0x25/0x30
> > >             __hrtimer_run_queues+0xf1/0x250
> > >             hrtimer_interrupt+0xfb/0x220
> > >             __sysvec_apic_timer_interrupt+0x47/0x140
> > >             sysvec_apic_timer_interrupt+0x35/0x80
> > >             asm_sysvec_apic_timer_interrupt+0x16/0x20
> > >
> > > I am sorry for not decoding the stack, but I am having a hard time
> > > decoding the stack properly. The values I got was misleading, and I am
> > > working to understand what is happening.
> > >
> > > Anyway, I don't have a reproducer and this problem doesn't happen
> > > frequent enough. I have 1K hosts with 6.13 and I saw it 5 times in the
> > > last week.
> >
> > Weird. Would you mind trying with the below patch on top?
>
> I tried to get this patch on top of latest 6.13 stable (6.13.1), and it
> seems it misses some dependencies in stable. Field cfs_rq->nr_queued
> don't exist in 6.13, it was added/renamed later by 736c55a02c477a
> ("sched/fair: Rename cfs_rq.nr_running into nr_queued").
>
> Is it safe to just s/nr_queued/nr_running in our patch?

Yes, I was about to mention that nr_queued appeared in v6.14-rc1 and
it' still nr_running in v6.13

>
> Thanks
