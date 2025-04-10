Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68352036F3;
	Thu, 10 Apr 2025 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285156; cv=none; b=GWFzwFVkCELWqC7KOf7H+jzy46emABt6B5NqJdUYRvojk7smMzKPss3beLYNhu0qseSHb4K3cVmuF2ElrFIuJzS0yMsEX/A/cRgVVqpwDobK6G5K7kNSqOH/djJmeK6RcLl0dK9EZckhDA4NMaBESfdtvR5+rE0V+woUunJW8Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285156; c=relaxed/simple;
	bh=7rc31dbAkmSoVmEuH2fQ0M0qVEHGMJLlfF9VNZAzxno=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l9TZWA57rZcpL7T3TqSoqYIMgaf8lfYg80TRL42NQD8OHqKs5PKhzLQc4pvAXpQzdQ9n8taSY+eK9oIlMex73kapZHF42P6RNGiN5sGVsyj5CMJB1Bl777rCtiB0xlzZInpLjvNA3ftKmm52dxvUPVHrE4Q6uKot4P6jg4N8C/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oBTu+Ecr; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oBTu+Ecr"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53ABd5bB1791201
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 06:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744285145;
	bh=w6fV5bI1T6GN2zcix/2ZHOp8qdNscyjQU9GGmfz+CPs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oBTu+EcrWlL3O/dOxm68A7YOJYb53FXxbzk21g5R3E2jQL0pBTydhzGoc3dbZNJeL
	 XdfqiJja1XH21abud33uK4aTR+CjAB9ae60YN0T1VkVRYR2RMNyXIzErHyFrgMBitk
	 j92DM/gQjK4QfTSACOCo5numOfzxun3BpeNdCT2I=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53ABd4kb041232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 06:39:04 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 06:39:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 06:39:04 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53ABcvFD086503;
	Thu, 10 Apr 2025 06:38:58 -0500
Message-ID: <5969e1e8-0bb7-4334-a0c5-b4c396b8b6af@ti.com>
Date: Thu, 10 Apr 2025 17:08:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Jai Luthra <jai.luthra@ideasonboard.com>
CC: Andrew Davis <afd@ti.com>, Judith Mendez <jm@ti.com>,
        Devarsh Thakkar
	<devarsht@lewv0571a.ent.ti.com>,
        Nishanth Menon <nm@ti.com>, Hari Nagalla
	<hnagalla@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Beleswar Padhi
	<b-padhi@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>, <praneeth@ti.com>,
        "Khasim, Syed
 Mohammed" <khasim@ti.com>,
        <tomi.valkeinen@ideasonboard.com>, <v-krishnamoorthy@ti.com>,
        <s-tripathy@ti.com>, <s-tripathi1@ti.com>, <c-shilwant@ti.com>,
        <r-ravikumar@ti.com>
References: <20250405001518.1315273-1-jm@ti.com>
 <20250405001518.1315273-7-jm@ti.com>
 <6868f593-0728-4e92-a57b-87db6a0037f6@ti>
 <f42607f5-e39d-48a1-89c0-11d4982a2426@ti.com>
 <e131298f-3713-482a-a740-ff89709270b4@ti.com>
 <091c0869-525b-4b40-b5fe-a5c1907ec606@ti.com>
 <czmir7yvss3oreveesyrjqfdcawyn2axtstomsj3yx5sntqwo2@r3udnsyrxvkp>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <czmir7yvss3oreveesyrjqfdcawyn2axtstomsj3yx5sntqwo2@r3udnsyrxvkp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jai,

On 10/04/25 15:48, Jai Luthra wrote:
> Hi Devarsh,
> 
> Thanks for the cc here.

Thanks for the quick comments.

> 
<snip>

> On the basic camera + ISP usecase, afaiu the downstream edgeAI SDK uses
> custom gstreamer elements that make calls to the aforementioned R5 core
> that controls the ISP. On top of that there are additional gstreamer
> patches that are not yet posted upstream for review from the community,
> so the userspace design isn't really set in stone, or upstream-friendly
> yet.
> 

