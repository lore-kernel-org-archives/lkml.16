Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0882E7191
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168299; cv=none; b=XkviZE1IXWkuitH/J7a/vbs1e5M6+WiCgIjI8Oy7wa0ADRGt+xc3Ze/N1WbYF6kPm1cKuFeEPRW3wA4W9R9BQbZw6eBfUt/Be74D7v8vQNmwo5LWMb8tjzv2QLOZNjwIkrsdImwEkh664OvnlKHC5/DjnFMBLiLfj5rBsg16QW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168299; c=relaxed/simple;
	bh=7rKV/WXwa23e0RUgVXUTyam5owaMQuGe0Fg2RUFaTpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kfjxrr2W14Sj3t82zJlKZfFvIiZBvfgmuRrW4oo7npnvM4P5yVaonu2i6kTh+79tT2XxzoSS1Fo2AAeQpEjoJFZb327nm+FFQyb4yqpT8HVIk9EHetLgaZq6MM3vF8EvfUaGSXdJEJ/8HxT46iqcF7yUj6HTP1cfPqpdnIA8PdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=kih8OAyn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="kih8OAyn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a52874d593so5564271f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1750168296; x=1750773096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLXhTtOfStKj2eC1LsdyW0wCGCB6laJXoX9t5eau+jI=;
        b=kih8OAynwMXzIajDahlSK9RV1YLkQ2dAe2sdFJP0QbrYLh8vUq64WP9JQcySThbK2Y
         ZXSYXpih3Bav2qKm8e9Tbvj482qoEvUE3csG3IfLNMnaVrmyQGofM1PL1ZpNmh9GGu+a
         VvNhcOgkC4+9tx39RK7B2wYdS0z1t73srSuac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168296; x=1750773096;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLXhTtOfStKj2eC1LsdyW0wCGCB6laJXoX9t5eau+jI=;
        b=AdQuJCX8rS1NcmdM1ZCbgx5TtN8yvyE0RKQ2EbAu8hBuXzMTjeLwKedhid6X+5i69Q
         0b+hCd6f8/emaTQyl9npQtO8ZHPGzFOaY24ux6CuKjI++e6UHb4eIOdXHoumZOTuejuD
         nqRZZtWve3uxy5ViQIipJ0eQFv6IsRH4HoIRQH9LUbL//tehMcR0AAfCJk7CmbCBd3wo
         bQymqHz8jvNHDc8XQP71obkzWUvwd5eyzNHwzogZIRCfrdBbPK1QkWMlOHHx02QwKpqX
         5kyt8JZIxCQ+9RIxhOi5cwqEUIhSogcmHFX5o1fWEPp2etlH6mHLKGagkQLgyb0dNkUB
         i19Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcQQH563B62jbc76GWrlfuBzrTcbUp8SdnpaPJE0vGiPqnd0j061st4fkeIiNmdIyIQfZtejDdnEL99yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNfrd8UPu1vpA5bWjIhBsRS4nV5jpS2UUOkN3kwTQLOFVXa8I8
	ylOsxxYrJyLEb/9KJeGedNy998RMKC9bpD0W/UZe983vQxc40WH1wZl9lZhGZdOTMtI=
X-Gm-Gg: ASbGncskMSWF2lYUnRIksnATZyCrgTz505CdpW5P9YXII2gG636pRRVlNl0DLlx5DPm
	vP7EuXZ6eXXPPi5miCzgYan+1D6+JAmbaSO+PYboM1SEf/eSoC9qIzr15N8WpV5wyhBz83BYvcc
	eBa8LfU9dco/BDgzCkBfmPkVIjtOUE3uNn7nukkPFcn472fmViNDdsvD2E5bIs7NEzP6mTTmBOn
	E6bwWxjI/We2jB/437Up1y0BSmqtKuafK69voRZUAz39lEFTLh64lsGWDdmFQ0JixMBkzP+HoW5
	6SHld/ugrtBithICoElwXt/8DkElJU61QIbVnQJItGW3wugCTPTvNhknN1UNd/+9Z6CVAQWtyKA
	8AOOpisTM
X-Google-Smtp-Source: AGHT+IEDx6P5Ycl1fIaLGR9RgPbJefLoQic5m5rNUrSSRipnf+hsWSeOMCWcv3wmed2lXFj2gNwIRg==
X-Received: by 2002:a05:6000:2382:b0:3a5:2ef8:34f0 with SMTP id ffacd0b85a97d-3a57237dba4mr10699489f8f.22.1750168295960;
        Tue, 17 Jun 2025 06:51:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54e71sm13873326f8f.1.2025.06.17.06.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:51:35 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:51:33 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Message-ID: <aFFy5aG1eOeMU44S@phenom.ffwll.local>
