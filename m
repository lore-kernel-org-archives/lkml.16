Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17CE201113
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843055; cv=none; b=WaMspkAWdUy1Y7EvtIT/BE1zOUzVTSWiV/P2IZD1H4YB7CfPfIdYbRzLJfvATNSHOsjyXoy3mEETheEnm4dKOBnF7FZ2iphOPswc6o1KVwKSkBJGCVsS9jFVyBdwAIMd96s1LtwqPp9OQtJrtsc60V+xbKEMJnZeKGZy92D8Eh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843055; c=relaxed/simple;
	bh=WqRsuCDnUVhmDtSvUR6iirR6z5lLYozWt1SFYrUy48Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhjAUNEXFt8NHEcbC/23EdrhppCaiKlRIC5dt7Fanp00yfZJwKZyq3nz/A/+iSj5XzQiDnMZfAXLJZKuPjKfqOmwGpRCI1XBJuHr53NXcl7BMb/NhwWBsWPDK+2EuKtMq7btziT6+UPnqsb9EJbQETiCA4GrVDJLHnZKvYjV8IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 769EC1516;
	Mon, 28 Apr 2025 05:24:06 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85DFA3F66E;
	Mon, 28 Apr 2025 05:24:12 -0700 (PDT)
Date: Mon, 28 Apr 2025 13:24:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yabin Cui <yabinc@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power
 state
Message-ID: <20250428122408.GD551819@e132581.arm.com>
References: <20250423230046.1134389-1-yabinc@google.com>
 <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
 <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
 <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com>

Hi all,

On Mon, Apr 28, 2025 at 11:53:26AM +0100, Mike Leach wrote:

[...]

> > > > @@ -362,6 +362,10 @@ enum cs_mode {
> > > >   * @alloc_buffer:    initialises perf's ring buffer for trace collection.
> > > >   * @free_buffer:     release memory allocated in @get_config.
> > > >   * @update_buffer:   update buffer pointers after a trace session.
> > > > + * @percpu_save:     saves state when CPU enters idle state.
> > > > + *                   Only set for percpu sink.
> > > > + * @percpu_restore:  restores state when CPU exits idle state.
> > > > + *                   only set for percpu sink.
> > > >   */
> > > >  struct coresight_ops_sink {
> > > >       int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> > > > @@ -374,6 +378,8 @@ struct coresight_ops_sink {
> > > >       unsigned long (*update_buffer)(struct coresight_device *csdev,
> > > >                             struct perf_output_handle *handle,
> > > >                             void *sink_config);
> > > > +     void (*percpu_save)(struct coresight_device *csdev);
> > > > +     void (*percpu_restore)(struct coresight_device *csdev);
> > >
> > > Again - why this percpu_* prefix ?
> > >
> > > >  };
> > > >
> > > >  /**
> 
> I do not think this is the best approach.
> 
> The TRBE driver has its own power management registration functions,
> so is it not possible for the save and restore should be handled
> there, through a PM notifier, just as the ETM/ETE is?
> 
> Drop the unnecessary DT entry - TRBE is a per cpu architectural device
> - if a TRBE is present, we know it will power down with the PE.
> 
> The CoreSight architecture permits an ETE to drive trace to an
> external sink - so the TRBE might be present but unused, therefore
> hooking into a source driver that may not be driving trace into the
> device does not seem wise..

Sorry I jumped in a bit late (I saw the patch at last week and it is
on my review list).

I would suggest to hold on for this patch.  I am refactoring CPU PM and
hotplug in CoreSight based on the CoreSight path.

The idea is when we do CPU power management for CoreSight devices, we
cannot simply control individual devices.  Alternatively, we need to
control logics based on the linkages on CoreSight path as it can reflect
dependencies crossing the components.  For example, for a CoreSight
path, when running into CPU low power state, we need firstly disable
tracer, then links, and at the end sinks.  When CPU resumes back, we
need to use the reversed ordering for turning on devices.

As a result, except the tracers (ETM / ETE) should be saved and
restored contexts during CPU power states, other components on the
path will be controlled by traversing CoreSight paths.  The benefit is
if a component (e.g., a link or a sink module) is shared by multiple
CoreSight paths, then the component can be disabled or enabled based on
reference counter.

I know I am a bit lagged - as I also need to support the locking on
CoreSight paths.  Please expect in next 1~2 weeks I will send out
patches for public review.

> The TRBE PM can follow the model of the ETE / ETMv4 and save and
> restore if currently in use.

If TRBE PM is registered as a seperate PM notifier, a prominent issue is
it cannot promise the depedency between ETE and TRBE when execute CPU
power management.  E.g., when entering CPU idle states, ETE should be
disabled prior to switch off TRBE, otherwise, it might cause lockup
issue in hardware.  If ETE and TRBE register PM notifier separately,
we cannot ensure the sequence between ETE and TRBE, this is why we need
to do the operations based on CoreSight paths.

Thanks,
Leo
