Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592FA2F432C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722828; cv=none; b=c9zmaUPfj7IU7ti/eKPmdixcUJhzK50qB6LwkGF1lVlroOJn3WpURyLKghecYJ/b3DRrcPllUB/WTbcouxKsxzoXjR5GsFA/SykcboVEbJD7VRu8BsjB5NqQWGOeVxOU3UYl38iNin3AE10ib8LbFALSKauunP0XqcJvaEvpCmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722828; c=relaxed/simple;
	bh=VwNY5PoAM+WAQI21xZoRNXcXJ7rMeFg/TixnEU/H7DM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWtwG9mwBj1MOgswVm681VVipVbOtffpoj25uh127+GNKe6rfyjZV5WemcCSgaJqZtQfrVA0rzLqOXwKnMqCzQ7gLln6Fmfx/DhX/No2Gw7xtbKtQJ7BTTNrCVH6OWZUNHwNLu7eewKb3wTf0tIlGjvljmqtJa8OatVVS3N+wD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FCA0153B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:06:45 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49D0F3F59E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:07:05 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:06:56 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/arm/malidp: Silence informational message
Message-ID: <aEqmwLRzpNDlNzoK@e110455-lin.cambridge.arm.com>
References: <20250523064042.3275926-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523064042.3275926-1-alexander.stein@ew.tq-group.com>

Hi,

On Fri, May 23, 2025 at 08:40:41AM +0200, Alexander Stein wrote:
> When checking for unsupported expect an error is printed every time.
> This spams the log for platforms where this is expected, e.g. ls1028a
> having a Vivante (etnaviv) GPU and Mali display processor.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Sorry for the delay in replying, I was on holiday when you've sent the patch and
I've only found it today.

Patch looks sensible, so Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

I will push the patch today into drm-misc-next.

Best regards,
Liviu

> ---
> Every time glmark2-es2-wayland is started on a downstream kernel raises the error:
> > [drm:malidp_format_mod_supported [mali_dp]] *ERROR* Unknown modifier (not Arm)
> 
>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index 34547edf1ee3c..87f2e5ee87907 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -159,7 +159,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
>  	}
>  
>  	if (!fourcc_mod_is_vendor(modifier, ARM)) {
> -		DRM_ERROR("Unknown modifier (not Arm)\n");
> +		DRM_DEBUG_KMS("Unknown modifier (not Arm)\n");
>  		return false;
>  	}
>  
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
