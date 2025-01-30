Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510481B3939
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 21:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272933; cv=none; b=m3ymnSxvPSEzyNpvvG397a6wpzQNCfWpJYco1SoIsiUI+dLJjrBja8ZhTbuNW4TRxZMB7CdLd3rk7zgZXmAXF86YjnVFB9wVQ3+8IQT4vYkCvrEVwPrIWn3mCWkianOiFdLRI31MmrB1qxsifGmFV7wyo/SStQMGeAGzGqDTztA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272933; c=relaxed/simple;
	bh=fSxW72jfrCCxTWVBKvzhAYcfn3xvggBMkJzBbNrrWM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=itYm8qMG9Kb74lcW7tqxH9UkWifbrsv3dtghqFiT3J1iuAg4ku+qakwBSxKEPgNBvsIHT89QUZSo0tZLO8eGRPe2QZW73Iqv1jRw8pWQLMIFs34cwT/6oUxTSC79g+c8jOz987U3tD7MsPBse7W8z9PwO+h+Lw/R22wVNHOzJT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HnIFT9rp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HnIFT9rp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2166360285dso22380695ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738272930; x=1738877730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QUeKYYRlvfp/QEjhY98ACZrQRlhIrgPVr3AUc340o60=;
        b=HnIFT9rpBvHNpp9yPQOo5wNylRvbqFCr/L0+2yQtf4/+sllHKTtBDEoa2FqvaYF1nG
         qXht/HnheAltwxpky/Ky+t7OaWdMf/qxyVsvTlC8NLtq0Zv/xetI0WWEOObH91Y6W0Xb
         lPMmN+tYqF1cF5Muo3OmWmA0PkXzwHUhXhtcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738272930; x=1738877730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUeKYYRlvfp/QEjhY98ACZrQRlhIrgPVr3AUc340o60=;
        b=TXLZsUr4Egsv0364LMwhcCVe8iuxYDzcOxcX70kgG39ItbPHsTGdPI8W3aB338MfKi
         DPJVg4iuwwfPdCd1LOQMAEIdZfihzLFSQ53confDlwbWXCP51dmyICCQc8ImBBQv22+9
         Ay3gHHBY6i2fMA2mMTAiV9M1gVUweNi5ZQqofTL1ukqd4F7xrpU9vjHL/locF1q3phEi
         tlC+GFsj2Fn0atjxibF8YeXaXPRKEn9/OB8gOHYMFpvi5nxKwBir+ZKg5X4aVaOA3f3y
         bAP7XN5PYwN2CK5hEupNFkCLZsMCcuDaVOhJhfE4jkAWGLJYiDQgrCF8+Bfp7rL86RmE
         IulA==
X-Forwarded-Encrypted: i=1; AJvYcCUPBWT1AA88TYq7fOxtDU91k6ShZP+AlEzuo+LvrVW7P25KnYHM6dE5zkC3CyNiQUcF+AEtBsHGQtThKbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz2aWAwnse1xSuHp1ndb+2Yb2lfzUBMRazoR7n8BIbhSErA2u8
	IhAb1qjXQED9BqJoT8tSEUufwIIG2kExvIo2lBIwAz13vyqskuLk4LFxkkpTvA==
X-Gm-Gg: ASbGncuK2+8qKgMAVNutCUtGT+fUadGEaxJ+HRvlhQ75nIj7EiGTsltwCidPMaXuDzN
	YM3LIAVDZXk0CVA0EVFTB10x/plKmz28g2Pd6KuRPoqTf2TLF/OoSf/UDnBJmu75VROsAV+QD5p
	eEtnskieKAK58s9nbxW18yyHE+PYsmSPF9A8+7w23UpMHSI7gKmet+DXCb8ZE8WBpyjmYe15Zt+
	r9pW08nmBcGpV/h4O6wruTtSme9JQ3/qpCtyFmDYH6jzjoYLYcxfHPdPq2KEm5mpjfMVUx6Zvn1
	HPMQsS3yt32kxZP8Z/64Im4JYwHKP63ehFLqJ18t2CnotG3ewxqkHpI=
X-Google-Smtp-Source: AGHT+IHZo95XO7VEqhqz08Ydw0N2/AnTL2Fl9RNuTQklmgIIobhEvEa5u910+4ndvagFCofr8i5P0g==
X-Received: by 2002:a05:6a21:e92:b0:1db:edc5:c960 with SMTP id adf61e73a8af0-1ed7a5f72b2mr13694120637.12.1738272930506;
        Thu, 30 Jan 2025 13:35:30 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796d6sm1829904a12.55.2025.01.30.13.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 13:35:29 -0800 (PST)
Message-ID: <9965d0b3-f169-45c4-9345-8588865a2ca4@broadcom.com>
Date: Thu, 30 Jan 2025 13:35:28 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: bcm-kona: Make sure GPIO bits are unlocked when
 requesting IRQ
To: Artur Weber <aweber.kernel@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Scott Branden <sbranden@broadcom.com>,
 Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>,
 Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>,
 Christian Daudt <csd@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/25 09:10, Artur Weber wrote:
