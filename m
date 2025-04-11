Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08622110;
	Fri, 11 Apr 2025 04:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744347049; cv=none; b=XnQ1qkAb3n9euBDvMlCQMB7gNPJBhqAaJyZd6woicZH/jd45khT3C96sMVEQOaZF4y5V85R60WVtvuSNJjKgf6wXiLWYlSY7g2RdSfOcCrDHzVCxzbcQuunsCdR9ulvnUSfbcP2HvoAN43gGARDWNR6FvzcVV1PNz7lMYTiqkeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744347049; c=relaxed/simple;
	bh=s+ZuiDn3GuYyyPNvyEaUaEHFNU/y/Rmlc27erlKgRjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LFauasr9YhN7sEnaosucL1zr+IejSPJsm8jlqAvKUaw0/JI7K6v6LoLWCV/0LqjQOri+66xqMbKRL8Ge2Vo87JiYrILo4DthMNbsXfeqNKDrHthDM5TJ4GLH6qPy6oLw2za+zNm5J+/hA4rxFvhIaHWJNvHQy0Qvyo+O1RuU3a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xRXuiQ7h; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xRXuiQ7h"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B4oY2J1343515
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 23:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744347034;
	bh=EhPbf5qDTYI4Rkb9QPmEziHECCtQigOHNhmMQ53dyy0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xRXuiQ7h1kSO1ts3PT79Sdn6gQKHQ0vQH0UrNkS4YUO7uOGgY8rkOXW2/Xq7oe50i
	 c0agGDxIwbbQxgvGMIwreSmFn+QN4BMcGrc2JJMEuShwa+ZY9iQSW2rCgc5w0J8tN9
	 ljIZwNibqdpIZ9UpYFk1lKk1iz+jpMxkGpf5qErk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B4oYIe091892
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 23:50:34 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 23:50:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 23:50:33 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B4oQJY113805;
	Thu, 10 Apr 2025 23:50:27 -0500
Message-ID: <ad637368-5fa7-45fa-8bb3-3a2cc754ed9b@ti.com>
Date: Fri, 11 Apr 2025 10:20:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Jai Luthra
	<jai.luthra@ideasonboard.com>
CC: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Hari Nagalla
	<hnagalla@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>, <praneeth@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>,
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
 <5969e1e8-0bb7-4334-a0c5-b4c396b8b6af@ti.com>
 <dccef5d7-46c6-4e08-98f3-ba0e8168aaff@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <dccef5d7-46c6-4e08-98f3-ba0e8168aaff@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 10/04/25 23:52, Andrew Davis wrote:
> On 4/10/25 6:38 AM, Devarsh Thakkar wrote:
>> Hi Jai,
>>
>> On 10/04/25 15:48, Jai Luthra wrote:
>>> Hi Devarsh,
>>>
>>> Thanks for the cc here.
>>
>> Thanks for the quick comments.
>>
>>>
>> <snip>
>>
>>> On the basic camera + ISP usecase, afaiu the downstream edgeAI SDK uses
>>> custom gstreamer elements that make calls to the aforementioned R5 core
>>> that controls the ISP. On top of that there are additional gstreamer
>>> patches that are not yet posted upstream for review from the community,
>>> so the userspace design isn't really set in stone, or upstream-friendly
>>> yet.
>>>
>>
>> I don't see much relation of carve-outs with Gstreamer or it's 
>> pending downstream patches. The memory is mainly managed from 
>> firmwares (mainly openvx layer being used underneath) and there are 
>> even non-gstreamer pure openvx based use-cases/tests which use these 
>> carveouts. At the end of the day, the firmwares from the only SDK 
>> which is released publicly for AM62A uses all these carveouts.
>>
>
> These are programmable cores, you can run whatever you want on them. 
> You can
> make your own firmware if you like, we have support for them in our 
> MCU+(FreeRTOS)
> offering today[0](look at all these firmware you can build/run!).
>
> In a week or so I'll start pushing support for these cores into Zephyr,
> bringing in even more firmware options for these cores.
>
> I simply do not see why one firmware, shipped with one of our SDKs*, 
> doing
> things wrong should force us to hack up our DT here in upstream Linux.


Agreed. I don't see why we should incline towards supporting one of the 
SDKs.

For this patch as it as,

Reviewed-by: Beleswar Padhi <b-padhi@ti.com>

Thanks,
Beleswar

