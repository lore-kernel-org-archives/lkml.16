Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9010176FB0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896749; cv=none; b=NQUPRV3iPeGnhd8Z9IVENaeH2P5G9kgK4bSIvMjr37lOV3M8RYwGacHWuh2pTufKErFsNoRngkCILteP4HAnqKnJJ9Yxhcf4kKR2+9FVOAdRr+v2PqWFaClGZelXkc9Wm+cYNS6bcExv6ZVccM349H4VeuJuRqefpORHZuzMvfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896749; c=relaxed/simple;
	bh=1t71WYBdrLE20cTcFmQV2D/Iy3Kcvyu/rKz9io4HECU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqugDd/SV6gSnBnJIsaoMfK3HNREZg8gN6DsUNmDd3dhH+jiHmRMuwaQB+7710z1JqTMuaFgSmGaSioQNnz1RYNracAjVMEi8t3ETla7h729uXJiJnM0Rrxmmz8DLpNzdddeFVhRJ5bDFa+Wu2pWf1r3UJgiZo84RXs+EGxN21U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GE26Bumy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GE26Bumy"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5439e331cceso1931241e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896745; x=1739501545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h9F02/YDvnybxu8ztsJHZ1LF6k/z+auHcgxD1SfmGPM=;
        b=GE26Bumy6VioyU6IzsVF5/HzKDecnUOirCKRFdJ6dfRCA3F/f7AcHHvTCs177C6sS3
         2JsjTbXWTvPKwRxPAQgA2rrYS1YrPbTbEzBHVaYpvWyagT9Hwt10d1jeeAycvxlhzb7K
         rRdtVcTtdH3qjGRnly4zlKkGkaATZOzl516V6gmUnpEunAS92lXTQBTvKNu/mfgVvjT0
         xLg2Qhz1u7tkOqYzlNxQXOdEnEVgHUkWKCKf+L1/JK5Xl4U1SQwISkXARTyRdS+3r0+1
         NGSbh063/ONeEyr47bWUNU3Xtgb9aBzoSgrvhLHkh4IVy8YV4mM2Kq8ryELRIoIAFnI6
         BIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896745; x=1739501545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9F02/YDvnybxu8ztsJHZ1LF6k/z+auHcgxD1SfmGPM=;
        b=Aqd+f7MUQ2Dlu81rBJeLiwNrJQEjPcPEjhIiHLQCxPyqkjBch+6hKq+ZTIvcNbSbF9
         InsQttjOJ+hP7ehnXPTvtRv/KSW+f0RvnrhwIgO+LwLdY91hGWwAqoxXwmhbTTMibu02
         YuiLsTAC8Efdyx4C099hkDKkCdhf1XQCNuDxFESH21B/qWxz5qCXjLGqtZ4k24xdManL
         ES46jhiGgjd2iYn2IizvMXONYPgy/YW6rnWj1i3bFnFaWle9Y6tPZGirp5iT5pgSuldB
         IL3v0mYfFBunl+wjWvi2bn9T3KiJaV1FE33PHh7U9g1B7y7JPF3mGnhIm7goggnf3IBD
         GARg==
X-Forwarded-Encrypted: i=1; AJvYcCVmJxBDTPSWMRQUNZMjRENldlS1v0RWpW0jEKgl5oyiWnFvtt27XZhhN5n4NU9r5bkf3yg+WvwKrrmReD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtqyJpOKgoZCwRV9p98sSjg1OaUxnOLd2PYI5q0FT7rsHNctGp
	J2AtogblkDOBDfCaO2bBU20Tpo01zVpkYfWwtInBTiQvCg/Pbz3ifgnE5f3SmTo=
X-Gm-Gg: ASbGnctsi7G1OLcYt6adR2UgINzcvR6p+yO5lLYR2ZDdSb2e6ikkkJkBL69fDpt8Qvr
	E4ODrbLRjZ9kY51Av0642P+l+BVYKX45/y/eDXgibTF0xRFn6LIGET8Ps2u9VunfDZPoZoHez32
	4dhozZEfMB3YoPZ2TYUTz+MuaxbWlKTcQImWwUFM4xz22hzpTYQAZqkfCea1L/Jq49N1aSJqQRf
	AEoYcNGtkI2UfoqmRO80Qbx1d5BqUtcK1BLSEnrQQOMANlfdHmJkJLhxPFcfmZcbxqbSVgEjJu3
	fGGCuELLrMAD+KwtdVvNSlHcloQAyfKK/0LNcn/UQc1G/FvI2cm5JxkTi4muMqxOOAhwLSo=
X-Google-Smtp-Source: AGHT+IFgW897y8GZ6q7fIx1eveSasf6e4TKZyOYUknvmrPjaAmKxvvhWspCZkVzJPR5Pf1lTvWOAUw==
X-Received: by 2002:a05:6512:1195:b0:542:6d01:f55c with SMTP id 2adb3069b0e04-54414a962c4mr418596e87.3.1738896744794;
        Thu, 06 Feb 2025 18:52:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441055573asm309217e87.81.2025.02.06.18.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:52:23 -0800 (PST)
Date: Fri, 7 Feb 2025 04:52:20 +0200
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
Subject: Re: [PATCH v6 09/26] drm/bridge: move devm_drm_of_get_bridge and
 drmm_of_get_bridge to drm_bridge.c
