Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B70D2459ED;
	Tue, 20 May 2025 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749548; cv=none; b=kh+M+ao/2u2EeTU9hSW30Ukk8luAmwSV2eBSpIt1ryzEx7z6xkM+gXzyff4Rb6RyiOF5HvlJ4aDEcRcN9wt3m9tRZrhhrUaO/UAX3vqAbJv4+z+aWMiwRnqVZVurn3ALH09aLxehI1VF8PWICiRnD3a90i7sCa1bzTUXw+s3p1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749548; c=relaxed/simple;
	bh=x6EXxMV05EWbUh+gQkxrPAsz7Y1pn0m1rgMCZ0yq4XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DOz2o84L4pl/uRhupLjEuXRGukmp1u2BO1Wrypcf09P42gXH53/idXh9fr9/wnm/PvOsVYXyJGISL+R8BjFUdxk930WYaTszExv24XsL2CQTmdQDhCaGWk4z6HjejF3lKbRH3IbaQdS1OPgULro2ufsqk1YCQTA8RRgaOQZfWes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=vwex6Nn7; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="vwex6Nn7"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K9UK6A018661;
	Tue, 20 May 2025 15:58:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	O5tPyTmdz7cKHWXi2XbUteSHRS2STpAsWUiRpN3lUF4=; b=vwex6Nn7MCjKpULV
	aeLiif38hXdckOdkXisGraEKPf+AdE/MTtULx7Nf0vAwbso/6YgCQYQ4Y3DloN9G
	rA+fV92aJnmzye2ZWU+e3eUZJJSJ1cofxLvdigmhv2bmcSKPwg19eIrrwszc1W9o
	PTCC++ivRbRbyC30XayAiyhBg7Nm8i0ti1ojBHtLyf58E65soAZUHQYzMwoJl2xz
	+Yl7F+F/sKAzTzhP/qHemObezHKCCtBJUzysRlzOQ4iq/dz5Eji/z9zqlE1ERqJR
	/Fc592ZVBF17p4VXcZFtHFh9uBsO/HaIkbakGGhFCHprSCdHz8bXedTMC1SHkcQC
	hOLghg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfka5gx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 15:58:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0FE0D40047;
	Tue, 20 May 2025 15:57:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B154EB0DF7B;
	Tue, 20 May 2025 15:56:30 +0200 (CEST)
Received: from [10.48.87.146] (10.48.87.146) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 15:56:29 +0200
Message-ID: <79e7ad17-4496-47fe-aec6-d64dcee7dc43@foss.st.com>
Date: Tue, 20 May 2025 15:56:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: stm32: introduce clocks for STM32MP21 platform
To: ALOK TIWARI <alok.a.tiwari@oracle.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nicolas Le Bayon <nicolas.le.bayon@st.com>
References: <20250519142057.260549-1-gabriel.fernandez@foss.st.com>
 <20250519142057.260549-3-gabriel.fernandez@foss.st.com>
 <7bf2d09b-a500-476b-ba92-520eb5e24869@oracle.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <7bf2d09b-a500-476b-ba92-520eb5e24869@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01


