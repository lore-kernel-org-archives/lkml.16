Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36A6372
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748688; cv=none; b=aCRMxtz3YVxlDTSyW3um2+0Sw4SZqvHA60DP+WFpsuhRaV6gYKuF2Mf+8YV56EtYgUylkVr0237WUmo8D/tfjmeNHPIuanHMcsCOeKYmZBE/06Ciyj4SrcJ4HJwJC93WM2GWhsoYU8Hq/SVljGwp7/BO76FF0Ut3y0Jkq3l6mo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748688; c=relaxed/simple;
	bh=XNIc3kjYQjwXXUBYl3GyECf4oKKi0byLqTBYhJEe+0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1F6IKQxJF3fd/inmWRRch3UbHPvDiDXfxUqyns6rDtq4T6x0QLaHvdyvKP3OCq6kj9jJp/NHaZWhsbyAzXhym9Mc59suGBK3DvCbh/L/1+CCgZdfClt3HSEpc1UGQ0sVBd5Zs07fGmPCi1ttRZT6zsp5tpEmY7zB9Jo7EbC51g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qyeOMxAV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qyeOMxAV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad93ff9f714so17501766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750748684; x=1751353484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLbitD9Yz365jr3BdIqraX9XTg2iaE+GPbMQNtnpays=;
        b=qyeOMxAVfGluDNmUE2YUVwQ5UogysrKhUtf0vcZtebOiPukoLQj8nPbzzrNYFgYF4z
         fS6aWdrpNHCWgZywfpBZeWB13JIvRlvYTsM7110xWRr4kZLexKfIinD6WRxzrwJRcgkx
         pFAa0AjI0UfUaYYtiqrvEHURaIfgu1YdDmFsM8+0LDFWnpCQq1DGJ3i7yuqQXxI50y0S
         ehtWKFpZv7V7BWWibGXVl97mUwmbGTm0vyyIG31e3YHqhTxp9pmbODJJ11wmSCEeP96J
         dioFwdF6xm1fiqD1//P0o/2Bh4ogPQ7XAKvBbW1ysLqx5jD4Rejx/liTsdTT2g7ElX6q
         g5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750748684; x=1751353484;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLbitD9Yz365jr3BdIqraX9XTg2iaE+GPbMQNtnpays=;
        b=NFFfRCW1ewf5Cjol/28qr7BFk98CsdvWecbEWBIf8b2XKR8Tq9JhnEb1Pf9L2gBawL
         WvDmtjUxPO7aoQ//IMGgtkUagl3K2NHjQHFgYpa5GFpa5drJTlqXCt5fah3xPfH5W4Mv
         laG9XJtV5zbUWFVrdxuOepXk+iKjRfLGMlkOJfkC2znBVoPrII+D7FglannetwFjlVSz
         qnaFvQxD54ykRPTFFHZkC4uyIoF/V4LAxsyPnl9OUGNkigeW7qr1zzPdZw8lpv+Kco8s
         hLaaecTQdsEAH1r1hSx6viCp2kGDFA4lsXEvsXTgd15UjG1oJgLJEs/NJg2QiHrbMBOG
         EOXw==
X-Forwarded-Encrypted: i=1; AJvYcCWhjTzy/82X61ZNquu9qiKhcn9P5Kx+OBue3840JSDKoGwS4d+MRxUIo0LhiDO7Cz4CvnbU6DakjE6Qdgg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xCnzD/Ud63nPrWz90uqa+QYufkRizhTE/4aCEyD5ZIj26hvE
	ffYUSPLTpFIu/Sa1UtNUQ417N6Zk7Ul4GfFxnnQGolLAiFqkyvppTWN/gYcct9bd00E=