> The settings for all GPIOs are locked by default in bcm_kona_gpio_reset.
> The settings for a GPIO are unlocked when requesting it as a GPIO, but
> not when requesting it as an interrupt, causing the IRQ settings to not
> get applied.
> 
> Fix this by making sure to unlock the right bits when an IRQ is requested.
> To avoid a situation where an IRQ being released causes a lock despite
> the same GPIO being used by a GPIO request or vice versa, add an unlock
> counter and only lock if it reaches 0.
> 
> Fixes: 757651e3d60e ("gpio: bcm281xx: Add GPIO driver")
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>   drivers/gpio/gpio-bcm-kona.c | 69 ++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 57 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index 77bd4ec93a231472d7bc40db9d5db12d20bb1611..eeaa921df6f072129dbdf1c73d6da2bd7c1fe716 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -69,6 +69,22 @@ struct bcm_kona_gpio {
>   struct bcm_kona_gpio_bank {
>   	int id;
>   	int irq;
> +	/*
> +	 * Used to keep track of lock/unlock operations for each GPIO in the
> +	 * bank.
> +	 *
> +	 * All GPIOs are locked by default (see bcm_kona_gpio_reset), and the
> +	 * unlock count for all GPIOs is 0 by default. Each unlock increments
> +	 * the counter, and each lock decrements the counter.
> +	 *
> +	 * The lock function only locks the GPIO once its unlock counter is
> +	 * down to 0. This is necessary because the GPIO is unlocked in two
> +	 * places in this driver: once for requested GPIOs, and once for
> +	 * requested IRQs. Since it is possible for a GPIO to be requested
> +	 * as both a GPIO and an IRQ, we need to ensure that we don't lock it
> +	 * too early.
> +	 */
> +	u8 gpio_unlock_count[GPIO_PER_BANK];
>   	/* Used in the interrupt handler */
>   	struct bcm_kona_gpio *kona_gpio;
>   };
> @@ -87,14 +103,25 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
>   	unsigned long flags;
>   	int bank_id = GPIO_BANK(gpio);
>   	int bit = GPIO_BIT(gpio);
> +	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
>   
> -	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
> +	if (bank->gpio_unlock_count[bit] == 0) {
> +		dev_err(kona_gpio->gpio_chip.parent,
> +			"Unbalanced locks for GPIO %u\n", gpio);
> +		return;

Don't you want to release &kona_gpio->lock here?

> +	}
>   
> -	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> -	val |= BIT(bit);
> -	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
> +	bank->gpio_unlock_count[bit] -= 1;
>   
> -	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	if (bank->gpio_unlock_count[bit] == 0) {
> +		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
> +
> +		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> +		val |= BIT(bit);
> +		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
> +
> +		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	}
>   }
>   
>   static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
> @@ -104,14 +131,20 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
>   	unsigned long flags;
>   	int bank_id = GPIO_BANK(gpio);
>   	int bit = GPIO_BIT(gpio);
> +	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
>   
> -	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
> +	if (bank->gpio_unlock_count[bit] == 0) {
> +		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>   
> -	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> -	val &= ~BIT(bit);
> -	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
> +		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> +		val &= ~BIT(bit);
> +		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
>   
> -	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +
> +		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	}
> +
> +	bank->gpio_unlock_count[bit] += 1;
>   }
>   
>   static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
> @@ -362,6 +395,7 @@ static void bcm_kona_gpio_irq_mask(struct irq_data *d)
>   
>   	kona_gpio = irq_data_get_irq_chip_data(d);
>   	reg_base = kona_gpio->reg_base;
> +
>   	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>   
>   	val = readl(reg_base + GPIO_INT_MASK(bank_id));
> @@ -384,6 +418,7 @@ static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
>   
>   	kona_gpio = irq_data_get_irq_chip_data(d);
>   	reg_base = kona_gpio->reg_base;
> +
>   	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>   
>   	val = readl(reg_base + GPIO_INT_MSKCLR(bank_id));
> @@ -479,15 +514,25 @@ static void bcm_kona_gpio_irq_handler(struct irq_desc *desc)
>   static int bcm_kona_gpio_irq_reqres(struct irq_data *d)
>   {
>   	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
> +	unsigned int gpio = d->hwirq;
>   
> -	return gpiochip_reqres_irq(&kona_gpio->gpio_chip, d->hwirq);
> +	/*
> +	 * We need to unlock the GPIO before any other operations are performed
> +	 * on the relevant GPIO configuration registers
> +	 */
> +	bcm_kona_gpio_unlock_gpio(kona_gpio, gpio);
> +
> +	return gpiochip_reqres_irq(&kona_gpio->gpio_chip, gpio);
>   }
>   
>   static void bcm_kona_gpio_irq_relres(struct irq_data *d)
>   {
>   	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
> +	unsigned int gpio = d->hwirq;
> +
> +	bcm_kona_gpio_lock_gpio(kona_gpio, gpio);
>   
> -	gpiochip_relres_irq(&kona_gpio->gpio_chip, d->hwirq);
> +	gpiochip_relres_irq(&kona_gpio->gpio_chip, gpio);
>   }
>   
>   static struct irq_chip bcm_gpio_irq_chip = {
> 


-- 
Florian
