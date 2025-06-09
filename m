Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1A1CF7AF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500071; cv=none; b=nLzPfHHkbV0UtuSTEypMTQQqmyDczEFJvhuX9fv0qppXlWwj8xcXW3La73Z36eUeL3ksrCZmrIJF4PkTxwPWw3XWXW4IZiijSVjAmYxX0zHsD7+Pv4J77X21mf/tdOXwy0XuIOuU3fK7KILS3s8B+ZXqL19BOloIcIRDel5dXP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500071; c=relaxed/simple;
	bh=cc13l7pbpIRdIEC25QVqWj0lamcvY3YyLME1tijvOPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6iCryjJjzP0ZLq+7LVNMBNrcf8Ogp/7ZO/ZQNGp+vYnZ8dFjxXsXPnWzl2QZOUPaVFfY4R8qsMfo3/ZWcNXUhcsvvkyL5LCKJOKrPcUvHLL+vOsFJk6WrSZoC+2f2oc2taS8KCLcCACEtwp4hY/UCHLARLib8ClhbSK6KgAMH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fBv/pCWD; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fBv/pCWD"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecf99dd567so61618646d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 13:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749500067; x=1750104867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFj+rnVnwrli61+RW3pW0hp2hmvQPvdmAdNSR40r1ZE=;
        b=fBv/pCWDZBsrmhi+S5m15nxdEmb6BnFtmvfNSy1cBdVTHR95TiSSrT8bjV/0jMq8bP
         yad/mpUqZw5k24orKm27KxVWETuwuHNyP+1ocWo8Khzcz5hmEf5QJ246igPfgIjGaPnc
         cYxUaoRvYWb9lkDlzYCUIxjyZijSyTVILgPDMwJn8H4luK6X/G2YMoRpwodgrJAqkRZX
         F/BAIaJey0SVFnBBun71bT5dTx9Sw7EVg9L4kyZ97xB3QtO/D4WMkdYEg4FVVEAyX1JA
         s9MRe5PAsc3YFDVi1qHTfauuAr24COOug7RINrORwnbhe8ZfdxWMWMal94RgXoTndp1m
         tbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749500067; x=1750104867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFj+rnVnwrli61+RW3pW0hp2hmvQPvdmAdNSR40r1ZE=;
        b=s2di4Unu6yCixAetyMEqBvtvXvJTe7HhF1oHEXVSKQP1f9pud6dNcfSvmOh4TR+hO8
         vwYw4B3K1W6NhvIKoTg9tt49FpZedpZRWkHhsqFLlqKus0hF+M+ev6uKkeCmbIwnN1RD
         8e/60HgnmHtlwbuyKV1rice74yJXX31NuXF2eukolMlEXwba5jAQ+IXAwzgHQ6tkh/4g
         1kIzssx5DpQViGfIaQKOjHLnQpsrUobtsHsYbrqD6lqBSmJc7BB34TvDSjwLd/5Dn42L
         Pqexle4h5h+5GzwVqCsDm96hPakThOfSYiq3jVcreu6HCC0d3TPIolSkbYYKt34hRDZc
         O1Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXsy39bzAOL3vWriSogIffA24FQMxbdz0hEUrTIBhAi0j2qEjkdEBs9fySS4ETcLasd3tj8tALJ/5mYL4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhd3ar+z2CbwItpOvxdwFRMpIE3ArT5BMeOJNkzlh16SqPmABw
	ff0f/oed6IA0YWYpWjOnwjkrSav1/ZYHYj2umBPNbUYrLxJ6yONNmKHz3eiVUhZ+pq0=
X-Gm-Gg: ASbGncsweqKyACEyCIno59936x48Ek58or8w0aoZezsgkB2fmeI46nE4FJyOGnGp09z
	HxGg6KUL80brw61dz7OmbY6m3pWRTrQ6EG8CGwSQWxnCNEem45x7DYAF6E/oabJiJ2v+qtNae8J
	cQpPGVW44Lhz+IG1RO5TSBj1RJ/qdJKJ0xobSg9O3jSBA6m7eW9WMfZTdxSNUC5eZunC2AdumE+
	qHDm/8XzSU2mDUfufdFGb9gp7mU64CP03htJxQmrrkYmHPMe95WK+78GbO7DOxsuyY18jKsqIqK
	x5QlE+ae99k5NdaI3NYRPOgSMX3h5/PyPFr4npso2lVOVwmsfyIezncwC2g6MHJY9xfJRyM+Io+
	vSdvKpVmA/qxomMBS9pAzOi8hfWQ6gWjGSQ61
X-Google-Smtp-Source: AGHT+IEoxsMyfv1zl4Eq2z6OuyNYN5zJiRV3axkBglw2RaCBqnFhaHAJb4H6tYu0A3sn+TFxdgVaMQ==
X-Received: by 2002:a05:6214:1256:b0:6fb:14:5e89 with SMTP id 6a1803df08f44-6fb08fe7f6fmr255840366d6.19.1749500067642;
        Mon, 09 Jun 2025 13:14:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ac8415sm56510096d6.27.2025.06.09.13.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 13:14:27 -0700 (PDT)
Message-ID: <17a7ab55-aa1a-4d1d-b8f6-27bbe51fe761@riscstar.com>
Date: Mon, 9 Jun 2025 15:14:26 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, inochiama@outlook.com,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guodong Xu <guodong@riscstar.com>
References: <20250609200822.468482-1-elder@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250609200822.468482-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/25 3:08 PM, Alex Elder wrote:
> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> parent for numerous clocks, including those used by APB and AXI buses.
> Guodong Xu discovered that this clock got disabled while responding to
> getting -EPROBE_DEFER when requesting a reset controller.
> 
> The needed clock (CLK_DMA, along with its parents) had already been
> enabled.  To respond to the probe deferral return, the CLK_DMA clock
> was disabled, and this led to parent clocks also reducing their enable
> count.  When the enable count for pll1_d8 was decremented it became 0,
> which caused it to be disabled.  This led to a system hang.
> 
> Marking that clock critical resolves this by preventing it from being
> disabled.
> 
> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
> be supplied for a CCU_FACTOR_GATE clock.
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Tested-by: Guodong Xu <guodong@riscstar.com>

I'm very sorry, this path is v2 and I neglected to indicate that
in the subject line.  Here is v1:
   https://lore.kernel.org/lkml/20250607202759.4180579-1-elder@riscstar.com/

					-Alex
> ---
> v2: Reworded the description to provide better detail
> 
>   drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>   drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>   2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cdde37a052353..df65009a07bb1 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>   CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
> +		CLK_IS_CRITICAL);
>   CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 51d19f5d6aacb..668c8139339e1 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>   	}									\
>   }
>   
> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, _flags)					\
> +struct ccu_mix _name = {							\
> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> +	.common = {								\
> +		.reg_ctrl	= _reg_ctrl,					\
> +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
> +	}									\
> +}
> +
>   #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>   			       _mul)						\
> -static struct ccu_mix _name = {							\
> -	.gate	= CCU_GATE_INIT(_mask_gate),					\
> -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> -	.common = {								\
> -		.reg_ctrl	= _reg_ctrl,					\
> -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
> -	}									\
> -}
> +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, 0)
>   
>   #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>   			    _mask_gate, _flags)					\
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

