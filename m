Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7075D1F9F7A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583536; cv=none; b=A8EcnrGpk4s6FxAGsANt5+/mcQCDPE6S0DI8WzZDngcuNHOlemx36nJxws4oWPXxZE0Bb1AdOaeLC+/tbrDf+8JykGpwsSPXp9udDsfq6vyLZ3bcIsHy7GvBn8a2seEiZbVGml5MohXUmmnCx0iDyhFgjSOY6HXwCE7/utmNi4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583536; c=relaxed/simple;
	bh=NFm7tbq0ZaH2RVNvsamjo+KHzIpxQSPgvdSp6JQoL5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CB9BcfFH+qFmWE6gHunsb4xiwEiedhqTrBKkSr8UO6/a1NB86DBFUtY08a4PF21wD6scb6lb0KkuMEDwW2LXnonk3mfna45cX0t+Ef467hyVNO6xkbeDLMNiZxRd+jGL0bmtsGPHWuz0pD2R5WH1FJ1heCuzfg4du343UpXbSKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FgcMcc9e; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FgcMcc9e"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2279915e06eso131819475ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743583534; x=1744188334; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zJsLeD6lgFKMBvtHYkyhM89bgWS3aRtj9tm/3qhx9hI=;
        b=FgcMcc9eHBtYVM6u1uo6hR3HmwykYCpZkmgDTLS7aU/rETiaCNG1fwnu8xBMyQCyT7
         Piq2glE3m6jAcFRtEeBrRRh3dhse6EjnsXcY2LjFvAH3qDmppbJLACr2ncTA5ic8gAoh
         btR9LsRC6+F6wXqC6toURqk2TNMpA9CbLq2l4MyOHjrni2pJLFli+jK5wRAaRMACaoUw
         dt4fgrDJ2rmxy6WyqMlDwBbDvdJv+HpGcb0jyMQy06KhvMZkZwDABHcbyKAtKpHtdn3C
         zVo+DA+tChSFmPy+YWWgW1v+AzPCMPp/HPC3HqiwZ3U8EgR4xmmlpR+KYbJqZ5TRxgOx
         ywnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583534; x=1744188334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJsLeD6lgFKMBvtHYkyhM89bgWS3aRtj9tm/3qhx9hI=;
        b=HfTE+fpYxoZuQv0U6P8zxlLqDaRHUX81JVkiG/kJLOtqODTgt8TuEJpUnOzETjYzoF
         tzZW6ZjDhQRlUBq6TFOMd90ZWPY1piU9rbhbk8hs7hx/jdm2HqMRNowUgw1DmlPZwqSm
         nwRG34Bvi0GQHzOagPV7uhUEF3UBhYSfoHtFKRXbdzS+u/d5kNXeZo+gnC4kjXnA1jYd
         ES4XMa2flMPWgZ9j3Jfe7hCtfM5c0gr+gbXhd8b0bIgiK6SnvpsuNZM4LBgMrk15EMOe
         OtsrluTahm3PbhwHFxYnJMdNPoaj0t+vaeXH6l5uZf7h4nazu8/Q6G7Ikt4ZGtV7s06R
         t8Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVdgay3Mrrflz5omY8Q13+XU479uJspBWzox4vaDWQ9j49p1WIjYgIDJzP10koXro2vXPnT0y6lwcoQhS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDrtMAzTv7DP1w/my/+F67TNPtsslZLuQMlAEbB0HlgfgD2Mr
	B930bDTbghjEy2rxfSg7v7K1FBlq71yPw4E/0PVup6i97cgusGQm302B8jO4DiXDErkZDcUmQiq
	GE0HBMPDDZmoAyywlQjzAZ4ve0vUto+rfBHLBOw==
X-Gm-Gg: ASbGnctDk1Eh+Rj0X/Ps8RMRUQlfNB5OgZTcqvLEJMSVKTJ/w+iiCe45SY+2cqJXN93
	qLzwlph1AJb0J747KSpvcfHlkM1YlbcrEJ14pfvINIgLgezkefkN68ddfJXd4ufg4VO9DN2284C
	d31UIryBpI/nLTA4aFLL2oXD5F3iQ=
