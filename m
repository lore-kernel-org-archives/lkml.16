Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17777DA6A;
	Wed,  2 Apr 2025 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609529; cv=none; b=NV6TMXXwLFNfA8F5sYWLyUrV5KAMiU0SHEPw5G/BsRTNf4yhX5ZypT6506S7WkZoTZ79+F9lwCxf1DhtfZHqgAupxZ7j0Z4Nwt5FVOt/swKHxwk7kAjiSuxqspUxB+0UZW0KEYbT0QHtR8bzw63ky0xsigTR8CasUecBbjNCPO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609529; c=relaxed/simple;
	bh=SgmZKwGDUNVrWRo7bbqVZy/+CQgxdIV5IbzJ0FUWPws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaDnYGHYDh8o+T7wdaS94wrWufm3SI/a16TnNFZIQ1zc+XWCbtr/sFJyBaJE0/tUAV5R343+gpvNjD6JC7qKKV3kL5JaFqDGsmNAJBV3rF2x1yaMtaViY9F4RmBPjEscChUqHM4opM+HGFnhbYBvlCwuGV6LAMv2FJ0dlXuG+XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBB4E106F;
	Wed,  2 Apr 2025 08:58:49 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8759D3F63F;
	Wed,  2 Apr 2025 08:58:46 -0700 (PDT)
Date: Wed, 2 Apr 2025 16:58:41 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] coresight: tmc: Re-enable sink after buffer update
Message-ID: <20250402155841.GO115840@e132581.arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
 <20250401180708.385396-6-leo.yan@arm.com>
 <CAJ9a7VgTyKfebbYhEG5cGH4HyzU+4FavDXsAxGncXLsDtHSUHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VgTyKfebbYhEG5cGH4HyzU+4FavDXsAxGncXLsDtHSUHA@mail.gmail.com>

Hi Mike,

On Wed, Apr 02, 2025 at 04:05:10PM +0100, Mike Leach wrote:

[...]

> > @@ -482,6 +482,7 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
> >         unsigned long offset, to_read = 0, flags;
> >         struct cs_buffers *buf = sink_config;
> >         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > +       struct perf_event *event = handle->event;
> >
> >         if (!buf)
> >                 return 0;
> > @@ -586,6 +587,14 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
> >          * is expected by the perf ring buffer.
> >          */
> >         CS_LOCK(drvdata->base);
> > +
> > +       /*
> > +        * If the event is active, it is triggered during an AUX pause.
> > +        * Re-enable the sink so that it is ready when AUX resume is invoked.
> > +        */
> > +       if (!event->hw.state)
> > +               __tmc_etb_enable_hw(drvdata);
> > +
> 
> Think that the  refcnt should be checked here too.

No, ETF driver uses spinlock to guard the entire region for checking
refcnt and updating buffer, here it is still in the same critical
region.  This is why the checking refcnt is not needed.

> Does the  ETB case need to be handled? - somewhat confusingly the
> coresight-tmc-etf.c file handles both ETF and ETB.

ETF is for the link mode, and ETB is for sink.  Updating buffer is only
for sink mode, this is why here I use __tmc_etb_enable_hw().  Does it
make sense?

I also have a question for the paired operations (this is applied for
both ETF and ETR drivers).

Now the flow is:

  tmc_update_etf_buffer()  {

    tmc_flush_and_stop();

    update buffer;

    __tmc_etb_enable_hw();
  }

The operations are not paired between tmc_flush_and_stop() and
__tmc_etb_enable_hw().

The tmc_flush_and_stop() function only controls the TMC_FFCR register.
I'm not sure whether I need to extract the TMC_FFCR operations from
__tmc_etb_enable_hw() to use them for recovery in the update buffer.
Or do you think re-enabling the hardware in this patch is the safer
approach?

Thanks,
Leo
