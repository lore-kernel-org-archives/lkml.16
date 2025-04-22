Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF3B1DFE8;
	Tue, 22 Apr 2025 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745342528; cv=none; b=bHq75sAB+++t+koLQ6PIb8hDL/Uu1rCqhPZv1NBYmvx3e7zCEFmqiErDQJcXadcjBKu56loh41nwjdI24bUuR9jKhIZ+onV7HXLHra32b5F1HXlwOLYjf/gtzvZssT0A4lZmgY7F6vFI/v6Q2FuEjgpypGN9jNezOt+1by1XTzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745342528; c=relaxed/simple;
	bh=zJSp/bwOXvMhRdez26eGJNJp6+8CfDXPIfIKPinG9EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nQDB7g+aYj+e5r4CJrf1li2MihpxXtp5v1qSGsdeXOvW18gF1TxIy+0pQ9IR5XPuisCRLwrgBC67quArviAMX511LvyZOxMr4u0fcWxMikPeayq/78cYVptfQe8nxrttgVxnA0UvpWqBNBQMlCO/F6PHpYSH5wRaxefTqzvXefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GYVzVM61; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GYVzVM61"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MHLv7s2043117
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 12:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745342517;
	bh=3FN6UjMSqo2ohgR4GHz37K0iMMwOg2nEdtLQZximw+4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GYVzVM61vqBpGKeassa+KWQrnDPvxNzNJqxioDQNTf1IYLbUiImLo/bqL8kSc0yZ0
	 wRJLDA9ehWw1P/ozLjuZlYz6emtyazHV6R2PuXYvSoS5qIJ7qUw8HNvcnlrPqVwu6l
	 LjgVT4jXWn9UnF1zQDcUfxeoJZkfdCwpiFWs8P4o=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MHLvO1079038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 12:21:57 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 12:21:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 12:21:56 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MHLrMa092939;
	Tue, 22 Apr 2025 12:21:53 -0500
Message-ID: <8c801213-2ca7-4336-a8a2-05d43a4a9251@ti.com>
Date: Tue, 22 Apr 2025 22:51:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-2-jm@ti.com>
 <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
 <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
 <20250422123748.ugkk2pzp54vzmyii@acorn>
 <12a748ff-2c33-44e7-b685-fa7d7d0138ca@ti.com>
 <9726c8c5-5702-4e03-94fc-eaa820f8cdf3@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <9726c8c5-5702-4e03-94fc-eaa820f8cdf3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/22/2025 10:47 PM, Judith Mendez wrote:
> Hi Udit,
>
> On 4/22/25 9:08 AM, Kumar, Udit wrote:
>>
>> On 4/22/2025 6:07 PM, Nishanth Menon wrote:
>>> On 09:36-20250421, Judith Mendez wrote:
>>>> Hi Udit,
>>>>
>>>> On 4/19/25 10:00 AM, Kumar, Udit wrote:
>>>>> On 4/18/2025 5:00 AM, Judith Mendez wrote:
>>>>>> Set eMMC clock parents to the defaults which is 
>>>>>> MAIN_PLL0_HSDIV5_CLKOUT
>>>>>> for eMMC. This change is necessary since DM is not implementing the
>>>>>> correct procedure to switch PLL clock source for eMMC and we have a
>>>>>> non-glich-free mux. To remove any potential issues, lets switch 
>>>>>> back to
>>>>>> the defaults.
>>>>> IMO, we need to fix DM  if not then documentation [0] .
>>>> DM cannot be fixed for only one IP and documentation says what clock
>>>> parents are supported, it does not have to say what are the issues
>>>> that come with using a specific clock parent.
>>> As I understand the arasan IP requirement is that the IP must be 
>>> held in
>>> reset while the clock is switched, which is not reasonable to implement
>>> given decoupled systems like DM and Linux OS.
>>
>>
>> Thanks , then fix should be extended to sdhci1 as well
>
> sdhci1 and sdhci2 should already be using the defaults: 
> https://gist.github.com/jmenti/e280232ae3d5bb5097df7b0f04c85e8a
> This change is only needed for eMMC.
>
> ~ Judith

Ok, thanks for confirmation


Acked-by: Udit Kumar <u-kumar1@ti.com>


>
>>
>>
>>>
>>>>> Then only this patch is ok because as per document [0]
>>>>>
>>>>> removed clock by this patch is valid parent for eMMC.
>>>> The clock parent currently set is a valid parent, but we have non-
>>>> glitch-free muxes and to avoid any potential issues with these, we
>>>> should switch back to the defaults. It seems like we randomly switched
>>>> from the default for no good reason and it has been copy paste per
>>>> platforms since then, so we are switching back to the defaults now.
>>>>
>>>> ~ Judith
>>>>
>>>>> [0] 
>>>>> https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j722s/clocks.html 
>>>>>
>>>>>
>>>>> Thanks
>>>>>
>>>>> Udit
>>>>>
>>>>>> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral
>>>>>> nodes")
>>>>>> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0
>>>>>> instance")
>>>>>> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for 
>>>>>> more IPs")
>>> Please follow ./Documentation/process/stable-kernel-rules.rst - this is
>>> easier to backport if these were to be split into 3 different patches.
>>> Please do not forget to add Cc: stable@vger.kernel.org as per the rules
>>> as well.
>>>
>>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>>> ---
>>>>>> arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>>>>>> arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>>>>>> arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>>>>>>    3 files changed, 6 deletions(-)
>>>>>>
>>>>>> [..]
>
