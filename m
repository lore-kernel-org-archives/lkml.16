Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E6A230D30;
	Mon, 10 Feb 2025 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196346; cv=none; b=brmU+OpgDWAUubMsmyjw/zlv0wwEtXMStaL+td7CEpDAThsnqM8dduTlWcsn7g/iRJUgVb3x+y+sfxDP/L9QI5o/RoZxrOd/lPYlreEq5jtt8dMAkCMqAyZtzhJ9iEhpr80P9oNYqUwZ6klPKVab0p6UE77ayibbcGL44WUkwcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196346; c=relaxed/simple;
	bh=ydVz+zuGrahOcdRUAMPxvr0Xto4ogVWbtEh5mJ+m7E4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SA9R63Jc98kHNpOhGidhruYUl46IPwQud8AVLguk2NwIU9hZ6+J7Y/pVrRKo4PLvWL8Kopvm+lXxzokSaz495AwTRGFQk5qnEVolAASGMBOJ9sEZHVJtRwMDYgUP3iPzYEt1inocKySTWRy+H/EKJ+Ob0dRfTcf2jbZ1mEdOqTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78C0D1477;
	Mon, 10 Feb 2025 06:06:03 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54FD13F5A1;
	Mon, 10 Feb 2025 06:05:40 -0800 (PST)
Date: Mon, 10 Feb 2025 14:05:36 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi
 SoC support), linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi
 SoC support), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] clk: sunxi-ng: h616: Reparent GPU clock during
 frequency changes
Message-ID: <20250210140536.08c33a56@donnerap.manchester.arm.com>
In-Reply-To: <20250209183142.97671-1-simons.philippe@gmail.com>
References: <20250209183142.97671-1-simons.philippe@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  9 Feb 2025 19:31:42 +0100
Philippe Simons <simons.philippe@gmail.com> wrote:

Hi Philippe,

thanks for bringing this patch together!

You should mention here *why* you want this patch, the motivation seems to
be missing, but would be crucial - and preventing a sure crash should make
this a no-brainer.

Maybe start with: The H616 manual does not state that the GPU PLL supports
dynamic frequency configuration, so we must take extra care when changing
the frequency. Currently any attempt to do device DVFS on the GPU lead ...

Then mention that the manual describes the algorithm for changing the PLL
frequency, which the CPU PLL notifier code already support, so we reuse
that.

> Re-parent the GPU clock during frequency changes of the PLL.
> Also it asks to disable and then re-enable the PLL lock bit,
> after the factor changes have been applied.
> 
> Add clock notifiers for the PLL and the GPU mux clock, using the existing
> notifier callbacks, and tell them to use mux 1 (the GPU_CLK1 source),
> and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> correct algorithms.
> 
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 33 +++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> index 190816c35..e88eefa24 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -328,10 +328,12 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0", gpu0_parents, 0x670,
>  				       24, 1,	/* mux */
>  				       BIT(31),	/* gate */
>  				       CLK_SET_RATE_PARENT);
> +
> +#define SUN50I_H616_GPU_CLK1_REG        0x674
>  static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
>  					0, 2,	/* M */
>  					BIT(31),/* gate */
> -					0);
> +					CLK_IS_CRITICAL);

The addition of CLK_IS_CRITICAL deserves a comment, something about that
this clock is needed as a temporary fallback clock for the PLL frequency
changes or so.

>  static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
>  		      0x67c, BIT(0), 0);
> @@ -1120,6 +1122,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb = {
>  	.lock		= BIT(28),
>  };
>  
> +static struct ccu_mux_nb sun50i_h616_gpu_nb = {
> +	.common		= &gpu0_clk.common,
> +	.cm		= &gpu0_clk.mux,
> +	.delay_us	= 1, /* manual doesn't really say */
> +	.bypass_index	= 1, /* GPU_CLK1 */
> +};
> +
> +static struct ccu_pll_nb sun50i_h616_pll_gpu_nb = {
> +	.common		= &pll_gpu_clk.common,
> +	.enable		= BIT(29),	/* LOCK_ENABLE */
> +	.lock		= BIT(28),
> +};
> +
>  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  {
>  	void __iomem *reg;
> @@ -1170,6 +1185,15 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  	val |= BIT(0);
>  	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
>  
> +	/*
> +	 * Set the input-divider for the gpu1 clock to 3.
> +	 * Also enable gpu1 clock.
> +	 */
> +	val = readl(reg + SUN50I_H616_GPU_CLK1_REG);
> +	val |= BIT(31);

Do we need this if the clock is marked as critical now?

> +	val |= BIT(1);

You probably want to clear the lowest 2 bits first, then set bit 1,
otherwise you end up with either 2 or 3, depending on what bit 0 was
before.

Cheers,
Andre

> +	writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
> +
>  	/*
>  	 * First clock parent (osc32K) is unusable for CEC. But since there
>  	 * is no good way to force parent switch (both run with same frequency),
> @@ -1190,6 +1214,13 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  	/* Re-lock the CPU PLL after any rate changes */
>  	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
>  
> +	/* Reparent GPU during GPU PLL rate changes */
> +	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
> +				  &sun50i_h616_gpu_nb);
> +
> +	/* Re-lock the GPU PLL after any rate changes */
> +	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
> +
>  	return 0;
>  }
>  

