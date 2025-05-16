Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1721213E8E
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391658; cv=none; b=kuP0VX0iHADNlPrBuLXvB4GRTF33A/I2eR18+wOjhFW5J3cv40ClvWhA1bq3MAPGWS68prwOJm8n2JJq87nyqDiLwEY8GmbWE4zYN5tVbXnYTx0d/q9QZhVGPy0tObvDwUlUxsEMD7GX7/ktrg53pLCgHQiJn2+tBB1cPhCo+Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391658; c=relaxed/simple;
	bh=s3mcFWVrw/kUYNxQAJ2yQ+KeXqojzE8420WB/F6fHMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXH1tdix0cadnRwou4FLI5q8ACDsZODiS+N2XE8bCNoQH6JQ1K+PoUbTBdJ/Qgs/3JB582+2RADhXRkhsxhG9XbXu9uIWgnhhuhNLakVTizLPjVNdyAZqkFfNW5thN0nsuKrIRRqsvehTRZscBbS3eNhRwpBiihfMyy5SCtJs3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=r/DU9WND; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="r/DU9WND"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BJf7n8meUFE1D7xOQ8/mGDyCpXfo3hlFKbxw8pTZT+U=; b=r/DU9WNDGhjYMULtQaU0d2tcf2
	pZKf3WrysA9bhojOYYposAfWyV93LQL51bP4+zy3COFl2XHstZQrCoJmVo5+poP3rKfEkx8KcFt7F
	yNA8mXSs4DJEK5PDev0BbilMhymIr2b2cV5seVWwLskJg9Mv+1JVhvIDFo4/jbK30nbD3+oymV/81
	/NGz+y0+kHA5foEMf+Kei/4wuQlYw5kdvKVUPNfk1iNncPGdMxhjakS+b9ypB3RFIC0tcmii26a60
	cTbzTSk3y8Ycu68MDrmonOR18/S/db7HSUfKDRxT2Ixn/w+HKIBFKSRzI+G1kG7TswSO/bGJAFZST
	wo59B8fw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uFsIQ-0092iv-LR; Fri, 16 May 2025 12:34:05 +0200
Message-ID: <d66518e3-8670-454b-a290-21ecb5d57702@igalia.com>
Date: Fri, 16 May 2025 11:34:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/sched: Prevent teardown waitque from blocking
 too long
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-4-phasta@kernel.org>
 <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com>
 <e627335ea7d0cbb1f8b92ad5fd936466b19c3ec7.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <e627335ea7d0cbb1f8b92ad5fd936466b19c3ec7.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 16/05/2025 10:54, Philipp Stanner wrote:
