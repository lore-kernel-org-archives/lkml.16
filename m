Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B7C12E7E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922787; cv=none; b=WO18EODTrH+2L3FUmM4uZ5lz9krRwGo9S0sxKEbysQ5a2SJmKvrm6nBY3OthFJq5wY87ihyqnv1RojNWWTvce2v4hXMtm41YwaN16ouagdQgjqJ0ZECIhxcXkgXYbDxxpqtS9llC4mXu4NnikZGMsbiXmeTzcT7SvEC2jnVw1qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922787; c=relaxed/simple;
	bh=xfBF38J9bt5VGneQgc7FSBpY7hg7BcB+R4X03vn0Zos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npMBjMtZKUvkb7fBShU19NyyXpMo1Bo4615at0f9EVW6pA7A/bl5ngU/I4TvwBBYxO1jYIztiNgNPZRJQ0OwciaE2FAKrsUjXgkoSlELDa/VZl3ELEmW3DKlfr6L/lCkpYbDN5uOJK6dge/WSNUxjCqeaM7oFlO69hCX/dU8hLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=kFkEowyM; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="kFkEowyM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LxOfN+DgOQopqmC4mkMS08LT54mgjKxByXwstgI4G8s=; b=kFkEowyM9Vldo661qcdTjfNBfx
	GUhng8/9JUlG13fKp23524PA+l8FGHkMxMX3lmNHAAFIkKF69Fe/fQuqYwgvnNmYPRVUVuXNKGgbS
	D4C+8v7K607lDmpEYd8CxZ0KJzVpYmnyT77PzlrNMf9xsax9qrEghNBkxOJO+BrAmKz6h4yUR/U/g
	HtAUDJ9mKZspFyVyaqNQbaVhHihSVndRTj3hZLSs2AP7rXYKw3OJu60Q8SxfKZ6C6nPuEZzPo9WgT
	nHBinRnRkZAmN3W3VWY35CSl479nCmGoZeNwSDuSNXgbE1hF2mzI2Mfgj4HIYMEiRyVRstWhgJqj9
	IYk9AIlg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uI6Yi-00Bk71-4Z; Thu, 22 May 2025 16:06:08 +0200
Message-ID: <b24d5c5e-8a9e-4dfb-886b-b3ad70e62e76@igalia.com>
Date: Thu, 22 May 2025 15:06:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/sched/tests: Port tests to new cleanup method
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250522082742.148191-2-phasta@kernel.org>
 <20250522082742.148191-4-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250522082742.148191-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 22/05/2025 09:27, Philipp Stanner wrote:
> The drm_gpu_scheduler now supports a callback to help drm_sched_fini()
> avoid memory leaks. This callback instructs the driver to signal all
> pending hardware fences.
> 
> Implement the new callback
> drm_sched_backend_ops.cancel_pending_fences().
> 
> Have the callback use drm_mock_sched_job_complete() with a new error
> field for the fence error.
> 
> Keep the job status as DRM_MOCK_SCHED_JOB_DONE for now, since there is
> no party for which checking for a CANCELED status would be useful
> currently.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   .../gpu/drm/scheduler/tests/mock_scheduler.c  | 67 +++++++------------
>   drivers/gpu/drm/scheduler/tests/sched_tests.h |  4 +-
>   2 files changed, 25 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index f999c8859cf7..eca47f0395bc 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -55,7 +55,7 @@ void drm_mock_sched_entity_free(struct drm_mock_sched_entity *entity)
>   	drm_sched_entity_destroy(&entity->base);
>   }
>   
> -static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
> +static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job, int err)
>   {
>   	struct drm_mock_scheduler *sched =
>   		drm_sched_to_mock_sched(job->base.sched);
> @@ -63,7 +63,9 @@ static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
>   	lockdep_assert_held(&sched->lock);
>   
>   	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
> -	list_move_tail(&job->link, &sched->done_list);
> +	list_del(&job->link);
> +	if (err)
> +		dma_fence_set_error(&job->hw_fence, err);
>   	dma_fence_signal(&job->hw_fence);
>   	complete(&job->done);
>   }
> @@ -89,7 +91,7 @@ drm_mock_sched_job_signal_timer(struct hrtimer *hrtimer)
>   			break;
>   
>   		sched->hw_timeline.cur_seqno = job->hw_fence.seqno;
> -		drm_mock_sched_job_complete(job);
> +		drm_mock_sched_job_complete(job, 0);
>   	}
>   	spin_unlock_irqrestore(&sched->lock, flags);
>   
> @@ -212,26 +214,33 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
>   
>   static void mock_sched_free_job(struct drm_sched_job *sched_job)
>   {
> -	struct drm_mock_scheduler *sched =
> -			drm_sched_to_mock_sched(sched_job->sched);
>   	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
> -	unsigned long flags;
>   
> -	/* Remove from the scheduler done list. */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_del(&job->link);
> -	spin_unlock_irqrestore(&sched->lock, flags);
>   	dma_fence_put(&job->hw_fence);
> -
>   	drm_sched_job_cleanup(sched_job);
>   
>   	/* Mock job itself is freed by the kunit framework. */
>   }
>   
> +static void mock_sched_cancel_pending_fences(struct drm_gpu_scheduler *gsched)