Mail-Followup-To: Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
References: <20250612144953.111829-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612144953.111829-2-phasta@kernel.org>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> struct drm_sched_init_args provides the possibility of letting the
> scheduler use user-controlled workqueues, instead of the scheduler
> creating its own workqueues. It's currently not documented who would
> want to use that.
> 
> Not sharing the submit_wq between driver and scheduler has the advantage
> of no negative intereference between them being able to occur (e.g.,
> MMU notifier callbacks waiting for fences to get signaled).
> 
> Add a new docu section for concurrency in drm/sched.
> 
> Discourage the usage of own workqueues in the documentation. Document
> when using them can make sense. Warn about pitfalls.
> 
> Co-authored-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Add new docu section for concurrency in the scheduler. (Sima)
>   - Document what an ordered workqueue passed to the scheduler can be
>     useful for. (Christian, Sima)
>   - Warn more detailed about potential deadlocks. (Danilo)
> ---
>  include/drm/gpu_scheduler.h | 54 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 81dcbfc8c223..00c528e62485 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -21,6 +21,49 @@
>   *
>   */
>  
> +/**
> + * DOC: Concurrency in drm/sched

You need to explicitly pull this into the .rst files somewhere suitable,
otherwise it wont show up in the docs. With that please also check that
the hyperlinks all work.

> + *
> + * The DRM GPU Scheduler interacts with drivers through the callbacks defined in
> + * &struct drm_sched_backend_ops. These callbacks can be invoked by the scheduler
> + * at any point in time if not stated otherwise explicitly in the callback
> + * documentation.
> + *
> + * For most use cases, passing the recommended default parameters in &struct
> + * drm_sched_init_args is sufficient. There are some special circumstances,
> + * though:
> + *
> + * For timeout handling, it makes a lot of sense for drivers with HARDWARE
> + * scheduling to have the timeouts (e.g., for different hardware rings) occur
> + * sequentially, for example to allow for detecting which job timedout first
> + * and, therefore, caused the hang. Thereby, it is determined which &struct
> + * drm_sched_entity has to be killed and which entities' jobs must be
> + * resubmitted after a GPU reset.
> + *
> + * This can be achieved by passing an ordered workqueue in &struct
> + * drm_sched_init_args.timeout_wq. Also take a look at the documentation of
> + * &struct drm_sched_backend_ops.timedout_job.

So the main use-case for this is when the reset domain is bigger than a
single engine, and you don't want to deal with the mess of inventing your
own synchronization primitives.

I'm not exactly clear what hardware scheduling scenario you're thinking of
here that needs an ordered timeout queue that's shared across instances.

Note that an ordered timeout queue for a single scheduler is fairly
pointless, because we only ever have one pending timeout handler (at least
I thought that's how it works).

> + * Furthermore, for drivers with hardware that supports FIRMWARE scheduling,

I'm not sure you need a firmware scheduler to make this useful, just that
firmware scheduler submit rings tend to be one case where this is a good
locking design. I'd put this at the end as a concrete example instead and
explain why (you already have a single submit ringbuffer, parallelism in
the kernel doesn't serve a point aside from making locking more complex).

> + * the driver design can be simplified a bit by providing one ordered workqueue
> + * for both &struct drm_sched_init_args.timeout_wq and
> + * &struct drm_sched_init_args.submit_wq. Reason being that firmware schedulers
> + * should always have one scheduler instance per firmware runqueue and one
> + * entity per scheduler instance. If that scheduler instance then shares one
> + * ordered workqueue with the driver, locking can be very lightweight or
> + * dropped alltogether.
> + *
> + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> + * least one of them does not execute operations that may block on dma_fences
> + * that potentially make progress through this scheduler instance. Otherwise,
> + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> + * can only make progress through this schduler instance), while the
> + * scheduler's queued work waits for at least one of the max_active tasks to
> + * finish. Thus, this can result in a deadlock.

Uh if you have an ordered wq you deadlock with just one misuse. I'd just
explain that the wq must provide sufficient forward-progress guarantees
for the scheduler, specifically that it's on the dma_fence signalling
critical path and leave the concrete examples for people to figure out
when the design a specific locking scheme.

> + */
> +
>  #ifndef _DRM_GPU_SCHEDULER_H_
>  #define _DRM_GPU_SCHEDULER_H_
>  
> @@ -499,7 +542,7 @@ struct drm_sched_backend_ops {
>  	 * timeout handlers of different schedulers. One way to achieve this
>  	 * synchronization is to create an ordered workqueue (using
>  	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
> -	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
> +	 * in &struct drm_sched_init_args.timeout_wq. This will guarantee
>  	 * that timeout handlers are executed sequentially.
>  	 *
>  	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
> @@ -590,14 +633,19 @@ struct drm_gpu_scheduler {
>   *
>   * @ops: backend operations provided by the driver
>   * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> - *	       allocated and used.
> + *	       allocated and used. It is recommended to pass NULL unless there
> + *	       is a good reason not to. For details, see &DOC: Concurrency in
> + *	       drm/sched.

Does this really link?

>   * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
>   *	     as there's usually one run-queue per priority, but may be less.
>   * @credit_limit: the number of credits this scheduler can hold from all jobs
>   * @hang_limit: number of times to allow a job to hang before dropping it.
>   *		This mechanism is DEPRECATED. Set it to 0.
>   * @timeout: timeout value in jiffies for submitted jobs.
> - * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
> + * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> + *		used. An ordered workqueue could be passed to achieve timeout
> + *		synchronization. See &DOC: Concurreny in drm/sched and &struct

Same question about linking ...

Might just put a note in the text section below about concurrency design
questions instead of trying to squeeze these in here.

Cheers, Sima

> + *		drm_sched_backend_ops.timedout_job.
>   * @score: score atomic shared with other schedulers. May be NULL.
>   * @name: name (typically the driver's name). Used for debugging
>   * @dev: associated device. Used for debugging
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
