Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DD2234984;
	Wed,  2 Apr 2025 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597119; cv=none; b=KPb51IfaJmSF8RhAkqoFjycktXz0dauV+/Xj0asVe2hz4jg9JlmDCQE4qRVMwSnq4xx+Gg0UEQp81WdVLqPk67UIjNj3rwzjCoH6esfBmrWWO2zD97rhn3wpxGmLZbmf5MrAlSGNdEmDbaPW+nmIVnD9ExfBWBcMLeXG4HQe0mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597119; c=relaxed/simple;
	bh=Z3Aw96s5Pv/ahzfob8xYRiAJaN0cfm5dFr1Vjh3UQc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQa97n6uaU4Wi+Ak2e3+SXz1W+HkfiW5FdADyn0Txz2Qc1nR83Uy2YB7gAYvnGbRCgxrr/m43fFwfqUXqFDcP4s2Bac5mxZ+1usIF8iBWGsD3rY+IaZAwPWiQr02IA0Gs+AwUljVU03G2DP4oeNeaBLIGdF6VHZCbLLC72oIRWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B56D106F;
	Wed,  2 Apr 2025 05:31:59 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD12A3F63F;
	Wed,  2 Apr 2025 05:31:55 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:31:51 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] coresight: perf: Support AUX trace pause and
 resume
Message-ID: <20250402123151.GH115840@e132581.arm.com>
References: <20250311170451.611389-1-leo.yan@arm.com>
 <20250311170451.611389-5-leo.yan@arm.com>
 <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>
 <20250401150019.GC115840@e132581.arm.com>
 <CAJ9a7ViKeqNp_c0+w2mkdujLvzs0UA=Xbm5bG7K-kA86AjJ=eA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7ViKeqNp_c0+w2mkdujLvzs0UA=Xbm5bG7K-kA86AjJ=eA@mail.gmail.com>

Hi Mike,

On Wed, Apr 02, 2025 at 09:45:20AM +0100, Mike Leach wrote:

[...]

> > > >  static void etm_event_start(struct perf_event *event, int flags)
> > > >  {
> > > >         int cpu = smp_processor_id();
> > > > @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
> > > >         if (!csdev)
> > > >                 goto fail;
> > > >
> > >
> > > Is it possible here that the first call to etm_event_start() also has
> > > the PERF_EF_RESUME flag set?
> >
> > The first call has a flow below, using flag 0 but not PERF_EF_RESUME.
> >
> >   etm_event_add()
> >     `>  etm_event_start(event, 0);
> >
> 
> When I looked at the vague comments in the perf source - it seemed to
> imply that ->start() calls could overlap - so the associated event
> that resumes trace could occur at the same time as the initialising
> start from paused for the trace operations.

Good point.  A subtle but important thing is the 'cs_etm' event must be
an event group leader, otherwise, the tool reports error:

  # perf record -m,64M -e cycles/aux-action=pause,period=10000000/ \
      -e cycles/aux-action=resume,period=10/ \
      -e cs_etm/aux-action=start-paused/u -- /mnt/sort
  Events with aux-action must have AUX area event group leader

If the 'cs_etm' event is the event group leader, it will be always
enabled ahead other PMU events.  So etm_event_start(event, 0) is
invoked prior to PMU events enabling.  As a result, this can avoid the
race condition you mentioned.

I confirmed with ftrace log:

  sort-901     [005] d..3.  1033.827186: etm_event_add <-event_sched_in
  sort-901     [005] d..3.  1033.827187: etm_event_start <-etm_event_add
  sort-901     [005] d..3.  1033.827283: armpmu_add <-event_sched_in
  sort-901     [005] d..3.  1033.827287: armpmu_start <-armpmu_add
  sort-901     [005] d..3.  1033.827288: armpmu_event_set_period <-armpmu_start
  sort-901     [005] d..3.  1033.827292: armpmu_add <-event_sched_in
  sort-901     [005] d..3.  1033.827293: armpmu_start <-armpmu_add
  sort-901     [005] d..3.  1033.827294: armpmu_event_set_period <-armpmu_start
  sort-901     [005] d..3.  1033.827298: armpmu_filter <-visit_groups_merge.constprop.0.isra.0
  sort-901     [005] d..3.  1033.827298: armpmu_enable <-perf_pmu_enable
  sort-901     [005] d..3.  1033.827301: armpmu_enable <-perf_pmu_enable
  sort-901     [005] d.h1.  1033.827304: armpmu_dispatch_irq <-__handle_irq_event_percpu
  sort-901     [005] d.h1.  1033.827306: armpmu_event_update <-armv8pmu_handle_irq
  sort-901     [005] d.h1.  1033.827308: armpmu_event_set_period <-armv8pmu_handle_irq
  sort-901     [005] d.h..  1033.827322: perf_event_aux_pause: event=ffff000207503e40 pause=0

> If we are guaranteed this cannot happen then we are good to go!

Now I think we are safe, right?  ;)

Thanks,
Leo
