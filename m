Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E53F52F88;
	Fri, 25 Apr 2025 22:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618526; cv=none; b=C+iPN+0XyLaVzjPWg6StiCXQ7u+EYDo8w3flCSSyeXLsk20BFWZAVldCIyN89EGwXON/vIqEW6rHe3KxLhhelFbrcifbzobfykqt/3hElUzOtPUXPDr9b6EHOd81HZYN1pQNG2r9ewJgTRQ9iMR41wtbTkknbSi2teykfgPeTFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618526; c=relaxed/simple;
	bh=47rmLKtnGjewfFqFrsBo/SrGrrhBbAjwXFmLr+zgxKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nKZx7NREEvRXN462AXj2rvxzgrfLG2YEwNlQYhKQf+FCZlN/EI43ZSfhTkYdWPl9u3MXu4ucIWQxhCvIfA6w7HBUJjelH/hCCud0YOXpOltYUzjog/+9IWqUB7g9GFbjDM45MQ2CoaqzVQEkMvA34Ftn8l6HBDbxsH0WbY4U/yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xd/eE53s; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xd/eE53s"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PM1uFn2287326
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 17:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745618516;
	bh=O9lhtYObgqPTwdDifBn0tG15p9vSULA3BvKuIwZYurg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xd/eE53s+qb+/JKoPpNCDN4RJxGsVZL9EvhtvgdtA7UnmpJmenT5hIH702jyb+oSE
	 50/lVw92AO0tPo/heSsflJHktEk1TJ9Wc3ULkl9pcH6WMO0MC6LBq6ipy7jFTTGNIZ
	 lkGTVQ8vyp/Qr4kWgBbKAUS4tWpWpUneOO5SfqXU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PM1uGb013085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 17:01:56 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 17:01:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 17:01:55 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PM1tQb026268;
	Fri, 25 Apr 2025 17:01:55 -0500
Message-ID: <965765c3-324f-4621-bbd6-b55f6eb44d1d@ti.com>
Date: Fri, 25 Apr 2025 17:01:55 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
To: Nishanth Menon <nm@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-2-jm@ti.com>
 <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
 <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
 <20250422123748.ugkk2pzp54vzmyii@acorn>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250422123748.ugkk2pzp54vzmyii@acorn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth,

On 4/22/25 7:37 AM, Nishanth Menon wrote:
> On 09:36-20250421, Judith Mendez wrote:
>> Hi Udit,
>>
>> On 4/19/25 10:00 AM, Kumar, Udit wrote:
>>>
>>> On 4/18/2025 5:00 AM, Judith Mendez wrote:
>>>> Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
>>>> for eMMC. This change is necessary since DM is not implementing the
>>>> correct procedure to switch PLL clock source for eMMC and we have a
>>>> non-glich-free mux. To remove any potential issues, lets switch back to
>>>> the defaults.
>>>
>>> IMO, we need to fix DM  if not then documentation [0] .
>>
>> DM cannot be fixed for only one IP and documentation says what clock
>> parents are supported, it does not have to say what are the issues
>> that come with using a specific clock parent.
> 
> As I understand the arasan IP requirement is that the IP must be held in
> reset while the clock is switched, which is not reasonable to implement
> given decoupled systems like DM and Linux OS.
> 
>>
>>>
>>> Then only this patch is ok because as per document [0]
>>>
>>> removed clock by this patch is valid parent for eMMC.
>>
>> The clock parent currently set is a valid parent, but we have non-
>> glitch-free muxes and to avoid any potential issues with these, we
>> should switch back to the defaults. It seems like we randomly switched
>> from the default for no good reason and it has been copy paste per
>> platforms since then, so we are switching back to the defaults now.
>>
>> ~ Judith
>>
>>>
>>> [0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j722s/clocks.html
>>>
>>> Thanks
>>>
>>> Udit
>>>
>>>>
>>>> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral
>>>> nodes")
>>>> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0
>>>> instance")
>>>> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more IPs")
> 
> Please follow ./Documentation/process/stable-kernel-rules.rst - this is
> easier to backport if these were to be split into 3 different patches.
> Please do not forget to add Cc: stable@vger.kernel.org as per the rules
> as well.

Understood, will split-up this series and respin, thanks.

~ Judith

> 
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>> ---
>>>>    arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>>>>    arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>>>>    arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>>>>    3 files changed, 6 deletions(-)
>>>>
>>>> [..]
>>
> 