"gsched" feels like a first time invention. Maybe drm_sched?

> +{
> +	struct drm_mock_sched_job *job, *next;
> +	struct drm_mock_scheduler *sched;
> +	unsigned long flags;
> +
> +	sched = container_of(gsched, struct drm_mock_scheduler, base);
> +
> +	spin_lock_irqsave(&sched->lock, flags);
> +	list_for_each_entry_safe(job, next, &sched->job_list, link)
> +		drm_mock_sched_job_complete(job, -ECANCELED);
> +	spin_unlock_irqrestore(&sched->lock, flags);

Canceling of the timers belongs in this call back I think. Otherwise 
jobs are not fully cancelled.

Hm, I also think, conceptually, the order of first canceling the timer 
and then signaling the fence should be kept.

At the moment it does not matter hugely, since the timer does not signal 
the jobs directly and will not find unlinked jobs, but if that changes 
in the future, the reversed order could cause double signaling. So if 
you keep it in the correct logical order that potential gotcha is 
avoided. Basically just keep the two pass approach verbatim, as is in 
the current drm_mock_sched_fini.

The rest of the conversion is I think good.

Only a slight uncertainty after I cross-referenced with my version 
(->cancel_job()) around why I needed to add signaling to 
mock_sched_timedout_job() and manual job cleanup to the timeout test. It 
was more than a month ago that I wrote it so can't remember right now. 
You checked for memory leaks and the usual stuff?

Regards,

Tvrtko

> +}
> +
>   static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
>   	.run_job = mock_sched_run_job,
>   	.timedout_job = mock_sched_timedout_job,
> -	.free_job = mock_sched_free_job
> +	.free_job = mock_sched_free_job,
> +	.cancel_pending_fences = mock_sched_cancel_pending_fences,
>   };
>   
>   /**
> @@ -265,7 +274,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
>   	sched->hw_timeline.context = dma_fence_context_alloc(1);
>   	atomic_set(&sched->hw_timeline.next_seqno, 0);
>   	INIT_LIST_HEAD(&sched->job_list);
> -	INIT_LIST_HEAD(&sched->done_list);
>   	spin_lock_init(&sched->lock);
>   
>   	return sched;
> @@ -280,38 +288,11 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
>    */
>   void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
>   {
> -	struct drm_mock_sched_job *job, *next;
> -	unsigned long flags;
> -	LIST_HEAD(list);
> +	struct drm_mock_sched_job *job;
>   
> -	drm_sched_wqueue_stop(&sched->base);
> -
> -	/* Force complete all unfinished jobs. */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &sched->job_list, link)
> -		list_move_tail(&job->link, &list);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	list_for_each_entry(job, &list, link)
> +	list_for_each_entry(job, &sched->job_list, link)
>   		hrtimer_cancel(&job->timer);
>   
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &list, link)
> -		drm_mock_sched_job_complete(job);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	/*
> -	 * Free completed jobs and jobs not yet processed by the DRM scheduler
> -	 * free worker.
> -	 */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &sched->done_list, link)
> -		list_move_tail(&job->link, &list);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	list_for_each_entry_safe(job, next, &list, link)
> -		mock_sched_free_job(&job->base);
> -
>   	drm_sched_fini(&sched->base);
>   }
>   
> @@ -346,7 +327,7 @@ unsigned int drm_mock_sched_advance(struct drm_mock_scheduler *sched,
>   		if (sched->hw_timeline.cur_seqno < job->hw_fence.seqno)
>   			break;
>   
> -		drm_mock_sched_job_complete(job);
> +		drm_mock_sched_job_complete(job, 0);
>   		found++;
>   	}
>   unlock:
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 27caf8285fb7..22e530d87791 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -32,9 +32,8 @@
>    *
>    * @base: DRM scheduler base class
>    * @test: Backpointer to owning the kunit test case
> - * @lock: Lock to protect the simulated @hw_timeline, @job_list and @done_list
> + * @lock: Lock to protect the simulated @hw_timeline and @job_list
>    * @job_list: List of jobs submitted to the mock GPU
> - * @done_list: List of jobs completed by the mock GPU
>    * @hw_timeline: Simulated hardware timeline has a @context, @next_seqno and
>    *		 @cur_seqno for implementing a struct dma_fence signaling the
>    *		 simulated job completion.
> @@ -49,7 +48,6 @@ struct drm_mock_scheduler {
>   
>   	spinlock_t		lock;
>   	struct list_head	job_list;
> -	struct list_head	done_list;
>   
>   	struct {
>   		u64		context;

