Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092502AF1E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738897286; cv=none; b=iNPEk5tzT5t2CpDu+TXHyap303m8wN/uDGDhdCeONjYCHQaEi3GoZNMJLHxIKSweO9Y/LhmP4LqDKp2oMq8U2F/VeFrSOYNFxL4LS7RMR+sepuFZ6GJcYFfHSbnMuEyMEnTzarhXJq6KqP8B09T1KfkcS59dflPBhjHh2MxnBoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738897286; c=relaxed/simple;
	bh=gJh0Lv3WVGZyLCoutcMcGnow+aK2BupFtmH5zSujVIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvdFsZ1S1AdAAFzfuEqXw9kX1fneocB2uEBtbUGfuuwAkhCmxV5DPaP5ihwi3zh2WINiIGb6k5bmjntLgZM1uokivzS3N56SmpVLe3dwqGIYi9s9kjRl3b6ebv3nKYAGZMzG3IqZLY1yIR2/q4oeW1ROY4jz9RmhOiiedgIMHMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TUPiE6Zo; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TUPiE6Zo"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30227ccf803so13881591fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 19:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738897283; x=1739502083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rv/3RFVNWDMcc5HMME46hF6itjMzUu60Z1kcevabBlU=;
        b=TUPiE6ZomkptDoUmK5LqPp+AtT4vn5y13yBebHrHZgV9oIY58xCIYKM9kVAUFUoYOj
         ezTanc8Sr6o7ORqc3BAOScyqYFrxWfzSwtmlZAvE7lalTt0G96nNJEMuexc2bAuyfUym
         SOiflJ3mzIU4W+J6KmENxChp0Gh/eJAzO2R8mBN2xD2CUN0ouvpO0Wxf/wauyItfxNGx
         ATXCKeY3Mwb0SXhd9wpkm+XNQzVHGga9Kvo0+dXDOL72VoTQZ6iRCHAghmsSH/VyJ2uD
         DyylZXe1Bd3JW6t2qgJS3RYoB3nAW2zeNX3wEx3VuQ1bDXE46R9CKQ/LDOqsofE0HA4d
         kR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738897283; x=1739502083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rv/3RFVNWDMcc5HMME46hF6itjMzUu60Z1kcevabBlU=;
        b=MxUF4utM9zZ7gtnrPeZxoPGPNM1XOPyCCy/EBYROyjLPbjivSW7B0y15nDoXNLpex+
         wPCzesCsHsQymkn0F+8VDP0Eoi4SmUSMaduiM8UfqBJojgN8R5CpaMOpS1kbQOGWKITW
         tr+yKVdLU0/Vn8SB+2b4PdAHw9xRWrnK047KlZi5GApzYkLzIzrdHGotSy5CKgay48uP
         fM60fR/VVuxlhIh2ZFSSumpS0t28RNkEn7+oIPDcEhmdD00H9MmLTkNtrAQKZ0JBFoID
         Ei4kuJLw8nigte3FPgsWWCVFTlODDMn3itO+QmT7ualVGArZbAmqpFgQE8p6tT6r289e
         k7lg==
X-Forwarded-Encrypted: i=1; AJvYcCULgFF2Zh12Yg3hWCc3KjErXvwR2Pq4Q93lnKTrXvvuuiZq2KNB0f6tZMo+iDvD2h4zpTW3ox55CY+xHFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YykFf+4qOXs/P/L+NKB3WHDVLV259Z/gSIrk1jJINXrXNlW5tVl
	p8A2yMtRBlnXaC0Lz7rJtymPZbBLOYe7OUzMVRyrrvRazCXBA+ehfG30OMLVbj0=
X-Gm-Gg: ASbGnctQVZj+1swpwY3LyEpKHjZKvVBHvUf+dXCM6Bdwk67l18aJl/yl3ghm3cYzZk1
	kWegE8aJ9EagUOXL5yMfEhboxOK2QRJVPTAxSIdjoe4cYmnJzucook+qxVlhQobYxaInpiAElvV
	Ya8WmnWHdvLo9DCG8vYvL6Sfp/435+KYmJTVn89V8UXKswBl7fabj2BaUdkL7bRcqrvaQj8SybQ
	hIosIST0fxCF1uv1m7r+GZsB5mhsaE2xTEom9uVjyjLQEPHxoFOmOIjIW8hpFF77a+YeWot2ZZs
	QTMBWwwGjpo6oIfQ+xfkeIvx/PHh9zKTGKW+ymo8F3+yZDpHiQYrOFgCdIlOPW1GEqPP5Tw=