I don't see much relation of carve-outs with Gstreamer or it's pending 
downstream patches. The memory is mainly managed from firmwares (mainly 
openvx layer being used underneath) and there are even non-gstreamer 
pure openvx based use-cases/tests which use these carveouts. At the end 
of the day, the firmwares from the only SDK which is released publicly 
for AM62A uses all these carveouts.


> IMO if that architecture is still under discussion, it might be better
> to keep the edgeAI specific carveouts out of the upstream DTs.. just in
> case the carevouts have to go away, or change significantly.
> 
> If you are sure that the regions and firmware architecture is set in
> stone and won't be updated even if there is a complete redesign of the
> userspace/application level stack for accessing the ISP (let's say u
sing> libcamera), only then it makes sense to add the carveouts right now.


Yes as I said if whole firmware arch is getting updated then better to 
wait. I think probably the firmware team marked in cc can comment on 
that. Moreover I don't see any point of adding only half the regions as 
that would anyway not work with SDK supplied firmwares, for e.g. 
RTOS-to-RTOS ipc test run by firmwares on bootup would fail, along with 
other camera+ISP and AI use-cases.

Regards
Devarsh

>>>>
>>>> I understand your point, currently with this patch remoteproc loading
>>>> will not work for some cores. However, the goal here is to standardize
>>>> as much as possible the memory carveout sizes, push the "demo firmware"
>>>> to request resources the correct way from resource table, and move away
>>>> from this dependency and limitations that we have with our firmware.
>>
>> I understand this, but my view is that w.r.t firmware only goal should not
>> just be tp demonstrate correct way of requesting resources from
>> resource-tables, optimize the carve-outs etc but also to demonstrate the
>> primary use-cases (camera+ISP+edgeAI) which the device is capable of.
>>
>>>> should soon be able to generate our own firmware using Zephyr,  which
>>>> Andrew is pioneering, so with this firmware we should move to the
>>>> correct direction upstream. Downstream we are still using the memory
>>>> carveout sizes that the firmware folk want so desperately to keep, for
>>>> now..
>>>>
>>>
>>> +1
>>>
>>> I have this Zephyr based firmware for AM62A working and it uses the
>>> standard IPC regions as specified in this patch. I'll be posting the PR
>>> for it in Zephyr upstream by the end of week.
>>>
>>
>> I understand this, but will this zephyr based firmware support vision +
>> edgeAI analytics ? Does it demonstrate all the unique capabilities of AM62A
>> SoC ? If not, then what would be utility of such firmware on AM62A where
>> these are the primary use-cases w.r.t AM62A ?
>>
>> Why should upstream device-tree use carve-outs which match to this demo
>> zephyr based firmware (which apparently not many are using and is not going
>> into any official SDK release) instead of official firmwares going into SDK
>> ? SDK released firmwares are being used by so many customers and SDK
>> documentation maps to it, but zephyr firmware that is being pitched here,
>> who would be the potential users and what would be it's utility ?
>>
>> [1]: https://www.ti.com/tool/PROCESSOR-SDK-J721E
>>
>> Regards
>> Devarsh
>>
>>> For this patch as it is:
>>>
>>> Acked-by: Andrew Davis <afd@ti.com>
>>>
>>
>>
>>> Andrew
>>>
>>> [0] https://lore.kernel.org/lkml/20241011123922.23135-1-richard@nod.at/
>>> [1] https://git.ti.com/cgit/edgeai/meta-edgeai/tree/recipes-kernel/
>>> linux/linux-ti-staging/j721e-evm/0001-arm64-dts-ti-Add-DTB-overlays-for-
>>> vision-apps-and-ed.patch?h=kirkstone
>>>
>>>> ~ Judith
>>>>
>>>>>
>>>>> [1]:
>>>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/
>>>>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=ti-linux-6.6.y-cicd#n103
>>>>> [2]: https://www.ti.com/tool/PROCESSOR-SDK-AM62A
>>>>>
>>>>> Regards
>>>>> Devarsh
>>>>>
>>>>>>        opp-table {
>>>>>> @@ -741,3 +771,57 @@ dpi1_out: endpoint {
>>>>>>            };
>>>>>>        };
>>>>>>    };
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
>>>
>>
>>
> 

