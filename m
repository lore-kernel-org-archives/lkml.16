Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B72417E0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896081; cv=none; b=kVS8cgiNegbaLhebJ4iQQHn3Vtt9EUepqQNB+0P0E3U4atIX1Mx9pcxuIrbyaMnz0Q3C/ET9dcwewskaIWmblvFw0f61Xo9cRBDBjbmYYh4Q8+nE0Cn6wMVH4DrOxRB0m3HNEjz6NvPThv6YqYSSHmReEJMP1mbcwRCej2yeLKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896081; c=relaxed/simple;
	bh=+LZfcpIOmiITwYj9vNeVhLICYbYqWfe5TpcWVNjixpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8d5xYlrwin+assUieLb4ary7SgA9ZpkIJSk+H6I4o7bxytN3AuS6NrIFvudQ7Kexd4vl5IbE+5x37gYz2L6BjMuEjjlvG5JxBdC7yi48BjBAHdL73fYd6X7cMvLpossoX5JjbOaPvivEmViJKg+lDqRkaEUpX95kj6iRwFNdFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k3iMu5zC; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k3iMu5zC"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3072f8dc069so16291601fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896077; x=1739500877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd0S048MaszlErqb2pMIxhAhVHzJ2amWO0CFkcTTMIM=;
        b=k3iMu5zC99UXUGd9FVCsNLN+wrZrIIooLc+AxGBsVgFeF2tY6uRh1kIMxfXd8bSmUw
         tYyznOhJ6ucNuuNOVGKx4fwX4hfjNJSa0lzgdGEyWCH9VzJj2CojJA0PDbxjI/1Sv54M
         BJKm+lj0BpgkQZktReKrgObXiDhn9Rq/GQMNVw9UNSSQt+c0+l5jF3LXF1+zX1RdemIC
         WjzoPNPuF98BxaFsHbOxi3PH55m6wgpcfdBcCIQPIPyURznzCXXWkPZ/8QUgS65Dj6eQ
         FVEUGq4ocL3CDzG9xvEZUhTISLl4K7jg8VyFikNysEBmFcBytY8imX5M8WwvxGORB7Ou
         a/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896077; x=1739500877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jd0S048MaszlErqb2pMIxhAhVHzJ2amWO0CFkcTTMIM=;
        b=LwaH8XkEQHa+8eB57tQhCuXYIjIEervI3z7JEb2JkILzIi3meTnp+74Sbw2KFSXi9g
         uYCojclen25B3eC6E8c8ZOf3W7MXoXNffy+tnq9EdUdYU02FhaGd5igJ9fu44J80K1aG
         Ei8IyPdu9SXzLZ3+7l8R0YNEPkdpOmiq8CZ9QMRcvTvOehUsgpxjWZC/IRBvmMsL2uyn
         R5oDOEcqcYMWo+y7GyeWQqFjQFNmVL1k5ucQcxr8dYnPvJ3ZKWSY7C1S60YhZpMkCE3p
         urr9PDCbHHFC39ZkhNEvFf4QcEtdN5WUuLENZfCN/6hWCXbuPqjOVAKuMRyBtZHuBo8d
         W9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+VfzXjSWhVZtv3eySGN/OSW0ymQld+lUfjYNrJJEbbHFO2X33N/TxQxV2Wesc9eYTtdrrRNKSIG9mbWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzGaC1/KLrLMAjZ7/jI7uIeh/qiQOcADoci+g0P5AMXKzAjRwF
	3r4T6KaaYIZNhF7xPCzTSPtmMjaYkENgp+8BxNhaj11c+7mvVt5B+a7UsL5YGzc=
