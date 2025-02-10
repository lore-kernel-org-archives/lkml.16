Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723D34690
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208319; cv=none; b=Dh3w8ZAaLBKrZ9NwmuSaIyI6oUa6jxBseBF9sNWVzVysh2fTnLFIYiC8VV2z8iu9DBcO+sg3t+D0hXJafOgc92UQw6Zl8WWCr79LFArn8lesjdVSr6f4sS/ePvXuiS7zrDn1ySXpeicrCQ666u/e6DNVYBOXHbS4LyPpvhMgZA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208319; c=relaxed/simple;
	bh=ATfMmIVQUtizYRtKO7eBYnjIZDmUdv/DHgsiIDhlXYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFLTyTCRbJJae1x8IWRiCqRml2EghmA1duTc4x9EyecCXBUJp2fejbdHv0rl7UjWqD+WilVc/r/2lIvcvf4CFM1it/5xsMhhADKXeXUCcOtWM8THzHRKb7cdh29ITh14Rnt+VOSo0fL9Sd7P3aNKA8Ko6Ns9iUuf9RlmaUTtc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDcVjMX+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDcVjMX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D818C4CEE9;
	Mon, 10 Feb 2025 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208319;
	bh=ATfMmIVQUtizYRtKO7eBYnjIZDmUdv/DHgsiIDhlXYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDcVjMX+ZfTwiJl6BjjE71qXxZI4HKCdmqXo9wE5Y+U6FrblPTgzZ1lni9V+xlmdn
	 cbTsy9AlxZT9gnhg+/Htd/n+0NsHnZYlQEThr8rda1MhkYi6nsyAa98V7r2FrWDwIC
	 Y8eumau3YL8CxR4A3mildMq+D0trEY2jOyQ59GjPbK3CNmXszaGDoti76DXcF7dmRf
	 DyH5Lh652kl8wsHu0CHw8fYWES+d+4+nrDssVrn7nsfCrC5E4phuxjvNAawwgHY1oC
	 7Cu7ie5Y0PEbn9G4tFW42SZeUuyW9Cul19AX50sNKvYW0SPmaQ6DSkrQegw8qjB6dk
	 1WDE1x05fisPQ==
Date: Mon, 10 Feb 2025 17:25:13 +0000
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: sam@ravnborg.org, bbrezillon@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH 2/3] mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS
 display
Message-ID: <20250210172513.GH1868108@google.com>
References: <20241121092308.130328-1-manikandan.m@microchip.com>
 <20241121092308.130328-2-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241121092308.130328-2-manikandan.m@microchip.com>

On Thu, 21 Nov 2024, Manikandan Muralidharan wrote:

> The XLCDC IP supports DSI, parallel RGB and LVDS Display.
> sys_clk(Generic clock) is used for DSI and Parallel RGB displays;
> And LVDS PLL is used with LVDS displays.
> obtain anyone of the clocks for the LCD to operate

Maybe say something about this being a fall-back strategy.

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  drivers/mfd/atmel-hlcdc.c       | 16 ++++++++++++++--
>  include/linux/mfd/atmel-hlcdc.h |  1 +
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
> index 4c4e35d404f3..60b0b766459e 100644
> --- a/drivers/mfd/atmel-hlcdc.c
> +++ b/drivers/mfd/atmel-hlcdc.c
> @@ -108,10 +108,22 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
>  		return PTR_ERR(hlcdc->periph_clk);
>  	}
>  
> +	/*
> +	 * Obtain one of the main clocks (GCK / LVDS PLL) required by the
> +	 * LCD to function,
> +	 * GCK for Parallel RGB and MIPI displays;
> +	 * LVDS PLL for LVDS displays.
> +	 */
> +	hlcdc->sys_clk = NULL;
> +	hlcdc->lvds_pll_clk = NULL;

Since, devm_kzalloc() is used to allocate this memory space, these are
already NULL.

>  	hlcdc->sys_clk = devm_clk_get(dev, "sys_clk");
>  	if (IS_ERR(hlcdc->sys_clk)) {
> -		dev_err(dev, "failed to get system clock\n");
> -		return PTR_ERR(hlcdc->sys_clk);
> +		dev_dbg(dev, "failed to get system clock\n");

This should be a dev_warn().

May be add some more information.

"failed to get system clock, trying xyz instead"

'\n' here.

> +		hlcdc->lvds_pll_clk = devm_clk_get(dev, "lvds_pll_clk");
> +		if (IS_ERR(hlcdc->lvds_pll_clk)) {
> +			dev_err(dev, "failed to get LVDS PLL clock\n");
> +			return PTR_ERR(hlcdc->lvds_pll_clk);
> +		}
>  	}
>  
>  	hlcdc->slow_clk = devm_clk_get(dev, "slow_clk");
> diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
> index 80d675a03b39..07c2081867fd 100644
> --- a/include/linux/mfd/atmel-hlcdc.h
> +++ b/include/linux/mfd/atmel-hlcdc.h
> @@ -75,6 +75,7 @@
>   */
>  struct atmel_hlcdc {
>  	struct regmap *regmap;
> +	struct clk *lvds_pll_clk;
>  	struct clk *periph_clk;
>  	struct clk *sys_clk;
>  	struct clk *slow_clk;
> -- 
> 2.25.1
> 

-- 
Lee Jones [李琼斯]
