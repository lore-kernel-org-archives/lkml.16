Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E61F1FF1B0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744837170; cv=none; b=G74HxYeutw3KA1RPGUQjFqjG4v4AVe5W6eeiA8+ZGCL2dOhA82H3D3j+PgK5iU2pV82t4sYJmoeRLjJIlq4SI/YdOwEg5Z90+GC3l6zSz0hG+Cn9tDKCSQx2I4C5vMzBcBEaJJKvuFodYQxTD8nbjuCoW8LVe+xBo31I/LqvRLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744837170; c=relaxed/simple;
	bh=CKUjE84RQfThr2eBImwBJkQ3//Qg7TYoT/eOJY1Fkmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iky1AXJlHY4MdX04HWLumixwTxNazxWHUiFPB7gO8e+u+Q8ZDGBBGXMhhYB/4hkXDZ2aP/xoIcLlfzoB5oCW0vD1wJuRKvwJyZayDUDBlcfUMqk5ysI+cX1LcFySV1yMLcqC8h8ixAGZ9Y1WbsqAP3XdR32bjzTBViL73danjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=O/8oRwAH; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="O/8oRwAH"
Date: Wed, 16 Apr 2025 16:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744837164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TvaLv2QNdfX5fSfGS64EBI+Z7WBX+FDFB//I+E9KN9I=;
	b=O/8oRwAHgPlyXtr3Pq/S4J2Zpf7RVhm1pjkM2X2NgnNlY7UCKk0OTOSFa8dlrIvOigv+3M
	EF56EJcREr1Mn/jIzudPxAWg9GZfyamDWyh57vYLwmoJv0D4EkFyehGc3syoA+z6WwK4mM
	0ZFyYgWh6UIKiw89MeBjfZe1xCrJhBnZDyaoEsIphvVcYMODPzaLAc5ohdKeGM1w7B4mra
	3F2/kDejYT+eXf46sXzQ1NUzi3V3m4LObmQCsipma5hbC9z1J7H4xDuyKrulZFhhUUzufT
	IZw0tRKMbdrnQG3qju6y//Lfm9tx+8ptsJ5n7JBK6m5V2LD3HXL0Oz0U8+b3Dw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm: adp: Enable vblank interrupts in crtc's
 .atomic_enable
Message-ID: <aAAaJ_6Y4VXRC3q-@blossom>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
 <20250416-drm_adp_fixes-v1-3-772699f13293@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-drm_adp_fixes-v1-3-772699f13293@jannau.net>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Wed , Apr 16, 2025 at 10:25:29PM +0200, Janne Grunau via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> Calling drm_crtc_vblank_on() drm_crtc_helper_funcs' atomic_enable is
> expected to enable vblank interrupts. It may have been avoided here to
> due to drm_crtc_vblank_get()'s error behavior after
> drm_crtc_vblank_reset(). With that fixed in the preceding change the
> driver can call drm_crtc_vblank_on() from adp_crtc_atomic_enable().
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/adp/adp_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> index 27119acac92238858d58a690eb4196dbb2ae0c1a..c6238fb059342eebafddd53650a499fea0079dea 100644
> --- a/drivers/gpu/drm/adp/adp_drv.c
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -288,6 +288,7 @@ static void adp_crtc_atomic_enable(struct drm_crtc *crtc,
>  	writel(BIT(0), adp->be + ADBE_BLEND_EN3);
>  	writel(BIT(0), adp->be + ADBE_BLEND_BYPASS);
>  	writel(BIT(0), adp->be + ADBE_BLEND_EN4);
> +	drm_crtc_vblank_on(crtc);
>  }
>  
>  static void adp_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -517,8 +518,7 @@ static int adp_drm_bind(struct device *dev)
>  	struct adp_drv_private *adp = to_adp(drm);
>  	int err;
>  
> -	adp_disable_vblank(adp);
> -	writel(ADP_CTRL_FIFO_ON | ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
> +	writel(ADP_CTRL_FIFO_ON, adp->fe + ADP_CTRL);
>  
>  	adp->next_bridge = drmm_of_get_bridge(&adp->drm, dev->of_node, 0, 0);
>  	if (IS_ERR(adp->next_bridge)) {
> 
> -- 
> 2.49.0
> 
> 
