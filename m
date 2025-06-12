Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE33B298994
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742859; cv=none; b=q78tXnGL1WdW4r+9CyK/aDYicF/VQs/7XOdMnvribWqVMXX68fLv5WAJFYbOvdXkLaXV/XTO5KoXyTWf520tLLUn5yZoJVk/GfXE7PF/bSFeUN4Y8VBDnbBwfkyG15FZX4C6FyLJoz9x6uAHxbAdOrDfNesm+wVwELzvzxl69yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742859; c=relaxed/simple;
	bh=TWQGumuO93u36q2VkFAd+HA92aZbD8DvDjoKEJO3NtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLFH9baBHj9fkUvvcKtfXd7pImyxU1zxJCD4JgwGoplWsVbHnEeQhqf0rhqSfTDhic5+MSXfHslWi7GeswK/pIQhFeoB6ImUFv0qX8W1uQ/qAiWKoB5+8DXu2P+jNbjD4/GC2ucLhDppWym7xZYoWKEvLApSfUNeBKfOvJwx5O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E02E7153B;
	Thu, 12 Jun 2025 08:40:35 -0700 (PDT)
Received: from [10.1.37.36] (e122027.cambridge.arm.com [10.1.37.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4ACB3F66E;
	Thu, 12 Jun 2025 08:40:54 -0700 (PDT)
Message-ID: <b59c9bf1-352a-43db-af05-7b4d4ac526b0@arm.com>
Date: Thu, 12 Jun 2025 16:40:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/panthor: Reset queue slots if termination
 fails
To: Ashley Smith <ashley.smith@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 "open list:ARM MALI PANTHOR DRM DRIVER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250603094952.4188093-1-ashley.smith@collabora.com>
 <20250603094952.4188093-2-ashley.smith@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250603094952.4188093-2-ashley.smith@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/06/2025 10:49, Ashley Smith wrote:
> This fixes a bug where if we timeout after a suspend and the termination
> fails, due to waiting on a fence that will never be signalled for
> example, we do not resume the group correctly. The fix forces a reset
> for groups that are not terminated correctly.
> 
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")

Reviewed-by: Steven Price <steven.price@arm.com>

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

