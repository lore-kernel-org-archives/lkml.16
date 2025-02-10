Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FE925E468;
	Mon, 10 Feb 2025 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739215021; cv=none; b=qrLVgNPGkJpgzDvpzIvEuIb/CIunTj9gDpHB5S5gCdw2Lwlap5K6NPQJeF5Xa/jjlnpRLmouVt2VY0CpwJsP2eVkaJmLJcJPfmATU/Rv2Fbn4X7FI3dNuKH6BjF/ZjoWtiXTIArRLEQOc6VH62ukR5TUm31kr0a9jMWL16VMm8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739215021; c=relaxed/simple;
	bh=eS4lYoEdRsQw4FFeYDZIUnJqYUd55FNvgOggWWItWCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=un0BYgS+2JqTHb04IAOFxfV2ZZZpbCv8wsVxks5EqehBOLB3+fRpeyrj5K01y4L1Po8ouVcJ49KE4UvtckcJWkN1q2B1MnNw0oz+n90sGhOy3yV2Ynv9hfD1IGo9rcXHlfsVwaP3b6DjYwe3mZ6A46K4V4qi2bQsqUiwut+0O1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pc4o1/On; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pc4o1/On"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AJGcgt3554860
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 10 Feb 2025 13:16:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739214998;
	bh=5M65OR2CUPTzpfz/kJc0TAeBXpCEXueqBGE3svKlDww=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pc4o1/OnHsBIMWi/QbzuOhhBGRDrEiimfJA6LcnLTewpfFWlH7LLvTRAoVaHVsJq/
	 b68WhZCTAd+u4TIECMQAV3SY59kpG9D18nvMwzcgifaJUpotlBbRWNOFgBKPU++49b
	 y4IvVoM8wcLcBmWcZuWBFIu0k51U8ZCUbbo2hP1Q=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AJGcKF021306;
	Mon, 10 Feb 2025 13:16:38 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 13:16:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 13:16:38 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AJGcSx052839;
	Mon, 10 Feb 2025 13:16:38 -0600
Message-ID: <1bf8445f-b411-450c-aa37-9eb23f639bae@ti.com>
Date: Mon, 10 Feb 2025 13:16:38 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Andrew Davis <afd@ti.com>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Hari Nagalla <hnagalla@ti.com>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20250206235200.3128163-1-jm@ti.com>
 <20250206235200.3128163-6-jm@ti.com>
 <9572caa4-fc17-4531-be68-8466753b70bc@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <9572caa4-fc17-4531-be68-8466753b70bc@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew,

On 2/7/25 9:56 AM, Andrew Davis wrote:
> On 2/6/25 5:51 PM, Judith Mendez wrote:
>> From: Devarsh Thakkar <devarsht@ti.com>
>>
>> For each remote proc, reserve memory for IPC and bind the mailbox
>> assignments. Two memory regions are reserved for each remote processor.
>> The first region of 1MB of memory is used for Vring shared buffers
>> and the second region is used as external memory to the remote processor
>> for the resource table and for tracebuffer allocations.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Changes since v3:
>> - No change
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 90 +++++++++++++++++++++++--
>>   1 file changed, 84 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts 
>> b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> index a6f0d87a50d8a..eaffbab093cc1 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -49,6 +49,42 @@ linux,cma {
>>               linux,cma-default;
>>           };
>> +        c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x99800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        c7x_0_memory_region: c7x-memory@99900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x99900000 0x00 0xf00000>;
>> +            no-map;
>> +        };
>> +
>> +        mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9c900000 0x00 0x1e00000>;
>> +            no-map;
>> +        };
>> +
>>           secure_tfa_ddr: tfa@9e780000 {
>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>               alignment = <0x1000>;
>> @@ -60,12 +96,6 @@ secure_ddr: optee@9e800000 {
>>               alignment = <0x1000>;
>>               no-map;
>>           };
>> -
>> -        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>> -            compatible = "shared-dma-pool";
>> -            reg = <0x00 0x9c900000 0x00 0x01e00000>;
>> -            no-map;
>> -        };
>>       };
>>       opp-table {
>> @@ -737,3 +767,51 @@ dpi1_out: endpoint {
>>           };
>>       };
>>   };
>> +
>> +&mailbox0_cluster0 {
> 
> Odd, these mailboxes should have been disabled by default as
> they are incomplete without this extra board-level info below.
> 
> I'll have to fix that later. For now, could you add
> status = "okay"; here. That way they are already here and
> I don't have to modify this DT file later (which could
> cause a conflict if I do it this cycle).

Sure will do.

~ Judith

> 
> Andrew
> 
>> +    mbox_r5_0: mbox-r5-0 {
>> +        ti,mbox-rx = <0 0 0>;
>> +        ti,mbox-tx = <1 0 0>;
>> +    };
>> +};
>> +
>> +&mailbox0_cluster1 {
>> +    mbox_c7x_0: mbox-c7x-0 {
>> +        ti,mbox-rx = <0 0 0>;
>> +        ti,mbox-tx = <1 0 0>;
>> +    };
>> +};
>> +
>> +&mailbox0_cluster2 {
>> +    mbox_mcu_r5_0: mbox-mcu-r5-0 {
>> +        ti,mbox-rx = <0 0 0>;
>> +        ti,mbox-tx = <1 0 0>;
>> +    };
>> +};
>> +
>> +&wkup_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>> +&wkup_r5fss0_core0 {
>> +    mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>> +            <&wkup_r5fss0_core0_memory_region>;
>> +};
>> +
>> +&mcu_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>> +&mcu_r5fss0_core0 {
>> +    mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>> +            <&mcu_r5fss0_core0_memory_region>;
>> +};
>> +
>> +&c7x_0 {
>> +    mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
>> +    memory-region = <&c7x_0_dma_memory_region>,
>> +            <&c7x_0_memory_region>;
>> +    status = "okay";
>> +};

