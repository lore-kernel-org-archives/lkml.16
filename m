Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D22B1E04BD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418657; cv=none; b=uG76//SavYsk1N4YkrHunwGy0/Xt8hxH5h1MBlrT0qIlIKPbCLSGerl/M1j9gckEn2DKBQRZOucolDKx7qzn79yLlp/+TycXJOdq33uuwl3wH1V8/mQWI8oH2dlmaHPTMhcTcmqLZxWHpJS3Pu/VvNY2Q1ooaCrOmL5e/+cUvTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418657; c=relaxed/simple;
	bh=quCnlwX+3cp+I5J9k00tk313SB10jzq3J6O7tVzXQPE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sluSlGTtiPvfMZAi0KF+N/ivniC8dR1UUuyEvh4CoQZOSQ+SW0eB6KORXoM2QgrJ2Act9wrThNgxhxC4jXLc1pY9t9KoGOerL+eF3L+oAK+Y7B3o12FS9iJES+gBK8I8s8kotrHy8ELpnYg7M665/0x21tHMziOhWkgOlF4tHyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 456271F02;
	Mon, 31 Mar 2025 03:57:39 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A98BC3F694;
	Mon, 31 Mar 2025 03:57:33 -0700 (PDT)
Date: Mon, 31 Mar 2025 11:57:29 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: Philippe Simons <simons.philippe@gmail.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-sunxi@lists.linux.dev>, Jernej
 =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: add h616 compatible string
Message-ID: <20250331115729.33e54615@donnerap.manchester.arm.com>
In-Reply-To: <9ad57d16-5977-4542-8598-d23d41227e7a@arm.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
	<20250312232319.25712-3-simons.philippe@gmail.com>
	<9ad57d16-5977-4542-8598-d23d41227e7a@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Mar 2025 11:32:58 +0100
Steven Price <steven.price@arm.com> wrote:

Hi Steven,

thanks for having a look!

> On 12/03/2025 23:23, Philippe Simons wrote:
> > Tie the Allwinner compatible string to the two features bits that will
> > toggle the clocks and the reset line whenever the power domain is changing
> > state.  
> 
> This looks fine, but we need the new compatible string to be documented
> in the bindings:
> 
> Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> 
> I'm not sure what the situation is for the device tree for this
> platform, but it would be good to get that all sorted before we merge
> the compatible into panfrost.

The binding addition was sent earlier, as part of my power-domain driver
series:
https://lore.kernel.org/linux-sunxi/20250221005802.11001-1-andre.przywara@arm.com/T/#m083df99cf34ddfd06a6a4b8fbb49636a51b05112

Rob took that one already, and it landed in Linus' tree last week, so
that would be covered.

Cheers,
Andre

> 
> Thanks,
> Steve
> 
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_drv.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 0f3935556ac7..f13743fe6bad 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -776,6 +776,13 @@ static const struct panfrost_compatible default_data = {
> >  	.pm_domain_names = NULL,
> >  };
> >  
> > +static const struct panfrost_compatible allwinner_h616_data = {
> > +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> > +	.supply_names = default_supplies,
> > +	.num_pm_domains = 1,
> > +	.pm_features = BIT(GPU_PM_RT_CLK_DIS) | BIT(GPU_PM_RT_RST_ASRT),
> > +};
> > +
> >  static const struct panfrost_compatible amlogic_data = {
> >  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> >  	.supply_names = default_supplies,
> > @@ -859,6 +866,7 @@ static const struct of_device_id dt_match[] = {
> >  	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
> >  	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
> >  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
> > +	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, dt_match);  
> 

