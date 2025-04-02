Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF6B23959D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598584; cv=none; b=KMaQFynNFXHv1C8p9F8A4W8f7hNEIQMS6Xni0+T3kqoeOqM5ynqqp6i0bQI0tV81TfWmzQTwCUftbXYfkgi2H3myKMj0k8fM1Cyr1UsfxEwCI+44VgvKXEsyixB2qR6MOJtaDWaB7GK9Z8L4c641eTZyfVx62HvDIGy2vQNvxdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598584; c=relaxed/simple;
	bh=BitbmQ18PBYQ2MRM1Bk4u8+FdoDVYIT+fgKGpO5bnF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JaeQZXwfYRZonyytkZtvX4I3RxJoq+7V3QK/OYlnqvoHNGfDOvAqMI4a9/K6g2AUNlYfqzpYG+S5y+7Plv1AWYAb9nyNdqyIfTArFwgzNfYe3lR5E1rXX5Fmh7oIo4xgnQXrOSwAq9pycFI9YdFQt6Mh3vGSQI3YUAhdUfbkOJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yeV1KMUW; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yeV1KMUW"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af52a624283so73201a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743598582; x=1744203382; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6aj9wnMpg3IXwhlTHrLN8H+JvJCrmipv0ibRpD0sCnA=;
        b=yeV1KMUWZn8Rfqk9kjTzU9H2I1OFh8hOAHAU19p68FCA7LrVPxqfIV+naQkHC4g5yn
         d8la0o8F5245r/Lk/zcuxRqOfAypm/Pp79JfcqsxTzbEvdvarJrjytWzGuV4z/78cg9R
         IUBz4IaN0gXDAk96tblxz4hfEzw/usa9ltKoMu8itNVkvUMfPQk47SlFVjN9wDFDHmbD
         SA7SWjIsfte5aGgWwxgRoZgnI9D0ufgTdqtvCB0ON0PHmqCVtoxst6DmlyAoBxCrXsRj
         CMGNa7r0i1+cgCAVXVPL9pNfnk6WoKbCkKYGVI0kHm+vYEPbdH9VnKSw8WugsFwJyAZA
         NxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598582; x=1744203382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aj9wnMpg3IXwhlTHrLN8H+JvJCrmipv0ibRpD0sCnA=;
        b=d5Us8TwSdT6W9RYZQ1JOGRLC99bUtuFWwof20ujcV6MVmcxWUR0+DdlRQejILF+8ez
         rOTQ3Qq56sldT16OWJnhH9pCN4gB5ykbwuWjxnfb61hV62kRbyIoThyOAI7FD566mN8k
         IG8s83K186tFx2F1bawRwlbYzloye8qXFjyWTX3Juzez5NYyXur1lWa2xVkylKXGuenS
         Y4Z/VEebq0Tumog6aPwaPz9nBnhTkvsKOUQfthbHOQmSERbrhJggIZCAxNysuD67mML1
         AFmGMVA3fA+TGJZVYKtz23DiZ1abpYmyEGyyTck7i63exZr9kv69CsKhy3PReV+J3Iio
         uJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt328EGOHkMgi66Zb0QT/Gk4WJimjunCO+F0vtllXFdp776hhjCynwlfmwTc91njGlnFEVJG8K3sDHmug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWTK/gMnmUErS5xHk15JCAgOjPqsdIOUDI9A1TYM3cTjlbvsUx
	JPgiAHBFvalivnHADOomNje83HT9KxANbuaRuK2owXscX333xbj8hMtUWmEiDXkA/lsn48EgaeI
	hEbzO3eiKKhsfOSk0HV4eKICGfifFe8kEM4z88g==
X-Gm-Gg: ASbGnctfqbgGSAS7YwnByYdjSZu8gn98K2dcABpp4RM/k8ea4WOKo8QvfDzc6ko0koX
	MpOsKhRG2p1jH2fREJMLLey5dJm8IcqBts4gIBhnAWCixJyL4PvOJuA+6y8iOj3KzS/V+IyACTA
	kdLQlzCttGcnKKJhlynACtTtYkBqo=
