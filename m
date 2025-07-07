Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D11293C6A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894515; cv=none; b=usGZ+TLr2tGj8sktI4hwiyppG0GIR9iUrCasZ6VbpdfWZwTOjUz/4BE9CK+4wfMNla02BvTj55fVVQb9ertwqi0+9tCIW5d6zVhIWY+zb1TeJawKYSmLhhLmC5BNiKD9EbciW67yvzzoiFArDWQqEO3n1jj+V6VG75M++0ZcbxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894515; c=relaxed/simple;
	bh=Ru3+M/cbaTrzjp4aImetXHpZNpXPqmu96nLGmyAqmes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7DsR0RbDazRnJlKSjjxNi6Lx/6JIJWnRud/kq1hCHNf1gKQ/auCj+wRLS5UW0AGTjNdcqLSiiF0Vo+DtcelKT8PkhIPEDq0RmncutF2g4L1mW3f+an5TSECY0NxYXtYUlVnplKRjGAV7EYgK6A3TgnNQz4hmM9eVjw/e+cGmu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ghcpIcsE; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ghcpIcsE"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so647900566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751894511; x=1752499311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkEMk9fl2FbbhV5Z8dp3ny2q0N8JUyHqiBkAQIKlOqk=;
        b=ghcpIcsETVS8Wzb8udZw3RBZfMELxl+/Loe/cc3uxTNuKkWphnu/kKcKuz5EM4c8eN
         oQ8BYRGReUe/o+TJIy618eXJzfEPvdF8YXTV/lWaNHiW6IDmkH4GkXy7ykM4r0wCsQ4o
         XXCk5QQqH5fm7SzrklARHRKxzjhneYjHbNv//75AV/pXNk5rHd0+SNZLBmtsv+ZaxZiI
         g/UwDZch87nGS6wH9zs1eOdurEhe3cg7Gn5sz/SnTglcr4KZQndn3+Ktl0zvDc/G3gb/
         Wrb/V4tqCDVop2HMMw9imic6C/+xJ05N4oHrWh8+ebFZdUNDAK9pgrfGO0ni8HqM4kUe
         x2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751894511; x=1752499311;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkEMk9fl2FbbhV5Z8dp3ny2q0N8JUyHqiBkAQIKlOqk=;
        b=dBPx3WWPJDwlkGqMWuxT/GenxgjDidhBILJfQ4/XJjDzmakFnHZs6fgo3TNag3Hn5W
         iMQZXv7TSjdK0lNHWlgOIA0OZEx7nmgRrf5YayZC6GNaSu1TtlB3Qq+W7cbdeaplep5V
         vzNG+Ru8Y7sUOBjjyDJiSK6LEcxVdUGm7RThfbbDcOsFVxwdyWfSiignrgvNQl9MCdRM
         NWkrgAEa5i8E4+oxfON3bRnXyajmi4Y/dojXQ0NKyzVCgFkJROa9YMU+O6hLJCRKfDYX
         mvtwioMceOp0kqlC9E7pnb9vlYZP17v/sN1AQ3HF7/GFuIP6ArNarhqEud2xWGNrRBPS
         vKsw==
X-Forwarded-Encrypted: i=1; AJvYcCUD1Ks/jZy0jEA8uZul4D5cv89tK1Ar5ssNS7zmiyeZ+EDer9vn9xVrorf/Pq+jYa9e6dh4teG0Kj6P0Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWuMfeMLnH7dloriLYmq4xvmb8OLfKsXPnLRgTiltrnsd5zQy4
	sdm6flhQuHR8Ned3gf+EkCctCtruTvvDsF3BC/C3T73F9WlMrpCnumo0PLDbaCpyZuU=
X-Gm-Gg: ASbGncsXAYRRTnSdKmAf1OhlHymh9uGD0mfzP+ev8GlHsy8mKPncQqJBPEGQ4tMLnaS
	y6YMfgadugjoUw20xRgPYjKGgdn2adKkeQK3gPoFLCV/pTcwZq7oEfV7pXqaN4pal/13e972li0
	Jf+lB+9ufLK0Y2QaNz7tcOPr3sObHpXaiu/HMu0xsjpQaIHQrR0z8LNCWiIE8sp3XapJeaSqyb9
	dXrHgRcuFq6FTafQ3QxoBLK3kWrO/Ld8lNbrsz5ZYSwh5CVg2sEK7AAT1nJ0Pt8Z45zrB5mQoqk
	NHXF+1AKAhSltud097RYzU9wJVw9m76sg+wc2lnPvqWFpZDl6lGvdCSUB0reAUaZiMXKYQ==
