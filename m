Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3944C27D78A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325148; cv=none; b=O0oYXZoXzUWUPqRSw0mk+4bVsYi4sHj6vwr5irgFIOeRpGESGvCGb5cHVZZ66NXI8QWGM6wPiPefbKteo2xvc6Y4fHIZrNtQFRpzCEZ65NT4Tc2yghB28rp17nUcHbR0xL8ZNdxYBwy15PYz5VqdjzoGE4EgNt65CHELOS0owkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325148; c=relaxed/simple;
	bh=ezoVuyjRdCYau8pGkO7iCSZWW0prD2xC5WFm1SyfQlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsOPziWnus6HFcwxiwba3D/SWCo3RhLua/vZ46NHnLNOA65hUh04YUCDYy/YutIaLfGcoNkAwVfzds2YCcWN/BH22rY5vQM+FZwms7yqQU7fitM4EV/moGp4JcUlJDeIWLJAm0lc5U4b+5iUmAih+UQ/LMrmz7KcHeP41ClW218=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4Ev6cvr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4Ev6cvr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050B5C4CEE9;
	Tue, 22 Apr 2025 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745325147;
	bh=ezoVuyjRdCYau8pGkO7iCSZWW0prD2xC5WFm1SyfQlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4Ev6cvrvR6w5mKRckGr7R1Ozh2jaQUlZ03WoKN79kVRaX6wd62pccB/yXdf0eOTX
	 Wo0EUKxCWjl/Iv4wYvzZK+KbQ9Ye8vhKQZo5Ob+l3s7Cd9mCRmln+fZuswaPQKhoPi
	 dv5eFN77kMd3iSqAZm9gDjCujUuNBmJbPCvw6q7mpcNxPrK687yjb8eR5/VUfKPD+L
	 ZnmkC6FMzGOmRi/13Pyo08DfCoOwyWvvsFts2BbTaKRcwdhfKnZOTMwnLWbCV6T0HK
	 4HnoF6FNrFMxwKi2iQxfitxp01zIpiSuLyq7DfVD+l5z2qxquBDEtzeHnTy1kRwI7f
	 eonJJhjzfElFg==
Date: Tue, 22 Apr 2025 14:32:22 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
Message-ID: <aAeMVtdkrAoMrmVk@cassiopeiae>
References: <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com>
 <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>

On Tue, Apr 22, 2025 at 01:07:47PM +0100, Tvrtko Ursulin wrote:
> 
> On 22/04/2025 12:13, Danilo Krummrich wrote:
> > On Tue, Apr 22, 2025 at 11:39:11AM +0100, Tvrtko Ursulin wrote:
> > > Question I raised is if there are other drivers which manage to clean up
> > > everything correctly (like the mock scheduler does), but trigger that
> > > warning. Maybe there are not and maybe mock scheduler is the only false
> > > positive.
> > 
> > So far the scheduler simply does not give any guideline on how to address the
> > problem, hence every driver simply does something (or nothing, effectively
> > ignoring the problem). This is what we want to fix.
> > 
> > The mock scheduler keeps it's own list of pending jobs and on tear down stops
> > the scheduler's workqueues, traverses it's own list and eventually frees the
> > pending jobs without updating the scheduler's internal pending list.
> > 
> > So yes, it does avoid memory leaks, but it also leaves the schedulers internal
> > structures with an invalid state, i.e. the pending list of the scheduler has
> > pointers to already freed memory.
> > 
> > What if the drm_sched_fini() starts touching the pending list? Then you'd end up
> > with UAF bugs with this implementation. We cannot invalidate the schedulers
> > internal structures and yet call scheduler functions - e.g. drm_sched_fini() -
> > subsequently.
> > 
> > Hence, the current implementation of the mock scheduler is fundamentally flawed.
> > And so would be *every* driver that still has entries within the scheduler's
> > pending list.
> > 
> > This is not a false positive, it already caught a real bug -- in the mock
> > scheduler.
> 
> To avoid furher splitting hairs on whether real bugs need to be able to
> manifest or not, lets move past this with a conclusion that there are two
> potential things to do here:

This is not about splitting hairs, it is about understanding that abusing
knowledge about internals of a component to clean things up is *never* valid.

> First one is to either send separately or include in this series something
> like:
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index f999c8859cf7..7c4df0e890ac 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -300,6 +300,8 @@ void drm_mock_sched_fini(struct drm_mock_scheduler
> *sched)
>                 drm_mock_sched_job_complete(job);
>         spin_unlock_irqrestore(&sched->lock, flags);
> 
> +       drm_sched_fini(&sched->base);
> +
>         /*
>          * Free completed jobs and jobs not yet processed by the DRM
> scheduler
>          * free worker.
> @@ -311,8 +313,6 @@ void drm_mock_sched_fini(struct drm_mock_scheduler
> *sched)
> 
>         list_for_each_entry_safe(job, next, &list, link)
>                 mock_sched_free_job(&job->base);
> -
> -       drm_sched_fini(&sched->base);
>  }
> 
>  /**
> 
> That should satisfy the requirement to "clear" memory about to be freed and
> be 100% compliant with drm_sched_fini() kerneldoc (guideline b).
> 
> But the new warning from 3/5 here will still be there AFAICT and would you
> then agree it is a false positive?

No, I do not agree.

Even if a driver does what you describe it is not the correct thing to do and
having a warning call it out makes sense.

This way of cleaning things up entirely relies on knowing specific scheduler
internals, which if changed, may fall apart.

> Secondly, the series should modify all drivers (including the unit tests)
> which are known to trigger this false positive.

Again, there are no false positives. It is the scheduler that needs to call
free_job() and other potential cleanups. You can't just stop the scheduler,
leave it in an intermediate state and try to clean it up by hand relying on
knowledge about internals.

Consequently, when the pending list isn't empty when drm_sched_fini() is called,
it *always* is a bug.
