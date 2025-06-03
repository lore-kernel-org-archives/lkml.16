Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2EA22DA0B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948999; cv=none; b=sDUSyaB2Rx/MfNUNeHd5dWETV+6bFyj3QOSScopqgX1rMRyc+10uuKDNmn2oI6sqjM872yWBT8WKI8pErRSE22KQJ7WZQdMxoQ7zPvDSMfWyZmkXqJmUha9om+hNoRcfbywgLJlXnGHOi84T6+daBgwpHkjyFuFvYkKiw2aSjYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948999; c=relaxed/simple;
	bh=E5tXorVjxqoKhQM8Bfx15Da5YNMlteM+ombg32GePD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j57QsIypF+Bew9G7HQSA0HTJQ22wzWjVTb9q0rUzHJIHJkiqbHqQqxnFMDNZFWuOv8R/sdVH+6TcAMzfF6YyjHEuo8k9WMGV06xLuhqLtJo7tqX5Sx0UuJL2d4/CSfy88LGKZqCWF8S8YoQc7o44wDSyQ1tNzAavtLO9j+m2lfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BFCE12FC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 04:09:40 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C9A413F673
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 04:09:56 -0700 (PDT)
Date: Tue, 3 Jun 2025 12:09:44 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	kernel@collabora.com,
	"open list:ARM MALI PANTHOR DRM DRIVER" <dri-devel@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] drm/panthor: Reset queue slots if termination
 fails
Message-ID: <aD7X-O8ykIGZjHjc@e110455-lin.cambridge.arm.com>
References: <20250603094952.4188093-1-ashley.smith@collabora.com>
 <20250603094952.4188093-2-ashley.smith@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603094952.4188093-2-ashley.smith@collabora.com>

On Tue, Jun 03, 2025 at 10:49:31AM +0100, Ashley Smith wrote:
> This fixes a bug where if we timeout after a suspend and the termination
> fails, due to waiting on a fence that will never be signalled for
> example, we do not resume the group correctly. The fix forces a reset
> for groups that are not terminated correctly.

I have a question on the commit message: you're describing a situation where
a fence will *never* be signalled. Is that a real example? I thought this is
not supposed to ever happen! Or are you trying to say that the fence signalling
happens after the timeout?

> 
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 43ee57728de5..65d8ae3dcac1 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2727,8 +2727,17 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  			 * automatically terminate all active groups, so let's
>  			 * force the state to halted here.
>  			 */
> -			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED)
> +			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED) {
>  				csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
> +
> +				/* Reset the queue slots manually if the termination
> +				 * request failed.
> +				 */
> +				for (i = 0; i < group->queue_count; i++) {
> +					if (group->queues[i])
> +						cs_slot_reset_locked(ptdev, csg_id, i);
> +				}
> +			}
>  			slot_mask &= ~BIT(csg_id);
>  		}
>  	}
> -- 
> 2.43.0
> 

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