X-Gm-Gg: ASbGncsL5NS6UtrJT6b9PhVqZYsh7tGOgBGXqyadkdk8vc1BEMOcoai68wYrPFawBvv
	YHE3wctYk2IKQbsATTFRcTNZD0ZQ9F40pQTE/6/OyMYAN8GDfursSRk4POxc/pUd+Za/rPoKXZp
	pQtf0+gGd/esNqq7X00ZbDiHrw56IkWCg2lw6JBJkxsuec2KMhjTuWD6gjuC0AM5pRFAtXwZnSI
	2Ot3UiTok93GzxOUM5spZ2y9uq7PysR9/Q5RLGa905Uk+uftzDwWZD7hTz7wMvCtC631OHCQbY2
	4QiRi4bzdHohz5whK+Z9L4cYqgjZXpllpXI0w3HugxzzGyXlIr3sJF4pUfZnJx/CO82OWc8=
X-Google-Smtp-Source: AGHT+IEIcd1sCML4fLg7Ve3DlNewsN2pmF2R25wfRsiSNl5rJY8Hp8NDfnaEsylPnGJC1zPGHr481w==
X-Received: by 2002:a05:651c:150c:b0:300:1f12:3d54 with SMTP id 38308e7fff4ca-307e57cb21fmr3904511fa.1.1738896076944;
        Thu, 06 Feb 2025 18:41:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de177cc4sm2954991fa.7.2025.02.06.18.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:41:15 -0800 (PST)
Date: Fri, 7 Feb 2025 04:41:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 05/26] drm/debugfs: add top-level 'bridges' file
 showing all added bridges
Message-ID: <vnmkwcqv74y6qxbgmq7s5fkodjxiaow3hbob7xacfw2n6tyuth@ldddeoshkqdp>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-5-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-5-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:20PM +0100, Luca Ceresoli wrote:
> The global bridges_list holding all the bridges between drm_bridge_add()
> and drm_bridge_remove() cannot be inspected via debugfs. Add a file showing
> it.
> 
> To avoid code duplication, move the code printing a bridge info to a common
> function.
> 
> Note: this change requires exporting bridge_list and the mutex protecting
> it.
> 
> Also add a comment about bridge_lock to make checkpatch happy.