X-Google-Smtp-Source: AGHT+IGMlc1egG12E4QIlDCeUIjS3K9est1MsL2qfp4chiKw3Ryx9LvLDjekChsuHSuaM4TLSX5zggbZyYhlR3rxBS8=
X-Received: by 2002:aa7:888d:0:b0:736:4d05:2e35 with SMTP id
 d2e1a72fcca58-739cb071691mr2504206b3a.3.1743598581694; Wed, 02 Apr 2025
 05:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-5-leo.yan@arm.com>
 <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>
 <20250401150019.GC115840@e132581.arm.com> <CAJ9a7ViKeqNp_c0+w2mkdujLvzs0UA=Xbm5bG7K-kA86AjJ=eA@mail.gmail.com>
 <20250402123151.GH115840@e132581.arm.com>
In-Reply-To: <20250402123151.GH115840@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 13:56:10 +0100
X-Gm-Features: AQ5f1JrKB1QjXuLoaBevwrVx7VtVcaXa0uY21BBclnMTNdvjzqyebSyzIueWZrE
Message-ID: <CAJ9a7VhOg6emwDMa+rZM4TqZcMPY=fYSxzb4EQVxOhY0T-tg_Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] coresight: perf: Support AUX trace pause and resume
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Leo

On Wed, 2 Apr 2025 at 13:31, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Wed, Apr 02, 2025 at 09:45:20AM +0100, Mike Leach wrote:
>
> [...]
>
> > > > >  static void etm_event_start(struct perf_event *event, int flags)
> > > > >  {
> > > > >         int cpu = smp_processor_id();
> > > > > @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
> > > > >         if (!csdev)
> > > > >                 goto fail;
> > > > >
> > > >
> > > > Is it possible here that the first call to etm_event_start() also has
> > > > the PERF_EF_RESUME flag set?
> > >
> > > The first call has a flow below, using flag 0 but not PERF_EF_RESUME.
> > >
> > >   etm_event_add()
> > >     `>  etm_event_start(event, 0);
> > >
> >
> > When I looked at the vague comments in the perf source - it seemed to
> > imply that ->start() calls could overlap - so the associated event
> > that resumes trace could occur at the same time as the initialising
> > start from paused for the trace operations.
>
> Good point.  A subtle but important thing is the 'cs_etm' event must be
> an event group leader, otherwise, the tool reports error:
>
>   # perf record -m,64M -e cycles/aux-action=pause,period=10000000/ \
>       -e cycles/aux-action=resume,period=10/ \
>       -e cs_etm/aux-action=start-paused/u -- /mnt/sort
>   Events with aux-action must have AUX area event group leader
>
> If the 'cs_etm' event is the event group leader, it will be always
> enabled ahead other PMU events.  So etm_event_start(event, 0) is
> invoked prior to PMU events enabling.  As a result, this can avoid the
> race condition you mentioned.
>
> I confirmed with ftrace log:
>
>   sort-901     [005] d..3.  1033.827186: etm_event_add <-event_sched_in
>   sort-901     [005] d..3.  1033.827187: etm_event_start <-etm_event_add
>   sort-901     [005] d..3.  1033.827283: armpmu_add <-event_sched_in
>   sort-901     [005] d..3.  1033.827287: armpmu_start <-armpmu_add
>   sort-901     [005] d..3.  1033.827288: armpmu_event_set_period <-armpmu_start
>   sort-901     [005] d..3.  1033.827292: armpmu_add <-event_sched_in
>   sort-901     [005] d..3.  1033.827293: armpmu_start <-armpmu_add
>   sort-901     [005] d..3.  1033.827294: armpmu_event_set_period <-armpmu_start
>   sort-901     [005] d..3.  1033.827298: armpmu_filter <-visit_groups_merge.constprop.0.isra.0
>   sort-901     [005] d..3.  1033.827298: armpmu_enable <-perf_pmu_enable
>   sort-901     [005] d..3.  1033.827301: armpmu_enable <-perf_pmu_enable
>   sort-901     [005] d.h1.  1033.827304: armpmu_dispatch_irq <-__handle_irq_event_percpu
>   sort-901     [005] d.h1.  1033.827306: armpmu_event_update <-armv8pmu_handle_irq
>   sort-901     [005] d.h1.  1033.827308: armpmu_event_set_period <-armv8pmu_handle_irq
>   sort-901     [005] d.h..  1033.827322: perf_event_aux_pause: event=ffff000207503e40 pause=0
>
> > If we are guaranteed this cannot happen then we are good to go!
>
> Now I think we are safe, right?  ;)
>
> Thanks,
> Leo

I'd agree with that!

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
