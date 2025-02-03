Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFCD204C34;
	Mon,  3 Feb 2025 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599650; cv=none; b=KmFNApcyOO37zcYBF7fuUAYFCG+am53/O8KHhSqkAa3PH1SjBq3q21Rqxdshy+nuZ864JclESEYUjIP0CdZtaZOJSWE/BUvUa1elfPb5tRUbOd1kwRntEXSNvJYy0jxZSoIDW9IAwM9wImJg9VXw+yTkki3kqbiCUBiar2Jd2lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599650; c=relaxed/simple;
	bh=3xv+V17Ptrg6wSsQ3/e+Aw/cVitVuSazuk113nt7JC8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OQ50YgDqQiMfIPAiR2L4uLqqlv/QZDRB1mTbrkrDLGdzdWldp86y6FR7lbEzemoPEmpory5LghgX2/UzFGivWpBg6teu+xnmUTInxuTIMxITIl0ueG0XPPYcolfyGcafr9Am37AHvDP12NaqcyLWEw6L3FJMMB4APA8FN9L0EhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VGzLqo7r; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VGzLqo7r"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64D014429D;
	Mon,  3 Feb 2025 16:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738599646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYz4KDbtDKCjrsbHPX2KqcCz6vpI0HGScIWPHv7yNeY=;
	b=VGzLqo7ru3D7byHGtK6ocWVcwnSs36x6BnaWyYIukQWJhHOtQn/ZBtEImP02ZGUViqbu3b
	eF0+2qyDnuD4vcvel0aJadqM8isOU/j/bTLY3iUyS9ng8PyET8lRFbbyHGEGXs6vRvXn3v
	0BQefURaqb48Ua8GSquRvHV9ZuobtYv71QewVDX6gRYJOkrpGKkV3p+iphKdksNFi/vyxv
	XHXN2PCwo708ruuSd0ojlLFGbygxbsEz4d5d/FD99DKM1TFDiRSSZdF1IXS+oiWSQONpMt
	iltSwgN3+aE4OuuK3uzeecxg4tP6ALEqKheyGFg/u59G9j+gE5lc2DWf328kRA==
Date: Mon, 3 Feb 2025 17:20:44 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance <kernel-list@raspberrypi.com>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 3/4] drm/vc4: hdmi: Use
 drm_atomic_helper_reset_crtc()
Message-ID: <20250203172044.74967850@bootlin.com>
In-Reply-To: <lu2crev4ikpn2tu6mizmvi4oorb7tbat2uxmcci3qekqi4ohqq@vfps25gpnurk>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
	<20250203145824.155869-4-herve.codina@bootlin.com>
	<lu2crev4ikpn2tu6mizmvi4oorb7tbat2uxmcci3qekqi4ohqq@vfps25gpnurk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekfedtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduveetteevfeevhfeikeehheeujeehfeeutdehgfeiieffteekieevfeehffeiteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehlihhnrghrohdrohhrghdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsthgvihhnsegvfidrthhqqdhgrhhouhhprdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
 hhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Dmitry,

On Mon, 3 Feb 2025 17:56:46 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Mon, Feb 03, 2025 at 03:58:22PM +0100, Herve Codina wrote:
> > The current code uses a the reset_pipe() local function to reset the
> > CRTC outputs.
> > 
> > drm_atomic_helper_reset_crtc() has been introduced recently and it
> > performs exact same operations.
> > 
> > In order to avoid code duplication, use the new helper instead of the
> > local function.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 30 +-----------------------------
> >  1 file changed, 1 insertion(+), 29 deletions(-)
> >   
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

I messed me up in this v4. It doesn't apply on top of v6.14-rc1.

I already sent a v5 to fix that.

Can you add your tag on the v5?

Of course, I will add them myself if a v6 is needed.

I am sorry about my mistake.

Apologies,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
