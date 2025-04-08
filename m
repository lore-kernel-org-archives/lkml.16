Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4272459CA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141048; cv=none; b=JLu/0fCIjweFjLSlhojkSuIyo5McFFEpi8rjalB7qKycjyvVVgSeg4f+pENvUvGETFJZBcLDA6AIkbOdLTaW/NtQBda6K6FbKBa5H5GSRLb11VT9buOHVvjWF8movD+W+Dv5Sqx+iazKF3CXxKLEcB1Hg+fmT/szLncT2HM9Hvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141048; c=relaxed/simple;
	bh=9OQLO143qU25Xf5rgBvjsjF+i+E3k/fyErzAH0k/A04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxRnTWYzpNLtJnseCDEOeFuqFk9eOtjSJRxEfyn3Ixk16bBIamBD4GrfcRqgn0aHaZV2La3wZtzb3Ppcd/g4/1BQD2SK4x+WPUODI/65nIw+MZwMRo95nWddTwfLdfySXmB21k46q5dgg+xrE9QZs0Gy96BWCAbbx63/49W0ToY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AmT/JBfu; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AmT/JBfu"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d58908c43fso17176915ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141045; x=1744745845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHNrDbhVoJWbm1w+Pkwb4ZPtIRLYeofo87s3C8GCUk8=;
        b=AmT/JBfuHH6Uqr3TncfIHaMn4nTXOiEy4kfRsDZCxpJoqNkTvv6KjgB7nUBCZDJg/g
         nkyyxv7G2/R88q404TgrREYWyrV4k1lnp9v0lA4VmSbVGiNXVt25vrgKf54M7muHMMEc
         pIuXyKluGZxn0pMb1wsYVgLTKlbfzD2U8y8+jS9R/130I39nyB2LbxcyzaHdmwWTKnIj
         MDY5PYHaYmb1FO6lqrHj+Ahdm7acJwSTpUWM14oqUBYAKYYs2jasYtjlEUMDbH69dneb
         cwvTXCvMA1VUEYz75I2ckI10EfCX+4vFRsOc6DizkADPJPNrGX2vhd872UKu6mWnk7ow
         HNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141045; x=1744745845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHNrDbhVoJWbm1w+Pkwb4ZPtIRLYeofo87s3C8GCUk8=;
        b=TgtKE+8wgF5vHGT+wTIAE0xXAoppfnDxTVvAWV0CIWX5n9p8oqnxTV1ltc92rNfYUT
         x4+WzyHq2JsRgyt7FLsZSeQwFnXFieeD2Kzsyh0WSuY+hAEWUnINtWvU5lSwkLJULwGn
         wh8Je+2hT48KDPm3G/nT9+a6cbQwGMJqOcuI4W78SLPOAbubUADZGh9VrPBtijVAshIk
         TAT5oY8myJXGGMT1wdWNDfDBPlyUb/hlsCdf83Fe/XoLStc1DcbtV4zl/cos+THGWnuq
         VgN0UsKr3iIVaxWgxj9ejWEeq8n9MZU1gFWk2utA0COdJRSvg88uQjuqOUlJlzFgB1En
         D64A==
X-Forwarded-Encrypted: i=1; AJvYcCWHxemfzWhM9Z0NP2bAnEiW6/O281r8udw35zqO6NdXiHstCUy/ePsfj9MrjWBMKQ6ATbH7Jc19NIL3wuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGsPrWG+AobjjEgZdBu3qQQSHpCAtrrKxj2Bqk/ppDOxe80gvH
	SU4nfcnayoGOX6wWWjE37NgI/AyNWvLndcVRMpYjmO4VdpkIpCKEi+zQealUbnM=
X-Gm-Gg: ASbGncsNTFVcbUYwolLc9qexeSQL0KcBDVBrAkRXgHeMTiz6zMrUjkyY9zbSlP93EQt
	Mhv1hCMTptvicYsQ3l05Opqxt4AIrYlmLa6YOSe9baZNUZIiPnzJEMZIAjJJ2C2tOT04jCLaMe0
	qFVRcfwQLJ5O9MrKDwQPes1LrYn3gKi/IGHPOpbdN2sB+DhsKrg0h+G97ITHMT7COi60898kUAu
	kcSEVEMCCnmXfloVorlrWoMTT1y/Xkn1P0ELB1IwaD4zv5QE15nVKQ5sWu2jwu043fg80CHXShZ
	oEA9eXoI3+JapAlVztrJ6daKw7d9QqXVAnEq2SF9xRcH+mclqARuDsdIQsokh3DGKWeQ4lK/l1Z
	jGgR7ksP9
