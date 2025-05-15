Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D632F1FBC94
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305737; cv=none; b=miH2pteS/7r05UKALwGE3RNvpRuOjsHqqO55yZDtHjuffWB4/MW8WVGlcXXYfmqFm7V5rD8+u5NgtjjBJg1//a/8OYVDQfeqFYy7KisUsvkt1ke82LhvpR6PnLi7sYJ9cEWuK9yzvTvHywigEgc6YCPbFre1HqOqhlNMMlLyKRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305737; c=relaxed/simple;
	bh=lSwTOOyvQBSKjA+yy+GDikxljG7whUJ7zYFHdXMTj94=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UT/3Qv7olg7IcRP/45SAXggKXreceMKTMZtC6WsY7voGhA3PnVR4u97yNUsF9z+je9iFijUt9ohh55g88EwJ43ZCxsWdlzFIk3OJiAPrJ7G00V4XgWtOhNkcsA2OXeCiRbQfXNI0Ua2wPRoFBZCzOcDS6+h6qp0ku1ga6Zl0N5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d0/kGHkQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d0/kGHkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747305733;
	bh=lSwTOOyvQBSKjA+yy+GDikxljG7whUJ7zYFHdXMTj94=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d0/kGHkQ3H9hBwt/Io4OL30DTR2JNnAmn+IYkQq0E5s3Wybtba4c4lExLKsXzAr0f
	 nkiXE3frc+Teu4bhqCeeEsSC8UXUm2oNz7Ad9WqJMZZ/GYPAWWjgCyXEWDtJz6tRRc
	 YDFlqz9Z/N/akS5hPwDmTfj+V1C1BBYqpbsfH2Zq/KLUeLWXMKkfrbIMQtlpFdJyDc
	 DXPvQ0t0jsTyqoxWWPA/nQGhKXeSmHTlj4YWggdpUEloB+CiSTsqQnD91xr4RvDHDj
	 ic7Wccl8bLRlJ4PQUGWuFzVm3DUtfnIR15TlYs5AzT00eLraZ/PNSeZyKR1I7Cla+b
	 FuxCt1ikoyIFQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C25117E0404;
	Thu, 15 May 2025 12:42:13 +0200 (CEST)
Date: Thu, 15 May 2025 12:42:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Reset queue slots if termination fails
Message-ID: <20250515124209.37253a92@collabora.com>
In-Reply-To: <20250515103314.1682471-1-ashley.smith@collabora.com>
References: <20250515103314.1682471-1-ashley.smith@collabora.com>
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

On Thu, 15 May 2025 11:33:05 +0100
Ashley Smith <ashley.smith@collabora.com> wrote:

> This fixes a bug where if we timeout after a suspend and the termination
> fails, due to waiting on a fence that will never be signalled for
> example, we do not resume the group correctly. The fix forces a reset
> for groups that are not terminated correctly.
> 
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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
> +					if (group->queues[i])
> +						cs_slot_reset_locked(ptdev, csg_id, i);
> +				}
> +			}
>  			slot_mask &= ~BIT(csg_id);
>  		}
>  	}
> 
> base-commit: 9934ab18051118385c7ea44d8e14175edbe6dc9c

