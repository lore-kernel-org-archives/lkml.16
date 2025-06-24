Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7035279DC8;
	Tue, 24 Jun 2025 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761602; cv=none; b=eLTli0ktk3OGSdwkj2alWoYQ8YmJslW6yqHy7UHSCIvE9Tg0kR6pxHvM0IpooNpT6Sxu4dNOak/E0lYqNLeL18ilC+CgH5KxulYX2hVDTR/QJm6mKwGoELT0nyqupjrfAlTQx70eEyjAH6BiFCReUsW9sibijuWmAeh+yqjDiXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761602; c=relaxed/simple;
	bh=XgW7u+cppxBGsC7FwEGR//C0SsF7znnagrv2bfxGCNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MIYGnR0wJFgmQoG8Stwu37juTISodHNejUqEkbWZiED/gyDhE4YTpRtiljUVNPsu/bi+62jTNzdCnchF3B0wQ4p3RUY+djTycGFG1bOvHPCkv89V4geCP9SGU7vdVgY9kF85Y8zizCDckBtwo8epcsuMRfY28jCHMd9CSnXN8oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IAttkQBD; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IAttkQBD"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OAdrQc1138040;
	Tue, 24 Jun 2025 05:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750761593;
	bh=1UndgjPOX1TCSZCvOeL9kzhOH9nzk/4CegsNiR3QXeQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IAttkQBDiEJkOHEDXHW7005DUZQuTbMFNZRmHM/51KZe3O/UWLyeI6xH4ipGx5q/t
	 WDGQwOiybs4H2rRBnLYoUAK5H4LaAM6MzcinXU6ykw1sAxcTNe39nQ666dUOUM2nYN
	 92UEYeue8BTdelqz0Qp6gvm/Z7gdGaOWpzCfUnPc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OAdrwh4136188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 05:39:53 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 05:39:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 05:39:52 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OAdl6T1625959;
	Tue, 24 Jun 2025 05:39:48 -0500
Message-ID: <c4362d9e-62a4-4c28-b1cd-c338467f92ae@ti.com>
Date: Tue, 24 Jun 2025 16:09:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 2/6] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-3-p-bhagat@ti.com>
 <2e26a403-fac2-4217-8525-24e39d4c92c5@kernel.org>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <2e26a403-fac2-4217-8525-24e39d4c92c5@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Krzysztof,

Thanks for the review.

On 23/06/25 19:55, Krzysztof Kozlowski wrote:
> On 23/06/2025 16:12, Paresh Bhagat wrote:
>> The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
>> targeted for applications needing high-performance Digital Signal
>> Processing. It is used in applications like automotive audio systems,
>> professional sound equipment, radar and radio for aerospace, sonar in
>> marine devices, and ultrasound in medical imaging. It also supports
>> precise signal analysis in test and measurement tools.
> Drop all marketing stuff.
>
>> Some highlights of AM62D2 SoC are:
> This is not a product brochure.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


Will fix this in next version. Thanks
>
>
>
>> * Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster. Dual/Single
>>    core variants are provided in the same package to allow HW compatible
>>    designs.
>> * One Device manager Cortex-R5F for system power and resource management,
>>    and one Cortex-R5F for Functional Safety or general-purpose usage.
>> * DSP with Matrix Multiplication Accelerator(MMA) (up to 2 TOPS) based on
>>    single core C7x.
>> * 3x Multichannel Audio Serial Ports (McASP) Up to 4/6/16 Serial Data Pins
>>    which can Transmit and Receive Clocks up to 50MHz, with multi-channel I2S
>>    and TDM Audio inputs and outputs.
>> * Integrated Giga-bit Ethernet switch supporting up to a total of two
>>    external ports with TSN capable to enable audio networking features such
>>    as, Ethernet Audio Video Bridging (eAVB) and Dante.
>> * 9xUARTs, 5xSPI, 6xI2C, 2xUSB2, 3xCAN-FD, 3x eMMC and SD, OSPI memory
>>    controller, 1x CSI-RX-4L for Camera, eCAP/eQEP, ePWM, among other
>>    peripherals.
>> * Dedicated Centralized Hardware Security Module with support for secure
>>    boot, debug security and crypto acceleration and trusted execution
>>    environment.
>> * One 32 bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
>> * Low power mode support: Partial IO support for CAN/GPIO/UART wakeup.

I will refine the first two paragraphs to be very concise.


>>
>> This SoC is of part K3 AM62x family, which includes the AM62A and AM62P
>> variants. While the AM62A and AM62D are largely similar, the AM62D is
>> specifically targeted for general-purpose DSP applications, whereas the
>> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
>> does not include multimedia components such as the video encoder/decoder,
>> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
>> processing, or the display subsystem. Additionally, the AM62D has a
>> different pin configuration compared to the AM62A, which impacts
>> embedded software development.


This section is important as it clarifies the difference between AM62a 
and AM62d, as we are reusing AM62a dtsi files for AM62d. Let me know if 
you need a shorter version.


>>
>> This adds dt bindings for TI's AM62D2 family of devices.
>>
>> More details about the SoCs can be found in the Technical Reference Manual:
>> https://www.ti.com/lit/pdf/sprujd4
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>
> And what happened with the previous comments?


Yep there were some indentation problems earlier, which is fixed in this 
version. There was also an ack from Conor Dooley in v3. I will include that.


>
> Reach internally TI so they will coach you how to send patches upstream.
>
> Best regards,
> Krzysztof
