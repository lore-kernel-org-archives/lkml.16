Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714351754B;
	Thu, 10 Apr 2025 00:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246531; cv=none; b=XnerjsY2tgJYDv8qS3vwuefqbABIRokgo2Xa1b9+HAdq3xDddeob5ytFbeJoHYPyHL0kEHLsLEd6tntVRkceuXaPpG+DyOz18TNrDAwI4XNo/84WmJmNxO/X0/dUjaM2uSHqoWpMOvyYfjfZyLQ/i5PswhTQNazRYDYZ4iBIIV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246531; c=relaxed/simple;
	bh=rU3RHe9JMzY0BfS6eQTYWEBSp5L4QCRwaBgN7zn8hlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTEkTNo1e1Te4zAR+8JcfAkhetD+pMh5ZVnK1XTBPdISyKmuyeNe6dF8RnnAPJ4PknvnDkALlM4BIhQBZD6v2cFtBpz7pOcpAtV/9dKX6Qei9G4zLff+AWtlEZ5IN2rr7J6l4oVd4m5xKAStGxbDHe53wHAlOxXsa7VmtY+Njw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 13C0A34326C;
	Thu, 10 Apr 2025 00:55:26 +0000 (UTC)
Date: Thu, 10 Apr 2025 00:55:22 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <20250410005522-GYB19359@gentoo>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401172434.6774-4-heylenay@4d2.org>

