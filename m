Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE052561DD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401430; cv=none; b=qCPpQnLjf7xMnmj+3iTovq9vm8P/uneCiMAdpuEa0O6TWvZUQj+OOJLisJ5ugczFzdimvbO+eL79A6soRRzJzjLDHHcRwJ+zCS34lBA+4KTKNUvSGjRZE1ah5ujjpV8j+dfKjuvsZ/iId2MNIdZ0E4g/mb+7pRzHTNE+dmIAcuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401430; c=relaxed/simple;
	bh=LGd8c2i2R3A+A+Yn0lGqRI8G9mafyreF2vZchMwgTOg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O27SE9VrZlzsznA+B2nekSLfC3pqL52p6lREM2Ky6CIsc10FtWGfZOA1D8rPEfa2a2hqgVJ7+GdynUZEGNXWPMonhjPvTMOBX8z+INEh9QcVbUWDQ29lvPV8+lOfR/qoTIySyp1Z3hJOA8lMYDd0A8RMpM946EO54SNPhTl/u5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u7Wde-0002qo-Gv; Wed, 23 Apr 2025 11:43:30 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u7Wdd-001h9v-2B;
	Wed, 23 Apr 2025 11:43:29 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u7Wdd-000TPY-1v;
	Wed, 23 Apr 2025 11:43:29 +0200
Message-ID: <15c2be97e1b58e7be182299d27e17996b47e8414.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: canaan: add reset driver for Kendryte K230
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Wed, 23 Apr 2025 11:43:29 +0200
In-Reply-To: <20250420-k230-reset-v2-2-f1b4a016e438@pigmoral.tech>
References: <20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech>
	 <20250420-k230-reset-v2-2-f1b4a016e438@pigmoral.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On So, 2025-04-20 at 01:09 +0800, Junhui Liu wrote:
