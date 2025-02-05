Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D28C1519BB
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755371; cv=none; b=a9aUzysksEPd081enJamw8h0J1+nOq6t+p9z27Ph0RqT7peDVLWicLCfEgZOVJmpU/L90wjoK5RcFdxxvDU+tLo0NVRDtGfzBMqbijlbZoL1yKA/wO5Tb46/Qoi8xJDR+nnPEtvurUpJtvfP9ZqYJxwrC2A0NVJuq2mUivdah2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755371; c=relaxed/simple;
	bh=CZalWyzUh7f3lMisyliZwfZE2yjNjOG0elDKScvKaac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAVVDbfOETMFaCcfYSdaIRvLp6q120n2bG+pME2vgzKgprMUpfojw68FLfd7krhTF+tcXcylqoJH4KuYDiOtyBZOOE/Z3dJf0gJYAF2s0Mm7h6asdy4Cu6/sepPo3+qaU5llOCpGUtDwMoi9k7qyz7CWbxV3l7y4Szv/aM/K2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ke1i9Nkc; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ke1i9Nkc"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F4E64429F;
	Wed,  5 Feb 2025 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738755367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HRSMbeLBmI9IM9vn5IMMzrFvGR4JDZcpW3TLuo8Zlds=;
	b=Ke1i9Nkc85hGWARsMnnD2qx8FnOnqh3AtnzHVggKv5G2gH67N7V7l/ySnEhJYHIpaR+ihV
	Pt0Ol01N1BaowbEMIApB3CUXj+iFerh8OoyRf/7suazHFeyg6xl9ZhOmjwqRt/9VpOz6Hb
	CKWoiwh3iH5wAdrhQ7kEjqPRQBzFlOUsqII+w5FLYURIEwxWtNkBTbZ0/AMcypvoITVK6a
	etzCbtLyQHwVNIAQ+gir81GPO1Ylzp287bTzt0qBntZORm9UFy97XAqSinJqU5nu/LXKpz
	HpzcGFz8RFJ0zB5Ed5TEiIElhGzOit9785aC/G7+qojB9WdlmIHgDEOxy7jEfw==
Date: Wed, 5 Feb 2025 12:36:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH v2 14/45] rtc: class: Switch to use hrtimer_setup()
Message-ID: <202502051136068413540a@mail.local>
References: <cover.1738746904.git.namcao@linutronix.de>
 <22f3f087ddbab1708583033c07c3b7fb17810110.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22f3f087ddbab1708583033c07c3b7fb17810110.1738746904.git.namcao@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepnhgrmhgtrghosehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepfhhrv
 gguvghrihgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeiirggtkhdrrhhushhinhessghrohgruggtohhmrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On 05/02/2025 11:46:02+0100, Nam Cao wrote:
> hrtimer_setup() takes the callback function pointer as argument and
> initializes the timer completely.
> 
> Replace hrtimer_init() and the open coded initialization of
> hrtimer::function with the new setup mechanism.
> 
> Patch was created by using Coccinelle.
> 
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/class.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index e31fa0ad127e..b88cd4fb295b 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -240,8 +240,7 @@ static struct rtc_device *rtc_allocate_device(void)
>  	/* Init uie timer */
>  	rtc_timer_init(&rtc->uie_rtctimer, rtc_uie_update_irq, rtc);
>  	/* Init pie timer */
> -	hrtimer_init(&rtc->pie_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	rtc->pie_timer.function = rtc_pie_update_irq;
> +	hrtimer_setup(&rtc->pie_timer, rtc_pie_update_irq, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	rtc->pie_enabled = 0;
>  
>  	set_bit(RTC_FEATURE_ALARM, rtc->features);
> -- 
> 2.39.5
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
