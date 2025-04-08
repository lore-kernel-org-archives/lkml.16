Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EDE22FACE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128321; cv=none; b=Uey3PzLlyMjaHab0I9uJfc3Cyg9q0h7vvtdJ+vW3Zc3efipayBxoR+uzq1xvrTYcHPSQAHCMfj4hSITRI53VGLs9hK1rXb35vnRpJJcDTs0MYysHiNxKyB6LME+8bXuCxw9tEw5jCxgfy5vEK/EXns/HOLNdOQcim8efmw4R8eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128321; c=relaxed/simple;
	bh=g0KIROiA1Bt90+qNqjX0QDUP6577BKAizBUZOpaFpX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYPeESBvhvItsC7d7uZZf/PVTsNwZbc0C8jdf6GL57Sd5txLnjdFmmotDyDicEs7AH6hltkDvzz6s6lFu+zupqL6hnz88PCyEH2D/tbs9FWF9U9B/xGzfq1eqJPAydmkkEG8Am2IBLGTP7EQ1O8UyQXY6APasWhQ25R9snifpSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ctw0ZfxD; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ctw0ZfxD"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d4496a34cdso19246255ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744128317; x=1744733117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=asx87Qx3dDhJwSi+jaXzp4Fjsaj/1mX8qIAXGOc3zCg=;
        b=ctw0ZfxDG/iL0MF4pAQfVi1O5Uky9S+MMCMVqQD65gWwc1VtqrpTFt3z1eoktIDkic
         RrhKSiQ3oo1rxIgIH9u/v5EUswLbPNnqViV2dp/nFijqlXMOLqNa3/zSm16ks2tHb0VG
         sFx99dGDrnXyNe8vQDGjfaOFz+NXRXKv05ggswXzZw4Y+gK020UrTYDKFAmnAl2KiMqd
         kVb55KkVh0/yy7FDNf3MsHbLJehgVlwf+NKl7bN9als+8/snBkaraQxPrja/kFq9H3/H
         bbLjaJNOtpzm5UEamIu/4kV7xzm6GLVconyrzylSL9NBaKvcgkWn/nQN2KZV5xQvFaIx
         MgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744128317; x=1744733117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asx87Qx3dDhJwSi+jaXzp4Fjsaj/1mX8qIAXGOc3zCg=;
        b=YtjKZQbQ6XmDUWniTreXnZMGEnWRXW+W+YVd2BBXlNzdGbMAW/VilDSrAJdx2NqM1J
         0vtyf7mOy7nhPxIHicLI6+iv1wzaHDJS+3erZvk3r/Dw1lgnN14xsau7Fl7ofX1gRuVN
         ga/U7WIQf583SoVW+SbCj0b2NFCMrfYkL2xEGwc2jqi4f1zJsvjlH+XSeFjJNEJ1RC7n
         +2B8IUJtyIPzCPz5eYFz1tNujKdpHeC+Up+iGCxCUT/BXND1qQ/FVJpWEVjATjDnq5Fq
         njl9w+ovVScYKz+sUCZ/6E3V9RLcX8ucLOHyyo335d1jpRIpzx4GL7ByG8xKsX4LKb6b
         E7rw==
X-Forwarded-Encrypted: i=1; AJvYcCXLyEe1hCHaSe26SrgHBtb+Qs+U1iLHViepZsufkNPPHEHlmIMJIwrvpfwJYRPkgXUiGg84/zTTYM4asdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtqwkXQE3GkH5pX7VIbHn18jut1yAGCOimwNo3ArGl/rGGvLEy
	4BZyMTEYGGEMjrqaL3dbDccdX99ohcy4ofpUpoiMeKqD6nFLvDiQ+wLlwBYeGT8=
X-Gm-Gg: ASbGncv47gK45vF8i35YmWbokojxygsSWLLK2M5tltc26m+XmurAZZGO7Q0Qe2ChDMz
	kJeAYSJ9EdqaNq3Xbd7BCUTOvmIjK8WZaR3AJVOHRvtvb3bjw9phxx5j1sTusfCk/DgraIBjrTR
	K6j9HYtEn1Q9+Vvkts36hRQrkOIEX31DJKlKBLXVVePxq/RMDwX9/X0O8QWoK20t4j+YOsVDkaF
	7MlMW8vlTbsZD+bddZAzrEl8ExVSA+q7zFg3Hr6xUWhrgevoacy1lK2Vyz+WKsUuK2pIRPjkkfw
	+Os6+wlqVqpgvokeWkft5cJFPL/PfMAq7JEXJGs3BDx7dy4B/L6E+uOTuc8zWB2+fSnYq8vnzTi
	lwT39vsvl
X-Google-Smtp-Source: AGHT+IHYUfycAb1D6ob++UC+uXPgjcp9fEEnsdmzaco2ksSrRMK6BkV9YVek8HqOobEA+e4eRIUalA==
X-Received: by 2002:a05:6e02:160d:b0:3d3:dd32:73d5 with SMTP id e9e14a558f8ab-3d6e52f63c8mr180807355ab.4.1744128316639;
        Tue, 08 Apr 2025 09:05:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d703b9970dsm5159065ab.43.2025.04.08.09.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 09:05:16 -0700 (PDT)
