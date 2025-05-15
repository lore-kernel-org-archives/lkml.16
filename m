Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9737F215F56
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323504; cv=none; b=RpNbBvrKy0bWfTGD5x24q2hgL+ayTVIpGtMFEodr18RvuPvp7xnxSCatr6GVFa92O7qeD9CjyjxVpFG2h/xJDirPo3E42SuObugRhXbYm0seCuPh+cdBylNDWey7LMJ/SyqSLTuxWZ6DIq3ueCSwlfJa9kixP6As5sFDe7x/upo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323504; c=relaxed/simple;
	bh=Gh2FwpOg8XOCc4g7MQDuQi/1cq8ajElLDzOQEl3/CjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVAtIxV6LfDdKZzFJVqJtr5fdJXPXC4/IzS0WKkpA2CSBjWkIgI831usIbjhIPHBhUuFVbghkSnirDZy47MFAHIF7Lljp646E42gZ0O4wBbUF2A8JizJUnq27QH+WHGmE+RW2YUQSvqdiNrUxeYjsVw1EDXLpqD1J2nQF3qz6SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D8CA14BF;
	Thu, 15 May 2025 08:38:10 -0700 (PDT)
Received: from [10.1.31.39] (e122027.cambridge.arm.com [10.1.31.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B25203F673;
	Thu, 15 May 2025 08:38:19 -0700 (PDT)
Message-ID: <4e830eb7-938b-4c75-9074-0d94e8309b4e@arm.com>
Date: Thu, 15 May 2025 16:38:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Reset queue slots if termination fails
To: Ashley Smith <ashley.smith@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250515103314.1682471-1-ashley.smith@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250515103314.1682471-1-ashley.smith@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/05/2025 11:33, Ashley Smith wrote:
> This fixes a bug where if we timeout after a suspend and the termination
> fails, due to waiting on a fence that will never be signalled for
> example, we do not resume the group correctly. The fix forces a reset
> for groups that are not terminated correctly.
> 
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 43ee57728de5..1f4a5a103975 100644
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
> +				for (i = 0; i queue_count; i++) {

Missing "<"?

Steve

> +					if (group->queues[i])
> +						cs_slot_reset_locked(ptdev, csg_id, i);
> +				}
> +			}
>  			slot_mask &= ~BIT(csg_id);
>  		}
>  	}
> 
> base-commit: 9934ab18051118385c7ea44d8e14175edbe6dc9c