> On Fri, 2025-05-16 at 10:33 +0100, Tvrtko Ursulin wrote:
>>
>> On 24/04/2025 10:55, Philipp Stanner wrote:
>>> The waitqueue that ensures that drm_sched_fini() blocks until the
>>> pending_list has become empty could theoretically cause that
>>> function to
>>> block for a very long time. That, ultimately, could block userspace
>>> procesess and prevent them from being killable through SIGKILL.
>>>
>>> When a driver calls drm_sched_fini(), it is safe to assume that all
>>> still pending jobs are not needed anymore anyways. Thus, they can
>>> be
>>> cancelled and thereby it can be ensured that drm_sched_fini() will
>>> return relatively quickly.
>>>
>>> Implement a new helper to stop all work items / submission except
>>> for
>>> the drm_sched_backend_ops.run_job().
>>>
>>> Implement a driver callback, kill_fence_context(), that instructs
>>> the
>>> driver to kill the fence context associated with this scheduler,
>>> thereby
>>> causing all pending hardware fences to be signalled.
>>>
>>> Call those new routines in drm_sched_fini() and ensure backwards
>>> compatibility if the new callback is not implemented.
>>>
>>> Suggested-by: Danilo Krummrich <dakr@redhat.com>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 47 +++++++++++++++++----
>>> -----
>>>    include/drm/gpu_scheduler.h            | 11 ++++++
>>>    2 files changed, 42 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index ea82e69a72a8..c2ad6c70bfb6 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1390,31 +1390,46 @@ drm_sched_no_jobs_pending(struct
>>> drm_gpu_scheduler *sched)
>>>    	return empty;
>>>    }
>>>    
>>> +/**
>>> + * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending
>>> jobs
>>> + * @sched: scheduler instance
>>> + *
>>> + * Must only be called if &struct
>>> drm_sched_backend_ops.kill_fence_context is
>>> + * implemented.
>>> + *
>>> + * Instructs the driver to kill the fence context associated with
>>> this scheduler,
>>> + * thereby signalling all pending fences. This, in turn, will
>>> trigger
>>> + * &struct drm_sched_backend_ops.free_job to be called for all
>>> pending jobs.
>>> + * The function then blocks until all pending jobs have been
>>> freed.
>>> + */
>>> +static inline void
>>> +drm_sched_cancel_jobs_and_wait(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	sched->ops->kill_fence_context(sched);
>>> +	wait_event(sched->pending_list_waitque,
>>> drm_sched_no_jobs_pending(sched));
>>> +}
>>> +
>>>    /**
>>>     * drm_sched_fini - Destroy a gpu scheduler
>>>     *
>>>     * @sched: scheduler instance
>>>     *
>>> - * Tears down and cleans up the scheduler.
>>> - *
>>> - * Note that this function blocks until all the fences returned by
>>> - * &struct drm_sched_backend_ops.run_job have been signalled.
>>> + * Tears down and cleans up the scheduler. Might leak memory if
>>> + * &struct drm_sched_backend_ops.kill_fence_context is not
>>> implemented.
>>>     */
>>>    void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	struct drm_sched_entity *s_entity;
>>>    	int i;
>>>    
>>> -	/*
>>> -	 * Jobs that have neither been scheduled or which have
>>> timed out are
>>> -	 * gone by now, but jobs that have been submitted through
>>> -	 * backend_ops.run_job() and have not yet terminated are
>>> still pending.
>>> -	 *
>>> -	 * Wait for the pending_list to become empty to avoid
>>> leaking those jobs.
>>> -	 */
>>> -	drm_sched_submission_and_timeout_stop(sched);
>>> -	wait_event(sched->pending_list_waitque,
>>> drm_sched_no_jobs_pending(sched));
>>> -	drm_sched_free_stop(sched);
>>> +	if (sched->ops->kill_fence_context) {
>>> +		drm_sched_submission_and_timeout_stop(sched);
>>> +		drm_sched_cancel_jobs_and_wait(sched);
>>> +		drm_sched_free_stop(sched);
>>> +	} else {
>>> +		/* We're in "legacy free-mode" and ignore
>>> potential mem leaks */
>>> +		drm_sched_wqueue_stop(sched);
>>> +	}
>>>    
>>>    	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
>>> i++) {
>>>    		struct drm_sched_rq *rq = sched->sched_rq[i];
>>> @@ -1502,7 +1517,7 @@ bool drm_sched_wqueue_ready(struct
>>> drm_gpu_scheduler *sched)
>>>    EXPORT_SYMBOL(drm_sched_wqueue_ready);
>>>    
>>>    /**
>>> - * drm_sched_wqueue_stop - stop scheduler submission
>>> + * drm_sched_wqueue_stop - stop scheduler submission and freeing
>>
>> Looks like the kerneldoc corrections (below too) belong to the
>> previous
>> patch. Irrelevant if you decide to squash them though.
>>
>>>     * @sched: scheduler instance
>>>     *
>>>     * Stops the scheduler from pulling new jobs from entities. It
>>> also stops
>>> @@ -1518,7 +1533,7 @@ void drm_sched_wqueue_stop(struct
>>> drm_gpu_scheduler *sched)
>>>    EXPORT_SYMBOL(drm_sched_wqueue_stop);
>>>    
>>>    /**
>>> - * drm_sched_wqueue_start - start scheduler submission
>>> + * drm_sched_wqueue_start - start scheduler submission and freeing
>>>     * @sched: scheduler instance
>>>     *
>>>     * Restarts the scheduler after drm_sched_wqueue_stop() has
>>> stopped it.
>>> diff --git a/include/drm/gpu_scheduler.h
>>> b/include/drm/gpu_scheduler.h
>>> index d0b1f416b4d9..8630b4a26f10 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -509,6 +509,17 @@ struct drm_sched_backend_ops {
>>>             * and it's time to clean it up.
>>>    	 */
>>>    	void (*free_job)(struct drm_sched_job *sched_job);
>>> +
>>> +	/**
>>> +	 * @kill_fence_context: kill the fence context belonging
>>> to this scheduler
>>
>> Which fence context would that be? ;)
>>
>> Also, "fence context" would be a new terminology in gpu_scheduler.h
>> API
>> level. You could call it ->sched_fini() or similar to signify at
>> which
>> point in the API it gets called and then the fact it takes sched as
>> parameter would be natural.
>>
>> We also probably want some commentary on the topic of indefinite (or
>> very long at least) blocking a thread exit / SIGINT/TERM/KILL time.
>> Cover letter touches upon that problem but I don't see you address
>> it.
>> Is the idea to let drivers shoot themselves in the foot or what?
> 
> You didn't seriously just write that, did you?
> 
> Yes, my intention clearly has been since September to make things
> worse, more ambiguous and destroy drivers. That's why I'm probably the
> only individual after Sima (who added some of the FIXMEs) who ever
> bothered documenting all this mess here, and warning people about the
> five hundred pitfalls, like three different start and stop functions,
> implicit refcount rules and God knows which other insane hacks that
> simply move driver problems into common infrastructure.
> 
> Reconsider your attitude.

I don't know what kind of attitude you think I was expressing. If the 
last sentence was a hyperbole too much for you then sorry. Point was in 
the paragraph ending with that - to document callback must not block, or 
if it has to to discuss for how long. And to perhaps discuss if 
scheduler code should impose a limit. Otherwise the indefinite block on 
thread exit from the cover letter can still happen. I don't see raising 
those point is a criticism of your overall work. (Fact that we don't see 
eye to eye regarding more state machine vs the ->cancel_job() 
alternative aside.)

Regards,

Tvrtko


> 
> P.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +	 *
>>> +	 * Needed to cleanly tear the scheduler down in
>>> drm_sched_fini(). This
>>> +	 * callback will cause all hardware fences to be signalled
>>> by the driver,
>>> +	 * which, ultimately, ensures that all jobs get freed
>>> before teardown.
>>> +	 *
>>> +	 * This callback is optional, but it is highly recommended
>>> to implement it.
>>> +	 */
>>> +	void (*kill_fence_context)(struct drm_gpu_scheduler
>>> *sched);
>>>    };
>>>    
>>>    /**
>>
> 

