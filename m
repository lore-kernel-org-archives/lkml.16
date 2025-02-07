Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED5B1ACECF;
	Fri,  7 Feb 2025 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918470; cv=none; b=G3+wY28zX0+U2EnTlevTH7vZLt+0vyT6A169Cn9rDpMvQNOsscXTAPX5y6AOXCBB4CBDmhaxgWGB5Gg9amHFGjIr/W9Jv/FFIo7EZGIDxqCgXdlZleljPF/CEPwPU6HmdtmNj6LxhrjnwDoYv+HB2EK1t9f38OikLgwcVP4mcj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918470; c=relaxed/simple;
	bh=VvVtv+HEUmE14dLKRk9XDGe384qIN1pMD+VqSdr40nE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEL3xbKmWcIAVSOw1d1ZNXiFwvM825OnMn6m5BDhvu5r+xZStv4jC5FhLP4Pkt39S9CtwmNYl8R1cfWFMsy2v5Obg4moSf5rAPJFmJHUNAF0/7EuY++0rsqMHDO0wp5MFWBiqGxEK8eyJGKPSszal5M7Lwp6eSf0IVrYEzP9St0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bRuyJMiT; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bRuyJMiT"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5221143421;
	Fri,  7 Feb 2025 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bIOirByBUe+Z/pgSS0CP2M68HwFVjUFI3KKx8O+0aLM=;
	b=bRuyJMiTRrELEebdfdiA9B0NSk7cW0ACh8i8N6hUx8PLACKgule/KvdQcnqB9lKe7dUNw1
	eD/BJlPRZFmDTaRa7bHHHXSO8ZtdQM9m5MgYCIMgoSMbVe4hSsFx+z3IfTeLJ5aT11v9Sa
	AeUA2lH1hS9QJBP74PsqnxaNtwXAS/z2oEGU+Eyaz9Cb/rOSAwRUJ3CcwSBuWByv3RsfME
	JSywNs/Mf/VjZNRgr9KyPKVoZxB/20BvhgAifmEsMu9OcuxHfasWSbrIde0nqYZFEYp74s
	anr4OLGDP60vxZHT5o9+YQIWqgetIyGW7qMCZmOM2XnxIjC1YYPNsS7hEMd5KQ==
Date: Fri, 7 Feb 2025 09:54:17 +0100
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
Subject: Re: [PATCH v6 05/26] drm/debugfs: add top-level 'bridges' file
 showing all added bridges
Message-ID: <20250207095417.4328d05e@booty>
In-Reply-To: <vnmkwcqv74y6qxbgmq7s5fkodjxiaow3hbob7xacfw2n6tyuth@ldddeoshkqdp>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-5-9d6f2c9c3058@bootlin.com>
	<vnmkwcqv74y6qxbgmq7s5fkodjxiaow3hbob7xacfw2n6tyuth@ldddeoshkqdp>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrt
 ghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Dmitry,

On Fri, 7 Feb 2025 04:41:12 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:20PM +0100, Luca Ceresoli wrote:
> > The global bridges_list holding all the bridges between drm_bridge_add()
> > and drm_bridge_remove() cannot be inspected via debugfs. Add a file showing
> > it.
> > 
> > To avoid code duplication, move the code printing a bridge info to a common
> > function.
> > 
> > Note: this change requires exporting bridge_list and the mutex protecting
> > it.
> > 
> > Also add a comment about bridge_lock to make checkpatch happy.  
> 
> I think, exporting mutex _and_ a list is a bad idea (especially since
> they don't have a proper prefix). It might be better to make the
> bridge_print() function a more public one (and name it
> drm_bridge_print()) and move allbridges attribute definition to
> drm_bridge.c

I was also not happy with exporting these two symbols, and agree
exporting a print function from drm_bridge.c is cleaner. I'll rearrange
this for v7.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