X-Google-Smtp-Source: AGHT+IHI6Yu/hcdMXCreLSpHVh+HBTcQtrbpLe5Yl5Ua0D4HJd6y3JEpPE+J4Y6K6IQOUqDHmajJ8A4Nn/gDke9iJXk=
X-Received: by 2002:a05:6a00:3288:b0:736:57cb:f2b6 with SMTP id
 d2e1a72fcca58-739803aa740mr26454210b3a.12.1743583533738; Wed, 02 Apr 2025
 01:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-5-leo.yan@arm.com>
 <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com> <20250401150019.GC115840@e132581.arm.com>
In-Reply-To: <20250401150019.GC115840@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 09:45:20 +0100
X-Gm-Features: AQ5f1JpVKguSRw3Soam_GH8e7qCPQbsLVx7D2P5cFerAhYuRpuHvAGuo7V2FHvg
Message-ID: <CAJ9a7ViKeqNp_c0+w2mkdujLvzs0UA=Xbm5bG7K-kA86AjJ=eA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] coresight: perf: Support AUX trace pause and resume
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Leo

On Tue, 1 Apr 2025 at 16:00, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Tue, Apr 01, 2025 at 01:50:52PM +0100, Mike Leach wrote:
>
> [...]
>
> > >  static void etm_event_start(struct perf_event *event, int flags)
> > >  {
> > >         int cpu = smp_processor_id();
> > > @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
> > >         if (!csdev)
> > >                 goto fail;
> > >
> >
> > Is it possible here that the first call to etm_event_start() also has
> > the PERF_EF_RESUME flag set?
>
> The first call has a flow below, using flag 0 but not PERF_EF_RESUME.
>
>   etm_event_add()
>     `>  etm_event_start(event, 0);
>

When I looked at the vague comments in the perf source - it seemed to
imply that ->start() calls could overlap - so the associated event
that resumes trace could occur at the same time as the initialising
start from paused for the trace operations.

If we are guaranteed this cannot happen then we are good to go!

> Note: for the first call, the tracer should be disabled if
> 'event->hw.aux_paused' is 1.  This is ensured by patch 03.
>

Yes - I saw that.

Mike

> Thanks,
> Leo
>
> > If so it looks like we need to fall through and do a "normal" start to
> > get all the ctxt->event_data set up.
> >
> > > +       if (flags & PERF_EF_RESUME) {
> > > +               if (etm_event_resume(csdev, ctxt) < 0) {
> > > +                       dev_err(&csdev->dev, "Failed to resume ETM event.\n");
> > > +                       goto fail;
> > > +               }
> > > +               return;
> > > +       }
> > > +
> > >         /* Have we messed up our tracking ? */
> > >         if (WARN_ON(ctxt->event_data))
> > >                 goto fail;
> > > @@ -545,6 +574,16 @@ static void etm_event_start(struct perf_event *event, int flags)
> > >         return;
> > >  }
> > >
> > > +static void etm_event_pause(struct coresight_device *csdev,
> > > +                           struct etm_ctxt *ctxt)
> > > +{
> > > +       if (!ctxt->event_data)
> > > +               return;
> > > +
> > > +       /* Stop tracer */
> > > +       coresight_pause_source(csdev);
> > > +}
> > > +
> > >  static void etm_event_stop(struct perf_event *event, int mode)
> > >  {
> > >         int cpu = smp_processor_id();
> > > @@ -555,6 +594,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
> > >         struct etm_event_data *event_data;
> > >         struct coresight_path *path;
> > >
> > > +       if (mode & PERF_EF_PAUSE)
> > > +               return etm_event_pause(csdev, ctxt);
> > > +
> > >         /*
> > >          * If we still have access to the event_data via handle,
> > >          * confirm that we haven't messed up the tracking.
> > > @@ -899,7 +941,8 @@ int __init etm_perf_init(void)
> > >         int ret;
> > >
> > >         etm_pmu.capabilities            = (PERF_PMU_CAP_EXCLUSIVE |
> > > -                                          PERF_PMU_CAP_ITRACE);
> > > +                                          PERF_PMU_CAP_ITRACE |
> > > +                                          PERF_PMU_CAP_AUX_PAUSE);
> > >
> > >         etm_pmu.attr_groups             = etm_pmu_attr_groups;
> > >         etm_pmu.task_ctx_nr             = perf_sw_context;
> > > --
> > > 2.34.1
> > >
> >
> > If the possible issue above is prevented by perf internals
> >
> > Reviewed-by: Mike Leach <mike.leach@linaro.org>
> >
> >
> > --
> > Mike Leach
> > Principal Engineer, ARM Ltd.
> > Manchester Design Centre. UK



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
