Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFC5199238
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958054; cv=none; b=neKphfBZrqyQ9InEgUPeWvSU+j3qxW+7e2PgIWUqL53t3DfcGy3Cs6m9/aUW/TEHERxLydne4jm5kcx66p/vxm9y2ghGEhnBKVaDP1atQmBm56AqZKhdGZrXw4yOykxfop97sjQBMXHG0IteEtN60jLdi6eR56mat/RrQ4+p8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958054; c=relaxed/simple;
	bh=sbZnWinPgG2IfHiADHdxLn+Xj3t/OLzgEcxzGapBJKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSYzsokgozXKjZ8C8TJ7+pMwl2FtXUSei+jmklN3NuF9mtPhhX96egn7MEghg3bkz0o0amFrN071ETqm03lSEkm+XcteECRKNfm5QOKGGcW6LvbtYDpGMNZISrG5hFgjqk9HKrX1C7OGakQnGR4hRKrkPHozm1KO3WWmWc5Q2Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ifP2YiaI; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ifP2YiaI"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401e6efffcso2517286e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 11:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738958051; x=1739562851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ru1wvh36CbOfubIqIyD+5sQyMz21Y8aZYTgm/d3+5o=;
        b=ifP2YiaIwH+DTPI6Nu4wabswd4PZpLcdLm+6dzSPZtxatJGGld/9W5SMgMddgHzih8
         zbIcp4bmFw8wFGhn4+udgY6VTjabmsOzUZLwuzM40QbIuNAdhpfy3frEm3Xc7p/Oi4kB
         Xs6y0a9ccZwTYavch0IJDeEKImhEHMVFOWL0MSOrcEiSUuQh/9ssQ3YAxGOydkEStGUa
         ZvwzR0j9LCk/VzoX10XtgODRVzIs6A1WhVSIWykCsodkYbGO3tlYT+UhVjl11JS/dW2d
         oVwugHqDTtNbglz1TcX6oKyyN7bGkG6CLUfIRumCB/1AjBqZFJxZ41A/7fUgzbDygz+D
         GkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958051; x=1739562851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ru1wvh36CbOfubIqIyD+5sQyMz21Y8aZYTgm/d3+5o=;
        b=ggD68rezQgFOIPSBmCQH3EvuiWb9rNn8jNEoIS4D4XoWQ6PuPrDyXbZGyTpiiuBJMm
         wwlTFhJNFM7K9vtiseJZBWh1O+EuJrpoZiBJUd5s42BkPNBsWFguwMTmZKtMFpO0SrKW
         ID+CYRA8POsFiX/ojD5il8j2ToRxfX7vQOwb71PcVupngaMntKmIT3EArc/DUBeBEmbm
         vbGsgB0+YeXCXlDHfuFYhalpMSwZsrjZJq7JAKvhc4QHfU+QRQTV+ZHwz3O4g/WYzsZ6
         uRA+SS+hgkUBO+LEFRTwCiAX7aD1/0EGrtTDyIet7hsAkKgeiUdvppsn/wkbyzOGmD+/
         uD2A==
X-Forwarded-Encrypted: i=1; AJvYcCVLPNHOLaWnzXltaBykPJLav1bXNquOddhvME3LbA9Av/K8mqgTnkR/MacLzH954wJkFYAkROr2T0QFbjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDLXgpcz01plL76L+dZpANU0EQT9JXwPAnWhh1RD7jJP1tVrIU
	2zaREN/GtDCAlfsHWm7noCJ+eMvqiFt8Xl08MS1PFGQ1oDo5c2nhq/BVqNxSqcU=
X-Gm-Gg: ASbGnctlcCnlAYEyXvI0r1Gd2jyCnKb33r4KQJWl0w9oZGSxCcjIa+KBJa3vrxE+nXF
	1wgryEwAu2DVfhdevCsUOFU8qOzqcipL6dBlnBq9OvwYgkiOnofmizgOIcppo0Es12RoTT/UpyJ
	VhE4bwDk9k9A0O37a3Dq1ZG+ya4rNdruqabt05TCe2hSxDy3D8J/XP6xy/R9gWSq+cexBFvpoqy
	S2n0hRig7IQFlan/UKn1tQmmHCb8XQX9N4yE0j9ffpC7WpuVnKwRtsKsGn94mqgzi6XlBH8/vUQ
	58qP2bOlGF07vCnH1ngGlnNs4/9jd1oB6VVaRhEqoGOV3dZdIRa8nLg0XWnT+OyBVHJAqgs=
