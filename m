Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA12C42AA1
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 14:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739110591; cv=none; b=jt/kQSLroKUIJ12xblSKOmmQNBPxhHBbTXxgOXOtGGH07s3DcgbmEKPrOAWEHzR9RXM5sDn3p1cyzx8a/Fq3Sgd3mO1CSOLZ5Ux3GWyRbEriHBN4uEgL8jvAJKVuk0QjcnTcNOYaSZ39PCQ4+2u5lbsvw5UjJ1l4V1avznl4ZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739110591; c=relaxed/simple;
	bh=R6xQj+9/rApP/BTQGKA/XYEnlrn5rgzpYiDEJ1Sx49g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gt0IDOcXGX/YKcOVwXnwujfgXJMZXdFrA9WBZ6uMTtHpsqOdHhaIGpo0jy3OCUzhLjbhMCg9mtyO195cTxTG6FqZltoFowlgx3COzXR7d7i6qnlUbdxJhXRfYKWWjk3RulvMbPn+OU5SI129t3gSJnuBzqLWq8v6WrXIgsNSjFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=3T9mzvat; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="3T9mzvat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739110582; bh=R6xQj+9/rApP/BTQGKA/XYEnlrn5rgzpYiDEJ1Sx49g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=3T9mzvatQklneWxegFb3Xh4LxxMd0rfE6Jcyb2dtkpvr96W563pgJsp25x8Du+6i5
	 QmFFj/E63YbxURy0+RcJK91Zb1zqTyqsOm2W0qjLOQFBGz0H8heodibHycCgjKYHvm
	 DtgbSd+4GtyjA/HUud9k/dEXIFntnGAo/c78UB10=
From: Luca Weiss <luca@lucaweiss.eu>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject:
 Re: [PATCH v2 1/3] regulator: core: do not silently ignore provided init_data
Date: Sun, 09 Feb 2025 15:16:17 +0100
Message-ID: <5857103.DvuYhMxLoT@lucaweiss.eu>
In-Reply-To: <20241008-regulator-ignored-data-v2-1-d1251e0ee507@baylibre.com>
References:
 <20241008-regulator-ignored-data-v2-0-d1251e0ee507@baylibre.com>
 <20241008-regulator-ignored-data-v2-1-d1251e0ee507@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On dinsdag 8 oktober 2024 18:07:01 Midden-Europese standaardtijd Jerome Brunet wrote:
> On DT platforms, if a regulator init_data is provided in config, it is
> silently ignored in favor of the DT parsing done by the framework, if
> of_match is set.
> 
> of_match is an indication that init_data is expected to be set based on DT
> and the parsing should be done by the regulator framework.
> 
> If the regulator provider passed init_data it must be because it is useful
> somehow, in such case of_match should be clear.
> 
> If the driver expects the framework to initialize this data on its
> own, it should leave init_data clear.
> 
> Warn if both init_data and of_match are set, then default to the provided
> init_data.

Hi Jerome,

This commit is breaking USB on qcom-msm8974-lge-nexus5-hammerhead for me.

I can't easily provide the full log since USB is breaking with this but in
effect it looks like in drivers/usb/chipidea/core.c in ci_get_platdata()
the call devm_regulator_get_optional(dev, "vbus"); is always returning
EPROBE_DEFER, so USB never initializes.

This vbus regulator is provided by ti,bq24192 so the bq24190_charger.c
driver. While the driver does seem to probe correctly, I do also see that
warning "Using provided init data - OF match ignored" in dmesg.

Reverting this patch on top of v6.13.2 fixes the issue and makes USB work
again.

Regards
Luca

> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/regulator/core.c | 57 +++++++++++++++++++++++++++++-------------------
>  1 file changed, 34 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index d0b3879f2746..a58a9db3d9c7 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -5681,32 +5681,43 @@ regulator_register(struct device *dev,
>  		goto clean;
>  	}
>  
> -	init_data = regulator_of_get_init_data(dev, regulator_desc, config,
> -					       &rdev->dev.of_node);
> -
> -	/*
> -	 * Sometimes not all resources are probed already so we need to take
> -	 * that into account. This happens most the time if the ena_gpiod comes
> -	 * from a gpio extender or something else.
> -	 */
> -	if (PTR_ERR(init_data) == -EPROBE_DEFER) {
> -		ret = -EPROBE_DEFER;
> -		goto clean;
> -	}
> +	if (config->init_data) {
> +		/*
> +		 * Providing of_match means the framework is expected to parse
> +		 * DT to get the init_data. This would conflict with provided
> +		 * init_data, if set. Warn if it happens.
> +		 */
> +		if (regulator_desc->of_match)
> +			dev_warn(dev, "Using provided init data - OF match ignored\n");
>  
> -	/*
> -	 * We need to keep track of any GPIO descriptor coming from the
> -	 * device tree until we have handled it over to the core. If the
> -	 * config that was passed in to this function DOES NOT contain
> -	 * a descriptor, and the config after this call DOES contain
> -	 * a descriptor, we definitely got one from parsing the device
> -	 * tree.
> -	 */
> -	if (!cfg->ena_gpiod && config->ena_gpiod)
> -		dangling_of_gpiod = true;
> -	if (!init_data) {
>  		init_data = config->init_data;
>  		rdev->dev.of_node = of_node_get(config->of_node);
> +
> +	} else {
> +		init_data = regulator_of_get_init_data(dev, regulator_desc,
> +						       config,
> +						       &rdev->dev.of_node);
> +
> +		/*
> +		 * Sometimes not all resources are probed already so we need to
> +		 * take that into account. This happens most the time if the
> +		 * ena_gpiod comes from a gpio extender or something else.
> +		 */
> +		if (PTR_ERR(init_data) == -EPROBE_DEFER) {
> +			ret = -EPROBE_DEFER;
> +			goto clean;
> +		}
> +
> +		/*
> +		 * We need to keep track of any GPIO descriptor coming from the
> +		 * device tree until we have handled it over to the core. If the
> +		 * config that was passed in to this function DOES NOT contain a
> +		 * descriptor, and the config after this call DOES contain a
> +		 * descriptor, we definitely got one from parsing the device
> +		 * tree.
> +		 */
> +		if (!cfg->ena_gpiod && config->ena_gpiod)
> +			dangling_of_gpiod = true;
>  	}
>  
>  	ww_mutex_init(&rdev->mutex, &regulator_ww_class);
> 
> 