On 5/19/25 17:36, ALOK TIWARI wrote:
>
>
> On 19-05-2025 19:50, gabriel.fernandez@foss.st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> This driver is intended for the STM32MP21 clock family.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@st.com>
>> ---
>>   drivers/clk/stm32/Kconfig         |    7 +
>>   drivers/clk/stm32/Makefile        |    1 +
>>   drivers/clk/stm32/clk-stm32mp21.c | 1583 +++++++++++++++++++++++++++++
>>   drivers/clk/stm32/stm32mp21_rcc.h |  651 ++++++++++++
>>   4 files changed, 2242 insertions(+)
>>   create mode 100644 drivers/clk/stm32/clk-stm32mp21.c
>>   create mode 100644 drivers/clk/stm32/stm32mp21_rcc.h
>>
>> diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
>> index dca409d52652..12396f1c5cec 100644
>> --- a/drivers/clk/stm32/Kconfig
>> +++ b/drivers/clk/stm32/Kconfig
>> @@ -25,6 +25,13 @@ config COMMON_CLK_STM32MP157
>>       help
>>         Support for stm32mp15x SoC family clocks.
>>   +config COMMON_CLK_STM32MP215
>> +    bool "Clock driver for stm32m21x clocks"
>
> should not be stm32mp21x?
yes
>
>> +    depends on ARM || ARM64 || COMPILE_TEST
>> +    default y
>> +    help
>> +      Support for stm32mp21x SoC family clocks
>> +
>>   config COMMON_CLK_STM32MP257
>>       bool "Clock driver for stm32mp25x clocks"
>>       depends on ARM64 || COMPILE_TEST
>> diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
>> index 0a627164fcce..e04727b59449 100644
>> --- a/drivers/clk/stm32/Makefile
>> +++ b/drivers/clk/stm32/Makefile
>> @@ -1,3 +1,4 @@
>>   obj-$(CONFIG_COMMON_CLK_STM32MP135)    += clk-stm32mp13.o 
>> clk-stm32-core.o reset-stm32.o
>>   obj-$(CONFIG_COMMON_CLK_STM32MP157)    += clk-stm32mp1.o reset-stm32.o
>> +obj-$(CONFIG_COMMON_CLK_STM32MP215)    += clk-stm32mp21.o 
>> clk-stm32-core.o reset-stm32.o
>>   obj-$(CONFIG_COMMON_CLK_STM32MP257)    += clk-stm32mp25.o 
>> clk-stm32-core.o reset-stm32.o
>> diff --git a/drivers/clk/stm32/clk-stm32mp21.c 
>> b/drivers/clk/stm32/clk-stm32mp21.c
>> new file mode 100644
> [clip]
>> +#define RCC_R30SEMCR                0x124
>> +#define RCC_R31CIDCFGR                0x128
>> +#define RCC_R31SEMCR                0x12C
>> +#define RCC_R32CIDCFGR                0x130
>> +#define RCC_R32SEMCR                0x134
>> +#define RCC_R33CIDCFGR                0x138
>> +#define RCC_R33SEMCR                0x13C
>> +#define RCC_R34CIDCFGR                0x140
>> +#define RCC_R34SEMCR                0x144
>> +#define RCC_R35CIDCFGR                0x148
>> +#define RCC_R35SEMCR                0x14C
>> +#define RCC_R36CIDCFGR                0x150
>> +#define RCC_R36SEMCR                0x154
>> +#define RCC_R37CIDCFGR                0x158
>> +#define RCC_R37SEMCR                0x15C
>> +#define RCC_R38CIDCFGR                0x160
>> +#define RCC_R38SEMCR                0x164
>> +#define RCC_R39CIDCFGR                0x168
>> +#define RCC_R39SEMCR                0x16C
>> +#define RCC_R40CIDCFGR                0x170
>> +#define RCC_R40SEMCR                0x174
>> +#define RCC_R41CIDCFGR                0x178
>> +#define RCC_R41SEMCR                0x17C
>> +#define RCC_R42CIDCFGR                0x180
>> +#define RCC_R42SEMCR                0x184
>> +#define RCC_R43CIDCFGR                0x188
>> +#define RCC_R43SEMCR                0x18C
>> +#define RCC_R44CIDCFGR                0x190
>> +#define RCC_R44SEMCR                0x194
>> +#define RCC_R45CIDCFGR                0x198
>> +#define RCC_R45SEMCR                0x19C
>> +#define RCC_R46CIDCFGR                0x1A0
>> +#define RCC_R46SEMCR                0x1A4
>> +#define RCC_R47CIDCFGR                0x1A8
>> +#define RCC_R47SEMCR                0x1AC
>> +#define RCC_R48CIDCFGR                0x1B0
>> +#define RCC_R48SEMCR                0x1B4
>> +#define RCC_R49CIDCFGR                0x1B8
>> +#define RCC_R49SEMCR                0x1BC
>> +#define RCC_R50CIDCFGR                0x1C0
>> +#define RCC_R50SEMCR                0x1C4
>> +#define RCC_R51CIDCFGR                0x1C8
>> +#define RCC_R51SEMCR                0x1CC
>> +#define RCC_R52CIDCFGR                0x1D0
>> +#define RCC_R52SEMCR                0x1D4
>> +#define RCC_R53CIDCFGR                0x1D8
>> +#define RCC_R53SEMCR                0x1DC
>> +#define RCC_R54CIDCFGR                0x1E0
>> +#define RCC_R54SEMCR                0x1E4
>> +#define RCC_R55CIDCFGR                0x1E8
>> +#define RCC_R55SEMCR                0x1EC
>> +#define RCC_R56CIDCFGR                0x1F0
>> +#define RCC_R56SEMCR                0x1F4
>> +#define RCC_R57CIDCFGR                0x1F8
>> +#define RCC_R57SEMCR                0x1FC
>> +#define RCC_R58CIDCFGR                0x200
>> +#define RCC_R58SEMCR                0x204
>> +#define RCC_R59CIDCFGR                0x208
>> +#define RCC_R59SEMCR                0x20C
>> +#define RCC_R60CIDCFGR                0x210
>> +#define RCC_R60SEMCR                0x214
>> +#define RCC_R61CIDCFGR                0x218
>> +#define RCC_R61SEMCR                0x21C
>> +#define RCC_R62CIDCFGR                0x220
>> +#define RCC_R62SEMCR                0x224
>> +#define RCC_R63CIDCFGR                0x228
>> +#define RCC_R63SEMCR                0x22C
>> +#define RCC_R64CIDCFGR                0x230
>> +#define RCC_R64SEMCR                0x234
>> +#define RCC_R65CIDCFGR                0x238
>> +#define RCC_R65SEMCR                0x23C
>> +#define RCC_R66CIDCFGR                0x240
>> +#define RCC_R66SEMCR                0x244
>> +#define RCC_R67CIDCFGR                0x248
>> +#define RCC_R67SEMCR                0x24C
>> +#define RCC_R68CIDCFGR                0x250
>> +#define RCC_R68SEMCR                0x254
>> +#define RCC_R69CIDCFGR                0x258
>> +#define RCC_R69SEMCR                0x25C
>> +#define RCC_R70CIDCFGR                0x260
>> +#define RCC_R70SEMCR                0x264
>> +#define RCC_R71CIDCFGR                0x268
>> +#define RCC_R71SEMCR                0x26C
>
> 0x270 and 0x274 , not here
> is this typo or intentional ?
>
These registers are reserved.


Thanks for review

Gabriel


>> +#define RCC_R73CIDCFGR 0x278
>> +#define RCC_R73SEMCR                0x27C
>> +#define RCC_R74CIDCFGR                0x280
>> +#define RCC_R74SEMCR                0x284
>> +#define RCC_R75CIDCFGR                0x288
>> +#define RCC_R75SEMCR                0x28C
>> +#define RCC_R76CIDCFGR                0x290
>> +#define RCC_R76SEMCR                0x294
>> +#define RCC_R77CIDCFGR                0x298
>> +#define RCC_R77SEMCR                0x29C
>> +#define RCC_R78CIDCFGR                0x2A0
>> +#define RCC_R78SEMCR                0x2A4
>> +#define RCC_R79CIDCFGR                0x2A8
>> +#define RCC_R79SEMCR                0x2AC
>> +#define RCC_R83CIDCFGR                0x2C8
>
> Thanks,
> Alok
