Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74591494A8;
	Fri, 30 May 2025 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624764; cv=none; b=tKNDmUrcyMOhfdmkwua3F1nQP7ElyUaXLLuQ4uEQF/jBwKCH5OlnV96hNsrKtTJu+DrGsC1n7YxVLsIuWZGNzAMIsERwLe8kLUbbCYElZ+tpDXEDDs4Yy/jimeuZ0LUXesJpMTLAdjBDrIVIMfsBSdAuxbJn9GxYH39pf6e0QUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624764; c=relaxed/simple;
	bh=YGczbhRF5Zko2a7kRlhk0IqooZ8aLPy3SrcawQgOd5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IpO51LtUudGZqxX9L35q8kSu38Y1iik3gPExFL+5TvytRrQnHlUmDSoOo5yD+Lh8WOhCupjfrJR2HM92ET5EnIySKuBB9oNz/+28vW7aKSyy3nQIg6MOnlbStH67Sjn+Ygp09Y2Pn+l8k3vWrKd9DVREUPSFFFUckBBZDQDEFWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pIziNkeH; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pIziNkeH"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54UH5UBx3829294;
	Fri, 30 May 2025 12:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748624730;
	bh=ThIHIIT9iqmkFSq31gO7OrIt2GoIFGoG34qUFfe18lo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pIziNkeHdPaqATQoRoBYFyQ3f5BU3yHY3Y8xE5ICy1QBsFprVdDctkVIDIjljN6Dn
	 IQDJxrR+fNyxidlfP+u5l4ClwEQEMLHrNu6FtW/VJnAzQMm/KU9C5mVrhtVBj3wQoI
	 cVuqH69Ddu/Rq9+rm7lcpfMCE21srgKXMUa3krfw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54UH5UBC2995602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 30 May 2025 12:05:30 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 May 2025 12:05:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 May 2025 12:05:30 -0500
Received: from [10.249.135.124] ([10.249.135.124])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54UH5Px63349627;
	Fri, 30 May 2025 12:05:26 -0500
Message-ID: <2e80f6bc-2fb0-4f0d-9450-cbcf4dddca66@ti.com>
Date: Fri, 30 May 2025 22:35:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/2] Extend mmio-mux driver to configure mux with
 new DT property
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Peter Rosin
	<peda@axentia.se>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <s-vadapalli@ti.com>, <danishanwar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>, Thomas Gleixner
	<tglx@linutronix.de>
References: <20250304102306.2977836-1-c-vankar@ti.com>
 <f844e44e-6b71-442a-ae3c-7bbe74a908af@ti.com>
Content-Language: en-US
From: "Vankar, Chintan" <c-vankar@ti.com>
In-Reply-To: <f844e44e-6b71-442a-ae3c-7bbe74a908af@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Greg,

I have tried to implement Timesync Router node to the suitable
Subsystems (Interrupt controller and Mux-controller). Thomas
has provided a feedback with a reason why Timesync Router is not
suitable for irqchip. But I didn't get a proper feedback for mux-
controller subsystem.

Can you please help me deciding in which subsystem I should implement
it, if not mux-controller can it go in drivers/misc ?

Regards,
Chintan.

On 5/20/2025 10:59 AM, Chintan Vankar wrote:
> Hello Peter,
> 
> I am trying to implement a driver for hardware module called Timesync
> Router which is present on almost all the SoCs of Texas Instruments and
> I need your advise to implement it.
> 
> Timesync Router provides a mechanism to mux M input to N outputs, where
> all M inputs are selectable to be driven per N output.
> 
>                           ________________________
>                          |    Timesync INTR       +---->dma_local_events
>                          |                        |
>   Device sync events----->                        +---->pcie_cpts_hw_push
>                          |                        |
>            cpts_genf----->                        +---->cpts_hw_push
>                          |________________________|
> 
> 
> Diagram shows a very concise view of Timesync Router. It receives
> signals from multiple modules and routes the same on the other side. To
> configure the functionality, we need to program output registers of
> Timesync Router to configure it with the input signal. One of the
> application of Timesync Router is to generate a PPS signal for CPTS
> module. Timesync Router receives periodic signals generated by CPTS
> module as shown "cpts_genf" in diagram and it can be routed via Timesync
> Router as a Hardware Push Events as shown "cpts_hw_push" in diagram.
> 
> The functionality of Timesync Router seems very much identical to the
> mux-controller, specifically mmio driver present in the mux subsystem.
> I have also posted a detailed explanation on how can we modify mmio
> driver which can work as a generic driver for the hardware module
> identical to Timesync Router at here:
> https://lore.kernel.org/r/1ce1fc6b-fc16-4fb7-9f68-57b495aa5eae@ti.com/
> 
> I have also tried to implement this module with irq subsystem:
> https://lore.kernel.org/r/20250205160119.136639-1-c-vankar@ti.com/, for
> which I received a response from the Thomas Gleixner that why it cannot
> be included in the irq subsystem:
> https://lore.kernel.org/r/87ikp8jph9.ffs@tglx/.
> 
> After receiving feedback on the Interrupt Router implementation, I tried
> to implement it as a mux-controller which seems more relevant subsystem
> for Timesync Router. Can you please advise me whether it can be included
> in the mux-controller subsystem or not ?
> 
> Regards,
> Chintan.
> 
> 
> 
> 
> On 04/03/25 15:53, Chintan Vankar wrote:
>> This series extends mmio-mux driver's capability to configure driver in
>> with extended property.
>>
>> In current driver implementation, driver is parsing register's offset,
>> mask and value from two different device tree property which makes it
>> complex to specify a specific register or set of registers. Introducing
>> mux-reg-masks-states will make it easier to specify the same values for
>> particular register or set of registers.
>>
>> This series is based on linux next tagged next-20250303.
>>
>> Link to v1:
>> https://lore.kernel.org/r/20250227202206.2551305-1-c-vankar@ti.com/
>>
>> Changes from v1 to v2:
>> - Updated dt-bindings for the required conditions as suggested by Conor
>>    Dooley and Andrew Davis.
>> - Modified driver changes as pointed out by Andrew Davis.
>>
>> Chintan Vankar (2):
>>    devicetree: bindings: mux: reg-mux: Update bindings for reg-mux for
>>      new property
>>    mux: mmio: Extend mmio-mux driver to configure mux with new DT
>>      property
>>
>>   .../devicetree/bindings/mux/reg-mux.yaml      |  28 +++-
>>   drivers/mux/mmio.c                            | 144 ++++++++++++++----
>>   2 files changed, 141 insertions(+), 31 deletions(-)
>>
