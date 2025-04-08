Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88627A921;
	Tue,  8 Apr 2025 04:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084835; cv=none; b=LMfyXhCzCRPHhRnx2d2lz5FgWxSqqu+3xdPMm4hsQBgGDjNPDo9tCOcOPRCSqxT0LP3sJv5cUXSQhkk3aopmCgaouVrslxQm7pr7qSHcAhLJJ3WF6fPFYqgeUtOxB+zJuoe5HEV7xtuxu7hCDjiD7FfSzurDVv5zRhkh+JhNTuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084835; c=relaxed/simple;
	bh=jsGlcWPI9BniZmGj49AgYpdtTazTcKjbeNe/XRfQqHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lFx9WVkzYrXmgQCHQeynTsmycsgYaMxQj8POS1ePQoPqkVg5WOJq9BYHBQ229BjebvshZwWuJPWHCEqwv3miVXgVuffcn0XeWHVyy2njeTYQFg21EpU7j3gUWJN0q6dBm0lkFJdbyytu/DNUX8/Y+2nDjEJpDS+FHSDzV6d/7dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f2+vO3bV; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f2+vO3bV"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53840O4n564009
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 23:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744084824;
	bh=pi4u4vviO7H/sqB5xmMHreIonnQjMbp/FTaS4iPPJhk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=f2+vO3bV2XJTqCfwRdZUcbm8Dw6HWQUivzY9CR4mNSEW8M5okFqt3Z5dYdbtsm+ix
	 7mN8AdYa11Ed75Qnonj67GHd7qSB3vvW8WwYeX3I3H3i9+dIt8/C84P7GzXiCbmf2T
	 OFTO6hKxRkcHFZ96Bsv49W0Ji8vWJHvDz9Z4o5eI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53840Osa019027
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 23:00:24 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 23:00:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 23:00:24 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53840JH2031207;
	Mon, 7 Apr 2025 23:00:20 -0500
Message-ID: <f8f1d877-3d13-4ba7-90e1-455923458c11@ti.com>
Date: Tue, 8 Apr 2025 09:30:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Judith Mendez <jm@ti.com>,
        Devarsh Thakkar
	<devarsht@lewv0571a.ent.ti.com>,
        Nishanth Menon <nm@ti.com>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>
References: <20250405001518.1315273-1-jm@ti.com>
 <20250405001518.1315273-7-jm@ti.com>
 <6868f593-0728-4e92-a57b-87db6a0037f6@ti>
 <f42607f5-e39d-48a1-89c0-11d4982a2426@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <f42607f5-e39d-48a1-89c0-11d4982a2426@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Judith, Andrew,

