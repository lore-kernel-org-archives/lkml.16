Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A61925C6E8;
	Tue, 10 Jun 2025 02:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749522315; cv=none; b=IvRQcATJVWkH0czsjEZpVbRILxkq16qgIg3jaAS3Ix++W1n/4BGF74dVSt6hiPyvbTf/l0XnMVHw90YrSDQGwd+jfuN6qyMKxoAVz1JHYCu80qi+4uyiXRERhByvgNEEv02okk4dX9DSqew+/Yyd+DIRhsJF9LnRgEllwzMnNAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749522315; c=relaxed/simple;
	bh=IMmtBik7W10xX4m9PnqOtXcNyM+mtowpc5+2eIWNlD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbePYSk5Iz8Bd8um5PQzXhrHZDk2B7ZY2OIVF7Ks0oB5E+YjJAc7AOSTkOtHwdm5S0cyKRUikN3OmT49cd6glu+An36jdA6Be6cmXLfZMNPvSYIy7NCNepOB8/dGsw+MfbrEg5Bda1XTHqeS5AtFqXLf2OQ+Ki2MuPKFQ43Vclw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=gEAqROr9; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=r9h7iXFX; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="gEAqROr9";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="r9h7iXFX"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 20F6712FB433;
	Mon, 09 Jun 2025 19:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1749522307; bh=IMmtBik7W10xX4m9PnqOtXcNyM+mtowpc5+2eIWNlD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEAqROr9VweQBKcxEhpxmEHnT+4pFORbcR3Ot5zp/XR+EvhEZlo1o7gJ3EnFtwa0V
	 t1NbZ2Xn9zeaqUu/i+P5oCGqElASp7V8dRgM5BTnOiNj+hwq8WapPeFqVSVa1a5Up1
	 T3Ud4pJu8bAzkHiHbY6y6BUioJ+bOl7gnGNXDwBk6uTweGFtnm+3SL5NSOt4/FN7lD
	 iKEd254k86K3+QLxRkU9cLngbuxXNH/1H5jRWaqSqjn63BhBpPsnRbCusVxmkqhxap
	 aLzCNnOtYNKEwzhVk/SrbG8OOOmga8iql766DFsC53TB94TgvLBU9D9NPB8EWD9lJm
	 7OsvVimrfI9qg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9cSwMwTxp-i; Mon,  9 Jun 2025 19:25:05 -0700 (PDT)
Received: from ketchup (unknown [183.217.82.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 7C6DA12FB401;
	Mon, 09 Jun 2025 19:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1749522304; bh=IMmtBik7W10xX4m9PnqOtXcNyM+mtowpc5+2eIWNlD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9h7iXFXydWGsUipKqKnrQ3i4Ns+MWx0DvfJhmKPRaEVBu0GlKiV5XOe6wrf9Fs22
	 kuZRj4cj53NsBZ0+M+gsSDaoD8/cSZwTdXjJxRKI6yxJp46162CL1JTOWphEAszrF/
	 qndRGSzI+RpT/uk+WZRbKRoRip/C63yocEz4CRXSDRfcm2kiG1uqj+i5keGORlwF4K
	 J9sU/L+WQBfnIOTsMCfck/0ztHDLg35wGYE7uuAIiawixKyQr32oUftBxHHvN8ejAL
	 bjE4lndqsbhjd7RnSnskF1/J3EX1L1A4Xycwf/PKZ773FltMgRQ5ptMApFk3cLSr2/
	 DTA7h5zMCEQnA==
Date: Tue, 10 Jun 2025 02:24:58 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dlan@gentoo.org, inochiama@outlook.com, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Message-ID: <aEeXepzJ2Qkv45qm@ketchup>
References: <20250609200822.468482-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609200822.468482-1-elder@riscstar.com>

On Mon, Jun 09, 2025 at 03:08:21PM -0500, Alex Elder wrote:
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
> ---
> v2: Reworded the description to provide better detail
> 
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

This should be defined as static as well. I think this is the cause of
CI warnings in v1.

With this fixed,

Reviewed-by: Haylen Chu <heylenay@4d2.org>

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
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.45.2
> 
