Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E36528CF53;
	Wed,  4 Jun 2025 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030925; cv=none; b=WmRYX7KXFLARjbD3d5zxVYeumqyT9otVo4VWWA/1fpDS+Ewe6vYVRDc5EbF/45i3OBtn/q5cc4O7Ih8UjHP+nS5yntxLqMF9e7LR8KnRZ9MDT3rLIe8d7HCThduL3pOTrhwpNaewQfqohLisE52GcNEx0JjgN0KqAlqTGB0ZZEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030925; c=relaxed/simple;
	bh=HOkYdD3VqmBtfOa+HAHSNsjkX5wCeLANE/uP59K485U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ivhrUGPPyyJ2bfyt1FloFmu2+L4w1fGR7FdQ0T87Ki8LKInKEGu+C6NJ1u3DEvj3LXBtNvry1eWTYeFxcSw++fLlYlTmWkE15weHpl9ui26y2mDt3mFvH77f/WHOjdhByDrXoXFo+5rY6Zf568+rwRyCQloyVnXlAAmvdGmSRRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JxuIgA5y; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JxuIgA5y"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5549tH283779467;
	Wed, 4 Jun 2025 04:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749030917;
	bh=n4rIj+lEGrxmq90HEJV5hfV3RbqS6xnOp3Ughx0TBsI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JxuIgA5y2U1me452IOx3/IPU1xliz94izbrHCoy1PpZ/QAE2ckWjqLJ38mbxlxk2d
	 mOBmoP1DuRDRJ4m4c6xw6NBGKBIOrKmL9GUSzgoqVNPHU/xKStusBcNbRRD4tFzNZp
	 7QX4DzCq/faqNNGmYA6bRAv+c4NTBWfxxEDp1S6o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5549tHFX066079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 04:55:17 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 04:55:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 04:55:16 -0500
Received: from [172.24.17.132] (lt5cd2489kgj.dhcp.ti.com [172.24.17.132])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5549tDEN1774749;
	Wed, 4 Jun 2025 04:55:14 -0500
Message-ID: <02f80914-80c7-4b8b-87e1-b48b8a8e7072@ti.com>
Date: Wed, 4 Jun 2025 15:25:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] arm64: dts: ti: k3-j784s4-mcu-wakeup: Configure
 wkup_uart0 with clock settings
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>
References: <20250603042448.783956-1-u-kumar1@ti.com>
 <20250603160147.47orn74obh2lz3qm@rethink>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250603160147.47orn74obh2lz3qm@rethink>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 6/3/2025 9:31 PM, Nishanth Menon wrote:
> On 09:54-20250603, Udit Kumar wrote:
>> From: Bhavya Kapoor <b-kapoor@ti.com>
>>
>> This commit adds the assigned-clocks and assigned-clock-parents
>> properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
>> property is set to reference the clock identified by
>> "wkup_usart_mcupll_bypass_out0", ensuring the UART operates with the
>> correct clock source.
>>
>> The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
>> as the parent clock. This configuration is critical for establishing
>> the proper clocking hierarchy, enabling the UART device to function
>> reliably across different baud rates.
> Please fix the commit message - not clear what specifically in the clock
> hierarchy does permit the multiple baud rates.

Thanks for review.

will address in v2, commit message and other comments as well


>
>> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> You need to add your SoB.
>> ---
>> Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/
> Also as Baleswar stated, the $subject needs to be fixed.
>>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
>> index 52e2965a3bf5..1146bc5990ea 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
>> @@ -310,6 +310,8 @@ wkup_uart0: serial@42300000 {
>>   		interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
>>   		clocks = <&k3_clks 397 0>;
>>   		clock-names = "fclk";
>> +		assigned-clocks = <&k3_clks 397 0>;
>> +		assigned-clock-parents = <&k3_clks 397 1>;
>>   		power-domains = <&k3_pds 397 TI_SCI_PD_EXCLUSIVE>;
>>   		status = "disabled";
>>   	};
>> -- 
>> 2.34.1
>>
