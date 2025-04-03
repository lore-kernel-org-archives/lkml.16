Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC231E7C27
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743667444; cv=none; b=kXoWvImyz1gyNUCEp2n+buh2HLppnS1eBQ/Pu5RWK488Dyf6yRj7ODwHl2q2mL3pbtaFrRKgD7W2NOwP4VMN+aUHDbXJAogGrp+gmBcrg30zDRzJbXvJjbe/RzBWY3Jaw8YjN2TyLED03gOBcawkIQpsgH6YGfeI1qguLLwDoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743667444; c=relaxed/simple;
	bh=4CDET8HY4bzxF7350jaD49xltN5LQM8HEsVV5xhKyec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euc0Rp7N/tGDOvGWLPjdxDM56MqjJR7RpZD/oWPV49JgSn36rXEvrzBojaf68rMS4eMA45Irk4zSw2oVqexot3WvYxO/xm5yi+8RxNc+FntnV2UPSmoyXeFEQJV/mr67AvHqz9OLrSQx41sFvGTrpEDd6JQ9n06TBh6WG+61vXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RjnN8jxY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RjnN8jxY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso5251765e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1743667441; x=1744272241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ODOqqsnViZ1sK0aQSYfZkG1OgH6kYCvoMC0DZ3dd3I=;
        b=RjnN8jxYBKS1yhgpMTOWG/THFMI8b5ik2EcG1GKgiinUNHofP2aZYvqt4uYiRXIhME
         dKFLEpRDy6ouozh9y5mdt0NLbBF33yt2L4IrnySAlZg3Gv/VQpQu9O5Xg+IIAP0q5FLw
         nU3FPpaaKHIEgMU5l3WoAuRD5/0aJzvjQIhDx+koFREkSMNATE5tX0bJxGl5t47T53Fr
         QtNW3FHxpVDac6fN8ci7ULPY4riT3iZdhHdE+hJ0MZLRCnulFV636gM5JWVuKBBGc8t5
         XjBA4Y5p4QjfDhMdLKNTCc4aQOeJ7TMp52P1x79TK9H8JeGOmKz4KmEuuHFN0vcLvOWt
         dDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743667441; x=1744272241;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ODOqqsnViZ1sK0aQSYfZkG1OgH6kYCvoMC0DZ3dd3I=;
        b=VHUJacaiYpE7V3l3R9jNwxvpu7R4r1YDDKrrJqvsQ8uQE4MlWU0NQxUFOyUtWC+BjB
         GcRh2PlCfaSVK56fN+eQTyZWleipxxSCCgdL2vDxwSDVem/bbSGNSK0bbUaW/GEGidyM
         rdPZZZcaRru+iFdl7xFGqWG3pVSl5EI7QwZNAAj7YBt3COEMcJxN0syj0329KqkZsFTx
         CVq3Dzg8Ie8pqMrs6CNfO+hrjsHzCj6OUIPt+SuyegEqpxCj7m8Yiw94Suo6+67rWfXI
         fDsA8Juja2/P3vopWTw6abEFbtIc6B5+MAfUgVtCVttvcFtm2AnnEHa+SvjnzKYiHq9y
         Ibbw==
X-Forwarded-Encrypted: i=1; AJvYcCUzPdhKPYXTg8ATmQGnh2SO2L6c0eg6WHwy5BN6BYr1KVzj12DP0Ir6XJlBE4gZjuts7Of/BnIhaJmhSpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2C8Ly9/ZYpWkxtyjtIIuGLdatUSnnuUpQPHnoaY9f7U+hpm5B
	USK+Gkb40SxekrYe3VqE6BGJYITw6YQAd1uwtZb+S7NpKeRxvEYz+OVMLRroJhs=
X-Gm-Gg: ASbGncujc6kD727d1Ac6T2hlhhigCHQiWeM1w6dyiVgjMYiZGJnJ5dzeIn0jVy19/Ov
	J7cJh3RJZBbVv47YML7fBBEF9uuPBKJXMDI94/f62U+l/Ja/FukOt2rSpDRMShIiyNwdEWc6TO6
	cvm0/XnIwhtH20IvltpD1RwLhrbG3HA098bb0ZqqtITXevEPblsxy5D6d3hihpOx/ffcl5u2+Ul
	KdbQluWwUjs0H9uoJ9M6AH6TVDEkkJAxTPrFCocL+TVvuRTj7Y24XAY8XVafkFm3/SCx1WfHl8k
	ZBNR73DcEmTQrUf3I8deUU9h+YUXiGT2RyLswXxH1dYv7T08KkFW
X-Google-Smtp-Source: AGHT+IECVq2HRR1Nyv/1p/1GP+gWgvLkESx2Rr9YngJsLXpP3nOlkno+7eGPJSpNvzemFUEsWCN0zg==
X-Received: by 2002:a05:600c:450f:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-43ec13fc752mr14693545e9.16.1743667440603;
        Thu, 03 Apr 2025 01:04:00 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096cc1sm1064581f8f.5.2025.04.03.01.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 01:04:00 -0700 (PDT)
