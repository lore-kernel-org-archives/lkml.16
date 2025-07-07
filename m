Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55290277028
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894502; cv=none; b=E9vUXyq8Tn0szDzI7uH2A5cnMM6mAvwWs8k1RcB8gBEDPky5qjhXf6YKcZ2qsiwzwXmVWJRwyg7xC/ocY2Nsfybqn6ufOhoL0qrcf7gnYjtkn++kQoApX/pxZlKb+flF7YrQQW9rSy2yYW8sxOrEv/wP759W6XLKqHLvffuCu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894502; c=relaxed/simple;
	bh=CXhkXqeGB25hyxPTUQED9Jf3B5rltj8ADN0ocqEHMGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usYak8IcMDTlxEgZZ2Ftv65z3uujFXXBesezUJhDRt1EREDW8woRusZelSFI+3XcjaxeatK27U24pbhc9KhIQwyHnZRu+iIUeTS0cUgzXoWN19SUjkFtVUsyln7t2CU/eJzWEaBTUzw9ZVaqiLVRsJKT7XSfE7C4bKOkD5eO8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HaBClZ7c; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HaBClZ7c"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so9198430a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751894498; x=1752499298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88Hj80+JwKAktGuML0NE8iEsopKwegKtxu4E6+LCYcM=;
        b=HaBClZ7c+r0lUmJeTPZOESdLBRQ2nKmWX+hxbwk+ZYI8/uJvFHsjvzKUJuhRw3hB0O
         LBwo1kbw3eZZkUaGvooJ6NI2W8KLXB31LFpJGGPLXvd+L1AHEp1H3Hmx8uEu/KUGK9Cd
         jXMAnqrGemZOUp5mvrr1IXf9M8HPD9txaQq+bvTynvWyxekPeVgJlZ8uB7MR30kiacwS
         ungHquo+VtzNWai0XSabWwVTI7qenTQfgtfvtqfhcwE7u5j+uCyJ+oRTYvVArFqcB3Xz
         RBSrRjU7oeOntlZklwT+O7bvLxsKzwrkS68Ln8nhjD0eLscBAXqyj9exryrb7hM2IP2H
         ThiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751894498; x=1752499298;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88Hj80+JwKAktGuML0NE8iEsopKwegKtxu4E6+LCYcM=;
        b=frTvi7Dx3ZGxnFsFM9su/+E79rUL1Hj/WFhIhPe2Yo1UnNgv7kJLTicZ54PFnVAp9o
         dIaBHVkdRZhEPJMkqvhHzPQRsKbKuBmeiYTiuJs/PpC8WWcCjeIlJGk6pLUUTIzVImxb
         Jk7Q2TLUDCDfxTkmhNUjRpm8j3D7Jp31eUT9VFIcgOVA3warrMirf+BpXcuWrgsMJ5Pl
         94HMLsLUchcRqf0e5DvizDUdC4ozqIMy4QONBk/TkWS23rH44xQp2VdbCdutzNPR/HY7
         phxAmtdHYagXRUTUJOGBtXFbNlmZ1bCOkoidOYJvokArCkEwHvUdPHj+o1YCnNrrWLJ4
         yLhA==
X-Forwarded-Encrypted: i=1; AJvYcCVADuVI1jpgQMk/kej+IY2MsE+/tfipFZ5x9ZJi4sInSgeNtPOlzEX1e3z6SN5EpYALlTUm80oaT80T3nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRYyrsGFE0BCc8WrBxsko5f/tz8LzsKvblrI4hywPx6zpttFnp
	zkXRmCmfruTTCXH2YmeCqkuf4Snb0p0bDJRYmRJvWltsURuGW20Kxa45PWCGz38itdENK/lKSjg
	fgwts
X-Gm-Gg: ASbGncufjyaUl22d5jJXZbulwEyj545noC5SC7bgVtC0O/neYzURj0qTOPRq3lA4W/g
	zQs/acecAQxI76yRj8bRRP+DP4qMw95tx8VLHzVay2MXrT4K5pFjHckxkH8debpIMkNnGjaEosW
	SuYxzhJJW0OrcMJpV/oehrOOZTR6561eFQ2W/NMH7ZIbF8TZam9QRmWJg6OrAX1mQN9UuMLjYDi
	09pToGfdPih8CRq92OVYKck1nXdG7HVR8QPoAXYgxF823uvXTx12iXC+mfvkhoD3jvCKmiqFvR6
	It3rM5W2+wE8yN7XW7B4y5NMNVzMAPoTmwsbbyB1vnaNJX034YaLt1ROlnjVKaBjNsUuD5F6IvB
	3HVbK
