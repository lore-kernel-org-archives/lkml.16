Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDFF163
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748243924; cv=none; b=JtlQbaEwALu+SkNCAk/lbUoXXEY/l79RaWaZwxzk4B5nHLkEfe+75VYZcQVilv4M9muNywAp4tF8B+Z69KurhyPM1Kfn6nwbwtg7DAjXUmvvAK7W7LTJ73I6mtzDUGAhs+bPgu3X+YmTqr4Eru9idrVPusYf8rdLVTKKyc12dmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748243924; c=relaxed/simple;
	bh=An7YfCK9P5Y4IqEAGSFIZ+7Dm9ye7HbtEMNfRfd0Il4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVqlHQfyeMX+YxzgslqX9Kv/5sFCKCH9MP8VGQ/7OjOc5+EG3wiQboUJezzQCqA57gvr8LFWLh+Ym0QhpuGBazRy6D09o3DkgwSizkCCvM/dtt5eMAwgcw+JRGXfTQAJssCicWeVJTMR8QTb754eAyZYCqCsEgK6F11oq0fynMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=flSGD7em; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="flSGD7em"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748243920;
	bh=An7YfCK9P5Y4IqEAGSFIZ+7Dm9ye7HbtEMNfRfd0Il4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=flSGD7emFIbdlp0qLXRG111oWl4A1cXDZllM5+HlHPV8FSxMcXygIY8kqbdRVR4TE
	 xWsIZ/bDeyHsAj7dM7MlqPNP/2Q37wROemXksM6LnBG56lQ4Lx5q6/D6pxwiDBTktN
	 zMsqq8u4tWtRzkFxWcwO4VSXc4+1fHek9fqrEGUM9X/jMagfzeHBIOlJdnaYPO1bMa
	 NGBdIR36V494xeHB9VtCOaf9dT3bgtvgIY57MMDr99Zui+FNTpbjvpbSd1mxCMFKTh
	 GHkLE0gagkaOcz2ZqidnB2Ur2Fc44uOG+NJVtDPel9XPUGvIEAGeDFsrQ0xXRj99fv
	 Ui5dqla013DpA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7765917E0E89;
	Mon, 26 May 2025 09:18:40 +0200 (CEST)
Date: Mon, 26 May 2025 09:18:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Reset queue slots if termination fails
Message-ID: <20250526091834.16548264@collabora.com>
In-Reply-To: <20250519145150.2265020-1-ashley.smith@collabora.com>
References: <20250519145150.2265020-1-ashley.smith@collabora.com>
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

On Mon, 19 May 2025 15:50:19 +0100
Ashley Smith <ashley.smith@collabora.com> wrote:

> This fixes a bug where if we timeout after a suspend and the termination
> fails, due to waiting on a fence that will never be signalled for
> example, we do not resume the group correctly. The fix forces a reset
> for groups that are not terminated correctly.
> 
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>

We clearly need a Fixes tag, otherwise "drm/panthor: Make the timeout
per-queue instead of per-job" will be backported, but not this one,
which will lead to UAF. Can you send a v5 with both patches in the same
series, each with a proper Fixes tag?

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

