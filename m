Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ACB79E1
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739084452; cv=none; b=FoRwXg476E6Rn3fmhEEfKlwjarIr0f4hT9XyBhsZ1HoV5R9zH+jYq/HijJCQPdy/N5JHWe5oOCY+CggblDicd63obhfMioxBzF/7iF8sNNASqqaPgCGmXOCNnMGwc4TstP+8JoELa0pFQShPNJYdUssnYzeUHOkGLEAzH/rvHfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739084452; c=relaxed/simple;
	bh=tRb6nEEPeXL1BQMXepmM08n5gG2kAsZHADVtcEHjNSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJUJ+i0HRyMBBN4FIuyq0oMxbFsVWGW1Db6vazqP+XxbZmEOf6z/2nFLiSQFkFrXxwQxc47I0o/oAC/ogpgs+OA/gI+3LDEMdccilRCqTWKGHDneeVF/YIqG5xTHz90f2hrLDR5d3vc83DJsbFwaqMS9Wzt1Px3IsfcceR9SP+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ziba82Z2; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ziba82Z2"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54508b026d1so286607e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 23:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739084448; x=1739689248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ke/v0zcSbRhluMj5/me33mYIoYLzSRKf+I/pzTCjOhE=;
        b=ziba82Z2ZYasKsZrf28jHUK+6UY24M7Q3v9Mj4fKwOTaPz1oVtOLDptG+mnSvwTyE4
         k1imh4X6DOVvbh0iPzbSaWjs07L8Pi5FgG87pKzRvJjO8xqKHmiaQRMwYRiUmgEMksPL
         hZ8GsmVO8bge5ylXn8lTNWj9RZy0iDoVrShjOXDKNfQM3Bj1ACnI24ywPoNB1uxz0uPG
         9EH6AQohFG1voar2px7zAQlD2ffe1EDP9wGYmIMsxqQVa3HIhXOQuhs+F/80eS//1mrl
         nYFQ/FdLAfajlCmu/tmW/pfe1F53NdEq9ufU+GJc+Ipo8bqlJ1MeQMLRq6Bufc+vLRO/
         nqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739084448; x=1739689248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ke/v0zcSbRhluMj5/me33mYIoYLzSRKf+I/pzTCjOhE=;
        b=SzAUoOmqZgwCnPG7jr9/SFEULtwO+0dVCEhtfYAc/CtugwAz0vqlUnLDAJ1qurjsEH
         Mc4eamk6HXYQXR/Axp8MYLiTmRhsuu3b3vcKkClkorcLAWVZMkw+Vrpp5qSb/MR1GRuA
         auDt4I4rinfZHFKrbbYXuIAdaZeZUisopDClWi77SEk6mqEoxyk+O1J8MXCSQEXsNfIt
         3+0bIZenuboNkRHS/3qRk6Psd1jehzniHWIyugGTGIsUtFWUxHsrVdcWJuTP4R9qtK2b
         f+lzdBSithW9PR6fRtdBJEZzuMN1KrYEL7Clvax2nshwtVS2dEY34ymRbaGbcyntTm6L
         sUlw==
X-Forwarded-Encrypted: i=1; AJvYcCVhR46HOas3Veoa9cYLCKHoPFichpV4SSnJLtjQs7IJatL6hY8DHPIUPL2j+pyKU/SxI4XYhHkkbFIw9HY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTeQkavkjzNrc32g0c+rGVf+yuRfYrOOp/I1Q6W5Cbtl6LMDdw
	t5g3UC7NtqPN5HsfTRcITkK4gj0rHGaYeFX0eWOf1xFnOe7WEO1EVGyDOUJQJrM=
X-Gm-Gg: ASbGncvIcuuNw+d9rp2WndQuWfLlDpqn2FOU4ywInVaGDK9uKo3mrO21BTq2s0x+YZU
	SLhxdEcbx6Gni6ysjG/xx63iO7uO9rFjHYN8OBAmXSixyrtEAufe+Qlp5sI0PrbITaw4E1cM6KJ
	3s0dUbbBojeZRvt47dSdrR0Xor2f0yexJHhCfQ4KWjLpTZ1iSFd11kfAv+Q9si4ZYPKR1GYG1Mj
	LGPKyhTiswZvIBULgb+WDLHjly0GoRMmGAILKZ69729MoOL65LvzdU9jFXRV5FmXaLDftdEv8g2
	0AMhmVYX4t1kTqs1aeehSKnuSyFo5d/12R5iJGRo3cgvAoOdXunQpLjNKeRMQ6m/cK06lY8=
