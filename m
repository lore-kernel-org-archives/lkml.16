Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6682DAFAA;
	Fri,  4 Jul 2025 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619649; cv=none; b=WeOAQ4vBb8ykJRMKpdqBhti9Z9moLKTzWuRHGHwmtj5IsMPjadCEmo8EYqp108rY3tGlhAGPq7uRVyAQRS18KoM5jkuhaHDG2xEsRYP7yKJ+8DEZJghAsjs1eaww3PvIUeHjT5ysUMaJK8Hl72bSxYxZWBIA8AWQM7Es2qu1RNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619649; c=relaxed/simple;
	bh=yPyhF4ei0C2eeEy4OzReACfjIMmhBwKbDXON5X9md+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u43NM7xxRt/hr7dbM+S94TwLF0Rfn1rIrxnjyYW5o4zkkA0mQdVyueJHH5TZOypfr6soJAZwfgxSLEdNHOcUP5xaiM4jBXyI7IW5EtVhfKbIVQejT8hBIPt2qu8mctCaeZ/UkdK+INRi93ZkYq8+yXHniUWEhi5nYg+EDEyfvz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Z/6cNXSG; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z/6cNXSG"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56490dFM4139738;
	Fri, 4 Jul 2025 04:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751619639;
	bh=Nd5IU7a3XjIk16WFZhPfENBSU02gEYqyGGL1B15JCGE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Z/6cNXSG/Xue9jVM5rSFkD/Rs6EyFwX4o5v+eURcqLB0dwlc93VoYvFec5oNgDlIC
	 9kLfYnWXdBT3qbTAbkEKJdZTggybN8MjVFR0iLUftoGA0vu8TKHoPPbIbGFSvMmqPh
	 24TJqXxVFk7/3T/8cdK/4OSdBW2jC4WWB9xvIKvk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56490dFs3233464
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 04:00:39 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 04:00:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 04:00:39 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56490Y8R2708392;
	Fri, 4 Jul 2025 04:00:34 -0500
Message-ID: <cb52029a-d1c8-47c8-bf4b-0de44601a9ef@ti.com>
Date: Fri, 4 Jul 2025 14:30:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: Add support for AM62D2-EVM
To: Bryan Brattlof <bb@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>,
        <andrew@lunn.ch>
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-5-p-bhagat@ti.com>
 <20250701162504.dck3763ik6kpo7ec@bryanbrattlof.com>
 <f7b0c7f0-9af1-4105-a143-103c49fe2320@ti.com>
 <20250703122008.ygz5udttjdo3l2g4@bryanbrattlof.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250703122008.ygz5udttjdo3l2g4@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Bryan,


