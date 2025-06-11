Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A3C23ED68;
	Wed, 11 Jun 2025 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631695; cv=none; b=K3sUkOc4MkA+MMmtYiwHKg0LR+ZS8Csx9UvhEOoC+klW/LX2RKR2Vl8ixSCTbrgOcnA3CicXNE+DsX5yDwhSFhx+87gQizYqQT1HVmgWNSPbPsY5UpRGCh3TZE4bCnBOP0h2+WJAy7G5kfwifLL6lT9oWrCKqbQaYRhslL1mnaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631695; c=relaxed/simple;
	bh=cBm3M82Kdra4IJfOgqk5o+GeR0e/itjVr/NA+6ZcXDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OINR14udgn5DzImMF+samlFa9hIfhyAnbAJCV0zke8U0zkHgiLe05wgT3dl4tOaY5ALSe8ws7WPmFkWVQLJS/MeptnjUJZ4dwHN8Ke3FWUlAHtB/YcP6F0vGaYUn/jdHtDKrlaiyL5aP0jOekkJ0d8yBXIW74Y61pkxyXZq9TM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=S2oePBf6; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="S2oePBf6"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55B8lsB01314105;
	Wed, 11 Jun 2025 03:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749631674;
	bh=ymwqf1Ux8HEhhD/Gs4JvP7qiKjBY5vzdVHC3KcdUKDA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S2oePBf6TLDhKKN47idjuh6FAgoEtZSrWTOX4qd6tgr+4irKqhG4tHkYNL4gcOTSk
	 PtsmVNvq+dmJNY9h9YyFFME8KS/ZsQY11E3NAAJqVVfawAn46ZRNQ7SEiyHszsQvEU
	 eRJ2U+m8SomwOCpTMEvcFmIxQokmVLdrWsmuKKpI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55B8lsIn2740090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 03:47:54 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 03:47:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 03:47:53 -0500
Received: from [172.24.227.4] (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55B8lnqS071485;
	Wed, 11 Jun 2025 03:47:50 -0500
Message-ID: <b24a97fc-8dac-443b-aec7-317b9e393f2d@ti.com>
Date: Wed, 11 Jun 2025 14:17:49 +0530
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
Content-Language: en-US
From: Hrushikesh Salunke <h-salunke@ti.com>
In-Reply-To: <98e04654-a693-494d-9f60-930b6a4cd84a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 11/06/25 14:14, Vignesh Raghavendra wrote:
> 
> 
> On 10/06/25 11:19, Hrushikesh Salunke wrote:
>> AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
>> on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
>> functional at all stages of PCIe boot process. Thus add the
>> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
>>
>> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
>> ---
>> This patch is based on commit
>> 475c850a7fdd Add linux-next specific files for 20250606
>>
>> Changes since v1
>> As per feedback from Nishanth, changed the position of "bootph-all"
>> tag, according to ordering rules for device tree properties.
>>
>> v1 : https://lore.kernel.org/all/20250609115930.w2s6jzg7xii55dlu@speckled/
>>
>>   arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>> index 432751774853..a7e8d4ea98ac 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>> @@ -46,6 +46,7 @@ pcie0_ep: pcie-ep@f102000 {
>>   		max-functions = /bits/ 8 <1>;
>>   		phys = <&serdes0_pcie_link>;
>>   		phy-names = "pcie-phy";
>> +		bootph-all;
>>   		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
>>   	};
>>   };
> 
> Are the patches for PCIe boot support merged to U-Boot or such other
> bootloader repo?
> No, they are not in the U-Boot yet. I will be posting patches for PCIe
boot support for U-Boot this week.

Regards,
Hrushikesh
