Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E525944F;
	Wed,  5 Feb 2025 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782750; cv=none; b=EoP2lO39NsDtw6QD6xcBqy+Byc3Yuy0PxVRlk4+yO08J43ZNXAAioaUUN02saL0UfhLpo8m89KCgE0NT8RNGS6Ga/vKpqsSe2Hb8y6LI8s52nRbJ+CbW8YsWcWlQD9Xc3MBD4LYy8nq/DihmASZgdYsKzuVwghsmfOxe+9kZKnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782750; c=relaxed/simple;
	bh=0Eq0ZYNUhCReqOWxdlMg8o8bLR+CDrQ9vCkt6Kdkx14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZYLkthR3meS+haiOw5m0FJ6KbO+gm5OgYQYaaTY8mr7E1mf2tIt16OnyscLLiRirKzj66G55jjjqRfwqHmrfWilu/vsGgYfavLEy9c93aI4CCN7A2vxJqol3ckBoHxfK9Ho/+uCgjwEcbP5o2q4ctY4Y5G/e4mvTDxw2M2ja5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGmIV2gE; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGmIV2gE"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab34a170526so25425966b.0;
        Wed, 05 Feb 2025 11:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738782746; x=1739387546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oketx7tDIhcuG5rUx6z6XVclJQ29lq6S1BBw1NvvIew=;
        b=SGmIV2gExRmWHjgrvYbWWh1TRHDSEXoHDwCvoRt2LBYOuN5qlc53KOY90Q8j5OgGaN
         6hY1bvKc11JsGG1o9WudHj1MgGBDpky9qDF9oxImJRzJolGxJsi5WnJUy1VZm/HOHwRu
         8elsnVAjvyi/+/YYK4HQdHeedheq82DRyUu4ZLeuis4N8xXdn2aYKQev28E0URokS4K6
         M0FGX7kbK7W0rJeQisivHRQFNdqDLBV8AfT1tuFHa0sOWzkf/MlCjgw5dHOZm/+5x24u
         7Jr5hk4To8iSaqHVdEngjeG/V/R1/7PFqZ9nhHOvVw0ROZn4CSYLBKbtmY0yGOodryC2
         Qa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782746; x=1739387546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oketx7tDIhcuG5rUx6z6XVclJQ29lq6S1BBw1NvvIew=;
        b=O6VG+ZY4e8hex1vpezbI3BqNxGHZJBwpu2ROduG8KTLYDklRPYRoJD2qmioGl8NGz7
         kdjL5MNoA3IO8PnXoD+YnwhE5Yy1P0jmmuaxtw/DbY2jxmaKc8FC+BHns+d1v2Wtbxz3
         M6QcOh+iuOwIm3sYB9ZZk7wNjmBmjssL2aPQvvYhqpwNB1P7IOVu0gxggttCcqdMsiBz
         OA7YRETWWkMh494U2xTCK24cPwQHo2uDJb4JFIIn5s0aQABDn7o1URhQJ9UBd2uym8K8
         xc9uliyNE6M8NvhhuYyNovwayPZhmax6hlFJTzC5epLWzVjc4SQtQgJEas/TWx05X8lR
         ZDoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY3nEdaruNJ0ugJO4ILuiGvT0yTz1ExWT55gOo7szIeeRPvTuFi7fcfA6XsIM70RMjVbfvvtoC85eKzqJJ@vger.kernel.org, AJvYcCXfYnZno1klVqUkXrfSdo6tCpWZD2Lb8zALupV4H4GVxnP2t85i3IB/GIsIajWsNAIof2Cl50J/Pbak@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7v3rVG6VRDy47f8avris8Ji4kh7CTuX1yfpnbvyi43qDXAM4n
	lBsf2CA9n+WDr9WFzBw0QbW4G+pB+kaaFCRGXJfJnbtx9BlffhBk
X-Gm-Gg: ASbGncvCAe7Mzn6DTfe/bwaAPw5laKCiyFpIFVMHi+DN0iFkbYIU9IhQvzxbtX84xkk
	2tvsQ5U7u2mo8aA00PoGEgrfh6/As9pU1F/PLxPIojxgIMgexOzOUie0QSJqmHmI1FscVN3OV3C
	eSejIdDYgqe/uwlgmhID8qWvQ7fTdwbwJv7zV/eVmbReJzJSsqwDaYUGewlu2NvwiK4p2kk7suw
	VJWJ/1zotNMsZnK8aMR3ggjusT8ifLGsqOvP1vrq+b0zsqPyK1s50CgcooiiRyj8ByJ2m6y4rB1
	rGRUwRWiH+Ht73rQFwnNDZA29EZolE5BbghKFU+Z+782HoWYEafsZW8=
