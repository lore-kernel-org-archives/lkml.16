Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1D3204C34;
	Mon,  3 Feb 2025 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599605; cv=none; b=lWBuOZi5yXGEr2dOPp0Kfcl3Rr47vJqHrCtYPh7Lx01C6KCGT+pAiwVUASNUxWt3VyEg1+GMerMnOoRjd47w/+HR67MQMU9cDfndLz9sfjuFYhSPVh1sC4dOSRKVvL7eJW10KyRIsMuukSaGosD8dGyTfyEPby+xF7b7KMmbbTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599605; c=relaxed/simple;
	bh=OjTMV1guMfa5/KQv8pmRK+sEo9OtzT2wBd/COS5jIFA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OANaA4o+igNPMWmmTS31d/6Sen5Yr2bDmvxD40FBij+2zd8hmBNKtHZMrJYaGso/q5vCBHi8ysK1eFHdmN12MwEmP707oUIY34W17opQzEX1ejFHop7aOTEzZSVyjvtUe1DL9DRwXgOy44Pfx1J3XO/uKZBhoJO4FFRSrphf87o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KoYGKX/+; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KoYGKX/+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44BCD44355;
	Mon,  3 Feb 2025 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738599600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnTErnbUvEzR0S3evFPK57DwgP6YL9T3zSo4IupeesQ=;
	b=KoYGKX/+uRMelvdDAN2yMgvUxk9qZfqYrGjTzhP6aBaZ6eZC82sQTzgshG6gStE/UKiGHN
	PiqKtpokTcQY6TjgUqJ+WMJbu4ry0BXjbfkgn6p/+WvnkZReIjs6mnGkLGspNAPMYKiasc
	AzLvL7ISOnV6P0wfLJj3TlAzjuS/UcPoWMDOKb50Wk6MP/LHLE3FUMkJWac+W1YZx7tI2j
	QEx9oP6NbRtmcTUJBCu45EBIaOimfqVJqjS3xk8jj4ZSD9zKG9iyBcqJP72Hn14qeY1ccV
	vlQm/JH6EHYG8y/LxEbVCg/bxMR4Q4PxlmRPaQsOiZE9PrZQ0GRuTL1agqcuLQ==
Date: Mon, 3 Feb 2025 17:19:57 +0100
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
Subject: Re: [PATCH v4 2/4] drm/atomic-helper: Introduce
 drm_atomic_helper_reset_crtc()
Message-ID: <20250203171957.2fbd9717@bootlin.com>
In-Reply-To: <76stqnzkm5itcoavv4vl7hbjiiujtenov3qaigdikxqjsuyif4@jhanrdhw5jly>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
	<20250203145824.155869-3-herve.codina@bootlin.com>
	<76stqnzkm5itcoavv4vl7hbjiiujtenov3qaigdikxqjsuyif4@jhanrdhw5jly>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejffelhfeiudetgeffieefgefgffdvuedvuedtvdefudduueekffelheehffekteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehlihhnrghrohdrohhrghdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsthgvihhnsegvfidrthhqqdhgrhhouhhprdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
 hhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Dmitry,

On Mon, 3 Feb 2025 17:56:33 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Mon, Feb 03, 2025 at 03:58:21PM +0100, Herve Codina wrote:
> > drm_atomic_helper_reset_crtc() allows to reset the CRTC active outputs.
> > 
> > This resets all active components available between the CRTC and
> > connectors.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
> >  include/drm/drm_atomic_helper.h     |  2 ++
> >  2 files changed, 43 insertions(+)
> >   
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
