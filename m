Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D49125A650
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738737459; cv=none; b=Hd0sRh5iZ6ARKShetMZUPdd313UWq9vXlkMS2nnH6MbFoyeMsMNmWek4Wbcc26OXAV03/iC/7I7s0TY5RqNGooS9C7aSE81Qyf0t+SMz1/Q1Kwhrc86hhEeWz8NOqZLJnkiy9MQa5D+cZuIHfSVwAlsfih9PAUeG0YEoudQZuM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738737459; c=relaxed/simple;
	bh=/yU/Iok0AKAEYzZl8kvoN544r4p3j38bo3setf1ltHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QOPnbqGS1MMaiK6fu2eWPWpaAITx7VkS2VatwEhg4ocpCd/PgwjZ+MyID8J8ycrlffEqhfpewfHWrnyLOj3uSFa/9No+9lmqeYtdW48jvLllO54NDIZTl0D2W7UWzd8E7xRw+iLCBbXqwYE9yaelC/LA+yZptY0e51f2i+I2rMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HWdU2tAh; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HWdU2tAh"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5156b6ZM3370991
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 00:37:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738737426;
	bh=FDj3NqJSxEquaMNtZ7M6hmrY5ZBQE5yWhjVK5LOi0Tk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HWdU2tAhy/eIeKiWybEdEbIdddG4YZopyKsnndlfQAMAnob/wynAFt+YVLs5uETIu
	 HA3qxpmyfSQhqEq+jTkOGzMcaXdi9kIYKNrkEClHgtsGnFxbxOPuJEcFVZ8DrvrYFw
	 pvBjkHmJFNunhZIXqwk5rY8szPWaeiDtJp00Emgg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5156b6uT039156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 00:37:06 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 00:37:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 00:37:06 -0600
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5156avhs100252;
	Wed, 5 Feb 2025 00:36:58 -0600
Message-ID: <3fac45a1-07fb-4332-9f49-6a08bd953855@ti.com>
Date: Wed, 5 Feb 2025 12:06:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Enable TISCI Interrupt Router and
 Aggregator
To: Nishanth Menon <nm@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <nfrayer@baylibre.com>,
        <glaroque@baylibre.com>, <tglx@linutronix.de>, <u-kumar1@ti.com>
References: <20250203150801.2399555-1-vaishnav.a@ti.com>
 <CAMuHMdUOMCxfsOrUF3-6PX0ZZ_E2g1SK4bwDqZE=mWiibPFt1A@mail.gmail.com>
 <20250205035148.krqvlysv73d4wcgs@uncooked>
Content-Language: en-US
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <20250205035148.krqvlysv73d4wcgs@uncooked>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Geert, Nishanth,

On 05/02/25 09:21, Nishanth Menon wrote:
> On 08:42-20250204, Geert Uytterhoeven wrote:
>> Hi Vaishnav,
>>
>> Thanks for your patch!
>>
>> On Mon, 3 Feb 2025 at 16:08, Vaishnav Achath <vaishnav.a@ti.com> wrote:
>>> Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
>>> These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
>>> for core functionality like DMA, GPIO Interrupts which is necessary
>>> during boot, thus make them built-in.
>>>
>>> bloat-o-meter summary on vmlinux:
>>>          add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
>>>          ...
>>>          Total: Before=31615984, After=31778459, chg +0.51%
>>
>> My first thought was: that's a hefty size increase for two rather
>> small drivers!  So I enabled these two options in one of my own kernel
>> configs, and saw a size increase of only 7872 bytes...
>>
>>> Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
>>> Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
>>>
>>> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
>>> ---
>>>
>>> V1 : https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/
>>>
>>> V1->V2:
>>>          * Add Fixes tag.
>>>          * Add bloat-o-meter summary to commit message.
>>>
>>> Previously both of these configs were selected for ARCH_K3 in respective
>>> Kconfigs, but commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
>>> and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
>>> in dropped this recently without adding those back in arm64
>>> defconfig, this causes boot failure in all TI K3 platforms.
>>>
>>> Passing bootlog with configs enabled:
>>> https://gist.github.com/vaishnavachath/03d8d3ce0f22219643c2f4d1dd243fd1
>>>
>>>   arch/arm64/configs/defconfig | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index cb7da4415599..1f25423de383 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -1551,6 +1551,8 @@ CONFIG_PWM_VISCONTI=m
>>>   CONFIG_SL28CPLD_INTC=y
>>>   CONFIG_QCOM_PDC=y
>>>   CONFIG_QCOM_MPM=y
>>> +CONFIG_TI_SCI_INTR_IRQCHIP=y
>>> +CONFIG_TI_SCI_INTA_IRQCHIP=y
>>>   CONFIG_RESET_GPIO=m
>>>   CONFIG_RESET_IMX7=y
>>>   CONFIG_RESET_QCOM_AOSS=y
>>
>> However, on arm64 defconfig, this has indeed a much bigger impact,
>> as it also (re)enables several other drivers that depend on the
>> irqchip symbols.
>>
>> You probably want to mention that in the commit message...
> 
> Thanks Geert and I agree. This however just restores the status quo as
> it was in 6.13 tag kernel (and ofcourse the default boot status).
> 
> Will be good to mention that as well - in effect, we are just restoring
> the behavior, not introducing new features.
> 

Thank you for the feedback, I have sent a v3 with updated commit message 
mentioning the reason for size increase and that we are reinstating 
previous behavior, all the dependencies getting re-enabled were already 
part of the arm64 defconfig.

V3 - https://lore.kernel.org/all/20250205062229.3869081-1-vaishnav.a@ti.com/

Thanks and Regards,
Vaishnav

> Side note: We are still working towards fixing up other driver modules
> and some time in near future, hope to transition to initramfs boot as
> default in a single patch.. but till then let us maintain the status
> quo.
> 
