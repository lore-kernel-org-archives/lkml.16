Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C7D2045BF;
	Thu, 10 Apr 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275685; cv=none; b=JDfNndYfcHD1wFFD+oRXou8EWEkNXbUsHvsKMlposkWFG3PT3CfdmI3RRjzJJ6uMds+cP/uh2WcJSEyh0qeF32+yZ2HFnNpl5fkHw8/7gl0Di9uRJlziW1ov893uWkxmJVETIX1G/ggtAEQ/rsYH+lfuNMm/ffVTaKcGMJxeBfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275685; c=relaxed/simple;
	bh=PzR5AoYa0LNmRQeQyXIX32HQT0g8b0LNKUhhChQHPYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G3AlAeSy83sQh+xMl77Ed4zB7ifrP9q2eLhD/i4y93an5I6V2Ma0j3TxHIFokVV7O7dzaewJqULre0ULp2Q+DhY2lKwtgoygx6T1mZVWUpCPuLcmJynpzqbQm2o6nyX0CHFuJ3dYzvfVgm40qqHp6dXYPacUHiUB+zOYFVJoHQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sTU+3k3W; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sTU+3k3W"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53A917Nf1235056
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 04:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744275667;
	bh=cc5ekfHnrvOs+1pRJK1H7PbWsw3yfPpOvi2+tBhTZPA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sTU+3k3WVae23FM08Du+C7ftUAUouanodcI3wm3NxOBYAdqtDond9x4M7Eya/fd41
	 twzA1Nng8gjTqNpG93ro9HfZ5gwd0amI0Uv3xfjsHyqCBtnqZxYptKzae7QMNddZ8k
	 4akG5U2EyGKS3CxCwR70RUTxzEjhcIwWXBRQaY70=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53A917wZ001564
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 04:01:07 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 04:01:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 04:01:06 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53A910It043856;
	Thu, 10 Apr 2025 04:01:00 -0500
Message-ID: <091c0869-525b-4b40-b5fe-a5c1907ec606@ti.com>
Date: Thu, 10 Apr 2025 14:30:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Andrew Davis <afd@ti.com>, Judith Mendez <jm@ti.com>,
        Devarsh Thakkar
	<devarsht@lewv0571a.ent.ti.com>,
        Nishanth Menon <nm@ti.com>, Hari Nagalla
	<hnagalla@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Beleswar Padhi <b-padhi@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>, <praneeth@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>,
        <tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
        <v-krishnamoorthy@ti.com>, <s-tripathy@ti.com>, <s-tripathi1@ti.com>,
        <c-shilwant@ti.com>
References: <20250405001518.1315273-1-jm@ti.com>
 <20250405001518.1315273-7-jm@ti.com>
 <6868f593-0728-4e92-a57b-87db6a0037f6@ti>
 <f42607f5-e39d-48a1-89c0-11d4982a2426@ti.com>
 <e131298f-3713-482a-a740-ff89709270b4@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <e131298f-3713-482a-a740-ff89709270b4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew, Judith,

Thanks for the quick revert.

On 07/04/25 21:28, Andrew Davis wrote:
> On 4/7/25 9:13 AM, Judith Mendez wrote:
>> Hi Devarsh,
>>
>> On 4/7/25 8:54 AM, Devarsh Thakkar wrote:
>>> Hi Judith,
>>>
>>> On 05/04/25 05:45, Judith Mendez wrote:
>>>  > From: Devarsh Thakkar <devarsht@ti.com>
>>>>
>>>
>>> Thanks for the patch.
>>>
>>>> For each remote proc, reserve memory for IPC and bind the mailbox
>>>> assignments. Two memory regions are reserved for each remote processor.
>>>> The first region of 1MB of memory is used for Vring shared buffers
>>>> and the second region is used as external memory to the remote 
>>>> processor
>>>> for the resource table and for tracebuffer allocations.
>>>>
>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>> ---
>>>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96 +++++++++++++++++++++ 
>>>> ++--
>>>>   1 file changed, 90 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/ 
>>>> boot/dts/ti/k3-am62a7-sk.dts
>>>> index 1c9d95696c839..7d817b447c1d0 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>> @@ -52,6 +52,42 @@ linux,cma {
>>>>               linux,cma-default;
>>>>           };
>>>> +        c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x99800000 0x00 0x100000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        c7x_0_memory_region: c7x-memory@99900000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x99900000 0x00 0xf00000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x9c900000 0x00 0xf00000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>>           secure_tfa_ddr: tfa@9e780000 {
>>>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>>>               alignment = <0x1000>;
>>>> @@ -63,12 +99,6 @@ secure_ddr: optee@9e800000 {
>>>>               alignment = <0x1000>;
>>>>               no-map;
>>>>           };
>>>> -
>>>> -        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>>> -            compatible = "shared-dma-pool";
>>>> -            reg = <0x00 0x9c900000 0x00 0x01e00000>;
>>>> -            no-map;
>>>> -        };
>>>>       };
>>>
>>> This is missing the edgeAI specific remote-core carveouts and RTOS- 
>>> to-RTOS IPC memory regions [1] being used by edgeAI firmwares which 
>>> come as pre-packaged in the official SDK release for AM62A.
>>>
>>> There is only one official SDK release for AM62A (which is edgeAI 
>>> based) [2] which packages these edgeAI remoteproc firmwares and in my 
>>> view it is a fair expectation that remote core careveouts in device- 
>>> tree should align with firmwares released in SDK.
>>>
> 
> Why should Linux upstream care about what we do in our current evil 
> vendor SDKs?

