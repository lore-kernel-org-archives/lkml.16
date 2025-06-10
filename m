Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D9212EBE7;
	Tue, 10 Jun 2025 02:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749521800; cv=pass; b=rectnu50j02Zb6u6jJwZtx64qxYhhyigF2zt0QJ/XjR53Z49jacRTI71ZH4N0oLY9VW5YlGeWx03dwTK+GCQLgrmHD3m6O59cAdDLJbog85XROzBW6nki4WgmbTRf/+d6k3Acu3VWNaoEEmDxC5uJhiDWacWqIw61KmW+Q7nlTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749521800; c=relaxed/simple;
	bh=gLAFbhEoO4cBBM9tQOKHXFmnTK6AZzYchyLYvzAVBKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkaMSFizGdKgC2ARATxU3Q/kDEyfP3gv8tP/KLuZJswKPcriXHVtolIAMcoAh3j8Tz2qMaIduoEHJmUivJ+cGEFnO9UsAlDiq4GM/lVFfCfpaETPkEDcxNGrcaj+lAmO+NMt4PYjJ1s7UAs3mv2TT2VyrLU93BM8ufEyhqeN/dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=oJ/xji1b; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="oJ/xji1b"
ARC-Seal: i=1; a=rsa-sha256; t=1749521749; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WpRvctyo/jxngsmAbGBiA/2PjYgAWxyNHxkVwCWv1qhOZs9fkcbDUm0esdFfkc0meGbYCBp3qB8Jn1LxroqLdB1f/QjZaa1WpCho+AzVDo5xz3d/0RpuYDYPB4Pn2CmGAJyoFjmHhLgFdSjY5q5VeyZupTsifAh7bs4OfodaroI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749521749; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XCvZr2SedUqbvvr8ZQreuN0CLWKZ7YrA855PyQRbJ90=; 
	b=naGRAdfGU/xoBIpTneLtuu6RPIoxEzjsJygCaT2USZ50AUOtRBUsFk5SsIapWc3j4hvRJflTtt0kw7uUTbDge34406yIC8OESo41etNme/C9zadZLO6AJpEJspTViD2YekXTf6kKE+LK5Kyyp3HVwDn7YbnFt50tvbkW/UgBQvw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749521749;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XCvZr2SedUqbvvr8ZQreuN0CLWKZ7YrA855PyQRbJ90=;
	b=oJ/xji1b0T66baoLpGV7JQrxF77sU/EA6qqgm4q5fEd1MiBGo9e1KFxPafhgEgJg
	FbcUvYqgxA74Kob7uuZ3gohounHwejtNzTeOZ+N+Ktq2wCIPn+F6jc8xWno9d87IvSY
	B/y8zCVTehiMgYS+6h+Pv3uPGdRwVIHMc03UCwOA=
Received: by mx.zohomail.com with SMTPS id 1749521745831216.42443583394527;
	Mon, 9 Jun 2025 19:15:45 -0700 (PDT)
Message-ID: <ff7d26c2-47a4-4c39-84a6-f3e554f4009e@pigmoral.tech>
Date: Tue, 10 Jun 2025 10:15:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
To: Inochi Amaoto <inochiama@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Yixun Lan <dlan@gentoo.org>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Longbin Li <looong.bin@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
 <20250608232214.771855-4-inochiama@gmail.com>
From: Junhui Liu <junhui.liu@pigmoral.tech>
In-Reply-To: <20250608232214.771855-4-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Inochi,