X-Google-Smtp-Source: AGHT+IGpray5ALEav7UkGYXtShsXqdt+BKxXBeppZNjOdLOI9uz6smW+xBNGlpUOsTJ1/IZIjY5H5g==
X-Received: by 2002:a17:907:1c29:b0:ab6:dd6b:2a3 with SMTP id a640c23a62f3a-ab75e248c8dmr387817266b.22.1738782746161;
        Wed, 05 Feb 2025 11:12:26 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcebe59ff3sm269102a12.62.2025.02.05.11.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:25 -0800 (PST)
Date: Wed, 5 Feb 2025 20:12:23 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 7/7] regulator: bcm590xx: Add support for BCM59054
 regulators
Message-ID: <Z6O4F1pCqwK2774W@standask-GA-A55M-S2HP>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-7-bbac52a84787@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-bcm59054-v3-7-bbac52a84787@gmail.com>

Hi Artur,

some notes below.

On Fri, Jan 31, 2025 at 07:13:55PM +0100, Artur Weber wrote:
> The BCM59056 and BCM59054 are very similar in terms of regulators. Add
> the register definitions for the BCM59054 and enable support for it in
> the driver.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

[snip]

> +	{
> +		.type = BCM590XX_REG_TYPE_LDO,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_LDO_DESC(MICLDO, micldo, ldo_1_table),
> +		},
> +	},

Downstream has MICLDO fixed at 1.8V.
Not sure if that isn't just some vendor hack though :/

https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/drivers/regulator/bcmpmu-rgltr-bcm59xxx.c#L83

> +
> +	{
> +		.type = BCM590XX_REG_TYPE_LDO,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_LDO_DESC(USBLDO, usbldo, ldo_1_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_LDO,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_LDO_DESC(VIBLDO, vibldo, ldo_2_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(CSR, csr, dcdc_csr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(IOSR1, iosr1, dcdc_sr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(IOSR2, iosr2, dcdc_sr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(MMSR, mmsr, dcdc_sr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(SDSR1, sdsr1, dcdc_sr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(SDSR2, sdsr2, dcdc_sr_ranges),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_SR,
> +		.regmap = BCM590XX_REG_REGMAP_PRI,
> +		.desc = {
> +			BCM59054_SR_DESC(VSR, vsr, dcdc_vsr_ranges),
> +		},
> +	},

VSR seems to be different between BCM59054(A0?) and BCM59054A1.
These are the A1 ranges.
Should we differentiate between the two versions, same as downstream?

https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/drivers/regulator/bcmpmu-rgltr-bcm59xxx.c#L736

> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(GPLDO1, gpldo1, ldo_1_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(GPLDO2, gpldo2, ldo_1_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(GPLDO3, gpldo3, ldo_1_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(TCXLDO, tcxldo, ldo_1_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(LVLDO1, lvldo1, ldo_1_table),

According to downstream, this should be ldo_3_table.

https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/drivers/regulator/bcmpmu-rgltr-bcm59xxx.c#L683

> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_GPLDO,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_LDO_DESC(LVLDO2, lvldo2, ldo_3_table),
> +		},
> +	},
> +
> +	{
> +		.type = BCM590XX_REG_TYPE_VBUS,
> +		.regmap = BCM590XX_REG_REGMAP_SEC,
> +		.desc = {
> +			BCM59054_REG_DESC(VBUS, vbus),
> +			.ops = &bcm590xx_ops_vbus,
> +			.n_voltages = 1,
> +			.fixed_uV = 5000000,
> +			.enable_reg = BCM59054_OTG_CTRL,
> +			.enable_mask = BCM590XX_VBUS_ENABLE,
> +		},
> +	},
> +};
> +
>  static int bcm590xx_probe(struct platform_device *pdev)
>  {
>  	struct bcm590xx *bcm590xx = dev_get_drvdata(pdev->dev.parent);
> @@ -487,8 +864,21 @@ static int bcm590xx_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	pmu->mfd = bcm590xx;
> -	pmu->n_regulators = BCM59056_NUM_REGS;
> -	pmu->regs = bcm59056_regs;
> +
> +	switch (pmu->mfd->device_type) {
> +	case BCM59054_TYPE:
> +		pmu->n_regulators = BCM59054_NUM_REGS;
> +		pmu->regs = bcm59054_regs;
> +		break;
> +	case BCM59056_TYPE:
> +		pmu->n_regulators = BCM59056_NUM_REGS;
> +		pmu->regs = bcm59056_regs;
> +		break;
> +	default:
> +		dev_err(bcm590xx->dev,
> +			"unknown device type, could not initialize");
> +		return -EINVAL;

Missing a '\n' in the error message.
Could use dev_err_probe as well. Maybe in other places in the driver too.

Regards,
Stanislav

> +	}
>  
>  	platform_set_drvdata(pdev, pmu);
>  
> 
> -- 
> 2.48.1
> 
