Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF225A2D9;
	Wed, 21 May 2025 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821851; cv=none; b=kXfBFdPDYo6Ky0KhgnEDJHi/6rGr9Z5Nwod4Gswry8NqSyhzPTW2YaHNd2quROAoExhI6WTrwkzJHPGhgjsMEVzOvoJ2PKFuVM8O+HC+tzgUye5bTtklWOUuypTGLcqrspGCpjAfH5qpQvrspo4VxIvUw++JAGM3Hou5xWy0lv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821851; c=relaxed/simple;
	bh=DDPQ6xMjXVNCYLSdtxwFtdmzYrsNlGhHAmJH7f6lOj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L3UHYA64glmdY8uSEJlSD4KchQEGrE0mjTvHTpZvRGa5YJIV0OaxiXt1qdtFAE/X5UcDDNpWO68eWE5Mfu0wt19PexlMjJjkxHDPnqX5irm0+qwnHTJtjYh7ZHSnaZTuhJ9KSQoPFxG5NFuikdMhm4Z0byTkUv1Y8FeQazjmA78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gef/ZtTS; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gef/ZtTS"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5xrV2024192;
	Wed, 21 May 2025 12:03:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	gEaA0Gg9aaxxaIve8QDoMO2FeevIuc/d88ltyzu1YFg=; b=gef/ZtTSo/+741yi
	CSbLQOPzd1xnuYG2334D/PIPbESZKbVd8Z3EK7lofkcYcxNsAwP19AMPmEjwzxko
	d/dyUpcu23sOnj6vD3co1o8OoyQw9kRMz3YVlsq2Jabyd0S8nphwG+lvjxA6b/JG
	oQtEkk66cDhTbuPjpeL8Fx5RNCRXGO7gD3D5suAV6f6lO5o4Kzl1vAMUp3qY9s87
	giufwIke+lIvi11Lu+yJ/lyz/A5CPS486GHe+qshisqOUijRBPDmD8iouJoskjcS
	+fwLyI0LLUcl7yEzxMVxBVYVsEqd+z8wvB8Yzui0Fb+/96e267g9g7R4j/BeRajd
	Yar3lA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfabduu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 12:03:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D9EF740049;
	Wed, 21 May 2025 12:02:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06BC9B5BA71;
	Wed, 21 May 2025 12:01:39 +0200 (CEST)