X-Google-Smtp-Source: AGHT+IGcdZQfPgn5MuhON9DBnwRAtFsVOqxSQZvAw3EiH4TCI/7Sug8OhdzEELKOQaDG3PMIqGTs7w==
X-Received: by 2002:a17:907:d1a:b0:ae0:daca:f06f with SMTP id a640c23a62f3a-ae410a95654mr691032666b.60.1751894511032;
        Mon, 07 Jul 2025 06:21:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d91c2sm694961966b.28.2025.07.07.06.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 06:21:49 -0700 (PDT)
Message-ID: <486d447b-9984-4044-a620-1d73ffd54111@tuxon.dev>
Date: Mon, 7 Jul 2025 16:21:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/32] clk: at91: clk-sam9x60-pll: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: robh@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 varshini.rajendran@microchip.com
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
 <cc085ca99d75fe59c13acd74782d8437bbc1d65d.1750182562.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cc085ca99d75fe59c13acd74782d8437bbc1d65d.1750182562.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Ryan,

On 24.06.2025 18:08, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures. As clk-sam9x60-pll need to know
> parent's rate at initialization we pass it now from SoC specific drivers.
> This will lead in the end at removing __clk_get_hw() in SoC specific
> drivers (that will be solved by subsequent commits).
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Remove SoC specific driver changes, those
> will be added in subsequent commits.]

With this, series is not bisectable.

Also, building this patch throws:

../drivers/clk/at91/sama7g5.c: In function ‘sama7g5_pmc_setup’:
../drivers/clk/at91/sama7g5.c:1054:12: warning: passing argument 5 of
‘sam9x60_clk_register_frac_pll’ makes integer from pointer without a cast
[-Wint-conversion]
 1054 |      NULL, parent_hw, i,
      |            ^~~~~~~~~
      |            |
      |            struct clk_hw *
In file included from ../drivers/clk/at91/sama7g5.c:17:
../drivers/clk/at91/pmc.h:260:24: note: expected ‘long unsigned int’ but
argument is of type ‘struct clk_hw *’
  260 |          unsigned long parent_rate, u8 id,
      |          ~~~~~~~~~~~~~~^~~~~~~~~~~
../drivers/clk/at91/sama7d65.c: In function ‘sama7d65_pmc_setup’:
../drivers/clk/at91/sama7d65.c:1175:12: warning: passing argument 5 of
‘sam9x60_clk_register_frac_pll’ makes integer from pointer without a cast
[-Wint-conversion]
 1175 |      NULL, parent_hw, i,
      |            ^~~~~~~~~
      |            |
      |            struct clk_hw *
In file included from ../drivers/clk/at91/sama7d65.c:16:
../drivers/clk/at91/pmc.h:260:24: note: expected ‘long unsigned int’ but
argument is of type ‘struct clk_hw *’
  260 |          unsigned long parent_rate, u8 id,
      |          ~~~~~~~~~~~~~~^~~~~~~~~~~
  AR      drivers/clk/at91/built-in.a


Same for the rest of patches in this series following the "Remove SoC
specific driver changes" approach.

> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
>  drivers/clk/at91/pmc.h             |  5 +++--
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
> index cefd9948e103..03a7d00dcc6d 100644
> --- a/drivers/clk/at91/clk-sam9x60-pll.c
> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
> @@ -630,19 +630,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
>  
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name, const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>  			      const struct clk_pll_characteristics *characteristics,
>  			      const struct clk_pll_layout *layout, u32 flags)
>  {
>  	struct sam9x60_frac *frac;
>  	struct clk_hw *hw;
>  	struct clk_init_data init = {};
> -	unsigned long parent_rate, irqflags;
> +	unsigned long irqflags;
>  	unsigned int val;
>  	int ret;
>  
> -	if (id > PLL_MAX_ID || !lock || !parent_hw)
> +	if (id > PLL_MAX_ID || !lock || !parent_data)
>  		return ERR_PTR(-EINVAL);
>  
>  	frac = kzalloc(sizeof(*frac), GFP_KERNEL);
> @@ -650,10 +650,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  		return ERR_PTR(-ENOMEM);
>  
>  	init.name = name;
> -	if (parent_name)
> -		init.parent_names = &parent_name;
> -	else
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	init.parent_data = (const struct clk_parent_data *)parent_data;
>  	init.num_parents = 1;
>  	if (flags & CLK_SET_RATE_GATE)
>  		init.ops = &sam9x60_frac_pll_ops;
> @@ -684,7 +681,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  		 * its rate leading to enabling this PLL with unsupported
>  		 * rate. This will lead to PLL not being locked at all.
>  		 */
> -		parent_rate = clk_hw_get_rate(parent_hw);
>  		if (!parent_rate) {
>  			hw = ERR_PTR(-EINVAL);
>  			goto free;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 63d4c425bed5..b43f6652417f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -255,8 +255,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
>  
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name,
> +			      const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>  			      const struct clk_pll_characteristics *characteristics,
>  			      const struct clk_pll_layout *layout, u32 flags);
>  

