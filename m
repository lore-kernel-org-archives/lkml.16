Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1077485270
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896569; cv=none; b=aNmdd9HmKByVV/uXd/jn8Hw9/TwvGh+txJsgaPivW7lI+RMNGoYbrqKPvw//EapWWishBnZZvW+UV1zJGDc43MsReKVn+XrrmTyMpeJIslN/lm27Rzkc/5oxZHku20MR7HuO+zFJub6Sih27zP/NV36n/2r2ekDcjbXtayniDx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896569; c=relaxed/simple;
	bh=z+3SwErCQCLpR/cq6xUmSY+6RvMLMGu6uTKAf+5gJfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kie/yPD4Nf3Ta1Gypeg4ygtEvfzCvaYirNtxvrqmn2NUv+h13ndy0ZGT1jaUTJxdG9RcA15F/gm3q17IXXZdtWuk+tUYx+C0hGtUPtRm/Zt5nt+2Q5jo7YazpmF+1OWCNpTPkmrgKo9uaXSEfzFagYH3QMyl1rwz+Z+WMCznSJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X2EjD8BT; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X2EjD8BT"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e3778bffdso1649608e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896565; x=1739501365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x1QxMKnddA91WCGvSvK0Kv8+Ui7raPxM47ZCxWA1T70=;
        b=X2EjD8BT5DuHplKeAdGLI6jeC3j6Q3FLAGL/7rX9QrOFhds3q0p3eR1nu4yTHDPnrU
         seDVokBEa2LTnzm7s7O/xbh9D41vCYg/asXTMbZ/pG1cSDbpjPq4sg3B7joQnY+yABOQ
         nUQFv6k9yr26+P4WZHeDqSgjUR9MphLJPx5o7KYgDyx/Ztc/YgOR3k3ddw6yvAemAd6D
         W9ruXL7eDjRxvLDOR7KH+0dhW+w6ZqWpZiGA/oceVkbNMGODO8ii2ySlEh1Erfa2t7k+
         iWR+ePRJHqJroYnVx1oPsiAu5MAcrns3g1bC3eqJTtEfKoOa8hLE3Kv/pC5VnGukAVSb
         zKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896565; x=1739501365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1QxMKnddA91WCGvSvK0Kv8+Ui7raPxM47ZCxWA1T70=;
        b=qz33oXg7cQvqUxURf5hH4WkRS+OjG38xLclhZIbl7EWvr7uRNJFevOvfI4f2UR8kM0
         eyhSMZGFli2RCGQnJI6BoSqenfFlttESBJuQNRnJRjbFIDukHXT1CvxCAvjtoBNo2eg5
         b+lSr08gjz1qXM2TW5BrCpeZ045OSTE3cdKezeFV+NT8lx/t7T054sdm2WMPwB2g5acW
         ds5nhE4kEMptXPRXuHcUKjyt0/Ph7jPIru7WpJtGKN4iTkVwLLVCj9UgJo5FEoJBYRy6
         MW6IwnkYm20Dku9MhOF+8WR83qYtjNMR74gtTEkZa1sQiA98FoAzaiGhpHRY2FFZiA8d
         7Jyw==
X-Forwarded-Encrypted: i=1; AJvYcCWaUE+1fS3rLsm9ICC1qvmXz3eFVCe7SDEbX+fXZnDUgb6IgEH4yjELONfzBSjYXrmlCtN/3zybB4ryvBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrCBjLuIdkIdj28hQuv8DXY64fPVsnBiqQnARXSvPKjp6FxOFe
	hXQElILGQjGMG9tL9LLLcpumirrqTCTaO96HsFLwzhX/Gw7hpXUgpGEeM0nOeMA=
X-Gm-Gg: ASbGncsbucU63tJKAuWoVWhPnuuC5DtdpP3KHRo5oHNoPnOTPG5MSiTFAZZZmcqnfD9
	90qYK2Wds2ggOGB7sxGQP5ttxcVdOrleAraynXeEyXiD79h79gR1XSQxvwhj1VQhs4+pG8aPjTg
	RA+7QHwSjuuyw5gxFsYXm5a6VBDM/W4+LjUDA+MOn6R/YRN48J7E6eXso8ShN+PtMBdF/2kgMg4
	hjPEuCifx6sGU6jcg5dC5y4N06Ha5CkTF3yD5M8MMYUo0d9EhEXEdYFj40ih/MhgSuoLaGPuiWq
	0xm7TUYl7tkG0kyjx96PDw8ud/uorhulnkzOl8bYkQicxjk9hLRqt+SV7Vu0HI60hcNA7GY=
X-Google-Smtp-Source: AGHT+IFTPGY2nzRLHllSo8hDFl+TxXnd4EtAypxnHw3YEBN2TqXVdM1x8iFz55a0HF67J/9VnE7uOQ==
X-Received: by 2002:a05:6512:70e:b0:540:1e17:10d2 with SMTP id 2adb3069b0e04-54414ae5f0amr254436e87.49.1738896565019;
        Thu, 06 Feb 2025 18:49:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed63sm300364e87.41.2025.02.06.18.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:49:23 -0800 (PST)
Date: Fri, 7 Feb 2025 04:49:21 +0200
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
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> Adding a panel does currently not add a panel_bridge wrapping it. Usually
> the panel_bridge creation happens when some other driver (e.g. the previous
> bridge or the encoder) calls *_of_get_bridge() and the following element in
> the pipeline is a panel.
> 
> This has some drawbacks:
> 
>  * the panel_bridge is not created in the context of the driver of the
>    underlying physical device (the panel driver), but of some other driver
>  * that "other driver" is not aware of whether the returned drm_bridge
>    pointer is a panel_bridge created on the fly, a pre-existing
>    panel_bridge or a non-panel bridge
>  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
>    but the "other driver" doesn't know whether this is needed because it
>    doesn't know whether it has created a panel_bridge or not
> 
> So far this approach has been working because devm and drmm ensure the
> panel bridge would be dealloacted at some later point. However with the
> upcoming implementation of dynamic bridge lifetime this will get more
> complicated.
> 
> Correct removal of a panel_bridge might possibly be obtained by adding more
> devm/drmm technology to have it freed correctly at all times. However this
> would add more complexity and not help making lifetime more understandable.
> 
> Use a different approach instead: always create a panel_bridge with a
> drm_panel, thus matching the lifetime of the drm_panel and the panel_bridge
> wrapping it. This makes lifetime much more straightforward to understand
> and to further develop on.
> 
> With the panel_bridge always created, the functions to get a bridge
> [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> the bridge they are looking for exists already (if it can exist at all). In
> turn, this is implemented based on a variant of
> drm_of_find_panel_or_bridge() that only looks for panels:
> of_drm_find_bridge_by_endpoint(). In the future
> drm_of_find_panel_or_bridge() can be progressively removed because there
> will never be a panel not exposing a bridge.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---------
>  include/drm/drm_panel.h        |  8 +++++
>  2 files changed, 66 insertions(+), 16 deletions(-)
> 

LGTM, minor issue below.

> @@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  {
>  	struct drm_bridge **ptr, *bridge;
>  
> +	if (panel->bridge) {
> +		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
> +		return panel->bridge;
> +	}

Shouldn't the rest of the function also be removed as you do in other
cases?

> +
>  	ptr = devres_alloc(devm_drm_panel_bridge_release, sizeof(*ptr),
>  			   GFP_KERNEL);
>  	if (!ptr)

-- 
With best wishes
Dmitry
