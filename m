Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000871946BC;
	Tue, 22 Apr 2025 04:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745294951; cv=none; b=Z9Y5dTJARkdHEytl6NHC0VkHv7/VJJnRop/am/hO5AqF+arpkf8Kk3U05vTF9K2ds4unWEqrrKisP4NIgMDn3IufTAc5Z9AJIu5aigLo7E++a4JWtCs9Ql1gT8HHwV5cWG4fMdgm+X1WmX0TkdGXxAfdxGl0b4DiW+YfFfCfYXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745294951; c=relaxed/simple;
	bh=oGXyR1DBKZUps0EBd6i0V1Gw2kgYtzNBYJVMJvOvhkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K9HTGrYqkAw3S++oJkykT2A7uOW+CZjaEtSBWHN4y7LtyEIQ70XuPQumYRMvOmjgDNdR2X5H+4oUUD5eUvc0CXeIta773lZqgmqvNRUz9/vuoxZpDKMZs0ZRwIndmYgS1TelO5Q9oSFQMjUozqL4dljLfWedNvF47VCggb8KlTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BnM8LZde; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BnM8LZde"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M490q01109644
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 23:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745294940;
	bh=TCR9027wx+fa73a2CKan1hN/qQLJy2DiiVy5PdCfoiA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BnM8LZdeBhUvDtAJfzRmKJQzxmgTosYauVK1tXkeBXgkmLgDJ+IcgNZv9NgPYJcuv
	 VF73WhOTjixI19/obkdmQ0C8UbErGX3CuMEz1VE70CogcA/WDkr3hl5dJZgsERA4Tx
	 k7svP7MPvz2hM9Mle51oD7gTH2q7/iFfn4W4fkd4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M490lB006551
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 23:09:00 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 23:09:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 23:09:00 -0500
Received: from [172.24.18.98] (lt5cd2489kgj.dhcp.ti.com [172.24.18.98])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M48udu066347;
	Mon, 21 Apr 2025 23:08:57 -0500
Message-ID: <6ae233c8-6401-4aba-b0f2-55468d375721@ti.com>
Date: Tue, 22 Apr 2025 09:38:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-2-jm@ti.com>
 <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
 <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Thanks Judith

On 4/21/2025 8:06 PM, Judith Mendez wrote:
> Hi Udit,
>
> On 4/19/25 10:00 AM, Kumar, Udit wrote:
>>
>> On 4/18/2025 5:00 AM, Judith Mendez wrote:
>>> Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
>>> for eMMC. This change is necessary since DM is not implementing the
>>> correct procedure to switch PLL clock source for eMMC and we have a
>>> non-glich-free mux. To remove any potential issues, lets switch back to
>>> the defaults.
>>
>> IMO, we need to fix DM  if not then documentation [0] .
>
> DM cannot be fixed for only one IP and documentation says what clock
> parents are supported, it does not have to say what are the issues
> that come with using a specific clock parent.
>
>>
>> Then only this patch is ok because as per document [0]
>>
>> removed clock by this patch is valid parent for eMMC.
>
> The clock parent currently set is a valid parent, but we have non-
> glitch-free muxes and to avoid any potential issues with these, we
> should switch back to the defaults. It seems like we randomly switched
> from the default for no good reason and it has been copy paste per
> platforms since then, so we are switching back to the defaults now.
>
So, if you are saying parent 
3(DEV_MMCSD0_EMMCSS_XIN_CLK_PARENT_POSTDIV4_16FF_MAIN_0_HSDIVOUT5_CLK)
and 
4(DEV_MMCSD0_EMMCSS_XIN_CLK_PARENT_HSDIV4_16FFT_MAIN_2_HSDIVOUT2_CLK) 
can produce a glitch while
clock selection then we should document that in clocking section,
and with note, what care to be taken when above are selected as parent.
Thanks
Udit
> ~ Judith
>
>>
>> [0] 
>> https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j722s/clocks.html
>>
>> Thanks
>>
>> Udit
>>
>>>
>>> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral 
>>> nodes")
>>> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0 
>>> instance")
>>> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more 
>>> IPs")
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>>>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>>>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>>>   3 files changed, 6 deletions(-)
>>>
>>> [..]
>
