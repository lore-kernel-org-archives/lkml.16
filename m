Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DABF1E8352;
	Mon,  7 Apr 2025 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036734; cv=none; b=D2UddRnpltL3iyp+fho1awMhCLifM7ROmKv000pqCKs5bbwOTzrndJdXWIBmD4yezhSC3ASvSvJilEtEM6zvk0ZdYVzYKeg9DN5XmN0r2gbsGNwMOzUuX7mPM4GETvz9LzTkzrm8pgzZYlwBG6bUJ+fqzKF6fGjlaO3XNLUWrBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036734; c=relaxed/simple;
	bh=ecPuob8sNYqZVvV1h+fY77LO2Awi2+Th0hCMGUR6dNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a0h1IRSLofkOTWa/6rhraEgbzrm/RJjAZVPYJE7CpzcaAwfOkOe5rTeU5GGn2D52ZwaVit/B5bzjstgmcjC+v2WensVf3uhDF4N3lJiKRgQIah8J0u7vq7vfl2hF1itGaMtnxw89MCAOSCHFLhqbZwUqYbrR2mdU5k6Nv1drxzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vyVRcrtD; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vyVRcrtD"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537EcjNv385036
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 09:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744036725;
	bh=nySQPps4T2a0FRio8EjYlEXOxTgZnY6kE2ly05mdvsU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vyVRcrtD3xjOIAXPPd1J9sovyIHHufJymNRSCBZUw0E/1fmoZQkym040c60IfRVGX
	 xA2MKUwcN2xWAJ/WXQkHjFlfdk1bClxvWTHnc1JNGVs+2CPRYQXfQXWKN7d2SKcVHl
	 ZKs5QnMngiP2eUaLAVFZz4q8ZfJfqAYspm9Zcnr0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537EcjIH065068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 09:38:45 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 09:38:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 09:38:44 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537Eciuh037344;
	Mon, 7 Apr 2025 09:38:44 -0500
Message-ID: <dab7c2ae-2ce9-4fdc-933c-35a4fd92a8e5@ti.com>
Date: Mon, 7 Apr 2025 09:38:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] arm64: dts: ti: k3-am64: Reserve timers used by
 MCU FW
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Padhi <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250405001518.1315273-1-jm@ti.com>
 <20250405001518.1315273-12-jm@ti.com>
 <956c0598-9934-4295-87af-ef86f4eabd94@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <956c0598-9934-4295-87af-ef86f4eabd94@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew,

On 4/7/25 7:35 AM, Andrew Davis wrote:
> On 4/4/25 7:15 PM, Judith Mendez wrote:
>> From: Hari Nagalla <hnagalla@ti.com>
>>
>> AM64x device has 4 R5F cores in the main domain. TI MCU firmware uses
>> main domain timers as tick timers in these firmwares. Hence keep them
>> as reserved in the Linux device tree.
>>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am642-evm.dts | 17 +++++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 17 +++++++++++++++++
>>   2 files changed, 34 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts 
>> b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
>> index f8ec40523254b..68bd6b806f8f0 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
>> @@ -796,6 +796,23 @@ &mcu_m4fss {
>>       status = "okay";
>>   };
>> +/* main_timers 8-11 are used by TI MCU FW */
> 
> Can you make this comment per-core and explain which core
> each timer is reserved for? Makes it easier on me in Zephyr
> to point out why we use the timers that we do, something
> like:
> 
> /* main_timer8 is reserved for mcu_r5fss0_core0 */

Sure, I can do that. Will wait for [0] conversation to close and then
respin the series with this change

[0] 
https://lore.kernel.org/linux-devicetree/f42607f5-e39d-48a1-89c0-11d4982a2426@ti.com/

~ Judith

> 
> Andrew
> 
>> +&main_timer8 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer9 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer10 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer11 {
>> +    status = "reserved";
>> +};
>> +
>>   &serdes_ln_ctrl {
>>       idle-states = <AM64_SERDES0_LANE0_PCIE0>;
>>   };
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts 
>> b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> index 33e421ec18abb..07fbdf2400d23 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> @@ -710,6 +710,23 @@ &mcu_m4fss {
>>       status = "okay";
>>   };
>> +/* main_timers 8-11 are used by TI MCU FW */
>> +&main_timer8 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer9 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer10 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer11 {
>> +    status = "reserved";
>> +};
>> +
>>   &ecap0 {
>>       status = "okay";
>>       /* PWM is available on Pin 1 of header J3 */