On 03/07/25 17:50, Bryan Brattlof wrote:
> On July  3, 2025 thus sayeth Paresh Bhagat:
>> Hi Bryan,
>>
>>
>> On 01/07/25 21:55, Bryan Brattlof wrote:
>>> On June 27, 2025 thus sayeth Paresh Bhagat:
>>>> AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
>>>> designed for AM62D2 SoC from TI. It supports the following interfaces:
>>>>
>>>> * 4 GB LPDDR4 RAM
>>>> * x2 Gigabit Ethernet expansion connectors
>>>> * x4 3.5mm TRS Audio Jack Line In
>>>> * x4 3.5mm TRS Audio Jack Line Out
>>>> * x2 Audio expansion connectors
>>>> * x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
>>>> * x1 UHS-1 capable micro SD card slot
>>>> * 32 GB eMMC Flash
>>>> * 512 Mb OSPI NOR flash
>>>> * x4 UARTs via USB 2.0-B
>>>> * XDS110 for onboard JTAG debug using USB
>>>> * Temperature sensors, user push buttons and LEDs
>>>>
>>>> Although AM62D2 and AM62A7 differ in peripheral capabilities example
>>>> multimedia, VPAC, and display subsystems, the core architecture remains
>>>> same. To reduce duplication, AM62D support reuses the AM62A dtsi and the
>>>> necessary overrides will be handled in SOC specific dtsi file and a
>>>> board specific dts.
>>>>
>>>> Add basic support for AM62D2-EVM.
>>>>
>>>> Schematics Link - https://www.ti.com/lit/zip/sprcal5
>>>>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>>> ---
>>>>    arch/arm64/boot/dts/ti/Makefile          |   3 +
>>>>    arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 599 +++++++++++++++++++++++
>>>>    arch/arm64/boot/dts/ti/k3-am62d2.dtsi    |  25 +
>>>>    3 files changed, 627 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>>>>    create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>>>>
>>> ...
>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>>>> b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>>>> new file mode 100644
>>>> index 000000000000..70aeb40872a9
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>>>> @@ -0,0 +1,25 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>>>> +/*
>>>> + * Device Tree Source for AM62D2 SoC family in Quad core configuration
>>>> + *
>>>> + * TRM: https://www.ti.com/lit/pdf/sprujd4
>>>> + *
>>>> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include "k3-am62a7.dtsi"
>>> If we want to reuse the AM62A chassis I think we should probably reused
>>> the AM62AX_IOPAD() macro instead of creating a new one.
>>
>> AM62D does not necessarily have the same pin configuration compared to
>> AM62A. While it is a macro which could be shareable across many boards, i
>> think its preferable we maintain separate definitions to highlight the new
>> SoCs. AM62D is a separate package, with some components reused from AM62a.
> I guess I don't understand the need to create a new padconfig macro when
> we say, in device tree syntax, the AM62D and AM62A uses the same RTL
> chassis. The pinout will always change with packaging changes but this
> will not change the padconfig MMR layout.
>
> All that said. It's just a name and honestly when you look at all these
> macros we haven't changed the padconfig layout for any K3 chip so it not
> a big deal to me. If it helps people when grepping around i'll relent ;)


Makes sense. Thanks
>
>>
>>>> +
>>>> +/ {
>>>> +	model = "Texas Instruments K3 AM62D SoC";
>>>> +	compatible = "ti,am62d2";
>>>> +};
>>>> +
>>>> +&vpu {
>>>> +	status = "disabled";
>>>> +};
>>>> +
>>>> +&e5010 {
>>>> +	status = "disabled";
>>>> +};
>>> So I could be a little out of date on the style guidelines here, but my
>>> intuition is device trees, much like real trees, can only grow, so we
>>> can't inherit the am62a.dtsi and remove things.
>>>
>>> My understanding is we have to create a full am62d.dtsi with its
>>> features that the am62a.dtsi can extend with the vpu{} and e5010{} nodes
>>>
>>> ~Bryan
>>
>> Agree we should ideally keep the device trees extending. But in this case it
>> will involve changes not only in am62a.dtsi but ideally it will change
>> k3-am62a-main.dtsi and k3-am62a-mcu.dtsi as well. This moves us back to
>> version 3 of this series
>> https://lore.kernel.org/all/20250508091422.288876-1-p-bhagat@ti.com/ where i
>> created *common*.dtsi files which looks a bit complex.
>>
>>
>> The current method also ensures that customers can start their development
>> of a new board with k3-am62d2.dtsi, while maintaining less complexity and is
>> a easier to follow approach.
> The issue I take with this approach is what does 'status = "disabled"'
> mean now. Historically (for TI SoCs at least) it indicated the node was
> incomplete and would need to be extended in the board.dts to function
> properly. But now we're trying to say for these two nodes the hardware
> doesn't exist on this SoC and bad things will happen if you enable them.
>
> My recommendation is to try to flip this around. The am62a7.dtsi should
> inherit the am62d2.dtsi and add the vpu{} and e5010{} nodes. I agree we
> don't need to try to combine the two as we did in v3 just yet but we
> should try to keep the device trees growing as we inherit things.
>
> ~Bryan


Yep makes sense. I guess deleting the node will be better than having 
'status = "disabled"' for components which are not supported/absent. 
Also it will avoid the need to flip around and change the existing am62a 
structure. I will send a new version with the updates. Thanks.
>
>>
