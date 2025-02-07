Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE090374F1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896961; cv=none; b=LWQ9ATQOEgWkkMzkpCaZJ5K2MH1NV7UhsdQiOXLreBaab+std096GdGVkqOgTOhG6y/+098AW1vRXHCy2BKxTf/I0SvBbUUkfZSxdx4+3qYx58DHNwOUgtQif5qQZJyKt9YTzDXrxQbRVwUpImsfF8ZgvQfX+OkPEDk+FpW4/R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896961; c=relaxed/simple;
	bh=KNb2sPbBvRi60mplWVUb/wlii3cfAV4CqRauzhDNtCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twwqbgMT38aZhG8Ruz66DT9ow1CQ8N6fPpCgdrnRS+j/f6zaCcklj/CMyR+em7WP7y1vu6MPkqvJoSaQ+OfvXiqr1svTR0OdzmZW5Zcq2S+mZU3DSo6VoLh+4fkTOOrzRfYChLXY+Etc8sinh3PTdyy6MGwbAd9oTzsO2levQqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMBf4RwG; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMBf4RwG"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3076262bfc6so16541641fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896958; x=1739501758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Byca7B+SvHo9poDjpj+NTEDwW3aW+UfYwBPg1UM/mI=;
        b=XMBf4RwGsmhuRwtQAsirsOIv84QEgaJvPpSFTNH+UgALobIPwpaB2LnEPHIId6goW+
         C2w3WIslfaq9V66RdgiSTVFet59K3NNerDV8FMCW+RGzTqeTfWh3qxeN9iPUPewn7ZxW
         OLH4YqiUjZ7tWNZZq1AukrPW8FsTB+zJfQ7LgUXelbSt3vgzG0ailobXLf70v3eUmmnQ
         SNHT+4dDOVqGv287VOd+M03MKqZWu2hMqj8YUqtTEQlZZO8TgCW6AtxERqTC3hKYV9qw
         RdibvpTGTISGrM13L3OdMcS6NFySbNYIB6vLBeA3/wPtB0kL/97AttTQgY141yD/qPzq
         C8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896958; x=1739501758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Byca7B+SvHo9poDjpj+NTEDwW3aW+UfYwBPg1UM/mI=;
        b=uAQgxQkZ5dm9IREp80RkkCJCG0me8iHizqu4cX58YhonYbnodyxpByk77kEH9D68Ze
         XVuGw7ReIL4wNVE6P+T6HrZTQObog0+yp4SZBQpVE6c/DFOrMNA2gTdoAvpty19kgC+6
         Ul2KHJSGuuWfe3ADMlIkSolQpb+AKtAyJ5rShAevhGJ3GqppGRvjbcVDFbQwpKMMTjRQ
         7vdXvoNiim0fTm0zf7cF1OODTxo1bNVRCK6uQjnCw71V7zYPRI5QD/FC0A7FsIPTcnnT
         nHiNL1PVPdB8eHZPDFlNvtNEPTBI3debJhM5Bz4eZvIzu7JYD4g6yaQmuMKi+xE5Uqcc
         4Hyg==
X-Forwarded-Encrypted: i=1; AJvYcCW9sWBZfwmf5yciA+417nEh5bKqW0gbewFvQ8TgweRjlnF83Ji4vM1K7KU7Q+g3JIjOJs3vQsUy0GCb3E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHuf4Vr3tCTX9u+WmqGEdROnOIDpjSHX/Tke/EhhrtYLHwx9CP
	67iDVexdoJqZuUxZshznmWcgVEVnel2I6lIwj9drPYZjT39EDnYESJJusglIEb8=
X-Gm-Gg: ASbGncvOWMkp7AestLCO4INdJ7fv6S947SKkegqlzwPQUPttbnsv6zkZubNaENxRaX1
	IONR4OFcqrwEWB+GAoWC/RkusN/BSD8Y/RJxgcVm/JZjzJ6n0nNMMlZEYZt7+ugFSMl0/Ih+qkv
	VFSF0tPuLorLSedoMsxFAbyzXc3rYKpKbFHi7DAfaUmSqgFiRXzULLSqQto25mwF3letofc5O68
	DgXM/GmU1aUIDoKdvxJDx35D4FUHY7XYQvHrYN4hOJ7XFW97OMm1Abg6Mus2rQ1E3al1j/mUIzb
	BXcu05zSU7HlhVq1TO5rs0jqYf9r3U+fEYlCNY/D7zlVoHgqtLfiu/S1KKOxDaDfrFSnOMk=
