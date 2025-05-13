Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E932F215046
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127979; cv=none; b=uHqI2oCVGmV66DViTBMe/lpp9qzUs11Wm4AiTCdBDhbCuN9Ir+Ap9vgb6a3Tlhx2kgS9G7GOTc2gxi29CU1KfetY1puFASOgjRt8HdOr57CHs2Z4ZH5xG+IAjiVPLpZE6ZIH2HBRClo1SG26KjLjVkHxVEzhlMY4HLZPvXaEOT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127979; c=relaxed/simple;
	bh=0KETN5AWlWq5ENBwZXBnjnYnclctLbJUt1NNBu4J6ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtuwT+n+BeEAPjrfsJCCuOpVFdIXQGKVuMOUYt64qfcGGjLUsriveW9DESC+Sn8Q8pyD8fYDxP6NxmI75UQagyJtR/zoQDrhJWR+59gkAaZAF7s8wfXqL68+QAyL/2uN+aQqJiKFjmLX7J6RriqIhjglXtaNKTDKRZFZvjIVk7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAzQ66CG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAzQ66CG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747127978; x=1778663978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0KETN5AWlWq5ENBwZXBnjnYnclctLbJUt1NNBu4J6ok=;
  b=jAzQ66CGk24NkPpzqE7QtEmTZPWhfbB9YYxDlZYqIsCjj1lurJTf48WZ
   3mYmQuyJM/llj06xnGKH/2o8aCc2pmg9kzfx/KTNgohidPQ28s+8jF6gG
   Yo/tdTkeROrgKzA4xevZb+7wuMN+SejLvkBgc00RC6uANXco6SyN1qQXY
   X1T4HkcIG1Z1gF0AQqgMmvZLZY8lAfUZXc8wc8/uy2D0UNyagLa0CbOZL
   mk7U8QOGOC8vyB7z+NWNEvhd6PBzxxeBAXPdyWHbHOZRI6PffyEjEG8CM
   ZUUZCQ5YUC48LQzDGb3OZ7UDOUmGy0YhlWXKiJbYA5WuzuHjSnCMf5x6W
   w==;
X-CSE-ConnectionGUID: oV6zlrUMSj+4FsxkST2s1g==
X-CSE-MsgGUID: T6otKT8IQ7Stb+ktKkGSdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48955174"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="48955174"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 02:19:37 -0700
X-CSE-ConnectionGUID: DjWiANOTRk29Biv/VprKgA==
X-CSE-MsgGUID: XxXI2IblTbS0YvK7mfFlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="142766533"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO stinkbox) ([10.245.244.221])
  by orviesa005.jf.intel.com with SMTP; 13 May 2025 02:19:33 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 13 May 2025 12:19:32 +0300
Date: Tue, 13 May 2025 12:19:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: tzimmermann@suse.de, airlied@gmail.com,
	maarten.lankhorst@linux.intel.com, mario.kleiner@tuebingen.mpg.de,
	airlied@redhat.com, mripard@kernel.org, simona@ffwll.ch,
	bobo.shaobowang@huawei.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vblank: Fix hard lockup in drm_handle_vblank()
Message-ID: <aCMOpOrPHXGX75RQ@intel.com>
References: <20250510094757.4174662-1-zengheng4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250510094757.4174662-1-zengheng4@huawei.com>
X-Patchwork-Hint: comment

On Sat, May 10, 2025 at 05:47:57PM +0800, Zeng Heng wrote:
> When we performed fuzz testing on DRM using syzkaller, we encountered
> the following hard lockup issue:
> 
> Kernel panic - not syncing: Hard LOCKUP
> CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.6.0+ #21
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> Call Trace:
>  <IRQ>
>  hrtimer_cancel+0x52/0x70 kernel/time/hrtimer.c:1449
>  __disable_vblank drivers/gpu/drm/drm_vblank.c:434 [inline]
>  drm_vblank_disable_and_save+0x27f/0x3c0 drivers/gpu/drm/drm_vblank.c:478
>  vblank_disable_fn+0x15d/0x1b0 drivers/gpu/drm/drm_vblank.c:495
>  call_timer_fn+0x39/0x280 kernel/time/timer.c:1700
>  expire_timers+0x22d/0x3c0 kernel/time/timer.c:1751
>  __run_timers kernel/time/timer.c:2022 [inline]
>  run_timer_softirq+0x315/0x8a0 kernel/time/timer.c:2035
>  handle_softirqs+0x195/0x580 kernel/softirq.c:553
>  __do_softirq kernel/softirq.c:587 [inline]
>  </IRQ>
> 
> This is a deadlock issue as follows:
> 
>     CPU3				CPU 7
> 
> vblank_disable_fn()
>   drm_vblank_disable_and_save()
>   spin_lock(vblank_time_lock)
> 				hrtimer_interrupt()
> 				  vkms_vblank_simulate()
> 				    drm_handle_vblank()
> 				      // wait for CPU3 to release vblank_time_lock
> 				      spin_lock(vblank_time_lock)
>     vkms_disable_vblank()
>       // wait for vblank_hrtimer on CPU7 to finish
>       hrtimer_cancel(vblank_hrtimer)

Looks like a vkms bug to me, so should IMO be fixed there instead
of hacking around it in the common vblank code.

Maybe vkms can just have the timer not rearm itself when it notices
that vblank interrupts are disabled?

> 
> The call of hrtimer_cancel() has hold vblank_time_lock which would prevent
> completion of the hrtimer's callback function.
> 
> Therefore, in drm_handle_vblank(), we move the check for the
> vblank->enabled variable to the time when vblank_time_lock() is acquired.
> If the CRTC event has already been canceled, the drm_handle_vblank() will
> be terminated and will no longer attempt to acquire vblank_time_lock.
> 
> In the same time, in drm_vblank_disable_and_save(), we set vblank->enabled
> to disable before calling hrtimer_cancel() to avoid endless waiting in
> hrtimer_cancel_wait_running().
> 
> Fixes: 27641c3f003e ("drm/vblank: Add support for precise vblank timestamping.")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 78958ddf8485..56b80e5ede2a 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -471,6 +471,8 @@ void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
>  	if (!vblank->enabled)
>  		goto out;
>  
> +	vblank->enabled = false;
> +
>  	/*
>  	 * Update the count and timestamp to maintain the
>  	 * appearance that the counter has been ticking all along until
> @@ -479,7 +481,6 @@ void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
>  	 */
>  	drm_update_vblank_count(dev, pipe, false);
>  	__disable_vblank(dev, pipe);
> -	vblank->enabled = false;
>  
>  out:
>  	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
> @@ -1932,14 +1933,13 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
>  	 * vblank enable/disable, as this would cause inconsistent
>  	 * or corrupted timestamps and vblank counts.
>  	 */
> -	spin_lock(&dev->vblank_time_lock);
> -
> -	/* Vblank irq handling disabled. Nothing to do. */
> -	if (!vblank->enabled) {
> -		spin_unlock(&dev->vblank_time_lock);
> -		spin_unlock_irqrestore(&dev->event_lock, irqflags);
> -		return false;
> -	}
> +	do {
> +		/* Vblank irq handling disabled. Nothing to do. */
> +		if (!vblank->enabled) {
> +			spin_unlock_irqrestore(&dev->event_lock, irqflags);
> +			return false;
> +		}
> +	} while (!spin_trylock(&dev->vblank_time_lock));
>  
>  	drm_update_vblank_count(dev, pipe, true);
>  
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
