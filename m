Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F022663B9;
	Sun,  8 Jun 2025 00:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749342307; cv=none; b=VrKcrYgnzyLEph3n3cxv+OEQ88gj2AStgRup/NZSJLvipJWe2aEJiCFey8lxCKP65HdmgQNDgkHlokHwZ4f8sA2pjk3A8lmA2OTqFUEmt8Q245PsxLtVkZNav+F6UgGtSCQ0o/tFh9JeGSIEMefX+tjGY5mV4xuKbWi8XF5oHd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749342307; c=relaxed/simple;
	bh=zoAExx3WioqXfN/ocPCm3U8wH97QCRgsUJljQoxXSz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwR/zx9n8/CTBbmGjO223noplTfEOFXr6Z97WqRrFfe1F9SU4Clrh3HVJjn4MZiTohhHrlgQvSZPDvafqkbIKCj0pa+FEvU217RAYm0fEU7H18r9meo8EJHAC3aCoLlbZO4nnESYBYc0nZ8fzr9teBmr690H5TYU92IwA1EeVQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8F8BA335D15;
	Sun, 08 Jun 2025 00:25:04 +0000 (UTC)
Date: Sun, 8 Jun 2025 00:24:53 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heylenay@4d2.org,
	inochiama@outlook.com, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Message-ID: <20250608002453-GYA108101@gentoo>
References: <20250607202759.4180579-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607202759.4180579-1-elder@riscstar.com>

Hi Alex,

On 15:27 Sat 07 Jun     , Alex Elder wrote:
> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> parent for numerous clocks.  Guodong Xu was recently testing DMA,
            ~~~~~~~~~this is still vague, numerous isn't equal to critical
     
> adding a reset property, and discovered that the needed reset was
> not yet ready during initial probe.  It dropped its clock reference,
> which dropped parent references, and along the way it dropped the sole
> reference to pll1_d8 (from its prior clk_get()).  Clock pll1_d8 got
> disabled, which resulted in a non-functioning system.
> 
So, I'm trying to understand the problem, and would like to evaluate if
the "critical" flag is necessary..

It occurs to me, the DMA driver should request and enable clock first,
then request and issue a reset, it probably could be solved by proper
order? so what's the real problem here? is DMA or reset? dropped the 
clock? or does driver fail to request a reset before clock is ready?

> Mark that clock critical so it doesn't get turned off in this case.
> We might be able to turn this flag off someday, but for now it
> resolves the problem Guodong encountered.
> 
> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
> be supplied for a CCU_FACTOR_GATE clock.
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Tested-by: Guodong Xu <guodong@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>  drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>  2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cdde37a052353..df65009a07bb1 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>  CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>  CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>  CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
> +		CLK_IS_CRITICAL);
>  CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>  CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>  CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 51d19f5d6aacb..668c8139339e1 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>  	}									\
>  }
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
>  #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>  			       _mul)						\
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
>  #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>  			    _mask_gate, _flags)					\
> -- 
> 2.45.2
> 

-- 
Yixun Lan (dlan)
