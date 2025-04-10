Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303962857CB;
	Thu, 10 Apr 2025 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307467; cv=none; b=o2xiQ68bx96I065fz8YlRmiSkSkVveGm5AOOzsVsNZ19BxH7PsLeSipQBKn6wnS2vV71YKBz6CfYU/3i1UKH9cybUI53f9eTm0Wij24T2/wPwybsY66QTxGBMCxuf8oOxuZV9q9z6Zjr1W18hQnftJc6KMyy38ru+tx4O/9ptg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307467; c=relaxed/simple;
	bh=zilCL1e3bUYuIqps8W52vNmjjRHZdj8cpG0KBHOiXt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QHsD37n5ou+pChPZr7U3CRG6IEvg+Su80yEeesMPe4b+R2WuAX02mBpC01B9W2bnuoPg0o9yOaVzn6CbNdRRUAYY7JTTyDp8dU6W2rFUdyE1pdnenrjkbWEmGdsQzYxdcgCBqgum2vokk9SmMMjqvu9HbA561vvET1iLkcDOE+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=d9lLXinc; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d9lLXinc"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53AHov5G1223564
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 12:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744307457;
	bh=VnCuiAJDXuMTmSJHi5/PkXpgN05VqTzRwvzm8iIJ+tE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d9lLXincOLRlAV6I8IOMdKZkWBWPhPRbT2x9u4LyLr65EBciNj39PRG+ZCtNDZXmH
	 p5y/uXLYPD0YZia/FJIQYIPHGYHi2qk8o0jqCw81goSqlicgwdB5YYTYVAuWxmvXvq
	 rKSoqZyAAS5uDPQY4GQtYPkHrzNRagc2ty77R3Wc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53AHov5v027764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 12:50:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 12:50:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 12:50:56 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53AHou49004588;
	Thu, 10 Apr 2025 12:50:56 -0500
Message-ID: <b97c1eaa-f34c-4731-8e9e-b51faa4619c4@ti.com>
Date: Thu, 10 Apr 2025 12:50:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Beleswar Prasad Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
        Devarsh
 Thakkar <devarsht@lewv0571a.ent.ti.com>,
        Nishanth Menon <nm@ti.com>, Hari
 Nagalla <hnagalla@ti.com>
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
 <f8f1d877-3d13-4ba7-90e1-455923458c11@ti.com>
 <fe735242-4643-432a-adaf-27e29719948a@ti.com>
 <bffd8489-1556-425d-b3f9-8fde8a7d34a7@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <bffd8489-1556-425d-b3f9-8fde8a7d34a7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/10/25 3:55 AM, Beleswar Prasad Padhi wrote:
