Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8314D224B0F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836975; cv=none; b=qgO8Xwxs89rqOwUE3qcG5NJ1L3M6ULDIZe3Y2iVKeXcZ2EuNnwT1goUZWIwhFccQns2FyZd2JKRDg4Xc+5o+0cT+67mJJqUTFnTtkSKyeFn3bLfgbBCOZzNHsmKczJt2N3ydhb3mC7CTQoj3/oHLQ7OuPhr87+0Fibip5QUShRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836975; c=relaxed/simple;
	bh=JAIARXmR3Kz5ITv/Yj1nzC3PDT7n3WjRx/Stk3ybk4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzL4aEkIvlzAwpBcjmMHmC3n7u/X+kT/qnL1MRTDOvQ++xeAmaSU4DkWHFu6P8ufM8a5xkuMxjY41jfVCTnNvGRDvZNBYydNcshsU6TtTdR/qpPwHj+jZqhZk9JTh2Oy2K5RCUHiBxwRyH4hSP3aXoMaexz03OpAniE3DcFD7j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=xL7afhCp; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="xL7afhCp"
Date: Wed, 16 Apr 2025 16:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744836970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhVnOH0k9VWx9UfNNrD0I3JDKG9V0vMTdWVPEm7S7DM=;
	b=xL7afhCp98Q2ZuziuNCpCfub0SSIPQgn+hiZUhGyNtaUET3vccINgLsoVhqZE/5UqWuuQV
	wwbQnH6xjqQNGC9fZbaIBc0EaHHe+1bUt8k5APdyRrho24I87n0/AP1cBwyzf8tvgQSSfd
	SpR0KtR5jBfb9+KyTU7O0TtOrkjd8DbwAYCphygGaqGH6c+uHCL3eDeo7N5WGm5A1KTf60
	+Zn8RWvJX7QCea7bHKuuPKBQ3Ty5rrwglhy8vGgUTmFKvVNuLVqZoMIPc7gJs1P8FRSynp
	gtUxw40wx0H4VE18lXamqqcJQAIN1CQKqhPrHeA6oDMG7fMZg0skUp6kegHAHg==
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
Subject: Re: [PATCH 1/4] drm: adp: Use spin_lock_irqsave for drm device
 event_lock
Message-ID: <aAAZZjM5rA1_ON0e@blossom>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
 <20250416-drm_adp_fixes-v1-1-772699f13293@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-drm_adp_fixes-v1-1-772699f13293@jannau.net>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Wed , Apr 16, 2025 at 10:25:27PM +0200, Janne Grunau via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> The lock is used in the interrupt handler so use spin_lock_irqsave to
> disable interrupts and avoid deadlocks with the irq handler.
> 
> Fixes: 332122eba628 ("drm: adp: Add Apple Display Pipe driver")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/adp/adp_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> index c98c647f981d5383149647126762a5cdec8f4e4b..157298a8ff42b95275411dd4a7a0c70780fd86fd 100644
> --- a/drivers/gpu/drm/adp/adp_drv.c
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -310,6 +310,7 @@ static void adp_crtc_atomic_flush(struct drm_crtc *crtc,
>  				  struct drm_atomic_state *state)
>  {
>  	u32 frame_num = 1;
> +	unsigned long flags;
>  	struct adp_drv_private *adp = crtc_to_adp(crtc);
>  	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state, crtc);
>  	u64 new_size = ALIGN(new_state->mode.hdisplay *
> @@ -330,13 +331,13 @@ static void adp_crtc_atomic_flush(struct drm_crtc *crtc,
>  	}
>  	writel(ADBE_FIFO_SYNC | frame_num, adp->be + ADBE_FIFO);
>  	//FIXME: use adbe flush interrupt
> -	spin_lock_irq(&crtc->dev->event_lock);
> +	spin_lock_irqsave(&crtc->dev->event_lock, flags);
>  	if (crtc->state->event) {
>  		drm_crtc_vblank_get(crtc);
>  		adp->event = crtc->state->event;
>  	}
>  	crtc->state->event = NULL;
> -	spin_unlock_irq(&crtc->dev->event_lock);
> +	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  }
>  
>  static const struct drm_crtc_funcs adp_crtc_funcs = {
> 
> -- 
> 2.49.0
> 
> 