X-Google-Smtp-Source: AGHT+IEWGCtofmuEwEkuJxpqGHPNiiv0ZSPga34PIfnpTkm+HFVLF7PR6GYzqouNn/0GIyXy1u930w==
X-Received: by 2002:a05:6512:114e:b0:544:1187:26fa with SMTP id 2adb3069b0e04-54414ab68bbmr3087873e87.14.1739084447927;
        Sat, 08 Feb 2025 23:00:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545043e99e4sm385822e87.225.2025.02.08.23.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 23:00:46 -0800 (PST)
Date: Sun, 9 Feb 2025 09:00:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 30/35] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <nclqj5lovum5cv7xhznv3hcuhxivl2vtky3caiduo3izbc4bcn@lmgyev4soj4q>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-30-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-30-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:58PM +0100, Maxime Ripard wrote:
> Now that connectors are no longer necessarily created by the bridges
> drivers themselves but might be created by drm_bridge_connector, it's
> pretty hard for bridge drivers to retrieve pointers to the connector and
> CRTC they are attached to.
> 
> Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> encoder field, and then the drm_encoder crtc field, both of them being
> deprecated.
> 
> And for the connector, since we can have multiple connectors attached to
> a CRTC, we don't really have a reliable way to get it.

It's not very precise, there is usually only a single connector attached
to that encoder:

 connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);

Most likely I understand what you mean, but the commit message might
require some polishing.

> 
> Let's provide both pointers in the drm_bridge_state structure so we
> don't have to follow deprecated, non-atomic, pointers, and be more
> consistent with the other KMS entities.

Well... Currently we mostly have variable data inside the state. Adding
drm_connector to the drm_bridge_state means that it also becomes
dynamic, however it usually isn't. Another option might be to pass
drm_connector as an argument to various atomic_foo() callbacks, but it
is also suboptimal.

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++++
>  drivers/gpu/drm/drm_bridge.c              |  5 +++++
>  include/drm/drm_atomic.h                  | 14 ++++++++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 519228eb109533d2596e899a57b571fa0995824f..66661dca077215b78dffca7bc1712f56d35e3918 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -777,10 +777,15 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
>   * that don't subclass the bridge state.
>   */
>  void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
>  					    struct drm_bridge_state *state)
>  {
> +	if (state->connector) {
> +		drm_connector_put(state->connector);
> +		state->connector = NULL;
> +	}
> +
>  	kfree(state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index ad91a0ac375a9c8cf82834354ec7f654a59a7292..fcff08c7d609477b7cadabc109f0b543a6b9b506 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -803,10 +803,15 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>  		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
>  							       bridge);
>  		if (WARN_ON(!bridge_state))
>  			return -EINVAL;
>  
> +		bridge_state->crtc = crtc_state->crtc;
> +
> +		drm_connector_get(conn_state->connector);
> +		bridge_state->connector = conn_state->connector;
> +
>  		if (bridge->funcs->atomic_check) {
>  			ret = bridge->funcs->atomic_check(bridge, bridge_state,
>  							  crtc_state, conn_state);
>  			if (ret)
>  				return ret;
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 7af43062e5ca8c30b3fd600a34543e79137ab3ea..12f3676b85454e81de74c6b5eec700a355d42836 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -1197,10 +1197,24 @@ struct drm_bridge_state {
>  	/**
>  	 * @bridge: the bridge this state refers to
>  	 */
>  	struct drm_bridge *bridge;
>  
> +	/**
> +	 * @crtc: CRTC the bridge is connected to, NULL if disabled.
> +	 *
> +	 * Do not change this directly.
> +	 */
> +	struct drm_crtc *crtc;
> +
> +	/**
> +	 * @connector: The connector the bridge is connected to, NULL if disabled.
> +	 *
> +	 * Do not change this directly.
> +	 */
> +	struct drm_connector *connector;
> +
>  	/**
>  	 * @input_bus_cfg: input bus configuration
>  	 */
>  	struct drm_bus_cfg input_bus_cfg;
>  
> 
> -- 
> 2.48.0
> 

-- 
With best wishes
Dmitry
