Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB018C930
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738957414; cv=none; b=P6flmCWKRcvER+XuzZEt0IzwYD+aAAFSFizlLtWaebRL3k7EXaHm5xKgSYr/EtPMcrByEmg6Ms1+kGGmsYHfKxzDKJiwEJtQIVgYIqncCCJNGwXnJLAYuufEFhRTB6kc60Z6s3uBzCc/jCWRWBbVzRN1GGOmEu4wSapfShn0x7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738957414; c=relaxed/simple;
	bh=E8v9e7N9uAWPSuDOJRC1hA5wQ2HXuHW4dK7L0d17YhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKnAVHF1z+CZB6msfBFgRyVaWVJA766Ta1BuwgW01oij5GHB4Qd1AWBbWXc7eqNk2lizdKQhGTm0Q4TATGFC/3D06VJ1rO/xA7IstJAXV8lmzN0TZp7cyg5UBRtZmBw0SyQxPcYSPgLgYIU1HyNxEYtUq9mw4MFUOth7mwG6Dn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUIeFd2T; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUIeFd2T"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54450213957so1263972e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 11:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738957410; x=1739562210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sfeUloH1D5YQJ4zSbv3mA6ITAlWmazeuNMbmPCyKglE=;
        b=IUIeFd2TEZhYRJwCJ9yURfLQNZkVaPiXTj/+GPlHsV7DqlKfRc3hQSAB4lPe1Qo2ZX
         h0MzI9NnpLYkZiamau1LkDivBuTTPXKly1ZAIL+tmcVS1dTChS5Iejm/RVIZiA4BcCIg
         viLJTSaeJ34pVK5KNRym3RqmQt6D+esrDRAefOArfRZKnfakb2/g3GtLvQ0PF1vrCMCJ
         vNzRa90CB2lBL9CBraBNTw71zBoFgTbXmsJMglfqAU/iISZT+mLL7VbeX3EfpL+gjJdi
         QBuos93R78nam4+D7PPasjAdedPwO9znDWeJvRiN7qb9zDPtsWNZuFvJ3Uc5sQafeRXm
         3s3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738957410; x=1739562210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfeUloH1D5YQJ4zSbv3mA6ITAlWmazeuNMbmPCyKglE=;
        b=CgJpZSAp5bDsnZ4aVXzvCC4caPw3mohZHJUudFy825FHqhFpNZGyJNdAg6OUfbHXRZ
         FwmwIowTHHhXNJmRVqCbzdiH94Od/T0UonUzEUSfVuqAjm0KI7AKGo3uO58gly5nJvnY
         1WJ0NKTL3oNrrSmTKRi6nt1bLLD336hJoWTPup/tb1rgx+lFZ2fupIVG3/Fnc8eOo+ws
         Q5HXp3paVSak3m72drsRdyx8S2yCnq7s1F3UffDlLn75f6Nr32jxMxcgAEqIaGJ59TpL
         br33AqhnESE3wD4BiawZ2iJgSZh0IR7MfMSkZH5yATWUI8jzdzLTE6Auywxf512E/d3+
         ME6A==
X-Forwarded-Encrypted: i=1; AJvYcCUMlvYlferng1qL1hX2Oz2WoTDrXVZA+Do1uJYK6Hqbya82Alo4pAoQ+4RkXNTAm5UpcJBPKhar8E+UExg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyYNaLSe9xpRvPPlJ0oPZvuO/v+abJk0OV+9t4xwk6IkdB809R
	rAhKCjBJDVrvZLRAmdncfgXiiQOEljrI19bsPqEO3TtBhKUWSHVDn4MNWV5R5kk=
X-Gm-Gg: ASbGncsYbfV3t73juWvmvYsVKcrBEqyFUKr8CdsREu0vaUBWG0PDaGmFJATlZvzLM4k
	QB4jSQugKR/cA0qL/BpOE4uFI4TZrSBaCmwlI6svAwdPeeCxoozVeNmUZyHaLcEOEG1svHFvOE5
	/8WfLMDttRaLdxSFZnPgatzp771ejloRx8r5Ie7xgvo3B9xOauAl/mkYqdkGLi89Ay0ISyqmmDh
	uB1ZjLTc9PG2ofgtN4jBkuxrg06+VeTLirz3/dOmBMeBl1uYF8bn3boR4FZ4qmgeEEKPvaQ3Tuo
	VJSSmMkk5HA3e+WLH+STs5c1CaeIIELpnEAIKKCTFjuKeknbBkpiWcqhZyQzhfjPnCGfhjk=
