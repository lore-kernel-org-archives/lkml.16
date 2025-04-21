Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18AA1362;
	Mon, 21 Apr 2025 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230217; cv=none; b=gm5vcQB5h874iu4YksAdlsesijSWaV9pozYOybbX3ZApVlgYLDkrrNdHOTVx7bm1xvLMx6y0E3G5iF/6UzdTIg5ZVuIvVmQjGcLi6+IWNyKjNoBdOPaSEDdPP0+eC1a3Zr0phm+oqvl6XZDmhEuMcEnuoW6TMW5bkWJDqf78ZtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230217; c=relaxed/simple;
	bh=FfyJm9NpDg8tA9buZVudpWXEIfJ0WHFaK9XW39O5sKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=piXKfd6CVFEuLfPE1saw93/rO19FX7YF6A6h/y2B4qY2fM0BGvpB7xh/+KyuUfnPRstZfZ9+3cEMWrXRJfT/74+fJxSSF1ECCl553uix31iTPYzR7GRiuR2YEOUXSGEYEnlCpihtjxngbjtWCIjXzLvvxy/WQyKkC1J1nb5p4zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xQHk6hPT; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xQHk6hPT"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LA9vVN1523976
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 05:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745230197;
	bh=/noc+Q/n6Kpzt6EQXIhcOW/BLsq1uA3nULifFhnVrf0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xQHk6hPT96DmZifpQ0tj/GnpHuDgb6fhQo6VMbPiCrm17i8Yvuqww/8n87jRe7SGY
	 E7oezRk48w44hYM9WR7EYcA7iJsOU5pP+3sd3yOe+EXZfYVharMYBzPjFjzeAAJLVf
	 lU8Yha8CjmCOQm+gWnr+ERMitW5CBBDDkMHYB0/4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LA9vwG018213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 05:09:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 05:09:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 05:09:56 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LA9qrE015453;
	Mon, 21 Apr 2025 05:09:53 -0500
Message-ID: <8a0bbbd1-4767-4399-b163-8243bd849bdf@ti.com>
Date: Mon, 21 Apr 2025 15:39:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: ti: k3-j721s2-common-proc-board: Add
 main_i2c4 instance
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <20250411105155.303657-5-j-choudhary@ti.com>
 <ab27873e-cada-4135-a617-5d4567a4eaa5@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <ab27873e-cada-4135-a617-5d4567a4eaa5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Udit,

On 19/04/25 14:53, Kumar, Udit wrote:
> 
> On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
>> Add dt node for main_i2c4 instance along with required pinmuxing.
>> Also add the gpio expander 'exp4' required by display connector.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 21 +++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts 
>> b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> index e2fc1288ed07..f691ae4c19e6 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> @@ -148,6 +148,13 @@ J721S2_IOPAD(0x060, PIN_INPUT_PULLUP, 13) /* 
>> (AC27) MCASP2_AXR1.I2C3_SDA */
>>           >;
>>       };
>> +    main_i2c4_pins_default: main-i2c4-default-pins {
>> +        pinctrl-single,pins = <
>> +            J721S2_IOPAD(0x014, PIN_INPUT_PULLUP, 8) /* (AD25) 
>> I2C4_SCL */
>> +            J721S2_IOPAD(0x010, PIN_INPUT_PULLUP, 8) /* (AF28) 
>> I2C4_SDA */
>> +        >;
>> +    };
>> +
>>       main_i2c5_pins_default: main-i2c5-default-pins {
>>           pinctrl-single,pins = <
>>               J721S2_IOPAD(0x01c, PIN_INPUT, 8) /* (Y24) 
>> MCAN15_TX.I2C5_SCL */
>> @@ -370,6 +377,20 @@ exp2: gpio@22 {
>>       };
>>   };
>> +&main_i2c4 {
>> +    status = "okay";
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&main_i2c4_pins_default>;
>> +    clock-frequency = <400000>;
>> +
>> +    exp4: gpio@20 {
>> +        compatible = "ti,tca6408";
>> +        reg = <0x20>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
> 
> I suggest to add, gpio-line-names as well for this gpio expander.
> 

Sure, I will add gpio-line-names.

> 
>> +    };
>> +};
>> +
>>   &main_i2c5 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&main_i2c5_pins_default>;


Thanks,
Jayesh