X-Google-Smtp-Source: AGHT+IGDqEkE6OWYr0NcLlg1JR9sknC45WBuXsh87/ud3ljT7djhN2ztl5wAF/TJfj5OXo6RJ8lw+Q==
X-Received: by 2002:a2e:bc21:0:b0:302:244a:da2c with SMTP id 38308e7fff4ca-307e5a71d1amr2898811fa.31.1738897283014;
        Thu, 06 Feb 2025 19:01:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de18e48dsm2871441fa.27.2025.02.06.19.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 19:01:21 -0800 (PST)
Date: Fri, 7 Feb 2025 05:01:19 +0200
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
Subject: Re: [PATCH v6 12/26] drm/bridge: allow bridges to be informed about
 added and removed bridges
Message-ID: <5roxoodskw3ieksvzqezs33gcwhppeqikagu5462wljc6zylif@5ls7bmdusmq5>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-12-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-12-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:27PM +0100, Luca Ceresoli wrote:
> In preparation for allowing bridges to be added to and removed from a DRM
> card without destroying the whole card, add a new DRM bridge function
> called on addition and removal of bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v6:
>  - rebased fixing conflicts
> 
> Changed in v5:
>  - fixed kerneldoc errors
> 
> This patch was added in v4.
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 ++++++++++++
>  include/drm/drm_bridge.h     | 23 +++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b0834b8644284e5f7751cec81724af849b4180e7..1955a231378050abf1071d74a145831b425c47c5 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -207,12 +207,18 @@ LIST_HEAD(bridge_list);
>   */
>  void drm_bridge_add(struct drm_bridge *bridge)
>  {
> +	struct drm_bridge *br, *tmp;
> +
>  	mutex_init(&bridge->hpd_mutex);
>  
>  	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
>  		bridge->ycbcr_420_allowed = !!(bridge->supported_formats &
>  					       BIT(HDMI_COLORSPACE_YUV420));
>  
> +	list_for_each_entry_safe(br, tmp, &bridge_list, list)
> +		if (br->funcs->bridge_event_notify)
> +			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_ADD, bridge);
> +
>  	mutex_lock(&bridge_lock);
>  	list_add_tail(&bridge->list, &bridge_list);
>  	mutex_unlock(&bridge_lock);
> @@ -249,10 +255,16 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
>   */
>  void drm_bridge_remove(struct drm_bridge *bridge)
>  {
> +	struct drm_bridge *br, *tmp;
> +
>  	mutex_lock(&bridge_lock);
>  	list_del_init(&bridge->list);
>  	mutex_unlock(&bridge_lock);
>  
> +	list_for_each_entry_safe(br, tmp, &bridge_list, list)
> +		if (br->funcs->bridge_event_notify)
> +			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_REMOVE, bridge);
> +

I think the order should be different: notify about the added bridge
after adding to the list, notify about bridge removal before removing it
from the list.

>  	mutex_destroy(&bridge->hpd_mutex);
>  }
>  EXPORT_SYMBOL(drm_bridge_remove);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 1561347c4991dac6022319774510f9560c9283c3..ad7ba444a13e5ecf16f996de3742e4ac67dc21f1 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -56,6 +56,11 @@ enum drm_bridge_attach_flags {
>  	DRM_BRIDGE_ATTACH_NO_CONNECTOR = BIT(0),
>  };
>  
> +enum drm_bridge_event_type {
> +	DRM_EVENT_BRIDGE_ADD,
> +	DRM_EVENT_BRIDGE_REMOVE,
> +};
> +
>  /**
>   * struct drm_bridge_funcs - drm_bridge control functions
>   */
> @@ -729,6 +734,24 @@ struct drm_bridge_funcs {
>  				      struct drm_bridge *bridge,
>  				      bool enable, int direction);
>  
> +	/**
> +	 * @bridge_event_notify:
> +	 *
> +	 * Notify that another bridge is being added or removed.
> +	 *
> +	 * This callback is optional. Bridges implementing it must always
> +	 * check whether the event refers to a bridge they actually need to
> +	 * interact with.
> +	 *
> +	 * @bridge: bridge being notified
> +	 * @event: event happened (add/remove bridge)
> +	 * @event_bridge: the bridge mentioned by the event (i.e. the
> +	 * bridge being added or removed)
> +	 */
> +	void (*bridge_event_notify)(struct drm_bridge *bridge,
> +				    enum drm_bridge_event_type event,
> +				    struct drm_bridge *event_bridge);
> +

This creates a small issue. It requires drivers to have a bridge, even
if they don't need one - e.g. the drm_encoder doesn't get notifications
about the added bridges.

I'm not sure if that can be solved in an efficient way.

>  	/**
>  	 * @debugfs_init:
>  	 *
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