X-Google-Smtp-Source: AGHT+IFAea/MRPW5NqZuydSkxXmqLttpsbttAcYS0zhETRXM+wh1dfpRWMrPcOicMETtA2XEcZqpWg==
X-Received: by 2002:a05:6512:108d:b0:540:2a92:7da9 with SMTP id 2adb3069b0e04-54414ab5605mr1626033e87.21.1738958050673;
        Fri, 07 Feb 2025 11:54:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54502a4efa2sm58959e87.195.2025.02.07.11.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:54:09 -0800 (PST)
Date: Fri, 7 Feb 2025 21:54:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-ingenious-daffodil-dugong-51be57@houat>

On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> > DRM bridges are currently considered as a fixed element of a DRM card, and
> > thus their lifetime is assumed to extend for as long as the card
> > exists. New use cases, such as hot-pluggable hardware with video bridges,
> > require DRM bridges to be added and removed to a DRM card without tearing
> > the card down. This is possible for connectors already (used by DP MST), so
> > add this possibility to DRM bridges as well.
> > 
> > Implementation is based on drm_connector_init() as far as it makes sense,
> > and differs when it doesn't. A difference is that bridges are not exposed
> > to userspace, hence struct drm_bridge does not embed a struct
> > drm_mode_object which would provide the refcount. Instead we add to struct
> > drm_bridge a refcount field (we don't need other struct drm_mode_object
> > fields here) and instead of using the drm_mode_object_*() functions we
> > reimplement from those functions the few lines that drm_bridge needs for
> > refcounting.
> > 
> > Also add a new devm_drm_bridge_alloc() macro to allocate a new refcounted
> > bridge.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> So, a couple of general comments:
> 
> - I've said it a couple of times already, but I really think you're
>   making it harder than necessary for you here. This (and only this!)
>   should be the very first series you should be pushing. The rest can
>   only ever work if that work goes through, and it's already hard enough
>   as it is. So, split that patch into a series of its own, get that
>   merged, and then we will be able to deal with panels conversion and
>   whatever. That's even more true with panels since there's ongoing work
>   that will make it easier for you too. So the best thing here is
>   probably to wait.

Luca and I had a quick chat on this during FOSDEM. I really think that
panel (part of the) series can go in first as it fixes a very well known
bug _and_ allows a pretty good cleanup to a whole set of drivers. With
all those panel / bridge wrappers gone we should be able to see a
clearer picture of what individual drivers are doing. In other words,
which memory and which code actually hosts and uses internal
'next_bridge' reference.

> - This patch really needs to be split into several patches, something
>   along the lines of:
> 
>   + Creating devm_drm_bridge_alloc()
>   + Adding refcounting
>   + Taking the references in all the needed places
>   + Converting a bunch of drivers

The last two parts seem troublematic to me, but, I must admit, I didn't
spend so much time reviewing all drm_bridge usage patterns.

> 
> > Changes in v6:
> >  - use drm_warn, not WARN_ON (Jani Nikula)
> >  - Add devm_drm_bridge_alloc() to replace drm_bridge_init() (similar to
> >    drmm_encoder_alloc)
> >  - Remove .destroy func: deallocation is done via the struct offset
> >    computed by the devm_drm_bridge_alloc() macro
> >  - use fixed free callback, as the same callback is used in all cases
> >    anyway (remove free_cb, add bool is_refcounted)
> >  - add drm_bridge_get/put() to drm_bridge_attach/detach() (add the bridge
> >    to a list)
> >  - make some DRM_DEBUG() strings more informative
> > 
> > This patch was added in v5.
> > ---
> >  drivers/gpu/drm/drm_bridge.c |  76 ++++++++++++++++++++++++++--
> >  include/drm/drm_bridge.h     | 117 +++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 189 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 1955a231378050abf1071d74a145831b425c47c5..f694b32ca59cb91c32846bc00b43360df41cc1ad 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -200,6 +200,57 @@
> >  DEFINE_MUTEX(bridge_lock);
> >  LIST_HEAD(bridge_list);
> >  
> > +/* Internal function (for refcounted bridges) */
> > +void __drm_bridge_free(struct kref *kref)
> > +{
> > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > +	void *container = ((void *)bridge) - bridge->container_offset;
> > +
> > +	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);
> 
> Pointers are not really useful to track here, since they are obfuscated
> most of the time. Using the bridge device name would probably be better
> (or removing the SHOUTING DEBUG entirely :))

bridge device name or bridge funcs (I opted for the latter for the
debugfs file)


-- 
With best wishes
Dmitry
