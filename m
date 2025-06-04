Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C018E377
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049643; cv=none; b=jJXZQW4eewios4SBh4JRtZfDErJc5pMlmh3KhT/rB5wpxN1OFIXPRiPBOxVhQ2r7biirgy7yr+I4PHYk4zLcEiYRkiGf6CYRb0y+uSGGHSPW/xdm02Xq2RmpJDRCXmRMiWiyjgOfL7krDbdFOm4ohtKH59EaSTskYd4sHMutWZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049643; c=relaxed/simple;
	bh=Czk9G49KWxRR1XfjZA7YVh4uTuH4n6Lg2WnKlui0GsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8baNfpjY0pH6DYnP9MlNgzp1Bdj51kb7GQTybrtssd2F7RjLLwjFr0yY2dQE/dyJUimYIPgA3the4rcBg2fP7oApXZC6CI7Dw18UJBaX97mJqH8wLV6oUYdGCt8EBGpEcb6F74Ly4Vg8d9Q1Ks9yyvWTb85LekqR3NrrRwN4+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=R6lVVQyQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="R6lVVQyQ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a35c894313so6201613f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1749049640; x=1749654440; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nLNe9PZGn0K8HUE/OJhh4z5UPfVBQh5eKwFNHa6KR70=;
        b=R6lVVQyQA/Gb2pf0YJGssVv+MYMF6DUQXtq3dJ38kX1ZwhJMXx57YtmYcwED9qO/Od
         mCzQWTo5j8GcR8ARYYztbuIEdL+yQFnhzWXWEPjiZWlKQKdg46/geJis+Jy77jDJZG1i
         lMGVvn7/NRByCz2UGrCxeJtea+Tgzr8z6szTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749049640; x=1749654440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLNe9PZGn0K8HUE/OJhh4z5UPfVBQh5eKwFNHa6KR70=;
        b=Qnp4orDJI9VmoKj5bHIFk+eKQwXgm4qqcVO25m8qcTAdSxaZjeAM6vAy+f6aixJkZ2
         IRsMVOFRqsd7++DqtUjH/+34pHvRiyju21OrWEUQqvcilekh+5SUujqOVTlpmH3to7Ca
         +QFWWs1TGAEEqg3JcakkuY796+uumZerx1oTX6zbORsPB8JnFS70ZdZSbm+y3kIjYNmn
         8D8ZsMUpwGSxneOBJdBanDw7Vee685fnZJklSi1xvxEuhJfWXsUeqiqlMtoEZDROJ+yY
         lnjVjLH5tAHPy9neUGdo1sMjXgXulMsfsaWSfsxuRBfup+2E+kdUzR41z/M3DvESLuCM
         5Qpw==
X-Forwarded-Encrypted: i=1; AJvYcCVbT9+yVSheeBDDHW5GXwfKO/tQo8UAc/cToqTP7TpqWpbnSnVkji0J1AaqQ6FG4c6tbUnS8nXjf+RCp8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUgf04gVmcEM1N6kWxmUeiVSPnpk0p22W6kygxho4F4rTOGf0
	ojW4JANmJlN0HQDkO/cl4ETtJPpGfe4LWK5002aKQQGlWacGsbzs0+pA6U2h7pwcdUc=
X-Gm-Gg: ASbGncssSQK5UMuFc8vRsRbcTnPDmH+TZ/KtyuQAhXqJE8UscfUKQ+6h5I8AXkV0L6R
	3K1d5n5eqJ5ddXP337YPIuNL6K6pweMhrCcBZapQ65tSqnaMAM6VHC4u0zaaDkFMw2E2RhU9682
	oeq4xyQFykbEigKZWADax0RkkBAsdJgqpjs46miAnh0Q37AR9KR4X3+tottNr1nZ3oACYiBFTFj
	A1EhvhasEsyBWfEUxBEOsqcmZK40wnzMU4MWsyLn9JPcZk4v/4ljuOWz7zDTkRiaI+nqi+vuTyr
	KGKmtNlMdB2udYKUxD76MW5xResNpmwqLF46Rtomcy4OemDOoZPix31SU8eYgKQ=