X-Google-Smtp-Source: AGHT+IGIyCgDoDBZECicJJ0P5kqYwh5Mij3vRrY2nQZAFTs4Ch8TVtyZReu3zc7eyWiOvbA4exKoig==
X-Received: by 2002:a92:ca0d:0:b0:3d5:891c:13fb with SMTP id e9e14a558f8ab-3d776c82886mr2404265ab.4.1744141044883;
        Tue, 08 Apr 2025 12:37:24 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e3aa0sm653506173.126.2025.04.08.12.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:24 -0700 (PDT)
Message-ID: <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-4-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 12:24 PM, Haylen Chu wrote:
> The clock tree of K1 SoC contains three main types of clock hardware
> (PLL/DDN/MIX) and has control registers split into several multifunction
> devices: APBS (PLLs), MPMU, APBC and APMU.
> 
> All register operations are done through regmap to ensure atomiciy
> between concurrent operations of clock driver and reset,
> power-domain driver that will be introduced in the future.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

I have a few more comments here but I think this is getting very
close to ready.  You addressed pretty much everything I mentioned.

> ---
>   drivers/clk/Kconfig               |    1 +
>   drivers/clk/Makefile              |    1 +
>   drivers/clk/spacemit/Kconfig      |   18 +
>   drivers/clk/spacemit/Makefile     |    5 +
>   drivers/clk/spacemit/apbc_clks    |  100 +++
>   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
>   drivers/clk/spacemit/ccu_common.h |   48 ++
>   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
>   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
>   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
>   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
>   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
>   drivers/clk/spacemit/ccu_pll.h    |   86 ++
>   13 files changed, 2348 insertions(+)
>   create mode 100644 drivers/clk/spacemit/Kconfig
>   create mode 100644 drivers/clk/spacemit/Makefile
>   create mode 100644 drivers/clk/spacemit/apbc_clks
>   create mode 100644 drivers/clk/spacemit/ccu-k1.c
>   create mode 100644 drivers/clk/spacemit/ccu_common.h
>   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>   create mode 100644 drivers/clk/spacemit/ccu_mix.c
>   create mode 100644 drivers/clk/spacemit/ccu_mix.h
>   create mode 100644 drivers/clk/spacemit/ccu_pll.c
>   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 713573b6c86c..19c1ed280fd7 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
>   source "drivers/clk/sifive/Kconfig"
>   source "drivers/clk/socfpga/Kconfig"
>   source "drivers/clk/sophgo/Kconfig"
> +source "drivers/clk/spacemit/Kconfig"
>   source "drivers/clk/sprd/Kconfig"
>   source "drivers/clk/starfive/Kconfig"
>   source "drivers/clk/sunxi/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index bf4bd45adc3a..42867cd37c33 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
>   obj-y					+= socfpga/
>   obj-y					+= sophgo/
> +obj-y					+= spacemit/
>   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>   obj-y					+= sprd/
>   obj-$(CONFIG_ARCH_STI)			+= st/
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

I don't know the answer to this, but...  Should this be a Boolean
rather than tristate?  Can a SpacemiT K1 SoC function without the
clock driver built in to the kernel?

> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select MFD_SYSCON
> +	help
> +	  Say Y to enable clock controller unit support for SpacemiT SoCs.
> +
> +if SPACEMIT_CCU
> +
> +config SPACEMIT_K1_CCU
> +	tristate "Support for SpacemiT K1 SoC"

If you decide SPACEMIT_CCU needs to be Boolean, this one should
be Boolean too.

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

This entire file seems to be an accidental addition.

> @@ -0,0 +1,100 @@
> +		[CLK_UART0]		= &uart0_clk.common.hw,
> +		[CLK_UART2]		= &uart2_clk.common.hw,
> +		[CLK_UART3]		= &uart3_clk.common.hw,
> +		[CLK_UART4]		= &uart4_clk.common.hw,
> +		[CLK_UART5]		= &uart5_clk.common.hw,
> +		[CLK_UART6]		= &uart6_clk.common.hw,

. . .

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

Maybe update your copyright date(s) (here and everywhere).

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

Having these offsets be all defined with 4 hexidecimal digits
helps.  You use 2 or 3 elsewhere, but that's OK, it's at least
consistent within each group.

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

You have added new rates to this PLL table.  But you still
say above that the rate for PLL2 cannot be updated at runtime.
It's slightly confusing.

(By the way, I am pretty sure I've stopped seeing the WARN()
call.  I'm sorry I haven't gotten back to you with more
details on that.  I'll try that when I'm done with this
review.)

