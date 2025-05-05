Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B716D1F7092;
	Mon,  5 May 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437490; cv=none; b=fKknzUZmp2KHjQuhgb/HZgYnCADizCYYUBDvsFnnR0/L9ZyY5YSfkfbshLMpbnEJBrUbVeOQhDHfiz6Ybl1jqL7NEo0XtGDlDFTPDg9CD49beNdQvjk+Nb9FajkY3uOr1PPctPcr/f9lQEMB90m7jfpDazKoqdwESK0x/eYxN9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437490; c=relaxed/simple;
	bh=p4WIh1wAqpCSR0rgfzCPijEovBcj1rWbocb6ikbQ4b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Lc+trPcqm/bLAl9nOo4w/HHyZfzZzk+Oh9g2bACvN49tn0PtwKnbMYOyfBxvghQQsIw5XR5yFzuZSH1aTLTgG91MBbDx637NU9F4aEqkdfb0/WRI2xmuHpTu4egQIU9tx1ZBnTSDD2QuVmXO0qSmYNnns1XtLbgmJk4bSQZJTKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nAZfVMdP; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nAZfVMdP"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5459VMts911528
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 04:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746437482;
	bh=Z+7IOhtAynV53adv2VyXbmQww1wwmw7X+Pxw7BRT5S8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nAZfVMdPUF6aNCrqLA2peKTRXQGO8On9XjRWhX2xYpCgxPansS6nGlejQ1R1+n2Zs
	 oX7o6Ywhv5Rdd7BehLR3qz3Afr16XDrI6XDrQnBfJ5gALNe43fHEw3/rPzi7v67ljY
	 nRFYgZDW9SftUvVKGMxywRslmTMPHVUC2YEf6m7w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5459VMfB012261
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 04:31:22 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 04:31:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 04:31:21 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5459VHvq087600;
	Mon, 5 May 2025 04:31:18 -0500
Message-ID: <e7ddd359-bf19-4f6a-af32-43bcb5504ab1@ti.com>
Date: Mon, 5 May 2025 15:01:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>
References: <20250502153915.734932-1-p-bhagat@ti.com>
 <20250502153915.734932-2-p-bhagat@ti.com>
 <20250502160541.azhzbnmghrkory7h@cleaver>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250502160541.azhzbnmghrkory7h@cleaver>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth,


On 02/05/25 21:35, Nishanth Menon wrote:
> On 21:09-20250502, Paresh Bhagat wrote:
>> The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
>> targeted for applications needing high-performance Digital Signal
>> Processing. It is used in applications like automotive audio systems,
>> professional sound equipment, radar and radio for aerospace, sonar in
>> marine devices, and ultrasound in medical imaging. It also supports
>> precise signal analysis in test and measurement tools.
>>
>> Some highlights of AM62D2 SoC are:
>>
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
>>
>> This adds dt bindings for TI's AM62D2 family of devices.
>>
>> More details about the SoCs can be found in the Technical Reference Manual:
>> https://www.ti.com/lit/pdf/sprujd4
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> Looking at the board patch in the series, this is am62p5 ? what is the
> difference? If there is a difference, why is there no dtsi
> file for am62d?
AM62d2 SoC is similar to AM62a7 in terms of CPU cores, cache hierarchy 
and other peripherals. 
https://lore.kernel.org/linux-arm-kernel/20220901141328.899100-5-vigneshr@ti.com/
Thus same dtsi file is being reused here.
>
>> ---
>>   Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
>> index a6d9fd0bcaba..bac821d63cf1 100644
>> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
>> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
>> @@ -31,6 +31,12 @@ properties:
>>             - const: phytec,am62a-phycore-som
>>             - const: ti,am62a7
>>   
>> +      - description: K3 AM62D2 SoC and Boards
>> +        items:
>> +          - enum:
>> +              - ti,am62d2-evm
>> +          - const: ti,am62d2
>> +
>>         - description: K3 AM62P5 SoC and Boards
>>           items:
>>             - enum:
>> -- 
>> 2.34.1
>>