X-Gm-Gg: ASbGnctFKubuuqOtoJFtvM3CulhEkYFQ1AxBAvf1e4MrAOftij9mtpNSxu/r8l4XJha
	or5UoX27p8XRnWzVTi1cDkeVJGvzNno3KHSMqzyUW/9Jcm0S2HrTVbqHZBrx7+9jY0JiXWpRNP6
	sDXs/4KhK+fwGHFWxcNVc8K1A85UglRn/bpVr6vDIfsD1OSoIbJULsytHN1hbxnCEEEL3C7WYs5
	9Xxgvy9N+8iADWYcLwuddh8vb7cJBqpvhK1QW66/D+6Fti05cJA9yH4bpQZUyXUpiq99+wW3vOu
	dmDc18GiEmaoNV2fslrFuLADylZPgaEnpCUPrzhrDx27hbKiimmGNb31sfaVH9cj3+Lowf+POOH
	JRhHvXQ==
X-Google-Smtp-Source: AGHT+IH9JmPa7BbH+tgIB0uoiJ2JP68fJ2WltDdUQv4ZUEycK4uvEtfSZLwyJj/VT7FzXEaxap3DCQ==
X-Received: by 2002:a17:906:6a05:b0:ace:cc7f:8abe with SMTP id a640c23a62f3a-ae057b39bdfmr1676502066b.31.1750748683722;
        Tue, 24 Jun 2025 00:04:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbf72sm817956566b.47.2025.06.24.00.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:04:42 -0700 (PDT)
Message-ID: <c51b2b64-24a7-4e14-bdd8-c4a356423100@tuxon.dev>
Date: Tue, 24 Jun 2025 10:04:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: sam9x7: update pll clk ranges
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Patrice Vilchez <Patrice.Vilchez@microchip.com>
References: <20250610084503.69749-1-varshini.rajendran@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250610084503.69749-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Varshini,

On 10.06.2025 11:45, Varshini Rajendran wrote:
> Update the min, max ranges of the PLL clocks according to the latest
> datasheet to be coherent in the driver. This patch apparently solves
> issues in obtaining the right sdio frequency.
> 
> Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
> Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  drivers/clk/at91/sam9x7.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index cbb8b220f16b..ffab32b047a0 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -61,44 +61,44 @@ static const struct clk_master_layout sam9x7_master_layout = {
>  
>  /* Fractional PLL core output range. */
>  static const struct clk_range plla_core_outputs[] = {
> -	{ .min = 375000000, .max = 1600000000 },
> +	{ .min = 800000000, .max = 1600000000 },
>  };
>  
>  static const struct clk_range upll_core_outputs[] = {
> -	{ .min = 600000000, .max = 1200000000 },
> +	{ .min = 600000000, .max = 960000000 },
>  };
>  
>  static const struct clk_range lvdspll_core_outputs[] = {
> -	{ .min = 400000000, .max = 800000000 },
> +	{ .min = 600000000, .max = 1200000000 },
>  };
>  
>  static const struct clk_range audiopll_core_outputs[] = {
> -	{ .min = 400000000, .max = 800000000 },
> +	{ .min = 600000000, .max = 1200000000 },
>  };
>  
>  static const struct clk_range plladiv2_core_outputs[] = {
> -	{ .min = 375000000, .max = 1600000000 },
> +	{ .min = 800000000, .max = 1600000000 },
>  };
>  
>  /* Fractional PLL output range. */
>  static const struct clk_range plla_outputs[] = {
> -	{ .min = 732421, .max = 800000000 },
> +	{ .min = 400000000, .max = 800000000 },
>  };
>  
>  static const struct clk_range upll_outputs[] = {
> -	{ .min = 300000000, .max = 600000000 },
> +	{ .min = 300000000, .max = 480000000 },
>  };
>  
>  static const struct clk_range lvdspll_outputs[] = {
> -	{ .min = 10000000, .max = 800000000 },
> +	{ .min = 175000000, .max = 550000000 },
>  };
>  
>  static const struct clk_range audiopll_outputs[] = {
> -	{ .min = 10000000, .max = 800000000 },
> +	{ .min = 0, .max = 300000000 },

Is this min value something valid?

Thank you,
Claudiu
