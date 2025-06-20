Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86522397BF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422842; cv=none; b=H5h0CrjNvpSCHODRkL5vAiakjFdqW1I+rXasJC3CTZ1iwKio36V39EdfVI8J+9K/1awK9r8S6DLSS6Sa8BRHOR6n6FhcwUQj2z6hJVhkhbgumQM4XA2lsbeui5i2Uc+ONkYwAQpuMMyGzrNS1NLazB2M6oIS+u5StIGmJgUz9VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422842; c=relaxed/simple;
	bh=1MDKPZbbI/KdzS2StH/cBW6xEO0ojQedO0pGKXh7T6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBrVU2iJD7sU9khAQ31BxSXxRzlJj2C6N/oKC4E/05AJ6KPHnCui+qB5TgT73yXfkH5Z+eQATioScIQBh/l0pbAXICeth2FSkVCmd7qJNdtKPKL+myVvpBQMLOvMeRro5jZDSRR68XfHWP/kZNQRa6FTwYc90Y+xQ690yE9eG/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtZ78+yj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtZ78+yj"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234c5b57557so17278455ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750422840; x=1751027640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xD71SdW5peKOXqfnFLf71PUUXbnUP93dgxGEinYj8ME=;
        b=FtZ78+yjtqrJFOsfiVrAfvNowQx7csi2Y2vKZeHivd/+xapuGCtfbCtGhPju3UzhDR
         L54M1SauWX4Qt0yyYFS0rv0LsT3XUaHbC0o2lOZNFneIfsLrUO7TItVgM/t1O6DxL+3R
         Y3nq/ngBbfT5Qzn7JI/SwWSDa7rwsjEC4HphVPJIfAxnHAKbVxTncdqrxGqNsP2EKzd0
         K2N12IciLuqlLO52/C13o4uG/Bdr3be2VSvLvWBRX3zG10GrRvvH7q55Yxwtn6IyKA8s
         vqiiPDA3GyEoqUu/ynR9ZMWBicoiNSbDWVRsaQxBm7PPGiSOahmjSu7ktlk6KYdpUbqz
         h2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750422840; x=1751027640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xD71SdW5peKOXqfnFLf71PUUXbnUP93dgxGEinYj8ME=;
        b=wYoIqq4/iAlJ5aDLAYUIjTNjl9paud33vmUtPhZz0DV2luzWDX1cMYQtVU4T2C7Yp/
         GozzxplZmQsUZPnH3cJQ+P7bKFl7ttE+IueBQbIlBUn32XQFlsb41o889X1FvbaPbKod
         KqT6BTSXOIXfYUX/wXMIMGNUL8QTHx8bxiZH+M3IlKP71Har3KFkNePHGyzqYKm7eeSZ
         T/bxWuXaKGcTEidduyJe3mvwtk3HZJzWc0a7Lx6U37y7qIcgD9au+YaREWV9Px5xuoP9
         zCFqqAxpHq48xzPqpRkifcsffV62APmuX4PUt0+MRiskOqjz1ojgIgZU5P9Ht9XRWuns
         zaMg==
X-Forwarded-Encrypted: i=1; AJvYcCUh7E5H3mT3t4YWECnaEsjxJagSGkDbhig3AHmTQJFSj5/nD6XaEU5NrGT4vHE4EKe0ctsv+QzZ+KKG57Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/YIqCotDRD38M1pPDxuxSWKVmhCFzr4HBR2WbCIMr88sB+fZA
	UlTGcBUcdkHK7t00HtKQ8td3SZluUhqrQ13lUBebSm//yEMh+2MtHkbC
X-Gm-Gg: ASbGncuVkgjezNhezYrhIUYKCOLoAcp8Fi2CiRYuNGpfEN0cYuGG2/PZ7Erv0oP3aAx
	29KD9lUxVa+/w0nF2fop5B/DDl+mHTHs9tmntATUMZVY+YvifsxUZ1vw7R6SObDzAd/p/Q6leP1
	HetUBzsOfahOjnpyzAuPAJYLO58WIcyFzVxp9n06srrw+t2o0XHtSu3Es3d6lw/5RJsIULLS3of
	lPxJsVy8FfWqKXzRaZh89BFYl/PI9Udj8Hk5TqBn3dXmhCpwJ+cBQTLjVTXfk0alroSEU2LU2rW
	R/H4zV5EpzgWYVKSLGlYbjSkrgREIBaDCEpoUkdbYfv9REm0RGjLyriXfatZmQ==
