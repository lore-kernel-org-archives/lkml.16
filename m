Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF225CC65;
	Mon, 12 May 2025 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043281; cv=none; b=ROrdRGnSGFjylrJ+lM8s9T5+trQdnxjsYpR+u7jiKiQwPi8SiBqXuvT1hWNTaT2qHz7iJChn5lABZvTPP9auz+t9J4bVojUOHNbFVYIdXWyyGC3IdDDZcTGIcKe2G3vRscK4MRpzRm0POKQTYMgA5ooEKW7+kI2sPejWeeHx/wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043281; c=relaxed/simple;
	bh=2gOpzaf1xhFDGTgqBjhb7G2U1mitMESXyqlAlOSW+eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZmCQ66DKBr/rdEhSd2m0RnY3GU7rHNvET5u1EOBKIR1ZuPItVqq8/POarTcfo/GC6dIe0JYnc6j08jal+xwDiLTwF7CHVJU8UB+lOm3ugNSy0bKSyzflX+ZoMh2pR2UkVs1tvynw9DkoV5PwTIp5zZbGptVX2zjzgNUUSdFLrzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Ch9GgUxc; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Ch9GgUxc"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C89UDZ025832;
	Mon, 12 May 2025 11:47:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Ms1fXKBupaGUiTVwfpWkhQXNp7DZ3MoY67STQUr4Cz0=; b=Ch9GgUxcId6fh8Xc
	XJy6kWTfTo6e0vHXJT3NUg9ODni8+jIS/QH2/6yWN1W6Qz2TtyZoc9cbKlsH5smy
	60vb5l9FLxVIubuvqaQTSitfCj0DuLrd4iP6XLxERxahAudIurp6crhLigYk+wIB
	nJcv3O8PpXRFJXN32k7CFD3ydXKc9HA9U2mNb5sUg91aFNzga+aJJ/GBRr8i1wu6
	82tte6GhGgbrmcUytT1rLg9rSJIBxQXrRYdzoSf/41wN4tMVD0dw4WlBM5xU75Cp
	lmZPjqm+dWSvSe6DofUy0xWDq/FGsGS+Epx2zeBOaTroAEir/DhBBafe/c9pJeKc
	9u0lXQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46hv7kphdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:47:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B8A5740081;
	Mon, 12 May 2025 11:46:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92923ABE2DA;
	Mon, 12 May 2025 11:45:18 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 11:45:17 +0200
Message-ID: <66fb604a-ce90-41c4-9ce9-26fa1d81e0d2@foss.st.com>
Date: Mon, 12 May 2025 11:45:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: Goran Radenovic <goran.radni@gmail.com>, Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?=
	<boerge.struempfel@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
 <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
 <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_03,2025-05-09_01,2025-02-21_01

Hi Goran

On 5/8/25 15:10, Goran Radenovic wrote:
> Hi Andrew,
> 
> thank You once again for helpful hint.
> 
> Andrew Lunn wrote:
>>>>> +    phy-handle = <&phy1>;
>>>>> +
>>>>> +    mdio {
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +        compatible = "snps,dwmac-mdio";
>>>>> +        phy1: ethernet-phy@1 {
>>>>> +            reg = <1>;
>>>>> +            interrupt-parent = <&gpiod>;
>>>>> +            interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
>>>> PHY interrupts are 99% time level, not edge.
>>> That is correct, but I am facing strange behavior, when I set
>>> IRQ_TYPE_LEVEL_LOW.
>>> My board stops booting at:
>>>
>>> [    2.343233] Waiting for root device /dev/mmcblk0p4...
>>> [   12.638818] platform 5a006000.usbphyc: deferred probe pending
>>> [   12.643192] platform 49000000.usb-otg: deferred probe pending
>>> [   12.649029] platform 48003000.adc: deferred probe pending
>>> [   12.654277] platform 5800d000.usb: deferred probe pending
>>> [   12.659744] platform 5800c000.usb: deferred probe pending
>>> [   12.665089] amba 58005000.mmc: deferred probe pending
>>> [   12.670239] amba 58007000.mmc: deferred probe pending
>>> [   12.675185] platform 50025000.vrefbuf: deferred probe pending
>>>
>>> I must investigate this. If You have any idea, You are welcome to 
>>> share it.
>> Could be an interrupt storm. The interrupt is not getting cleared
>> because of something missing in the PHY driver, so it just fires again
>> and again.
> 
> After a brief investigation, I tend to agree with your assessment that 
> the issue lies in the driver—likely the stmmac driver — which is outside 
> the scope of my changes.

No, the mdio node is driven by stmmac driver. The issue was maybe more 
linked between pinctrl driver / exti driver where the level trigger is 
probably not well managed (gpio is level but exti driver manage edge 
interrupt). When saw those defering probes, EXTI drivers and pinctrl 
drivers were well probed ?

> 
> Therefore, I would suggest keeping IRQ_TYPE_EDGE_FALLING for now, or 
> alternatively not using a hardware IRQ at all and falling back to 
> polling, as done in stm32mp15xx-dkx.dtsi.
> 
> Best regards,
> Goran
