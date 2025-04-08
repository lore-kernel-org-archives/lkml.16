Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B499C18784A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119835; cv=none; b=SU+hPiJJxNTWttt2GxmMtfkmewPP22AuZ1nPOctU9mHiSrY6E/y3qfy2/5jl9kx74oAVk4+Ls1x6JivgZqYQ8vH8r3RL2TeU7XclR+l3AhB2PazPVYl8zFaNzPhgWGnWK3sVdoXsJygP53w3sg41MJAfbtHABT3iIApHYFM+KW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119835; c=relaxed/simple;
	bh=2qHhThrnOTWPUjl99ltiubZEVCpfALKofqfiBBBxp7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+oqDpT/+w8oq7OH5UmD7bzrQQ8oTko+f2Ojb2gKOE00kvtzO2oyy1kEE2VlKgIR3puMFal0+lHG5KAk8BM63CeGxtGuD8ky4dl+jBcnUkKFf1lIUNhWj1/WHKwpDNAZI1VNXQco+q7qBXhPx3FcRXZ3ASrgF3aK/mO9RjffSWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1u29Eq-00012g-Is; Tue, 08 Apr 2025 15:43:40 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1u29Eq-003wQM-0v;
	Tue, 08 Apr 2025 15:43:40 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1u29Eq-006Zph-0T;
	Tue, 08 Apr 2025 15:43:40 +0200
Date: Tue, 8 Apr 2025 15:43:40 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	Alvin =?iso-8859-15?Q?=A6ipraga?= <alsi@bang-olufsen.dk>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: add TI CDCE6214 clock driver
Message-ID: <Z_UoDCZKQpeID50C@pengutronix.de>
References: <20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de>
 <20250408-clk-cdce6214-v1-2-bd4e7092a91f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408-clk-cdce6214-v1-2-bd4e7092a91f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Tue, Apr 08, 2025 at 02:00:23PM +0200, Sascha Hauer wrote:
