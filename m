Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9670720CCC2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604952; cv=none; b=RKBJzmqqN42YdL42qhoTXq7otaKUQsKfNg45/QZRfRsC6w0sR5vK0rDzkjaxXrIIwOWXCrpYThEezA2UBUDYD0ciFeOydTLWsqRCh0sISmAGrxp1cdMH986eqk3DfV3pQzN4KqYnk8G1h8k9h5ppAhJCdyamVm+GPPDZak+BfB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604952; c=relaxed/simple;
	bh=l8SlDZSzwTchnqRIFOaGGOANMCQOToaoB70FRsY4YWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovHoQmb8IO9nL5Iyo7MnkLOqGBPhwSWP1cbG7qvfywo6CoZYmMEcyN4qh7lUCiCqT1WAAJXBsEcpkGkHVQiDVoeCl/LGLCIDHkMuO4N8mz6HYhJAJVvrqA7lbOfbzNHURy4qBx6rVNpVrA7b61cGa8ubLwYfhCesLPWlyM5VIFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vT5+YWTQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vT5+YWTQ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so4634041e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738604947; x=1739209747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tl7hb2dffFiUZtnUCsysXD2fQiSxN433uDcJunLyDI8=;
        b=vT5+YWTQs+IzLWtn3dNFFv9WqM46bOOgVI6/FVFUAbdj7oZBjfGNOzPTPT5Et+V3Qx
         VkdBzFIHzdRq2sINBVQH66/8xJgMMaKUBHZq5KULxduYsG46dJcrC3/ZbqzKpxPT6aCe
         sN3ZLmbgOtqT1TNHoBC3T2cdgLBVMcDFYuYkrUdXOaIYUOAGTe7H6AsRNLglgbujVqSi
         4AOu0XfTXd67mniu/VBKAsJOpiWqX8JJGkgckNHyhdYKjB8ix32j28mvXzlzJyP0WgAd
         fNbD+eItDoMKLf7K+FXFW/hvbwRhO7j06Bf0unIGbfdZY+jkej+yiy1Rh1en2uHHFQTv
         RctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604947; x=1739209747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tl7hb2dffFiUZtnUCsysXD2fQiSxN433uDcJunLyDI8=;
        b=iGAO5hgExm2pB8ngE4yFfqxvOFn4gIkypXpljWn/j4f1bU0SkKHRNPh7Y14H4D3vDy
         UcNtgul7QIX5gqFihlWMbFiwbWXfiEfgYeUhbKj3JXRvNrBFphf+qX+ypNoLt0P0cGA6
         eLyYNwl6VKwO6fLbAba8/9BIMmfOCAhl05EugCNJnlZugEdvEIBtASRASWsK2bLTaqey
         8UNxY40MCUGKGsohDDXxxCV52F/vwTQoYwTquMG+M+iCJdEFKVhNjN1Q25m8vJ74jWam
         a/rjsZuy/9U0K33b/P7dc96Duif3u05rqcLLaBnas7K7Y4QYZPJ8Y6Zqx7eJNlZtZP5F
         w99A==
X-Forwarded-Encrypted: i=1; AJvYcCV5yfXbCQDC5SVwffQxEBgkzBYvWiZp0OfAZ4ZttTn5fJoF4TqXbfel4j57q07lxpwbBa3PmZ6LT6CG0cs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyesix+TnoytlKrGk/IRkM0Lnpw2m3GTyVPtsFCZMjSxh5cAMEa
	jktTCeZZY3CAKyzZNGjE6/kk/VVlHwpoZRZ0NaVT7IUHtk4jh5VRBlnTNqF00As=
X-Gm-Gg: ASbGncvTHQuqRMZnHXScO+eEVshUSemvE8l72jjbfnHw1nOfrMabOJ0D8KqzrluHvGv
	QkSuD8P3TSIw1sK/XX8Bx1z9OrrJSKJdrznyJ5T8JN+mdXxax3B2dtgmYgOlaJSVluqfKaoOq3D
	m+aGKWdRRwTFHRO+TlS6kniliqwsQX8J5DwuNbsxzMlGpCLgShUIlvZ8sEJUPqHZ6sDNYUcUdSl
	gqPnWKaxiaX3pPRg7bEawgF5yllWEweyHRJJ+VKUXyk0drdhX6kVGjV8Zk78DtSYyAEDSwX8PIU
	05lkWiaOHrcoHT6aiqV3hZLEwmwqakspIOH5SbI9uA7k7T90whe9Uq4+/fmc7P2Lr07HRx8=
X-Google-Smtp-Source: AGHT+IFvISZSPO1dGObZpHPIDkgvz6DFnGdqtd4FYJvvIrUHjTGv2EHKj64Yr07Pt6wQMHxeMScNlQ==
X-Received: by 2002:a05:6512:3f18:b0:543:e0c9:1d97 with SMTP id 2adb3069b0e04-543e4be3439mr7560020e87.12.1738604947562;
        Mon, 03 Feb 2025 09:49:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf0edcsm1359166e87.25.2025.02.03.09.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:49:07 -0800 (PST)
Date: Mon, 3 Feb 2025 19:49:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
Message-ID: <sdyucn42l63puzt43bqgzildszsziceaucyfyjven3h3zy6iyj@pwlk4uhs6w43>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-29-9a2fecd886a6@kernel.org>
 <cfn3xpwyoo6lbugaxjwxvcq4l7eqbznlgnunxxfg4jnbrwtnpo@wdoizsk6ckvg>
 <20250203-orthodox-watchful-poodle-4018f4@houat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-orthodox-watchful-poodle-4018f4@houat>

On Mon, Feb 03, 2025 at 11:01:28AM +0100, Maxime Ripard wrote:
> Hi Dmitry,
> 
> On Thu, Jan 16, 2025 at 03:08:00AM +0200, Dmitry Baryshkov wrote:
> > On Wed, Jan 15, 2025 at 10:05:36PM +0100, Maxime Ripard wrote:
> > > The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> > > deprecated and shouldn't be used by atomic drivers.
> > > 
> > > This was due to the fact that we did't have any other alternative to
> > > retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> > > in the bridge state, so we can move to atomic callbacks and drop that
> > > deprecated pointer usage.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 41 ++++++++++++++++++++---------------
> > >  1 file changed, 24 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index b3d617505dda7d22b38c000fb79de46376adf3f1..c17d9486cf5c36d61eb00af2bdf9ba1b6f890ffd 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -242,15 +242,16 @@ static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
> > >  	u8 buf[2] = { val & 0xff, val >> 8 };
> > >  
> > >  	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> > >  }
> > >  
> > > -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> > > +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata,
> > > +				     struct drm_bridge_state *bridge_state)
> > >  {
> > >  	u32 bit_rate_khz, clk_freq_khz;
> > >  	struct drm_display_mode *mode =
> > > -		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> > > +		&bridge_state->crtc->state->adjusted_mode;
> > 
> > At least we should document why is it safe to follow the crtc->state.
> 
> What do you have in mind there? crtc->state is a pointer that is widely
> used, what is there to document?

If I understand correctly, crtc->state is safe to be used during atomic
callbacks only or if the mutex is being held. However this function is
also being called from ti_sn65dsi86_enable_comms(), which is in turn is
used in ti_sn65dsi86_resume(). Is it safe? Why?

-- 
With best wishes
Dmitry