Message-ID: <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
Date: Tue, 8 Apr 2025 11:05:15 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts
 scheme
To: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Inochi Amaoto
 <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/25 10:11 AM, Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>    irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> In this patch [1], the GPIO controller add support for describing
> hardware with a three-cell scheme:
> 
>      gpios = <&gpio instance offset flags>;
> 
> It also result describing interrupts in three-cell as this in DT:
> 
>      node {
>              interrupt-parent = <&gpio>;
>              interrupts = <instance hwirq irqflag>;
>      }
> 
> This series try to extend describing interrupts with three-cell scheme.
> 
> The first patch will add capability for parsing irq number and flag
> from last two cells which eventually will support the three-cells
> interrupt, the second patch support finding irqdomain according to
> interrupt instance index.

Did you intend to send more than just one patch?	-Alex

> 
> Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
> ---
> Changes in v4:
> - rebase patch [2/2] to gpio's for-next branch, no changes
> - drop [1/2] of patch v3 which merged into irq tree
> - Link to v3: https://lore.kernel.org/r/20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org
> 
> Changes in v3:
> - explicitly introduce *_twothreecell() to support 3 cell interrupt
> - Link to v2: https://lore.kernel.org/r/20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org
> 
> Changes in v2:
> - introduce generic irq_domain_translate_cells(), other inline cells function
> - hide the OF-specific things into gpiolib-of.c|h
> - Link to v1: https://lore.kernel.org/r/20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org
> ---
>   drivers/gpio/gpiolib-of.c |  8 ++++++++
>   drivers/gpio/gpiolib-of.h |  6 ++++++
>   drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
>   3 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index f29143c71e9db61a6ad6d45d64e88a3f3f2d4fa7..3651c4178b81a1346809ec43b91a532e9f48af2b 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1285,3 +1285,11 @@ void of_gpiochip_remove(struct gpio_chip *chip)
>   {
>   	of_node_put(dev_of_node(&chip->gpiodev->dev));
>   }
> +
> +bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index)
> +{
> +	if (gc->of_node_instance_match)
> +		return gc->of_node_instance_match(gc, index);
> +
> +	return false;
> +}
> diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
> index 16d6ac8cb156c02232ea868b755bbdc46c78e3c7..3eebfac290c571e3b90e4437295db8eaacb021a3 100644
> --- a/drivers/gpio/gpiolib-of.h
> +++ b/drivers/gpio/gpiolib-of.h
> @@ -22,6 +22,7 @@ struct gpio_desc *of_find_gpio(struct device_node *np,
>   			       unsigned long *lookupflags);
>   int of_gpiochip_add(struct gpio_chip *gc);
>   void of_gpiochip_remove(struct gpio_chip *gc);
> +bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index);
>   int of_gpio_count(const struct fwnode_handle *fwnode, const char *con_id);
>   #else
>   static inline struct gpio_desc *of_find_gpio(struct device_node *np,
> @@ -33,6 +34,11 @@ static inline struct gpio_desc *of_find_gpio(struct device_node *np,
>   }
>   static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
>   static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
> +static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
> +					      unsigned int index)
> +{
> +	return false;
> +}
>   static inline int of_gpio_count(const struct fwnode_handle *fwnode,
>   				const char *con_id)
>   {
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8252a671d7208105a315bdc914acb092d5f95e79..ed8397a88dea1d92c3d4cb3cc9a6b30be29d31f6 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1507,9 +1507,8 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
>   						   unsigned int *type)
>   {
>   	/* We support standard DT translation */
> -	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
> -		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> -	}
> +	if (is_of_node(fwspec->fwnode))
> +		return irq_domain_translate_twothreecell(d, fwspec, hwirq, type);
>   
>   	/* This is for board files and others not using DT */
>   	if (is_fwnode_irqchip(fwspec->fwnode)) {
> @@ -1811,11 +1810,26 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
>   	irq_set_chip_data(irq, NULL);
>   }
>   
> +static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *fwspec,
> +			       enum irq_domain_bus_token bus_token)
> +{
> +	struct fwnode_handle *fwnode = fwspec->fwnode;
> +	struct gpio_chip *gc = d->host_data;
> +	unsigned int index = fwspec->param[0];
> +
> +	if (fwspec->param_count == 3 && is_of_node(fwnode))
> +		return of_gpiochip_instance_match(gc, index);
> +
> +	/* Fallback for twocells */
> +	return (fwnode && (d->fwnode == fwnode) && (d->bus_token == bus_token));
> +}
> +
>   static const struct irq_domain_ops gpiochip_domain_ops = {
>   	.map	= gpiochip_irq_map,
>   	.unmap	= gpiochip_irq_unmap,
> +	.select	= gpiochip_irq_select,
>   	/* Virtually all GPIO irqchips are twocell:ed */
> -	.xlate	= irq_domain_xlate_twocell,
> +	.xlate	= irq_domain_xlate_twothreecell,
>   };
>   
>   static struct irq_domain *gpiochip_simple_create_domain(struct gpio_chip *gc)
> 
> ---
> base-commit: 9ed74dfa0822ba58eacaec61fb16bd4feb34a5a6
> change-id: 20250227-04-gpio-irq-threecell-66e1e073c806
> 
> Best regards,