X-Google-Smtp-Source: AGHT+IGPtAJCB3CGqF85jrgae3kZNpGKdBiQF5zyaTqCla9QfN39wSgkGoIzsR5MIcuzbaZGPE0Bzg==
X-Received: by 2002:a05:6512:2316:b0:543:9a61:a2e5 with SMTP id 2adb3069b0e04-54414aa87c8mr1684308e87.23.1738957409927;
        Fri, 07 Feb 2025 11:43:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54410604225sm542577e87.237.2025.02.07.11.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:43:28 -0800 (PST)
Date: Fri, 7 Feb 2025 21:43:26 +0200
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
Message-ID: <aoy4vtqfffq3chbfdqdcrtqmex3pqijlusem7pp37wwsg34lgl@mnaqbp6fijnc>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
 <iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
 <20250207095428.244f0f91@booty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207095428.244f0f91@booty>

On Fri, Feb 07, 2025 at 09:54:28AM +0100, Luca Ceresoli wrote:
> On Fri, 7 Feb 2025 04:49:21 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> > > Adding a panel does currently not add a panel_bridge wrapping it. Usually
> > > the panel_bridge creation happens when some other driver (e.g. the previous
> > > bridge or the encoder) calls *_of_get_bridge() and the following element in
> > > the pipeline is a panel.
> > > 
> > > This has some drawbacks:
> > > 
> > >  * the panel_bridge is not created in the context of the driver of the
> > >    underlying physical device (the panel driver), but of some other driver
> > >  * that "other driver" is not aware of whether the returned drm_bridge
> > >    pointer is a panel_bridge created on the fly, a pre-existing
> > >    panel_bridge or a non-panel bridge
> > >  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
> > >    but the "other driver" doesn't know whether this is needed because it
> > >    doesn't know whether it has created a panel_bridge or not
> > > 
> > > So far this approach has been working because devm and drmm ensure the
> > > panel bridge would be dealloacted at some later point. However with the
> > > upcoming implementation of dynamic bridge lifetime this will get more
> > > complicated.
> > > 
> > > Correct removal of a panel_bridge might possibly be obtained by adding more
> > > devm/drmm technology to have it freed correctly at all times. However this
> > > would add more complexity and not help making lifetime more understandable.
> > > 
> > > Use a different approach instead: always create a panel_bridge with a
> > > drm_panel, thus matching the lifetime of the drm_panel and the panel_bridge
> > > wrapping it. This makes lifetime much more straightforward to understand
> > > and to further develop on.
> > > 
> > > With the panel_bridge always created, the functions to get a bridge
> > > [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> > > the bridge they are looking for exists already (if it can exist at all). In
> > > turn, this is implemented based on a variant of
> > > drm_of_find_panel_or_bridge() that only looks for panels:
> > > of_drm_find_bridge_by_endpoint(). In the future
> > > drm_of_find_panel_or_bridge() can be progressively removed because there
> > > will never be a panel not exposing a bridge.
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > 
> > > ---
> > > 
> > > This patch was added in v6.
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---------
> > >  include/drm/drm_panel.h        |  8 +++++
> > >  2 files changed, 66 insertions(+), 16 deletions(-)
> > >   
> > 
> > LGTM, minor issue below.
> > 
> > > @@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
> > >  {
> > >  	struct drm_bridge **ptr, *bridge;
> > >  
> > > +	if (panel->bridge) {
> > > +		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
> > > +		return panel->bridge;
> > > +	}  
> > 
> > Shouldn't the rest of the function also be removed as you do in other
> > cases?
> 
> Indeed it should.
> 
> And even more, I now realize drm_panel_bridge_add_typed() should also
> become a simple 'return panel->bridge', like its devm and drmm
> variants, and its code, implementing the actual creation of a panel
> bridge, move to an internal function. Otherwise this patch is a bug:
> existing drivers which do call drm_panel_bridge_add_typed() would end
> up in having two panel_bridges for the same panel.
> 
> I must say the process of developing this patch together with the
> hotplug work was "convoluted" to say the least, which probably explains
> why this got unnoticed so far.

That's why I suggested to post this series separately - it saves you
from rebasing hotplug work on top.

> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
