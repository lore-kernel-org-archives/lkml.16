Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069C9B652;
	Tue, 27 May 2025 06:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748326194; cv=none; b=K1spMwtuV4oHhZ69lVtXhRoHaI6uvqUKH3M1n3o/S6Cssf/9L60Vj+mk6lgXonIV9DshKs46IX4k2EFRt1GmWpCkPnPOPMRDEN1iWxHi6qZimOSxbVo1eOz87uwbf9OzxFX08fKhTLt2dQst+E7BPEU48mOt1+/mmGy1h0zxw+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748326194; c=relaxed/simple;
	bh=+QJhA4xZZrqZF76UlW4CpQg8WuRWDKQtHoBgV3ZAdkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nFLr0UxDrm0rss/aq7NRKIAfJQVZVufOxYsNfY5mvv5OhCy/kx8wi0ntbk+4PHHx4/QARQEeA763XZPRRzqKiJPq3uhW1tYSHdofCj7xEQOdnSd0pndk/AJ6+on1FMMrO+SVJDpgE3t1V595Rjjb8nCqvmuRAkUWyEJKbrn6ee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l7PdZEVJ; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l7PdZEVJ"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54R69TvK1727754;
	Tue, 27 May 2025 01:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748326169;
	bh=K4ItIPSJUGERVzjcCNVhaNRtlv0U16ButxZn5MruJDA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=l7PdZEVJKM8tLGoqqv9QMyLm4efTu7Y9eivAvafzJtpeapmVWfLdRGVVSx+AB3p7r
	 SFSIgrQ7jYxq0/KhI9Ozoe3glTq2te7xt+4g4nCPa/qv7lNAKUytjCro9+WHHyzuQx
	 JCAXpl1l0qvEJYIj7MHz43jmYziWFBGqlnvNCvQw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54R69TSK2426125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 27 May 2025 01:09:29 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 May 2025 01:09:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 May 2025 01:09:28 -0500
Received: from [172.24.27.188] (ltpw0bk3z4.dhcp.ti.com [172.24.27.188])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54R69N4m3173133;
	Tue, 27 May 2025 01:09:24 -0500
Message-ID: <15b5d4c8-17fc-46b7-9d2c-d32f944fa47b@ti.com>
Date: Tue, 27 May 2025 11:39:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] TI: K3: Switch MCU R5F cluster into Split mode
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250522073426.329344-1-b-padhi@ti.com>
 <20250522155338.gpbcubkvygtju3qc@bagpipe>
 <5cfaed26-28ec-42dc-b9f6-836869ad3fa3@ti.com>
 <20250523114822.jrv73frz2wbzdd6d@falsify>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250523114822.jrv73frz2wbzdd6d@falsify>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth,

On 5/23/2025 5:18 PM, Nishanth Menon wrote:
> On 14:27-20250523, Beleswar Prasad Padhi wrote:
>> Hi Nishanth,
>>
>> On 5/22/2025 9:23 PM, Nishanth Menon wrote:
>>> On 13:04-20250522, Beleswar Padhi wrote:
>>>> Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
>>>> R5F cluster in the MCU domain which is configured for LockStep mode at
>>>> the moment. Switch this R5F cluster to Split mode by default in all
>>>> corresponding board level DTs to maximize the number of R5F cores.
>>> Why? I can read the patch to understand what you are trying to do, but
>>> the rationale needs to be explained.
>>
>> Sure, rationale is lot of users of our SoCs want to control the R5 core in
>> the MCU domain as a general purpose remote processor to increase
>> performance. That means able to load applications from
> This follows the board, then?
>
>> bootloader/kernel/userspace, poweroff/poweron core at runtime etc. The
>> challenge with this is the MCU R5F cluster is reserved to run the central
>> Device Manager (DM) Firmware.
>>
>> However, since the MCU R5F cluster is lockstep enabled, it supports both
>> lockstep mode and split mode of booting. So here we decide to boot the
>> cluster in split mode by which we can reserve the primary core to run DM and
>> use the secondary core as a general purpose remote processor.
>>
>> Now why didn't we do this split mode booting since the inception? Well
>> because MCU R5F Cluster is booted by ROM code, and when ROM boots it in
>> split mode, it powers on the secondary core and puts it in WFI (as there is
>> nothing to do for it yet). But the standard remoteproc drivers in Linux and
>> other bootloaders can only load firmware on a core if it is powered off/held
>> in reset. So there was some plumbing needed to be done at the bootloader
>> stage to actually poweroff the secondary core in split mode; so that
>> remoteproc drivers can then load & control the core as expected. Now that
>> the plumbing[0] is posted for U-Boot, we can switch to split mode booting
>> here in DT.
>>
>> [0]: https://lore.kernel.org/all/20250522071828.285462-1-b-padhi@ti.com/
> In effect, you are saying there are two set of usage models: one in
> split and other in lock-step mode. U-Boot support for split mode was
> missing and hence was not done yet. The benefit for users is the option
> to get an extra processor to do what ever extra stuff they want to do.


Yes...

>
>>>> Corresponding support to shutdown MCU R5F core 1 on SoC power on have
>>>> been posted in U-Boot:
>>>> https://lore.kernel.org/all/20250522071828.285462-1-b-padhi@ti.com/
>>>>
>>>> While at it, correct the firmware-name property for MCU R5F cores of
>>>> J742S2 SoC in [PATCH 1/2].
>>>>
>>>> Testing Done:
>>>> 1. Tested that each patch does not generate any new warnings/errors.
>>>> 2. Build test on all existing TI K3 platforms.
>>>> 3. Tested U-Boot and Linux load of MCU R5F core in split mode on all
>>>> applicable boards (AM68-SK, AM69-SK, J7200-EVM, J721E-EVM, J721S2-EVM,
>>>> J784S4-evm, J742S2-EVM)
>>>>
>>>> Test logs:
>>>> https://gist.github.com/3V3RYONE/ee8e3cb9aa5f4c5c00b059b9c14bfa98
>>>>
>>>> Thanks,
>>>> Beleswar
>>>>
>>>> Beleswar Padhi (2):
>>>>     arm64: dts: ti: k3-j742s2-mcu-wakeup: Override firmware-name for MCU
>>>>       R5F cores
>>>>     arm64: dts: ti: k3: Switch MCU R5F cluster to Split-mode
>>> NAK! We are once again churning downstream users again and for what
>>> reason - coverletter and the patch is vague on that!
>>>
>>> I would prefer the entire remote proc dts stuff cleaned up once for all
>>> in a comprehensive series.
>>>
>>> Let me be clear (once again): We DO NOT break backward compatibility.
>>> We do not break downstream users without a clear cut rationale. We do
>>> not break all other ecosystems depending on device tree without a very
>>> very solid reason.
>>
>> I don't understand how this is breaking any backward compatibility. We are
>> not removing the lockstep boot support entirely here. We are just switching
>> to Split boot by default because of the usecases. If not today, someday we
>> have to go with split mode booting by default.
>>
>> That's exactly what we did for the MAIN domain R5F clusters: 1. First we did
>> the plumbing to have power synchronization between the cores of a cluster:
>> https://lore.kernel.org/all/20240430105307.1190615-1-b-padhi@ti.com/ 2. Then
>> we switched the Cluster to boot in split mode by default:
>> https://lore.kernel.org/all/20240826093024.1183540-1-b-padhi@ti.com/
>>
>> Now, for users who prefer to use the fault-tolerant lockstep mode, they can
>> still do that by setting `ti,cluster-mode` property to 1. However, I agree
>> that we should not be doing 'hardware configuration' (split vs lockstep) in
>> Device Tree which is supposed to be 'hardware description'. We have started
>> to explore solutions where we can dictate this lockstep vs split core
>> configuration from the firmware itself during runtime. Once that is done
>> (long way to go thinking of upstream), we can get rid of this configuration
>> from the DT entirely.
> Please add this explanation to your patch. In addition, when you say
> arm64: dts: ti: k3*: in subject line (implies you are touch soc dtsi)
> and when co-related to the U-boot patch[1], it is confusing to know if
> you have the same SoC dtsi change yet to be posted where you switch
> from ti,cluster-mode = <1> to <0> - I am concerned if downstream board
> dts files will have to consume the firmware names differently.


firmware names should not be a problem. If downstream users decide to 
boot with lockstep as default, in effect there will be only one 
processor, and the primary firmware will be loaded into the CPU.

> This is
> the reason to ask for a comprehensive list of patches for the remote
> proc. If a downstream device board dts can continue to move to newer
> kernel revisions with no mods, you should state so in your commit
> message.


Other than ti,cluster-mode, no mods...

> There is all kinds of side implications with memory carveouts
> etc for a new processor that has to be factored in as well.
>
> Btw, [2] sounds like a bug fix.. So follow the stable kernel rules.


It is a fix, but not so critical that it should be backported to stable 
Kernels. That's because:

a. The primary core's firmware-name/path does not matter in DT here, as 
it is packed in the bootloader images and that core can not be loaded 
from anywhere else (DM core).
b. The support to boot this cluster in Split mode has just been posted 
now. So users might not be able to load/boot the secondary core before 
this support.

So I think fixing it in mainline is good enough as the support is also 
added now. Do you think we should add Fixes tag here?

>
> I suggest the following:
> * SoC dts files - use a common standard for remote proc - lockstep makes
>    sense as it is right now
> * Modification to board specific dts files - call them out as board
>    files specific patches to flip over to split mode - while considering
>    the possibilities that users may NOT upgrade kernel and bootloader at
>    the same time and the existence of EFI based dtb handover from
>    bootloader to kernel - which means, kernel should be able to handle the
>    same combinations correctly.


The Kernel remoteproc driver handles that correctly by checking the CPU 
registers to see if it is in split mode[3]. If the bootloader was not 
able to boot this cluster in split mode, but the Kernel/bootloader DT 
says "ti,cluster-mode = 0", the driver forces it to boot in lockstep mode.

>   Also handle the carveouts correctly for
>    the new processors - at least state the strategy - overlays etc.. Come
>    to think of it, I think we should fix up the carveout strategy for
>    user programmable remote cores first before attempting all this new
>    processor additions.


This is not really a new processor, its just a split CPU. As such we 
already have the carveouts for this split CPU upstreamed[4].

Do you want to see new overlays (containing mailbox configuration, timer 
configuration, mem carveouts) for each of the board? Because each board 
has a separate set of configuration for IPC.

> * Split out the fixes patches separately out - no reason to mix it up
>    with the rest of the refactoring.


This was a minor fix, and it essentially was only needed when we added 
split support for all SoCs, so I clubbed them together...

> * Fix your commit messages and subject lines to indicate clearly what is
>    impacted, rationale, backward compatibility status
>
> [1] https://lore.kernel.org/all/20250522071828.285462-7-b-padhi@ti.com/#Z31dts:upstream:src:arm64:ti:k3-j7200-mcu-wakeup.dtsi
> [2] https://lore.kernel.org/all/20250522073426.329344-2-b-padhi@ti.com/

[3]: 
https://github.com/torvalds/linux/blob/master/drivers/remoteproc/ti_k3_r5_remoteproc.c#L1153 
[4]: 
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi#L47-L57

Thanks, Beleswar

