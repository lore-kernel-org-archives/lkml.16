Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB315098F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894911; cv=none; b=ojsdp32BQrGWgLYboVGoqiBCOPz48MzwdjAekXP8HuoUNYFa7BdESch8ICG70MH8qzol6ZB96srjGNIo4OK7x4LPoi290bSdTV+5SYstEjiZk9xtdtiBydYzbsr/A2rM0SLurgEu22sDi/mDr7vEh+COlVrgbDzJOEPQJyTSQPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894911; c=relaxed/simple;
	bh=NwprDrTmE/wpQWc71fqFMJ+9Mlb8oEsxHNb1kniSsss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmmkG/i3cPVmeRk1i8Xj+tz2ed5ckiEviIpsi1Ha9O6OWj6JESVNpwT8FhEBOmCMZhadXyLwdwVAbO8/cirk6X7SwoG9TQmmXd0wLdr+deYLsIzX9yaFuxnfQ3ArbiLi5948E4i1DlpH1S55wn3r+gwX4QZT3iGlCY1PvwpPDns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dVRYGDXI; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVRYGDXI"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso1696609e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894907; x=1739499707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lzta5S0gzTGOLstB++0r/Lba8xmTnzwJ+9gzDMBGEjI=;
        b=dVRYGDXI1TjQl1PwYD/QdU4sXXB4fNRr9BLrBdLR7f+0UKAMLK6NYh1ZZI1Lgns+Pj
         d/BROoxx6wMQXGJdjPvVBNkWXGnnh184nYATow8HG2AbgeMrmRtB0AnnhS8+N3M0hGhU
         kEyNzVaLvruT8YlDcMxRnN4SM46v8oG6xIXfIbHfZfcJqGTsCbuIxgI8x8x0U0bP2fpe
         9hcLbhde1G7UTIWKOar/TV2t+haaA570E0yAKvKv8K6GE5rCDHW/OppSQxwK1PDJmWH2
         yv27+FFBaS1CyfVecw7Ecnn22onTome4C7z2KPnMwM44Hw3kc6vm19WZAJlitLUia7VS
         NRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894907; x=1739499707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lzta5S0gzTGOLstB++0r/Lba8xmTnzwJ+9gzDMBGEjI=;
        b=nmqWACyXflwsTBVBNiOVvPRgYHCseruWHXCVEJGM1wbJ0FIkKH7093cq4qOddfXL0U
         3x9ltIPiS2yhAPViogTMpWxQjl8gdnKWNYAH+GslVe4SgIXgNslAvRvBq7oFOKTfDaV0
         1d3K7x59+Cvnbyc9GGWK6nyi6X+8jzNkJ5MP9bovdEDVAiR7dStOjGTFohkFR4mhbhej
         E5CL2W+ptXfMHblvDSfh/Q1iqcXHtwISU9CqF/KbJR7mR0PQeHlpnSNKAJKtiSRrWhfJ
         gp3dgXWp1MVXXEHJV6GmXcuEtyhE1+Esav4vPu3FBlbNLJpnuVfj+WZki2IUfce8t18B
         pACA==
X-Forwarded-Encrypted: i=1; AJvYcCUjEAOjAHjreLTpAwKTX9dWlCr9bLP0fY16GFDDEcehF4whIpKbfYoLyjG1r8SByn9z6nr61Gv9CAYV67s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZUmrEFyvtWozLx4X+sjTu9NJrfyPAl3XP6XFUDk573YHjSFD6
	cifZDtskWP3dL6D09UCKpGhiOj9JJJEedXff7p/AfFnXwk6rFQ5uIwcxYgl28jE=
X-Gm-Gg: ASbGncu3BIR+UId18n2ERJIgN+nEa/zZS1IgmMBYxv0BZQGJncvkm0W8qDwBu6JRrpx
	xqUyNy+dS8gy30AIapSAhBi2IwDnwFZnE4pGkz1JC+JFwcSmf/bLHQjuLHbuzmSPyKiNmyf9XHK
	Vmhtwrzt/tZOK0M5JLBn2ZnEpS7JJb4H5bKB+wwdNSi55YrKOik5qpY3vkHa2ypX6GnMPuchO2X
	GgBxKeE7LyA5a/rt2/aTvTsyewk8ZDCE6ICgwLcGLopYNhn21e6fLXpYQogFUj49ppYu0cOT4yD
	EhPhIVlFGB8aLhtS8OAj631wsTGlS50W3K8wX8L2yHTQdhjjTHKP2PAQvWP6MpkidD3J62c=
X-Google-Smtp-Source: AGHT+IEEMycc7B1Xywi6/voRjDNNe0jaAwgIo39w5VQbQbJyRuz6zbWk5Cv25Kf+Od2N2WEWuA4GlA==
X-Received: by 2002:a05:6512:3d0b:b0:542:2388:3f09 with SMTP id 2adb3069b0e04-54414ae0b88mr338836e87.37.1738894907389;
        Thu, 06 Feb 2025 18:21:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053eb2dsm296973e87.28.2025.02.06.18.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:21:46 -0800 (PST)
Date: Fri, 7 Feb 2025 04:21:44 +0200
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
Subject: Re: [PATCH v6 03/26] drm/bridge: panel: use drm_bridge_is_panel()
 instead of open code
Message-ID: <yokzxkh2fobfvrvcsp72o7j44tnhhb7w7sf5ofvsuibivju2my@bpauhrvwpkmh>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-3-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-3-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:18PM +0100, Luca Ceresoli wrote:
> drm_panel_bridge_remove() reads bridge->funcs to find out whether this is a
> panel bridge or another kind of bridge. drm_bridge_is_panel() is made
> exactly for that, so use it.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
