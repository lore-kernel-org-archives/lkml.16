Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3BD2951CD;
	Thu,  3 Jul 2025 06:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524992; cv=none; b=sHNhlCnXV1IYBdDJnbg5S63NuMdxjCG3wVSKlvzT2vTk7FLVXqMXQ0zaoCRMhod4MiCHn3zzGc4cyubBtz8gl9sxDpp1v9xggU+EzyGBqOgyqmQYXqawZuUxNCg3jkYD3TAII0uc+7G/YQnu7zk589Rl9gVdz4HMME+ISGFOhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524992; c=relaxed/simple;
	bh=IInDjQia2ME46qt6AmZ2In32ciFiqBmORUs3cZemT2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V1RoIgBdARQflVlOew4Azg6dvo7yCt9Y6a0bgcYIHIt6vwbtmZTDybZsSq71lTT6I73AjH4kqNebqM6x8p/FoVI9XcAMZdZCS46IVSltXdJUJqEB9yVWB5B+ZcSY8vvSSPtNnsJpztYiLGj4XqUHPd6urzWF8HkEWK+5lnmgzNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QH7h1fV1; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QH7h1fV1"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5636h0874128774;
	Thu, 3 Jul 2025 01:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751524980;
	bh=8ZjWnkrA791iDf/xncUsMifSlZwO2guVSrO1y+XKT/c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QH7h1fV10LGwkxXoEkyi3ANMinQMY+RosZkvIcydv7HKoXcVEOK2luHRm6qYGoSXC
	 MAHV6hE0IWwcyBEqzNxGNlDZrKDBLN4PYKG6K1D3iKg0VrHB0O/LYtlgySM9GyiwGK
	 3Tv7SOa6hYiqypbI7US4qJ5IfP2asLMp9weIOHn0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5636h05t1590257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 01:43:00 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 01:42:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 01:43:00 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5636gsgk369926;
	Thu, 3 Jul 2025 01:42:55 -0500
Message-ID: <f7b0c7f0-9af1-4105-a143-103c49fe2320@ti.com>
Date: Thu, 3 Jul 2025 12:12:54 +0530
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
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250701162504.dck3763ik6kpo7ec@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Bryan,


On 01/07/25 21:55, Bryan Brattlof wrote:
> On June 27, 2025 thus sayeth Paresh Bhagat:
>> AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
>> designed for AM62D2 SoC from TI. It supports the following interfaces:
>>
>> * 4 GB LPDDR4 RAM
>> * x2 Gigabit Ethernet expansion connectors
>> * x4 3.5mm TRS Audio Jack Line In
>> * x4 3.5mm TRS Audio Jack Line Out
>> * x2 Audio expansion connectors
>> * x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
>> * x1 UHS-1 capable micro SD card slot
>> * 32 GB eMMC Flash
>> * 512 Mb OSPI NOR flash
>> * x4 UARTs via USB 2.0-B
>> * XDS110 for onboard JTAG debug using USB
>> * Temperature sensors, user push buttons and LEDs
>>
>> Although AM62D2 and AM62A7 differ in peripheral capabilities example
>> multimedia, VPAC, and display subsystems, the core architecture remains
>> same. To reduce duplication, AM62D support reuses the AM62A dtsi and the
>> necessary overrides will be handled in SOC specific dtsi file and a
>> board specific dts.
>>
>> Add basic support for AM62D2-EVM.
>>
>> Schematics Link - https://www.ti.com/lit/zip/sprcal5
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/Makefile          |   3 +
>>   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 599 +++++++++++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-am62d2.dtsi    |  25 +
>>   3 files changed, 627 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>>
> ...
>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>> b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>> new file mode 100644
>> index 000000000000..70aeb40872a9
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * Device Tree Source for AM62D2 SoC family in Quad core configuration
>> + *
>> + * TRM: https://www.ti.com/lit/pdf/sprujd4
>> + *
>> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "k3-am62a7.dtsi"
> If we want to reuse the AM62A chassis I think we should probably reused
> the AM62AX_IOPAD() macro instead of creating a new one.


AM62D does not necessarily have the same pin configuration compared to 
AM62A. While it is a macro which could be shareable across many boards, 
i think its preferable we maintain separate definitions to highlight the 
new SoCs. AM62D is a separate package, with some components reused from 
AM62a.


>
>> +
>> +/ {
>> +	model = "Texas Instruments K3 AM62D SoC";
>> +	compatible = "ti,am62d2";
>> +};
>> +
>> +&vpu {
>> +	status = "disabled";
>> +};
>> +
>> +&e5010 {
>> +	status = "disabled";
>> +};
> So I could be a little out of date on the style guidelines here, but my
> intuition is device trees, much like real trees, can only grow, so we
> can't inherit the am62a.dtsi and remove things.
>
> My understanding is we have to create a full am62d.dtsi with its
> features that the am62a.dtsi can extend with the vpu{} and e5010{} nodes
>
> ~Bryan


Agree we should ideally keep the device trees extending. But in this 
case it will involve changes not only in am62a.dtsi but ideally it will 
change k3-am62a-main.dtsi and k3-am62a-mcu.dtsi as well. This moves us 
back to version 3 of this series 
https://lore.kernel.org/all/20250508091422.288876-1-p-bhagat@ti.com/ 
where i created *common*.dtsi files which looks a bit complex.


The current method also ensures that customers can start their 
development of a new board with k3-am62d2.dtsi, while maintaining less 
complexity and is a easier to follow approach.


