Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADCE19D07B;
	Fri,  2 May 2025 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184437; cv=none; b=HJpMJZy1gB4TtOXz6ExCB87lLVEfvs48R4v/DZm3bjHJ/Cc1r6kG3QMPLPKMeSRquu08bWWCKrrxj195eJIWdpdhVi1/fjlPlEK+IUhOKUjB5UPZskNjDtpufQOmSkVksgZc02CcKl7kqqmf2HHeNvlw/5tw3SH5211ZfgxUDZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184437; c=relaxed/simple;
	bh=9kHaM+DwGh2R0bvCj57XSgsqksXYbaATpqhrjd3RIio=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Uien6E7Yf/mHDxTVxlz6ZTIMrv1cnyOnaJnViRh5Ho+yX7F5HgM7I1fBjxCbmLRFFkM16PIroHFAVJjfSgRHd0cbeJVdaWg0qr6XL/k78CFyKkdfbQjvAsaE+4MkUIxGbsyc71wmQ8cfnlkbb6z5bh/bh0IKjmYq35STr5/9wqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=W5idxvhy; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W5idxvhy"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542BDiEq3848530
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 06:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746184424;
	bh=e+w5Qh2JRjlMFyhkZEHnj7ml/ugQxghiOlkLkqWDVzI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=W5idxvhyn32t6wedPrduYdssQK5QNiQNVACARTf5WAYDH/BhLh3dbVBMNj/NwP7KM
	 EwoDxSKVEf4W8FnSoPItBAul40ymbqBUrCRleffoQB9aTk+9bU4/e/qDATBznFViSk
	 04h4bDSQw6y5r2o4tbHNkK+NMUkf/DUYWNFmO4Dg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542BDiT1019558
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 06:13:44 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 06:13:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 06:13:43 -0500
Received: from [10.249.134.35] ([10.249.134.35])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542BDb39062789;
	Fri, 2 May 2025 06:13:38 -0500
Message-ID: <87d38b3d-607d-45c3-8f29-70f6c01187db@ti.com>
Date: Fri, 2 May 2025 16:43:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] arm64: dts: ti: k3-am62x: Add required voltage
 supplies for TEVI-OV5640
To: Devarsh Thakkar <devarsht@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
 <20250429154133.3377962-5-r-donadkar@ti.com>
 <f73d24a6-7da6-4bcc-95ba-9d84b865a7a7@ti.com>
Content-Language: en-US
From: "Donadkar, Rishikesh" <r-donadkar@ti.com>
In-Reply-To: <f73d24a6-7da6-4bcc-95ba-9d84b865a7a7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 02-05-2025 14:37, Devarsh Thakkar wrote:
>
> On 29/04/25 21:11, Rishikesh Donadkar wrote:
>> The device tree overlay for TEVI-OV5640 requires following voltage
>> supplies:
>>
>> AVDD-supply: Analog voltage supply, 2.8 volts
>> DOVDD-supply: Digital I/O voltage supply, 1.8 volts
>> DVDD-supply: Digital core voltage supply, 1.5 volts
>>
> I think this contradicts the voltage mentioned in TEVI-OV56540 doc [1]
> which mention digital voltage as 3.3 volts ?


Thank you for pointing out, I will fix it.

>
>> Add them in the DT overlay.
>>
> [1]:
> https://www.technexion.com/wp-content/uploads/2023/09/product-brief_tevi-ov5640.pdf
>
> Regards
> Devarsh
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  | 32 +++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
>> index b6bfdfbbdd984..123ab0e5e8dfa 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
>> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
>> @@ -15,6 +15,33 @@ clk_ov5640_fixed: ov5640-xclk {
>>   		#clock-cells = <0>;
>>   		clock-frequency = <24000000>;
>>   	};
>> +
>> +	reg_2p8v: regulator-2p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "2P8V";
>> +		regulator-min-microvolt = <2800000>;
>> +		regulator-max-microvolt = <2800000>;
>> +		vin-supply = <&vcc_3v3_sys>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_1p8v: regulator-1p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "1P8V";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		vin-supply = <&vcc_3v3_sys>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_1p5v: regulator-1p5v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "1P5V";
>> +		regulator-min-microvolt = <1500000>;
>> +		regulator-max-microvolt = <1500000>;
>> +		vin-supply = <&vcc_3v3_sys>;
>> +		regulator-always-on;
>> +	};
>>   };
>>   
>>   &main_i2c2 {
>> @@ -40,6 +67,11 @@ ov5640: camera@3c {
>>   
>>   				clocks = <&clk_ov5640_fixed>;
>>   				clock-names = "xclk";
>> +
>> +				AVDD-supply = <&reg_2p8v>;
>> +				DOVDD-supply = <&reg_1p8v>;
>> +				DVDD-supply = <&reg_1p5v>;
>> +
>>   				powerdown-gpios = <&exp1 13 GPIO_ACTIVE_LOW>;
>>   
>>   				port {