These carveouts are specific to remote-cores and so have to match with 
firmwares running in these remote-cores. The debate is on which 
firmwares it should match to. The firmwares being packaged in SDK are 
the most used-ones and so in my view it is safe to account them as the 
official ones, unless of-course there is a major overhaul and 
re-architecture planned and accepted for these firmwares in which case 
we should wait for it.

> We change things around every cycle, and do all kinds of hacky things to 
> just
> "make it work" for the current SDK release.
> 

I don't see any changes done in memory map for last set of releases, but 
agreed if there is big architecture change planned for these firmwares 
then we should rather wait for updated firmwares then adding bloated 
carve-outs.

>>> This is because most developers (including me) and vendors download 
>>> this official SDK release and use it with latest upstream kernel and 
>>> modules (right now we are applying required patches locally) and this 
>>> patch won't suffice for this, in-fact it won't work since the 
>>> remoteproc firmwares are already using regions beyond the reserved- 
>>> regions from this patch.
> 
> Then that firmware team should fix their firmware, Linux should not
> do things just because some builds of a firmware did the wrong thing.

Maybe some optimizations would be missing, but carve-outs for lot of 
things which these firm-wares do out-of-box (and not even related fully 
to AI) are missing. For e.g. there is RTOS-to-RTOS IPC test which runs 
on startup and there is no reserved region for same, this would lead to 
tricky failures. The DM R5 remote core also controls ISP, but all 
required regions for same are also not present either.

> 
> Just a random example from the top of my mind here, a while back
> someone on the codec firmware team decided to take the standard RPMSG
> name service structure and modify it to suit some specific usecase
> they had, suddenly all the firmware we made for AM57x devices stopped
> working on upstream kernels. Instead of fixing the firmware we just
> carried a hack for the same in our vendor kernel trees. Now customers
> have no path to use this old firmware on newer kernels as adding the
> hack to upstream Linux (rightly) failed [0].
> 
> Let's not do that again, if we have firmware that doesn't follow
> upstream, then let's fix the firmware, not hack around it upstream.
> 
> The edgeAI firmware folks have no issue ignoring existing upstream
> IPC carveouts and simply replacing them all with their own custom
> ones in their SDK[1], I see no reason they cannot continue doing that
> if they don't want to fix their firmware.
> 

There is no apples-to-apples comparison with TDA4VM, unlike AM62A7 it 
offers SDK for both edgeAI and generic Linux [1], so if someone just 
uses latest upstream kernel and device-tree with this generic linux SDK, 
that would still work without any overlays applied or carveouts added. 
Same is not true for AM62A, as AM62A offers only edgeAI SDK with 
firmwares packaged for AI use-cases. So if someone, just replaces latest 
upstream kernel and device-tree with the patches from this series in 
edgeAI wic image, it won't work cleanly due to missing carve-outs.

Also even if we keep aside edgeAI, basic camera+ISP use-case won't work 
without the carveouts and we would prefer not to clone another layer to 
grab the overlay and apply it every-time we want to test run camera+ISP 
(and even the edgeAI use-case) on AM62A which would be a pain.

