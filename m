Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896DD20487D;
	Tue,  1 Apr 2025 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520141; cv=none; b=b4OU4w53XTuQgD+grad2Yx0rSEv75ZXz0G5MVClet0e6b15NnOhOqWlOefh3KAOjsaiCMRK/T8Ld57d8qkIhbiZpqozumkFuG7H1veVDvQ1wPigAMaJOXqcCZSRv0UAik3DeoQPhRoiCp4pEow0wNKLQ7oVJOo72oNGn3X/2nQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520141; c=relaxed/simple;
	bh=AOJislbVXgKdhCxTaKtemM1ByV8ewGd50Dci9oXZHjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgRK5ujj358oEi3EJD1ZackU6VedV561ira0RrBhpf7CRzoqVlBek72nVsr+eqEqPj3je3dE4xeDy+AW20UCXb7Y3wHXrUmUvc9UREltqlkLoQnUeYJ89mLAak6jQsltA4aWeQtse+k9tmGj/XSMKGBvuihRHTdTnUxDtVWaj4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 055FE2B;
	Tue,  1 Apr 2025 08:09:03 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E06A3F694;
	Tue,  1 Apr 2025 08:08:59 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:08:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] coresight: perf: Update buffer on AUX pause
Message-ID: <20250401150857.GD115840@e132581.arm.com>
References: <20250311170451.611389-1-leo.yan@arm.com>
 <20250311170451.611389-6-leo.yan@arm.com>
 <8d9ad64b-a5f7-4a44-a557-7edb83322fdf@arm.com>
 <CAJ9a7ViUOZEyvqe-KGc-UdhmkqXpPdSeBWjk-=u1tAjFKu5Y+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7ViUOZEyvqe-KGc-UdhmkqXpPdSeBWjk-=u1tAjFKu5Y+A@mail.gmail.com>

On Tue, Apr 01, 2025 at 03:35:44PM +0100, Mike Leach wrote:

[...]

> > > -static void etm_event_pause(struct coresight_device *csdev,
> > > +static void etm_event_pause(struct perf_event *event,
> > > +                         struct coresight_device *csdev,
> > >                           struct etm_ctxt *ctxt)
> > >   {
> > > +     int cpu = smp_processor_id();
> > > +     struct coresight_device *sink;
> > > +     struct perf_output_handle *handle = &ctxt->handle;
> > > +     struct coresight_path *path;
> > > +     unsigned long size;
> > > +
> > >       if (!ctxt->event_data)
> > >               return;
> > >
> > >       /* Stop tracer */
> > >       coresight_pause_source(csdev);
> > > +
> > > +     path = etm_event_cpu_path(ctxt->event_data, cpu);
> > > +     sink = coresight_get_sink(path);
> > > +     if (WARN_ON_ONCE(!sink))
> > > +             return;
> > > +
> > > +     /*
> > > +      * The per CPU sink has own interrupt handling, it might have
> > > +      * race condition with updating buffer on AUX trace pause if
> > > +      * it is invoked from NMI.  To avoid the race condition,
> > > +      * disallows updating buffer for the per CPU sink case.
> > > +      */
> > > +     if (coresight_is_percpu_sink(sink))
> > > +             return;
> > > +
> > > +     if (WARN_ON_ONCE(handle->event != event))
> > > +             return;
> > > +
> > > +     if (!sink_ops(sink)->update_buffer)
> > > +             return;
> > > +
> > > +     size = sink_ops(sink)->update_buffer(sink, handle,
> > > +                                          ctxt->event_data->snk_config);
> >
> > I believe we keep the sink disabled/stopped in update_buffer. We need to
> > turn it back ON after the "buffer update". May be we could use a flag
> > to update_buffer() to indicate this is "pause" triggered update.

Thanks for pointing out, Suzuki.

I will fix it in next spin.

> The sink is stopped to read data, but also important is the
> enable/disable refcount. The only time that "update_buffer" will read
> is if the sink has a refcount == 1. These are ultimately controlled by
> enable/disable path - which will not occur during pause/resume
> operations.

Hi Mike,

My understanding is: if a sink is shared by multiple CPUs, e.g. a Perf
session with CPU mode or system wide mode, then we cannot arbitrarily
disable sink and update buffer, otherwise, it might cause hardware
lockup issue.

For per-thread mode, the refcount == 1, we can take chance to update
buffer, right?

Thanks,
Leo