> Hi Judith,
> 
> On 10/04/25 04:02, Judith Mendez wrote:
>> Hi Beleswar,
>>
>> On 4/7/25 11:00 PM, Beleswar Prasad Padhi wrote:
>>> Hi Judith, Andrew,
>>>
>>> On 07/04/25 19:43, Judith Mendez wrote:
>>>> Hi Devarsh,
>>>>
>>>> On 4/7/25 8:54 AM, Devarsh Thakkar wrote:
>>>>> Hi Judith,
>>>>>
>>>>> On 05/04/25 05:45, Judith Mendez wrote:
>>>>>  > From: Devarsh Thakkar <devarsht@ti.com>
>>>>>>
>>>>>
>>>>> Thanks for the patch.
>>>>>
>>>>>> For each remote proc, reserve memory for IPC and bind the mailbox
>>>>>> assignments. Two memory regions are reserved for each remote processor.
>>>>>> The first region of 1MB of memory is used for Vring shared buffers
>>>>>> and the second region is used as external memory to the remote processor
>>>>>> for the resource table and for tracebuffer allocations.
>>>>>>
>>>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>>>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>>> ---
>>>>>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96 +++++++++++++++++++++++--
>>>>>>   1 file changed, 90 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>>>> index 1c9d95696c839..7d817b447c1d0 100644
>>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>>>> @@ -52,6 +52,42 @@ linux,cma {
>>>>>>               linux,cma-default;
>>>>>>           };
>>>>>> +        c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
>>>>>> +            compatible = "shared-dma-pool";
>>>>>> +            reg = <0x00 0x99800000 0x00 0x100000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        c7x_0_memory_region: c7x-memory@99900000 {
>>>>>> +            compatible = "shared-dma-pool";
>>>>>> +            reg = <0x00 0x99900000 0x00 0xf00000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
>>>>>> +            compatible = "shared-dma-pool";
>>>>>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
>>>>>> +            compatible = "shared-dma-pool";
>>>>>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>>>>>> +            compatible = "shared-dma-pool";
>>>>>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>> +        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>>>>> +            compatible = "shared-dma-pool";
>>>>>> +            reg = <0x00 0x9c900000 0x00 0xf00000>;
>>>>>> +            no-map;
>>>>>> +        };
>>>>>> +
>>>>>>           secure_tfa_ddr: tfa@9e780000 {
>>>>>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>>>>>               alignment = <0x1000>;
>>>>>> @@ -63,12 +99,6 @@ secure_ddr: optee@9e800000 {
>>>>>>               alignment = <0x1000>;
>>>>>>               no-map;
>>>>>>           };
>>>>>> -
>>>>>> -        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>>>>> -            compatible = "shared-dma-pool";
>>>>>> -            reg = <0x00 0x9c900000 0x00 0x01e00000>;
>>>>>> -            no-map;
>>>>>> -        };
>>>>>>       };
>>>>>
>>>>> This is missing the edgeAI specific remote-core carveouts and RTOS-to-RTOS IPC memory regions [1] being used by edgeAI firmwares which come as pre-packaged in the official SDK release for AM62A.
>>>>>
>>>>> There is only one official SDK release for AM62A (which is edgeAI based) [2] which packages these edgeAI remoteproc firmwares and in my view it is a fair expectation that remote core careveouts in device-tree should align with firmwares released in SDK.
>>>>>
>>>>> This is because most developers (including me) and vendors download this official SDK release and use it with latest upstream kernel and modules (right now we are applying required patches locally) and this patch won't suffice for this, in-fact it won't work since the remoteproc firmwares are already using regions beyond the reserved-regions from this patch.
>>>>
>>>> I understand your point, currently with this patch remoteproc loading
>>>> will not work for some cores. However, the goal here is to standardize
>>>> as much as possible the memory carveout sizes, push the "demo firmware"
>>>> to request resources the correct way from resource table, 
>>>
>>>
>>> It is indeed more suitable if the memory carveouts are called out in the resource table of the firmware. But you will still need to reserve that memory sections in the Device Tree so that Kernel does not map that memory for anything else. So I am thinking how moving to resource table will help solve this problem?
>>
>> The point is that our default FW is doing things incorrectly. We want to
>> push the existing FW to
>> 1. Request resources via resource table.
>> 2. Fix their memory requirements (recent offline discussion proved that
>> FW is requesting more than it needs)
>> 3. FW should adapt to Linux not Linux adapt to FW
> 
> 
> Thanks. I also agree with you on all of the above points for a standard firmware.
> 
> However, I was referring to this problem:
> Can we get rid of static reserved memory carveouts in DT?
> People using a custom firmware will have to patch the Device Tree to reserve larger/different memory regions. Is there some way where the firmware can dictate the "reserved" memory carveouts at runtime? Memory carveouts can be announced through Resource Table, but there is no guarantee we will be able to allocate it (it could be mapped by the Kernel for some other alloc), unless its pre-reserved in DT.

That's the neat thing about the RSC_CARVEOUT item in the resource table,
it works both ways. The firmware can request a static address, or it can
use FW_RSC_ADDR_ANY for the address and Linux will go and dynamically
allocate it a region. Then it passes this info back to the firmware by
updating the resource table in memory. Firmware can then simply read this
carveout address from its resource table and start using it.

The only time we need a static addresses would be for code sections as
they are not relocatable (yet). And that is the reason we have the
minimal carveouts we are adding in this patch. Code goes here. And
these carveouts are 15MB! No firmware I know of has 15MB of *code*
section.

