Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47CD172BD5;
	Tue,  1 Apr 2025 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519627; cv=none; b=lD1+qpAopfuFRtglnDpaaIUd0DPfIKiOhLb5huiNtSSUAMbA0pAjAKE7iNuW9p/9OEsStOVq2pSPlN+Lh34jIUEdVPerv4Me92fofIMR0TPF/bdPHO+CgSAWU6o9QbNVfv8WhBFCODLwC4gvPSmjCnOhuQ0a2LPPC/SxfJGAzxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519627; c=relaxed/simple;
	bh=fBXXIgUZxFmimgmaRTg4iSAtET7JnUIu5QU0qR34zHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxah4mcUJ/6yktDM2V791NG5Ztk6puMiNPs9gzH6uXy56WdS7DGo5nj1aXomCri05POgc+uTkvA0LJZxtBsLWPx/ZSK2XlStDKtt8CWTyHosQD++FXNTxQpDLBC9n1+z1QD+ew6M5SrUaPGvUG5Wazu/1/wBma4Qvbyqs+GB19g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52D4714BF;
	Tue,  1 Apr 2025 08:00:28 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 994C03F694;
	Tue,  1 Apr 2025 08:00:24 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:00:19 +0100
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
Message-ID: <20250401150019.GC115840@e132581.arm.com>
References: <20250311170451.611389-1-leo.yan@arm.com>
 <20250311170451.611389-5-leo.yan@arm.com>
 <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>

Hi Mike,

On Tue, Apr 01, 2025 at 01:50:52PM +0100, Mike Leach wrote:

[...]

> >  static void etm_event_start(struct perf_event *event, int flags)
> >  {
> >         int cpu = smp_processor_id();
> > @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
> >         if (!csdev)
> >                 goto fail;
> >
> 
> Is it possible here that the first call to etm_event_start() also has
> the PERF_EF_RESUME flag set?

The first call has a flow below, using flag 0 but not PERF_EF_RESUME.

  etm_event_add()
    `>  etm_event_start(event, 0);

Note: for the first call, the tracer should be disabled if
'event->hw.aux_paused' is 1.  This is ensured by patch 03.

Thanks,
Leo

> If so it looks like we need to fall through and do a "normal" start to
> get all the ctxt->event_data set up.
> 
> > +       if (flags & PERF_EF_RESUME) {
> > +               if (etm_event_resume(csdev, ctxt) < 0) {
> > +                       dev_err(&csdev->dev, "Failed to resume ETM event.\n");
> > +                       goto fail;
> > +               }
> > +               return;
> > +       }
> > +
> >         /* Have we messed up our tracking ? */
> >         if (WARN_ON(ctxt->event_data))
> >                 goto fail;
> > @@ -545,6 +574,16 @@ static void etm_event_start(struct perf_event *event, int flags)
> >         return;
> >  }
> >
> > +static void etm_event_pause(struct coresight_device *csdev,
> > +                           struct etm_ctxt *ctxt)
> > +{
> > +       if (!ctxt->event_data)
> > +               return;
> > +
> > +       /* Stop tracer */
> > +       coresight_pause_source(csdev);
> > +}
> > +
> >  static void etm_event_stop(struct perf_event *event, int mode)
> >  {
> >         int cpu = smp_processor_id();
> > @@ -555,6 +594,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
> >         struct etm_event_data *event_data;
> >         struct coresight_path *path;
> >
> > +       if (mode & PERF_EF_PAUSE)
> > +               return etm_event_pause(csdev, ctxt);
> > +
> >         /*
> >          * If we still have access to the event_data via handle,
> >          * confirm that we haven't messed up the tracking.
> > @@ -899,7 +941,8 @@ int __init etm_perf_init(void)
> >         int ret;
> >
> >         etm_pmu.capabilities            = (PERF_PMU_CAP_EXCLUSIVE |
> > -                                          PERF_PMU_CAP_ITRACE);
> > +                                          PERF_PMU_CAP_ITRACE |
> > +                                          PERF_PMU_CAP_AUX_PAUSE);
> >
> >         etm_pmu.attr_groups             = etm_pmu_attr_groups;
> >         etm_pmu.task_ctx_nr             = perf_sw_context;
> > --
> > 2.34.1
> >
> 
> If the possible issue above is prevented by perf internals
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK
