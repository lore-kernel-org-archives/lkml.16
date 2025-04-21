Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E701F09A3;
	Mon, 21 Apr 2025 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745267319; cv=none; b=d0RpNVurzM88lcg62258A+MhCt3omioMT7DjpBaLJmP8kkTcA79MqjOyvcBP68ILElWZDM/CPOO9YG67zUq8tFKE3dNBgpD0+D4X+cYEgXy0xAPO1KJXkd7s0tgI03r/kmWBjaaOWIWqvGWqdwTeOKDLzmLUYdJbCT4m741MXGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745267319; c=relaxed/simple;
	bh=Qv3GiaigVBI8RPKceEvBVYMwHqbrAy4KnvBI0z9NFhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P7DcwM2GALso7DtR0co0f2i30vrRGWOgyRB90AEEqMWhz2uM/gcI1h5EvhFd9THfObdVFOMhmLjmop3mXrjYxqznpl8KO8585YJJihfkf+D5Z+450k7GpU+Z1rZd7wfdpsEm5z6lKPu/CVRA1TKUJlbj+yRXtDRHSc5DTpYnZ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jI0vGZgz; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jI0vGZgz"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LKSMbJ1001882
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 15:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745267303;
	bh=dnNkv6k8IQgenOO7joIG/X5SjFJOTCMWYPaYyeyB8aw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jI0vGZgzfkBCg/7x/3kb2wZu9pZDY3Gyo4heLUAjWkiJO+oTQW7PBDWGFKEEkEyIq
	 sBBeTcVb88g5cFUS9MD46viF0zT5RmVoWmkKIDtUIXFbUMNhmnyjPa5w3n1+fG+Krx
	 8fWIsK/Cy99SYqPDR3FsGT0YvRW9q2Qy0SQbM3cg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LKSMuq030210
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 15:28:22 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 15:28:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 15:28:22 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LKSLEn093699;
	Mon, 21 Apr 2025 15:28:21 -0500
Message-ID: <3f95eb2c-d9ea-4acd-a57f-3ffdd43fd505@ti.com>
Date: Mon, 21 Apr 2025 15:28:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Judith Mendez <jm@ti.com>, Bryan Brattlof <bb@ti.com>,
        Nishanth Menon
	<nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>,
        Beleswar Prasad <b-padhi@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-7-jm@ti.com>
 <20250419150451.v3jgtgp4yisou65u@bryanbrattlof.com>
 <20250421114042.riw2kw472murjzcc@surfer>
 <20250421162645.gkgthbl6t2xemnbz@bryanbrattlof.com>
 <54cbad41-3508-4ffa-99f5-df5618a8fd4c@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <54cbad41-3508-4ffa-99f5-df5618a8fd4c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/21/25 2:05 PM, Judith Mendez wrote:
> Hi Bryan,
> 
> On 4/21/25 11:26 AM, Bryan Brattlof wrote:
>> On April 21, 2025 thus sayeth Nishanth Menon:
>>> On 10:04-20250419, Bryan Brattlof wrote:
>>>> On April 15, 2025 thus sayeth Judith Mendez:
>>>>> From: Devarsh Thakkar <devarsht@ti.com>
>>>>>
>>>>> For each remote proc, reserve memory for IPC and bind the mailbox
>>>>> assignments. Two memory regions are reserved for each remote processor.
>>>>> The first region of 1MB of memory is used for Vring shared buffers
>>>>> and the second region is used as external memory to the remote processor
>>>>> for the resource table and for tracebuffer allocations.
>>>>>
>>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>> Acked-by: Andrew Davis <afd@ti.com>
>>>>> Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
>>>>> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96 +++++++++++++++++++++++--
>>>>>   1 file changed, 90 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>>> index 1c9d95696c839..7d817b447c1d0 100644
>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>>> @@ -52,6 +52,42 @@ linux,cma {
>>>>>               linux,cma-default;
>>>>>           };
>>>>> +        c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
>>>>> +            compatible = "shared-dma-pool";
>>>>> +            reg = <0x00 0x99800000 0x00 0x100000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>> +        c7x_0_memory_region: c7x-memory@99900000 {
>>>>> +            compatible = "shared-dma-pool";
>>>>> +            reg = <0x00 0x99900000 0x00 0xf00000>;
>>>>> +            no-map;
>>>>> +        };
>>>>> +
>>>>
>>>> I know this has been a push for our IPC and MCU+ teams for a couple
>>>> windows now, though I do want to point out that some AM62A devices
>>>> (AM62A12AQMSIAMBRQ1) will not even have a C7x.
>>>>
>>>> It's relatively easy to cut nodes out that describe the hardware in the
>>>> bootloaders, but once we start configuring them to demo something it
>>>> becomes impossible to unwind that during boot.
>>>>
>>>> We can clam we only support the superset devices but I just wanted to
>>>> make this email so I could point people to it when they inevitably ask
>>>> why their parts do not work out of the box with Linux.
>>>>
>>>> Naked-by: Bryan Brattlof <bb@ti.com>
>>>
>>>
>>> I am confused. I do not see support for AM62A1 in upstream. We have
>>> AM62A7-SK in upstream. I am not sure what direction you are suggesting
>>> here.
>>
>> All I'm trying to point out is for every part we upstream there are >10
>> times the number of parts that for one reason or another will not make
>> it to these upstream repositories.
>>
>> Most of these parts will have trivial changes like having lower CPU
>> counts, some will not have a GPU, MCU, PRU, or display, or maybe it's
>> just a package change and the thermal zones are different, or it's just
>> the speeds the IP can confidently run at, or it could be as simple as
>> DDR part changes. Each variant will be mostly the superset device with
>> one or two nodes disabled or modified in some way.
>>
>> For a while now, without configuring the remote cores to demo anything,
>> it's been relatively seamless to support these variants in the
>> bootloaders by disabling or modifying the nodes that do not exist so
>> Linux can at least boot to a shell and provides a great foundation for
>> others to start their development
>>
>> If we want to use these boards to demo a advanced usecases we can do
>> that but I worry it will come at the cost of supporting all the part
>> variants.
>>
>> My hope was we could define the board as minimally as possible here so
>> we can maximize their flexibility with what timers, mailboxes and memory
>> carve-outs each remote processor uses.
>>
> 
> Is it not agreed upon to support the superset device upstream? It seems
> like what we need is a detailed whitepaper on board bring-up for each
> part variant instead of NOT adding support for the superset device
> upstream approach.
> 

We would still support the superset device upstream, Bryan is simply
suggesting (correct me if I'm wrong) a different way of supporting
the superset device such that later adding support for the cutdowns
is less painful.

To this I 100% agree, and I've suggested the same before in
cases where we know a subset device is in the works. Sometimes
plans for a cutdown happen after we have added support and that
makes a bit of a mess (see J78424 / J742s2). Even when we know
this is going to happen we still make a mess of DT which we end
up having to clean up later (see AM62p / J722s).

Easy manipulation of the DT in this way was one of the promises
of "System Device Trees". Until we have that, the next best thing
is DT overlays. The solution here then is to factor out the components
we know will be conditional into a device tree overlays. These
overlays will be applied by default to form the superset DT as the
out-of-box supported device, while also allowing easy removal without
having the bootloader perform complex DT surgery. Win-Win

The plan we agreed on for this series (back in v2 IIRC) is to add
these items as part of the base board DT to match what is already
done for all our other devices. *then* we factor it out from all
devices in one go to make that series more coherent.

So if that sounds good, Bryan feel free to un-NAK this and we
we will be sure to make your task of supporting all these subset
devices much easier in the follow up series :)

Andrew
