Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F982528E2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197439; cv=none; b=A39enBv/C+7FXq12xpcplDEPvy0RrdFrdGzr9IweNiwC+dOWSBm5PRbYV7Lp1bbocMJNPXNuRCMTbwVMWG1cISbZWAcIxy0atQ7UIxezWbLuuIPmIXS8wx6EywdsoCYdJvcLSmQVo8urGo+InrpqSyU48XanxtAE6f4NWYZugRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197439; c=relaxed/simple;
	bh=FOFUMpHzPOxV3uB+ByTnEVt/eFwYf3XxN/ebzOTG2G8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqjMQCoQEiotsh3YjrxdcqkTz7oEQfaqVI3SiCCJcicfgVjHVnSsoZY3AF0R/PjoPqZUJSLPcwnILSs7JeFBEBnS86uiZP9bVnA2m1FJZuD95ThWpo1ZYmT8bg6EVV33Te3SDSSxF/HJPJc697ktUzJqkJQ39swG7+22E+0irdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EhbbfVEn; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EhbbfVEn"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f4bc408e49so34403447b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739197436; x=1739802236; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae3lwIG1bNMfgLcb9UOChi6PzxvbhnZHhBNXR+QOsdw=;
        b=EhbbfVEn67+BLY6WS/mEpLXrReYZazQqASc1yrWnH57j9bYDYxMyDa1nEcB/AjZBt6
         fQgqOuJCdMdr06CmwPptbR51s+fow+EqxzF+QYjuQq9hUxgKGxCnpiKrFQGFMjRCyEZH
         eK04H5urIZpzoC7fPdrlxsobCzshD5Yb4sSlQU1jH0B0ZQWuSFnjk22fOdVPTDEWCpAc
         FJT7NOOaPVvHZRzv9rmIeEanMN8MtWMqaSk/n8H+kzvzqf3KSxBnJXXGiMT8EZsCEuhq
         lIoINpp4P9Z8z7ZNyZLBxKBJsSI2mMr8+jfrqwPOIRqaQD6y3B+qT2au1xGYpL39nbBl
         TM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197436; x=1739802236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae3lwIG1bNMfgLcb9UOChi6PzxvbhnZHhBNXR+QOsdw=;
        b=YSrJkKWZDD8xJGjKLnbl/3OQ+CfNFiBI+X88o0VykxqUFQQZ6uM/0oBx0wgyX2BynX
         D+B6fg6+DORkzWytyI1HEZBxSoK3Fn2FIGJ8ThrHDtiMpcfgZ1DufoClI8poBwhJiUYQ
         AMEUc6rskMVhfC4zbzfNwMCZtdWASTY7ro/hlaGMGpT0vtlzpH+9AY8deKtmMYT05uhm
         7bqGudEyP3yzmagrhhTWQg/k+RgVc85L9yTEgTpPKVcylMnpBppkCzcaR/9QMofkTJMX
         QmGgdmjuixzBqy0w2aCFahlrRTTskHeP4pBfORMNXHiSRypK67+lOISH7gK1VKNpk02w
         iKNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSlCW066rUfEMXvUlwqTUj7l40Q/pA8ZTBkltrGb+UNlRIxxsn6y0e3gggACtCceXqVswfF/HSTC9Fb4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO8g0I9nBu0PebANKmmXcbw1UwaPKV8KW/ewoj+gGsUCCLUfER
	o50mtlCp8s0cCVRRYeoUZJLgy2rYFQAtYYE7vB/rzyrooHr6gxdHiSSy/k2pN6lSiDbWw58RynU
	1dBuVCmOLlol/KbpSVq2vZnpt75w4b4km/KDlEg==
X-Gm-Gg: ASbGncvIWnbyAM0BUYKk7SocKudbrEbZgt1mPotas8J3CfMcxnuzy5sS83bO1M9tWqf
	rLPmCHz46Xh23K7YvMC87QABXwYIlfK6T/7Y95rQXKonzL2c8isWDqyLd5rDwOZ5izWo9fKkswC
	LjH/B22VJnu/Q=