On 07/04/25 19:43, Judith Mendez wrote:
> Hi Devarsh,
>
> On 4/7/25 8:54 AM, Devarsh Thakkar wrote:
>> Hi Judith,
>>
>> On 05/04/25 05:45, Judith Mendez wrote:
>>  > From: Devarsh Thakkar <devarsht@ti.com>
>>>
>>
>> Thanks for the patch.
>>
>>> For each remote proc, reserve memory for IPC and bind the mailbox
>>> assignments. Two memory regions are reserved for each remote processor.
>>> The first region of 1MB of memory is used for Vring shared buffers
>>> and the second region is used as external memory to the remote 
>>> processor
>>> for the resource table and for tracebuffer allocations.
>>>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96 
>>> +++++++++++++++++++++++--
>>>   1 file changed, 90 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts 
>>> b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> index 1c9d95696c839..7d817b447c1d0 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> @@ -52,6 +52,42 @@ linux,cma {
>>>               linux,cma-default;
>>>           };
>>> +        c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0x00 0x99800000 0x00 0x100000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        c7x_0_memory_region: c7x-memory@99900000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0x00 0x99900000 0x00 0xf00000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0x00 0x9c900000 0x00 0xf00000>;
>>> +            no-map;
>>> +        };
>>> +
>>>           secure_tfa_ddr: tfa@9e780000 {
>>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>>               alignment = <0x1000>;
>>> @@ -63,12 +99,6 @@ secure_ddr: optee@9e800000 {
>>>               alignment = <0x1000>;
>>>               no-map;
>>>           };
>>> -
>>> -        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>> -            compatible = "shared-dma-pool";
>>> -            reg = <0x00 0x9c900000 0x00 0x01e00000>;
>>> -            no-map;
>>> -        };
>>>       };
>>
>> This is missing the edgeAI specific remote-core carveouts and 
>> RTOS-to-RTOS IPC memory regions [1] being used by edgeAI firmwares 
>> which come as pre-packaged in the official SDK release for AM62A.
>>
>> There is only one official SDK release for AM62A (which is edgeAI 
>> based) [2] which packages these edgeAI remoteproc firmwares and in my 
>> view it is a fair expectation that remote core careveouts in 
>> device-tree should align with firmwares released in SDK.
>>
>> This is because most developers (including me) and vendors download 
>> this official SDK release and use it with latest upstream kernel and 
>> modules (right now we are applying required patches locally) and this 
>> patch won't suffice for this, in-fact it won't work since the 
>> remoteproc firmwares are already using regions beyond the 
>> reserved-regions from this patch.
>
> I understand your point, currently with this patch remoteproc loading
> will not work for some cores. However, the goal here is to standardize
> as much as possible the memory carveout sizes, push the "demo firmware"
> to request resources the correct way from resource table, 


It is indeed more suitable if the memory carveouts are called out in the 
resource table of the firmware. But you will still need to reserve that 
memory sections in the Device Tree so that Kernel does not map that 
memory for anything else. So I am thinking how moving to resource table 
will help solve this problem?

Thanks,
Beleswar

> and move away
> from this dependency and limitations that we have with our firmware. We
> should soon be able to generate our own firmware using Zephyr, which
> Andrew is pioneering, so with this firmware we should move to the
> correct direction upstream. Downstream we are still using the memory
> carveout sizes that the firmware folk want so desperately to keep, for
> now..
>
> ~ Judith
>
>>
>> [1]: 
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=ti-linux-6.6.y-cicd#n103
>> [2]: https://www.ti.com/tool/PROCESSOR-SDK-AM62A
>>
>> Regards
>> Devarsh
>>
>>>       opp-table {
>>> @@ -741,3 +771,57 @@ dpi1_out: endpoint {
>>>           };
>>>       };
>>>   };
>>> +
>>> +&mailbox0_cluster0 {
>>> +    status = "okay";
>>> +
>>> +    mbox_r5_0: mbox-r5-0 {
>>> +        ti,mbox-rx = <0 0 0>;
>>> +        ti,mbox-tx = <1 0 0>;
>>> +    };
>>> +};
>>> +
>>> +&mailbox0_cluster1 {
>>> +    status = "okay";
>>> +
>>> +    mbox_c7x_0: mbox-c7x-0 {
>>> +        ti,mbox-rx = <0 0 0>;
>>> +        ti,mbox-tx = <1 0 0>;
>>> +    };
>>> +};
>>> +
>>> +&mailbox0_cluster2 {
>>> +    status = "okay";
>>> +
>>> +    mbox_mcu_r5_0: mbox-mcu-r5-0 {
>>> +        ti,mbox-rx = <0 0 0>;
>>> +        ti,mbox-tx = <1 0 0>;
>>> +    };
>>> +};
>>> +
>>> +&wkup_r5fss0 {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&wkup_r5fss0_core0 {
>>> +    mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>>> +            <&wkup_r5fss0_core0_memory_region>;
>>> +};
>>> +
>>> +&mcu_r5fss0 {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&mcu_r5fss0_core0 {
>>> +    mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
>>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>>> +            <&mcu_r5fss0_core0_memory_region>;
>>> +};
>>> +
>>> +&c7x_0 {
>>> +    mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
>>> +    memory-region = <&c7x_0_dma_memory_region>,
>>> +            <&c7x_0_memory_region>;
>>> +    status = "okay";
>>> +};
>>
>
