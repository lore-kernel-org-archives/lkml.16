Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D12AD3E;
	Fri,  2 May 2025 11:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184185; cv=none; b=hptrQFbLqGVpdX5WfpJ0rZEXHP9e/1ETzEJoQkSoifm9ys9tqbyOaYUtlH4mSuLGGHlYLVeVy+AAgH+ZDMbtrWbn5CnINF6etv8+d5on4yCRkunIDXQLwfqN8qOLU0gcCyBZxwISBBF7ONE81D7kgPqwS0y/auUHOOekNCKc3uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184185; c=relaxed/simple;
	bh=1KupARu2ixwnWnF/VeD8fbwWOgpRBQAhNeatCM2WB28=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CZPgUPb2EKEk77j27UiqCg8TPc7ZGu46wh4Bj5XrVR62W3ZNa60Ty3rIE3qOMJ8TVKGIzdmN3sP1DGz4WznLH9MQ2Tr/ruvPwHUSY6r0PFNxnFAYkXmqUcWQpCqcgWBb++jgqRTezVP4UneaI4TFdw1H2k1y7OWQF9ih7SjyBnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NirENkiQ; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NirENkiQ"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542B9UKj389669
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 06:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746184170;
	bh=Tz0Qyi+rYLdiyL94yfUmQf0GAPdsB4sjN3Vr+h5NUMw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NirENkiQRPkeD/oD+xACE05qKJzX4WNXrM2HgkHdb6nSm78hCRUW+iwVZ3IP4u9mS
	 rFdkMyrUnQlr8YUUlGapbbtEiTjKo1I91LjamguOPa1GBXTl3X4OI/srLjl2o50AaN
	 G4wutEZjEYRTzR+oO/kuiPNbUhAXtDzvSqwxOkc8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542B9UTB017423
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 06:09:30 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 06:09:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 06:09:30 -0500
Received: from [10.249.134.35] ([10.249.134.35])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542B9OFu058493;
	Fri, 2 May 2025 06:09:25 -0500
Message-ID: <19dd4cc6-c110-4c2d-b725-5e7bd1a4226c@ti.com>
Date: Fri, 2 May 2025 16:39:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: ti: k3-am62x: Add required voltage
 supplies for IMX219
To: Devarsh Thakkar <devarsht@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
 <20250429154133.3377962-3-r-donadkar@ti.com>
 <f223d5ec-5549-414a-842d-b9aeb80915e5@ti.com>
Content-Language: en-US
From: "Donadkar, Rishikesh" <r-donadkar@ti.com>
In-Reply-To: <f223d5ec-5549-414a-842d-b9aeb80915e5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 02-05-2025 13:45, Devarsh Thakkar wrote:
> On 29/04/25 21:11, Rishikesh Donadkar wrote:
>> The device tree overlay for the IMX219 sensor requires three voltage
>> supplies to be defined: VANA (analog), VDIG (digital core), and VDDL
>> (digital I/O).
>>
>> Add the corresponding voltage supply definitions to avoid dtbs_check
>> warnings.
>>
> On a side-note device-tree overlay requiring these voltages is an
> implied reason, it's mainly because the schematics mention that and
> bindings want to capture same topography in device-tree too.
>
> So maybe good to mention that and share schematic link too in commit
> message :
>
> https://datasheets.raspberrypi.com/camera/camera-module-2-schematics.pdf
>
> With these changes, feel free to add,
>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Hi Devarsh, Thanks for the review. I will do this in the next revision.
>
> Regards
> Devarsh
>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso  | 31 +++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
>> index dd090813a32d6..149c59c071823 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
>> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
>> @@ -15,6 +15,33 @@ clk_imx219_fixed: imx219-xclk {
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
>> +	reg_1p2v: regulator-1p2v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "1P2V";
>> +		regulator-min-microvolt = <1200000>;
>> +		regulator-max-microvolt = <1200000>;
>> +		vin-supply = <&vcc_3v3_sys>;
>> +		regulator-always-on;
>> +	};
>>   };
>>   
>>   &main_i2c2 {
>> @@ -40,6 +67,10 @@ ov5640: camera@10 {
>>   
>>   				clocks = <&clk_imx219_fixed>;
>>   
>> +				VANA-supply = <&reg_2p8v>;
>> +				VDIG-supply = <&reg_1p8v>;
>> +				VDDL-supply = <&reg_1p2v>;
>> +
>>   				reset-gpios = <&exp1 13 GPIO_ACTIVE_HIGH>;
>>   
>>   				port {
