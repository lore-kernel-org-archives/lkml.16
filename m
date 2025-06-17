Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3581A1EB1AF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171548; cv=none; b=Vw/mr+T/xolUUHaqk/hIaBSHAJNHn+6JtE5ZUUkRYY7T8OyqOPGTGO7/4fNARw05keHijLT1t+qnFNQjB3XShk87YHDDzbox+GZg/+LLrQqRrt2fKr18K/hgzelhPr5jVaUijpVhWxKjEf4CLP4mVK72P2/cJ8923urrNpxzEgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171548; c=relaxed/simple;
	bh=ULFNwYQca9wWdUwi5WouClDI7RzoaTU1rxQ8ju3xMX4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bl8E1oM7DzzYzjBQH/mSP/GmUONx1mH6HLVm/tkvehq7FtlwqfAFKJ8UDwTrzc5NNtZot7uY64bdyBj0u1L7dTZjFNjMl9DoABgahp3WkRPnkXZuB1LrZVWTLR/EfbxtSEEwkJyMWjvvd68YgIPxCPJFYxZLSB0vdDejZmO51pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PQD8erj0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PQD8erj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750171544;
	bh=ULFNwYQca9wWdUwi5WouClDI7RzoaTU1rxQ8ju3xMX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PQD8erj0C7Hy+ryhmlFfeBMXd63QxZtIVk28bKTsFyrdpP0vqNI2BWU1C3FVzkMzw
	 TBIdDrGu70jJM1n36OG9XgxQ1na2IXCgdmOshBU41BQs7mnfLYW6wh6Hb6KPi5ynO9
	 2fW0hfxwsfJLu4cVvzmcYk0uj6sLFPxvCR03+3NTSqneClVFxSubbvrMqMCl0+7qx8
	 OSZxtc/+lAAhP8xQMIf9ADsfJsqaEj6Nt5tn59QsFjfzvEYGb8jJNPOXiWgdSZRcDI
	 42s2FZ8c5LbMJ8PCvD8UabhPc4ei38SYwuyslHDgo1XE/UdPUkUys+BQekNY8v3pN/
	 MssXb3HnHbAoA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9512717E06BF;
	Tue, 17 Jun 2025 16:45:43 +0200 (CEST)
Date: Tue, 17 Jun 2025 16:45:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org (open list:ARM MALI PANTHOR DRM DRIVER),
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v5 1/2] drm/panthor: Reset queue slots if termination
 fails
Message-ID: <20250617164540.4fb196d4@collabora.com>
In-Reply-To: <20250603094952.4188093-2-ashley.smith@collabora.com>
References: <20250603094952.4188093-1-ashley.smith@collabora.com>
	<20250603094952.4188093-2-ashley.smith@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Jun 2025 10:49:31 +0100
Ashley Smith <ashley.smith@collabora.com> wrote:

> This fixes a bug where if we timeout after a suspend and the termination
> fails, due to waiting on a fence that will never be signalled for
> example, we do not resume the group correctly. The fix forces a reset
> for groups that are not terminated correctly.
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

group is used uninitialized which leads to a random (most likely NULL)
pointer deref. Either we go:

				for (i = 0; i < csg_slot->group->queue_count; i++) {

and we move the group variable to the last for loop, so we're not
tempted to use it again in places where it's not initialized, or
we use the group variable consistently accross this function by having

		group = csg_slot->group;

assignments where csg_slot->group is currently used.

We might also want to consider splitting this huge function in
sub-functions, but probably not in a patch that's flagged for
backporting.


> +					if (group->queues[i])
> +						cs_slot_reset_locked(ptdev, csg_id, i);
> +				}
> +			}
>  			slot_mask &= ~BIT(csg_id);
>  		}
>  	}

