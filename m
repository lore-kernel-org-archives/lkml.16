Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85CD153BE4
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 03:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738986606; cv=none; b=qoU2WRwAJAg3X/GnFcGzDhoJSzLEiGJnSIJ2WlhqUHYrRPUz2LO98DI14IXwaGzUZoSD/YkAyRir5GjdvXHByDLXn0dpGyD+B+lZ8NG2UY/19zbXflFjxoiMsxgHMbTVNNd4OAZZJ/xjRBdtJxxiXUFuIyJ5e4MLI++YFtCzKLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738986606; c=relaxed/simple;
	bh=TjEn9rDaN1w6UDnajPbII/IvS33Pp/I6fmQNUP0Z114=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+0znJ/3DcS6AujVCm5gtNmdbbqrFnj1A95h5cK2GkZbQE3jT2IevP8Y0c1yP0aw2qomh3+1daIawhRhBDAoTFC7kYlNkENbHtCfePgO0WSucc9yDO/U6pbPnPYUfKF2YUs6xaRtwv3QY+6hdZfQaqb9TzoPC+tU9bAJVFCpR74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJOLdzFa; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJOLdzFa"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3086edccb4cso11394161fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 19:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738986602; x=1739591402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NUuRY+SGQqkiJGXQ8h6Ofym4ZEB8QVsdwYk0m4YJyac=;
        b=PJOLdzFayzSENH0kJ5oRnOeIjW9XcInrjaG3jgS57f9+3muAtbxA04vrUforrEjPiq
         33K6YtjVIVEf0YvxOv8+hSuTKHALiTWjWZpz+vONfIAGe1oPYq9ph+6sYxW6k7GtK4UR
         aBQ+i898PL4EWw7nPzKUdOinWvPJjKCvD+Xyfpx2hH68MfdoGaxQTv4UWXJLsKu7y2wv
         N/jJlgbdlrPu6KMRCmnyVXJ0hZ6XxRPPYgPV2mLe+fpBgeqmsLlHEOEmhtCmhQJE/8zi
         sZ20Uu4RFm1Htz6aLDrOu559A+qpTGDGm0RNw0lPSUm9Eti4EnBhu3acfF91foskQZx7
         OTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738986602; x=1739591402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUuRY+SGQqkiJGXQ8h6Ofym4ZEB8QVsdwYk0m4YJyac=;
        b=N7Z0mvidvNfoq9vKFLR84Ujeln4gkJVNHtLMs5SNQXs3UQWX8ctmnxcXHfwimjOd2x
         UjevYLesVf72fittF42II0QICJtNlynJ3chrljTTapoZOsy50DD0zECMAOu738aY+C0f
         fFZrJX5L6NnL5yEePJraDZlyWyZUEXHxDfplspULpa4EXB1UamwYVa7PGBCtdtBUpaTU
         40UblnLeNSjJE3yE4cui8j9Ls9mdpJnVMo51ToU9gvRM6ciu1aMZFaOc7B3bb/XpQpSz
         wQbJhwZb57D7WwX18UvPJJAreb/1bgm1lscSbfgTSUNMA2El4Ch7MWFZe29dUWKWzhV+
         RUJQ==
X-Forwarded-Encrypted: i=1; AJvYcCURlLYvtM2KO4ZRFrsjNrsonHSmZvq+myEZZVDhV1GjB1kkiZdHm2NEBVBHB6it0ai3ttIblUhMNP7SugY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2uSaaqFRuQFd1UtJsghhObqZ+3h1mWe9NV3fqB2w+hmR7+4tF
	/gmTDAUg59MHt3ePYrgvGIOtCvCznOjv8Q4FxSqB0Wivb+ldWM1fZ39Dhmawsvo=
