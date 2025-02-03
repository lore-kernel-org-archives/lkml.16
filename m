Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1594C182B4;
	Mon,  3 Feb 2025 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620764; cv=none; b=Nf2DCPWuWN9Mesout6gG60ITiMESwLXwzhbtsM9xexH8UaJdU6O2z6NWyfvHY8yxCAyfuZZb0Fu6Iptg2sruMe4pP17uYcDqSS26+ScYcns4MaO6xvASCA4ff6G3AIkpa4QzqzNSLNpZCFW5/fWilmUNc/c1P5HAvv4EasLpKws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620764; c=relaxed/simple;
	bh=NsRTrXKomzHTefKbNl8Fxxih3U7UqON2ERThnZ0x/YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Gk8nCquMJI/Pj8XJRoSx5wYlaPIoZxtUbnv8b54vIFlSoQLtZWHVwIFOu/zyrrYYcJ1kqgZXGv8gPFhJHEVU7Tkbjz48ObroMJMjE8FJ22vmSf7mfbmfksR2JOqmahpWSuLOXo1oZQM+chUqfsAB81Nzk0wPkVC4jyGRkgZm3WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ue2x718p; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ue2x718p"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513MCZbG2218398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Feb 2025 16:12:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738620755;
	bh=OfI9dlLcSjW6HM4VB+FL+prEF7OaRxVLjKZpK9XkkAs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ue2x718piSpMFvKdib39neMBkky7Ugk6w3cDbVaR0ZJLKXQgpHuMspFfW84AgKqOY
	 U4751Rk+D96+MjZugGZX6WeQCqUcADXDBPUQn1A7xLBh/n/Bv3ZCoTOwL+2pJDaP/3
	 ufZiSKPCXrIE6h61DHA0vyePvmo79mAmxuBszfMA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513MCZm1065356;
	Mon, 3 Feb 2025 16:12:35 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 16:12:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 16:12:35 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513MCZB6086602;
	Mon, 3 Feb 2025 16:12:35 -0600
Message-ID: <6fe74c50-1430-4556-90b5-f635fb48e6fb@ti.com>
Date: Mon, 3 Feb 2025 16:12:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] arm64: dts: ti: k3-am62-wakeup: Add wakeup r5f
 node
To: Andrew Davis <afd@ti.com>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Hari Nagalla <hnagalla@ti.com>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20250131214611.3288742-1-jm@ti.com>
 <20250131214611.3288742-2-jm@ti.com>
 <1c2c67b7-987e-4b92-b0be-c0b2f25adae6@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <1c2c67b7-987e-4b92-b0be-c0b2f25adae6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew,

On 1/31/25 5:40 PM, Andrew Davis wrote:
> On 1/31/25 3:46 PM, Judith Mendez wrote:
>> From: Hari Nagalla <hnagalla@ti.com>
>>
> 
> Subject should capitalize R5F

Will fix in v3, thanks

> 
>> AM62 SoC devices have a single core R5F processor in wakeup domain.
>> The R5F processor in wakeup domain is used as a device manager
>> for the SoC.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Changes since v1:
>> - disable each device node in the voltage domain files and
>>    enable at the board level file
>> - fix firmware names
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 25 ++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
>> index 9b8a1f85aa15c..12b1520974ade 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
>> @@ -106,6 +106,31 @@ wkup_rti0: watchdog@2b000000 {
>>           status = "reserved";
>>       };
>> +    wkup_r5fss0: r5fss@78000000 {
>> +        compatible = "ti,am62-r5fss";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x78000000 0x00 0x78000000 0x8000>,
>> +                 <0x78100000 0x00 0x78100000 0x8000>;
> 
> Odd alignment, looks like you have an extra tab on the above line

Hmm missed this, thanks will fix.

~ Judith

> 
> Andrew
> 
>> +        power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
>> +        status = "disabled";
>> +
>> +        wkup_r5fss0_core0: r5f@78000000 {
>> +            compatible = "ti,am62-r5f";
>> +            reg = <0x78000000 0x00008000>,
>> +                  <0x78100000 0x00008000>;
>> +            reg-names = "atcm", "btcm";
>> +            ti,sci = <&dmsc>;
>> +            ti,sci-dev-id = <121>;
>> +            ti,sci-proc-ids = <0x01 0xff>;
>> +            resets = <&k3_reset 121 1>;
>> +            firmware-name = "am62-wkup-r5f0_0-fw";
>> +            ti,atcm-enable = <1>;
>> +            ti,btcm-enable = <1>;
>> +            ti,loczrama = <1>;
>> +        };
>> +    };
>> +
>>       wkup_vtm0: temperature-sensor@b00000 {
>>           compatible = "ti,j7200-vtm";
>>           reg = <0x00 0xb00000 0x00 0x400>,