> The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
> Differential Outputs, Two Inputs, and Internal EEPROM. This patch adds
> a common clk framework driver for this chip.
> 
> - Two inputs (PRIREF and SECREF)
> - Programmable 8bit divider or x2 multiplier between input and PLL
> - 16b integer / 24bit fractional PLL
> - Two programmable /4, /5, /6 dividers after PLL (PSA/PSB)
> - Four outputs (OUT1-OUT4) with programmable 14b dividers,
>   muxable between PSA, PSB and PLL input
> - One output (OUT0) fed from PLL input
> 
> - PRIREF can be configured as LVCMOS or differential input
> - SECREF can be configured as LVCMOS, differential or oscillator input
> - OUT0 is a LVCMOS output
> - OUT1 and OUT4 can be configured as LVDS, LP-HCSL or LVCMOS outputs
> - OUT2 and OUT3 can be configured as LVDS or LP-HCSL outputs
> 
> All clocks are registered without parent rate propagation, so each of
> the clocks must be configured separately via device tree or consumer.
> 
> Signed-off-by: Alvin ¦ipraga <alsi@bang-olufsen.dk>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/Kconfig                     |    7 +
>  drivers/clk/Makefile                    |    1 +
>  drivers/clk/clk-cdce6214.c              | 1105 +++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/ti,cdce6214.h |   24 +
>  4 files changed, 1137 insertions(+)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 713573b6c86c7..499fd610c0467 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -170,6 +170,13 @@ config COMMON_CLK_BM1880
>  	help
>  	  This driver supports the clocks on Bitmain BM1880 SoC.
>  
> +config COMMON_CLK_CDCE6214
> +	tristate "Clock driver for TI CDCE6214 clock synthesizer"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  This driver supports TI CDCE6214 programmable 1-PLL clock synthesizer.
> +
>  config COMMON_CLK_CDCE706
>  	tristate "Clock driver for TI CDCE706 clock synthesizer"
>  	depends on I2C
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index bf4bd45adc3a0..0f87b13b137b5 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+= clk-axi-clkgen.o
>  obj-$(CONFIG_ARCH_AXXIA)		+= clk-axm5516.o
>  obj-$(CONFIG_COMMON_CLK_BD718XX)	+= clk-bd718x7.o
>  obj-$(CONFIG_COMMON_CLK_BM1880)		+= clk-bm1880.o
> +obj-$(CONFIG_COMMON_CLK_CDCE6214)	+= clk-cdce6214.o
>  obj-$(CONFIG_COMMON_CLK_CDCE706)	+= clk-cdce706.o
>  obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
>  obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
> diff --git a/drivers/clk/clk-cdce6214.c b/drivers/clk/clk-cdce6214.c
> new file mode 100644
> index 0000000000000..a825cd71bb11b
> --- /dev/null
> +++ b/drivers/clk/clk-cdce6214.c
> @@ -0,0 +1,1105 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for the TI CDCE6214 clock generator
> + *
> + * Copyright (c) 2023 Alvin ¦ipraga <alsi@bang-olufsen.dk>
> + * Copyright (c) 2025 Sascha Hauer <s.hauer@pengutronix.de>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/of.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <dt-bindings/clock/ti,cdce6214.h>
> +
> +#define RO_I2C_A0			BIT(15)
> +#define RO_PDN_INPUT_SEL		BIT(14)
> +#define RO_GPIO4_DIR_SEL		BIT(13)
> +#define RO_GPIO1_DIR_SEL		BIT(12)
> +#define RO_ZDM_CLOCKSEL			BIT(10)
> +#define RO_ZDM_EN			BIT(8)
> +#define RO_SYNC				BIT(5)
> +#define RO_RECAL			BIT(4)
> +#define RO_RESETN_SOFT			BIT(3)
> +#define RO_SWRST			BIT(2)
> +#define RO_POWERDOWN			BIT(1)
> +#define RO_MODE				BIT(0)
> +
> +#define R1_GPIO4_INPUT_SEL		GENMASK(15, 12)
> +#define R1_GPIO3_INPUT_SEL		GENMASK(11, 8)
> +#define R1_GPIO2_INPUT_SEL		GENMASK(7, 4)
> +#define R1_GPIO1_INPUT_SEL		GENMASK(3, 0)
> +
> +#define R2_GPIO4_OUTPUT_SEL		GENMASK(9, 6)
> +#define R2_GPIO1_OUTPUT_SEL		GENMASK(5, 2)
> +#define R2_REFSEL_SW			GENMASK(1, 0)
> +
> +#define R3_DISABLE_CRC			BIT(13)
> +#define R3_UPDATE_CRC			BIT(12)
> +#define R3_NVMCOMMIT			BIT(11)
> +#define R3_REGCOMMIT			BIT(10)
> +#define R3_REGCOMMIT_PAGE		BIT(9)
> +#define R3_FREQ_DEC_REG			BIT(6)
> +#define R3_FREQ_INC_REG			BIT(5)
> +#define R3_FREQ_INC_DEC_REG_MODE	BIT(4)
> +#define R3_FREQ_INC_DEC_EN		BIT(3)
> +
> +#define R4_CH4_PD			BIT(7)
> +#define R4_CH3_PD			BIT(6)
> +#define R4_CH2_PD			BIT(5)
> +#define R4_CH1_PD			BIT(4)
> +#define R4_POST_EE_DLY			GENMASK(3, 0)
> +
> +#define R5_PLL_VCOBUFF_LDO_PD		BIT(8)
> +#define R5_PLL_VCO_LDO_PD		BIT(7)
> +#define R5_PLL_VCO_BUFF_PD		BIT(6)
> +#define R5_PLL_CP_LDO_PD		BIT(5)
> +#define R5_PLL_LOCKDET_PD		BIT(4)
> +#define R5_PLL_PSB_PD			BIT(3)
> +#define R5_PLL_PSA_PD			BIT(2)
> +#define R5_PLL_PFD_PD			BIT(1)
> +
> +#define R7_NVMCRCERR			BIT(5)
> +#define R7_LOCK_DET_S			BIT(1)
> +#define R7_LOCK_DET			BIT(0)
> +
> +#define R9_NVMLCRC			GENMASK(15, 0)
> +
> +#define R10_NVMSCRC			GENMASK(15, 0)
> +
> +#define R11_NVM_RD_ADDR			GENMASK(5, 0)
> +
> +#define R12_NVM_RD_DATA			GENMASK(15, 0)
> +
> +#define R13_NVM_WR_ADDR			GENMASK(5, 0)
> +
> +#define R14_NVM_WR_DATA			GENMASK(15, 0)
> +
> +#define R15_EE_LOCK			GENMASK(15, 12)
> +#define R15_CAL_MUTE			BIT(5)
> +
> +#define R24_IP_PRIREF_BUF_SEL		BIT(15)
> +#define R24_IP_XO_CLOAD			GENMASK(12, 8)
> +#define R24_IP_BIAS_SEL_XO		GENMASK(5, 2)
> +#define R24_IP_SECREF_BUF_SEL		GENMASK(1, 0)
> +#define R24_IP_SECREF_BUF_SEL_XTAL	0
> +#define R24_IP_SECREF_BUF_SEL_LVCMOS	1
> +#define R24_IP_SECREF_BUF_SEL_DIFF	2
> +
> +#define R25_IP_REF_TO_OUT4_EN		BIT(14)
> +#define R25_IP_REF_TO_OUT3_EN		BIT(13)
> +#define R25_IP_REF_TO_OUT2_EN		BIT(12)
> +#define R25_IP_REF_TO_OUT1_EN		BIT(11)
> +#define R25_IP_BYP_OUT0_EN		BIT(10)
> +#define R25_REF_CH_MUX			BIT(9)
> +#define R25_IP_RDIV			GENMASK(7, 0)
> +
> +#define R27_MASH_ORDER			GENMASK(1, 0)
> +
> +#define R30_PLL_NDIV			GENMASK(14, 0)
> +
> +#define R31_PLL_NUM_15_0		GENMASK(15, 0)
> +
> +#define R32_PLL_NUM_23_16		GENMASK(7, 0)
> +
> +#define R33_PLL_DEN_15_0		GENMASK(15, 0)
> +
> +#define R34_PLL_DEN_23_16		GENMASK(7, 0)
> +
> +#define R41_SSC_EN			BIT(15)
> +
> +#define R42_SSC_TYPE			BIT(5)
> +#define R42_SSC_SEL			GENMASK(3, 1)
> +
> +#define R43_FREQ_INC_DEC_DELTA		GENMASK(15, 0)
> +
> +#define R47_PLL_CP_DN			GENMASK(12, 7)
> +#define R47_PLL_PSB			GENMASK(6, 5)
> +#define R47_PLL_PSA			GENMASK(4, 3)
> +
> +#define R48_PLL_LF_RES			GENMASK(14, 11)
> +#define R48_PLL_CP_UP			GENMASK(5, 0)
> +
> +#define R49_PLL_LF_ZCAP			GENMASK(4, 0)
> +
> +#define R50_PLL_LOCKDET_WINDOW		GENMASK(10, 8)
> +
> +#define R51_PLL_PFD_DLY_EN		BIT(10)
> +#define R51_PLL_PFD_CTRL		BIT(6)
> +
> +#define R52_PLL_NCTRL_EN		BIT(6)
> +#define R52_PLL_CP_EN			BIT(3)
> +
> +#define R55_PLL_LF_3_PCTRIM		GENMASK(9, 8)
> +#define R55_PLL_LF_3_PRTRIM		GENMASK(7, 6)
> +
> +#define R56_CH1_MUX			GENMASK(15, 14)
> +#define R56_CH1_DIV			GENMASK(13, 0)
> +
> +#define R57_CH1_LPHCSL_EN		BIT(14)
> +#define R57_CH1_1P8VDET			BIT(12)
> +#define R57_CH1_GLITCHLESS_EN		BIT(9)
> +#define R57_CH1_SYNC_DELAY		GENMASK(8, 4)
> +#define R57_CH1_SYNC_EN			BIT(3)
> +#define R57_CH1_MUTE_SEL		BIT(1)
> +#define R57_CH1_MUTE			BIT(0)
> +
> +#define R59_CH1_LVDS_EN			BIT(15)
> +#define R59_CH1_CMOSN_EN		BIT(14)
> +#define R59_CH1_CMOSP_EN		BIT(13)
> +#define R59_CH1_CMOSN_POL		BIT(12)
> +#define R59_CH1_CMOSP_POL		BIT(11)
> +
> +#define R60_CH1_DIFFBUF_IBIAS_TRIM	GENMASK(15, 12)
> +#define R60_CH1_LVDS_CMTRIM_INC		GENMASK(11, 10)
> +#define R60_CH1_LVDS_CMTRIM_DEC		GENMASK(5, 4)
> +#define R60_CH1_CMOS_SLEW_RATE_CTRL	GENMASK(3, 0)
> +
> +#define R62_CH2_MUX			GENMASK(15, 14)
> +#define R62_CH2_DIV			GENMASK(13, 0)
> +
> +#define R63_CH2_LPHCSL_EN		BIT(13)
> +#define R63_CH2_1P8VDET			BIT(12)
> +#define R63_CH2_GLITCHLESS_EN		BIT(9)
> +#define R63_CH2_SYNC_DELAY		GENMASK(8, 4)
> +#define R63_CH2_SYNC_EN			BIT(3)
> +#define R63_CH2_MUTE_SEL		BIT(1)
> +#define R63_CH2_MUTE			BIT(0)
> +
> +#define R65_CH2_LVDS_CMTRIM_DEC		GENMASK(14, 13)
> +#define R65_CH2_LVDS_EN			BIT(11)
> +
> +#define R66_CH2_LVDS_CMTRIM_IN		GENMASK(5, 4)
> +#define R66_CH2_DIFFBUF_IBIAS_TRIM	GENMASK(3, 0)
> +
> +#define R67_CH3_MUX			GENMASK(15, 14)
> +#define R67_CH3_DIV			GENMASK(13, 0)
> +
> +#define R68_CH3_LPHCSL_EN		BIT(13)
> +#define R68_CH3_1P8VDET			BIT(12)
> +#define R68_CH3_GLITCHLESS_EN		BIT(9)
> +#define R68_CH3_SYNC_DELAY		GENMASK(8, 4)
> +#define R68_CH3_SYNC_EN			BIT(3)
> +#define R68_CH3_MUTE_SEL		BIT(1)
> +#define R68_CH3_MUTE			BIT(0)
> +
> +#define R70_CH3_LVDS_EN			BIT(11)
> +
> +#define R71_CH3_LVDS_CMTRIM_DEC		GENMASK(10, 9)
> +#define R71_CH3_LVDS_CMTRIM_INC		GENMASK(5, 4)
> +#define R71_CH3_DIFFBUF_IBIAS_TR	GENMASK(3, 0)
> +
> +#define R72_CH4_MUX			GENMASK(15, 14)
> +#define R72_CH4_DIV			GENMASK(13, 0)
> +
> +#define R73_CH4_LPHCSL_EN		BIT(13)
> +#define R73_CH4_1P8VDET			BIT(12)
> +#define R73_CH4_GLITCHLESS_EN		BIT(9)
> +#define R73_CH4_SYNC_DELAY		GENMASK(8, 4)
> +#define R73_CH4_SYNC_EN			BIT(3)
> +#define R73_CH4_MUTE_SEL		BIT(1)
> +#define R73_CH4_MUTE			BIT(0)
> +
> +#define R75_CH4_LVDS_EN			BIT(15)
> +#define R75_CH4_CMOSP_EN		BIT(14)
> +#define R75_CH4_CMOSN_EN		BIT(13)
> +#define R75_CH4_CMOSP_POL		BIT(12)
> +#define R75_CH4_CMOSN_POL		BIT(11)
> +
> +#define R76_CH4_DIFFBUF_IBIAS_TRIM	GENMASK(9, 6)
> +#define R76_CH4_LVDS_CMTRIM_IN		GENMASK(5, 4)
> +#define R76_CH4_CMOS_SLEW_RATE_CTRL	GENMASK(3, 0)
> +
> +#define R77_CH4_LVDS_CMTRIM_DEC		GENMASK(1, 0)
> +
> +#define R78_CH0_EN			BIT(12)
> +
> +#define R79_SAFETY_1P8V_MODE		BIT(9)
> +#define R79_CH0_CMOS_SLEW_RATE_CTRL	GENMASK(3, 0)
> +
> +#define R81_PLL_LOCK_MASK		BIT(3)
> +
> +#define CDCE6214_VCO_MIN 2335000000
> +#define CDCE6214_VCO_MAX 2625000000
> +#define CDCE6214_DENOM_DEFAULT (1 << 24)
> +
> +static char *clk_names[] = {
> +	[CDCE6214_CLK_PRIREF] = "priref",
> +	[CDCE6214_CLK_SECREF] = "secref",
> +	[CDCE6214_CLK_OUT0] = "out0",
> +	[CDCE6214_CLK_OUT1] = "out1",
> +	[CDCE6214_CLK_OUT2] = "out2",
> +	[CDCE6214_CLK_OUT3] = "out3",
> +	[CDCE6214_CLK_OUT4] = "out4",
> +	[CDCE6214_CLK_PLL] = "pll",
> +	[CDCE6214_CLK_PSA] = "psa",
> +	[CDCE6214_CLK_PSB] = "psb",
> +};
> +
> +#define CDCE6214_NUM_CLOCKS	ARRAY_SIZE(clk_names)
> +
> +struct cdce6214;
> +
> +struct cdce6214_clock {
> +	struct clk_hw hw;
> +	struct cdce6214 *priv;
> +	int index;
> +};
> +
> +struct cdce6214_config {
> +	const struct reg_default *reg_default;
> +	int reg_default_size;
> +};

This is unused. I'll remove it next round.

> +static const struct of_device_id cdce6214_ids[] = {
> +	{
> +		.compatible = "ti,cdce6214-24mhz",

Should be ti,cdce6214. Will fix next round.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
