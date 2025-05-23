Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0226E1DB366;
	Fri, 23 May 2025 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990684; cv=none; b=h8c3hwvgdXHFEUBwIh4dSjNqoo4t5VvdtYlm3mT5/j7ICjss2rbX6sZtNQ1LVrVfIfoPtDY/AMz2AS3dhfREm5yObxfPLk2mF5dOamYqYe/NB+hucoGi5WsTD37IWBW5ftFY+qYdgAN5TPfxoJjIFB7ZhsYCKxjMgiFG7cfStoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990684; c=relaxed/simple;
	bh=d7W1r3LIstZbYeoZfuyhfwQT9HfuZicMosylAkArLNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LLIv/9oQNQwWEeR+HJi91fo6UEp4YYbUkmOdxU1Hbj73+OwGbCVculjHMhi+oO97ks6If7x0it+dWrY+ONoCuvRnwRpv6FOArs55UewEO4jdLLr+nftWYoUZH/vLZ2KzHqd2X3bgUB+x/hJGL2NOCPSD19xnyLbCsB/7d/Nvavs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pGGk0s4n; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pGGk0s4n"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54N8vpwH902994;
	Fri, 23 May 2025 03:57:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747990671;
	bh=dvL8UvE8kTyU3pakYq1t1Av2K6VHG+lxt62YTy231JM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pGGk0s4nBS+kfza+T/LlvzeExl1Bvodi7ZFDGMlo2Tag9OeV0yO857ojW/FrxrcIw
	 PQ7ck5JIPoHFQRtBfGTi3FQGy9Plw2TxBebrAGtPXyEsBar7TCR89SSFGTaBuZoxBf
	 vkYcySBsH69XiwqWSLx6KDCiagbXPiVEdRAYw5Bg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54N8vo574154099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 03:57:51 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 03:57:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 03:57:50 -0500
Received: from [172.24.21.52] (ltpw0bk3z4.dhcp.ti.com [172.24.21.52])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54N8vjPe1139884;
	Fri, 23 May 2025 03:57:46 -0500
Message-ID: <5cfaed26-28ec-42dc-b9f6-836869ad3fa3@ti.com>
Date: Fri, 23 May 2025 14:27:44 +0530
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
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250522155338.gpbcubkvygtju3qc@bagpipe>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth,

On 5/22/2025 9:23 PM, Nishanth Menon wrote:
> On 13:04-20250522, Beleswar Padhi wrote:
>> Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
>> R5F cluster in the MCU domain which is configured for LockStep mode at
>> the moment. Switch this R5F cluster to Split mode by default in all
>> corresponding board level DTs to maximize the number of R5F cores.
> Why? I can read the patch to understand what you are trying to do, but
> the rationale needs to be explained.


Sure, rationale is lot of users of our SoCs want to control the R5 core 
in the MCU domain as a general purpose remote processor to increase 
performance. That means able to load applications from 
bootloader/kernel/userspace, poweroff/poweron core at runtime etc. The 
challenge with this is the MCU R5F cluster is reserved to run the 
central Device Manager (DM) Firmware.

However, since the MCU R5F cluster is lockstep enabled, it supports both 
lockstep mode and split mode of booting. So here we decide to boot the 
cluster in split mode by which we can reserve the primary core to run DM 
and use the secondary core as a general purpose remote processor.

Now why didn't we do this split mode booting since the inception? Well 
because MCU R5F Cluster is booted by ROM code, and when ROM boots it in 
split mode, it powers on the secondary core and puts it in WFI (as there 
is nothing to do for it yet). But the standard remoteproc drivers in 
Linux and other bootloaders can only load firmware on a core if it is 
powered off/held in reset. So there was some plumbing needed to be done 
at the bootloader stage to actually poweroff the secondary core in split 
mode; so that remoteproc drivers can then load & control the core as 
expected. Now that the plumbing[0] is posted for U-Boot, we can switch 
to split mode booting here in DT.

[0]: https://lore.kernel.org/all/20250522071828.285462-1-b-padhi@ti.com/

>
>> Corresponding support to shutdown MCU R5F core 1 on SoC power on have
>> been posted in U-Boot:
>> https://lore.kernel.org/all/20250522071828.285462-1-b-padhi@ti.com/
>>
>> While at it, correct the firmware-name property for MCU R5F cores of
>> J742S2 SoC in [PATCH 1/2].
>>
>> Testing Done:
>> 1. Tested that each patch does not generate any new warnings/errors.
>> 2. Build test on all existing TI K3 platforms.
>> 3. Tested U-Boot and Linux load of MCU R5F core in split mode on all
>> applicable boards (AM68-SK, AM69-SK, J7200-EVM, J721E-EVM, J721S2-EVM,
>> J784S4-evm, J742S2-EVM)
>>
>> Test logs:
>> https://gist.github.com/3V3RYONE/ee8e3cb9aa5f4c5c00b059b9c14bfa98
>>
>> Thanks,
>> Beleswar
>>
>> Beleswar Padhi (2):
>>    arm64: dts: ti: k3-j742s2-mcu-wakeup: Override firmware-name for MCU
>>      R5F cores
>>    arm64: dts: ti: k3: Switch MCU R5F cluster to Split-mode
> NAK! We are once again churning downstream users again and for what
> reason - coverletter and the patch is vague on that!
>
> I would prefer the entire remote proc dts stuff cleaned up once for all
> in a comprehensive series.
>
> Let me be clear (once again): We DO NOT break backward compatibility.
> We do not break downstream users without a clear cut rationale. We do
> not break all other ecosystems depending on device tree without a very
> very solid reason.


I don't understand how this is breaking any backward compatibility. We 
are not removing the lockstep boot support entirely here. We are just 
switching to Split boot by default because of the usecases. If not 
today, someday we have to go with split mode booting by default.

That's exactly what we did for the MAIN domain R5F clusters: 1. First we 
did the plumbing to have power synchronization between the cores of a 
cluster: 
https://lore.kernel.org/all/20240430105307.1190615-1-b-padhi@ti.com/ 2. 
Then we switched the Cluster to boot in split mode by default: 
https://lore.kernel.org/all/20240826093024.1183540-1-b-padhi@ti.com/

Now, for users who prefer to use the fault-tolerant lockstep mode, they 
can still do that by setting `ti,cluster-mode` property to 1. However, I 
agree that we should not be doing 'hardware configuration' (split vs 
lockstep) in Device Tree which is supposed to be 'hardware description'. 
We have started to explore solutions where we can dictate this lockstep 
vs split core configuration from the firmware itself during runtime. 
Once that is done (long way to go thinking of upstream), we can get rid 
of this configuration from the DT entirely.

Thanks, Beleswar