>
> *Speaking of the "only" SDK's firmware, if you take our Yocto meta-ti 
> layer and
> build an SDK yourself, you get firmware by default that *doesn't need 
> extra
> carveouts*! [1][2]
>
> Andrew
>
> [0] 
> https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/makefile.am62ax
> [1] 
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> [2] 
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-ipc/am62axx?h=ti-linux-firmware
>
>>
>>> IMO if that architecture is still under discussion, it might be better
>>> to keep the edgeAI specific carveouts out of the upstream DTs.. just in
>>> case the carevouts have to go away, or change significantly.
>>>
>>> If you are sure that the regions and firmware architecture is set in
>>> stone and won't be updated even if there is a complete redesign of the
>>> userspace/application level stack for accessing the ISP (let's say u
>> sing> libcamera), only then it makes sense to add the carveouts right 
>> now.
>>
>>
>> Yes as I said if whole firmware arch is getting updated then better 
>> to wait. I think probably the firmware team marked in cc can comment 
>> on that. Moreover I don't see any point of adding only half the 
>> regions as that would anyway not work with SDK supplied firmwares, 
>> for e.g. RTOS-to-RTOS ipc test run by firmwares on bootup would fail, 
>> along with other camera+ISP and AI use-cases.
>>
>> Regards
>> Devarsh
>>
>>>>>>
>>>>>> I understand your point, currently with this patch remoteproc 
>>>>>> loading
>>>>>> will not work for some cores. However, the goal here is to 
>>>>>> standardize
>>>>>> as much as possible the memory carveout sizes, push the "demo 
>>>>>> firmware"
>>>>>> to request resources the correct way from resource table, and 
>>>>>> move away
>>>>>> from this dependency and limitations that we have with our firmware.
>>>>
>>>> I understand this, but my view is that w.r.t firmware only goal 
>>>> should not
>>>> just be tp demonstrate correct way of requesting resources from
>>>> resource-tables, optimize the carve-outs etc but also to 
>>>> demonstrate the
>>>> primary use-cases (camera+ISP+edgeAI) which the device is capable of.
>>>>
>>>>>> should soon be able to generate our own firmware using Zephyr,  
>>>>>> which
>>>>>> Andrew is pioneering, so with this firmware we should move to the
>>>>>> correct direction upstream. Downstream we are still using the memory
>>>>>> carveout sizes that the firmware folk want so desperately to 
>>>>>> keep, for
>>>>>> now..
>>>>>>
>>>>>
>>>>> +1
>>>>>
>>>>> I have this Zephyr based firmware for AM62A working and it uses the
>>>>> standard IPC regions as specified in this patch. I'll be posting 
>>>>> the PR
>>>>> for it in Zephyr upstream by the end of week.
>>>>>
>>>>
>>>> I understand this, but will this zephyr based firmware support 
>>>> vision +
>>>> edgeAI analytics ? Does it demonstrate all the unique capabilities 
>>>> of AM62A
>>>> SoC ? If not, then what would be utility of such firmware on AM62A 
>>>> where
>>>> these are the primary use-cases w.r.t AM62A ?
>>>>
>>>> Why should upstream device-tree use carve-outs which match to this 
>>>> demo
>>>> zephyr based firmware (which apparently not many are using and is 
>>>> not going
>>>> into any official SDK release) instead of official firmwares going 
>>>> into SDK
>>>> ? SDK released firmwares are being used by so many customers and SDK
>>>> documentation maps to it, but zephyr firmware that is being pitched 
>>>> here,
>>>> who would be the potential users and what would be it's utility ?
>>>>
>>>> [1]: https://www.ti.com/tool/PROCESSOR-SDK-J721E
>>>>
>>>> Regards
>>>> Devarsh
>>>>
>>>>> For this patch as it is:
>>>>>
>>>>> Acked-by: Andrew Davis <afd@ti.com>
>>>>>
>>>>
>>>>
>>>>> Andrew
>>>>>
>>>>> [0] 
>>>>> https://lore.kernel.org/lkml/20241011123922.23135-1-richard@nod.at/
>>>>> [1] https://git.ti.com/cgit/edgeai/meta-edgeai/tree/recipes-kernel/
>>>>> linux/linux-ti-staging/j721e-evm/0001-arm64-dts-ti-Add-DTB-overlays-for- 
>>>>>
>>>>> vision-apps-and-ed.patch?h=kirkstone
>>>>>
>>>>>> ~ Judith
>>>>>>
>>>>>>>
>>>>>>> [1]:
>>>>>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/
>>>>>>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=ti-linux-6.6.y-cicd#n103
>>>>>>> [2]: https://www.ti.com/tool/PROCESSOR-SDK-AM62A
>>>>>>>
>>>>>>> Regards
>>>>>>> Devarsh
>>>>>>>
>>>>>>>>        opp-table {
>>>>>>>> @@ -741,3 +771,57 @@ dpi1_out: endpoint {
>>>>>>>>            };
>>>>>>>>        };
>>>>>>>>    };
>>>>>>>> +
>>>>>>>> +&mailbox0_cluster0 {
>>>>>>>> +    status = "okay";
>>>>>>>> +
>>>>>>>> +    mbox_r5_0: mbox-r5-0 {
>>>>>>>> +        ti,mbox-rx = <0 0 0>;
>>>>>>>> +        ti,mbox-tx = <1 0 0>;
>>>>>>>> +    };
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +&mailbox0_cluster1 {
>>>>>>>> +    status = "okay";
>>>>>>>> +
>>>>>>>> +    mbox_c7x_0: mbox-c7x-0 {
>>>>>>>> +        ti,mbox-rx = <0 0 0>;
>>>>>>>> +        ti,mbox-tx = <1 0 0>;
>>>>>>>> +    };
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +&mailbox0_cluster2 {
>>>>>>>> +    status = "okay";
>>>>>>>> +
>>>>>>>> +    mbox_mcu_r5_0: mbox-mcu-r5-0 {
>>>>>>>> +        ti,mbox-rx = <0 0 0>;
>>>>>>>> +        ti,mbox-tx = <1 0 0>;
>>>>>>>> +    };
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +&wkup_r5fss0 {
>>>>>>>> +    status = "okay";
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +&wkup_r5fss0_core0 {
>>>>>>>> +    mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>>>>>>>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>>>>>>>> + <&wkup_r5fss0_core0_memory_region>;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +&mcu_r5fss0 {
>>>>>>>> +    status = "okay";
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +&mcu_r5fss0_core0 {
>>>>>>>> +    mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
>>>>>>>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>>>>>>>> + <&mcu_r5fss0_core0_memory_region>;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +&c7x_0 {
>>>>>>>> +    mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
>>>>>>>> +    memory-region = <&c7x_0_dma_memory_region>,
>>>>>>>> +            <&c7x_0_memory_region>;
>>>>>>>> +    status = "okay";
>>>>>>>> +};
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>>
>>>
>>