On 17:24 Tue 01 Apr     , Haylen Chu wrote:
> The clock tree of K1 SoC contains three main types of clock hardware
> (PLL/DDN/MIX) and has control registers split into several multifunction
> devices: APBS (PLLs), MPMU, APBC and APMU.
> 
> All register operations are done through regmap to ensure atomiciy
> between concurrent operations of clock driver and reset,
> power-domain driver that will be introduced in the future.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  drivers/clk/Kconfig               |    1 +
>  drivers/clk/Makefile              |    1 +
>  drivers/clk/spacemit/Kconfig      |   18 +
>  drivers/clk/spacemit/Makefile     |    5 +
>  drivers/clk/spacemit/apbc_clks    |  100 +++
>  drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
>  drivers/clk/spacemit/ccu_common.h |   48 ++
>  drivers/clk/spacemit/ccu_ddn.c    |   83 ++
>  drivers/clk/spacemit/ccu_ddn.h    |   47 ++
>  drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
>  drivers/clk/spacemit/ccu_mix.h    |  218 +++++
>  drivers/clk/spacemit/ccu_pll.c    |  157 ++++
>  drivers/clk/spacemit/ccu_pll.h    |   86 ++
>  13 files changed, 2348 insertions(+)
>  create mode 100644 drivers/clk/spacemit/Kconfig
>  create mode 100644 drivers/clk/spacemit/Makefile
>  create mode 100644 drivers/clk/spacemit/apbc_clks
>  create mode 100644 drivers/clk/spacemit/ccu-k1.c
>  create mode 100644 drivers/clk/spacemit/ccu_common.h
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>  create mode 100644 drivers/clk/spacemit/ccu_mix.c
>  create mode 100644 drivers/clk/spacemit/ccu_mix.h
>  create mode 100644 drivers/clk/spacemit/ccu_pll.c
>  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 713573b6c86c..19c1ed280fd7 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
>  source "drivers/clk/sifive/Kconfig"
>  source "drivers/clk/socfpga/Kconfig"
>  source "drivers/clk/sophgo/Kconfig"
> +source "drivers/clk/spacemit/Kconfig"
>  source "drivers/clk/sprd/Kconfig"
>  source "drivers/clk/starfive/Kconfig"
>  source "drivers/clk/sunxi/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index bf4bd45adc3a..42867cd37c33 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>  obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
>  obj-y					+= socfpga/
>  obj-y					+= sophgo/
> +obj-y					+= spacemit/
>  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>  obj-y					+= sprd/
>  obj-$(CONFIG_ARCH_STI)			+= st/
> diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> new file mode 100644
> index 000000000000..4c4df845b3cb
> --- /dev/null
> +++ b/drivers/clk/spacemit/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config SPACEMIT_CCU
> +	tristate "Clock support for SpacemiT SoCs"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select MFD_SYSCON
> +	help
> +	  Say Y to enable clock controller unit support for SpacemiT SoCs.
> +
> +if SPACEMIT_CCU
> +
> +config SPACEMIT_K1_CCU
> +	tristate "Support for SpacemiT K1 SoC"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	help
> +	  Support for clock controller unit in SpacemiT K1 SoC.
> +
> +endif
> diff --git a/drivers/clk/spacemit/Makefile b/drivers/clk/spacemit/Makefile
> new file mode 100644
> index 000000000000..5ec6da61db98
> --- /dev/null
> +++ b/drivers/clk/spacemit/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_SPACEMIT_K1_CCU)	= spacemit-ccu-k1.o
> +spacemit-ccu-k1-y		= ccu_pll.o ccu_mix.o ccu_ddn.o
> +spacemit-ccu-k1-y		+= ccu-k1.o
> diff --git a/drivers/clk/spacemit/apbc_clks b/drivers/clk/spacemit/apbc_clks
> new file mode 100644
> index 000000000000..a65128007063
> --- /dev/null
> +++ b/drivers/clk/spacemit/apbc_clks
> @@ -0,0 +1,100 @@
> +		[CLK_UART0]		= &uart0_clk.common.hw,
> +		[CLK_UART2]		= &uart2_clk.common.hw,
> +		[CLK_UART3]		= &uart3_clk.common.hw,
> +		[CLK_UART4]		= &uart4_clk.common.hw,
> +		[CLK_UART5]		= &uart5_clk.common.hw,
> +		[CLK_UART6]		= &uart6_clk.common.hw,
> +		[CLK_UART7]		= &uart7_clk.common.hw,
> +		[CLK_UART8]		= &uart8_clk.common.hw,
> +		[CLK_UART9]		= &uart9_clk.common.hw,
> +		[CLK_GPIO]		= &gpio_clk.common.hw,
> +		[CLK_PWM0]		= &pwm0_clk.common.hw,
> +		[CLK_PWM1]		= &pwm1_clk.common.hw,
> +		[CLK_PWM2]		= &pwm2_clk.common.hw,
> +		[CLK_PWM3]		= &pwm3_clk.common.hw,
> +		[CLK_PWM4]		= &pwm4_clk.common.hw,
> +		[CLK_PWM5]		= &pwm5_clk.common.hw,
> +		[CLK_PWM6]		= &pwm6_clk.common.hw,
> +		[CLK_PWM7]		= &pwm7_clk.common.hw,
> +		[CLK_PWM8]		= &pwm8_clk.common.hw,
> +		[CLK_PWM9]		= &pwm9_clk.common.hw,
> +		[CLK_PWM10]		= &pwm10_clk.common.hw,
> +		[CLK_PWM11]		= &pwm11_clk.common.hw,
> +		[CLK_PWM12]		= &pwm12_clk.common.hw,
> +		[CLK_PWM13]		= &pwm13_clk.common.hw,
> +		[CLK_PWM14]		= &pwm14_clk.common.hw,
> +		[CLK_PWM15]		= &pwm15_clk.common.hw,
> +		[CLK_PWM16]		= &pwm16_clk.common.hw,
> +		[CLK_PWM17]		= &pwm17_clk.common.hw,
> +		[CLK_PWM18]		= &pwm18_clk.common.hw,
> +		[CLK_PWM19]		= &pwm19_clk.common.hw,
> +		[CLK_SSP3]		= &ssp3_clk.common.hw,
> +		[CLK_RTC]		= &rtc_clk.common.hw,
> +		[CLK_TWSI0]		= &twsi0_clk.common.hw,
> +		[CLK_TWSI1]		= &twsi1_clk.common.hw,
> +		[CLK_TWSI2]		= &twsi2_clk.common.hw,
> +		[CLK_TWSI4]		= &twsi4_clk.common.hw,
> +		[CLK_TWSI5]		= &twsi5_clk.common.hw,
> +		[CLK_TWSI6]		= &twsi6_clk.common.hw,
> +		[CLK_TWSI7]		= &twsi7_clk.common.hw,
> +		[CLK_TWSI8]		= &twsi8_clk.common.hw,
> +		[CLK_TIMERS1]		= &timers1_clk.common.hw,
> +		[CLK_TIMERS2]		= &timers2_clk.common.hw,
> +		[CLK_AIB]		= &aib_clk.common.hw,
> +		[CLK_ONEWIRE]		= &onewire_clk.common.hw,
> +		[CLK_SSPA0]		= &sspa0_clk.common.hw,
> +		[CLK_SSPA1]		= &sspa1_clk.common.hw,
> +		[CLK_DRO]		= &dro_clk.common.hw,
> +		[CLK_IR]		= &ir_clk.common.hw,
> +		[CLK_TSEN]		= &tsen_clk.common.hw,
> +		[CLK_IPC_AP2AUD]	= &ipc_ap2aud_clk.common.hw,
> +		[CLK_CAN0]		= &can0_clk.common.hw,
> +		[CLK_CAN0_BUS]		= &can0_bus_clk.common.hw,
> +		[CLK_UART0_BUS]		= &uart0_bus_clk.common.hw,
> +		[CLK_UART2_BUS]		= &uart2_bus_clk.common.hw,
> +		[CLK_UART3_BUS]		= &uart3_bus_clk.common.hw,
> +		[CLK_UART4_BUS]		= &uart4_bus_clk.common.hw,
> +		[CLK_UART5_BUS]		= &uart5_bus_clk.common.hw,
> +		[CLK_UART6_BUS]		= &uart6_bus_clk.common.hw,
> +		[CLK_UART7_BUS]		= &uart7_bus_clk.common.hw,
> +		[CLK_UART8_BUS]		= &uart8_bus_clk.common.hw,
> +		[CLK_UART9_BUS]		= &uart9_bus_clk.common.hw,
> +		[CLK_GPIO_BUS]		= &gpio_bus_clk.common.hw,
> +		[CLK_PWM0_BUS]		= &pwm0_bus_clk.common.hw,
> +		[CLK_PWM1_BUS]		= &pwm1_bus_clk.common.hw,
> +		[CLK_PWM2_BUS]		= &pwm2_bus_clk.common.hw,
> +		[CLK_PWM3_BUS]		= &pwm3_bus_clk.common.hw,
> +		[CLK_PWM4_BUS]		= &pwm4_bus_clk.common.hw,
> +		[CLK_PWM5_BUS]		= &pwm5_bus_clk.common.hw,
> +		[CLK_PWM6_BUS]		= &pwm6_bus_clk.common.hw,
> +		[CLK_PWM7_BUS]		= &pwm7_bus_clk.common.hw,
> +		[CLK_PWM8_BUS]		= &pwm8_bus_clk.common.hw,
> +		[CLK_PWM9_BUS]		= &pwm9_bus_clk.common.hw,
> +		[CLK_PWM10_BUS]		= &pwm10_bus_clk.common.hw,
> +		[CLK_PWM11_BUS]		= &pwm11_bus_clk.common.hw,
> +		[CLK_PWM12_BUS]		= &pwm12_bus_clk.common.hw,
> +		[CLK_PWM13_BUS]		= &pwm13_bus_clk.common.hw,
> +		[CLK_PWM14_BUS]		= &pwm14_bus_clk.common.hw,
> +		[CLK_PWM15_BUS]		= &pwm15_bus_clk.common.hw,
> +		[CLK_PWM16_BUS]		= &pwm16_bus_clk.common.hw,
> +		[CLK_PWM17_BUS]		= &pwm17_bus_clk.common.hw,
> +		[CLK_PWM18_BUS]		= &pwm18_bus_clk.common.hw,
> +		[CLK_PWM19_BUS]		= &pwm19_bus_clk.common.hw,
> +		[CLK_SSP3_BUS]		= &ssp3_bus_clk.common.hw,
> +		[CLK_RTC_BUS]		= &rtc_bus_clk.common.hw,
> +		[CLK_TWSI0_BUS]		= &twsi0_bus_clk.common.hw,
> +		[CLK_TWSI1_BUS]		= &twsi1_bus_clk.common.hw,
> +		[CLK_TWSI2_BUS]		= &twsi2_bus_clk.common.hw,
> +		[CLK_TWSI4_BUS]		= &twsi4_bus_clk.common.hw,
> +		[CLK_TWSI5_BUS]		= &twsi5_bus_clk.common.hw,
> +		[CLK_TWSI6_BUS]		= &twsi6_bus_clk.common.hw,
> +		[CLK_TWSI7_BUS]		= &twsi7_bus_clk.common.hw,
> +		[CLK_TWSI8_BUS]		= &twsi8_bus_clk.common.hw,
> +		[CLK_TIMERS1_BUS]	= &timers1_bus_clk.common.hw,
> +		[CLK_TIMERS2_BUS]	= &timers2_bus_clk.common.hw,
> +		[CLK_AIB_BUS]		= &aib_bus_clk.common.hw,
> +		[CLK_ONEWIRE_BUS]	= &onewire_bus_clk.common.hw,
> +		[CLK_SSPA0_BUS]		= &sspa0_bus_clk.common.hw,
> +		[CLK_SSPA1_BUS]		= &sspa1_bus_clk.common.hw,
> +		[CLK_TSEN_BUS]		= &tsen_bus_clk.common.hw,
> +		[CLK_IPC_AP2AUD_BUS]	= &ipc_ap2aud_bus_clk.common.hw,
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> new file mode 100644
> index 000000000000..cd95c4f9c127
> --- /dev/null
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -0,0 +1,1316 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> + * Copyright (c) 2024 Haylen Chu <heylenay@4d2.org>
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_pll.h"
> +#include "ccu_mix.h"
> +#include "ccu_ddn.h"
> +
> +#include <dt-bindings/clock/spacemit,k1-syscon.h>
> +
> +/* APBS register offset */
> +#define APBS_PLL1_SWCR1			0x100
> +#define APBS_PLL1_SWCR2			0x104
> +#define APBS_PLL1_SWCR3			0x108
> +#define APBS_PLL2_SWCR1			0x118
> +#define APBS_PLL2_SWCR2			0x11c
> +#define APBS_PLL2_SWCR3			0x120
> +#define APBS_PLL3_SWCR1			0x124
> +#define APBS_PLL3_SWCR2			0x128
> +#define APBS_PLL3_SWCR3			0x12c
> +
> +/* MPMU register offset */
> +#define MPMU_POSR			0x0010
> +#define  POSR_PLL1_LOCK			BIT(27)
> +#define  POSR_PLL2_LOCK			BIT(28)
> +#define  POSR_PLL3_LOCK			BIT(29)
> +#define MPMU_SUCCR			0x0014
> +#define MPMU_ISCCR			0x0044
> +#define MPMU_WDTPCR			0x0200
> +#define MPMU_RIPCCR			0x0210
> +#define MPMU_ACGR			0x1024
> +#define MPMU_APBCSCR			0x1050
> +#define MPMU_SUCCR_1			0x10b0
> +
> +/* APBC register offset */
> +#define APBC_UART1_CLK_RST		0x00
> +#define APBC_UART2_CLK_RST		0x04
> +#define APBC_GPIO_CLK_RST		0x08
> +#define APBC_PWM0_CLK_RST		0x0c
> +#define APBC_PWM1_CLK_RST		0x10
> +#define APBC_PWM2_CLK_RST		0x14
> +#define APBC_PWM3_CLK_RST		0x18
> +#define APBC_TWSI8_CLK_RST		0x20
> +#define APBC_UART3_CLK_RST		0x24
> +#define APBC_RTC_CLK_RST		0x28
> +#define APBC_TWSI0_CLK_RST		0x2c
> +#define APBC_TWSI1_CLK_RST		0x30
> +#define APBC_TIMERS1_CLK_RST		0x34
> +#define APBC_TWSI2_CLK_RST		0x38
> +#define APBC_AIB_CLK_RST		0x3c
> +#define APBC_TWSI4_CLK_RST		0x40
> +#define APBC_TIMERS2_CLK_RST		0x44
> +#define APBC_ONEWIRE_CLK_RST		0x48
> +#define APBC_TWSI5_CLK_RST		0x4c
> +#define APBC_DRO_CLK_RST		0x58
> +#define APBC_IR_CLK_RST			0x5c
> +#define APBC_TWSI6_CLK_RST		0x60
> +#define APBC_COUNTER_CLK_SEL		0x64
> +#define APBC_TWSI7_CLK_RST		0x68
> +#define APBC_TSEN_CLK_RST		0x6c
> +#define APBC_UART4_CLK_RST		0x70
> +#define APBC_UART5_CLK_RST		0x74
> +#define APBC_UART6_CLK_RST		0x78
> +#define APBC_SSP3_CLK_RST		0x7c
> +#define APBC_SSPA0_CLK_RST		0x80
> +#define APBC_SSPA1_CLK_RST		0x84
> +#define APBC_IPC_AP2AUD_CLK_RST		0x90
> +#define APBC_UART7_CLK_RST		0x94
> +#define APBC_UART8_CLK_RST		0x98
> +#define APBC_UART9_CLK_RST		0x9c
> +#define APBC_CAN0_CLK_RST		0xa0
> +#define APBC_PWM4_CLK_RST		0xa8
> +#define APBC_PWM5_CLK_RST		0xac
> +#define APBC_PWM6_CLK_RST		0xb0
> +#define APBC_PWM7_CLK_RST		0xb4
> +#define APBC_PWM8_CLK_RST		0xb8
> +#define APBC_PWM9_CLK_RST		0xbc
> +#define APBC_PWM10_CLK_RST		0xc0
> +#define APBC_PWM11_CLK_RST		0xc4
> +#define APBC_PWM12_CLK_RST		0xc8
> +#define APBC_PWM13_CLK_RST		0xcc
> +#define APBC_PWM14_CLK_RST		0xd0
> +#define APBC_PWM15_CLK_RST		0xd4
> +#define APBC_PWM16_CLK_RST		0xd8
> +#define APBC_PWM17_CLK_RST		0xdc
> +#define APBC_PWM18_CLK_RST		0xe0
> +#define APBC_PWM19_CLK_RST		0xe4
> +
> +/* APMU register offset */
> +#define APMU_JPG_CLK_RES_CTRL		0x020
> +#define APMU_CSI_CCIC2_CLK_RES_CTRL	0x024
> +#define APMU_ISP_CLK_RES_CTRL		0x038
> +#define APMU_LCD_CLK_RES_CTRL1		0x044
> +#define APMU_LCD_SPI_CLK_RES_CTRL	0x048
> +#define APMU_LCD_CLK_RES_CTRL2		0x04c
> +#define APMU_CCIC_CLK_RES_CTRL		0x050
> +#define APMU_SDH0_CLK_RES_CTRL		0x054
> +#define APMU_SDH1_CLK_RES_CTRL		0x058
> +#define APMU_USB_CLK_RES_CTRL		0x05c
> +#define APMU_QSPI_CLK_RES_CTRL		0x060
> +#define APMU_DMA_CLK_RES_CTRL		0x064
> +#define APMU_AES_CLK_RES_CTRL		0x068
> +#define APMU_VPU_CLK_RES_CTRL		0x0a4
> +#define APMU_GPU_CLK_RES_CTRL		0x0cc
> +#define APMU_SDH2_CLK_RES_CTRL		0x0e0
> +#define APMU_PMUA_MC_CTRL		0x0e8
> +#define APMU_PMU_CC2_AP			0x100
> +#define APMU_PMUA_EM_CLK_RES_CTRL	0x104
> +#define APMU_AUDIO_CLK_RES_CTRL		0x14c
> +#define APMU_HDMI_CLK_RES_CTRL		0x1b8
> +#define APMU_CCI550_CLK_CTRL		0x300
> +#define APMU_ACLK_CLK_CTRL		0x388
> +#define APMU_CPU_C0_CLK_CTRL		0x38C
> +#define APMU_CPU_C1_CLK_CTRL		0x390
> +#define APMU_PCIE_CLK_RES_CTRL_0	0x3cc
> +#define APMU_PCIE_CLK_RES_CTRL_1	0x3d4
> +#define APMU_PCIE_CLK_RES_CTRL_2	0x3dc
> +#define APMU_EMAC0_CLK_RES_CTRL		0x3e4
> +#define APMU_EMAC1_CLK_RES_CTRL		0x3ec
> +
> +/* APBS clocks start, APBS region contains and only contains all PLL clocks */
> +
> +/* Frequency of pll{1,2} must not be updated at runtime */
> +static const struct ccu_pll_rate_tbl pll1_rate_tbl[] = {
> +	CCU_PLL_RATE(2457600000UL, 0x0050dd64, 0x330ccccd),
> +};
> +
> +static const struct ccu_pll_rate_tbl pll2_rate_tbl[] = {
> +	CCU_PLL_RATE(2457600000UL, 0x0050dd64, 0x330ccccd),
> +	CCU_PLL_RATE(2800000000UL, 0x0050dd66, 0x3a155555),
> +	CCU_PLL_RATE(3000000000UL, 0x0050dd66, 0x3fe00000),
> +	CCU_PLL_RATE(3200000000UL, 0x0050dd67, 0x43eaaaab),
> +};
> +
> +static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {
> +	CCU_PLL_RATE(1600000000UL, 0x0050cd61, 0x43eaaaab),
> +	CCU_PLL_RATE(1800000000UL, 0x0050cd61, 0x4b000000),
> +	CCU_PLL_RATE(2000000000UL, 0x0050dd62, 0x2aeaaaab),
> +	CCU_PLL_RATE(2457600000UL, 0x0050dd64, 0x330ccccd),
> +	CCU_PLL_RATE(3000000000UL, 0x0050dd66, 0x3fe00000),
> +	CCU_PLL_RATE(3200000000UL, 0x0050dd67, 0x43eaaaab),
> +};
> +
> +CCU_PLL_DEFINE(pll1, pll1_rate_tbl, APBS_PLL1_SWCR1, APBS_PLL1_SWCR3, MPMU_POSR,
> +	       POSR_PLL1_LOCK, CLK_SET_RATE_GATE);
> +CCU_PLL_DEFINE(pll2, pll2_rate_tbl, APBS_PLL2_SWCR1, APBS_PLL2_SWCR3, MPMU_POSR,
> +	       POSR_PLL2_LOCK, CLK_SET_RATE_GATE);
> +CCU_PLL_DEFINE(pll3, pll3_rate_tbl, APBS_PLL3_SWCR1, APBS_PLL3_SWCR3, MPMU_POSR,
> +	       POSR_PLL3_LOCK, CLK_SET_RATE_GATE);
> +
> +CCU_FACTOR_GATE_DEFINE(pll1_d2, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(1), 2,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d3, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(2), 3,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2,
> +		       BIT(15), 11, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2,
> +		       BIT(16), 13, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2,
> +		       BIT(20), 23, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d64_38p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2,
> +		       BIT(0), 64, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_aud_245p7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2,
> +		       BIT(10), 10, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_aud_24p5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2,
> +		       BIT(11), 100, 1);
> +
> +CCU_FACTOR_GATE_DEFINE(pll2_d1, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(0), 1,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll2_d2, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(1), 2,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll2_d3, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(2), 3,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll2_d4, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(3), 4,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll2_d5, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(4), 5,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll2_d6, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(5), 6,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll2_d7, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(6), 7,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll2_d8, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(7), 8,
> +		       1);
> +
> +CCU_FACTOR_GATE_DEFINE(pll3_d1, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(0), 1,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll3_d2, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(1), 2,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll3_d3, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(2), 3,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll3_d4, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(3), 4,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll3_d5, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(4), 5,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll3_d6, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(5), 6,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll3_d7, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(6), 7,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll3_d8, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(7), 8,
> +		       1);
> +
> +CCU_FACTOR_DEFINE(pll3_20, CCU_PARENT_HW(pll3_d8), 20, 1);
> +CCU_FACTOR_DEFINE(pll3_40, CCU_PARENT_HW(pll3_d8), 10, 1);
> +CCU_FACTOR_DEFINE(pll3_80, CCU_PARENT_HW(pll3_d8), 5, 1);
> +
> +/* APBS clocks end */
> +
> +/* MPMU clocks start */
> +CCU_GATE_DEFINE(pll1_d8_307p2, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(13), 0);
> +
> +CCU_FACTOR_DEFINE(pll1_d32_76p8, CCU_PARENT_HW(pll1_d8_307p2), 4, 1);
> +
> +CCU_FACTOR_DEFINE(pll1_d40_61p44, CCU_PARENT_HW(pll1_d8_307p2), 5, 1);
> +
> +CCU_FACTOR_DEFINE(pll1_d16_153p6, CCU_PARENT_HW(pll1_d8), 2, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d24_102p4, CCU_PARENT_HW(pll1_d8), MPMU_ACGR,
> +		       BIT(12), 3, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d48_51p2, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(7),
> +		       6, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d48_51p2_ap, CCU_PARENT_HW(pll1_d8), MPMU_ACGR,
> +		       BIT(11), 6, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_m3d128_57p6, CCU_PARENT_HW(pll1_d8), MPMU_ACGR,
> +		       BIT(8), 16, 3);
> +CCU_FACTOR_GATE_DEFINE(pll1_d96_25p6, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(4),
> +		       12, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d192_12p8, CCU_PARENT_HW(pll1_d8), MPMU_ACGR,
> +		       BIT(3), 24, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d192_12p8_wdt, CCU_PARENT_HW(pll1_d8), MPMU_ACGR,
> +		       BIT(19), 24, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d384_6p4, CCU_PARENT_HW(pll1_d8), MPMU_ACGR,
> +		       BIT(2), 48, 1);
> +
> +CCU_FACTOR_DEFINE(pll1_d768_3p2, CCU_PARENT_HW(pll1_d384_6p4), 2, 1);
> +CCU_FACTOR_DEFINE(pll1_d1536_1p6, CCU_PARENT_HW(pll1_d384_6p4), 4, 1);
> +CCU_FACTOR_DEFINE(pll1_d3072_0p8, CCU_PARENT_HW(pll1_d384_6p4), 8, 1);
> +
> +CCU_GATE_DEFINE(pll1_d6_409p6, CCU_PARENT_HW(pll1_d6), MPMU_ACGR, BIT(0), 0);
> +CCU_FACTOR_GATE_DEFINE(pll1_d12_204p8, CCU_PARENT_HW(pll1_d6), MPMU_ACGR,
> +		       BIT(5), 2, 1);
> +
> +CCU_GATE_DEFINE(pll1_d5_491p52, CCU_PARENT_HW(pll1_d5), MPMU_ACGR, BIT(21), 0);
> +CCU_FACTOR_GATE_DEFINE(pll1_d10_245p76, CCU_PARENT_HW(pll1_d5), MPMU_ACGR,
> +		       BIT(18), 2, 1);
> +
> +CCU_GATE_DEFINE(pll1_d4_614p4, CCU_PARENT_HW(pll1_d4), MPMU_ACGR,
> +		BIT(15), 0);
> +CCU_FACTOR_GATE_DEFINE(pll1_d52_47p26, CCU_PARENT_HW(pll1_d4), MPMU_ACGR,
> +		       BIT(10), 13, 1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d78_31p5, CCU_PARENT_HW(pll1_d4), MPMU_ACGR,
> +		       BIT(6), 39, 2);
> +
> +CCU_GATE_DEFINE(pll1_d3_819p2, CCU_PARENT_HW(pll1_d3), MPMU_ACGR, BIT(14), 0);
> +
> +CCU_GATE_DEFINE(pll1_d2_1228p8, CCU_PARENT_HW(pll1_d2), MPMU_ACGR, BIT(16), 0);
> +
> +CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1),
> +		CLK_IGNORE_UNUSED);
> +CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16),
> +	       GENMASK(12, 0), 0);
> +CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16),
> +	       GENMASK(12, 0), 0);
> +
> +CCU_GATE_DEFINE(wdt_clk, CCU_PARENT_HW(pll1_d96_25p6), MPMU_WDTPCR, BIT(1), 0);
> +
> +CCU_FACTOR_GATE_DEFINE(i2s_sysclk, CCU_PARENT_HW(pll1_d16_153p6), MPMU_ISCCR,
> +		       BIT(31), 50, 1);
> +CCU_FACTOR_GATE_DEFINE(i2s_bclk, CCU_PARENT_HW(i2s_sysclk), MPMU_ISCCR, BIT(29),
> +		       1, 1);
> +
> +static const struct clk_parent_data apb_parents[] = {
> +	CCU_PARENT_HW(pll1_d96_25p6),
> +	CCU_PARENT_HW(pll1_d48_51p2),
> +	CCU_PARENT_HW(pll1_d96_25p6),
> +	CCU_PARENT_HW(pll1_d24_102p4),
> +};
> +CCU_MUX_DEFINE(apb_clk, apb_parents, MPMU_APBCSCR, 0, 2, 0);
> +
> +CCU_GATE_DEFINE(wdt_bus_clk, CCU_PARENT_HW(apb_clk), MPMU_WDTPCR, BIT(0), 0);
> +
> +CCU_GATE_DEFINE(ripc_clk, CCU_PARENT_HW(apb_clk), MPMU_RIPCCR, 0x1, 0);
> +/* MPMU clocks end */
> +
> +/* APBC clocks start */
> +static const struct clk_parent_data uart_clk_parents[] = {
> +	CCU_PARENT_HW(pll1_m3d128_57p6),
> +	CCU_PARENT_HW(slow_uart1_14p74),
> +	CCU_PARENT_HW(slow_uart2_48),
> +};
> +CCU_MUX_GATE_DEFINE(uart0_clk, uart_clk_parents, APBC_UART1_CLK_RST, 4, 3,
> +		    BIT(1), CLK_IS_CRITICAL);
I'd request adding an explict documents for why need CLK_IS_CRITICAL flag
(there are more place, I won't add comments)

Can you check this one? I think it's probably not necessary here,
I can understand your concern of afraid of serial console breakage once clk
driver merged, since we already enabled uart driver and using a dummy clk.. 

I think we probably could handle this carefully, sending an incrimental
patch of uart to enable clk along with clk merged..

> +CCU_MUX_GATE_DEFINE(uart2_clk, uart_clk_parents, APBC_UART2_CLK_RST, 4, 3,
> +		    BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(uart3_clk, uart_clk_parents, APBC_UART3_CLK_RST, 4, 3,
> +		    BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(uart4_clk, uart_clk_parents, APBC_UART4_CLK_RST, 4, 3,
> +		    BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(uart5_clk, uart_clk_parents, APBC_UART5_CLK_RST, 4, 3,
> +		    BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(uart6_clk, uart_clk_parents, APBC_UART6_CLK_RST, 4, 3,
> +		    BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(uart7_clk, uart_clk_parents, APBC_UART7_CLK_RST, 4, 3,
> +		    BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(uart8_clk, uart_clk_parents, APBC_UART8_CLK_RST, 4, 3,
> +		    BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(uart9_clk, uart_clk_parents, APBC_UART9_CLK_RST, 4, 3,
> +		    BIT(1), 0);
> +
> +CCU_GATE_DEFINE(gpio_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_GPIO_CLK_RST,
> +		BIT(1), 0);
> +
> +static const struct clk_parent_data pwm_parents[] = {
> +	CCU_PARENT_HW(pll1_d192_12p8),
> +	CCU_PARENT_NAME(osc),
> +};
> +CCU_MUX_GATE_DEFINE(pwm0_clk, pwm_parents, APBC_PWM0_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(pwm1_clk, pwm_parents, APBC_PWM1_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(pwm2_clk, pwm_parents, APBC_PWM2_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(pwm3_clk, pwm_parents, APBC_PWM3_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(pwm4_clk, pwm_parents, APBC_PWM4_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(pwm5_clk, pwm_parents, APBC_PWM5_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(pwm6_clk, pwm_parents, APBC_PWM6_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(pwm7_clk, pwm_parents, APBC_PWM7_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(pwm8_clk, pwm_parents, APBC_PWM8_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(pwm9_clk, pwm_parents, APBC_PWM9_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(pwm10_clk, pwm_parents, APBC_PWM10_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(pwm11_clk, pwm_parents, APBC_PWM11_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(pwm12_clk, pwm_parents, APBC_PWM12_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(pwm13_clk, pwm_parents, APBC_PWM13_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(pwm14_clk, pwm_parents, APBC_PWM14_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(pwm15_clk, pwm_parents, APBC_PWM15_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(pwm16_clk, pwm_parents, APBC_PWM16_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(pwm17_clk, pwm_parents, APBC_PWM17_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(pwm18_clk, pwm_parents, APBC_PWM18_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(pwm19_clk, pwm_parents, APBC_PWM19_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +
> +static const struct clk_parent_data ssp_parents[] = {
> +	CCU_PARENT_HW(pll1_d384_6p4),
> +	CCU_PARENT_HW(pll1_d192_12p8),
> +	CCU_PARENT_HW(pll1_d96_25p6),
> +	CCU_PARENT_HW(pll1_d48_51p2),
> +	CCU_PARENT_HW(pll1_d768_3p2),
> +	CCU_PARENT_HW(pll1_d1536_1p6),
> +	CCU_PARENT_HW(pll1_d3072_0p8),
> +};
> +CCU_MUX_GATE_DEFINE(ssp3_clk, ssp_parents, APBC_SSP3_CLK_RST, 4, 3, BIT(1), 0);
> +
> +CCU_GATE_DEFINE(rtc_clk, CCU_PARENT_NAME(osc), APBC_RTC_CLK_RST,
> +		BIT(7) | BIT(1), 0);
> +
> +static const struct clk_parent_data twsi_parents[] = {
> +	CCU_PARENT_HW(pll1_d78_31p5),
> +	CCU_PARENT_HW(pll1_d48_51p2),
> +	CCU_PARENT_HW(pll1_d40_61p44),
> +};
> +CCU_MUX_GATE_DEFINE(twsi0_clk, twsi_parents, APBC_TWSI0_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(twsi1_clk, twsi_parents, APBC_TWSI1_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(twsi2_clk, twsi_parents, APBC_TWSI2_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(twsi4_clk, twsi_parents, APBC_TWSI4_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(twsi5_clk, twsi_parents, APBC_TWSI5_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(twsi6_clk, twsi_parents, APBC_TWSI6_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents, APBC_TWSI7_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +
> +static const struct clk_parent_data timer_parents[] = {
> +	CCU_PARENT_HW(pll1_d192_12p8),
> +	CCU_PARENT_NAME(osc),
> +	CCU_PARENT_HW(pll1_d384_6p4),
> +	CCU_PARENT_NAME(vctcxo_3m),
> +	CCU_PARENT_NAME(vctcxo_1m),
> +};
> +CCU_MUX_GATE_DEFINE(timers1_clk, timer_parents, APBC_TIMERS1_CLK_RST, 4, 3,
> +		    BIT(1), 0);
> +CCU_MUX_GATE_DEFINE(timers2_clk, timer_parents, APBC_TIMERS2_CLK_RST, 4, 3,
> +		    BIT(1), 0);
> +
> +CCU_GATE_DEFINE(aib_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_AIB_CLK_RST, BIT(1),
> +		0);
> +
> +CCU_GATE_DEFINE(onewire_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_ONEWIRE_CLK_RST,
> +		BIT(1), 0);
> +
> +static const struct clk_parent_data sspa_parents[] = {
> +	CCU_PARENT_HW(pll1_d384_6p4),
> +	CCU_PARENT_HW(pll1_d192_12p8),
> +	CCU_PARENT_HW(pll1_d96_25p6),
> +	CCU_PARENT_HW(pll1_d48_51p2),
> +	CCU_PARENT_HW(pll1_d768_3p2),
> +	CCU_PARENT_HW(pll1_d1536_1p6),
> +	CCU_PARENT_HW(pll1_d3072_0p8),
> +	CCU_PARENT_HW(i2s_bclk),
> +};
> +CCU_MUX_GATE_DEFINE(sspa0_clk, sspa_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_MUX_GATE_DEFINE(sspa1_clk, sspa_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1),
> +		    0);
> +CCU_GATE_DEFINE(dro_clk, CCU_PARENT_HW(apb_clk), APBC_DRO_CLK_RST, BIT(1), 0);
> +CCU_GATE_DEFINE(ir_clk, CCU_PARENT_HW(apb_clk), APBC_IR_CLK_RST, BIT(1), 0);
> +CCU_GATE_DEFINE(tsen_clk, CCU_PARENT_HW(apb_clk), APBC_TSEN_CLK_RST, BIT(1), 0);
> +CCU_GATE_DEFINE(ipc_ap2aud_clk, CCU_PARENT_HW(apb_clk), APBC_IPC_AP2AUD_CLK_RST,
> +		BIT(1), 0);
> +
> +static const struct clk_parent_data can_parents[] = {
> +	CCU_PARENT_HW(pll3_20),
> +	CCU_PARENT_HW(pll3_40),
> +	CCU_PARENT_HW(pll3_80),
> +};
> +CCU_MUX_GATE_DEFINE(can0_clk, can_parents, APBC_CAN0_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_GATE_DEFINE(can0_bus_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_CAN0_CLK_RST,
> +		BIT(0), 0);
> +
> +CCU_GATE_DEFINE(uart0_bus_clk, CCU_PARENT_HW(apb_clk), APBC_UART1_CLK_RST,
> +		BIT(0), CLK_IS_CRITICAL);
same reason
> +CCU_GATE_DEFINE(uart2_bus_clk, CCU_PARENT_HW(apb_clk), APBC_UART2_CLK_RST,
> +		BIT(0), 0);
> +CCU_GATE_DEFINE(uart3_bus_clk, CCU_PARENT_HW(apb_clk), APBC_UART3_CLK_RST,
> +		BIT(0), 0);
[...]
> +
> +/* APMU clocks start */
> +static const struct clk_parent_data pmua_aclk_parents[] = {
> +	CCU_PARENT_HW(pll1_d10_245p76),
> +	CCU_PARENT_HW(pll1_d8_307p2),
> +};
> +CCU_MUX_DIV_FC_DEFINE(pmua_aclk, pmua_aclk_parents, APMU_ACLK_CLK_CTRL, 1, 2,
> +		      BIT(4), 0, 1, 0);
> +
> +static const struct clk_parent_data cci550_clk_parents[] = {
> +	CCU_PARENT_HW(pll1_d5_491p52),
> +	CCU_PARENT_HW(pll1_d4_614p4),
> +	CCU_PARENT_HW(pll1_d3_819p2),
> +	CCU_PARENT_HW(pll2_d3),
> +};
> +CCU_MUX_DIV_FC_DEFINE(cci550_clk, cci550_clk_parents, APMU_CCI550_CLK_CTRL, 8,
> +		      3, BIT(12), 0, 2, CLK_IS_CRITICAL);
> +
> +static const struct clk_parent_data cpu_c0_hi_clk_parents[] = {
> +	CCU_PARENT_HW(pll3_d2),
> +	CCU_PARENT_HW(pll3_d1),
> +};
> +CCU_MUX_DEFINE(cpu_c0_hi_clk, cpu_c0_hi_clk_parents, APMU_CPU_C0_CLK_CTRL, 13,
> +	       1, 0);
> +static const struct clk_parent_data cpu_c0_clk_parents[] = {
> +	CCU_PARENT_HW(pll1_d4_614p4),
> +	CCU_PARENT_HW(pll1_d3_819p2),
> +	CCU_PARENT_HW(pll1_d6_409p6),
> +	CCU_PARENT_HW(pll1_d5_491p52),
> +	CCU_PARENT_HW(pll1_d2_1228p8),
> +	CCU_PARENT_HW(pll3_d3),
> +	CCU_PARENT_HW(pll2_d3),
> +	CCU_PARENT_HW(cpu_c0_hi_clk),
> +};
> +CCU_MUX_FC_DEFINE(cpu_c0_core_clk, cpu_c0_clk_parents, APMU_CPU_C0_CLK_CTRL,
> +		  BIT(12), 0, 3, CLK_IS_CRITICAL);
> +CCU_DIV_DEFINE(cpu_c0_ace_clk, CCU_PARENT_HW(cpu_c0_core_clk),
> +	       APMU_CPU_C0_CLK_CTRL, 6, 3, CLK_IS_CRITICAL);
> +CCU_DIV_DEFINE(cpu_c0_tcm_clk, CCU_PARENT_HW(cpu_c0_core_clk),
> +	       APMU_CPU_C0_CLK_CTRL, 9, 3, CLK_IS_CRITICAL);
> +
> +static const struct clk_parent_data cpu_c1_hi_clk_parents[] = {
> +	CCU_PARENT_HW(pll3_d2),
> +	CCU_PARENT_HW(pll3_d1),
> +};
> +CCU_MUX_DEFINE(cpu_c1_hi_clk, cpu_c1_hi_clk_parents, APMU_CPU_C1_CLK_CTRL, 13,
> +	       1, CLK_IS_CRITICAL);
> +static const struct clk_parent_data cpu_c1_clk_parents[] = {
> +	CCU_PARENT_HW(pll1_d4_614p4),
> +	CCU_PARENT_HW(pll1_d3_819p2),
> +	CCU_PARENT_HW(pll1_d6_409p6),
> +	CCU_PARENT_HW(pll1_d5_491p52),
> +	CCU_PARENT_HW(pll1_d2_1228p8),
> +	CCU_PARENT_HW(pll3_d3),
> +	CCU_PARENT_HW(pll2_d3),
> +	CCU_PARENT_HW(cpu_c1_hi_clk),
> +};
> +CCU_MUX_FC_DEFINE(cpu_c1_core_clk, cpu_c1_clk_parents, APMU_CPU_C1_CLK_CTRL,
> +		  BIT(12), 0, 3, CLK_IS_CRITICAL);
> +CCU_DIV_DEFINE(cpu_c1_ace_clk, CCU_PARENT_HW(cpu_c1_core_clk),
> +	       APMU_CPU_C1_CLK_CTRL, 6, 3, CLK_IS_CRITICAL);
> +
> +static const struct clk_parent_data jpg_parents[] = {
> +	CCU_PARENT_HW(pll1_d4_614p4),
> +	CCU_PARENT_HW(pll1_d6_409p6),
> +	CCU_PARENT_HW(pll1_d5_491p52),
> +	CCU_PARENT_HW(pll1_d3_819p2),
> +	CCU_PARENT_HW(pll1_d2_1228p8),
> +	CCU_PARENT_HW(pll2_d4),
> +	CCU_PARENT_HW(pll2_d3),
> +};
[...]
-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
