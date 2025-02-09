Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BAC339A8
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739084797; cv=none; b=PLhdRMu/ZcaABvHfz+FXcW2hOQYZjQFbWktoFJIXXTX3QFPLCDrfPT6tRmQ6bzwi2mI+mHH2F7Mx8srrWbJ+eiBxEonvTFMsu7hH9YBG/aMufj66mZOUydhtZvvcR7cUWdwVvVXGgeAEqb5lARxdrQM92iSQnTaZAaWc7x/lYxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739084797; c=relaxed/simple;
	bh=kRD6aAnH5kH2AmxNRV8Elu8AnXI3ZmW86DV4PAeGA9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9jvAjbixH4sBu1uHnTtrkFpNhxA6JlH1WvbSInCmcT6Eqe4qEQmR+iWes1z2TNaOV5puBKziO/vlfBi6FYEEeGX3LTwCqf+hxc3lvh2BLuWC/uh+jXHRpKgsW9vg2v7VCcqDOXjKpxuz08TwVilaNCX45w1NJDXhY+ogtrvLxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nDUq1EO/; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nDUq1EO/"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54298ec925bso4218044e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 23:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739084794; x=1739689594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3gtecDF1iEe88AdH66OfxEN34baIE59vMgWfXFwAPM=;
        b=nDUq1EO/RUuv58byX18QUnk8tnV0UiIaRWaqymXV1p4Kv8V4Mo80x8X2IuOfon2w21
         Z7NzMHa4uJ7DXZ0cALS+g3mscoFX9Y9//LVpsLTafFQEkqQ6Si99SuBI+IkhPUJuBTCg
         wH+IcS3fi/rRHJtVOIV9RO9FWNeUiRUA/t0SfM5YyQDuvfVirqvSlZ6Q6+tL5EkajW7H
         hjefcsj1oumn7bb3vlF3KXp+di1j45M3cuJlqTFZSTUBoeg+d5TsrUEKO21UhkdMiWf9
         +vuyKWtHmDP3pNH2/vKNEZTawR4h1odUMR4z7KVCprJMohAcEiaBZIRjZ6JcFXx1rlLm
         3mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739084794; x=1739689594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3gtecDF1iEe88AdH66OfxEN34baIE59vMgWfXFwAPM=;
        b=sMMflvxIov+LCgCjS16btgNUTGadu9L/BvPZsBcG4KE8+lx/NzwUUMn/4E5RGUzu9Q
         2vNhV+8peNdd7XP8vPynZnXqP01QVVvaZR4s+NzVE4VFvqIgiae+qsaBXXMc7aVXq//b
         y+uwYm/g+Zg6PVv2zy9cP2q5jZF/kivlVdAdn2AmgMEWWqRIo0U+T79c9L4950kALsaX
         2sssz8jGkD/EpdIwA4TfulnOHfmW1zFuuXlyGfgLxkry8fO/eljDvbgq5+9vk+Cu/sT1
         9lCBSE89cs2OWyA+X3gM59eMuCe/84/FJKzXK4YPx8TXFIbcE0FhhFDZytdBh5SfUYJu
         qovw==
X-Forwarded-Encrypted: i=1; AJvYcCUPKudiuWveXZELyJXDo1FqV2lAnAqkXwFsawHbgscxUGqiF3kIOKkdYbsoZkiKUiJDoHSEQ3MZ5lWZUeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWsvpjBw4XUM+5HVBszlykyq29Qrx2B/Z6WpDeACk5wlw6/cJC
	XxevEHW9TGGZ+miNSCqrOI1OqY1ZrrguLsaizS8ltOtn2THi79WrWFjpKp7gHxs=
X-Gm-Gg: ASbGncveY6tHKyGS3O5jd3fa/CZyqvNiag2Gc582tKq80AEAN1OtSmRTFcdxUpak3OL
	FetjtQK04LRng8OfUzwgT3qrY+Yxrax4Zdem2usnyPnRyWaLj1oXwwt67GbVmuAn6XEOtFXuIfd
	ZIQWOg/8T9PE9AONu4CtQN7SS4qvGCm+ZXSpezTA9wqZMXUtH2euZInr3xbG1uYRFSLi7qs1nnU
	TGMGxja2U0N4ebF8n+ybsicuXB5rR2wBtNimH6ZHLerGT/7QdueYWOiT7ntJOkXLOPVEbUEy62G
	hDBo5PN3wiqt9w71zgpov6dabKy7RJUAHszGkIb9D1CaFEGt94q6IHOFELzXY0PuzWPwvMs=
