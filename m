Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936D81474A7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894953; cv=none; b=k+OWip/2KYc3u7uPwnIK8kEcmhl5ffobckpoUmEftkWM61YLeN4CWJCHQzJtHkT/QVnzqn1YElFs+MEUboimw1Zr24lAbGojXtHIs9Jk+g5HeGFSSR9k/Z3lEDuBJzdE/GxqyKziBt8VOPI1aA4eks1mY/nPg3pzTS3wvYZV8qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894953; c=relaxed/simple;
	bh=jvE8zKpfRmfKAz2BQ6sxAgZ6btqjmbBFLAixmmadIsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgkN6jN52L82yB48sGcvge85lWtw/h0cRSSW2+pHVfeaI8PAySZgxbURvtPTUfJ0eTiTpaL8M1HJ2jxu8o+vL2vmU+oNRJQL6sAvUdqZiRE8Z/lBUAnj7yT/97U86TdNP8rZ1AjrA7Pk5Tqr4ZcuCjzsfLl5HuMjzKkbx/TVLAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJw6UwpX; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJw6UwpX"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30761be8fa8so14040541fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894949; x=1739499749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ2zkKifpQ89f3hMtzxU+G41sKfC/86q4GHwa2AD6jI=;
        b=lJw6UwpXtiE+1ArUUJzsDI13yS2GsjlmNIz+LNRnkYGp8nKVtXdkDbOHSym4nINJsX
         WjiL0ugINjlqbAZHFlTKacCL/wSCZg5Yp3PdVqPuR+Xo+PmBJ4L9ywHhL0yKH6HU0Cop
         YIxmcXyJcBfzeVwMlMEUN+BvUzjf1cHlhq96TktHEf2qFfDGUeptozQnZ0GwkrvMUOQ0
         d4yRHEUez/1gIQxLrg43q7WhCZOgLDcJuQKWWdYRViMyXVTQWzdAtJXM4sxUjmCAD8cQ
         sjdbTZ4BlgyX/fhZRM2WyTGCZ4LUcfMJNFeMuNyOUsiPrBNZCqV2XPcB/NffZ/iW8K5R
         fJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894949; x=1739499749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJ2zkKifpQ89f3hMtzxU+G41sKfC/86q4GHwa2AD6jI=;
        b=WFcKe02yAblC5f8U8ImNyx0a0PgE4ZU/5SmgOfJtkSz1BquYhhZDs38t+E3z17IyL7
         ta15/mR2vM0oCKOW7dqgf4g/CPEOmpOuttummnXw0KOjrxP3vZJS3R+z/QI+fXSFPy/m
         hne3hqQv/3bm9GSPQXNHdq+Mib3f5lZIcO7Zh1wn6L0ZEFscHxPLkk3gvWprTAvKGL0+
         Ucv0vEDWaHJF3t3KFdmPqH9suix7t3kuFzGfjO2Q6eaFOHjIR/7zYFABtomsFfGTH606
         s0kr879t6VBavOBIwwmCvYywKgFrhCoV4n7EEzhwO9wMQD4L3f5z3eXu4KkAL823POXf
         e51g==
X-Forwarded-Encrypted: i=1; AJvYcCUf7oKyuGDXqVWMI/x8u2HObAf3dlZUMB9LmmKlnQqz9xGAQ8wAWBzJ2h78+AXXoiJuafY65onbdtBnNU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUPX3XkNCApqg20RLB5+GBSsPrgR16PO8fcJshh/Cv78+k1pvb
	h+fp6nl5dovZd5yJM41z5n1wdG/STGeGOFgQA0cZ4oKkb+Hu0vXXPLKL9pcHiZ8=
X-Gm-Gg: ASbGncvu7HOg+HzNiXYAQHCP4Hx4rnwNGNCtqngNlj9XYd12rQBcmgAoUaQ3h2GaIP3
	Ra0Y07Z1J4vMBD7ACD0b9qP2VHiYdCfymtAtdFxFmo/9ucHFUH9i2SUHLCM2NJ0DledBQjNN3fZ
	Sy3LKAjNtHyq92D3W5k702aLYGN3kjfu8snBzmhDrZk9Yof2Trj3JJZ/hoxDXs9funTZW9QPXr+
	kMGfi6/H+IpO7ZHzxQQpJAVuQQO8+0gC07FUIOh0Vtm0mGyM3EIg1sXjrAOaxqKLnAcCNl0Fwp9
	5hfsTj9Y6YcaYR6vQ2akgdugObb2Sm+zyhY6NGk/677+STHe8bGMM2thyBa5FYlb2tAUbCg=
X-Google-Smtp-Source: AGHT+IGYPeDLkcUcJNuKIyN2Hu1GKaefHM6B17kcLxSwD3vE/zsB8TapdQI7IpzwkzI9FScw1YMjSg==
X-Received: by 2002:a2e:be21:0:b0:300:3de4:ff72 with SMTP id 38308e7fff4ca-307e5a739e3mr2648431fa.27.1738894949030;
        Thu, 06 Feb 2025 18:22:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a67c9sm2915881fa.48.2025.02.06.18.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:22:27 -0800 (PST)
Date: Fri, 7 Feb 2025 04:22:25 +0200
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
Subject: Re: [PATCH v6 04/26] drm/bridge: panel: drm_panel_bridge_remove:
 warn when called on non-panel bridge
Message-ID: <cpe634qeg46gfph6diw7lshdiolnpmuik3nmd4fpayg4st5r55@5bcfdwjme7z7>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:19PM +0100, Luca Ceresoli wrote:
> This function is for panel_bridge instances only. The silent return when
> invoked on other bridges might hide actual errors, so avoid them to go
> unnoticed.

Is there a real case of something using this function in a wrong way?

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 0c5db13b11dcb90ee88b9932b91aa05fc48d59bd..c57036b06493a6922e2cae38bcd1733930ff0073 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -322,8 +322,10 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
>  	if (!bridge)
>  		return;
>  
> -	if (!drm_bridge_is_panel(bridge))
> +	if (!drm_bridge_is_panel(bridge)) {
> +		drm_warn(bridge->dev, "%s: called on non-panel bridge!\n", __func__);
>  		return;
> +	}
>  
>  	panel_bridge = drm_bridge_to_panel_bridge(bridge);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
