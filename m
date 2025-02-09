Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1A4339A8
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 07:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739085225; cv=none; b=jheP8QsdBY/F6DOY9sIov0bY7a5LW6yIlxqNJAi9JvZ8RDM1w2QX7I77z8O/dBm9TBwU0jp83K1uncJ2rpxdPWfiJplrYvwsGfp+5Jc5Pekt8PEayh/JA3pdwrCxpW483/MQ3COZ/bOpYU8cnjgkgMBeXx/K58X+fGb7gmI5M7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739085225; c=relaxed/simple;
	bh=A/qGb8T3jFQ0pdXHckUzuYWThswI4N2hG/4Wi8ovQ/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAElVe0J72s45KD++fYmfxJt7VwmbG2z5lzBXevLS4anofk2nCoYozOipi5ZOVQa+taBM8GWXfwe694yhqqTbn612paDC5+nIru7c+VMy/A3EkWqx6DpL+0QQ3181lRrVlxtBbP0gVig18Uf1TAkXNABJ1pf52Zxi3Si1dpi4vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H22PzmZ7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H22PzmZ7"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54506b54268so652864e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 23:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739085222; x=1739690022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtoBvvBXq+A0pmEk8CYvl82BZLR4W0Y0AGuR33DODy0=;
        b=H22PzmZ7MVsTRSCQGomDlHIYFMxWM1CebscKs6Li9OGncyG4qz9XUWSnQd0TqEThHX
         q/H9Om816Lz6Xm9BVAU1UsDvwwFBHV07cBcixxaad/tucmXRIY+P/HMx6QmjgLCP3NM9
         RGpd8bPLSXo94aEOangNS3/hsq5Kmtej8F+3JIDoJp1aaQspn95S39VKB09F8vHoNEsK
         9bu52XYVyrUpvOg4PqjZCB0XvCYq3xSzZz7w2z+XHe480REk6/VWZKKlBTK2mpbU20zf
         YMPRjg9fo375edt73LqCiC4MaGB1zfReWUeNNqukuP0rkgpN5245z4djSnIngCVZpctd
         dC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739085222; x=1739690022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtoBvvBXq+A0pmEk8CYvl82BZLR4W0Y0AGuR33DODy0=;
        b=t3h4p95qzIxB4sUUDPy8NaT3CyM7m+fCzbNI1FY6/k4VOv3yDPQUdn7cfCJvm/D31i
         yKMqXaVno1nAOYi0oEM84KVTvPb0/jmL68l1kazIXZtiTXjUIxM46WD/SUz6sVJQqQ3D
         4QIMCE1byHnFcNRCFX36FBPn0ySQXtCbGO3SCRs57w0eTIaogdPhDEqVG33xweLCifU3
         ZCcTDPZEocpDR74fVjxrFkJ7b/QzPDJGp7idc5fiLBV2HdBPEoFucMvCbjieVbTjP5N/
         sAn3sff00Hg7ni3M5NOKCKuo0F++kDi8+GpEbc2g+eXcXSjtCuwxMzLkYWB+vJIqd9Cn
         sf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzmhEi9JQlGuT/0bFtwxcLFxth5pMbXu2qutB4lw8OGBMs4NyQgWGOJOnDYumKfemm8b5oZ7VlCaUj6I4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgbqtqyJkOqHhN4kWSslAVpdW25I02sfkrsDpCTSGvS/F3rAD+
	cT8KEMtPjIBKBhM5j8HTZXHiywo1O/P/oLLVes73+kGJ4P0qH30TqZwVD2MHJkI=
X-Gm-Gg: ASbGncsYDX/xO9Te7V2lcclRMChrVajhZDT42ZLTfw/ERcIMKpTdkGfAkPcuVCxfwm9
	XxkU0xeLodZuB7CsN2vhnD/tAqBUfCVRp48mZwd2Kyii84io0HcRwbaPaKSEJkFmTI+vMouKzFd
	NbUNw3flbxdsixHlxj9WEvcf+2WyOLV0Gm375jt0Xk5sXzI+dITH+USI2psbe31BV/00Hfid1NI
	/FS+Kq14nNxtHxuba1f0C+0wQe1jywqr8/4QbEdvNlDiGrmK67bg6ODNCjPTTFcEKSszrz58CQC
	Em54eH+FYHFOmiB+4GIERBIJidP7sqgDEputfaUi9gcHx0vv2r04YmrOR9huaHkafz4gj2M=
X-Google-Smtp-Source: AGHT+IF7hBwAZTOtRcKe0RFZ1UYJi/AMkXIy2pYb2WFwL5WWDW5zDesgsgND7laE6YwFlpNuTstNbQ==
X-Received: by 2002:a05:6512:3a84:b0:545:76e:31a with SMTP id 2adb3069b0e04-545076e0d5emr783312e87.11.1739085221671;
        Sat, 08 Feb 2025 23:13:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed1bsm905288e87.50.2025.02.08.23.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 23:13:40 -0800 (PST)
Date: Sun, 9 Feb 2025 09:13:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 34/35] drm/bridge: tc358768: Convert to atomic helpers
Message-ID: <nbghrrl74xsuzomp7d6qjfosxfiooezipppjhxkx2ibnlpi6rj@b6ovgosmpuhl>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-34-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-34-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:58:02PM +0100, Maxime Ripard wrote:
> The tc358768 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 6db18d1e8824dd7d387211d6d1e668645cf88bbe..6ff6b29e8075d7c6fa0b74b4fec83c5230512d96 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -601,17 +601,29 @@ static void tc358768_bridge_disable(struct drm_bridge *bridge)
>  	ret = tc358768_clear_error(priv);
>  	if (ret)
>  		dev_warn(priv->dev, "Software disable failed: %d\n", ret);
>  }
>  
> +static void tc358768_bridge_atomic_disable(struct drm_bridge *bridge,
> +					   struct drm_atomic_state *state)
> +{
> +	tc358768_bridge_disable(bridge);
> +}
> +

Please change corresponding functions into atomic_disable() and
atomic_post_disable(). Calling sites have access to the atomic state, so
there is no need to have yet another wrapper.

>  static void tc358768_bridge_post_disable(struct drm_bridge *bridge)
>  {
>  	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
>  
>  	tc358768_hw_disable(priv);
>  }
>  
> +static void tc358768_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +						struct drm_atomic_state *state)
> +{
> +	tc358768_bridge_post_disable(bridge);
> +}
> +

-- 
With best wishes
Dmitry
