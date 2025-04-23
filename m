Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D6C2CCC1;
	Wed, 23 Apr 2025 05:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745386589; cv=pass; b=Yh/At9T/fT+7f0f5s9uCU44+oNqe9L0yJ8/hrk4Stc5XyCz2JuGHy/cPPEsXDIr1Hy2u/SNpS71N07Gp9+5QA4auO0tcF9S6+3b4O6xdMl3k1jLnFhfjhKSLQFUlkBlmRMahG03UcJ6MHa4DhqgjhNmtD+1lQpxPyU6ElGkLsdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745386589; c=relaxed/simple;
	bh=LdS3LUmU4qGNG7NUp2FF5c+FcHbq3trzA2G/gNFTXVA=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=KOnKkjVRVW1uUgbcDAqLMDfsQOR2k/JASkPZ/k1KnyuWh5VBI6Rrzd0uTCwYhaQI1ffu6yi96oWuxisSv9QuQxX/AKX9AJdKKaNTGMn4rRyXIUT5ZsONI8C9IIZ9BOuACRXaXmqIs+WQYvdc0Fwm7nHVsLhJYHc3JIJ7dlEmDZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=OKATLw2c; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="OKATLw2c"
ARC-Seal: i=1; a=rsa-sha256; t=1745386570; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oLMQEbTvzter91y7rik4YXUWAcUzhuxT0DfbOBHaqn2kyQn5sS220L3/aSk4TtzX5R7midvPAxYO2nxaUMM8z4WCc/7fDEpeT82RKmbEbvdJ3GqQno2HGvHzqDMAkO1y+0GRHVj9+5y6dnLHUiDz7rfukUCljRQGaES++RGtFuw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745386570; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xWm9idKxktKuRyOaM251AEIXWCz5M1GMk+daAs2zXwY=; 
	b=jLOCU6mjBCnTVbkBQ3F9tfg8vBTj4YlWpnUOUKCq69S1p2sZKxEjLdMTbokC2pIQuyOrJsFrqn5SbnKWa2nPOwa5ICIx1oGan8m1t1ygNPUHoeYILTEmPmsdp3pwcd2I3LARyQlYhHVN10+4Mz9/irC5b3/VOpyJrPiYWXZaWL8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745386570;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xWm9idKxktKuRyOaM251AEIXWCz5M1GMk+daAs2zXwY=;
	b=OKATLw2cnYHHBKcW5NsCPnxOGyyBvCrwu7nBCWqXfFZ9oz3IbaqfiT8u0bs8dAjG
	2HeThX5KDlWADiZEUwgIB3mTYWcYsHGIUFFdMBBw6MF65jtYt/yePT37sUudDttTHiK
	yfnHXuOrGfZF50+Yx37SamSzZ9zP/s/NyXH9VMQg=
Received: by mx.zohomail.com with SMTPS id 1745386567771409.44652875982854;
	Tue, 22 Apr 2025 22:36:07 -0700 (PDT)
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
In-Reply-To: <MA0P287MB226271093B2CC475E80784DFFEBA2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] reset: canaan: add reset driver for Kendryte K230
Message-ID: <1838dbd48ec5bec8.2608aebcdac475bc.43d59215091781cc@Jude-Air.local>
Date: Wed, 23 Apr 2025 05:36:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Chen,

Thanks for your review.