> +	CCU_PLL_RATE(2457600000UL, 0x0050dd64, 0x330ccccd),
> +	CCU_PLL_RATE(2800000000UL, 0x0050dd66, 0x3a155555),
> +	CCU_PLL_RATE(3000000000UL, 0x0050dd66, 0x3fe00000),
> +	CCU_PLL_RATE(3200000000UL, 0x0050dd67, 0x43eaaaab),
> +};
> +
> +static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {

You added more rates to this table too.  You should call attention
to things like that, when things have changed between versions of
your patches.  (If you did, I missed it.)

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

I suspect Yixun would like you to have lines like the next one be
84 characters wide--slighly wider than the 80 column limit.

I'm not going to ask you to change it (but he might).

> +CCU_FACTOR_GATE_DEFINE(pll1_d2, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(1), 2,
> +		       1);
> +CCU_FACTOR_GATE_DEFINE(pll1_d3, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(2), 3,
> +		       1);

. . .

I'm no longer looking at the exact details of your clocks.
I'm assuming you've gotten them right--and if we discover
an error at some point it can be fixed.

> +
> +struct spacemit_ccu_data {
> +	struct clk_hw **hws;
> +	size_t num;
> +};

The above structure type ought to be defined nearer to top
of the source file.  (I move it in my reset series, but I
won't have to if you do.)  I make another suggestion about
this type below.

> +
> +static struct clk_hw *k1_ccu_pll_hws[] = {
> +	[CLK_PLL1]		= &pll1.common.hw,
> +	[CLK_PLL2]		= &pll2.common.hw,
> +	[CLK_PLL3]		= &pll3.common.hw,
> +	[CLK_PLL1_D2]		= &pll1_d2.common.hw,
> +	[CLK_PLL1_D3]		= &pll1_d3.common.hw,
> +	[CLK_PLL1_D4]		= &pll1_d4.common.hw,
> +	[CLK_PLL1_D5]		= &pll1_d5.common.hw,
> +	[CLK_PLL1_D6]		= &pll1_d6.common.hw,
> +	[CLK_PLL1_D7]		= &pll1_d7.common.hw,
> +	[CLK_PLL1_D8]		= &pll1_d8.common.hw,
> +	[CLK_PLL1_D11]		= &pll1_d11_223p4.common.hw,
> +	[CLK_PLL1_D13]		= &pll1_d13_189.common.hw,
> +	[CLK_PLL1_D23]		= &pll1_d23_106p8.common.hw,
> +	[CLK_PLL1_D64]		= &pll1_d64_38p4.common.hw,
> +	[CLK_PLL1_D10_AUD]	= &pll1_aud_245p7.common.hw,
> +	[CLK_PLL1_D100_AUD]	= &pll1_aud_24p5.common.hw,
> +	[CLK_PLL2_D1]		= &pll2_d1.common.hw,
> +	[CLK_PLL2_D2]		= &pll2_d2.common.hw,
> +	[CLK_PLL2_D3]		= &pll2_d3.common.hw,
> +	[CLK_PLL2_D4]		= &pll2_d4.common.hw,
> +	[CLK_PLL2_D5]		= &pll2_d5.common.hw,
> +	[CLK_PLL2_D6]		= &pll2_d6.common.hw,
> +	[CLK_PLL2_D7]		= &pll2_d7.common.hw,
> +	[CLK_PLL2_D8]		= &pll2_d8.common.hw,
> +	[CLK_PLL3_D1]		= &pll3_d1.common.hw,
> +	[CLK_PLL3_D2]		= &pll3_d2.common.hw,
> +	[CLK_PLL3_D3]		= &pll3_d3.common.hw,
> +	[CLK_PLL3_D4]		= &pll3_d4.common.hw,
> +	[CLK_PLL3_D5]		= &pll3_d5.common.hw,
> +	[CLK_PLL3_D6]		= &pll3_d6.common.hw,
> +	[CLK_PLL3_D7]		= &pll3_d7.common.hw,
> +	[CLK_PLL3_D8]		= &pll3_d8.common.hw,
> +	[CLK_PLL3_80]		= &pll3_80.common.hw,
> +	[CLK_PLL3_40]		= &pll3_40.common.hw,
> +	[CLK_PLL3_20]		= &pll3_20.common.hw,
> +};
> +
> +static const struct spacemit_ccu_data k1_ccu_pll_data = {
> +	.hws	= k1_ccu_pll_hws,
> +	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
> +};

I'm glad to see you making use of ARRAY_SIZE() now.

> +
> +static struct clk_hw *k1_ccu_mpmu_hws[] = {
> +	[CLK_PLL1_307P2]	= &pll1_d8_307p2.common.hw,
> +	[CLK_PLL1_76P8]		= &pll1_d32_76p8.common.hw,
> +	[CLK_PLL1_61P44]	= &pll1_d40_61p44.common.hw,

. . .

> +static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> +	.hws	= k1_ccu_apmu_hws,
> +	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
> +};
> +
> +static int spacemit_ccu_register(struct device *dev,
> +				 struct regmap *regmap, struct regmap *lock_regmap,

Since you're splitting the arguments across 3 lines, I'd
just put each one on its own line.  (Personal preference.)

> +				 const struct spacemit_ccu_data *data)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	int i, ret;
> +
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->num; i++) {
> +		struct clk_hw *hw = data->hws[i];
> +		struct ccu_common *common;
> +		const char *name;
> +
> +		if (!hw) {
> +			clk_data->hws[i] = ERR_PTR(-ENOENT);
> +			continue;
> +		}
> +
> +		name = hw->init->name;
> +
> +		common = hw_to_ccu_common(hw);
> +		common->regmap		= regmap;
> +		common->lock_regmap	= lock_regmap;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret) {
> +			dev_err(dev, "Cannot register clock %d - %s\n",
> +				i, name);
> +			return ret;
> +		}
> +
> +		clk_data->hws[i] = hw;
> +	}
> +
> +	clk_data->num = data->num;
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
> +
> +	return ret;
> +}
> +
> +static int k1_ccu_probe(struct platform_device *pdev)
> +{
> +	struct regmap *base_regmap, *lock_regmap = NULL;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	base_regmap = device_node_to_regmap(dev->of_node);
> +	if (IS_ERR(base_regmap))
> +		return dev_err_probe(dev, PTR_ERR(base_regmap),
> +				     "failed to get regmap\n");
> +
> +	/*
> +	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
> +	 * are in APBS region. Reference to MPMU syscon is required to check PLL
> +	 * status.
> +	 */

I have two comments on this next section (handling the
lock being in a different area of memory).

First, now that you're defining a spacemit_ccu_data structure
type, you could add a field to that type with an identifier (an
enumerated type, one per CCU).

Then the following test could check that field rather than
the compatible string. This isn't much different in practice,
but it would allow future code to make other decisions based
on the identifier--long after initialization.

Second, why does it matter what region the memory is in (whether
it's MPMU or something else)?  I think it would be better to
specify that as a "lock-region" or maybe "regmap-lock" property.
It's value is a simple phandle, and you're just looking up the
regmap from it.

If you think this is a good idea you'd need to get input and
approval from the DT maintainers.

> +	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> +		struct device_node *mpmu = of_parse_phandle(dev->of_node,
> +							    "spacemit,mpmu", 0);
> +		if (!mpmu)
> +			return dev_err_probe(dev, -ENODEV,
> +					     "Cannot parse MPMU region\n");
> +
> +		lock_regmap = device_node_to_regmap(mpmu);
> +		of_node_put(mpmu);
> +
> +		if (IS_ERR(lock_regmap))
> +			return dev_err_probe(dev, PTR_ERR(lock_regmap),
> +					     "failed to get lock regmap\n");
> +	}
> +
> +	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
> +				    of_device_get_match_data(dev));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register clocks\n");
> +
> +	return 0;
> +}

. . .

> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> new file mode 100644
> index 000000000000..971c489c261a
> --- /dev/null
> +++ b/drivers/clk/spacemit/ccu_pll.c

. . .

> +static int ccu_pll_init(struct clk_hw *hw)
> +{
> +	struct ccu_pll *pll = hw_to_ccu_pll(hw);
> +
> +	if (ccu_pll_lookup_matched_entry(pll))
> +		return 0;
> +
> +	ccu_pll_disable(hw);
> +	ccu_pll_update_param(pll, &pll->config.rate_tbl[0]);
> +

Looks like you now ensure the rate is set to one of those
in the table if it isn't already.  Nice work.

					-Alex

> +	return 0;
> +}
> +
> +const struct clk_ops spacemit_ccu_pll_ops = {
> +	.init		= ccu_pll_init,
> +	.enable		= ccu_pll_enable,
> +	.disable	= ccu_pll_disable,
> +	.set_rate	= ccu_pll_set_rate,
> +	.recalc_rate	= ccu_pll_recalc_rate,
> +	.round_rate	= ccu_pll_round_rate,
> +	.is_enabled	= ccu_pll_is_enabled,
> +};
. . .