Message-ID: <aayr7q6i3x34xw7ivvapnk6h6mgx67qhpv2rqk2gotejyjetwy@olb5lbwxd5e3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:24PM +0100, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() and drmm_of_get_bridge() do not have anything to
> do with struct drm_panel anymore, they just manage bridges. So move them
> from bridge/panel.c to drm_bridge.c.
> 
> Move also of_drm_find_bridge_by_endpoint() which is used only by
> devm_drm_of_get_bridge() and drmm_of_get_bridge().
> 
> No code changes, only move functions to a different file within the same
> module and add an #include as needed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 102 -----------------------------------------
>  drivers/gpu/drm/drm_bridge.c   | 100 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 100 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 6995de605e7317dd1eb153afd475746ced764712..1230ae50b2020e7a9306cac83009dd600dd61d26 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -418,49 +418,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
>  
> -/**
> - * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> - * @np: device tree node containing encoder output ports
> - * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> - * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> - *
> - * Given a DT node's port and endpoint number, find the connected node and
> - * return the associated struct drm_bridge.
> - *
> - * Returns zero if successful, or one of the standard error codes if it fails.
> - */
> -static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> -					  int port, int endpoint,
> -					  struct drm_bridge **bridge)

I'd say make this function the main API instead (and name it drm_of
rather than of_drm, this can happen in the previous patch).

> -{
> -	int ret = -EPROBE_DEFER;
> -	struct device_node *remote;
> -
> -	if (!bridge)
> -		return -EINVAL;
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
> -	remote = of_graph_get_remote_node(np, port, endpoint);
> -	if (!remote)
> -		return -ENODEV;
> -
> -	*bridge = of_drm_find_bridge(remote);
> -	if (*bridge)
> -		ret = 0;
> -
> -	of_node_put(remote);
> -	return ret;
> -}
> -
>  /**
>   * of_drm_get_panel_orientation - look up the orientation of the panel through
>   * the "rotation" binding from a device tree node
> @@ -1150,62 +1107,3 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
>  	return &panel_bridge->connector;
>  }
>  EXPORT_SYMBOL(drm_panel_bridge_connector);
> -
> -#ifdef CONFIG_OF
> -/**
> - * devm_drm_of_get_bridge - Return next bridge in the chain
> - * @dev: device to tie the bridge lifetime to
> - * @np: device tree node containing encoder output ports
> - * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> - *
> - * Given a DT node's port and endpoint number, finds the connected node
> - * and returns the associated bridge if any.
> - *
> - * Returns a pointer to the bridge if successful, or an error pointer
> - * otherwise.
> - */
> -struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> -					  struct device_node *np,
> -					  u32 port, u32 endpoint)
> -{
> -	struct drm_bridge *bridge;
> -	int ret;
> -
> -	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	return bridge;
> -}

Then these two functions can go into the header as static inlines with
the proper deprecation notification. There is little point in having
them in the source file. I think eventually all users should be
converted into using your new of_drm_find_bridge_by_endpoint() funcion.

> -EXPORT_SYMBOL(devm_drm_of_get_bridge);
> -
> -/**
> - * drmm_of_get_bridge - Return next bridge in the chain
> - * @drm: device to tie the bridge lifetime to
> - * @np: device tree node containing encoder output ports
> - * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> - *
> - * Given a DT node's port and endpoint number, finds the connected node
> - * and returns the associated bridge if any.
> - *
> - * Returns a drmm managed pointer to the bridge if successful, or an error
> - * pointer otherwise.
> - */
> -struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
> -				      struct device_node *np,
> -				      u32 port, u32 endpoint)
> -{
> -	struct drm_bridge *bridge;
> -	int ret;
> -
> -	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	return bridge;
> -}
> -EXPORT_SYMBOL(drmm_of_get_bridge);
> -
> -#endif
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 87cebec2de806781cee22da54d666eee9bde3648..2aa17fbe538b86066c4e68f0d0e8046e9ca9b965 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -25,6 +25,7 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
> @@ -1334,6 +1335,105 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  	return NULL;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> +
> +/**
> + * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> + *
> + * Given a DT node's port and endpoint number, find the connected node and
> + * return the associated struct drm_bridge.
> + *
> + * Returns zero if successful, or one of the standard error codes if it fails.
> + */
> +static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> +					  int port, int endpoint,
> +					  struct drm_bridge **bridge)
> +{
> +	int ret = -EPROBE_DEFER;
> +	struct device_node *remote;
> +
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	/*
> +	 * of_graph_get_remote_node() produces a noisy error message if port
> +	 * node isn't found and the absence of the port is a legit case here,
> +	 * so at first we silently check whether graph presents in the
> +	 * device-tree node.
> +	 */
> +	if (!of_graph_is_present(np))
> +		return -ENODEV;
> +
> +	remote = of_graph_get_remote_node(np, port, endpoint);
> +	if (!remote)
> +		return -ENODEV;
> +
> +	*bridge = of_drm_find_bridge(remote);
> +	if (*bridge)
> +		ret = 0;
> +
> +	of_node_put(remote);
> +	return ret;
> +}
> +
> +/**
> + * devm_drm_of_get_bridge - Return next bridge in the chain
> + * @dev: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any.
> + *
> + * Returns a pointer to the bridge if successful, or an error pointer
> + * otherwise.
> + */
> +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> +					  struct device_node *np,
> +					  u32 port, u32 endpoint)
> +{
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_get_bridge);
> +
> +/**
> + * drmm_of_get_bridge - Return next bridge in the chain
> + * @drm: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any.
> + *
> + * Returns a drmm managed pointer to the bridge if successful, or an error
> + * pointer otherwise.
> + */
> +struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
> +				      struct device_node *np,
> +				      u32 port, u32 endpoint)
> +{
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(drmm_of_get_bridge);
>  #endif
>  
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