> Add support for the resets on Canaan Kendryte K230 SoC. The driver
> support CPU0, CPU1, L2 cache flush, hardware auto clear and software
> clear resets.
>=20
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>=20
> ---
> The reset management module in the K230 SoC also provides reset time
> control registers. For RST_TYPE_CPU0, RST_TYPE_CPU1 and RST_TYPE_SW_DONE,
> the time period when reset is applyed/removed but the clock is stopped
> can be set up to 15*0.25 =3D 3.75 us. For some RST_TYPE_HW_DONE cases, th=
e
> time period can be set up to 255*0.25 =3D 63.75 us. For RST_TYPE_FLUSH,
> the reset bit will automatically cleared by hardware when flush done.
>=20
> Although the current reset driver does not support configuration of
> reset time registers, delay has been added to the assert, deassert and
> reset functions to accommodate the longest reset time.
>=20
> Besides, although some reset types have done bits, the reference manual
> does not explicitly indicate whether the hardware removes reset or the
> clock stop time period has passed when done bits toggle. Therefore, I
> think it is a safer way to keep delay for reset types with done bits.
>=20
> link: https://kendryte-download.canaan-creative.com/developer/k230/HDK/K2=
30%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3=
.1_20241118.pdf
> ---
>  drivers/reset/Kconfig      |   9 ++
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-k230.c | 355 +++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 365 insertions(+)
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 99f6f9784e6865faddf8621ccfca095778c4dc47..248138ffba3bfbf859c74ba1a=
ed7ba2f72819f7a 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -140,6 +140,15 @@ config RESET_K210
>  	  Say Y if you want to control reset signals provided by this
>  	  controller.
> =20
> +config RESET_K230
> +	tristate "Reset controller driver for Canaan Kendryte K230 SoC"
> +	depends on ARCH_CANAAN || COMPILE_TEST
> +	depends on OF
> +	help
> +	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
> +	  Say Y if you want to control reset signals provided by this
> +	  controller.
> +
>  config RESET_LANTIQ
>  	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>  	default SOC_TYPE_XWAY
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 31f9904d13f9c3a107fc1ee1ec9f9baba016d101..13fe94531bea1eb91268b1804=
e1321b167815a4b 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_RESET_IMX7) +=3D reset-imx7.o
>  obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) +=3D reset-imx8mp-audiomix.o
>  obj-$(CONFIG_RESET_INTEL_GW) +=3D reset-intel-gw.o
>  obj-$(CONFIG_RESET_K210) +=3D reset-k210.o
> +obj-$(CONFIG_RESET_K230) +=3D reset-k230.o
>  obj-$(CONFIG_RESET_LANTIQ) +=3D reset-lantiq.o
>  obj-$(CONFIG_RESET_LPC18XX) +=3D reset-lpc18xx.o
>  obj-$(CONFIG_RESET_MCHP_SPARX5) +=3D reset-microchip-sparx5.o
> diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..492d2274893675b0ff1967426=
c8fa9e75aed1791
> --- /dev/null
> +++ b/drivers/reset/reset-k230.c
> @@ -0,0 +1,355 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2016-2017 Linaro Ltd.
> + * Copyright (C) 2022-2024 Canaan Bright Sight Co., Ltd
> + * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
> +
> +#include <dt-bindings/reset/canaan,k230-rst.h>
> +
> +/**
> + * enum k230_rst_type - K230 reset types
> + * @RST_TYPE_CPU0: Reset type for CPU0
> + *	Automatically clears, has write enable and done bit, active high
> + * @RST_TYPE_CPU1: Reset type for CPU1
> + *	Manually clears, has write enable and done bit, active high
> + * @RST_TYPE_FLUSH: Reset type for CPU L2 cache flush
> + *	Automatically clears, has write enable, no done bit, active high
> + * @RST_TYPE_HW_DONE: Reset type for hardware auto clear
> + *	Automatically clears, no write enable, has done bit, active high
> + * @RST_TYPE_SW_DONE: Reset type for software manual clear
> + *	Manually clears, no write enable and done bit,
> + *	active high if ID is RST_SPI2AXI, otherwise active low
> + */
> +enum k230_rst_type {
> +	RST_TYPE_CPU0,
> +	RST_TYPE_CPU1,
> +	RST_TYPE_FLUSH,
> +	RST_TYPE_HW_DONE,
> +	RST_TYPE_SW_DONE,
> +};
> +
> +struct k230_rst_map {
> +	u32			offset;
> +	enum k230_rst_type	type;
> +	u32			done;
> +	u32			reset;
> +};
> +
> +struct k230_rst {
> +	struct reset_controller_dev	rcdev;
> +	struct device			*dev;
> +	void __iomem			*base;
> +	spinlock_t			lock;

Add a comment, this locks register read-modify-write.

> +};
> +
> +static const struct k230_rst_map k230_resets[] =3D {
> +	[RST_CPU0]		=3D { 0x4,  RST_TYPE_CPU0,    BIT(12), BIT(0) },
> +	[RST_CPU1]		=3D { 0xc,  RST_TYPE_CPU1,    BIT(12), BIT(0) },
> +	[RST_CPU0_FLUSH]	=3D { 0x4,  RST_TYPE_FLUSH,   0,       BIT(4) },
> +	[RST_CPU1_FLUSH]	=3D { 0xc,  RST_TYPE_FLUSH,   0,       BIT(4) },
> +	[RST_AI]		=3D { 0x14, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_VPU]		=3D { 0x1c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_HS]		=3D { 0x2c, RST_TYPE_HW_DONE, BIT(4),  BIT(0) },
> +	[RST_HS_AHB]		=3D { 0x2c, RST_TYPE_HW_DONE, BIT(5),  BIT(1) },

The TRM calls these HISYS. Is this shortened to HS on purpose?

[...]

> +static int k230_rst_reset(struct reset_controller_dev *rcdev, unsigned l=
ong id)
> +{
> +	struct k230_rst *rstc =3D to_k230_rst(rcdev);
> +	const struct k230_rst_map *rmap =3D &k230_resets[id];
> +	u32 reg;
> +	int ret =3D 0;
> +
> +	switch (rmap->type) {
> +	case RST_TYPE_CPU0:
> +		k230_rst_clear_done(rstc, id, true);
> +		k230_rst_update(rstc, id, true, true, false);
> +		ret =3D k230_rst_wait_and_clear_done(rstc, id, true);
> +
> +		/*
> +		 * The time period when reset is applied and removed but the
> +		 * clock is stopped for RST_TYPE_CPU0 can be set up to 7.5us.
> +		 * Delay 10us to ensure proper reset timing.
> +		 */
> +		udelay(10);
> +
> +		break;
> +	case RST_TYPE_FLUSH:
> +		k230_rst_update(rstc, id, true, true, false);
> +
> +		/* Wait flush request bit auto cleared by hardware */
> +		ret =3D readl_poll_timeout(rstc->base + rmap->offset, reg,
> +					!(reg & rmap->reset), 10, 1000);
> +		if (ret)
> +			dev_err(rstc->dev, "Wait for flush done timeout\n");
> +
> +		break;
> +	case RST_TYPE_HW_DONE:
> +		k230_rst_clear_done(rstc, id, false);
> +		k230_rst_update(rstc, id, true, false, false);
> +		ret =3D k230_rst_wait_and_clear_done(rstc, id, false);
> +
> +		/*
> +		 * The time period when reset is applied and removed but the
> +		 * clock is stopped for RST_TYPE_HW_DONE can be set up to
> +		 * 127.5us. Delay 200us to ensure proper reset timing.
> +		 */
> +		udelay(200);

Consider using usleep_range(), or fsleep().

regards
Philipp