Received: from [10.252.1.130] (10.252.1.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 12:01:36 +0200
Message-ID: <6d3b47da-00c8-43da-8b31-fc950d5c9c49@foss.st.com>
Date: Wed, 21 May 2025 12:01:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: stm32: introduce clocks for STM32MP21
 platform
To: ALOK TIWARI <alok.a.tiwari@oracle.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
References: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
 <20250520-upstream_rcc_mp21-v2-2-3c776a6e5862@foss.st.com>
 <1dd1f372-3a4c-4763-8c3b-d77ac1b36660@oracle.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <1dd1f372-3a4c-4763-8c3b-d77ac1b36660@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01


On 5/21/25 11:33, ALOK TIWARI wrote:
>
>
> On 20-05-2025 20:58, Gabriel Fernandez wrote:
>> This driver is intended for the STM32MP21 clock family.
>>
>> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> [snip]
>> +
>> +enum enum_mux_cfg {
>> +    MUX_ADC1,
>> +    MUX_ADC2,
>> +    MUX_DTS,
>> +    MUX_MCO1,
>> +    MUX_MCO2,
>> +    MUX_USB2PHY1,
>> +    MUX_USB2PHY2,
>> +    MUX_NB
>> +};
>> +
>> +#define MUX_CFG(id, _offset, _shift, _witdh)    \
>> +    [id] = {                \
>> +        .offset        = (_offset),    \
>> +        .shift        = (_shift),    \
>> +        .width        = (_witdh),    \
>> +    }
>
> typo _witdh -> _width

ok


>
>> +
>> +static const struct stm32_mux_cfg stm32mp21_muxes[MUX_NB] = {
>> +    MUX_CFG(MUX_ADC1,        RCC_ADC1CFGR,        12,    1),
>> +    MUX_CFG(MUX_ADC2,        RCC_ADC2CFGR,        12,    2),
>> +    MUX_CFG(MUX_DTS,        RCC_DTSCFGR,        12,    2),
>> +    MUX_CFG(MUX_MCO1,        RCC_MCO1CFGR,        0,    1),
>> +    MUX_CFG(MUX_MCO2,        RCC_MCO2CFGR,        0,    1),
>> +    MUX_CFG(MUX_USB2PHY1,        RCC_USB2PHY1CFGR,    15, 1),
>> +    MUX_CFG(MUX_USB2PHY2,        RCC_USB2PHY2CFGR,    15, 1),
>> +};
>> +
>> +enum enum_gate_cfg {
>> +    GATE_ADC1,
>> +    GATE_ADC2,
>> +    GATE_CRC,
>> +    GATE_CRYP1,
>> +    GATE_CRYP2,
>> +    GATE_CSI,
>> +    GATE_DCMIPP,
>> +    GATE_DCMIPSSI,
>> +    GATE_DDRPERFM,
>> +    GATE_DTS,
>> +    GATE_ETH1,
>> +    GATE_ETH1MAC,
>> +    GATE_ETH1RX,
>> +    GATE_ETH1STP,
>> +    GATE_ETH1TX,
>> +    GATE_ETH2,
>> +    GATE_ETH2MAC,
>> +    GATE_ETH2RX,
>> +    GATE_ETH2STP,
>> +    GATE_ETH2TX,
>> +    GATE_FDCAN,
>> +    GATE_HASH1,
>> +    GATE_HASH2,
>> +    GATE_HDP,
>> +    GATE_I2C1,
>> +    GATE_I2C2,
>> +    GATE_I2C3,
>> +    GATE_I3C1,
>> +    GATE_I3C2,
>> +    GATE_I3C3,
>> +    GATE_IWDG1,
>> +    GATE_IWDG2,
>> +    GATE_IWDG3,
>> +    GATE_IWDG4,
>> +    GATE_LPTIM1,
>> +    GATE_LPTIM2,
>> +    GATE_LPTIM3,
>> +    GATE_LPTIM4,
>> +    GATE_LPTIM5,
>> +    GATE_LPUART1,
>> +    GATE_LTDC,
>> +    GATE_MCO1,
>> +    GATE_MCO2,
>> +    GATE_MDF1,
>> +    GATE_OTG,
>> +    GATE_PKA,
>> +    GATE_RNG1,
>> +    GATE_RNG2,
>> +    GATE_SAES,
>> +    GATE_SAI1,
>> +    GATE_SAI2,
>> +    GATE_SAI3,
>> +    GATE_SAI4,
>> +    GATE_SDMMC1,
>> +    GATE_SDMMC2,
>> +    GATE_SDMMC3,
>> +    GATE_SERC,
>> +    GATE_SPDIFRX,
>> +    GATE_SPI1,
>> +    GATE_SPI2,
>> +    GATE_SPI3,
>> +    GATE_SPI4,
>> +    GATE_SPI5,
>> +    GATE_SPI6,
>> +    GATE_TIM1,
>> +    GATE_TIM10,
>> +    GATE_TIM11,
>> +    GATE_TIM12,
>> +    GATE_TIM13,
>> +    GATE_TIM14,
>> +    GATE_TIM15,
>> +    GATE_TIM16,
>> +    GATE_TIM17,
>> +    GATE_TIM2,
>> +    GATE_TIM3,
>> +    GATE_TIM4,
>> +    GATE_TIM5,
>> +    GATE_TIM6,
>> +    GATE_TIM7,
>> +    GATE_TIM8,
>> +    GATE_UART4,
>> +    GATE_UART5,
>> +    GATE_UART7,
>> +    GATE_USART1,
>> +    GATE_USART2,
>> +    GATE_USART3,
>> +    GATE_USART6,
>> +    GATE_USB2PHY1,
>> +    GATE_USB2PHY2,
>> +    GATE_USBH,
>> +    GATE_VREF,
>> +    GATE_WWDG1,
>> +    GATE_NB
>> +};
>> +
>> +#define GATE_CFG(id, _offset, _bit_idx, _offset_clr)    \
>> +    [id] = {                    \
>> +        .offset        = (_offset),        \
>> +        .bit_idx    = (_bit_idx),        \
>> +        .set_clr    = (_offset_clr),    \
>> +    }
>> +
>> +static const struct stm32_gate_cfg stm32mp21_gates[GATE_NB] = {
>> +    GATE_CFG(GATE_ADC1,        RCC_ADC1CFGR,        1,    0),
>> +    GATE_CFG(GATE_ADC2,        RCC_ADC2CFGR,        1,    0),
>> +    GATE_CFG(GATE_CRC,        RCC_CRCCFGR,        1,    0),
>> +    GATE_CFG(GATE_CRYP1,        RCC_CRYP1CFGR,        1,    0),
>> +    GATE_CFG(GATE_CRYP2,        RCC_CRYP2CFGR,        1,    0),
>> +    GATE_CFG(GATE_CSI,        RCC_CSICFGR,        1,    0),
>> +    GATE_CFG(GATE_DCMIPP,        RCC_DCMIPPCFGR,        1, 0),
>> +    GATE_CFG(GATE_DCMIPSSI,        RCC_DCMIPSSICFGR,    1, 0),
>> +    GATE_CFG(GATE_DDRPERFM,        RCC_DDRPERFMCFGR,    1, 0),
>> +    GATE_CFG(GATE_DTS,        RCC_DTSCFGR,        1,    0),
>> +    GATE_CFG(GATE_ETH1,        RCC_ETH1CFGR,        5,    0),
>> +    GATE_CFG(GATE_ETH1MAC,        RCC_ETH1CFGR,        1, 0),
>> +    GATE_CFG(GATE_ETH1RX,        RCC_ETH1CFGR,        10, 0),
>> +    GATE_CFG(GATE_ETH1STP,        RCC_ETH1CFGR,        4, 0),
>> +    GATE_CFG(GATE_ETH1TX,        RCC_ETH1CFGR,        8,    0),
>> +    GATE_CFG(GATE_ETH2,        RCC_ETH2CFGR,        5,    0),
>> +    GATE_CFG(GATE_ETH2MAC,        RCC_ETH2CFGR,        1, 0),
>> +    GATE_CFG(GATE_ETH2RX,        RCC_ETH2CFGR,        10, 0),
>> +    GATE_CFG(GATE_ETH2STP,        RCC_ETH2CFGR,        4, 0),
>> +    GATE_CFG(GATE_ETH2TX,        RCC_ETH2CFGR,        8,    0),
>> +    GATE_CFG(GATE_FDCAN,        RCC_FDCANCFGR,        1,    0),
>> +    GATE_CFG(GATE_HASH1,        RCC_HASH1CFGR,        1,    0),
>> +    GATE_CFG(GATE_HASH2,        RCC_HASH2CFGR,        1,    0),
>> +    GATE_CFG(GATE_HDP,        RCC_HDPCFGR,        1,    0),
>> +    GATE_CFG(GATE_I2C1,        RCC_I2C1CFGR,        1,    0),
>> +    GATE_CFG(GATE_I2C2,        RCC_I2C2CFGR,        1,    0),
>> +    GATE_CFG(GATE_I2C3,        RCC_I2C3CFGR,        1,    0),
>> +    GATE_CFG(GATE_I3C1,        RCC_I3C1CFGR,        1,    0),
>> +    GATE_CFG(GATE_I3C2,        RCC_I3C2CFGR,        1,    0),
>> +    GATE_CFG(GATE_I3C3,        RCC_I3C3CFGR,        1,    0),
>> +    GATE_CFG(GATE_IWDG1,        RCC_IWDG1CFGR,        1,    0),
>> +    GATE_CFG(GATE_IWDG2,        RCC_IWDG2CFGR,        1,    0),
>> +    GATE_CFG(GATE_IWDG3,        RCC_IWDG3CFGR,        1,    0),
>> +    GATE_CFG(GATE_IWDG4,        RCC_IWDG4CFGR,        1,    0),
>> +    GATE_CFG(GATE_LPTIM1,        RCC_LPTIM1CFGR,        1, 0),
>> +    GATE_CFG(GATE_LPTIM2,        RCC_LPTIM2CFGR,        1, 0),
>> +    GATE_CFG(GATE_LPTIM3,        RCC_LPTIM3CFGR,        1, 0),
>> +    GATE_CFG(GATE_LPTIM4,        RCC_LPTIM4CFGR,        1, 0),
>> +    GATE_CFG(GATE_LPTIM5,        RCC_LPTIM5CFGR,        1, 0),
>> +    GATE_CFG(GATE_LPUART1,        RCC_LPUART1CFGR,    1,    0),
>> +    GATE_CFG(GATE_LTDC,        RCC_LTDCCFGR,        1,    0),
>> +    GATE_CFG(GATE_MCO1,        RCC_MCO1CFGR,        8,    0),
>> +    GATE_CFG(GATE_MCO2,        RCC_MCO2CFGR,        8,    0),
>> +    GATE_CFG(GATE_MDF1,        RCC_MDF1CFGR,        1,    0),
>> +    GATE_CFG(GATE_OTG,        RCC_OTGCFGR,        1,    0),
>> +    GATE_CFG(GATE_PKA,        RCC_PKACFGR,        1,    0),
>> +    GATE_CFG(GATE_RNG1,        RCC_RNG1CFGR,        1,    0),
>> +    GATE_CFG(GATE_RNG2,        RCC_RNG2CFGR,        1,    0),
>> +    GATE_CFG(GATE_SAES,        RCC_SAESCFGR,        1,    0),
>> +    GATE_CFG(GATE_SAI1,        RCC_SAI1CFGR,        1,    0),
>> +    GATE_CFG(GATE_SAI2,        RCC_SAI2CFGR,        1,    0),
>> +    GATE_CFG(GATE_SAI3,        RCC_SAI3CFGR,        1,    0),
>> +    GATE_CFG(GATE_SAI4,        RCC_SAI4CFGR,        1,    0),
>> +    GATE_CFG(GATE_SDMMC1,        RCC_SDMMC1CFGR,        1, 0),
>> +    GATE_CFG(GATE_SDMMC2,        RCC_SDMMC2CFGR,        1, 0),
>> +    GATE_CFG(GATE_SDMMC3,        RCC_SDMMC3CFGR,        1, 0),
>> +    GATE_CFG(GATE_SERC,        RCC_SERCCFGR,        1,    0),
>> +    GATE_CFG(GATE_SPDIFRX,        RCC_SPDIFRXCFGR,    1,    0),
>> +    GATE_CFG(GATE_SPI1,        RCC_SPI1CFGR,        1,    0),
>> +    GATE_CFG(GATE_SPI2,        RCC_SPI2CFGR,        1,    0),
>> +    GATE_CFG(GATE_SPI3,        RCC_SPI3CFGR,        1,    0),
>> +    GATE_CFG(GATE_SPI4,        RCC_SPI4CFGR,        1,    0),
>> +    GATE_CFG(GATE_SPI5,        RCC_SPI5CFGR,        1,    0),
>> +    GATE_CFG(GATE_SPI6,        RCC_SPI6CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM1,        RCC_TIM1CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM10,        RCC_TIM10CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM11,        RCC_TIM11CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM12,        RCC_TIM12CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM13,        RCC_TIM13CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM14,        RCC_TIM14CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM15,        RCC_TIM15CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM16,        RCC_TIM16CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM17,        RCC_TIM17CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM2,        RCC_TIM2CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM3,        RCC_TIM3CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM4,        RCC_TIM4CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM5,        RCC_TIM5CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM6,        RCC_TIM6CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM7,        RCC_TIM7CFGR,        1,    0),
>> +    GATE_CFG(GATE_TIM8,        RCC_TIM8CFGR,        1,    0),
>> +    GATE_CFG(GATE_UART4,        RCC_UART4CFGR,        1,    0),
>> +    GATE_CFG(GATE_UART5,        RCC_UART5CFGR,        1,    0),
>> +    GATE_CFG(GATE_UART7,        RCC_UART7CFGR,        1,    0),
>> +    GATE_CFG(GATE_USART1,        RCC_USART1CFGR,        1, 0),
>> +    GATE_CFG(GATE_USART2,        RCC_USART2CFGR,        1, 0),
>> +    GATE_CFG(GATE_USART3,        RCC_USART3CFGR,        1, 0),
>> +    GATE_CFG(GATE_USART6,        RCC_USART6CFGR,        1, 0),
>> +    GATE_CFG(GATE_USB2PHY1,        RCC_USB2PHY1CFGR,    1, 0),
>> +    GATE_CFG(GATE_USB2PHY2,        RCC_USB2PHY2CFGR,    1, 0),
>> +    GATE_CFG(GATE_USBH,        RCC_USBHCFGR,        1,    0),
>> +    GATE_CFG(GATE_VREF,        RCC_VREFCFGR,        1,    0),
>> +    GATE_CFG(GATE_WWDG1,        RCC_WWDG1CFGR,        1,    0),
>> +};
>> +
>> +#define CLK_HW_INIT_INDEX(_name, _parent, _ops, _flags) \
>> +    (&(struct clk_init_data) {                    \
>> +        .flags        = _flags,                \
>> +        .name        = _name,                \
>> +        .parent_data    = (const struct clk_parent_data[]) { \
>> +                    { .index = _parent },        \
>> +                  },                    \
>> +        .num_parents    = 1,                    \
>> +        .ops        = _ops,                    \
>> +    })
>> +
>> +/* ADC */
>> +static struct clk_stm32_gate ck_icn_p_adc1 = {
>> +    .gate_id = GATE_ADC1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_adc1", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_composite ck_ker_adc1 = {
>> +    .gate_id = GATE_ADC1,
>> +    .mux_id = MUX_ADC1,
>> +    .div_id = NO_STM32_DIV,
>> +    .hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_adc1", adc1_src, 
>> &clk_stm32_composite_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_adc2 = {
>> +    .gate_id = GATE_ADC2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_adc2", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_composite ck_ker_adc2 = {
>> +    .gate_id = GATE_ADC2,
>> +    .mux_id = MUX_ADC2,
>> +    .div_id = NO_STM32_DIV,
>> +    .hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_adc2", adc2_src, 
>> &clk_stm32_composite_ops, 0),
>> +};
>> +
>> +/* CSI-HOST */
>> +static struct clk_stm32_gate ck_icn_p_csi = {
>> +    .gate_id = GATE_CSI,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_csi", ICN_APB4, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_csi = {
>> +    .gate_id = GATE_CSI,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_csi", FLEXGEN_29, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_csitxesc = {
>> +    .gate_id = GATE_CSI,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_csitxesc", FLEXGEN_30, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* CSI-PHY */
>> +static struct clk_stm32_gate ck_ker_csiphy = {
>> +    .gate_id = GATE_CSI,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_csiphy", FLEXGEN_31, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* DCMIPP */
>> +static struct clk_stm32_gate ck_icn_p_dcmipp = {
>> +    .gate_id = GATE_DCMIPP,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_dcmipp", ICN_APB4, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_dcmipssi = {
>> +    .gate_id = GATE_DCMIPSSI,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_dcmipssi", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* DDRPERMF */
>> +static struct clk_stm32_gate ck_icn_p_ddrperfm = {
>> +    .gate_id = GATE_DDRPERFM,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_ddrperfm", ICN_APB4, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* CRC */
>> +static struct clk_stm32_gate ck_icn_p_crc = {
>> +    .gate_id = GATE_CRC,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_crc", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* CRYP */
>> +static struct clk_stm32_gate ck_icn_p_cryp1 = {
>> +    .gate_id = GATE_CRYP1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_cryp1", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_cryp2 = {
>> +    .gate_id = GATE_CRYP2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_cryp2", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* DBG & TRACE*/
>
> ' ' after */
>
ok


>> +/* Trace and debug clocks are managed by SCMI */
>> +
>> +/* LTDC */
>> +static struct clk_stm32_gate ck_icn_p_ltdc = {
>> +    .gate_id = GATE_LTDC,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_ltdc", ICN_APB4, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_ltdc = {
>> +    .gate_id = GATE_LTDC,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_ltdc", FLEXGEN_27, 
>> &clk_stm32_gate_ops,
>> +                       CLK_SET_RATE_PARENT),
>> +};
>> +
>> +/* DTS */
>> +static struct clk_stm32_composite ck_ker_dts = {
>> +    .gate_id = GATE_DTS,
>> +    .mux_id = MUX_DTS,
>> +    .div_id = NO_STM32_DIV,
>> +    .hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_dts", dts_src,
>> +                        &clk_stm32_composite_ops, 0),
>> +};
>> +
>> +/* ETHERNET */
>> +static struct clk_stm32_gate ck_icn_p_eth1 = {
>> +    .gate_id = GATE_ETH1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_eth1", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth1stp = {
>> +    .gate_id = GATE_ETH1STP,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1stp", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth1 = {
>> +    .gate_id = GATE_ETH1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1", FLEXGEN_54, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth1ptp = {
>> +    .gate_id = GATE_ETH1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1ptp", FLEXGEN_56, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth1mac = {
>> +    .gate_id = GATE_ETH1MAC,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1mac", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth1tx = {
>> +    .gate_id = GATE_ETH1TX,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1tx", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth1rx = {
>> +    .gate_id = GATE_ETH1RX,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1rx", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_eth2 = {
>> +    .gate_id = GATE_ETH2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_eth2", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth2stp = {
>> +    .gate_id = GATE_ETH2STP,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2stp", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth2 = {
>> +    .gate_id = GATE_ETH2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2", FLEXGEN_55, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth2ptp = {
>> +    .gate_id = GATE_ETH2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2ptp", FLEXGEN_56, 
>> &clk_stm32_gate_ops, 0),
>> +};
>
> ck_ker_eth2ptp and ck_ker_eth1ptp both use FLEXGEN_56, is this ok?

Yes, it's okay. Some Flexgens can gate several peripherals.



>
>> +
>> +static struct clk_stm32_gate ck_ker_eth2mac = {
>> +    .gate_id = GATE_ETH2MAC,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2mac", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth2tx = {
>> +    .gate_id = GATE_ETH2TX,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2tx", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_eth2rx = {
>> +    .gate_id = GATE_ETH2RX,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2rx", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* FDCAN */
>> +static struct clk_stm32_gate ck_icn_p_fdcan = {
>> +    .gate_id = GATE_FDCAN,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_fdcan", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_fdcan = {
>> +    .gate_id = GATE_FDCAN,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_fdcan", FLEXGEN_26, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* HASH */
>> +static struct clk_stm32_gate ck_icn_p_hash1 = {
>> +    .gate_id = GATE_HASH1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_hash1", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_hash2 = {
>> +    .gate_id = GATE_HASH2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_hash2", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* HDP */
>> +static struct clk_stm32_gate ck_icn_p_hdp = {
>> +    .gate_id = GATE_HDP,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_hdp", ICN_APB3, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* I2C */
>> +static struct clk_stm32_gate ck_icn_p_i2c1 = {
>> +    .gate_id = GATE_I2C1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i2c1", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_i2c2 = {
>> +    .gate_id = GATE_I2C2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i2c2", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_i2c3 = {
>> +    .gate_id = GATE_I2C3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i2c3", ICN_APB5, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_i2c1 = {
>> +    .gate_id = GATE_I2C1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_i2c1", FLEXGEN_13, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_i2c2 = {
>> +    .gate_id = GATE_I2C2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_i2c2", FLEXGEN_13, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_i2c3 = {
>> +    .gate_id = GATE_I2C3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_i2c3", FLEXGEN_38, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* I3C */
>> +static struct clk_stm32_gate ck_icn_p_i3c1 = {
>> +    .gate_id = GATE_I3C1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i3c1", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_i3c2 = {
>> +    .gate_id = GATE_I3C2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i3c2", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_i3c3 = {
>> +    .gate_id = GATE_I3C3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i3c3", ICN_APB5, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_i3c1 = {
>> +    .gate_id = GATE_I3C1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_i3c1", FLEXGEN_14, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_i3c2 = {
>> +    .gate_id = GATE_I3C2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_i3c2", FLEXGEN_14, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_i3c3 = {
>> +    .gate_id = GATE_I3C3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_i3c3", FLEXGEN_36, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* IWDG */
>> +static struct clk_stm32_gate ck_icn_p_iwdg1 = {
>> +    .gate_id = GATE_IWDG1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg1", ICN_APB3, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_iwdg2 = {
>> +    .gate_id = GATE_IWDG2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg2", ICN_APB3, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_iwdg3 = {
>> +    .gate_id = GATE_IWDG3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg3", ICN_APB3, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_iwdg4 = {
>> +    .gate_id = GATE_IWDG4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg4", ICN_APB3, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* LPTIM */
>> +static struct clk_stm32_gate ck_icn_p_lptim1 = {
>> +    .gate_id = GATE_LPTIM1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim1", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_lptim2 = {
>> +    .gate_id = GATE_LPTIM2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim2", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_lptim3 = {
>> +    .gate_id = GATE_LPTIM3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim3", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_lptim4 = {
>> +    .gate_id = GATE_LPTIM4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim4", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_lptim5 = {
>> +    .gate_id = GATE_LPTIM5,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim5", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_lptim1 = {
>> +    .gate_id = GATE_LPTIM1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim1", FLEXGEN_07, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_lptim2 = {
>> +    .gate_id = GATE_LPTIM2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim2", FLEXGEN_07, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_lptim3 = {
>> +    .gate_id = GATE_LPTIM3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim3", FLEXGEN_40, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_lptim4 = {
>> +    .gate_id = GATE_LPTIM4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim4", FLEXGEN_41, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_lptim5 = {
>> +    .gate_id = GATE_LPTIM5,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim5", FLEXGEN_42, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* LPUART */
>> +static struct clk_stm32_gate ck_icn_p_lpuart1 = {
>> +    .gate_id = GATE_LPUART1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lpuart1", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_lpuart1 = {
>> +    .gate_id = GATE_LPUART1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_lpuart1", FLEXGEN_39, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* MCO1 & MCO2 */
>> +static struct clk_stm32_composite ck_mco1 = {
>> +    .gate_id = GATE_MCO1,
>> +    .mux_id = MUX_MCO1,
>> +    .div_id = NO_STM32_DIV,
>> +    .hw.init = CLK_HW_INIT_PARENTS_DATA("ck_mco1", mco1_src, 
>> &clk_stm32_composite_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_composite ck_mco2 = {
>> +    .gate_id = GATE_MCO2,
>> +    .mux_id = MUX_MCO2,
>> +    .div_id = NO_STM32_DIV,
>> +    .hw.init = CLK_HW_INIT_PARENTS_DATA("ck_mco2", mco2_src, 
>> &clk_stm32_composite_ops, 0),
>> +};
>> +
>> +/* MDF */
>> +static struct clk_stm32_gate ck_icn_p_mdf1 = {
>> +    .gate_id = GATE_MDF1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_mdf1", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_mdf1 = {
>> +    .gate_id = GATE_MDF1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_mdf1", FLEXGEN_21, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* OTG */
>> +static struct clk_stm32_gate ck_icn_m_otg = {
>> +    .gate_id = GATE_OTG,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_m_otg", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* PKA */
>> +static struct clk_stm32_gate ck_icn_p_pka = {
>> +    .gate_id = GATE_PKA,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_pka", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* RNG */
>> +static struct clk_stm32_gate ck_icn_p_rng1 = {
>> +    .gate_id = GATE_RNG1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_rng1", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_rng2 = {
>> +    .gate_id = GATE_RNG2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_rng2", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* SAES */
>> +static struct clk_stm32_gate ck_icn_p_saes = {
>> +    .gate_id = GATE_SAES,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_saes", ICN_LS_MCU, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* SAI */
>> +static struct clk_stm32_gate ck_icn_p_sai1 = {
>> +    .gate_id = GATE_SAI1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai1", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_sai2 = {
>> +    .gate_id = GATE_SAI2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai2", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_sai3 = {
>> +    .gate_id = GATE_SAI3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai3", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_sai4 = {
>> +    .gate_id = GATE_SAI4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai4", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_sai1 = {
>> +    .gate_id = GATE_SAI1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_sai1", FLEXGEN_22, 
>> &clk_stm32_gate_ops,
>> +                       CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_sai2 = {
>> +    .gate_id = GATE_SAI2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_sai2", FLEXGEN_23, 
>> &clk_stm32_gate_ops,
>> +                       CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_sai3 = {
>> +    .gate_id = GATE_SAI3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_sai3", FLEXGEN_24, 
>> &clk_stm32_gate_ops,
>> +                       CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_sai4 = {
>> +    .gate_id = GATE_SAI4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_sai4", FLEXGEN_25, 
>> &clk_stm32_gate_ops,
>> +                       CLK_SET_RATE_PARENT),
>> +};
>> +
>> +/* SDMMC */
>> +static struct clk_stm32_gate ck_icn_m_sdmmc1 = {
>> +    .gate_id = GATE_SDMMC1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_m_sdmmc1", ICN_SDMMC, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_m_sdmmc2 = {
>> +    .gate_id = GATE_SDMMC2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_m_sdmmc2", ICN_SDMMC, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_m_sdmmc3 = {
>> +    .gate_id = GATE_SDMMC3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_m_sdmmc3", ICN_SDMMC, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_sdmmc1 = {
>> +    .gate_id = GATE_SDMMC1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_sdmmc1", FLEXGEN_51, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_sdmmc2 = {
>> +    .gate_id = GATE_SDMMC2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_sdmmc2", FLEXGEN_52, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_sdmmc3 = {
>> +    .gate_id = GATE_SDMMC3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_sdmmc3", FLEXGEN_53, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* SERC */
>> +static struct clk_stm32_gate ck_icn_p_serc = {
>> +    .gate_id = GATE_SERC,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_serc", ICN_APB3, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* SPDIF */
>> +static struct clk_stm32_gate ck_icn_p_spdifrx = {
>> +    .gate_id = GATE_SPDIFRX,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spdifrx", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_spdifrx = {
>> +    .gate_id = GATE_SPDIFRX,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_spdifrx", FLEXGEN_12, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* SPI */
>> +static struct clk_stm32_gate ck_icn_p_spi1 = {
>> +    .gate_id = GATE_SPI1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi1", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_spi2 = {
>> +    .gate_id = GATE_SPI2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi2", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_spi3 = {
>> +    .gate_id = GATE_SPI3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi3", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_spi4 = {
>> +    .gate_id = GATE_SPI4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi4", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_spi5 = {
>> +    .gate_id = GATE_SPI5,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi5", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_spi6 = {
>> +    .gate_id = GATE_SPI6,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi6", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_spi1 = {
>> +    .gate_id = GATE_SPI1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_spi1", FLEXGEN_16, 
>> &clk_stm32_gate_ops,
>> +                     CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_spi2 = {
>> +    .gate_id = GATE_SPI2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_spi2", FLEXGEN_10, 
>> &clk_stm32_gate_ops,
>> +                       CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_spi3 = {
>> +    .gate_id = GATE_SPI3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_spi3", FLEXGEN_11, 
>> &clk_stm32_gate_ops,
>> +                       CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_spi4 = {
>> +    .gate_id = GATE_SPI4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_spi4", FLEXGEN_17, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_spi5 = {
>> +    .gate_id = GATE_SPI5,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_spi5", FLEXGEN_17, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>
> SPI4 and SPI5 both use FLEXGEN_17

dito


>
>> +static struct clk_stm32_gate ck_ker_spi6 = {
>> +    .gate_id = GATE_SPI6,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_spi6", FLEXGEN_37, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* Timers */
>> +static struct clk_stm32_gate ck_icn_p_tim2 = {
>> +    .gate_id = GATE_TIM2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim2", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim3 = {
>> +    .gate_id = GATE_TIM3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim3", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim4 = {
>> +    .gate_id = GATE_TIM4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim4", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim5 = {
>> +    .gate_id = GATE_TIM5,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim5", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim6 = {
>> +    .gate_id = GATE_TIM6,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim6", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim7 = {
>> +    .gate_id = GATE_TIM7,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim7", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim10 = {
>> +    .gate_id = GATE_TIM10,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim10", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim11 = {
>> +    .gate_id = GATE_TIM11,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim11", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim12 = {
>> +    .gate_id = GATE_TIM12,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim12", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim13 = {
>> +    .gate_id = GATE_TIM13,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim13", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim14 = {
>> +    .gate_id = GATE_TIM14,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim14", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim1 = {
>> +    .gate_id = GATE_TIM1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim1", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim8 = {
>> +    .gate_id = GATE_TIM8,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim8", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim15 = {
>> +    .gate_id = GATE_TIM15,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim15", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim16 = {
>> +    .gate_id = GATE_TIM16,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim16", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_tim17 = {
>> +    .gate_id = GATE_TIM17,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim17", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim2 = {
>> +    .gate_id = GATE_TIM2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim2", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim3 = {
>> +    .gate_id = GATE_TIM3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim3", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim4 = {
>> +    .gate_id = GATE_TIM4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim4", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim5 = {
>> +    .gate_id = GATE_TIM5,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim5", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim6 = {
>> +    .gate_id = GATE_TIM6,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim6", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim7 = {
>> +    .gate_id = GATE_TIM7,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim7", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim10 = {
>> +    .gate_id = GATE_TIM10,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim10", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim11 = {
>> +    .gate_id = GATE_TIM11,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim11", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim12 = {
>> +    .gate_id = GATE_TIM12,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim12", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim13 = {
>> +    .gate_id = GATE_TIM13,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim13", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim14 = {
>> +    .gate_id = GATE_TIM14,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim14", TIMG1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim1 = {
>> +    .gate_id = GATE_TIM1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim1", TIMG2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim8 = {
>> +    .gate_id = GATE_TIM8,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim8", TIMG2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim15 = {
>> +    .gate_id = GATE_TIM15,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim15", TIMG2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim16 = {
>> +    .gate_id = GATE_TIM16,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim16", TIMG2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_tim17 = {
>> +    .gate_id = GATE_TIM17,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_tim17", TIMG2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* UART/USART */
>> +static struct clk_stm32_gate ck_icn_p_usart2 = {
>> +    .gate_id = GATE_USART2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart2", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_usart3 = {
>> +    .gate_id = GATE_USART3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart3", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_uart4 = {
>> +    .gate_id = GATE_UART4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_uart4", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_uart5 = {
>> +    .gate_id = GATE_UART5,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_uart5", ICN_APB1, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_usart1 = {
>> +    .gate_id = GATE_USART1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart1", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_usart6 = {
>> +    .gate_id = GATE_USART6,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart6", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_p_uart7 = {
>> +    .gate_id = GATE_UART7,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_uart7", ICN_APB2, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_usart2 = {
>> +    .gate_id = GATE_USART2,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_usart2", FLEXGEN_08, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_uart4 = {
>> +    .gate_id = GATE_UART4,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_uart4", FLEXGEN_08, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_usart3 = {
>> +    .gate_id = GATE_USART3,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_usart3", FLEXGEN_09, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_uart5 = {
>> +    .gate_id = GATE_UART5,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_uart5", FLEXGEN_09, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_usart1 = {
>> +    .gate_id = GATE_USART1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_usart1", FLEXGEN_18, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_usart6 = {
>> +    .gate_id = GATE_USART6,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_usart6", FLEXGEN_19, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_ker_uart7 = {
>> +    .gate_id = GATE_UART7,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_ker_uart7", FLEXGEN_20, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* USB2PHY1 */
>> +static struct clk_stm32_composite ck_ker_usb2phy1 = {
>> +    .gate_id = GATE_USB2PHY1,
>> +    .mux_id = MUX_USB2PHY1,
>> +    .div_id = NO_STM32_DIV,
>> +    .hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_usb2phy1", 
>> usb2phy1_src,
>> +                        &clk_stm32_composite_ops, 0),
>> +};
>> +
>> +/* USBH */
>> +static struct clk_stm32_gate ck_icn_m_usbhehci = {
>> +    .gate_id = GATE_USBH,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_m_usbhehci", ICN_HSL, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_icn_m_usbhohci = {
>> +    .gate_id = GATE_USBH,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_m_usbhohci", ICN_HSL, 
>> &clk_stm32_gate_ops, 0),
>> +};
>
> Confirm whether GATE_USBH is intended to be shared or if 
> GATE_USBH_EHCI and GATE_USBH_OHCI similar
>
Yes, the GATE_USBH gates ck_icn_m_usbhehci and ck_icn_m_usbhohci clocks  
as described in the reference manual


Many Thanks Alok

Best Regards

Gabriel


>> +
>> +/* USB2PHY2 */
>> +static struct clk_stm32_composite ck_ker_usb2phy2_en = {
>> +    .gate_id = GATE_USB2PHY2,
>> +    .mux_id = MUX_USB2PHY2,
>> +    .div_id = NO_STM32_DIV,
>> +    .hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_usb2phy2_en", 
>> usb2phy2_src,
>> +                        &clk_stm32_composite_ops, 0),
>> +};
>> +
>> +/* VREF */
>> +static struct clk_stm32_gate ck_icn_p_vref = {
>> +    .gate_id = GATE_VREF,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_vref", ICN_APB3, 
>> &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* WWDG */
>> +static struct clk_stm32_gate ck_icn_p_wwdg1 = {
>> +    .gate_id = GATE_WWDG1,
>> +    .hw.init = CLK_HW_INIT_INDEX("ck_icn_p_wwdg1", ICN_APB3, 
>> &clk_stm32_gate_ops, 0),
>> +};
>
>
> Thanks,
> Alok