X-Google-Smtp-Source: AGHT+IHNKFm5yGIukI363S3mVHZokkhSd7/SyqBWeC5OnvO2eekuRR5ZQ+wr0su1YjcLk4a5Tvu/1Q==
X-Received: by 2002:a17:902:f546:b0:234:8f5d:e3a4 with SMTP id d9443c01a7336-237d977939bmr43326905ad.2.1750422839714;
        Fri, 20 Jun 2025 05:33:59 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c3:450a:5588:4056:772b:c07f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a854sm17056685ad.116.2025.06.20.05.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:33:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 09:33:50 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix init order
Message-ID: <20250620123350.btgncwhwuxjqok7c@hiago-nb>
References: <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>

On Thu, Jun 19, 2025 at 03:27:18PM +0300, Tomi Valkeinen wrote:
> The commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> pre-enable and post-disable") changed the order of enable/disable calls.
> Previously the calls (on imx8mm) were:
> 
> mxsfb_crtc_atomic_enable()
> samsung_dsim_atomic_pre_enable()
> samsung_dsim_atomic_enable()
> 
> now the order is:
> 
> samsung_dsim_atomic_pre_enable()
> mxsfb_crtc_atomic_enable()
> samsung_dsim_atomic_enable()
> 
> On imx8mm (possibly on imx8mp, and other platforms too) this causes two
> issues:
> 
> 1. The DSI PLL setup depends on a refclk, but the DSI driver does not
> set the rate, just uses it with the rate it has. On imx8mm this refclk
> seems to be related to the LCD controller's video clock. So, when the
> mxsfb driver sets its video clock, DSI's refclk rate changes.
> 
> Earlier this mxsfb_crtc_atomic_enable() set the video clock, so the PLL
> refclk rate was set (and didn't change) in the DSI enable calls. Now the
> rate changes between DSI's pre_enable() and enable(), but the driver
> configures the PLL in the pre_enable().
> 
> Thus you get a black screen on a modeset. Doing the modeset again works,
> as the video clock rate stays the same.
> 
> 2. The image on the screen is shifted/wrapped horizontally. I have not
> found the exact reason for this, but the documentation seems to hint
> that the LCD controller's pixel stream should be enabled first, before
> setting up the DSI. This would match the change, as now the pixel stream
> starts only after DSI driver's pre_enable().
> 
> The main function related to this issue is samsung_dsim_init() which
> will do the clock and link configuration. samsung_dsim_init() is
> currently called from pre_enable(), but it is also called from
> samsung_dsim_host_transfer() to set up the link if the peripheral driver
> wants to send a DSI command.
> 
> This patch fixes both issues by moving the samsung_dsim_init() call from
> pre_enable() to enable().
> 
> However, to deal with the case where the samsung_dsim_init() has already
> been called from samsung_dsim_host_transfer() and the refclk rate has
> changed, we need to make sure we re-initialize the DSI with the new rate
> in enable(). This is achieved by clearing the DSIM_STATE_INITIALIZED
> flag and uninitializing the clocks and irqs before calling
> samsung_dsim_init().
> 
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> Reported-by: Hiago De Franco <hiagofranco@gmail.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Verdin iMX8MP

Best regards,
Hiago.

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index f2f666b27d2d..cec383d8946d 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1473,22 +1473,31 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>  	}
>  
>  	dsi->state |= DSIM_STATE_ENABLED;
> -
> -	/*
> -	 * For Exynos-DSIM the downstream bridge, or panel are expecting
> -	 * the host initialization during DSI transfer.
> -	 */
> -	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> -		ret = samsung_dsim_init(dsi);
> -		if (ret)
> -			return;
> -	}
>  }
>  
>  static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>  				       struct drm_atomic_state *state)
>  {
>  	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	int ret;
> +
> +	/*
> +	 * The DSI bridge may have already been initialized in
> +	 * samsung_dsim_host_transfer(). It is possible that the refclk rate has
> +	 * changed after that due to the display controller configuration, and
> +	 * thus we need to reinitialize the DSI bridge to ensure the correct
> +	 * clock settings.
> +	 */
> +
> +	if (dsi->state & DSIM_STATE_INITIALIZED) {
> +		dsi->state &= ~DSIM_STATE_INITIALIZED;
> +		samsung_dsim_disable_clock(dsi);
> +		samsung_dsim_disable_irq(dsi);
> +	}
> +
> +	ret = samsung_dsim_init(dsi);
> +	if (ret)
> +		return;
>  
>  	samsung_dsim_set_display_mode(dsi);
>  	samsung_dsim_set_display_enable(dsi, true);
> 
> ---
> base-commit: 7872997c048e989c7689c2995d230fdca7798000
> change-id: 20250619-samsung-dsim-fix-58c8ec8193e9
> 
> Best regards,
> -- 
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
