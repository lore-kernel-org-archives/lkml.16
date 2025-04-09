Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5250625E80F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744202834; cv=none; b=lLzf5cZACBrJvLf70sXFz5G7iPoyo8PteuNIu6ezF0bQBrQ3hCzVUCuiXfanz8SmXi0Hn/j12eKozYdPQX74I9bI8qOo04x9vCn1fFa1h8RLDYxnryk+j5G0jwm441hoXh8IwfUDrgPowNwNRLvTzWxLR/MWbeCJABYrwj/U2lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744202834; c=relaxed/simple;
	bh=2sxTchRu1XQdJGmWVI1yN9QSLWL909ueauOjYWjX7lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maVJSC0Em7T2IXLyV3JFxCMn/5hd1ADti4AlwmJICIx8/E53rCHrrnlztrtczZKTNNqtXA9mmucxSUs4APumdxRtg7HcQoqVtCBS3X0/FqwSZpgZGEAWvUcrB0i1nHXooou2EhwJDccWp655F+LXSAih3thSj1zGQE1CY8TnJZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dLiMPFgs; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dLiMPFgs"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1214D44281;
	Wed,  9 Apr 2025 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744202829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0p6IL4xM543LamQB5lij8MdpPeDMo1EXZtv42MQAlC8=;
	b=dLiMPFgsbn3tCkIA8vPeKMYpXLpXH5jdsmhO3t0lmA39qw+RZ1jk1EclOP6xmalZpdcAzx
	fvTwilPdp1+c105Hfm8244MXDAmVvZukE+YnyMhyzL75NBlt3pOkE2eyP8KZr9zvWjScH6
	e33pxifzCbxMZ+ndY1TXZH10m95A4nWBAcf60OBVJYXl45kMll0BRCDV2lUQ6Q4dBDByan
	KdQAw7X7P1tSVqSzUixqZebf2xNv6dA1T5WQguvf9HXvH0/hVn4zc6idWOc7fcX2IPvdxU
	2pMfzgrR9PfKha93z7GyfhlCEVshg8Uf4A9GCEYToVQz2hgRmknuVffmw/Qp9Q==
Date: Wed, 9 Apr 2025 14:47:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] [v2] clocksource: atmel_tcb: fix kconfig dependency
Message-ID: <20250409124707fb2456b9@mail.local>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409122314.2848028-2-arnd@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeitdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhglhigs
 ehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 09/04/2025 14:22:54+0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Build-testing this driver on arm without CONFIG_OF produces a warning:
> 
> drivers/clocksource/timer-atmel-tcb.c:368:34: error: 'atmel_tcb_of_match' defined but not used [-Werror=unused-const-variable=]
>   368 | static const struct of_device_id atmel_tcb_of_match[] = {
>       |                                  ^~~~~~~~~~~~~~~~~~
> 
> Change the dependency to allow build-testing on all architectures but
> instead require CONFIG_OF to be present.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> v2: fix build regression from dropped CONFIG_ARM dependency
> ---
>  drivers/clocksource/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 487c85259967..a7d5a465100e 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -437,8 +437,8 @@ config ATMEL_ST
>  
>  config ATMEL_TCB_CLKSRC
>  	bool "Atmel TC Block timer driver" if COMPILE_TEST
> -	depends on ARM && HAS_IOMEM
> -	select TIMER_OF if OF
> +	depends on ARM && OF && HAS_IOMEM
> +	select TIMER_OF
>  	help
>  	  Support for Timer Counter Blocks on Atmel SoCs.
>  
> -- 
> 2.39.5
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