X-Google-Smtp-Source: AGHT+IFzyM13jt1IUUvVQRLhZHeKZkbXOeQhUKcLed7ydJMeQcOb3SQDzYQWw0i7BJMGbpNC4bEPUg==
X-Received: by 2002:a17:906:f58a:b0:ae0:a0ab:245f with SMTP id a640c23a62f3a-ae3f7a9d0bfmr1448060766b.0.1751894498203;
        Mon, 07 Jul 2025 06:21:38 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02788sm707913166b.113.2025.07.07.06.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 06:21:37 -0700 (PDT)
Message-ID: <54ceeadf-504e-42f6-8b0c-05269d18c44e@tuxon.dev>
Date: Mon, 7 Jul 2025 16:21:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/32] clk: at91: sama5d2: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: robh@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 varshini.rajendran@microchip.com
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
 <6df068977c06a23b503bd9191a2a6cab880c9a1e.1750182562.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <6df068977c06a23b503bd9191a2a6cab880c9a1e.1750182562.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 24.06.2025 18:08, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D2 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting. Extra time saved on registration is
> ~410us when running at 492MHz.

Have you re-check this? I expected to no longer be valid.


> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sama5d2.c | 168 +++++++++++++++++++------------------
>  1 file changed, 86 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
> index 8bbc34e22cda..538ffb8deedb 100644
> --- a/drivers/clk/at91/sama5d2.c
> +++ b/drivers/clk/at91/sama5d2.c
> @@ -37,9 +37,9 @@ static const struct clk_pcr_layout sama5d2_pcr_layout = {
>  	.pid_mask = GENMASK(6, 0),
>  };
>  
> -static const struct {
> +static struct {
>  	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>  	unsigned long flags;
>  	u8 id;
>  } sama5d2_systemck[] = {
> @@ -47,14 +47,14 @@ static const struct {
>  	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>  	 * to keep it enabled in case there is no Linux consumer for it.
>  	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
> -	{ .n = "uhpck", .p = "usbck",        .id = 6 },
> -	{ .n = "udpck", .p = "usbck",        .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",        .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",        .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",        .id = 10 },
> -	{ .n = "iscck", .p = "masterck_div", .id = 18 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "lcdck", .id = 3 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
> +	{ .n = "iscck", .id = 18 },
>  };
>  
>  static const struct {
> @@ -164,25 +164,15 @@ static const struct clk_programmable_layout sama5d2_programmable_layout = {
>  
>  static void __init sama5d2_pmc_setup(struct device_node *np)
>  {
> +	struct clk_hw *hw, *audio_fracck_hw, *usbck_hw, *main_rc_hw, *main_osc_hw;
> +	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
> +	u8 slow_clk_index = 0, main_xtal_index = 1;
>  	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *slck_name, *mainxtal_name;
> -	struct pmc_data *sama5d2_pmc;
> -	const char *parent_names[6];
> +	struct clk_parent_data parent_data[6];
>  	struct regmap *regmap, *regmap_sfr;
> -	struct clk_hw *hw;
> -	int i;
> +	struct pmc_data *sama5d2_pmc;
>  	bool bypass;
> -
> -	i = of_property_match_string(np, "clock-names", "slow_clk");
> -	if (i < 0)
> -		return;
> -
> -	slck_name = of_clk_get_parent_name(np, i);
> -
> -	i = of_property_match_string(np, "clock-names", "main_xtal");
> -	if (i < 0)
> -		return;
> -	mainxtal_name = of_clk_get_parent_name(np, i);
> +	int i;
>  
>  	regmap = device_node_to_regmap(np);
>  	if (IS_ERR(regmap))
> @@ -195,51 +185,52 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  	if (!sama5d2_pmc)
>  		return;
>  
> -	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> -					   100000000);
> -	if (IS_ERR(hw))
> +	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> +						   100000000);
> +	if (IS_ERR(main_rc_hw))
>  		goto err_free;
>  
>  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>  
> -	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
> -					bypass);
> -	if (IS_ERR(hw))
> +	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> +						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
> +						 bypass);
> +	if (IS_ERR(main_osc_hw))
>  		goto err_free;
>  
> -	parent_names[0] = "main_rc_osc";
> -	parent_names[1] = "main_osc";
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	sama5d2_pmc->chws[PMC_MAIN] = hw;
> -
> -	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
> +	hw = at91_clk_register_pll(regmap, "pllack", NULL,
> +				   &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]), 0,
>  				   &sama5d3_pll_layout, &plla_characteristics);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack");
> +	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, &AT91_CLK_PD_HW(hw));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	sama5d2_pmc->chws[PMC_PLLACK] = hw;
>  
> -	hw = at91_clk_register_audio_pll_frac(regmap, "audiopll_fracck",
> -					      "mainck");
> -	if (IS_ERR(hw))
> +	audio_fracck_hw = at91_clk_register_audio_pll_frac(regmap, "audiopll_fracck", NULL,
> +							   &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]));
> +	if (IS_ERR(audio_fracck_hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_audio_pll_pad(regmap, "audiopll_padck",
> -					     "audiopll_fracck");
> +	hw = at91_clk_register_audio_pll_pad(regmap, "audiopll_padck", NULL,
> +					     &AT91_CLK_PD_HW(audio_fracck_hw));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	sama5d2_pmc->chws[PMC_AUDIOPINCK] = hw;
>  
> -	hw = at91_clk_register_audio_pll_pmc(regmap, "audiopll_pmcck",
> -					     "audiopll_fracck");
> +	hw = at91_clk_register_audio_pll_pmc(regmap, "audiopll_pmcck", NULL,
> +					     &AT91_CLK_PD_HW(audio_fracck_hw));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> @@ -249,25 +240,26 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  	if (IS_ERR(regmap_sfr))
>  		regmap_sfr = NULL;
>  
> -	hw = at91_clk_register_utmi(regmap, regmap_sfr, "utmick", "mainck", NULL);
> +	hw = at91_clk_register_utmi(regmap, regmap_sfr, "utmick", NULL,
> +				    &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	sama5d2_pmc->chws[PMC_UTMI] = hw;
>  
> -	parent_names[0] = slck_name;
> -	parent_names[1] = "mainck";
> -	parent_names[2] = "plladivck";
> -	parent_names[3] = "utmick";
> +	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
> +	parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]);
> +	parent_data[2] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_PLLACK]);
> +	parent_data[3] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_UTMI]);
>  	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
> -					   parent_names, NULL,
> +					   NULL, parent_data,
>  					   &at91sam9x5_master_layout,
>  					   &mck_characteristics, &mck_lock);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_master_div(regmap, "masterck_div",
> -					  "masterck_pres", NULL,
> +	hw = at91_clk_register_master_div(regmap, "masterck_div", NULL,
> +					  &AT91_CLK_PD_HW(hw),
>  					  &at91sam9x5_master_layout,
>  					  &mck_characteristics, &mck_lock,
>  					  CLK_SET_RATE_GATE, 0);
> @@ -276,31 +268,32 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  
>  	sama5d2_pmc->chws[PMC_MCK] = hw;
>  
> -	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
> +	hw = at91_clk_register_h32mx(regmap, "h32mxck", NULL,
> +				     &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MCK]));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	sama5d2_pmc->chws[PMC_MCK2] = hw;
>  
> -	parent_names[0] = "plladivck";
> -	parent_names[1] = "utmick";
> -	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
> -	if (IS_ERR(hw))
> +	parent_data[0] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_PLLACK]);
> +	parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_UTMI]);
> +	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_data, 2);
> +	if (IS_ERR(usbck_hw))
>  		goto err_free;
>  
> -	parent_names[0] = slck_name;
> -	parent_names[1] = "mainck";
> -	parent_names[2] = "plladivck";
> -	parent_names[3] = "utmick";
> -	parent_names[4] = "masterck_div";
> -	parent_names[5] = "audiopll_pmcck";
> +	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
> +	parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]);
> +	parent_data[2] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_PLLACK]);
> +	parent_data[3] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_UTMI]);
> +	parent_data[4] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MCK]);
> +	parent_data[5] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_AUDIOPLLCK]);
>  	for (i = 0; i < 3; i++) {
>  		char name[6];
>  
>  		snprintf(name, sizeof(name), "prog%d", i);
>  
>  		hw = at91_clk_register_programmable(regmap, name,
> -						    parent_names, NULL, 6, i,
> +						    NULL, parent_data, 6, i,
>  						    &sama5d2_programmable_layout,
>  						    NULL);
>  		if (IS_ERR(hw))
> @@ -309,9 +302,18 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  		sama5d2_pmc->pchws[i] = hw;
>  	}
>  
> +	/* Set systemck parent hws. */
> +	sama5d2_systemck[0].parent_hw = sama5d2_pmc->chws[PMC_MCK];
> +	sama5d2_systemck[1].parent_hw = sama5d2_pmc->chws[PMC_MCK];
> +	sama5d2_systemck[2].parent_hw = usbck_hw;
> +	sama5d2_systemck[3].parent_hw = usbck_hw;
> +	sama5d2_systemck[4].parent_hw = sama5d2_pmc->pchws[0];
> +	sama5d2_systemck[5].parent_hw = sama5d2_pmc->pchws[1];
> +	sama5d2_systemck[6].parent_hw = sama5d2_pmc->pchws[2];
> +	sama5d2_systemck[7].parent_hw = sama5d2_pmc->chws[PMC_MCK];
>  	for (i = 0; i < ARRAY_SIZE(sama5d2_systemck); i++) {
> -		hw = at91_clk_register_system(regmap, sama5d2_systemck[i].n,
> -					      sama5d2_systemck[i].p, NULL,
> +		hw = at91_clk_register_system(regmap, sama5d2_systemck[i].n, NULL,
> +					      &AT91_CLK_PD_HW(sama5d2_systemck[i].parent_hw),
>  					      sama5d2_systemck[i].id,
>  					      sama5d2_systemck[i].flags);
>  		if (IS_ERR(hw))
> @@ -324,7 +326,8 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
>  							 &sama5d2_pcr_layout,
>  							 sama5d2_periphck[i].n,
> -							 "masterck_div", NULL,
> +							 NULL,
> +							 &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MCK]),
>  							 sama5d2_periphck[i].id,
>  							 &range, INT_MIN,
>  							 sama5d2_periphck[i].flags);
> @@ -338,7 +341,8 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
>  							 &sama5d2_pcr_layout,
>  							 sama5d2_periph32ck[i].n,
> -							 "h32mxck", NULL,
> +							 NULL,
> +							 &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MCK2]),
>  							 sama5d2_periph32ck[i].id,
>  							 &sama5d2_periph32ck[i].r,
>  							 INT_MIN, 0);
> @@ -348,17 +352,17 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  		sama5d2_pmc->phws[sama5d2_periph32ck[i].id] = hw;
>  	}
>  
> -	parent_names[0] = slck_name;
> -	parent_names[1] = "mainck";
> -	parent_names[2] = "plladivck";
> -	parent_names[3] = "utmick";
> -	parent_names[4] = "masterck_div";
> -	parent_names[5] = "audiopll_pmcck";
> +	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
> +	parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]);
> +	parent_data[2] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_PLLACK]);
> +	parent_data[3] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_UTMI]);
> +	parent_data[4] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MCK]);
> +	parent_data[5] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_AUDIOPLLCK]);
>  	for (i = 0; i < ARRAY_SIZE(sama5d2_gck); i++) {
>  		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>  						 &sama5d2_pcr_layout,
>  						 sama5d2_gck[i].n,
> -						 parent_names, NULL, NULL, 6,
> +						 NULL, parent_data, NULL, 6,
>  						 sama5d2_gck[i].id,
>  						 &sama5d2_gck[i].r,
>  						 sama5d2_gck[i].chg_pid);
> @@ -369,19 +373,19 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  	}
>  
>  	if (regmap_sfr) {
> -		parent_names[0] = "i2s0_clk";
> -		parent_names[1] = "i2s0_gclk";
> +		parent_data[0] = AT91_CLK_PD_HW(sama5d2_pmc->phws[54]); /* i2s0_clk */
> +		parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->ghws[54]); /* i2s0_gclk */
>  		hw = at91_clk_i2s_mux_register(regmap_sfr, "i2s0_muxclk",
> -					       parent_names, 2, 0);
> +					       NULL, parent_data, 2, 0);
>  		if (IS_ERR(hw))
>  			goto err_free;
>  
>  		sama5d2_pmc->chws[PMC_I2S0_MUX] = hw;
>  
> -		parent_names[0] = "i2s1_clk";
> -		parent_names[1] = "i2s1_gclk";
> +		parent_data[0] = AT91_CLK_PD_HW(sama5d2_pmc->phws[55]); /* i2s1_clk */
> +		parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->ghws[55]); /* i2s1_gclk */
>  		hw = at91_clk_i2s_mux_register(regmap_sfr, "i2s1_muxclk",
> -					       parent_names, 2, 1);
> +					       NULL, parent_data, 2, 1);
>  		if (IS_ERR(hw))
>  			goto err_free;
>  

