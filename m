Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100D34A07;
	Wed, 23 Apr 2025 05:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745386003; cv=pass; b=G99v6P1P1blo5Dbl9IqTaK1gMRiulvmZvAlshbdR2oA4/OUNyOI7I+xyRN3mTxyxOgZOWD7i2ZRijlX6N5ymTXkouXg+Yoj7PyCmMD2ba0zKsxpTzx7GYUhSkkAioG3eCKop8tA+UHHFMHBv3IIWI+dsVQEc1+w94QGR1Y2Bo4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745386003; c=relaxed/simple;
	bh=+cGzy8p5Hu1QW1PrXpI4A/MLob/NPjQUezEh99E0rGI=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=jKYVaoR0BTbagjSFpBX6ZKwoXsj8oLdneMg7Bq3LtvbiRD2YYOKBVkbIvz67FHs+Ru4dtLaw98fhz81RZo5Pn5xHnHcm53DFXaOKC8TU448Lo4DHZr4tJaRv+1L7UBcXPznNASZWwQVUDTW2m8w4ET41XrcsjhUAb51TWLy23V0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=bt6qR3qb; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="bt6qR3qb"
ARC-Seal: i=1; a=rsa-sha256; t=1745385976; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j4T1Ed4R3k73KdamnHsMmZBsui+ZsxIU0PSccow0xZM0eu7Dy4xb6O7wADSX8FI30nDHGCRV2XxJ1Uhkdp16TSyGLmQ0q/AdrV0cmRIYhnFJ9gRsqTqQE3KLGHfHA1XKUA+QSADPlw2gNdgvdtAugDAtUISlnhKc3QGy67o//G8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745385976; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hGYoMoYLu8GyrYod3MxWMAE0ztSXKwl0WzJYu/+s57g=; 
	b=Vs/uDy9QYkaGMQlMXWZOqEkcJ0QDD4+gjCOan11DXouG0Rix4ZvrjHO2/4D2ARF/ueZ15WTMRoJxXHUemSGoOGYihAyUjkRhXbkTDvvOQnrGwkN04APySYhbqeICTNrofsK4Rc5qIpn3Km5da1bCMRX8omCNVqW1nhfX8L+kOaA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745385976;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hGYoMoYLu8GyrYod3MxWMAE0ztSXKwl0WzJYu/+s57g=;
	b=bt6qR3qbnNiKIZqBr6dQ+D8yb4g0XCObFe6Bk5UnFixxfM5euX9NAMhVvhy5xatR
	NAHF2MvefKOgOyDxFAXbt8Uu22jF42Rk96HVRqxl1n/F4NjH/L3tDu4pL6CI+NjKaFd
	AZazMXncniJsSOx+xRcLYUqLGyTvlUCPY211IEeI=
Received: by mx.zohomail.com with SMTPS id 1745385974137770.0188727737329;
	Tue, 22 Apr 2025 22:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Chen Wang" <unicorn_wang@outlook.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>
In-Reply-To: <MA0P287MB22620E425A4AC72E5C32D325FEBA2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, 
	"Conor Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: add support for canaan,k230-rst
Message-ID: <1838db49cac2e508.c9188a72125bc5d9.d099f51ccc5d9fb5@Jude-Air.local>
Date: Wed, 23 Apr 2025 05:26:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Chen,

Thanks for your review.

On 23/04/2025 10:21, Chen Wang wrote:
> hi=EF=BC=8CJunhui=EF=BC=8C
>=20
> On 2025/4/20 1:09, Junhui Liu wrote:
>> Introduces a reset controller driver for the Kendryte K230 SoC,
>> resposible for managing the reset functionality of the CPUs and
>> various sub-modules.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../devicetree/bindings/reset/canaan,k230-rst.yaml | 39 ++++++++++
>>   include/dt-bindings/reset/canaan,k230-rst.h        | 90 +++++++++++++++=
+++++++
>>   2 files changed, 129 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml=
 b/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d352d0e12d8106a232bb5e6d7=