>>
>> I understand your point, currently with this patch remoteproc loading
>> will not work for some cores. However, the goal here is to standardize
>> as much as possible the memory carveout sizes, push the "demo firmware"
>> to request resources the correct way from resource table, and move away
>> from this dependency and limitations that we have with our firmware.

I understand this, but my view is that w.r.t firmware only goal should 
not just be tp demonstrate correct way of requesting resources from 
resource-tables, optimize the carve-outs etc but also to demonstrate the 
primary use-cases (camera+ISP+edgeAI) which the device is capable of.

>> should soon be able to generate our own firmware using Zephyr,  which
>> Andrew is pioneering, so with this firmware we should move to the
>> correct direction upstream. Downstream we are still using the memory
>> carveout sizes that the firmware folk want so desperately to keep, for
>> now..
>>
> 
> +1
> 
> I have this Zephyr based firmware for AM62A working and it uses the
> standard IPC regions as specified in this patch. I'll be posting the PR
> for it in Zephyr upstream by the end of week.
> 

I understand this, but will this zephyr based firmware support vision + 
edgeAI analytics ? Does it demonstrate all the unique capabilities of 
AM62A SoC ? If not, then what would be utility of such firmware on AM62A 
where these are the primary use-cases w.r.t AM62A ?

Why should upstream device-tree use carve-outs which match to this demo 
zephyr based firmware (which apparently not many are using and is not 
going into any official SDK release) instead of official firmwares going 
into SDK ? SDK released firmwares are being used by so many customers 
and SDK documentation maps to it, but zephyr firmware that is being 
pitched here, who would be the potential users and what would be it's 
utility ?

[1]: https://www.ti.com/tool/PROCESSOR-SDK-J721E

Regards
Devarsh

> For this patch as it is:
> 
> Acked-by: Andrew Davis <afd@ti.com>
> 


> Andrew
> 
> [0] https://lore.kernel.org/lkml/20241011123922.23135-1-richard@nod.at/
> [1] https://git.ti.com/cgit/edgeai/meta-edgeai/tree/recipes-kernel/ 
> linux/linux-ti-staging/j721e-evm/0001-arm64-dts-ti-Add-DTB-overlays-for- 
> vision-apps-and-ed.patch?h=kirkstone
> 
>> ~ Judith
>>
>>>
>>> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/ 
>>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=ti-linux-6.6.y-cicd#n103
>>> [2]: https://www.ti.com/tool/PROCESSOR-SDK-AM62A
>>>
>>> Regards
>>> Devarsh
>>>
>>>>       opp-table {
>>>> @@ -741,3 +771,57 @@ dpi1_out: endpoint {
>>>>           };
>>>>       };
>>>>   };
>>>> +
>>>> +&mailbox0_cluster0 {
>>>> +    status = "okay";
>>>> +
>>>> +    mbox_r5_0: mbox-r5-0 {
>>>> +        ti,mbox-rx = <0 0 0>;
>>>> +        ti,mbox-tx = <1 0 0>;
>>>> +    };
>>>> +};
>>>> +
>>>> +&mailbox0_cluster1 {
>>>> +    status = "okay";
>>>> +
>>>> +    mbox_c7x_0: mbox-c7x-0 {
>>>> +        ti,mbox-rx = <0 0 0>;
>>>> +        ti,mbox-tx = <1 0 0>;
>>>> +    };
>>>> +};
>>>> +
>>>> +&mailbox0_cluster2 {
>>>> +    status = "okay";
>>>> +
>>>> +    mbox_mcu_r5_0: mbox-mcu-r5-0 {
>>>> +        ti,mbox-rx = <0 0 0>;
>>>> +        ti,mbox-tx = <1 0 0>;
>>>> +    };
>>>> +};
>>>> +
>>>> +&wkup_r5fss0 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&wkup_r5fss0_core0 {
>>>> +    mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>>>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>>>> +            <&wkup_r5fss0_core0_memory_region>;
>>>> +};
>>>> +
>>>> +&mcu_r5fss0 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&mcu_r5fss0_core0 {
>>>> +    mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
>>>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>>>> +            <&mcu_r5fss0_core0_memory_region>;
>>>> +};
>>>> +
>>>> +&c7x_0 {
>>>> +    mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
>>>> +    memory-region = <&c7x_0_dma_memory_region>,
>>>> +            <&c7x_0_memory_region>;
>>>> +    status = "okay";
>>>> +};
>>>
>>
> 