I think, exporting mutex _and_ a list is a bad idea (especially since
they don't have a proper prefix). It might be better to make the
bridge_print() function a more public one (and name it
drm_bridge_print()) and move allbridges attribute definition to
drm_bridge.c

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c   |  5 +--
>  drivers/gpu/drm/drm_debugfs.c  | 70 +++++++++++++++++++++++++++++-------------
>  drivers/gpu/drm/drm_drv.c      |  1 +
>  drivers/gpu/drm/drm_internal.h |  9 ++++++
>  4 files changed, 61 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 241a384ebce39b4a3db58c208af27960904fc662..87cebec2de806781cee22da54d666eee9bde3648 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -195,8 +195,9 @@
>   * driver.
>   */
>  
> -static DEFINE_MUTEX(bridge_lock);
> -static LIST_HEAD(bridge_list);
> +/* Protect bridge_list */
> +DEFINE_MUTEX(bridge_lock);
> +LIST_HEAD(bridge_list);
>  
>  /**
>   * drm_bridge_add - add the given bridge to the global bridge list
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b2178864c7ee12db9aa1f562e106b2f604439f8..7424d5237e7615d63de6bba572ee6050da6709d0 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -740,6 +740,30 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>  	crtc->debugfs_entry = NULL;
>  }
>  
> +static void bridge_print(struct drm_printer *p, struct drm_bridge *bridge, unsigned int idx)
> +{
> +	drm_printf(p, "bridge[%u]: %ps\n", idx, bridge->funcs);
> +	drm_printf(p, "\ttype: [%d] %s\n",
> +		   bridge->type,
> +		   drm_get_connector_type_name(bridge->type));
> +
> +	if (bridge->of_node)
> +		drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
> +
> +	drm_printf(p, "\tops: [0x%x]", bridge->ops);
> +	if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> +		drm_puts(p, " detect");
> +	if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +		drm_puts(p, " edid");
> +	if (bridge->ops & DRM_BRIDGE_OP_HPD)
> +		drm_puts(p, " hpd");
> +	if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +		drm_puts(p, " modes");
> +	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> +		drm_puts(p, " hdmi");
> +	drm_puts(p, "\n");
> +}
> +
>  static int bridges_show(struct seq_file *m, void *data)
>  {
>  	struct drm_encoder *encoder = m->private;
> @@ -747,28 +771,8 @@ static int bridges_show(struct seq_file *m, void *data)
>  	struct drm_bridge *bridge;
>  	unsigned int idx = 0;
>  
> -	drm_for_each_bridge_in_chain(encoder, bridge) {
> -		drm_printf(&p, "bridge[%u]: %ps\n", idx++, bridge->funcs);
> -		drm_printf(&p, "\ttype: [%d] %s\n",
> -			   bridge->type,
> -			   drm_get_connector_type_name(bridge->type));
> -
> -		if (bridge->of_node)
> -			drm_printf(&p, "\tOF: %pOFfc\n", bridge->of_node);
> -
> -		drm_printf(&p, "\tops: [0x%x]", bridge->ops);
> -		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> -			drm_puts(&p, " detect");
> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -			drm_puts(&p, " edid");
> -		if (bridge->ops & DRM_BRIDGE_OP_HPD)
> -			drm_puts(&p, " hpd");
> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -			drm_puts(&p, " modes");
> -		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> -			drm_puts(&p, " hdmi");
> -		drm_puts(&p, "\n");
> -	}
> +	drm_for_each_bridge_in_chain(encoder, bridge)
> +		bridge_print(&p, bridge, idx++);
>  
>  	return 0;
>  }
> @@ -802,3 +806,25 @@ void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
>  	debugfs_remove_recursive(encoder->debugfs_entry);
>  	encoder->debugfs_entry = NULL;
>  }
> +
> +static int allbridges_show(struct seq_file *m, void *data)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct drm_bridge *bridge;
> +	unsigned int idx = 0;
> +
> +	mutex_lock(&bridge_lock);
> +
> +	list_for_each_entry(bridge, &bridge_list, list)
> +		bridge_print(&p, bridge, idx++);
> +
> +	mutex_unlock(&bridge_lock);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(allbridges);

Should it be DEFINE_DEBUGFS_ATTRIBUTE instead?

> +
> +void drm_debugfs_global_add(struct dentry *root)
> +{
> +	debugfs_create_file("bridges", 0444, root, NULL, &allbridges_fops);
> +}
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3cf440eee8a2ab3de134d925db8f1d2ce68062b7..9b6d7bd16ba409b6a9155a9fecbec6bfdd5ea0c2 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1120,6 +1120,7 @@ static int __init drm_core_init(void)
>  	}
>  
>  	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +	drm_debugfs_global_add(drm_debugfs_root);
>  
>  	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..b6e875d4b25faae6bb0bb952c3c12bd4819698ec 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -48,6 +48,10 @@ struct drm_prime_file_private;
>  struct drm_printer;
>  struct drm_vblank_crtc;
>  
> +// for drm_debugfs.c
> +extern struct mutex bridge_lock;
> +extern struct list_head bridge_list;
> +
>  /* drm_client_event.c */
>  #if defined(CONFIG_DRM_CLIENT)
>  void drm_client_debugfs_init(struct drm_device *dev);
> @@ -196,6 +200,7 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
>  void drm_debugfs_encoder_add(struct drm_encoder *encoder);
>  void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
> +void drm_debugfs_global_add(struct dentry *drm_debugfs_root);
>  #else
>  static inline void drm_debugfs_dev_fini(struct drm_device *dev)
>  {
> @@ -241,6 +246,10 @@ static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
>  {
>  }
>  
> +static inline void drm_debugfs_global_add(struct dentry *drm_debugfs_root)
> +{
> +}
> +
>  #endif
>  
>  drm_ioctl_t drm_version;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
