Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5432566C4;
	Mon, 10 Feb 2025 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739215285; cv=none; b=JT5c6ziFwTgFNIKVtfVructzOo4xY5AV+r6C6Lzire7+ZOiZCrW6BGk9l1exGiLjL+FLrojTPIBYzHx0S/O28vU/7aoq4LPxH1mAI7oMRKMxmuWrddpHc3wXrfOYA1YHgITZLTQC/hl5FhJDiuKIeXEB79+FrWX0Xgv+7d5yCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739215285; c=relaxed/simple;
	bh=XlZruBqUrmgSxgeV+vtI7VB7cCVfhr01w8nJOxj4esI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pYrkLJgYo330WXY3WzLWGLgwG9GZVl7SGL+KjtozjtlBGe6pb5HLo1kGJ05+bsLGSZsjNs3aL6eHomysCeU28jzQOfmo7TqZsK0o7P2apRrq7nZ8YSj7jaC03Elo35g6xG39gOnUrHg3ywwYtY+A3B8vhjLEvP7ST1bcdV1hAmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fK/bOSqd; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fK/bOSqd"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AJLHLM3555492
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 10 Feb 2025 13:21:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739215277;
	bh=BjxGcZGgbTw2rXhcQe0xTXiOGkjk4V+jo19rYFPocYg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fK/bOSqdgtbZ3xpHBZ7QtmC4Hozhkq35qg2Ge8lNqu8OcCdOVEIiB6JRHWyNrlp6c
	 XJ9fxLsNC064KGyobSOJX9gzZ3x0qdB8EPXSrOOdABQzptWNmzlocVmHWom26jRpT5
	 P33d1fkR4CCOp2hYFCNZLD8GIMbC5MjSnrjd/yHM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AJLHVk024020;
	Mon, 10 Feb 2025 13:21:17 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 13:21:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 13:21:16 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AJLGCu057473;
	Mon, 10 Feb 2025 13:21:17 -0600
Message-ID: <205926b9-6698-4e57-bf96-a7c75e474652@ti.com>
Date: Mon, 10 Feb 2025 13:21:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] arm64: dts: ti: k3-am62p5-sk: Enable IPC with
 remote processors
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250206235200.3128163-1-jm@ti.com>
 <20250206235200.3128163-7-jm@ti.com>
 <32358aa1-0c02-4f4d-9782-2d8376c0d9fc@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <32358aa1-0c02-4f4d-9782-2d8376c0d9fc@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew,

On 2/7/25 10:58 AM, Andrew Davis wrote:
> On 2/6/25 5:51 PM, Judith Mendez wrote:
>> From: Devarsh Thakkar <devarsht@ti.com>
>>
>> For each remote proc, reserve memory for IPC and bind the mailbox
>> assignments. Two memory regions are reserved for each remote processor.
>> The first region of 1MB of memory is used for Vring shared buffers
>> and the second region is used as external memory to the remote processor
>> for the resource table and for tracebuffer allocations.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Changes since v3:
>> - Add SRAM child node for am62p MCU R5 core 0
>> ---
>>   .../dts/ti/k3-am62p-j722s-common-mcu.dtsi     | 13 +++++
>>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 50 ++++++++++++++++---
>>   2 files changed, 57 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
>> index b33aff0d65c9d..0be3463bc21c5 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
>> @@ -6,6 +6,18 @@
>>    */
>>   &cbass_mcu {
>> +    mcu_ram: sram@79100000 {
>> +        compatible = "mmio-sram";
>> +        reg = <0x00 0x79100000 0x00 0x80000>;
>> +        ranges = <0x00 0x00 0x79100000 0x80000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        mcu_sram1@0 {
> 
> What does this node do for us? Seems you reserve the whole SRAM
> area from the start, but shouldn't the phandle in mcu_r5fss0_core0
> point to this node? Or better it would use the normal SRAM API
> to request an allocation from this region.
> 
> Since this is still not resolved, and you don't mention it in
> the commit message, might be good to drop this SRAM part of this
> patch and deal with this in a later series.


Ok, since we do not have a better way to do this for now, will drop the
SRAM node.

Will respin the series one more time. Anyways I forgot to include
another patch so will add that for v5.

Thanks,
Judith



> 
> Andrew
> 
>> +            reg = <0x0 0x80000>;
>> +        };
>> +    };
>> +
>>       mcu_pmx0: pinctrl@4084000 {
>>           compatible = "pinctrl-single";
>>           reg = <0x00 0x04084000 0x00 0x88>;
>> @@ -213,6 +225,7 @@ mcu_r5fss0_core0: r5f@79000000 {
>>               ti,atcm-enable = <0>;
>>               ti,btcm-enable = <1>;
>>               ti,loczrama = <0>;
>> +            sram = <&mcu_ram>;
>>           };
>>       };
>>   };
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts 
>> b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> index ad71d2f27f538..9609727d042d3 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> @@ -48,6 +48,30 @@ reserved-memory {
>>           #size-cells = <2>;
>>           ranges;
>> +        mcu_r5fss0_core0_dma_memory_region: 
>> mcu-r5fss-dma-memory-region@9b800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        mcu_r5fss0_core0_memory_region: 
>> mcu-r5fss-memory-region@9b900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9c900000 0x00 0x1e00000>;
>> +            no-map;
>> +        };
>> +
>>           secure_tfa_ddr: tfa@9e780000 {
>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>               no-map;
>> @@ -57,12 +81,6 @@ secure_ddr: optee@9e800000 {
>>               reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
>>               no-map;
>>           };
>> -
>> -        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>> -            compatible = "shared-dma-pool";
>> -            reg = <0x00 0x9c900000 0x00 0x01e00000>;
>> -            no-map;
>> -        };
>>       };
>>       vmain_pd: regulator-0 {
>> @@ -638,6 +656,26 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
>>       };
>>   };
>> +&wkup_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>> +&wkup_r5fss0_core0 {
>> +    mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>> +            <&wkup_r5fss0_core0_memory_region>;
>> +};
>> +
>> +&mcu_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>> +&mcu_r5fss0_core0 {
>> +    mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>> +            <&mcu_r5fss0_core0_memory_region>;
>> +};
>> +
>>   &main_uart0 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&main_uart0_pins_default>;

