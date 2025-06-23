Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D3C238C19
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687763; cv=none; b=sTuwuwSJ6WtedkjJ2MFV8Gl6apq/TLOfiwzqqkIHRiLMO6WCtC8nkyPmzizk+nr8JjAHAcTQCMgbQut8F3lP4ctDwlnlQMyS66UBrg9gUHC0ao1t8nS70d7ZlE6MvF1dAY7JGMLqDEvW1bLof3SAcD6+D2QoDKGmRxZwmGK1LOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687763; c=relaxed/simple;
	bh=WJrf7i1KXzfNvynCTS7st86LCLu8JMYhTyaMVcHVLLI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMB3Sr1RuiCsv056Fz6JmxvCYF5jiy25BAH/ITXDTg9PbdaQRsq36+Xdfs38OWGiAA5RmYgyXqwQtkKEsBei3nSUAPp/CCdM7O/1o7uK/jIwxrUYWdbVQW2D9rhR1E8/9evGmnYjE38oQ8hgq5BwPWYwiPD71QCiVEmRILNPSH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oQkLm/T6; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oQkLm/T6"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 531EE443B1;
	Mon, 23 Jun 2025 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750687754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tTqzFXucfoLXojG6cheHnIsoX2Ng1HXB6wnPXyTTz+E=;
	b=oQkLm/T6QHfWzh5bGMAbnsCa34uI46vKHRhUpHxX5NE0IaJr2zYoPsHc7EzUtZVsSFVfGS
	I8AltFv5PRy/XTgp7ujqzUS6QWK+GQpLAbxpIgm4eEguFNa2zGavOb5z6UXDIGNJ0p+Qqu
	lZSnNWMzP9Rpbk9uYt7Oe++HnqFKnKj28Bu0pkl50yyVyU142lKiFpbpIAJZoa0hq07xOL
	sR3SBQfRmZnFrG51fUxbR3vDd1urvXDs7MR8Pp5PY2fS1YMZ/ReSwfMsg2Vaa9pUufqhkY
	WSZrgEam039YLW+BxLoOTU2Pwbe78g/vCpmGGMx28FIwrnpedTjp/WD4tMVEDw==
Date: Mon, 23 Jun 2025 16:09:09 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Marek Vasut
 <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 3/5] drm/mxsfb: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
Message-ID: <20250623160909.7d11cfee@booty>
In-Reply-To: <6ed34611-d2fe-4c9c-8b00-0939ac407e07@nxp.com>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
	<20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-3-0321845fcafb@bootlin.com>
	<6ed34611-d2fe-4c9c-8b00-0939ac407e07@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

On Mon, 23 Jun 2025 11:06:37 +0800
Liu Ying <victor.liu@nxp.com> wrote:

[...]

> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index dbd42cc1da87f82ef9cd4ccc70cdecbe56035174..21311cf5efee7d26c80316bffe80dd2bfed02238 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -433,7 +433,6 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> >  	struct drm_connector *connector;
> >  	struct drm_encoder *encoder;
> >  	struct drm_bridge_state *bridge_state;
> > -	struct drm_bridge *bridge;
> >  	u32 bus_format, bus_flags;
> >  	bool format_set = false, flags_set = false;
> >  	int ret, i;
> > @@ -448,6 +447,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> >  
> >  	/* Try to find consistent bus format and flags across first bridges. */
> >  	for_each_new_connector_in_state(state, connector, connector_state, i) {
> > +		struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
> > +
> >  		if (!connector_state->crtc)
> >  			continue;  
> 
> To avoid the unnecessary cleanup for !connector_state->crtc, I would write:
> 
> -8<-
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -433,7 +433,6 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
>         struct drm_connector *connector;
>         struct drm_encoder *encoder;
>         struct drm_bridge_state *bridge_state;
> -       struct drm_bridge *bridge;
>         u32 bus_format, bus_flags;
>         bool format_set = false, flags_set = false;
>         int ret, i;
> @@ -453,7 +452,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
>  
>                 encoder = connector_state->best_encoder;
>  
> -               bridge = drm_bridge_chain_get_first_bridge(encoder);
> +               struct drm_bridge *bridge __free(drm_bridge_put) =
> +                               drm_bridge_chain_get_first_bridge(encoder);

Good idea, I probably didn't think about it because I was grown up in a
world where all declarations must before the code. :-)

Changing this in v9.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
