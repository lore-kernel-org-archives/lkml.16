Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0327A92B;
	Tue, 27 May 2025 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359348; cv=none; b=O41RiPN2pSz3QTi1DDZMYvhvsp+YUK4MtisDmRC90d6p0gWC0lrVGpim9RJQRMa2dscYy8uUB1QK2HzjQ+q3+bnRmFiK7wR9cM3T+boDdedlB2cW1hJWnAypNJO0Tsnr1+WTrAkUsjdnpRJKLHmm0upXUF5hSVQJ8Sb+5bUY96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359348; c=relaxed/simple;
	bh=EByL9p87g8fIY4lbLkJJGq+5jE+TnPYaQXA4KJ+9CsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AsWxXtvqvx/NElX0j+XqHIF05DNMQVk8SBjOpIQTpfr7qITfOgvVnDSYIKIgIdEetBL7Pk2l7OcMAfDZhD3wowXFGm1Nukanbls5D4fVPKnkqEHhLpRmuKEmJdyrWHNyHlj+MH63BmqXdhtzVN2VP+lBCgcXNOqE4kdAvr/xFuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dqZKUk+A; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dqZKUk+A"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCGuLT003391;
	Tue, 27 May 2025 17:22:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	hbHNouSnQewHtCw/SpQZz4t8tZtV7Zvd/CNWYDPfUXg=; b=dqZKUk+AjY8oTCLb
	yIybiOmE6D7Wl7tTUckvFudQYRN0SGBHIqLAeWFYLoLjaP3OjnDWpz5tQnkkT6lO
	OctAbTkeANzoV711TYQSJd8HD2FwGAKA8h2+NuLzumklUt9rqX5x5PELo5yc2xPQ
	xTMUaTvyeuM+rt66BjhdNtF/Y0F6ch9krfc31geOikyR8vsMfQHwU4sRwHRKKEE8
	FOWwAgbSvtxN73BjNOCm9jOtD8nmLtJWZgk7A4GdKwk+EqDFZ7rifjx0C36Y6wFj
	1KZdeFEaZuyY/4wQGEpcakGSLIXI+EjeNyFj+IBvAAbasb+VmFv6BAy5dpzOoozu
	QIaIBQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u5f24s5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 17:22:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3764F40046;
	Tue, 27 May 2025 17:19:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06CEDB1A49A;
	Tue, 27 May 2025 17:18:47 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 17:18:46 +0200
Message-ID: <6b9ad1a0-4f7d-498e-ac0d-49ac41a2532b@foss.st.com>
Date: Tue, 27 May 2025 17:18:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ARM: dts: stm32: add support of stm32mp157f-dk2
 board
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
        "amelie.delaunay@foss.st.com" <amelie.delaunay@foss.st.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Marc
 Kleine-Budde <mkl@pengutronix.de>,
        =?UTF-8?Q?Leonard_G=C3=B6hrs?=
	<l.goehrs@pengutronix.de>,
        Marek Vasut <marex@denx.de>, David Jander
	<david@protonic.nl>,
        Roan van Dijk <roan@protonic.nl>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
 <20250524100319.22521-2-himanshu.bhavani@siliconsignals.io>
 <9d3df716-343f-4c32-9e2e-2058bc1a9b6f@foss.st.com>
 <PN0P287MB201936022C3BF4389C7BF8B79A64A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <PN0P287MB201936022C3BF4389C7BF8B79A64A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01

Hi Himanshu

On 5/27/25 08:36, Himanshu Bhavani wrote:
> Hi Alexandre,
> 
>> Hi Himanshu
>>
>> On 5/24/25 12:03, Himanshu Bhavani wrote:
>>> STM32MP157F is similar to the STM32MP157C, so reuse the existing
>>> stm32mp157c-dk2.dts as a base for the STM32MP157F-DK2 board.
>>>
>>> Datasheet: https://www.st.com/resource/en/data_brief/stm32mp157f-dk2.pdf
>>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
>>> ---
>>>     arch/arm/boot/dts/st/Makefile            |  3 ++-
>>>     arch/arm/boot/dts/st/stm32mp157f-dk2.dts | 15 +++++++++++++++
>>>     2 files changed, 17 insertions(+), 1 deletion(-)
>>>     create mode 100644 arch/arm/boot/dts/st/stm32mp157f-dk2.dts
>>>
>>> diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
>>> index 60d55516f723..38179638e5eb 100644
>>> --- a/arch/arm/boot/dts/st/Makefile
>>> +++ b/arch/arm/boot/dts/st/Makefile
>>> @@ -70,7 +70,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
>>>         stm32mp157c-lxa-tac-gen2.dtb \
>>>         stm32mp157c-odyssey.dtb \
>>>         stm32mp157c-osd32mp1-red.dtb \
>>> -     stm32mp157c-phycore-stm32mp1-3.dtb
>>> +     stm32mp157c-phycore-stm32mp1-3.dtb \
>>> +     stm32mp157f-dk2.dtb
>>>     dtb-$(CONFIG_ARCH_U8500) += \
>>>         ste-snowball.dtb \
>>>         ste-hrefprev60-stuib.dtb \
>>> diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
>>> new file mode 100644
>>> index 000000000000..ab406b2c44c1
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
>>> @@ -0,0 +1,15 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>>> +/*
>>> + * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
>>> + *
>>> + * Author: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "stm32mp157c-dk2.dts"
>>
>> In this case what is the aim of this series if you just use stm32mp157C
>> devicetree ?
> 
> This patch series aims to add support for the STM32MP157F board device
> tree. The primary motivation is to ensure that users working with the
> STM32MP157F variant have a reference DTS available. Currently, no such
> device tree exists, even though the STM32MP157F and STM32MP157C are
> largely similar.
> 
>> ST people (mainly Amélie) are preparing a full support of
>> STM32MP157F-DK2 leveraging the F variant compare to the C variant.
>> Series will be sent this week.
> 
> If ST is working on a dedicated DTS for the F variant, it's likely they are starting
> from the C variant as a base, this is exactly the approach I’ve taken here. At this
> stage, I have not included an SCMI-based version of the board since it hasn't
> been tested yet.

Please have a look on:

https://lore.kernel.org/all/20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com/

The idea is to have the same approach than for STM32MP13 and STM32MP25 
relying on SCMI and preparing the add of F variant feature: DVFS/cpufreq.

regards
alex


> Please let me know if you have any further suggestions.
> 
> 
> Best Regards,
> Himanshu
> 
>> Regards
>> Alex
>>
>>> +
>>> +/ {
>>> +     model = "STMicroelectronics STM32MP157F-DK2 Discovery Board";
>>> +     compatible = "st,stm32mp157f-dk2", "st,stm32mp157";
>>> +};
