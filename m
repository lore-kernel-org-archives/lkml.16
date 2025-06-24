Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0232222CC;
	Tue, 24 Jun 2025 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756369; cv=none; b=PgtRQdte4if5bVMfJyjT2jjmCBIRm5TQMq8x4XvV23xOZjoDEfG+WVzzD6fDf73A8IxMk1o/MbQaN/m859zYjeFzyLi09rH+chyh37xgS4S10TH4sQA27RboKPt/YNhACVKcPJEUW0zaA9e1efW25qMjxQFMJ3ONGW9yo+tYuHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756369; c=relaxed/simple;
	bh=IRmW8E9wkUP+rMH9ZOVEDeBjpV9bTyCZE0Xj+QAd1lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wl8frDTJR0mGVuXOev9ncAyYIUfaRm0kVzoUjAfRcVmlOheuxTKoG75yRqnT3NsE2wgD3B+iTVG7PWljmiS9jnJJTAfshJO6ETRl9pUNEF7Y8uRNFXAtDq0rInXPuMS7nm0YMyPccC0sqWHP7VvYTWhDyqmG77ClIbTkoSAdtBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sYNAc6fQ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sYNAc6fQ"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O9CgOK1125116;
	Tue, 24 Jun 2025 04:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750756362;
	bh=uOvDyhprW4ZNM9qZCw2K3MOrcKhNHdJKT56J5HnHGhI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sYNAc6fQyYHE2z6m+PvRerlh8W/QzcUMXdw/CkMhoOC/k6SamAOBU6zd6vP8n+0vZ
	 hP0bgg04l+o/aKJI1Aq1+JAU7M7+riZy3DerRi5GALGFYUnW2bvm4RsrYIdJ/UvdNo
	 a6LE7g7O+B6+3QUJkqftITFoQm8ycxDsk5V3YqoA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O9Cfiq140774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 04:12:42 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 04:12:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 04:12:41 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O9CaR31247765;
	Tue, 24 Jun 2025 04:12:37 -0500
Message-ID: <bd5ae2e8-eaaa-4d00-bd13-c2fbe0d4b567@ti.com>
Date: Tue, 24 Jun 2025 14:42:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 5/6] arm64: dts: ti: Update firmware-name for IPC
To: Bryan Brattlof <bb@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-6-p-bhagat@ti.com>
 <20250623142952.3aeec366w2lmoswv@bryanbrattlof.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250623142952.3aeec366w2lmoswv@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Bryan,


On 23/06/25 19:59, Bryan Brattlof wrote:
> On June 23, 2025 thus sayeth Paresh Bhagat:
>> Update the firmware-name properties in the dts file to point to new IPC
>> firmware binaries for both the mcu-r5 and c7x core.
>>
> Same here. This seems like we should have squashed this into 4/6
>
> ~Bryan
Yep will do
>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> index 8fde89ecba67..c98e4c98c956 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> @@ -487,6 +487,7 @@ &mcu_r5fss0_core0 {
>>   	mboxes = <&mailbox0_cluster2 &mbox_mcu_r5_0>;
>>   	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>>   			<&mcu_r5fss0_core0_memory_region>;
>> +	firmware-name = "am62d-mcu-r5f0_0-fw";
>>   };
>>   
>>   &c7x_0 {
>> @@ -495,6 +496,7 @@ &c7x_0 {
>>   	mboxes = <&mailbox0_cluster1 &mbox_c7x_0>;
>>   	memory-region = <&c7x_0_dma_memory_region>,
>>   			<&c7x_0_memory_region>;
>> +	firmware-name = "am62d-c71_0-fw";
>>   };
>>   
>>   &cpsw3g {
>> -- 
>> 2.34.1
>>
