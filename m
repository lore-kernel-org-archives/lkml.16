Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDCA252908;
	Mon, 10 Feb 2025 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207523; cv=none; b=YKelzaHWlW5HdU40Jd10G4pHKTZzclfhp+OnZPr580r9Lk5M4q8YjKG5u+hEj7GEccj7uy22sk5dOe7ulLQ2s3Z0COEuBL4g1Zbrajybe33mLMJ1j+0OWyxHSSQgTTk6qL0kyRAQa9CvE0orbqHcEAO4Zts2Kg9a0jXmrv9LXaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207523; c=relaxed/simple;
	bh=lIcXNZRD52o5Dqlt5YJb931Vkr1XRFHtvWIfDzSLX1o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CG68clOEM9+geP6qYF+NOfbaa551sIbQ1fFWKCYBISpFwogW10Z23hpzPheV1WgDVBw2PDil6roP0l52QoApSZZwNEJx2PkWQJcczRxTfTtimUA+TzMaab7PfG9/CQgJo+jjIxlztg/hHfh3+KgUzrireADOD+q9rjAdw+2LnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HpNC6Msz; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HpNC6Msz"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B7494444B;
	Mon, 10 Feb 2025 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739207512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBi7fvn5PPMEBAZTEI/oc6Td7Rh4Sp2q4DZSjZkWn5Q=;
	b=HpNC6MszIjG0ugXiyEhvQs4v3jS2z7Yroa5mVAn5qc57Kia7NGiNVDk0PWzfpcWNnahBOI
	/YoO/HuOmSmTzr6+0nOn+OvXx+E5ngH/PbqMHYZO2j4Xx6n+nv3eo0PTeqLKO79zjJsESJ
	LWom8BhaSJ3Iab3vkrbhMHvkx/OMDlh9ESnLLl0wmIVPzHbOky4fGmOzRFxREzLdgkZpZM
	MKoiqwO1h/OuCIAlTMdD3uoImTAd6YyQBX27Ep8axqL71HvQ/aR7wzyLIvmu1MmEwWn6Sp
	u+xDLsPTc0nTBcbvNHeWCa8V6FQu5zyT3ba4QdbAkV+hux/PwofN4rrvRidlDg==
Date: Mon, 10 Feb 2025 18:11:46 +0100
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
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <20250210181146.232df79d@booty>
In-Reply-To: <aoy4vtqfffq3chbfdqdcrtqmex3pqijlusem7pp37wwsg34lgl@mnaqbp6fijnc>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
	<iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
	<20250207095428.244f0f91@booty>
	<aoy4vtqfffq3chbfdqdcrtqmex3pqijlusem7pp37wwsg34lgl@mnaqbp6fijnc>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrtghom
 hdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Dmitry,

On Fri, 7 Feb 2025 21:43:26 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> > > > @@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
> > > >  {
> > > >  	struct drm_bridge **ptr, *bridge;
> > > >  
> > > > +	if (panel->bridge) {
> > > > +		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
> > > > +		return panel->bridge;
> > > > +	}    
> > > 
> > > Shouldn't the rest of the function also be removed as you do in other
> > > cases?  
> > 
> > Indeed it should.
> > 
> > And even more, I now realize drm_panel_bridge_add_typed() should also
> > become a simple 'return panel->bridge', like its devm and drmm
> > variants, and its code, implementing the actual creation of a panel
> > bridge, move to an internal function. Otherwise this patch is a bug:
> > existing drivers which do call drm_panel_bridge_add_typed() would end
> > up in having two panel_bridges for the same panel.
> > 
> > I must say the process of developing this patch together with the
> > hotplug work was "convoluted" to say the least, which probably explains
> > why this got unnoticed so far.  
> 
> That's why I suggested to post this series separately - it saves you
> from rebasing hotplug work on top.

Yes, that's sure, but not keeping my hotplug patches on top of the
panel_bridge ones makes it much harder for me to test on real hardware,
so each way has pros and cons.

However I might send only the panel_bridge patches at the next
iteration.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
