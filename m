Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291B5176AC8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896290; cv=none; b=UIYLnXSuUQJo+QNkbVUdUw4ZdT617FmQunZe/72jGtZee6Jn13fkrct2HNT392n18U0UtAfuVBZu8GayaDRlNuzurHk4ywoVctmE/zoPgbMa9WRpZg2ME0ZEizc0HQB54YBGaihUK3T6RfG3Jq0fLcea1wOnQ5uwOZfykuUCI2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896290; c=relaxed/simple;
	bh=njpUqwl/r4pQN1u7M/lKGAXXUSRWblXXzfDwGSSvc0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1p7Z4K+zuYoFMilivk6KwyaqXoTaEf+Mt1p3IB0Zeeni2GTjEji86VxhoVp+wml6oeqb3H1wvMHFZM6wnpy8KA5knlUiBZ59KbvQbpEi3j5yQ0qnYeZDzi/BdxQcmmjSknwHKN/XgdhmC7Bnkwl1OG4Ut0qJKfCPU4ITIJcSH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f08RbSE2; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f08RbSE2"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401e6efffcso1647539e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896286; x=1739501086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MQReq9xQ99y9zIKRJOryjTQFC2bFCDp3B7MQU03SZE4=;
        b=f08RbSE2MuL30HmuCmv0TXbRZl+m0C+o48eYS/tW/HmSH2rU1WNUmA28WjaDVSUz/h
         ZrI0kKhfoFsgJgiXB9a0KQckJVNrY8hBoSj0ySOG3HrAcDEx34A6HaAN4Szv96Sd9sF5
         Tx22zmlqrRuF6VdJMsiT6G09+J80VgqeFGDNZi3fwTAaicgUvXzowpW6HyhJea1lZNKZ
         llDmM3ENMIDyftS3suZTmmDd0WUGRcFgyEEzVn4e/pULXnmZDp4x4Yp2aKLwCC3rSGdg
         x8YG/R4iiBFEy5VXo/KPrp8nWh4749NCWeF+8jkTxWsZFOGFk+vwU4zK9Fn2NEKzBHtU
         QFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896286; x=1739501086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQReq9xQ99y9zIKRJOryjTQFC2bFCDp3B7MQU03SZE4=;
        b=ohRzPGMrp2PIUlZpKNr/DdxsCcGpp8g4A8kz788cGPXEXAMjq3x6ITcPcLHVxsdhpp
         0qoha5z7kN4C/IoTCuz5Qodg6boxYrrf+IJWrW7lz4HE1FEhT5lZMVz6hBqeEQKy6hYE
         0s0MlLsgCrg4W2ISwjgZK1gFZl8NQys0NBjtcF91ADQLxPW3FBmoDY4f4W2DETw3dryU
         0QdZFC9ziuahRPsPWb4T4lEbaYwV3rIWZRyK1dnYf3+LLbxAFp7JDEXsEquutojaHwlh
         O0tlJ/8A21x/ybHwCtT/3cCWAwvG80bva1U0JzkPLm6ENNbZrpjPfmwycGkTvMgpjWSC
         zH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoRBLWEU4ykMBZ1AerD1acA4UZXIqIM3fqt0fYtNNWWsUwoXM6b87/6IKNyahZ1yxYV0XjXexcWS179So=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYTWpc+a5M8bfsKI00c3i7qqH0Hdzsn8CbQRd1kmvrOw1ptHTa
	dvXsKR8QOr3xDdoRz0VYQO/3h3aNXrblYKhtT3NIVY49swFK/Oa4673i8CmTtBY=
X-Gm-Gg: ASbGnct2i4ggf6GiNM9PT0T7IgsStFwDyFw7fxuANV+bsz1aaEDu2nlShD3lqRZ/wR1
	m9tTWcTzZ1I9pg440oeL2CmROODmMMLNDj2WGPhO0L6ZPbRjIR6tNFhQe3j3K1ezYXg1846xcOq
	j3caRrvrH4bHNQ49KN783Rs036nxpjXA7Lt5C0efZMb65I/+yg8VV7RPRKJK0LwgXs6yYts/7gO
	XpSb60ghS5G8+sPfahNBPoRlAul5Fa0Ck9B3x3MijMZct4QhGLF0ZJedEdW62E8jNIJAGEi+GC/
	kMx91WU5wwxfgXc2OuRzVaPLY5D0TqgOMdIlmNPct8r/v9gL4g3L4CeITRpk/grOZCcTYDw=
X-Google-Smtp-Source: AGHT+IEMdrg6IaKfrHTFSkbGGZM6z3+o/AOEBo27rSaLzMBVYmx9IKsUOm6sC7QIz9laKpK7sx9QjQ==
X-Received: by 2002:a05:6512:5d3:b0:540:fb1a:af1f with SMTP id 2adb3069b0e04-54414af5721mr284630e87.39.1738896286187;
        Thu, 06 Feb 2025 18:44:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bf58esm296912e87.107.2025.02.06.18.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:44:45 -0800 (PST)
Date: Fri, 7 Feb 2025 04:44:43 +0200
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
Subject: Re: [PATCH v6 07/26] drm/bridge: panel: forbid initializing a panel
 with unknown connector type
Message-ID: <cii3ko3pejzmvz3cft2saw3biyx6yipcsemd3mzihzy7tyhsdg@zpmqujujwcie>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-7-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-7-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:22PM +0100, Luca Ceresoli wrote:
> Having an DRM_MODE_CONNECTOR_Unknown connector type is consuidered bad, and

considered

> drm_panel_bridge_add_typed() and derivatives are deprecated for this.
> 
> drm_panel_init() won't prevent initializing a panel with a
> DRM_MODE_CONNECTOR_Unknown connector type. Luckily there are no in-tree
> users doing it, so take this as an opportinuty to document a valid
> connector type must be passed.
> 
> Returning an error if this rule is violated is not possible because
> drm_panel_init() is a void function. Add at least a warning to make any
> violations noticeable, especially to non-upstream drivers.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
