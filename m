Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D08222560;
	Tue,  8 Apr 2025 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101941; cv=none; b=PV0tVoXZRquDBmd5gP5zQVllTjkK3Uqun5HlO+io0CLVzvLYUUDFmCMCrW5cFBAkYqQSy7m3VM9O85dbSjJn+DzLSrIfegNHUB2J3i+MnEIynjNVZ7RbFMrkZbj8eEjrCKzNo2HNpevcf5IOPnYidmC3z9Ed4KDCM6npKW/dZVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101941; c=relaxed/simple;
	bh=BZl7QtDhMutzfQNonfXXnyXSOYZ+XatslbZDFmKazR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KXdZQOAo7XCaWSPxvoJeXPfqE8S0Dq3HO6KBTFrPJjUqot7b54MVKUfC+pnDEUV36WOEJGJWxW3bHQNW5P+m6kjEhI7K+wWkwjxqNe0mhGZ+QngHO7jIMbrN4skkyti7p/lUY0KUbljyRYvFbnyILiBkiF3tX1jVvvHTpWZj8Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vh1X5C0O; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vh1X5C0O"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5388jMqQ1119501
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 03:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744101923;
	bh=AlBkZJaguK6bSBnMcY9ndnEooahe944YXBoBTutgybg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Vh1X5C0OoT775rOUDWVunwqf5E994WgCd5qJw3P/X70kzduMmobZGguCTd6smfpj6
	 qEV/YpHdk/mx9rJuCp25HH42VU+cP1D6GDBpjz3CPVk260iRFygYdohkvyQ5E1/YF5
	 jTiAu0puTrM2O5i/kmNnWnloJHBgIPispx9Sf/Ng=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5388jMiL082691
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 03:45:22 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 03:45:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 03:45:22 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5388jIYM125620;
	Tue, 8 Apr 2025 03:45:19 -0500
Message-ID: <ecdd7f17-e7c5-40fa-972b-4f30bcb5090e@ti.com>
Date: Tue, 8 Apr 2025 14:15:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: ti: j721e-sk: Add DT nodes for power
 regulators
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <jai.luthra@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
 <20250401114053.229534-2-y-abhilashchandra@ti.com>
 <20250407134148.jk43mzr5iyk4htyy@unplanned>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250407134148.jk43mzr5iyk4htyy@unplanned>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth,

On 07/04/25 19:11, Nishanth Menon wrote:
> On 17:10-20250401, Yemike Abhilash Chandra wrote:
>> Add device tree nodes for two power regulators on the J721E SK board.
>> vsys_5v0: A fixed regulator representing the 5V supply output from the
>> LM61460 and vdd_sd_dv: A GPIO-controlled TLV71033 regulator.
>>
>> J721E-SK schematics: https://www.ti.com/lit/zip/sprr438
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 31 ++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
>> index 440ef57be294..4965957e6545 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
>> @@ -184,6 +184,17 @@ vsys_3v3: fixedregulator-vsys3v3 {
>>   		regulator-boot-on;
>>   	};
>>   
>> +	vsys_5v0: fixedregulator-vsys5v0 {
>> +		/* Output of LM61460 */
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vsys_5v0";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		vin-supply = <&vusb_main>;
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>>   	vdd_mmc1: fixedregulator-sd {
>>   		compatible = "regulator-fixed";
>>   		pinctrl-names = "default";
>> @@ -211,6 +222,20 @@ vdd_sd_dv_alt: gpio-regulator-tps659411 {
>>   			 <3300000 0x1>;
>>   	};
>>   
>> +	vdd_sd_dv: gpio-regulator-TLV71033 {
> 
> Where is this used?

This node will serve as the vin-supply for other regulator nodes defined 
within
the device tree overlay. It is intended to be utilized when the overlay 
is applied.
The corresponding usage of this node can be found in Patch 3 of this series.

Thanks and Regards
Yemike Abhilash Chandra
> 
>> +		compatible = "regulator-gpio";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vdd_sd_dv_pins_default>;
>> +		regulator-name = "tlv71033";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		vin-supply = <&vsys_5v0>;
>> +		gpios = <&main_gpio0 118 GPIO_ACTIVE_HIGH>;
>> +		states = <1800000 0x0>,
>> +			 <3300000 0x1>;
>> +	};
>> +
>>   	transceiver1: can-phy1 {
>>   		compatible = "ti,tcan1042";
>>   		#phy-cells = <0>;
>> @@ -613,6 +638,12 @@ J721E_WKUP_IOPAD(0xd4, PIN_OUTPUT, 7) /* (G26) WKUP_GPIO0_9 */
>>   		>;
>>   	};
>>   
>> +	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
>> +		pinctrl-single,pins = <
>> +			J721E_IOPAD(0x1dc, PIN_INPUT, 7) /* (Y1) SPI1_CLK.GPIO0_118 */
>> +		>;
>> +	};
>> +
>>   	wkup_uart0_pins_default: wkup-uart0-default-pins {
>>   		pinctrl-single,pins = <
>>   			J721E_WKUP_IOPAD(0xa0, PIN_INPUT, 0) /* (J29) WKUP_UART0_RXD */
>> -- 
>> 2.34.1
>>
> 