X-Google-Smtp-Source: AGHT+IH2Zjdx0sOvzJfPV5Mri2bdBbG1xpMSCNMUBcoLGEUL4Yhh8rTWxisXo6OxmWgNv3hsjQLN2w==
X-Received: by 2002:a05:6000:420f:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3a51d904540mr2742307f8f.21.1749049639709;
        Wed, 04 Jun 2025 08:07:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8006952sm198017885e9.32.2025.06.04.08.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:07:18 -0700 (PDT)
Date: Wed, 4 Jun 2025 17:07:15 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched: Discourage usage of separate workqueues
Message-ID: <aEBhIzccXBPyt_58@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250604081657.124453-2-phasta@kernel.org>
 <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
X-Operating-System: Linux phenom 6.12.25-amd64 

On Wed, Jun 04, 2025 at 11:41:25AM +0200, Christian König wrote:
> On 6/4/25 10:16, Philipp Stanner wrote:
> > struct drm_sched_init_args provides the possibility of letting the
> > scheduler use user-controlled workqueues, instead of the scheduler
> > creating its own workqueues. It's currently not documented who would
> > want to use that.
> > 
> > Not sharing the submit_wq between driver and scheduler has the advantage
> > of no negative intereference between them being able to occur (e.g.,
> > MMU notifier callbacks waiting for fences to get signaled). A separate
> > timeout_wq should rarely be necessary, since using the system_wq could,
> > in the worst case, delay a timeout.
> > 
> > Discourage the usage of own workqueues in the documentation.
> > 
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> >  include/drm/gpu_scheduler.h | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 81dcbfc8c223..11740d745223 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -590,14 +590,17 @@ struct drm_gpu_scheduler {
> >   *
> >   * @ops: backend operations provided by the driver
> >   * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> > - *	       allocated and used.
> > + *	       allocated and used. It is recommended to pass NULL unless there
> > + *	       is a good reason not to.
> 
> Yeah, that's probably a good idea. I'm not sure why xe and nouveau actually wanted that.

The idea of this trick is that you have a fw scheduler which only has one
queue, and a bunch of other things in your driver that also need to be
stuffed into this fw queue (or handled by talking with the fw through
these ringbuffers).

If you use one single-threaded wq for everything then you don't need
additional locking anymore, and a lot of things become easier.

We should definitely document this trick better though, I didn't find any
place where that was documented.

Maybe a new overview section about "how to concurrency with drm/sched"?
That's also a good place to better highlight the existing documentation
for the 2nd part here.

> >   * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
> >   *	     as there's usually one run-queue per priority, but may be less.
> >   * @credit_limit: the number of credits this scheduler can hold from all jobs
> >   * @hang_limit: number of times to allow a job to hang before dropping it.
> >   *		This mechanism is DEPRECATED. Set it to 0.
> >   * @timeout: timeout value in jiffies for submitted jobs.
> > - * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
> > + * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> > + *		used. It is recommended to pass NULL unless there is a good
> > + *		reason not to.
> 
> Well, that's a rather bad idea.
> 
> Using a the same single threaded work queue for the timeout of multiple
> schedulers instances has the major advantage of being able to handle
> their occurrence sequentially.
> 
> In other words multiple schedulers post their timeout work items on the
> same queue, the first one to run resets the specific HW block in
> question and cancels all timeouts and work items from other schedulers
> which use the same HW block.
> 
> It was Sima, I and a few other people who came up with this approach
> because both amdgpu and IIRC panthor implemented that in their own
> specific way, and as usual got it wrong.
> 
> If I'm not completely mistaken this approach is now used by amdgpu,
> panthor, xe and imagination and has proven to be rather flexible and
> reliable. It just looks like we never documented that you should do it
> this way.

It is documented, just not here. See the note in
drm_sched_backend_ops.timedout_job at the very bottom.

We should definitely have a lot more cross-links between the various
pieces of this puzzle though, that's for sure :-)

Cheers, Sima

> 
> Regards,
> Christian.
> 
> >   * @score: score atomic shared with other schedulers. May be NULL.
> >   * @name: name (typically the driver's name). Used for debugging
> >   * @dev: associated device. Used for debugging
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