X-Google-Smtp-Source: AGHT+IGO0y8ozaQ7emnIBAm8M2EFteZN5PwoZ6gCGixdrslK91jOmK/vbcZBOUZkLPqMpDulnadkxQ==
X-Received: by 2002:a05:6512:114e:b0:544:1187:26fa with SMTP id 2adb3069b0e04-54414ab68bbmr3094286e87.14.1739084793546;
        Sat, 08 Feb 2025 23:06:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450c3ad600sm758e87.243.2025.02.08.23.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 23:06:32 -0800 (PST)
Date: Sun, 9 Feb 2025 09:06:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 32/35] drm/bridge: cdns-csi: Switch to atomic helpers
Message-ID: <fhgqv3cvjktmgpwuaxi2bfz5iebpwuodhg4eiezvrznxi7zm4i@vsc3ukxo6uox>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-32-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-32-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:58:00PM +0100, Maxime Ripard wrote:
> The Cadence DSI driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer.

See below.

> Fortunately, the crtc pointer is now provided

Nit: CRTC

> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 27 +++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 8f54c034ac4f3e82c38607a0e52d4745654b571f..c856e7843f83b363340443dec1deb26c9ae1b912 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -654,11 +654,12 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  		return MODE_BAD;
>  
>  	return MODE_OK;
>  }
>  
> -static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					   struct drm_atomic_state *state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  	u32 val;
>  
> @@ -674,11 +675,12 @@ static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
>  		dsi->platform_ops->disable(dsi);
>  
>  	pm_runtime_put(dsi->base.dev);
>  }
>  
> -static void cdns_dsi_bridge_post_disable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +						struct drm_atomic_state *state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  
>  	pm_runtime_put(dsi->base.dev);
> @@ -751,15 +753,17 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
>  	writel(val, dsi->regs + MCTL_MAIN_EN);
>  
>  	dsi->link_initialized = true;
>  }
>  
> -static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					  struct drm_atomic_state *state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  	struct cdns_dsi_output *output = &dsi->output;
> +	struct drm_bridge_state *bridge_state;
>  	struct drm_display_mode *mode;
>  	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
>  	unsigned long tx_byte_period;
>  	struct cdns_dsi_cfg dsi_cfg;
>  	u32 tmp, reg_wakeup, div;
> @@ -769,11 +773,12 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  		return;
>  
>  	if (dsi->platform_ops && dsi->platform_ops->enable)
>  		dsi->platform_ops->enable(dsi);
>  
> -	mode = &bridge->encoder->crtc->state->adjusted_mode;
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +	mode = &bridge_state->crtc->state->adjusted_mode;

And then it also follows crtc->state, which might fail for non-blocking
commits.

I think a proper way would be to

connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
conn_state = drm_atomic_get_new_connector_state(state, connector);
crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);

>  	nlanes = output->dev->lanes;
>  
>  	WARN_ON_ONCE(cdns_dsi_check_conf(dsi, mode, &dsi_cfg, false));
>  
>  	cdns_dsi_hs_init(dsi);
> @@ -891,11 +896,12 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  
>  	tmp = readl(dsi->regs + MCTL_MAIN_EN) | IF_EN(input->id);
>  	writel(tmp, dsi->regs + MCTL_MAIN_EN);
>  }
>  
> -static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					      struct drm_atomic_state *state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  
>  	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
> @@ -906,14 +912,17 @@ static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
>  }
>  
>  static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
>  	.attach = cdns_dsi_bridge_attach,
>  	.mode_valid = cdns_dsi_bridge_mode_valid,
> -	.disable = cdns_dsi_bridge_disable,
> -	.pre_enable = cdns_dsi_bridge_pre_enable,
> -	.enable = cdns_dsi_bridge_enable,
> -	.post_disable = cdns_dsi_bridge_post_disable,
> +	.atomic_disable = cdns_dsi_bridge_atomic_disable,
> +	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
> +	.atomic_enable = cdns_dsi_bridge_atomic_enable,
> +	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  };
>  
>  static int cdns_dsi_attach(struct mipi_dsi_host *host,
>  			   struct mipi_dsi_device *dev)
>  {
> 
> -- 
> 2.48.0
> 

-- 
With best wishes
Dmitry
