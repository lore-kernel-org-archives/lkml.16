Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AEF25C6E7;
	Mon,  5 May 2025 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458568; cv=none; b=P0riiX7jeL1nnKMtAERebsdyp/HgoPPaLR5/fuTT1Bb4b81MZEOXhQzVQgcQCn2+F4dZAJEwFTYNqx/weqm774Zy17PYlB8r7iuug/Ym9TccQ8QYZpPDuSwwsywod7LeKf7W14Tp8bgozQG87aPKenlDUmqjV/2m/tNRXNaFsNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458568; c=relaxed/simple;
	bh=VHk4TU9myRa7HfzrRfKD5NLgm23gbm1Xab5HBAQrBeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QiwH9cP+5uJamq3/bmSFZm799MMvUN2daq13kdyPJc3rN5fjcsYRNdTvZNI0dMqKs5V3mYAM8rgb8tdYzpCKYWD/4T7lYZ/nfVRYDHVLdGeAEtjMfwt5mbO0Hf+7vaA4Ru3OHzOOpfX5abXifGef8vzTDtjPC31KPetD23D3B2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ymcs8VBH; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ymcs8VBH"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545FMYoQ979537
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 10:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746458554;
	bh=tq8VaHCFP3bqtzmIRyMTTtFhUUx3Cc7L3Y5GXWBtUJg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ymcs8VBH5F+OBNGDJxNpcba6cabkvorR+qPRgOm87tQcaK8Or3GE1gPbEu4lM+hPr
	 KnuyB8xOSwurqHIr7JOgXVwI3PkeWJEHvjIcTGHPUeOHJVANAcQmEuXiQq5VksbEv+
	 /iJCOZHSfJ1JCQdItviMbBbtxOrBLPxDdmBJ7DpQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545FMYqN011294
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 10:22:34 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 10:22:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 10:22:34 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545FMXkw070284;
	Mon, 5 May 2025 10:22:33 -0500
Message-ID: <31d32966-05fe-4369-afda-3278822d8cb5@ti.com>
Date: Mon, 5 May 2025 10:22:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/11] arm64: dts: ti: k3-am62a-mcu: Add R5F remote
 proc node
To: "Mendez, Judith" <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hari
 Nagalla <hnagalla@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250502220325.3230653-1-jm@ti.com>
 <20250502220325.3230653-4-jm@ti.com>
 <50039c49-a6c5-4f29-a35a-53b9af117fd8@phytec.de>
 <6c5e786d-7581-492f-92fb-be92ecbecd87@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <6c5e786d-7581-492f-92fb-be92ecbecd87@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 5/5/25 10:05 AM, Mendez, Judith wrote:
> Hi Daniel,
> 
> On 5/5/2025 4:55 AM, Daniel Schultz wrote:
>> Hi,
>>
>> I'm unable to load the latest TI firmware (98efd20ec71f8c1c8f909d34ab656731) with this patch.
>>
>> [    7.012889] remoteproc remoteproc1: 79000000.r5f is available
>> [    7.032640] remoteproc remoteproc1: powering up 79000000.r5f
>> [    7.038626] remoteproc remoteproc1: Booting fw image am62a-mcu- r5f0_0-fw, size 53140
>> [    7.057209] remoteproc remoteproc1: bad phdr da 0x79100000 mem 0x47ea0

So this looks like the firmware has sections in the SRAM region. That would be the
issue here.

>> [    7.064716] remoteproc remoteproc1: Failed to load program segments: -22
>>
>> I figured out that the mcu sram node disappeared in v5. Apparently adding it back manually doesn't solve this problem. Any idea what's wrong?
> 
> For am62ax, there should be several items changed with this v8
> series in order for remoteproc to work with the TI default firmware:
> 
> 1. memory carveouts were reduced to 15MB [0] & edge-ai memory
> carveouts are not included here

This shouldn't be an issue, the default firmware doesn't
use the extended carveouts.

> 2. mcu_sram1 node removed [2]
> 

So when you say you added back the SRAM node, did you also add the
sram = <&mcu_ram>; in the core node?

Andrew

> If you want to catch up on the general direction for this series,
> please refer to [3]. atm remoteproc can fail with the default FW,
> but we are trying to move away from that firmware and this is the
> first step in that direction.
> 
> [0] https://lore.kernel.org/linux-devicetree/0ab5c5ec-cde3-41f1-8adf-2419b31497c1@ti.com/
> [1] https://lore.kernel.org/linux-devicetree/04e77daf-e775-44fa-82bf-8b6ebf73bcef@ti.com/
> [2] https://lore.kernel.org/linux-devicetree/32358aa1-0c02-4f4d-9782-2d8376c0d9fc@ti.com/
> [3] https://lore.kernel.org/linux-devicetree/e131298f-3713-482a-a740-ff89709270b4@ti.com/
> 
> ~ Judith
> 
>>
>> On 5/3/25 00:03, Judith Mendez wrote:
>>> From: Hari Nagalla <hnagalla@ti.com>
>>>
>>> AM62A SoCs have a single R5F core in the MCU voltage domain.
>>> Add the R5FSS node with the child node for core0 in MCU voltage
>>> domain .dtsi file.
>>>
>>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> Acked-by: Andrew Davis <afd@ti.com>
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 25 ++++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/ boot/dts/ti/k3-am62a-mcu.dtsi
>>> index 9ed9d703ff24..ee961ced7208 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
>>> @@ -174,4 +174,29 @@ mcu_mcan1: can@4e18000 {
>>>           bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
>>>           status = "disabled";
>>>       };
>>> +
>>> +    mcu_r5fss0: r5fss@79000000 {
>>> +        compatible = "ti,am62-r5fss";
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges = <0x79000000 0x00 0x79000000 0x8000>,
>>> +             <0x79020000 0x00 0x79020000 0x8000>;
>>> +        power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
>>> +        status = "disabled";
>>> +
>>> +        mcu_r5fss0_core0: r5f@79000000 {
>>> +            compatible = "ti,am62-r5f";
>>> +            reg = <0x79000000 0x00008000>,
>>> +                  <0x79020000 0x00008000>;
>>> +            reg-names = "atcm", "btcm";
>>> +            resets = <&k3_reset 9 1>;
>>> +            firmware-name = "am62a-mcu-r5f0_0-fw";
>>> +            ti,atcm-enable = <0>;
>>> +            ti,btcm-enable = <1>;
>>> +            ti,loczrama = <0>;
>>> +            ti,sci = <&dmsc>;
>>> +            ti,sci-dev-id = <9>;
>>> +            ti,sci-proc-ids = <0x03 0xff>;
>>> +        };
>>> +    };
>>>   };
> 