On 2025/6/9 07:22, Inochi Amaoto wrote:
> Add reset generator node for all CV18XX series SoC.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/cv180x.dtsi    |  7 ++
>   arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
>   2 files changed, 105 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index ed06c3609fb2..4c3d16764131 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -7,6 +7,7 @@
>   #include <dt-bindings/clock/sophgo,cv1800.h>
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include "cv18xx-reset.h"
>   
>   / {
>   	#address-cells = <1>;
> @@ -24,6 +25,12 @@ soc {
>   		#size-cells = <1>;
>   		ranges;
>   
> +		rst: reset-controller@3003000 {
> +			compatible = "sophgo,cv1800b-reset";
> +			reg = <0x3003000 0x1000>;
> +			#reset-cells = <1>;
> +		};
> +
>   		gpio0: gpio@3020000 {
>   			compatible = "snps,dw-apb-gpio";
>   			reg = <0x3020000 0x1000>;
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> new file mode 100644
> index 000000000000..b9b6dd56a9e2
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#ifndef _SOPHGO_CV18XX_RESET
> +#define _SOPHGO_CV18XX_RESET
> +
> +#define RST_DDR				2
> +#define RST_H264C			3
> +#define RST_JPEG			4
> +#define RST_H265C			5
> +#define RST_VIPSYS			6
> +#define RST_TDMA			7
> +#define RST_TPU				8
> +#define RST_TPUSYS			9
> +#define RST_USB				11
> +#define RST_ETH0			12
> +#define RST_ETH1			13
> +#define RST_NAND			14
> +#define RST_EMMC			15
> +#define RST_SD0				16
> +#define RST_SDMA			18
> +#define RST_I2S0			19
> +#define RST_I2S1			20
> +#define RST_I2S2			21
> +#define RST_I2S3			22
> +#define RST_UART0			23
> +#define RST_UART1			24
> +#define RST_UART2			25
> +#define RST_UART3			26
> +#define RST_I2C0			27
> +#define RST_I2C1			28
> +#define RST_I2C2			29
> +#define RST_I2C3			30
> +#define RST_I2C4			31
> +#define RST_PWM0			32
> +#define RST_PWM1			33
> +#define RST_PWM2			34
> +#define RST_PWM3			35
> +#define RST_SPI0			40
> +#define RST_SPI1			41
> +#define RST_SPI2			42
> +#define RST_SPI3			43
> +#define RST_GPIO0			44
> +#define RST_GPIO1			45
> +#define RST_GPIO2			46
> +#define RST_EFUSE			47
> +#define RST_WDT				48
> +#define RST_AHB_ROM			49
> +#define RST_SPIC			50
> +#define RST_TEMPSEN			51
> +#define RST_SARADC			52
> +#define RST_COMBO_PHY0			58
> +#define RST_SPI_NAND			61
> +#define RST_SE				62
> +#define RST_UART4			74
> +#define RST_GPIO3			75
> +#define RST_SYSTEM			76
> +#define RST_TIMER			77
> +#define RST_TIMER0			78
> +#define RST_TIMER1			79
> +#define RST_TIMER2			80
> +#define RST_TIMER3			81
> +#define RST_TIMER4			82
> +#define RST_TIMER5			83
> +#define RST_TIMER6			84
> +#define RST_TIMER7			85
> +#define RST_WGN0			86
> +#define RST_WGN1			87
> +#define RST_WGN2			88
> +#define RST_KEYSCAN			89
> +#define RST_AUDDAC			91
> +#define RST_AUDDAC_APB			92
> +#define RST_AUDADC			93
> +#define RST_VCSYS			95
> +#define RST_ETHPHY			96
> +#define RST_ETHPHY_APB			97
> +#define RST_AUDSRC			98
> +#define RST_VIP_CAM0			99
> +#define RST_WDT1			100
> +#define RST_WDT2			101
> +#define RST_AUTOCLEAR_CPUCORE0		256
> +#define RST_AUTOCLEAR_CPUCORE1		257
> +#define RST_AUTOCLEAR_CPUCORE2		258
> +#define RST_AUTOCLEAR_CPUCORE3		259
> +#define RST_AUTOCLEAR_CPUSYS0		260
> +#define RST_AUTOCLEAR_CPUSYS1		261
> +#define RST_AUTOCLEAR_CPUSYS2		262
> +#define RST_CPUCORE0			268


Looks like this and the following still doesn't right. Since it’s bit 0
at offset 0x024, it should be 0x24 * 8 = 0x120 = 288, not 268.

> +#define RST_CPUCORE1			269
> +#define RST_CPUCORE2			270
> +#define RST_CPUCORE3			271
> +#define RST_CPUSYS0			272
> +#define RST_CPUSYS1			273
> +#define RST_CPUSYS2			274
> +
> +#endif /* _SOPHGO_CV18XX_RESET */

-- 
Best regards,
Junhui Liu

