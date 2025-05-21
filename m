Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5C5262FFE
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833481; cv=none; b=ljqPLYEUFeTe5GCDaH+JaUe9eOIFkKnNGO6jxG8qS59VMHHxcRWhYj3cdU5fdpBiHS9JPyzgEvpOCWJ8zeSUqk/Z0U+oKEREjDKIXco6AqSg9bxjgdUjI2Gp+/7z+9FkQTpln2rx+IkYftIeG8o3QM1rY7dwf5i4dGrFfnwB5ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833481; c=relaxed/simple;
	bh=l82KCvS3O9txW7PsSB/+FtoOF8zTK5gAC4xzD4Vn8Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8kGJi93A5aiHfNqCXDq8kDZutvNPRJsKz75zCDLPIHXd4ZkyAXDiPpdJ4z9GsFOKSXZzXbhvfSUP+mdI9S9B/Ga9zt/JSH/AWsdZG1Gos//xugM6clM82K595YYOm/+2ZxGc+9+AfRPU90wYfKO4A6OStrRsin1yV1/62bZCeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F227F1C14
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:17:44 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B38A3F5A1
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:17:58 -0700 (PDT)
Date: Wed, 21 May 2025 14:17:46 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	kernel@collabora.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Reset queue slots if termination fails
Message-ID: <aC3SeiwOVZNdlLhr@e110455-lin.cambridge.arm.com>
References: <20250519145150.2265020-1-ashley.smith@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519145150.2265020-1-ashley.smith@collabora.com>

On Mon, May 19, 2025 at 03:50:19PM +0100, Ashley Smith wrote:
> This fixes a bug where if we timeout after a suspend and the termination
> fails, due to waiting on a fence that will never be signalled for
> example, we do not resume the group correctly. The fix forces a reset
> for groups that are not terminated correctly.
> 
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> Changes in v2:
>  - Fixed syntax error
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
> 
> base-commit: 9934ab18051118385c7ea44d8e14175edbe6dc9c
> -- 
> 2.43.0
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
