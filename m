Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0938335BA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744837190; cv=none; b=Edg6EFqWce29zz+q/wT9XFkprcRIT1T0A49Wl9kVfy0dfpUDc+Rvy7vCSPo6kN+voEFWd7oM7BTdZyAdfWAbJALnCRbOV67J/RiRRp70LQ3FIbJXDZFn98tDmnHoY4qMaxkDV1FGQSa3B6ftnY/QRsE3K6ceVIepwydiUyEWlXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744837190; c=relaxed/simple;
	bh=deWvS/pCYdwXYcylIjax7bn7x+MjUR0Dszvf8HfUsCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4QTWmvAtZBpichVPKXMjI7icarF9Y1Tzf0IeIXP3iBakSyvKFbtaLTSFhs60jtQnMl7N4Flr0aZrfNcu0ZFzXtMLIl/3jtVH2y6wXhRJTtEMLTNLf8199jp6Z0Pe3AzHBrlaQrCaIpK3jE/hh4V4IlFE8vshtAjkEKz62mWLWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=CZ1BIkRc; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="CZ1BIkRc"
Date: Wed, 16 Apr 2025 16:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744837185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8Bbmvo4tKj5C4VL396l1mOEtkspO81djcj9UwqnEqU=;
	b=CZ1BIkRcDtnE3ZAKKbqB/V18JWsOvqYkhrDQnt+JxuvW0vple7/+cH/3qOVV0pXw7/uH3k
	qhJ8cgc3v+2Z3hulF0ARbwYJjt8QRAjk69ZWALAqefm/MOKoDRXxBaCgWjAQ8oArQKhdc8
	wfoS7NUIBuz+BcX/k/Nb/A4bNRGC/xMYebUsbtj168V0Ho/hB96o89rl++/Houxh7LQoqk
	8XxOT+O+qvM/uQbp3Ma9h/lhXOSxxN3j4AniP1jMh2S47mqw7jMDn/b3T6iXqg/G+696He
	TGNcgFqZ9AVsHbsdyF+wXayVs1rv7WtPLhJC5J0zz+jjPci9SB5/tGWbc6dlbw==
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
Subject: Re: [PATCH 4/4] drm: adp: Remove pointless irq_lock spin lock
Message-ID: <aAAaPO0lc6jCZE-m@blossom>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
 <20250416-drm_adp_fixes-v1-4-772699f13293@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-drm_adp_fixes-v1-4-772699f13293@jannau.net>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Wed , Apr 16, 2025 at 10:25:30PM +0200, Janne Grunau via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> Interrupt handlers run with interrupts disabled so it is not necessary
> to protect them against reentrancy.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/adp/adp_drv.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> index c6238fb059342eebafddd53650a499fea0079dea..abb42f57fe5984a8f0f4be7081fb6803866b5d5b 100644
> --- a/drivers/gpu/drm/adp/adp_drv.c
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -121,7 +121,6 @@ struct adp_drv_private {
>  	dma_addr_t mask_iova;
>  	int be_irq;
>  	int fe_irq;
> -	spinlock_t irq_lock;
>  	struct drm_pending_vblank_event *event;
>  };
>  
> @@ -488,8 +487,6 @@ static irqreturn_t adp_fe_irq(int irq, void *arg)
>  	u32 int_status;
>  	u32 int_ctl;
>  
> -	spin_lock(&adp->irq_lock);
> -
>  	int_status = readl(adp->fe + ADP_INT_STATUS);
>  	if (int_status & ADP_INT_STATUS_VBLANK) {
>  		drm_crtc_handle_vblank(&adp->crtc);
> @@ -507,7 +504,6 @@ static irqreturn_t adp_fe_irq(int irq, void *arg)
>  
>  	writel(int_status, adp->fe + ADP_INT_STATUS);
>  
> -	spin_unlock(&adp->irq_lock);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -572,8 +568,6 @@ static int adp_probe(struct platform_device *pdev)
>  	if (IS_ERR(adp))
>  		return PTR_ERR(adp);
>  
> -	spin_lock_init(&adp->irq_lock);
> -
>  	dev_set_drvdata(&pdev->dev, &adp->drm);
>  
>  	err = adp_parse_of(pdev, adp);
> 
> -- 
> 2.49.0
> 
> 
