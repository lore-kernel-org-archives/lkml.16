Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400043987D;
	Thu, 30 Jan 2025 22:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738276831; cv=none; b=VuUeWs9n2K1qePTqogRboY4+7NuG0WbzxTfLYB/ni83HegTRmPNTQirru0YniGqgTKYQrPaeTx2mE+xYdiZnG541MxZMfOKzBW0890ny3rzCwRxsb5KmapmABsr5ityf+rLKUxkhoZnX8wmEx8Jy8VH7MjjnsvCWpR+aOBbs5O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738276831; c=relaxed/simple;
	bh=LD6NzYbyw8wYsWeOSqbINsKPuePnVnQvJryxR97ejxo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=CnAXuDhygzX+RPq+gulyESE92wuExJQmo+tflg/Saf6ahHvaKYEH3qNBITxQxwpsPcfclMFyHY2rLLO8GvIg20H/5Y55rvYWUX8y5yzqMTXV1X+UqOEOiFof2Rt+blTMiNCLx29TFg5UtznuomqjxuFk8mBuSWrwfMoiPt1WK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sW1vz/kJ; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sW1vz/kJ"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50UMeLj61558537
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jan 2025 16:40:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738276821;
	bh=w5FdDKxl0YKeB7HteFlvgLhQ09iS0vqq32PZTKFOdu8=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=sW1vz/kJh7HQ0uD6vYYFnFmIrH+zNxGIJV1skoQ9S9cj4y0xJ0h/H0ZL9dvd9UJlZ
	 EzM0TdRSjMEZlY7v1+g4YUT4WW/hWIB/l+nHVAk5igrm7WR+IAX8yqlIah6qlqt1BI
	 tL8ieukbsEWRMvyvBOsokxDaDmLqYoA554Qfr0c8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50UMeLJG117060;
	Thu, 30 Jan 2025 16:40:21 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 Jan 2025 16:40:20 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 Jan 2025 16:40:20 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50UMeKrR055087;
	Thu, 30 Jan 2025 16:40:20 -0600
Message-ID: <6ab56868-b2d2-4b8a-ac06-d0d35a5e8998@ti.com>
Date: Thu, 30 Jan 2025 16:40:20 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc
 node
From: Judith Mendez <jm@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Devarsh Thakkar <devarsht@ti.com>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>
References: <20250127221631.3974583-1-jm@ti.com>
 <20250127221631.3974583-3-jm@ti.com>
 <8b152f81-0848-4f34-adcb-fee9b4f2fd7f@ti.com>
 <76f9e9e8-dd7c-e783-fccc-0b6f913ce753@ti.com>
 <390aa52e-e9f2-4ce3-ad1b-eac71f4a211c@ti.com>
Content-Language: en-US
In-Reply-To: <390aa52e-e9f2-4ce3-ad1b-eac71f4a211c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 1/28/25 11:48 AM, Judith Mendez wrote:
> Hi Andrew,
> 
> On 1/28/25 10:52 AM, Hari Nagalla wrote:
>> On 1/28/25 10:27, Andrew Davis wrote:
>>>> +    mcu_r5fss0: r5fss@79000000 {
>>>> +        compatible = "ti,am62-r5fss";
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <1>;
>>>> +        ranges = <0x79000000 0x00 0x79000000 0x8000>,
>>>> +             <0x79020000 0x00 0x79020000 0x8000>;
>>>> +        power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
>>>
>>> Newline here.
>>>
>>> Also this should be default "disabled". It can be set to "okay"
>>> in the board DTS file when the needed mboxes and memory-region
>>> are set. Speaking of that, where are those patches? This is
>>> incomplete without them and these nodes will not function.
>>> Same for the DSP patch.
>>>
>>> Andrew
>> Yes, by default needs to set the node state to "disabled". This is HW 
>> description of the wake-up domain components. Memory carve outs and 
>> mailbox assignments for IPC are a separate patch as it is configurable 
>> and distro dependent.
> 
> Yes I plan to disable the nodes in each domain .dtsi file.
> 
> Also yes, my understanding is that the memory carveouts could
> be a separate series if at all. Not sure if those patches can be
> sent upstream since they are distro dependent. Can anyone clarify
> if this is the case?
> 

As per offline discussion, I will include the memory carveouts in this
same series.
~ Judith

> ~ Judith
> 

