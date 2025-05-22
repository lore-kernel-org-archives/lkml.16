Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAA619DF66
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917855; cv=none; b=hvDw+vwloKWWGQpLiF3iuLHHTVNPDGZCP6UqWoNF7H6e+PHlTbqkyT2jk6Bt4b0DsXJTC2VQFLSjk5BJ/xMd5jjTKHxpqWOy95csBkv6k06Wn/TMs8JBw68WrsrtTA0ETXheHkL5Ne581lPkiQgm8qGEBXZ3tXj0Ya1KesNLruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917855; c=relaxed/simple;
	bh=Yz2UtYWagsYaY4eenVbgXf3j+TpwLLfD5UbOHYYkLHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgTr6v4KEVIle22aLvcfmFYbcMGoiJ5GxGIweCUz81aW00PWeNsuH9PUvHmmqE6am4XBJUpegxXLtftjpS9hyt3LCFHwCS9pwUu+AmPecn3Ttbqp7tn35S5HWb58qO8hvbxyKi0oRC4zzWDIyXfNflkG05cMoYB7emvxr8ZjUxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMug1+j4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMug1+j4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69F0C4CEE4;
	Thu, 22 May 2025 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747917854;
	bh=Yz2UtYWagsYaY4eenVbgXf3j+TpwLLfD5UbOHYYkLHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMug1+j4WVW/bFSxZ/rczepIXSyBsMR5lldov6EkiJxyN74GeBMAtBrP+5UjORdCZ
	 Y6LTM/GgBy86Tk0DmxeDjhSsL6z6wER5jJBXmmUXVJiptm46dJfnaNzE+UcPxG/RCd
	 eXTmTJ/+jlvqWOxLRTkUhpp/nnhRxSN1VqD4ZI9OL5whAJA1yOUUXoQNlpxTX/xAS7
	 R9hKl4o+yV2puLAWxbT1dn6FIiStrM1o0ixu4l+/esP5Hg9KpZ8svGdCS96lOjmVKY
	 /utjd0IRngjXfSOvodkKfNLCaJcqVnm1rBdWRopfOAo9da3QHrEYlLMTYPMJ4QNxY/
	 AcSDh2UJeGyuA==
Date: Thu, 22 May 2025 14:44:08 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v3 1/5] drm/sched: Fix teardown leaks with waitqueue
Message-ID: <aC8cGPx_m8g2ApcV@pollux>
References: <20250522082742.148191-2-phasta@kernel.org>
 <20250522082742.148191-3-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522082742.148191-3-phasta@kernel.org>

On Thu, May 22, 2025 at 10:27:39AM +0200, Philipp Stanner wrote:
> +/**
> + * drm_sched_submission_and_timeout_stop - stop everything except for free_job
> + * @sched: scheduler instance
> + *
> + * Helper for tearing down the scheduler in drm_sched_fini().
> + */
> +static void
> +drm_sched_submission_and_timeout_stop(struct drm_gpu_scheduler *sched)
> +{
> +	WRITE_ONCE(sched->pause_submit, true);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_delayed_work_sync(&sched->work_tdr);
> +}
> +
> +/**
> + * drm_sched_free_stop - stop free_job
> + * @sched: scheduler instance
> + *
> + * Helper for tearing down the scheduler in drm_sched_fini().
> + */
> +static void drm_sched_free_stop(struct drm_gpu_scheduler *sched)
> +{
> +	WRITE_ONCE(sched->pause_free, true);
> +	cancel_work_sync(&sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_no_jobs_pending - check whether jobs are pending
> + * @sched: scheduler instance
> + *
> + * Checks if jobs are pending for @sched.
> + *
> + * Return: true if jobs are pending, false otherwise.
> + */
> +static bool drm_sched_no_jobs_pending(struct drm_gpu_scheduler *sched)
> +{
> +	bool empty;
> +
> +	spin_lock(&sched->job_list_lock);
> +	empty = list_empty(&sched->pending_list);
> +	spin_unlock(&sched->job_list_lock);
> +
> +	return empty;
> +}

I understand that the way you use this function is correct, since you only call
it *after* drm_sched_submission_and_timeout_stop(), which means that no new
items can end up on the pending_list.

But if we look at this function without context, it's broken:

The documentation says "Return: true if jobs are pending, false otherwise.", but
you can't guarantee that, since a new job could be added to the pending_list
after spin_unlock().

Hence, providing this function is a footgun.

Instead, you should put this teardown sequence in a single function, where you
can control the external conditions, i.e. that
drm_sched_submission_and_timeout_stop() has been called.

Please also add a comment explaining why we can release the lock and still work
with the value returned by list_empty() in this case, i.e. because we guarantee
that the list item count converges against zero.

The other two helpers above, drm_sched_submission_and_timeout_stop() and
drm_sched_free_stop() should be fine to have.

> +/**
> + * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending jobs
> + * @sched: scheduler instance
> + *
> + * Must only be called if &struct drm_sched_backend_ops.cancel_pending_fences is
> + * implemented.
> + *
> + * Instructs the driver to kill the fence context associated with this scheduler,
> + * thereby signaling all pending fences. This, in turn, will trigger
> + * &struct drm_sched_backend_ops.free_job to be called for all pending jobs.
> + * The function then blocks until all pending jobs have been freed.
> + */
> +static void drm_sched_cancel_jobs_and_wait(struct drm_gpu_scheduler *sched)
> +{
> +	sched->ops->cancel_pending_fences(sched);
> +	wait_event(sched->pending_list_waitque, drm_sched_no_jobs_pending(sched));
> +}

Same here, you can't have this as an isolated helper.
