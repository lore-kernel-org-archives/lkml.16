Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A841B0420;
	Fri,  7 Feb 2025 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918484; cv=none; b=uMvbG7RLtl9lYr8xfcoNCaNUds2SP2vHqWkbcLQ9EgToBwyxJsB0rSotW/0DxSpLiJdGdWf5Hst5XfiyxiFGMi3CW2wyTcV1v7e9LWZzRCu1rGl3PDobgVF/jsnWhunpyQKMIbR+IZQBsPk00PIClOOCo12O7ZeB3NXPWk4FTv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918484; c=relaxed/simple;
	bh=8AUVapBfJ+dKFt4S4I3xRiOQpU+SfNOYrHYg76dXSVM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2qFtTwb0OG11ZTHHU2/th9KedEMIb5nxSBJ0SQtiJqsSVN/rlYP/cVMwOg9SojE29NsHw8Gv7/XPdOkJgDeoaKfEH2yqkbGfS30wfVHs2NcXGu5YjpobN3ZHLvnNlNDVyUvHziJYB9Q5g2ztA6Zxcz27K7oWLRNXlIZbQov3k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IMbX3HWe; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IMbX3HWe"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3C65443A5;
	Fri,  7 Feb 2025 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wn7hxWkM/cWBO7IgNnUs/y74YeSzIcIWM0x5ZDLkpdk=;
	b=IMbX3HWevbzexCXvLrDPdCGV4DgqsZikJxEUhZloTqBXMrb7K5iBqUZzsswJsec98HBthn
	tP4V8cASf0MG5GOAVmfB0so2WYFTXSwYTb6FfAQTNwgXqzUfqXTWdcjGuzIawsP2FaCedv
	4rBDaTsXH9EYzmPHV21Zf0T6c1mC482iupiejkS0t+LLhdXxA0nmme0t7ZcMSCtahBBKCi
	s4iX7aHyI+gTPDWBaJBWGJcVxPnFomj9RcbuSVw+ocSbDiiReNMvBiIWYkMMsotEZWnNd1
	dFxmwaQRSxvzt/z1Hi/mtOcNnRYXPFxVWTv/HhjJn35KZSHb4QDNXAK9x3KJfw==
Date: Fri, 7 Feb 2025 09:54:28 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Paul Kocialkowski
 <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <20250207095428.244f0f91@booty>
In-Reply-To: <iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
	<iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrt
 ghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Fri, 7 Feb 2025 04:49:21 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> > Adding a panel does currently not add a panel_bridge wrapping it. Usually
> > the panel_bridge creation happens when some other driver (e.g. the previous
> > bridge or the encoder) calls *_of_get_bridge() and the following element in
> > the pipeline is a panel.
> > 
> > This has some drawbacks:
> > 
> >  * the panel_bridge is not created in the context of the driver of the
> >    underlying physical device (the panel driver), but of some other driver
> >  * that "other driver" is not aware of whether the returned drm_bridge
> >    pointer is a panel_bridge created on the fly, a pre-existing
> >    panel_bridge or a non-panel bridge
> >  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
> >    but the "other driver" doesn't know whether this is needed because it
> >    doesn't know whether it has created a panel_bridge or not
> > 
> > So far this approach has been working because devm and drmm ensure the
> > panel bridge would be dealloacted at some later point. However with the
> > upcoming implementation of dynamic bridge lifetime this will get more
> > complicated.
> > 
> > Correct removal of a panel_bridge might possibly be obtained by adding more
> > devm/drmm technology to have it freed correctly at all times. However this
> > would add more complexity and not help making lifetime more understandable.
> > 
> > Use a different approach instead: always create a panel_bridge with a
> > drm_panel, thus matching the lifetime of the drm_panel and the panel_bridge
> > wrapping it. This makes lifetime much more straightforward to understand
> > and to further develop on.
> > 
> > With the panel_bridge always created, the functions to get a bridge
> > [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> > the bridge they are looking for exists already (if it can exist at all). In
> > turn, this is implemented based on a variant of
> > drm_of_find_panel_or_bridge() that only looks for panels:
> > of_drm_find_bridge_by_endpoint(). In the future
> > drm_of_find_panel_or_bridge() can be progressively removed because there
> > will never be a panel not exposing a bridge.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This patch was added in v6.
> > ---
> >  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---------
> >  include/drm/drm_panel.h        |  8 +++++
> >  2 files changed, 66 insertions(+), 16 deletions(-)
> >   
> 
> LGTM, minor issue below.
> 
> > @@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
> >  {
> >  	struct drm_bridge **ptr, *bridge;
> >  
> > +	if (panel->bridge) {
> > +		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
> > +		return panel->bridge;
> > +	}  
> 
> Shouldn't the rest of the function also be removed as you do in other
> cases?

Indeed it should.

And even more, I now realize drm_panel_bridge_add_typed() should also
become a simple 'return panel->bridge', like its devm and drmm
variants, and its code, implementing the actual creation of a panel
bridge, move to an internal function. Otherwise this patch is a bug:
existing drivers which do call drm_panel_bridge_add_typed() would end
up in having two panel_bridges for the same panel.

I must say the process of developing this patch together with the
hotplug work was "convoluted" to say the least, which probably explains
why this got unnoticed so far.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
