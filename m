Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FF14C8F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811502; cv=none; b=X/JFWpkOfMuq40KC0MXjUyT29N84MYivDwAYbgSIknpnp4v+PfPSQy9ujR7bP1LULWVfIp4oOG2Pv17voTBE++q/rc56qUJOQHV5ETXSGoVGt6LUH8yCm8iVo95zhdHG3XJpdn7YuV2gZbOUHKiWEcu31v/vsbNjF1O4PoKkHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811502; c=relaxed/simple;
	bh=EZRWe/yifMQuPKPKULExrvJUU2qjfPAZUZptOCGg194=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8ChVY2jxtw9ZPiKmGve3t2W0CgTbmCgJufRHOfKtvnP/MHbmh7mxEkb96qiqLtDnvwOW/ZNCg57HNQagfljlnl1JM9J9LadjYV9iD7ViW2g4dgNA9nZcwq+IeElu9zJ6Qpdr0aqaMAuumPU5OKQiMUH8q08xL97uPB9WSibcuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GvcfBsFP; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GvcfBsFP"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53f22fd6832so519434e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738811498; x=1739416298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=riZEsBjGD+WMkPhrq6w9Y2zbnt1QJbZcmX3HYuho+5I=;
        b=GvcfBsFPelbE04OYnMFtMOWDxZMvpQ7SYEJtSn+m/doY8qX3La2xbScNI0NYTluxcT
         e5JFWQ4D4/NZDrVaJSmDgKZzpm2ttDxja9TbGiMY92zgtqpFFhEzS5qfeWpiQCfwpszv
         K0+dqXM7QkpJ1WO9QS7Lz8bRuAcDvth8+UYicvGu2uiNRba1hUIGm/g2PkJqdh8v0jKd
         jeFpMXX/iK8FQoxf+OXydHzL9L1v9JwkcuZAxsOhlzembu9vtTRZLj4HPZNjXnpkXph/
         LX8a9p/Ai05fMrPSGa55aw0VRspFXEHst11td+8MWAJY6RYqgIemCjTceY+gcqPm8g16
         SjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811498; x=1739416298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riZEsBjGD+WMkPhrq6w9Y2zbnt1QJbZcmX3HYuho+5I=;
        b=k8mK+2rcNeOgEwIxx67qidTvBhP9F2W4TJNq7XZSJnVZejAP8MM7HtfRG54KDCoI3Y
         l8Od4MC2YoBfTzUOQC2ImGs/Ih1h+k/dzUalOlFn4Yk0SyntQHg6+e0b/i8YbrPDAs4A
         2WJJwdpEjfJwjh9smiKsSignXueEqnz4FNVktL5mUjOoumB/VJOA/5KHBl51w0pnzTMK
         45pvhDwc7PgSSSpQu6bG5SBaD1wf4Gib2Jm/O4yEaO4GX3eTQ4K+8vFNjtCU082YoBwy
         It0boDaizd8Gdk+gHlUG03Qxb0feRtoxBg29UKzdr2agWjX3LrjHIwsYpIKHqAHdGums
         vLRA==
X-Forwarded-Encrypted: i=1; AJvYcCUuR640jGCqEXFjzdu6/evMuHICeXN4+ZlcLyRLZ/Rap1cV4U5O4yWfnztB/KitJBmenC4jck0xXEW06u0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6IpuO0C5laPfZRDl3LeP+TAR9qj12vhXg47b1yxD6g4ZTkWD7
	rytX4fh016EJTpr+DmsEEEPW+XrxKgZuytDsuddUoeTf0l76e30Ll7wvc4rTl7A=
X-Gm-Gg: ASbGncuJnZByX0j58/BKoM2mdgBhnuoyarEfcOiHgoJgxpovplyCDQNxDdKx0VnV70i
	R81Mdinu6WkV5zXrj/ytm85mz1HbzPamy5KmCi4mefrUUaKYnqVI1QN2vaNHnv6A/6KYAF4wic9
	QH8+PepNm2YElHU09MhqN4oa1ojdWSAVEdKxZ4dJhf1h/ZoJ3c0D9PVHFVKNd40p39DKE1r/RsI
	YPaZAOHhGJI6SmLZw309eGUWcKkA+/h5rP9gSR7/7gt8yhy/uBUjMfISTCp5c5NVei1Wm9Q6XQd
	Hi5vwUOa+fKhnwPB4joem539UmfE0uhur/iDdAzl+p8Cu81mzvYutxHkKlBF0980gqqw39k=
X-Google-Smtp-Source: AGHT+IG7cQyWk5BClZUOKBlAbFSkmSlCgj+5e1lmNN+0LsHPGyFIdpVIo0QGlnaSeGvuHE71RAIFfQ==
X-Received: by 2002:a05:6512:3f07:b0:542:2a29:88ed with SMTP id 2adb3069b0e04-54405a68aecmr1721549e87.44.1738811497642;
        Wed, 05 Feb 2025 19:11:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f336dsm20237e87.201.2025.02.05.19.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:11:36 -0800 (PST)
Date: Thu, 6 Feb 2025 05:11:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v5 3/5] drm: panel: Add a panel driver for the Summit
 display
Message-ID: <jubbid3i7revhr4dg2dp6mbnja3yvrndwncppfx66ftnryx47d@q645nyfiaav4>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>

On Wed, Feb 05, 2025 at 11:10:52PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This is the display panel used for the touchbar on laptops that have it.
> 
> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig        |   9 +++
>  drivers/gpu/drm/panel/Makefile       |   1 +
>  drivers/gpu/drm/panel/panel-summit.c | 132 +++++++++++++++++++++++++++++++++++
>  3 files changed, 142 insertions(+)
> 
> +
> +static int summit_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode = drm_mode_create(connector->dev);
> +
> +	connector->display_info.non_desktop = true;
> +	drm_object_property_set_value(&connector->base,
> +				      connector->dev->mode_config.non_desktop_property,
> +				      connector->display_info.non_desktop);
> +
> +	mode->vdisplay = 2008;
> +	mode->hdisplay = 60;
> +	mode->hsync_start = mode->hdisplay + 8;
> +	mode->hsync_end = mode->hsync_start + 80;
> +	mode->htotal = mode->hsync_end + 40;
> +	mode->vsync_start = mode->vdisplay + 1;
> +	mode->vsync_end = mode->vsync_start + 15;
> +	mode->vtotal = mode->vsync_end + 6;
> +	mode->clock = (mode->vtotal * mode->htotal * 60) / 1000;
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	mode->flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC;
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +	return 1;
> +}

I think most of the drivers store mode in a static var and then use
drm_connector_helper_get_modes_fixed(). It's a matter of taste, but I
think the latter one is a nice helper.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +static const struct drm_panel_funcs summit_panel_funcs = {
> +	.get_modes = summit_get_modes,
> +};
> +

-- 
With best wishes
Dmitry