e138697d2106937
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
>> @@ -0,0 +1,39 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>=20
> The copyright statement in yaml and header files should be consistent.
>=20
> Othres LGTM.
>=20
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
>=20
> Thanks,
>=20
> Chen
>=20
> [......]
>> diff --git a/include/dt-bindings/reset/canaan,k230-rst.h b/include/dt-bin=
dings/reset/canaan,k230-rst.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..53e3fd8177071aef8983c6317=
06d67ac86ab645b
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/canaan,k230-rst.h
>> @@ -0,0 +1,90 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>=20
> Here.
>=20

I will update it to (GPL-2.0-only OR BSD-2-Clause) in next version.

> [....]
>=20
>=20
>> +/*
>> + * Copyright (C) 2023-2024 Canaan Bright Sight Co., Ltd
>> + * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
>> + */
>> +#ifndef _DT_BINDINGS_CANAAN_K230_RST_H_
>> +#define _DT_BINDINGS_CANAAN_K230_RST_H_
>> +
>> +#define RST_CPU0		0
>> +#define RST_CPU1		1
>> +#define RST_CPU0_FLUSH		2
>> +#define RST_CPU1_FLUSH		3
>> +#define RST_AI			4
>> +#define RST_VPU			5
>> +#define RST_HS			6
>> +#define RST_HS_AHB		7
>> +#define RST_SDIO0		8
>> +#define RST_SDIO1		9
>> +#define RST_SDIO_AXI		10
>> +#define RST_USB0		11
>> +#define RST_USB1		12
>> +#define RST_USB0_AHB		13
>> +#define RST_USB1_AHB		14
>> +#define RST_SPI0		15
>> +#define RST_SPI1		16
>> +#define RST_SPI2		17
>> +#define RST_SEC			18
>> +#define RST_PDMA		19
>> +#define RST_SDMA		20
>> +#define RST_DECOMPRESS		21
>> +#define RST_SRAM		22
>> +#define RST_SHRM_AXIM		23
>> +#define RST_SHRM_AXIS		24
>> +#define RST_NONAI2D		25
>> +#define RST_MCTL		26
>> +#define RST_ISP			27
>> +#define RST_ISP_DW		28
>> +#define RST_DPU			29
>> +#define RST_DISP		30
>> +#define RST_GPU			31
>> +#define RST_AUDIO		32
>> +#define RST_TIMER0		33
>> +#define RST_TIMER1		34
>> +#define RST_TIMER2		35
>> +#define RST_TIMER3		36
>> +#define RST_TIMER4		37
>> +#define RST_TIMER5		38
>> +#define RST_TIMER_APB		39
>> +#define RST_HDI			40
>> +#define RST_WDT0		41
>> +#define RST_WDT1		42
>> +#define RST_WDT0_APB		43
>> +#define RST_WDT1_APB		44
>> +#define RST_TS_APB		45
>> +#define RST_MAILBOX		46
>> +#define RST_STC			47
>> +#define RST_PMU			48
>> +#define RST_LS_APB		49
>> +#define RST_UART0		50
>> +#define RST_UART1		51
>> +#define RST_UART2		52
>> +#define RST_UART3		53
>> +#define RST_UART4		54
>> +#define RST_I2C0		55
>> +#define RST_I2C1		56
>> +#define RST_I2C2		57
>> +#define RST_I2C3		58
>> +#define RST_I2C4		59
>> +#define RST_JAMLINK0_APB	60
>> +#define RST_JAMLINK1_APB	61
>> +#define RST_JAMLINK2_APB	62
>> +#define RST_JAMLINK3_APB	63
>> +#define RST_CODEC_APB		64
>> +#define RST_GPIO_DB		65
>> +#define RST_GPIO_APB		66
>> +#define RST_ADC			67
>> +#define RST_ADC_APB		68
>> +#define RST_PWM_APB		69
>> +#define RST_SHRM_APB		70
>> +#define RST_CSI0		71
>> +#define RST_CSI1		72
>> +#define RST_CSI2		73
>> +#define RST_CSI_DPHY		74
>> +#define RST_ISP_AHB		75
>> +#define RST_M0			76
>> +#define RST_M1			77
>> +#define RST_M2			78
>> +#define RST_SPI2AXI		79
>> +
>> +#endif
>>

--=20
Best regards,
Junhui Liu
