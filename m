Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D7F27584B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640987; cv=none; b=UfwX+K7tVw3nGxAM26z/iwUiCQuhBmUro4IRXMDagCU3YBJBcSglLbHItUT1iC0/ahLELTmm/UbTxvcMxpQx99X73RxNAeREb/VAMXtan00qAqMcaxvFUQ8qrglCM93Tfe+IFyojpNfgxcxoY6KuvEldAWHWi/3AgCAcJp739hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640987; c=relaxed/simple;
	bh=AGXpGrMlC148+GgB2W3u46+weI6qJa9iC/y8ePmCcYg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UZL0gM09ZjawLhFoQR/Ij+wLfKTzSYljxiucmNZTtwhX6iMjK7kGASeDzCT7R67VUMOu+ENvNml/fZgSQpX5OE/YXNDI2pIKmoHLvrO8jA9o2E+s9q/iYBYjF+MwJdSdWP3nPQ9IahohwfcI8H+WwnQ+miRwjrFQwaB6VOlwrxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gD0pf3BW; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gD0pf3BW"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 388C143B65;
	Mon, 14 Apr 2025 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744640982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xie+wYlronVX0litJyHZVok2sFWIYQBysz1k/Pdu0eM=;
	b=gD0pf3BWYoqLL98uCTX+34RYv65PpA5DCHhCU7ciFJUwtlNb98yzXL26lUueylJCg7Xuvr
	xM9K1qQRz71xh1wquKjmdWn1D92oO+2RI/mIY6NfczywlBYjgHjh9jiRmS5Gvdl9UXwVQA
	s0JdC9o+JZYpGRH+zExB4L6YhHWzfsRZ4n3iX7UFN0t+8i0CZjTknErfans91uy5scj0jJ
	wi/qqNmHH/V5Mm6QHqFC5fY2rdlsb9+0RRnWytjVcYCiCBXBJDseymQLpFk7CyBIaNCrwm
	zf7pKy7H3kwD8rOS7HySS5EXxj/Bi6DSzKVSVSgm2Gm6QQ3hC1FOg0/Y5Eb1Ew==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Uwe =?utf-8?Q?Kl?=
 =?utf-8?Q?eine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Talel Shenhar <talel@amazon.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Guo Ren <guoren@kernel.org>, Herve Codina
 <herve.codina@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [patch 4/7] ARM: orion/gpio:: Convert generic irqchip locking
 to guard()
In-Reply-To: <20250313142524.200515896@linutronix.de>
References: <20250313142404.896902416@linutronix.de>
 <20250313142524.200515896@linutronix.de>
Date: Mon, 14 Apr 2025 16:29:40 +0200
Message-ID: <87mscihl4b.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegrlegsmeelhegvtdemheejrgefmeegugehugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegrlegsmeelhegvtdemheejrgefmeegugehugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhirhhis
 hhlrggshieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehukhhlvghinhgvkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplh
X-GND-Sasl: gregory.clement@bootlin.com

Hello Thomas,

> Conversion was done with Coccinelle. No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Gregory Clement <gregory.clement@bootlin.com>

Applied on mvebu/arm

Thanks,

Gregory


> ---
>  arch/arm/plat-orion/gpio.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> --- a/arch/arm/plat-orion/gpio.c
> +++ b/arch/arm/plat-orion/gpio.c
> @@ -496,11 +496,10 @@ static void orion_gpio_unmask_irq(struct
>  	u32 reg_val;
>  	u32 mask =3D d->mask;
>=20=20
> -	irq_gc_lock(gc);
> +	guard(raw_spinlock)(&gc->lock);
>  	reg_val =3D irq_reg_readl(gc, ct->regs.mask);
>  	reg_val |=3D mask;
>  	irq_reg_writel(gc, reg_val, ct->regs.mask);
> -	irq_gc_unlock(gc);
>  }
>=20=20
>  static void orion_gpio_mask_irq(struct irq_data *d)
> @@ -510,11 +509,10 @@ static void orion_gpio_mask_irq(struct i
>  	u32 mask =3D d->mask;
>  	u32 reg_val;
>=20=20
> -	irq_gc_lock(gc);
> +	guard(raw_spinlock)(&gc->lock);
>  	reg_val =3D irq_reg_readl(gc, ct->regs.mask);
>  	reg_val &=3D ~mask;
>  	irq_reg_writel(gc, reg_val, ct->regs.mask);
> -	irq_gc_unlock(gc);
>  }
>=20=20
>  void __init orion_gpio_init(int gpio_base, int ngpio,
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
