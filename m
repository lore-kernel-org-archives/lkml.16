Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0BD1A9B32;
	Thu, 12 Jun 2025 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723423; cv=none; b=ujv6Ey6YWQfd+pkw7fTeGtySEjKqFnj/qW1FoYOgGekc8oF4hWbrqS1xSRGVe9sXsvq5wlKQfdHVXNK+zK5fmRQn12RzI7v8xUFYa3kmr3oCAoxtXC9t28pRXgHja8KYcXSsiU5ip6Q0jgUTVmrNtUIai5OtQlQCCmnHjcvcdnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723423; c=relaxed/simple;
	bh=m+13JVvNe4Aqqrmb5JHan1JbgajcNao6ikZ970Xy6QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RnatmRBxan+YE+n4+/Vpa6aJN26OvgPkVDNm5lvWAJcl98KSPLR+3eJeX3ioRbUKAnXr9heBC58Oshfg2I5fXYZ70XBCYsxnkn0Z9AUlGCIxm9nh3J4wzlwO9tCwTtYA0yX+DAKNvKND81Tc2FYsn7x+PFKeUrLuJXVx9ejhwtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VFdCXSsf; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VFdCXSsf"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55CAGt8R1639154;
	Thu, 12 Jun 2025 05:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749723415;
	bh=xtLHyzIXT1AKmPX6hD2tyAPsnEPd735Ph5uIX9qO/h4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VFdCXSsf0KSKsQa22pRTYSnZ1S4x/nh8NF14mSgUoGcU9dNoby7E8Bn0QM52seN29
	 enIuIrYqHHmGuraGByLDM0hgOwjHsE/tGE1sbSYnYiNbiircAOBbAh15P3V4yJhb01
	 uNukUwu5asUVlNUiCgsLcsgX9Tm38dtUYQHmprEM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55CAGtGX1734427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 05:16:55 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 05:16:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 05:16:55 -0500
Received: from [172.24.227.4] (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55CAGpPr1835014;
	Thu, 12 Jun 2025 05:16:51 -0500
Message-ID: <f6a57a82-c534-4439-a337-8592c2e121c5@ti.com>
Date: Thu, 12 Jun 2025 15:46:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase
 tag to "pcie0_ep"
To: Vignesh Raghavendra <vigneshr@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <danishanwar@ti.com>, Hrushikesh Salunke <h-salunke@ti.com>
References: <20250610054920.2395509-1-h-salunke@ti.com>
 <98e04654-a693-494d-9f60-930b6a4cd84a@ti.com>
 <b24a97fc-8dac-443b-aec7-317b9e393f2d@ti.com>
Content-Language: en-US
From: Hrushikesh Salunke <h-salunke@ti.com>
In-Reply-To: <b24a97fc-8dac-443b-aec7-317b9e393f2d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 11/06/25 14:17, Hrushikesh Salunke wrote:
> 
> 
> On 11/06/25 14:14, Vignesh Raghavendra wrote:
>>
>>
>> On 10/06/25 11:19, Hrushikesh Salunke wrote:
>>> AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
>>> on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
>>> functional at all stages of PCIe boot process. Thus add the
>>> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
>>>
>>> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
>>> ---
>>> This patch is based on commit
>>> 475c850a7fdd Add linux-next specific files for 20250606
>>>
>>> Changes since v1
>>> As per feedback from Nishanth, changed the position of "bootph-all"
>>> tag, according to ordering rules for device tree properties.
>>>
>>> v1 : 
>>> https://lore.kernel.org/all/20250609115930.w2s6jzg7xii55dlu@speckled/
>>>
>>>   arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso 
>>> b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>>> index 432751774853..a7e8d4ea98ac 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>>> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>>> @@ -46,6 +46,7 @@ pcie0_ep: pcie-ep@f102000 {
>>>           max-functions = /bits/ 8 <1>;
>>>           phys = <&serdes0_pcie_link>;
>>>           phy-names = "pcie-phy";
>>> +        bootph-all;
>>>           ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
>>>       };
>>>   };
>>
>> Are the patches for PCIe boot support merged to U-Boot or such other
>> bootloader repo?
>> No, they are not in the U-Boot yet. I will be posting patches for PCIe
> boot support for U-Boot this week.
> 

I have posted Patch series for the PCIe boot support in Uboot.

1.https://patchwork.ozlabs.org/project/uboot/patch/20250612084910.3457060-1-h-salunke@ti.com/
2. 
https://patchwork.ozlabs.org/project/uboot/cover/20250612085023.3457117-1-h-salunke@ti.com/
3. 
https://patchwork.ozlabs.org/project/uboot/cover/20250612085534.3457522-1-h-salunke@ti.com/


Regards,
Hrushikesh.