Message-ID: <8412725b-8d62-44a1-8929-7de7de8dfdbf@tuxon.dev>
Date: Thu, 3 Apr 2025 11:03:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] soc: renesas: rz-sysc: add syscon/regmap support
To: John Madieu <john.madieu.xa@bp.renesas.com>, geert+renesas@glider.be,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org
Cc: magnus.damm@gmail.com, devicetree@vger.kernel.org, john.madieu@gmail.com,
 rui.zhang@intel.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, sboyd@kernel.org,
 biju.das.jz@bp.renesas.com, linux-pm@vger.kernel.org, lukasz.luba@arm.com
References: <20250330214945.185725-1-john.madieu.xa@bp.renesas.com>
 <20250330214945.185725-2-john.madieu.xa@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250330214945.185725-2-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, John,

On 31.03.2025 00:49, John Madieu wrote:
> The RZ/G3E system controller has various registers that control or report
> some properties specific to individual IPs. The regmap is registered as a
> syscon device to allow these IP drivers to access the registers through the
> regmap API.
> 
> As other RZ SoCs might have custom read/write callbacks or max-offsets, let's
> register a custom regmap configuration.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> v1 -> v2: no changes
> v2 -> v3: no changes
> v3 -> v4: no changes
> v4 -> v5: no changes
> 
> Note for Maintainers: There is a false positive warning reported by
> checkpatch.pl on this patch patch stating that the regmap_config struct
> should be const, despite the fact it's updated in probe().
> 
>  drivers/soc/renesas/Kconfig         |  1 +
>  drivers/soc/renesas/r9a09g047-sys.c |  1 +
>  drivers/soc/renesas/rz-sysc.c       | 30 ++++++++++++++++++++++++++++-
>  drivers/soc/renesas/rz-sysc.h       |  2 ++
>  4 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 49648cf28bd2..3ffd3a4ca18d 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -388,6 +388,7 @@ config RST_RCAR
>  
>  config SYSC_RZ
>  	bool "System controller for RZ SoCs" if COMPILE_TEST
> +	select MFD_SYSCON
>  
>  config SYSC_R9A08G045
>  	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
> diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
> index cd2eb7782cfe..5b010a519fab 100644
> --- a/drivers/soc/renesas/r9a09g047-sys.c
> +++ b/drivers/soc/renesas/r9a09g047-sys.c
> @@ -64,4 +64,5 @@ static const struct rz_sysc_soc_id_init_data rzg3e_sys_soc_id_init_data __initco
>  
>  const struct rz_sysc_init_data rzg3e_sys_init_data = {
>  	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
> +	.max_register_offset = 0x170c,
>  };
> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
> index 1c98da37b7d1..bcbc23da954b 100644
> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -6,8 +6,10 @@
>   */
>  
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/sys_soc.h>
>  
>  #include "rz-sysc.h"
> @@ -81,6 +83,14 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
>  	return 0;
>  }
>  
> +static struct regmap_config rz_sysc_regmap = {
> +	.name = "rz_sysc_regs",
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.fast_io = true,
> +};
> +
>  static const struct of_device_id rz_sysc_match[] = {
>  #ifdef CONFIG_SYSC_R9A08G045
>  	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
> @@ -97,14 +107,21 @@ MODULE_DEVICE_TABLE(of, rz_sysc_match);
>  
>  static int rz_sysc_probe(struct platform_device *pdev)
>  {
> +	const struct rz_sysc_init_data *data;
>  	const struct of_device_id *match;
>  	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
>  	struct rz_sysc *sysc;
> +	int ret;
>  
>  	match = of_match_node(rz_sysc_match, dev->of_node);
>  	if (!match)
>  		return -ENODEV;
>  
> +	data = match->data;
> +	if (!data)
> +		return -EINVAL;
> +
>  	sysc = devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
>  	if (!sysc)
>  		return -ENOMEM;
> @@ -114,7 +131,18 @@ static int rz_sysc_probe(struct platform_device *pdev)
>  		return PTR_ERR(sysc->base);
>  
>  	sysc->dev = dev;
> -	return rz_sysc_soc_init(sysc, match);
> +	ret = rz_sysc_soc_init(sysc, match);

The return value of rz_sysc_soc_init() is lost in case
data->max_register_offset != 0. Is there a reason for this?

> +
> +	if (data->max_register_offset) {
> +		rz_sysc_regmap.max_register = data->max_register_offset;
> +		regmap = devm_regmap_init_mmio(dev, sysc->base, &rz_sysc_regmap);
> +		if (IS_ERR(regmap))
> +			return PTR_ERR(regmap);
> +
> +		ret = of_syscon_register_regmap(dev->of_node, regmap);
> +	}
> +
> +	return ret;
>  }
>  
>  static struct platform_driver rz_sysc_driver = {
> diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
> index aa83948c5117..37a3bb2c87f8 100644
> --- a/drivers/soc/renesas/rz-sysc.h
> +++ b/drivers/soc/renesas/rz-sysc.h
> @@ -34,9 +34,11 @@ struct rz_sysc_soc_id_init_data {
>  /**
>   * struct rz_sysc_init_data - RZ SYSC initialization data
>   * @soc_id_init_data: RZ SYSC SoC ID initialization data
> + * @max_register_offset: Maximum SYSC register offset to be used by the regmap config
>   */
>  struct rz_sysc_init_data {
>  	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
> +	u32 max_register_offset;
>  };
>  
>  extern const struct rz_sysc_init_data rzg3e_sys_init_data;

