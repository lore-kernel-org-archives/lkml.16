Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CB72E427A;
	Thu, 26 Jun 2025 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943539; cv=none; b=CU0rCYSQx+/zMYRHtsJGWZrQGMz0sr/cZbidGJVU/+WQUM+viYRooYc/BnuLvTwsfK7T6vTIMOo+qrQNLXkMYYJr8d6lVBg4bb13Ws2iroXdAHZrYWTDim13DckjUN3BZhTOujt7OV40xZC2IuSMZzM7/IYrmToWvEihpKnEJaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943539; c=relaxed/simple;
	bh=hgnNwmNHQIaHTRV7by3eS6rJbwsUw32zvUf2T8ZhwYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaNJe939CFNZSbB4mUbuMnlafQB6TR0wSuVJ+E6hQO9l1YXEyFXV72l5vrippA1szat4jWULBl2Eg8p606V9oAZwrK0SGGAuiMU7XGpfdrcFVNfjMMgtrRKnBpyxq2OKrby7jwD0kSysr2frzKLeX9dGOusv087fJ70oeLR+6eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOElbKXY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOElbKXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780F7C4CEEB;
	Thu, 26 Jun 2025 13:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750943539;
	bh=hgnNwmNHQIaHTRV7by3eS6rJbwsUw32zvUf2T8ZhwYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOElbKXY02VgrNiUrX1G/CcXLwzVfADp9KoK5skUSphltZI3P73cgUEtUXAMBGo/u
	 ixImxf7cXZRPS5KU1ivVi4KzG8HICGYn2MGL9v2RFIXcIjMJOUwzE8jhqL7cHSW1bD
	 rmdb6hLTdQvoSQI6kEeUGpNW6fj2hTjo3VIkIzHpu7hTUPVg29f2yBjwFKygytBFo/
	 HU/W3V3hkgnjSh/dyeYkByQBU1a64SlDNz6/GvGyqoeta8oZDxIYMeYSQqQOlu4oAy
	 ScfKU5DiHBQoOEd2zHamINSZJKEq2WqjAFhMA3+rbw7I9CKAr5+Nh0k+y/4JgvHLRN
	 ldBCrWUtWU9tA==
Date: Thu, 26 Jun 2025 14:12:13 +0100
From: Lee Jones <lee@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Daniel Semkowicz <dse@thaumatec.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v3 2/5] mfd: rk8xx-core: allow to customize RK806 reset
 mode
Message-ID: <20250626131213.GD10134@google.com>
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
 <20250618-rk8xx-rst-fun-v3-2-081f02d3d348@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618-rk8xx-rst-fun-v3-2-081f02d3d348@cherry.de>

On Wed, 18 Jun 2025, Quentin Schulz wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The RK806 PMIC has a bitfield for configuring the restart/reset behavior
> (which I assume Rockchip calls "function") whenever the PMIC is reset
> either programmatically (c.f. DEV_RST in the datasheet) or via PWRCTRL
> or RESETB pins.
> 
> For RK806, the following values are possible for RST_FUN:
> 
> 0b00 means "restart PMU"

"Restart PMU"

> 0b01 means "Reset all the power off reset registers, forcing
> 	the state to switch to ACTIVE mode"
> 0b10 means "Reset all the power off reset registers, forcing
> 	the state to switch to ACTIVE mode, and simultaneously
> 	pull down the RESETB PIN for 5mS before releasing"
> 0b11 means the same as for 0b10 just above.
> 
> This adds the appropriate logic in the driver to parse the new
> rockchip,reset-mode DT property to pass this information. It just
> happens that the values in the binding match the values to write in the
> bitfield so no mapping is necessary.
> 
> If it is missing, the register is left untouched and relies either on
> the silicon default or on whatever was set earlier in the boot stages
> (e.g. the bootloader).
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  drivers/mfd/rk8xx-core.c  | 15 +++++++++++++++
>  include/linux/mfd/rk808.h |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index 71c2b80a4678d627e86cfbec8135f08e262559d3..23ff92f89f3357e3f47c5dd0e9f80cca453f22c0 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
> @@ -10,6 +10,7 @@
>   * Author: Wadim Egorov <w.egorov@phytec.de>
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/rk808.h>
>  #include <linux/mfd/core.h>
> @@ -699,6 +700,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
>  	const struct mfd_cell *cells;
>  	int dual_support = 0;
>  	int nr_pre_init_regs;
> +	u32 rst_fun = 0;
>  	int nr_cells;
>  	int ret;
>  	int i;
> @@ -726,6 +728,19 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
>  		cells = rk806s;
>  		nr_cells = ARRAY_SIZE(rk806s);
>  		dual_support = IRQF_SHARED;
> +
> +		ret = device_property_read_u32(dev, "rockchip,reset-mode", &rst_fun);
> +		if (ret) {
> +			dev_dbg(dev,
> +				"rockchip,reset-mode property missing, not setting RST_FUN\n");

I suggest that this debug message is not that useful and can be removed.

> +			break;
> +		}
> +
> +		ret = regmap_update_bits(rk808->regmap, RK806_SYS_CFG3,
> +					 RK806_RST_FUN_MSK,

Place on the line above?

> +					 FIELD_PREP(RK806_RST_FUN_MSK, rst_fun));
> +		if (ret)
> +			return dev_err_probe(dev, ret, "RST_FUN write err\n");

Failed to configure requested restart/reset behavior"

>  		break;
>  	case RK808_ID:
>  		rk808->regmap_irq_chip = &rk808_irq_chip;
> diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
> index 69cbea78b430b562a23d995263369d475daa6287..28170ee08898ca59c76a741a1d42763a42b72380 100644
> --- a/include/linux/mfd/rk808.h
> +++ b/include/linux/mfd/rk808.h
> @@ -812,6 +812,8 @@ enum rk806_pin_dr_sel {
>  #define RK806_INT_POL_H			BIT(1)
>  #define RK806_INT_POL_L			0
>  
> +/* SYS_CFG3 */
> +#define RK806_RST_FUN_MSK		GENMASK(7, 6)
>  #define RK806_SLAVE_RESTART_FUN_MSK	BIT(1)
>  #define RK806_SLAVE_RESTART_FUN_EN	BIT(1)
>  #define RK806_SLAVE_RESTART_FUN_OFF	0
> 
> -- 
> 2.49.0
> 

-- 
Lee Jones [李琼斯]
