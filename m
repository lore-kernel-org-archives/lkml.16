Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611DB56446
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738630769; cv=none; b=n4UiEpZTMtafgeSZGdDOz3DQkpFHhOsgXYPvIHwM+nm6Wa1BDtnCKH+oOoX5UifaZuWNDaEtGHMTbzdW4MlXam7jie7PuStw9omKzubGPygowsNxIaUm0RPQcolTcCzGjK4upVkzI/YbvLOO6sOIUXS2qXkhpKDEkvvA/ro5Gl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738630769; c=relaxed/simple;
	bh=Ol6He+EmpCD6EcfaZPNihsT1m7DuezwTek76UAYgc1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Emnb1nEscXFFEtA1fTfJpz9VId8B3g0c3hOYD0yYst6fyMgxjkv4187TuHg/7O5u8KY24NIRBrVD04DrdWYuCcLFpCbQGB2iBK5YcRNaNXiGoo9gnKYNix5dV01TMTU7/E+FK+Cn8qh1nSUHzWV+URq5yKDSfGkMOKI0RvSwDb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m1JC91QH; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1JC91QH"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53f22fd6832so5575954e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 16:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738630764; x=1739235564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQu+PcBCYHyEWcLorUNu/krN34Y5N713WyAJdtXWICI=;
        b=m1JC91QHXg4nZ67aOxSgrWUheYA+7S+jl2HHJSvXVE0prHl61Nqa0BLG874zzWv0GN
         eYs9RvUgDPGSDfiKL+0RlQzwrsuO0cZImUfbzNrmhu8AqG9fF9gKKCviezhhD3Nsqkv9
         Pk1KCanDvBTiErWV79tYkiAcTIlZuf9FtnnVophuHmRnsNKYVrcw6fzsnNsqKYVWof1Q
         pz6fuzhu1T/FkGAC4bbX0pdHS/O48g14vCgXsl3ca8H4bDJ5Cf51FKnEC4PHjUXig9UB
         RnD6UVo4iw+Ek2wQT/zy/1H7J0zyEFEV2Pkjcm8HTEDETm2pk6TshqNPCJAWRsuQuzxI
         E3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738630764; x=1739235564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQu+PcBCYHyEWcLorUNu/krN34Y5N713WyAJdtXWICI=;
        b=QeZAcYLu6CfuERbVpL4l4CoI/rpvhes5u5jPz9sfWR11uqEfKNuUOOsmFhjVGJ/25u
         TJdBOYeWlS5/0YZor6cRXy8+6Hs1ilhzKtRMh1LpD9I6adbgKeLm+ALXoOgARLc7UFkR
         G5Z6dknAL6W41AN9xlLBDn/DTNBdGQfYYsekc0U4LjrrO2C6UoQkxcI5Nb1Roy7YSYux
         klLSpXvOJKGnUnnUTetyZliaqEfoAijNrd0KRXHoSz/WaxFBDTl3Nv88/gMcjYOw4Agb
         a0LOfI5uMPYR3ADpfEVKQ7bZtB7wFWCM7I0imvwR4I85m1JE9ytgk1arJlqQgy5AabuB
         h3/w==
X-Forwarded-Encrypted: i=1; AJvYcCVxrUzbsyiyvx2etVQKQgQsyaDuMSpRyTLsqmn36KVk6derF+9u+b8k88cRms5ysG7zDb6JHyBniUw241k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEEkInhnT6cgm1t3w1RLcMP5NknKCaxVRO9sfRTzMrRVQvtMgB
	czdPkUDoDEzPRemA1NUAYIIjjHplK5iSrHgPssGnQpvk3/Sv08evypTVl5LLmbU=
