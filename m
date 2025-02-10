Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C0422F16D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739194640; cv=none; b=NyO020j37KRpdppUIMQ2WI6ldneFQDsNTiZLcvpGjelJ/uuc7+qu+WUCOca1xY+IOVul1BB8yTvBKnrX+dpkMf3uyFy8Jor9zCpV+trSemRBdflKrZfG2nPZM8YPrhWQEggB1ZUCgQMXtUUOkzfxug/dS/E/dukZSchH4Ke3B8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739194640; c=relaxed/simple;
	bh=aEX/84MGVDFeFJfMrp26cpzlm6G1D5C1ICxCiuV8k5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTgaU3uuYVEWBVZ7em6CwkPm/b+2720MU6rJj51WHaMniL6i5umGt+gzNnFi/uyqg4dys72znJfKq6DoVgLMq9pLVvQ9qx/kZJVp2xpnTQt57+Xy1aovNekt8rEyK1j3aZxRtymNXpC91JTFqCORVaowKeDdSllECGFJZby6D+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E8A91BA8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 05:37:38 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 79DEC3F58B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 05:37:16 -0800 (PST)
Date: Mon, 10 Feb 2025 13:37:00 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	kernel@collabora.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panthor: Replace sleep locks with spinlocks in
 fdinfo path
Message-ID: <Z6oA_JXmfXpm1h_d@e110455-lin.cambridge.arm.com>
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210124203.124191-1-adrian.larumbe@collabora.com>

On Mon, Feb 10, 2025 at 12:41:59PM +0000, Adrián Larumbe wrote:
> Panthor's fdinfo handler is routed through the /proc file system, which
> executes in an atomic context. That means we cannot use mutexes because
> they might sleep.
> 
> This bug was uncovered by enabling some of the kernel's mutex-debugging
> features:
> 
> CONFIG_DEBUG_RT_MUTEXES=y
> CONFIG_DEBUG_MUTEXES=y
> 
> Replace Panthor's group fdinfo data mutex with a guarded spinlock.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 26 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 0b93bf83a9b2..7a267d1efeb6 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -9,6 +9,7 @@
>  #include <drm/panthor_drm.h>
>  
>  #include <linux/build_bug.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> @@ -631,10 +632,10 @@ struct panthor_group {
>  		struct panthor_gpu_usage data;
>  
>  		/**
> -		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
> -		 * and job post-completion processing function
> +		 * @fdinfo.lock: Spinlock to govern concurrent access from drm file's fdinfo
> +		 * callback and job post-completion processing function
>  		 */
> -		struct mutex lock;
> +		spinlock_t lock;
>  
>  		/** @fdinfo.kbo_sizes: Aggregate size of private kernel BO's held by the group. */
>  		size_t kbo_sizes;
> @@ -910,8 +911,6 @@ static void group_release_work(struct work_struct *work)
>  						   release_work);
>  	u32 i;
>  
> -	mutex_destroy(&group->fdinfo.lock);
> -
>  	for (i = 0; i < group->queue_count; i++)
>  		group_free_queue(group, group->queues[i]);
>  
> @@ -2861,12 +2860,12 @@ static void update_fdinfo_stats(struct panthor_job *job)
>  	struct panthor_job_profiling_data *slots = queue->profiling.slots->kmap;
>  	struct panthor_job_profiling_data *data = &slots[job->profiling.slot];
>  
> -	mutex_lock(&group->fdinfo.lock);
> -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> -		fdinfo->cycles += data->cycles.after - data->cycles.before;
> -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> -		fdinfo->time += data->time.after - data->time.before;
> -	mutex_unlock(&group->fdinfo.lock);
> +	scoped_guard(spinlock, &group->fdinfo.lock) {
> +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> +			fdinfo->cycles += data->cycles.after - data->cycles.before;
> +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> +			fdinfo->time += data->time.after - data->time.before;
> +	}
>  }
>  
>  void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
> @@ -2880,12 +2879,11 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>  
>  	xa_lock(&gpool->xa);
>  	xa_for_each(&gpool->xa, i, group) {
> -		mutex_lock(&group->fdinfo.lock);
> +		guard(spinlock)(&group->fdinfo.lock);
>  		pfile->stats.cycles += group->fdinfo.data.cycles;
>  		pfile->stats.time += group->fdinfo.data.time;
>  		group->fdinfo.data.cycles = 0;
>  		group->fdinfo.data.time = 0;
> -		mutex_unlock(&group->fdinfo.lock);
>  	}
>  	xa_unlock(&gpool->xa);
>  }
> @@ -3531,7 +3529,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  	mutex_unlock(&sched->reset.lock);
>  
>  	add_group_kbo_sizes(group->ptdev, group);
> -	mutex_init(&group->fdinfo.lock);
> +	spin_lock_init(&group->fdinfo.lock);
>  
>  	return gid;
>  
> 
> base-commit: 2eca617f12586abff62038db1c14cb3aa60a15aa
> prerequisite-patch-id: 7e787ce5973b5fc7e9f69f26aa4d7e5ec03d5caa
> prerequisite-patch-id: 03a619b8c741444b28435850e23d9ec463171c13
> prerequisite-patch-id: 290e1053f8bf4a8b80fb037a87cae7e096b5aa96
> prerequisite-patch-id: bc49bb8c29905650fb4788acc528bb44013c0240
> prerequisite-patch-id: 46cab4c980824c03e5164afc43085fec23e1cba5
> -- 
> 2.47.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