As we found in the offline discussion, even our largest firmware
doesn't use near that much space. What that firmware is doing is picking
some spots in DRAM for its heap and buffer areas, and without coordinating
with Linux, just starts using that memory. We have to then go into DT and
carveout all these ranges to avoid stepping on the firmware heaps from
Linux.

With these firmware heap/buffer memory static carveouts we have to account
for the worst case and statically carve out enough memory for the largest
possible amount of memory a firmware could ever use. In some firmware
we ship today this is +2GB! So why should every user of this board lose
all this memory when they might happen to be using a more sane firmware
that doesn't use so much (like my Zephyr firmware), or if their firmware
doesn't need any heap at all (like some other firmware we have).

Andrew

> 
> Thanks,
> Beleswar
> 
>>
>> If not, then then we should try to move to Zephyr firmware or other/
>> better options.
>>
>> Hope I am able to explain myself better this time around.
>>
>> ~ Judith
>>
>>>
>>> Thanks,
>>> Beleswar
>>>
>>>> and move away
>>>> from this dependency and limitations that we have with our firmware. We
>>>> should soon be able to generate our own firmware using Zephyr, which
>>>> Andrew is pioneering, so with this firmware we should move to the
>>>> correct direction upstream. Downstream we are still using the memory
>>>> carveout sizes that the firmware folk want so desperately to keep, for
>>>> now..
>>>>
>>>> ~ Judith
>>>>
>>>>>
>>>>> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=ti-linux-6.6.y-cicd#n103
>>>>> [2]: https://www.ti.com/tool/PROCESSOR-SDK-AM62A
>>>>>
>>>>> Regards
>>>>> Devarsh
>>>>>
>>>>>>       opp-table {
>>>>>> @@ -741,3 +771,57 @@ dpi1_out: endpoint {
>>>>>>           };
>>>>>>       };
>>>>>>   };
>>>>>> +
>>>>>> +&mailbox0_cluster0 {
>>>>>> +    status = "okay";
>>>>>> +
>>>>>> +    mbox_r5_0: mbox-r5-0 {
>>>>>> +        ti,mbox-rx = <0 0 0>;
>>>>>> +        ti,mbox-tx = <1 0 0>;
>>>>>> +    };
>>>>>> +};
>>>>>> +
>>>>>> +&mailbox0_cluster1 {
>>>>>> +    status = "okay";
>>>>>> +
>>>>>> +    mbox_c7x_0: mbox-c7x-0 {
>>>>>> +        ti,mbox-rx = <0 0 0>;
>>>>>> +        ti,mbox-tx = <1 0 0>;
>>>>>> +    };
>>>>>> +};
>>>>>> +
>>>>>> +&mailbox0_cluster2 {
>>>>>> +    status = "okay";
>>>>>> +
>>>>>> +    mbox_mcu_r5_0: mbox-mcu-r5-0 {
>>>>>> +        ti,mbox-rx = <0 0 0>;
>>>>>> +        ti,mbox-tx = <1 0 0>;
>>>>>> +    };
>>>>>> +};
>>>>>> +
>>>>>> +&wkup_r5fss0 {
>>>>>> +    status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&wkup_r5fss0_core0 {
>>>>>> +    mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>>>>>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>>>>>> +            <&wkup_r5fss0_core0_memory_region>;
>>>>>> +};
>>>>>> +
>>>>>> +&mcu_r5fss0 {
>>>>>> +    status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&mcu_r5fss0_core0 {
>>>>>> +    mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
>>>>>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>>>>>> +            <&mcu_r5fss0_core0_memory_region>;
>>>>>> +};
>>>>>> +
>>>>>> +&c7x_0 {
>>>>>> +    mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
>>>>>> +    memory-region = <&c7x_0_dma_memory_region>,
>>>>>> +            <&c7x_0_memory_region>;
>>>>>> +    status = "okay";
>>>>>> +};
>>>>>
>>>>
>>