X-Gm-Gg: ASbGncv39DS1j2bBe/hmRtHM7WT5Hven6RCYx+RW2ctAfolwOB0RYT8kci81W/nsJYO
	mQkvOKg+5rspKHNdmD7ZmdBzAMQE+LvBXsZ34Urv5qIbdJRmHmZsRkkYotrB5z2oIRz8FLPp08s
	w4KEeItac81m26K1cGo0U2c4gYWJJLxU1bzYGxAoyJgfaDYnwmQ49oxlPs+nzoZv7vjf+gJeMR6
	eoMvGOlS0Joc7HTiXiQKjDT/LUhJP0MG6Mxh2HX/KXJLUx/15W8wUz6pZEAZUIaM+hN94TtkNeO
	hwkBR5chOS/I69fMOYcmm90bxFaSr+/BzxD5Q9HpnegkVcUDsSjl5rK6JlVNIlFkPwXIvCE=
X-Google-Smtp-Source: AGHT+IE/5jfpsneDUND06UjyJ4Ry6Zih6VLQBI5FGcNFFpcyLlM5QM1i945DtByaC+8TDC003dcEnQ==
X-Received: by 2002:a05:6512:114a:b0:542:8d45:cb4f with SMTP id 2adb3069b0e04-543e4bdffbcmr6358441e87.1.1738630764308;
        Mon, 03 Feb 2025 16:59:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf10e2sm1449566e87.32.2025.02.03.16.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 16:59:22 -0800 (PST)
Date: Tue, 4 Feb 2025 02:59:20 +0200
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
Subject: Re: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Message-ID: <na7jgb5leqbugi6a6xkfz3nl6mp7li4oevfevhjmo5y4v7eot6@fsmfv52u2rtz>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
 <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>

On Mon, Feb 03, 2025 at 11:34:00AM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
> > The mode_set callback is deprecated, it doesn't get the
> > drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> > that HDMI timings should be programmed after setting up HDMI PHY and
> > PLL. Rework the code to program HDMI timings at the end of
> > atomic_pre_enable().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
> >   1 file changed, 15 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> >   	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> >   }
> > +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > +					       const struct drm_display_mode *mode);
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
> >   	if (!hdmi->power_on) {
> >   		msm_hdmi_phy_resource_enable(phy);
> >   		msm_hdmi_power_on(bridge);
> > @@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	if (hdmi->hdcp_ctrl)
> >   		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
> > +
> > +	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
> >   }
> 
> This addresses my comment about setting up the HDMI timing registers before
> setting up the timing engine registers.
> 
> But prior to this change, mode_set was doing the same thing as
> msm_hdmi_bridge_atomic_set_timings() which means
> msm_hdmi_bridge_atomic_set_timings() should be called at the beginning of
> pre_enable()?
> 
> The controller is enabled in msm_hdmi_set_mode(). So this should be done
> before that.

In [1] you provided the following order:

1) setup HDMI PHY and PLL
2) setup HDMI video path correctly (HDMI timing registers)
3) setup timing generator to match the HDMI video in (2)
4) Enable timing engine

This means htat msm_hdmi_bridge_atomic_set_timings() should come at the
end of msm_hdmi_bridge_atomic_pre_enable(), not in the beginning /
middle of it.

[1] https://lore.kernel.org/dri-devel/8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com/


> 
> >   static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> > @@ -177,17 +190,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	}
> >   }
> > -static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
> > -		 const struct drm_display_mode *mode,
> > -		 const struct drm_display_mode *adjusted_mode)
> > +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > +					       const struct drm_display_mode *mode)
> >   {
> > -	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > -	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >   	int hstart, hend, vstart, vend;
> >   	uint32_t frame_ctrl;
> > -	mode = adjusted_mode;
> > -
> >   	hdmi->pixclock = mode->clock * 1000;
> >   	hstart = mode->htotal - mode->hsync_start;
> > @@ -306,7 +314,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
> >   	.atomic_reset = drm_atomic_helper_bridge_reset,
> >   	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
> >   	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> > -	.mode_set = msm_hdmi_bridge_mode_set,
> >   	.mode_valid = msm_hdmi_bridge_mode_valid,
> >   	.edid_read = msm_hdmi_bridge_edid_read,
> >   	.detect = msm_hdmi_bridge_detect,
> > 

-- 
With best wishes
Dmitry
