Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89301ACECF;
	Fri,  7 Feb 2025 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918409; cv=none; b=Aq5R0RvI/vcmlfAXEjZf0nbtdKh1v/G2PWUldqwCobUX8NeKOjel+54KZTAJN3BAAynkRYNiwzNKn7vT48dJjKBRUQsHXXYxKhQYeElE445jd74+soqJJoLqvnbRPj1NpkjBbfYiY3Dn27bFvt1v00xFkL9eHdiLQHytey7H7XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918409; c=relaxed/simple;
	bh=HG64Mii3r6zRp9CmIsjmwviU3LgNGTvZ+/LQPp+MEls=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eNAtJ/Wby0ww6kqPpI1t7F/tz1mxPXs6D6/u7BbbVi0aT3nUZ9Vz0Oj6o5humaniCQ/N5N2+TUQEmzGOdME8yNOmnoa/Wo9/TF+bvVrqD6G+LAKWXl2gIl0LAcXhj1aNCUnUNZ2secDgUE7XD71S4LE9qezCvyHja1H49MHxLnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Jt11DHRq; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Jt11DHRq"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9912442CE;
	Fri,  7 Feb 2025 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKxj3pSD0UwzMwdxWit8kdJvq0oc5hRaBZzxFkTM46k=;
	b=Jt11DHRqH/hXBBUEMf6EkKmyU63Y9/C8UFL/hQXT+cT/sBvJcPNHnTdb21tQMKpXIIaS8n
	Tjy72dAH3yPLxX3dqKeROQm5keBVXaUjd58v3UNMxIspmoEGRvwT69peKmMTNn0e6daa3V
	al+b+2v6RA3XNUzYrjh+Ey+kJLdoxAbWb8xNz01kb1g5TW7VMLqikmvXvt4uv+Fj1KkHc1
	DzrZkzZzMjh0JRsawywnNJabEBCijVEZfARH8y0/h/S76bj5yLmPNv8qg/6yDyiExoH/JF
	SR5yL1Mt/orv91qMJq3j0p//MLNZTzIkWXA7UVywXc+HYC491xHAPngeJJyqBA==
Date: Fri, 7 Feb 2025 09:53:18 +0100
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
Subject: Re: [PATCH v6 13/26] drm/encoder: add drm_encoder_cleanup_from()
Message-ID: <20250207095318.2fc8d54e@booty>
In-Reply-To: <spxzxwcs27uv2ttt5mh3r2767ihczvzzrtov6afdmex2ye7lam@r6kdqv5ocg5h>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com>
	<spxzxwcs27uv2ttt5mh3r2767ihczvzzrtov6afdmex2ye7lam@r6kdqv5ocg5h>
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

On Fri, 7 Feb 2025 05:03:13 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:28PM +0100, Luca Ceresoli wrote:
> > Supporting hardware whose final part of the DRM pipeline can be physically
> > removed requires the ability to detach all bridges from a given point to
> > the end of the pipeline.
> > 
> > Introduce a variant of drm_encoder_cleanup() for this.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > Changes in v6: none
> > Changes in v5: none
> > Changes in v4: none
> > Changes in v3: none
> > 
> > Changed in v2:
> >  - fix a typo in a comment
> > ---
> >  drivers/gpu/drm/drm_encoder.c | 21 +++++++++++++++++++++
> >  include/drm/drm_encoder.h     |  1 +
> >  2 files changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > index 8f2bc6a28482229fd0b030a1958f87753ad7885f..472dfbefe2960924a4e83bec425af8c7ef5f5265 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -207,6 +207,27 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> >  }
> >  EXPORT_SYMBOL(drm_encoder_cleanup);
> >  
> > +/**
> > + * drm_encoder_cleanup_from - remove a given bridge and all the following
> > + * @encoder: encoder whole list of bridges shall be pruned
> > + * @bridge: first bridge to remove
> > + *
> > + * Removes from an encoder all the bridges starting with a given bridge
> > + * and until the end of the chain.
> > + *
> > + * This should not be used in "normal" DRM pipelines. It is only useful for
> > + * devices whose final part of the DRM chain can be physically removed and
> > + * later reconnected (possibly with different hardware).
> > + */
> > +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge)
> > +{
> > +	struct drm_bridge *next;
> > +
> > +	list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
> > +		drm_bridge_detach(bridge);
> > +}
> > +EXPORT_SYMBOL(drm_encoder_cleanup_from);  
> 
> Shouldn't drm_encoder_cleanup() also use this function?

Sure. I'll do it in v7.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
