Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF70C1B0F09;
	Fri,  7 Feb 2025 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918472; cv=none; b=MPn53tk3/L5c4rQMkSNcu1Pls80DVmwMk8cbK8uRrw//FzKeAxVdLakBjrC6V28fc2TzXUgzB40beOOP5RapjcRkZd52PAhC4t0M8UcbsWUadCiGNM8eKIN6K7OogposQ49DOZyUCgqdiTuNNTYy1BBKulsRDs6aR5tvkv5zGrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918472; c=relaxed/simple;
	bh=kY0zrhbF5aSCadY1DLLMw/PQglkeb1cRlr7u+M5sM5s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oRFUfCKlrcTmZUasaW+sybl9jZPonxZfNs/8gJIYUWn1rjtoamTtaOVXNeGiLO2nz3tCSDk2du8ZU8LqWvLK4DnR5nH4eEDBIt/TuxcpPoP0kRSrMNr1wyX38E/STU8Qm+iE8BPS5EYEwHBRfNIfjfjBRAUmeGIRB6W2y7tkR6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fOFUp/jS; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fOFUp/jS"
Received: by mail.gandi.net (Postfix) with ESMTPSA id AADEC44305;
	Fri,  7 Feb 2025 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJp8akIRBnsrkrhCErMN+Bwkc1U7UHfMk23gxodu8m8=;
	b=fOFUp/jSh0EYlB3qkd71M2qBKu5E+E7/dC5n6KDisJA/4r2WsT3y17QPWZpgasZFqy2giq
	Vnqk2jP450DBAItyENx5W/qlOVvqiPbIaacUCJxc0w600A5K4e1k74Bo4WS8SMztjRz68y
	8ePiLneGfj4VrhE1mW0bXTRnm1dMML1bbYU4fOjmX4uivdD68YP5zcylOeZxUeawMiAgZf
	3io4ZInlrDiN+3gaXfsXPSB/EWFByv5TBXd08LfP0iB7bQ6QxngClkPsPHU9M+DLc4fb06
	b82of3CZ778gVzQBEvu5hU08wDK0/Lj4VcwgrhRKH9XK6Z+1EoekoZfpVk/2EA==
Date: Fri, 7 Feb 2025 09:54:21 +0100
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
Subject: Re: [PATCH v6 09/26] drm/bridge: move devm_drm_of_get_bridge and
 drmm_of_get_bridge to drm_bridge.c
Message-ID: <20250207095421.07ca853f@booty>
In-Reply-To: <aayr7q6i3x34xw7ivvapnk6h6mgx67qhpv2rqk2gotejyjetwy@olb5lbwxd5e3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
	<aayr7q6i3x34xw7ivvapnk6h6mgx67qhpv2rqk2gotejyjetwy@olb5lbwxd5e3>
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

On Fri, 7 Feb 2025 04:52:20 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:24PM +0100, Luca Ceresoli wrote:
> > devm_drm_of_get_bridge() and drmm_of_get_bridge() do not have anything to
> > do with struct drm_panel anymore, they just manage bridges. So move them
> > from bridge/panel.c to drm_bridge.c.
> > 
> > Move also of_drm_find_bridge_by_endpoint() which is used only by
> > devm_drm_of_get_bridge() and drmm_of_get_bridge().
> > 
> > No code changes, only move functions to a different file within the same
> > module and add an #include as needed.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This patch was added in v6.
> > ---
> >  drivers/gpu/drm/bridge/panel.c | 102 -----------------------------------------
> >  drivers/gpu/drm/drm_bridge.c   | 100 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 100 insertions(+), 102 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index 6995de605e7317dd1eb153afd475746ced764712..1230ae50b2020e7a9306cac83009dd600dd61d26 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -418,49 +418,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
> >  }
> >  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
> >  
> > -/**
> > - * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> > - * @np: device tree node containing encoder output ports
> > - * @port: port in the device tree node
> > - * @endpoint: endpoint in the device tree node
> > - * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> > - *
> > - * Given a DT node's port and endpoint number, find the connected node and
> > - * return the associated struct drm_bridge.
> > - *
> > - * Returns zero if successful, or one of the standard error codes if it fails.
> > - */
> > -static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> > -					  int port, int endpoint,
> > -					  struct drm_bridge **bridge)  
> 
> I'd say make this function the main API instead (and name it drm_of
> rather than of_drm, this can happen in the previous patch).

I agree there should be a small number of APIs for the foreseeable
future (and any number of, hopefully decreasing-at-some-point,
deprecated ones).

And I agree this one ^ and the devm_drm_of_get_bridge() below are
equivalent, despite having different signatures, and so one should
disappear.

So, time to think about what APIs we want. Some thoughts of mine:

 * I prefer "get" over "find", looks more intuitive as these functions
   will drm_bridge_get()
 * Is there a logic between of_drm_ and drm_of_? Just "the former is
   old and deprecated"?
 * Since getting bridges via the endpoint is the preferred way, I'd
   like this function to have a shorter name than its variants
 * Returning a struct drm_bridge err_ptr looks better to me than
   returning an error and the bridge via a ptr-to-ptr, especially as we
   don't have anymore the case of returning a panel or a bridge from
   the same function

So, bottom line, we'd have:

 - struct drm_bridge *drm_of_get_bridge(np, port, endpoint)
 - struct drm_bridge *drm_of_get_bridge_by_node(bridge_np)
 - devm_ and drmm_ variants of the above

or a subset of these, in case some is not needed.

What are your opinions?

> > -struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> > -					  struct device_node *np,
> > -					  u32 port, u32 endpoint)

^ kept for reference

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