X-Gm-Gg: ASbGnctala2FFvZuwOtEEhcVNRG9RkaAGHpnlri7eYsZXtABqpCHjQHHwEqE5e8UC0e
	+vH3wbILfwjQMQsBuZ3WNES/F6gtTPrehqDrxt+Heg57bRKYCpgfUULV6Ah6SId71c5aAi3ijA9
	vQUMrvz1JZelCzX+kMyPsnCvEvT1vP4t9qign+Sw0gecBDMGw8aIo4JZXzAoZ1FORStMdAc8nWl
	4LH/L2TO79VbBKyqyZpTn74hp+sXayxU08Jz0Ksz1KcJ9vW2gEsSDakMVB2VQq5ceudrTEWr8XV
	TkoaxIRPT5umQ4i8Zvj3OGskB/aQjZsMRUAIRw5h1Qgv3BQXjtpDXYhyGl5EdGoFAZNIeAE=
X-Google-Smtp-Source: AGHT+IHxa06MWEO0AyRI+e3MMcFW/cLQ8qh1dO9gXzCNcVwPzBIJl1HzogP/eYdm61A/K08gSYzy1A==
X-Received: by 2002:a2e:9147:0:b0:308:860e:d4d3 with SMTP id 38308e7fff4ca-308860edd40mr13207081fa.22.1738986601810;
        Fri, 07 Feb 2025 19:50:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2f6995sm5745881fa.107.2025.02.07.19.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 19:50:00 -0800 (PST)
Date: Sat, 8 Feb 2025 05:49:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, 
	Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Message-ID: <irh4phyeaybd42xujkyqos2rpjpkarz5jvymbxhtbmy6l7zz5f@fmov5qqheyg7>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-2-0c3837f00258@linaro.org>
 <cdfa5cfd-6cdf-45cf-ac18-c2c217d4211a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdfa5cfd-6cdf-45cf-ac18-c2c217d4211a@quicinc.com>

On Fri, Feb 07, 2025 at 04:42:46PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> > The mode_set callback is deprecated, it doesn't get the
> > drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> > that HDMI timings should be programmed after setting up HDMI PHY and
> > PLL. Rework the code to program HDMI timings at the end of
> > atomic_pre_enable().
> > 
> 
> I think now this needs to be changed that, program the HDMI timings at the
> beginning of atomic_pre_enable() to match the location of mode_set()
> 
> With that fixed,

Ack

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 24 ++++++++++++++++--------
> >   1 file changed, 16 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index d839c71091dcdc3b020fcbba8d698d58ee7fc749..bd94b3a70f0e5e457a88f089b491103a8c09567b 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -126,15 +126,29 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> >   	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> >   }
> > +static void msm_hdmi_set_timings(struct hdmi *hdmi,
> > +				 const struct drm_display_mode *mode);
> > +
> >   static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   					      struct drm_bridge_state *old_bridge_state)
> >   {
> > +	struct drm_atomic_state *state = old_bridge_state->base.state;
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >   	struct hdmi_phy *phy = hdmi->phy;
> > +	struct drm_encoder *encoder = bridge->encoder;
> > +	struct drm_connector *connector;
> > +	struct drm_connector_state *conn_state;
> > +	struct drm_crtc_state *crtc_state;
> >   	DBG("power up");
> > +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> > +
> > +	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
> > +
> >   	if (!hdmi->power_on) {
> >   		msm_hdmi_phy_resource_enable(phy);
> >   		msm_hdmi_power_on(bridge);
> > @@ -177,17 +191,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	}
> >   }
> > -static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
> > -		 const struct drm_display_mode *mode,
> > -		 const struct drm_display_mode *adjusted_mode)
> > +static void msm_hdmi_set_timings(struct hdmi *hdmi,
> > +				 const struct drm_display_mode *mode)
> >   {
> > -	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > -	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >   	int hstart, hend, vstart, vend;
> >   	uint32_t frame_ctrl;
> > -	mode = adjusted_mode;
> > -
> >   	hdmi->pixclock = mode->clock * 1000;
> >   	hstart = mode->htotal - mode->hsync_start;
> > @@ -306,7 +315,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
> >   	.atomic_reset = drm_atomic_helper_bridge_reset,
> >   	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
> >   	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> > -	.mode_set = msm_hdmi_bridge_mode_set,
> >   	.mode_valid = msm_hdmi_bridge_mode_valid,
> >   	.edid_read = msm_hdmi_bridge_edid_read,
> >   	.detect = msm_hdmi_bridge_detect,
> > 
> 

-- 
With best wishes
Dmitry
