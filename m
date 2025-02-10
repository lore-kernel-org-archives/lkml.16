Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A24C125;
	Mon, 10 Feb 2025 01:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739150453; cv=none; b=cAr73iM8bIuXGY3ypI1zDcri5VgGeoSdzr6fQApu6zKptb0HJx8zFKC+GLrDK2X+QVFq37STQao8LzF8crTqjzXFkaql1P9guNFbVCwhJiuyZfsrOUGQEodtVVmCbPpoS2KXe5RbBqa6MplXFBTxTg435P2JM2ST65+X8kHpzXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739150453; c=relaxed/simple;
	bh=HauamiRseX3S+D21Kz6KhuAZxJpvWIxawOXeyRR6tLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCoiGkgFxKAXLvbM+6vwEx5gkY0ZTjXGy0/GAJWthGhg3FaiM+BZzj3YshCgE/5iKwzUfkUc/sdigBWd+XU+KOqLxkJ6+bphRgQeWNLUjVi14QlNpD1XxY52y4dAH40/oot7DoHHOvzgm2UVhibHtsgdUMIRz8adALXD6SbpQU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 51582343115;
	Mon, 10 Feb 2025 01:20:50 +0000 (UTC)
Date: Mon, 10 Feb 2025 01:20:45 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
Message-ID: <20250210012045-GYA12775@gentoo>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-4-inochiama@gmail.com>
 <BMXPR01MB24406BB0EA039CEBDEEBBDC8FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BMXPR01MB24406BB0EA039CEBDEEBBDC8FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>

Hi Chen:

On 08:55 Mon 10 Feb     , Chen Wang wrote:
> 
> On 2025/2/9 20:29, Inochi Amaoto wrote:
> > Add reset generator node for all CV18XX series SoC.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
> 
> Why it's not include/dt-bindings/reset/sophgo,cv18xx-reset.h?
> 
then first need to answer if it's really a binding, there are some disucssions
I personally favor Inochi's way here

https://lore.kernel.org/linux-devicetree/c7e243e3-3f61-4d63-8727-3837838bdfcc@linaro.org
https://lore.kernel.org/linux-devicetree/c088e01c-0714-82be-8347-6140daf56640@linaro.org/

> Regards,
> 
> Chen
> 
> >   arch/riscv/boot/dts/sophgo/cv18xx.dtsi    |  7 ++
> >   2 files changed, 105 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > new file mode 100644
> > index 000000000000..3d9aa9ec7e90
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#ifndef _SOPHGO_CV18XX_RESET
> > +#define _SOPHGO_CV18XX_RESET
> > +
> > +#define RST_DDR				2
> > +#define RST_H264C			3
> > +#define RST_JPEG			4
> > +#define RST_H265C			5
> > +#define RST_VIPSYS			6
> > +#define RST_TDMA			7
> > +#define RST_TPU				8
> > +#define RST_TPUSYS			9
> > +#define RST_USB				11
> > +#define RST_ETH0			12
> > +#define RST_ETH1			13
> > +#define RST_NAND			14
> > +#define RST_EMMC			15
> > +#define RST_SD0				16
> > +#define RST_SDMA			18
> > +#define RST_I2S0			19
> > +#define RST_I2S1			20
> > +#define RST_I2S2			21
> > +#define RST_I2S3			22
> > +#define RST_UART0			23
> > +#define RST_UART1			24
> > +#define RST_UART2			25
> > +#define RST_UART3			26
> > +#define RST_I2C0			27
> > +#define RST_I2C1			28
> > +#define RST_I2C2			29
> > +#define RST_I2C3			30
> > +#define RST_I2C4			31
> > +#define RST_PWM0			32
> > +#define RST_PWM1			33
> > +#define RST_PWM2			34
> > +#define RST_PWM3			35
> > +#define RST_SPI0			40
> > +#define RST_SPI1			41
> > +#define RST_SPI2			42
> > +#define RST_SPI3			43
> > +#define RST_GPIO0			44
> > +#define RST_GPIO1			45
> > +#define RST_GPIO2			46
> > +#define RST_EFUSE			47
> > +#define RST_WDT				48
> > +#define RST_AHB_ROM			49
> > +#define RST_SPIC			50
> > +#define RST_TEMPSEN			51
> > +#define RST_SARADC			52
> > +#define RST_COMBO_PHY0			58
> > +#define RST_SPI_NAND			61
> > +#define RST_SE				62
> > +#define RST_UART4			74
> > +#define RST_GPIO3			75
> > +#define RST_SYSTEM			76
> > +#define RST_TIMER			77
> > +#define RST_TIMER0			78
> > +#define RST_TIMER1			79
> > +#define RST_TIMER2			80
> > +#define RST_TIMER3			81
> > +#define RST_TIMER4			82
> > +#define RST_TIMER5			83
> > +#define RST_TIMER6			84
> > +#define RST_TIMER7			85
> > +#define RST_WGN0			86
> > +#define RST_WGN1			87
> > +#define RST_WGN2			88
> > +#define RST_KEYSCAN			89
> > +#define RST_AUDDAC			91
> > +#define RST_AUDDAC_APB			92
> > +#define RST_AUDADC			93
> > +#define RST_VCSYS			95
> > +#define RST_ETHPHY			96
> > +#define RST_ETHPHY_APB			97
> > +#define RST_AUDSRC			98
> > +#define RST_VIP_CAM0			99
> > +#define RST_WDT1			100
> > +#define RST_WDT2			101
> > +#define RST_AUTOCLEAR_CPUCORE0		128
> > +#define RST_AUTOCLEAR_CPUCORE1		129
> > +#define RST_AUTOCLEAR_CPUCORE2		130
> > +#define RST_AUTOCLEAR_CPUCORE3		131
> > +#define RST_AUTOCLEAR_CPUSYS0		132
> > +#define RST_AUTOCLEAR_CPUSYS1		133
> > +#define RST_AUTOCLEAR_CPUSYS2		134
> > +#define RST_CPUCORE0			160
> > +#define RST_CPUCORE1			161
> > +#define RST_CPUCORE2			162
> > +#define RST_CPUCORE3			163
> > +#define RST_CPUSYS0			164
> > +#define RST_CPUSYS1			165
> > +#define RST_CPUSYS2			166
> > +
> > +#endif /* _SOPHGO_CV18XX_RESET */
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > index c18822ec849f..9aa28ade73a4 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > @@ -7,6 +7,7 @@
> >   #include <dt-bindings/clock/sophgo,cv1800.h>
> >   #include <dt-bindings/gpio/gpio.h>
> >   #include <dt-bindings/interrupt-controller/irq.h>
> > +#include "cv18xx-reset.h"
> >   
> >   / {
> >   	#address-cells = <1>;
> > @@ -61,6 +62,12 @@ clk: clock-controller@3002000 {
> >   			#clock-cells = <1>;
> >   		};
> >   
> > +		rst: reset-controller@3003000 {
> > +			compatible = "sophgo,cv1800b-reset";
> > +			reg = <0x3003000 0x1000>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> >   		gpio0: gpio@3020000 {
> >   			compatible = "snps,dw-apb-gpio";
> >   			reg = <0x3020000 0x1000>;

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