X-Google-Smtp-Source: AGHT+IFZ4T7u0nGpfUVwU5s+4eCkQKYR6Jj3XEJ5v8Yh2TBgTlWEdJadPmr9h+8Pcw7MtkjpxzqCxQ==
X-Received: by 2002:a05:651c:892:b0:2fb:8c9a:fe3f with SMTP id 38308e7fff4ca-307e5817d58mr4571041fa.22.1738896957912;
        Thu, 06 Feb 2025 18:55:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2d8efesm2799391fa.88.2025.02.06.18.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:55:56 -0800 (PST)
Date: Fri, 7 Feb 2025 04:55:54 +0200
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
Subject: Re: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
Message-ID: <hc6llejnkhj5uaj5o4fof64hmderfcbfkrburv7nmqwzq2jnin@nac32akftsbm>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:26PM +0100, Luca Ceresoli wrote:
> In order to support panels described either via graph links or via a
> subnode (e.g. "panel@0"), this driver uses low-level deprecated functions
> to find the next bridge. The resulting logic is complex and duplicates code
> already present in the DRM bridge core. Switch to the new APIs in DRM
> bridge core that allow to do the same in a much cleaner way.
> 
> Note there are two slight changes in the new logic intended to improve the
> final result:
> 
>  * the old code looks for a subnode with any name except "port" or "ports",
>    while the new code uses the node passed as a parameter
> 
>  * the old code looks for a subnode first and falls back to a graph link,
>    while the new code uses the reverse order because graph links are the
>    recommended device tree representation now
> 
> The first change makes the code more robust by avoiding the risk of using
> an unrelated node which is not describing a panel and not names "port" or
> "ports".
> 
> The second change is not expected to expose regressions because, in the
> cases where both a subnode and a graph link are used to describe a panel,
> the graph link should point to the subnode itself, such as in
> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> 
> As a further cleanup, use a temporary variable to assign dsi->out_bridge
> only on success. This avoids the risk of leaving a non-NULL value in
> dsi->out_bridge when samsung_dsim_host_attach() fails.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 55 ++++++-----------------------------
>  1 file changed, 9 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index f8b4fb8357659018ec0db65374ee5d05330639ae..bbd0a4f5a3f52b61bf48f10d6e8ca741bffa5e46 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1704,55 +1704,16 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
>  	struct device *dev = dsi->dev;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *remote;
> -	struct drm_panel *panel;
> +	struct drm_bridge *out_bridge;
>  	int ret;
>  
> -	/*
> -	 * Devices can also be child nodes when we also control that device
> -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> -	 *
> -	 * Lookup for a child node of the given parent that isn't either port
> -	 * or ports.
> -	 */

Please leave the comment in place (maybe rewrite it slightly).

> -	for_each_available_child_of_node(np, remote) {
> -		if (of_node_name_eq(remote, "port") ||
> -		    of_node_name_eq(remote, "ports"))
> -			continue;
> +	out_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
> +	if (IS_ERR(out_bridge) && PTR_ERR(out_bridge) != -EPROBE_DEFER)

Can it actually return EPROBE_DEFER?

> +		out_bridge = devm_drm_of_get_bridge_by_node(dev, device->dev.of_node);
>  
> -		goto of_find_panel_or_bridge;
> -	}
> -
> -	/*
> -	 * of_graph_get_remote_node() produces a noisy error message if port
> -	 * node isn't found and the absence of the port is a legit case here,
> -	 * so at first we silently check whether graph presents in the
> -	 * device-tree node.
> -	 */
> -	if (!of_graph_is_present(np))
> -		return -ENODEV;
> -
> -	remote = of_graph_get_remote_node(np, 1, 0);
> -
> -of_find_panel_or_bridge:
> -	if (!remote)
> -		return -ENODEV;
> -
> -	panel = of_drm_find_panel(remote);
> -	if (!IS_ERR(panel)) {
> -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	} else {
> -		dsi->out_bridge = of_drm_find_bridge(remote);
> -		if (!dsi->out_bridge)
> -			dsi->out_bridge = ERR_PTR(-EINVAL);
> -	}
> -
> -	of_node_put(remote);
> -
> -	if (IS_ERR(dsi->out_bridge)) {
> -		ret = PTR_ERR(dsi->out_bridge);
> -		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
> -		return ret;
> +	if (IS_ERR(out_bridge)) {
> +		DRM_DEV_ERROR(dev, "failed to find the bridge: %ld\n", PTR_ERR(out_bridge));
> +		return PTR_ERR(out_bridge);
>  	}
>  
>  	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
> @@ -1784,6 +1745,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
>  
> +	dsi->out_bridge = out_bridge;
> +

Please move the assignment closer to the original place.

>  	return 0;
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
