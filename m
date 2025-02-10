Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7772170826;
	Mon, 10 Feb 2025 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207582; cv=none; b=BKREqL0Pwf0TIa1KsfRshR5aiFTpk8EePtoOY1p5D+XiI4J0rkqyNJ0ErlXNoEjMMbit0/wLdYmLSHz2vQKNo6EqF2Cer1oBwl9FyCBkyL3fDktboJLh/DEejG3T93BY5VekYSyc9nM3871mMy5rGCT/R2HXmqTdqhGI+y/yd18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207582; c=relaxed/simple;
	bh=gz6mtyNZAwm/Ti4LWrUeKCDPsbwvWGyjPqJiPsP+7jY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkxPCqFoZMUZaCWVFagGvfFqEhLiG6lpRvQFCBC8slYU34yA1QJpVXZI6sGUIJ9pRroJpgzKYLIPVJUi6a6zOU1M4Yab2jiU8vtBBkH9/YzyafNRixm3Gtg8CcwXYCV+MD1OmtyeHGuZIgox41EJlJLBwZWuCsgpzFIhOUXszqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Tlq770IU; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Tlq770IU"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E739C204A1;
	Mon, 10 Feb 2025 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739207578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vaaae8hQdMGufW3kcWL9HQNxyaHZJe5tDaHlQP6TfTU=;
	b=Tlq770IUZi4waDyXJuAoriXPcY7QhbuWE3xjbPY80elH9wemxJPpuiUWhDIseMMrVpch6T
	/2wTid2FdGg5/5WlsjIRkQlnKMavZHfIBjB6maPDp20dx53EfKnCQTYgzMe1XeCXM1r11W
	nUT3wf3EimcK5HqoszZRpS6Uf6V5mBmY0KpnkoiyTt/8zKCNHOHqI9Q1xc8vnoTAcFauT+
	1OwFaFp+wNHYLlG1WqAxwBo1y6H7BN94vB/jBWDjvHTltnX9B5i2BKmsr685RhgV+c0chb
	XezviekNgqBC9kG6ttrvlpVRXpaWFuHwHFqGftCNf9ZywKfVpByQlydu7Nvk8w==
Date: Mon, 10 Feb 2025 18:12:52 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
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
 <contact@paulk.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250210181252.5ee028d4@booty>
In-Reply-To: <20250207-ingenious-daffodil-dugong-51be57@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
	<20250207-ingenious-daffodil-dugong-51be57@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepj
 hgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Maxime,

On Fri, 7 Feb 2025 12:47:51 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f64ad2babfebea62db1d9e43 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -31,6 +31,7 @@
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_mode_object.h>
> >  #include <drm/drm_modes.h>
> > +#include <drm/drm_print.h>
> >  
> >  struct device_node;
> >  
> > @@ -863,6 +864,22 @@ struct drm_bridge {
> >  	const struct drm_bridge_timings *timings;
> >  	/** @funcs: control functions */
> >  	const struct drm_bridge_funcs *funcs;
> > +
> > +	/**
> > +	 * @container_offset: Offset of this struct within the container
> > +	 * struct embedding it. Used for refcounted bridges to free the
> > +	 * embeddeing struct when the refcount drops to zero. Unused on
> > +	 * legacy bridges.
> > +	 */
> > +	size_t container_offset;  
> 
> This shouldn't be in there. You can create an intermediate structure and
> store both pointers for the action to consume.

You mean to store container_offset + refcount + is_refcounted?

It can be named drm_bridge_object maybe, as it is somewhat resembling
struct drm_mode_object?

> > +	/**
> > +	 * @refcount: reference count for bridges with dynamic lifetime
> > +	 * (see drm_bridge_init)
> > +	 */
> > +	struct kref refcount;
> > +	/** @is_refcounted: this bridge has dynamic lifetime management */
> > +	bool is_refcounted;
> > +  
> 
> I'm not sure we want to treat both paths separately too. It'll require
> to update most of/all the drivers, but it's not too hard with
> coccinelle:
> 
> virtual patch
> 
> @@
> identifier f;
> identifier b, c, d;
> expression bf;
> type T;
> @@
> 
>  f(...)
>  {
> 	...
> -	T *c;
> +	T *c;
> 	...
> -	c = devm_kzalloc(d, ...);
> +	c = devm_drm_bridge_alloc(d, T, b, bf);
> 	...
> -	c->b.funcs = bf;
> 	...
> 	drm_bridge_add(&c->b);
> 	...
>  }
> 
> We need to add a bit more variations (like kzalloc vs devm_kzalloc,
> drm_bridge_add vs devm_drm_bridge_add, etc.), but it should be a good
> first approximation

Sure, this can be useful, thanks.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
