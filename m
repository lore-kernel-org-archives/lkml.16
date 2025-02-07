Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A44A1B21AA;
	Fri,  7 Feb 2025 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918475; cv=none; b=GOPJdHj4qMV2ldaoehwehVJUKUQFQ8EO5aH+aRRKbSb3MM/mMq+bPST89VG1bHc1tD4lZPlvqS8k6aBzcAWcYNfF+FGS1WqLj4ITTT2Btb/Dthza2F2zp4pNqEAqGscHZVrFjtzXtZigTHVoQ/tEWFqgDzfAi6fbKkcuMUzHrY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918475; c=relaxed/simple;
	bh=UJ8I2dPDe5JbemYpklS+KkY/zPvk/l72FwdBnKx1TD0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m2GXLbex2/0dwxMpRiY9EUJjeOb7wJ0J7zq8n/fXpNFcqmViDPZO3ALqkCpSKcA6gBSs+fC5zWuHyUbtpdYj7+sfu1GWTaf5id7+v6DHFU0NuPdA1JRZi0K+GzZiofdhChRELLEwSNQNFXJM0KqTe3HWa3i0VM1Tf/s+WSYXf+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z0VWSCoU; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z0VWSCoU"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 460B24448C;
	Fri,  7 Feb 2025 08:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoCBmvVgLs4tJhNH3SvplVk6Y4bQ+vkNCqsIDM9G1+8=;
	b=Z0VWSCoU5jthj1Xrq+bJ/gIslJpRHawXYRSzaJ0tk8lacrA2Nb2XpjKSaU19T/zoDRw8Hk
	MxG8z7pEXHEn6hcgNkmYCMZEl+Q9Fc7jfeaHfkE8k3GpJ1GSCGLorF22GAbUb5AP+2DX+w
	BY6oINzzqEDutBL5ApPD/xYq2lG4SndLtzVbEd8jdrNEEdILrJGYXKkWMEd1ohtD7M9v4e
	db2ja8CycxHaTgaHHf4Yf9rQ3U+pElBRpnjLorme7LxLxa43lmqtX0S7Hy5a6+u/gBwegk
	gBMCO/DIR588vja+dUxLoVJ3FE7dbQVN23tPj4HbP+N4aaClDCKbSqL0M74hHg==
Date: Fri, 7 Feb 2025 09:54:09 +0100
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
Subject: Re: [PATCH v6 10/26] drm/bridge: add
 devm_drm_of_get_bridge_by_node()
Message-ID: <20250207095409.1b6ba777@booty>
In-Reply-To: <5izgpfrkxrcbcbzr7w5lpm6tidwl4lj66tmnm6l6xmncu6t3uk@2mswjcmi34el>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
	<5izgpfrkxrcbcbzr7w5lpm6tidwl4lj66tmnm6l6xmncu6t3uk@2mswjcmi34el>
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

On Fri, 7 Feb 2025 04:53:32 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:25PM +0100, Luca Ceresoli wrote:
> > devm_drm_of_get_bridge(), which is based on graph links, is the recommended
> > function to get a pointer to the following bridge.
> > 
> > This is valid even for panels, for which the recommended device tree
> > description is via graph links and not (or not only) panel subnodes of a
> > panel controller (e.g. "dsi@1234" controller node with a "panel@0"
> > subnode).
> > 
> > However there are drivers supporting the panel subnode description in  
> 
> I'd say, name them here (at least the one which we looked upon).

Sure, adding the samsung-dsim to the commit message. I'm not aware of
other drivers doing the same, but I will do a quick search.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