On 23/04/2025 11:21, Chen Wang wrote:
> Hi, Junhui,
>=20
>=20
> On 2025/4/20 1:09, Junhui Liu wrote:
>> Add support for the resets on Canaan Kendryte K230 SoC. The driver
>> support CPU0, CPU1, L2 cache flush, hardware auto clear and software
>> clear resets.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>>
>> ---
>> The reset management module in the K230 SoC also provides reset time
>> control registers. For RST_TYPE_CPU0, RST_TYPE_CPU1 and RST_TYPE_SW_DONE,
>> the time period when reset is applyed/removed but the clock is stopped
>> can be set up to 15*0.25 =3D 3.75 us. For some RST_TYPE_HW_DONE cases, th=
e
>> time period can be set up to 255*0.25 =3D 63.75 us. For RST_TYPE_FLUSH,
>> the reset bit will automatically cleared by hardware when flush done.
>>
>> Although the current reset driver does not support configuration of
>> reset time registers, delay has been added to the assert, deassert and
>> reset functions to accommodate the longest reset time.
>>
>> Besides, although some reset types have done bits, the reference manual
>> does not explicitly indicate whether the hardware removes reset or the
>> clock stop time period has passed when done bits toggle. Therefore, I
>> think it is a safer way to keep delay for reset types with done bits.
>>
>> link: https://kendryte-download.canaan-creative.com/developer/k230/HDK/K2=
30%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.=
1_20241118.pdf
> Regards these notes, please move it to the beginning of source code, see=
=20
> example: drivers/pwm/pwm-sophgo-sg2042.c
>> ---
>>   drivers/reset/Kconfig      |   9 ++
>>   drivers/reset/Makefile     |   1 +
>>   drivers/reset/reset-k230.c | 355 ++++++++++++++++++++++++++++++++++++++=
+++++++
>>   3 files changed, 365 insertions(+)
>>
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 99f6f9784e6865faddf8621ccfca095778c4dc47..248138ffba3bfbf859c74ba1a=
ed7ba2f72819f7a 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -140,6 +140,15 @@ config RESET_K210
>>   	  Say Y if you want to control reset signals provided by this
>>   	  controller.
>>  =20
>> +config RESET_K230
>> +	tristate "Reset controller driver for Canaan Kendryte K230 SoC"
>> +	depends on ARCH_CANAAN || COMPILE_TEST
>> +	depends on OF
>> +	help
>> +	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
>> +	  Say Y if you want to control reset signals provided by this
>> +	  controller.
>> +
>>   config RESET_LANTIQ
>>   	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>>   	default SOC_TYPE_XWAY
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 31f9904d13f9c3a107fc1ee1ec9f9baba016d101..13fe94531bea1eb91268b1804=
e1321b167815a4b 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -20,6 +20,7 @@ obj-$(CONFIG_RESET_IMX7) +=3D reset-imx7.o
>>   obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) +=3D reset-imx8mp-audiomix.o
>>   obj-$(CONFIG_RESET_INTEL_GW) +=3D reset-intel-gw.o
>>   obj-$(CONFIG_RESET_K210) +=3D reset-k210.o
>> +obj-$(CONFIG_RESET_K230) +=3D reset-k230.o
>>   obj-$(CONFIG_RESET_LANTIQ) +=3D reset-lantiq.o
>>   obj-$(CONFIG_RESET_LPC18XX) +=3D reset-lpc18xx.o
>>   obj-$(CONFIG_RESET_MCHP_SPARX5) +=3D reset-microchip-sparx5.o
>> diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..492d2274893675b0ff1967426=
c8fa9e75aed1791
>> --- /dev/null
>> +++ b/drivers/reset/reset-k230.c
>> @@ -0,0 +1,355 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2016-2017 Linaro Ltd.
> Linaro? Are you sure?

Actually, I kept this from vendor's code.

link: https://github.com/kendryte/k230_sdk/blob/v1.9/src/little/linux/driver=
s/reset/canaan/reset-k230.c#L19

>> + * Copyright (C) 2022-2024 Canaan Bright Sight Co., Ltd
>> + * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/spinlock.h>
>> +
>> +#include <dt-bindings/reset/canaan,k230-rst.h>
>> +
>> +/**
>> + * enum k230_rst_type - K230 reset types
>> + * @RST_TYPE_CPU0: Reset type for CPU0
>> + *	Automatically clears, has write enable and done bit, active high
>> + * @RST_TYPE_CPU1: Reset type for CPU1
>> + *	Manually clears, has write enable and done bit, active high
>> + * @RST_TYPE_FLUSH: Reset type for CPU L2 cache flush
>> + *	Automatically clears, has write enable, no done bit, active high
>> + * @RST_TYPE_HW_DONE: Reset type for hardware auto clear
>> + *	Automatically clears, no write enable, has done bit, active high
>> + * @RST_TYPE_SW_DONE: Reset type for software manual clear
>> + *	Manually clears, no write enable and done bit,
>> + *	active high if ID is RST_SPI2AXI, otherwise active low
>> + */
>> +enum k230_rst_type {
>> +	RST_TYPE_CPU0,
>> +	RST_TYPE_CPU1,
>> +	RST_TYPE_FLUSH,
>> +	RST_TYPE_HW_DONE,
>> +	RST_TYPE_SW_DONE,
>> +};
>> +
>> +struct k230_rst_map {
>> +	u32			offset;
>> +	enum k230_rst_type	type;
>> +	u32			done;
>> +	u32			reset;
>> +};
>> +
>> +struct k230_rst {
>> +	struct reset_controller_dev	rcdev;
>> +	struct device			*dev;
>=20
> Why don't usercdev.dev to store the dev, so we can save a pointer.

Thanks for your reminder, I will store it in rcdev.dev.

>=20
>> +	void __iomem			*base;
>> +	spinlock_t			lock;
>> +};
>=20
> [......]
>=20
> Thanks,
>=20
> Chen

--=20
Best regards,
Junhui Liu