X-Google-Smtp-Source: AGHT+IE0g27FEGOeRAZwGb7S3MgR4LXpDdhrkSZoSOq5U1jJjfFXRfvfAEBsqb9Cm3IID24zNyOYw0dpb/wBuLQLVBA=
X-Received: by 2002:a05:690c:4513:b0:6f7:598d:34a3 with SMTP id
 00721157ae682-6f9b2349b17mr123277977b3.0.1739197436560; Mon, 10 Feb 2025
 06:23:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat> <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210-bold-steel-collie-cecbad@houat>
In-Reply-To: <20250210-bold-steel-collie-cecbad@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Feb 2025 16:23:44 +0200
X-Gm-Features: AWEUYZl00UgPkDK5peSLElXsBxEbhr7D2kNasc0K5iG6VfIY6yez4cOHp2_9LzA
Message-ID: <CAA8EJppyDiAeH8bm-rdCUsGoyVOrp=4AvrYLJ-=5BTLtmnP11g@mail.gmail.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM bridges
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Paul Kocialkowski <contact@paulk.fr>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 14:31, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Fri, Feb 07, 2025 at 09:54:06PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> > > > DRM bridges are currently considered as a fixed element of a DRM card, and
> > > > thus their lifetime is assumed to extend for as long as the card
> > > > exists. New use cases, such as hot-pluggable hardware with video bridges,
> > > > require DRM bridges to be added and removed to a DRM card without tearing
> > > > the card down. This is possible for connectors already (used by DP MST), so
> > > > add this possibility to DRM bridges as well.
> > > >
> > > > Implementation is based on drm_connector_init() as far as it makes sense,
> > > > and differs when it doesn't. A difference is that bridges are not exposed
> > > > to userspace, hence struct drm_bridge does not embed a struct
> > > > drm_mode_object which would provide the refcount. Instead we add to struct
> > > > drm_bridge a refcount field (we don't need other struct drm_mode_object
> > > > fields here) and instead of using the drm_mode_object_*() functions we
> > > > reimplement from those functions the few lines that drm_bridge needs for
> > > > refcounting.
> > > >
> > > > Also add a new devm_drm_bridge_alloc() macro to allocate a new refcounted
> > > > bridge.
> > > >
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > >
> > > So, a couple of general comments:
> > >
> > > - I've said it a couple of times already, but I really think you're
> > >   making it harder than necessary for you here. This (and only this!)
> > >   should be the very first series you should be pushing. The rest can
> > >   only ever work if that work goes through, and it's already hard enough
> > >   as it is. So, split that patch into a series of its own, get that
> > >   merged, and then we will be able to deal with panels conversion and
> > >   whatever. That's even more true with panels since there's ongoing work
> > >   that will make it easier for you too. So the best thing here is
> > >   probably to wait.
> >
> > Luca and I had a quick chat on this during FOSDEM. I really think that
> > panel (part of the) series can go in first as it fixes a very well known
> > bug _and_ allows a pretty good cleanup to a whole set of drivers.
>
> I don't necessarily disagree on principle, but if you state that it can
> get first, and fixes a known problem (which one?), then it should be a
> separate, standalone, series.

A problem of panel bridges having the wrong lifetime because of devm_
attachment to a wrong device and so either being kept for too long or
being destroyed too early.

>
> Ever-expanding features are bad for both the reviewers and the
> contributors, even more so when the discussion happens off-list.
>
> > With all those panel / bridge wrappers gone we should be able to see a
> > clearer picture of what individual drivers are doing. In other words,
> > which memory and which code actually hosts and uses internal
> > 'next_bridge' reference.
> >
> > > - This patch really needs to be split into several patches, something
> > >   along the lines of:
> > >
> > >   + Creating devm_drm_bridge_alloc()
> > >   + Adding refcounting
> > >   + Taking the references in all the needed places
> > >   + Converting a bunch of drivers
> >
> > The last two parts seem troublematic to me, but, I must admit, I didn't
> > spend so much time reviewing all drm_bridge usage patterns.
>
> Why? the third one is already done by that patch, the fourth can
> relatively easily be done using coccinelle.

I have doubts about cocci. It doesn't have a way to know, what is the
lifetime of the references to the reference-holding memory. Maybe I'm
missing a point there.

-- 
With best wishes
Dmitry
