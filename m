Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779F51FBCB2;
	Tue,  8 Apr 2025 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102933; cv=none; b=Irtg3yjyDmPfQeJa9DvFf3Ui/NsQwM15z4DR/BbbNHI3M+GkiLhQb/fSPr4Krn1WgsMnjPe8sOyy1PErTdm16Z4I0mbyl8SduB8ntypQb55QRV91AkkU9H9lib4MNsZTXgKNBpMOXiUaZdo2d+EdJbceTfimsScrlPZsCFgJHyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102933; c=relaxed/simple;
	bh=z7Cha15V0ILDrcP5b0jRZklccvtk7v7vO6gT5GgZFFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b/QDS2oD1N9MuMQsE5thULLmlX79gF1Mzf+WjJSCnGU7NUpqpqjBQfWrVcuuPj3d5kJ51r8fkTc+bKbLigkNCg3OlsUW08weKafUXb2U89pgAhhzbt4fWIdUUolRCNt5+h0rO59FVMQL+dUC8c2HfWzIZFz7OOADv4Gh8w/VwwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JOkLFO3x; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JOkLFO3x"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53891hi11160287
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 04:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744102903;
	bh=rrO5+3jLA9u6YmdlYq07ISlibfw3+DurUYygTV//ofg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JOkLFO3xUToYd/3n7owkQSKS7En/kxmM0K9OB3M57N7mEAnePlon7ZipaD19H72SM
	 aDjEp7Z5mVR9nQ0po4zpI+gx6cP9pkhfZwoX1gsFCuy9rtRE/VFjF+z96brCVBwbNe
	 0RRMPjd0JFmcXmkveJtIfCygdZBGzEn6izsX3Rzk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53891hYc094144
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 04:01:43 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 04:01:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 04:01:42 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53891cZ8017127;
	Tue, 8 Apr 2025 04:01:39 -0500
Message-ID: <c1762c69-6a76-4f89-ab64-e6d9215e1be2@ti.com>
Date: Tue, 8 Apr 2025 14:31:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: ti: k3-j721e-sk: Fix dtbs_check warnings
 in IMX219 overlay
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <jai.luthra@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
 <20250401114053.229534-4-y-abhilashchandra@ti.com>
 <20250407134523.d56rjpydflmkw2ze@privatize>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250407134523.d56rjpydflmkw2ze@privatize>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth,

On 07/04/25 19:15, Nishanth Menon wrote:
> $subject - the patch adds description for the supplies for the sensor.
> Please fix the description.
> 

In this patch, I am addressing all dtbs_check warnings generated from 
this overlay:

1. Adding the missing regulator node
2. Removing the incorrectly added clock-names property

Due to the inclusion of both changes, I opted for a more generic commit 
title.
Please let me know if you want me to split this patch into two separate 
patches
with specific commit titles and commit messages.

Thanks and Regards
Yemike Abhilash Chandra

> On 17:10-20250401, Yemike Abhilash Chandra wrote:
>> The device tree bindings mandate three regulator nodes for the IMX219
>> sensor: VANA (analog), VDIG (digital core), and VDDL (digital I/O). Add the
>> necessary regulator nodes in the device tree overlay and also the device
>> tree bindings do not include a clock-names property. Remove the incorrectly
>> added clock-names entry to avoid dtbs_check warnings.
>>
>> Fixes: f767eb918096 ("arm64: dts: ti: k3-j721e-sk: Add overlay for IMX219")
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   .../dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  | 35 +++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
>> index 47bb5480b5b0..4eb3cffab032 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
>> @@ -19,6 +19,33 @@ clk_imx219_fixed: imx219-xclk {
>>   		#clock-cells = <0>;
>>   		clock-frequency = <24000000>;
>>   	};
>> +
>> +	reg_2p8v: regulator-2p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "2P8V";
>> +		regulator-min-microvolt = <2800000>;
>> +		regulator-max-microvolt = <2800000>;
>> +		vin-supply = <&vdd_sd_dv>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_1p8v: regulator-1p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "1P8V";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		vin-supply = <&vdd_sd_dv>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_1p2v: regulator-1p2v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "1P2V";
>> +		regulator-min-microvolt = <1200000>;
>> +		regulator-max-microvolt = <1200000>;
>> +		vin-supply = <&vdd_sd_dv>;
>> +		regulator-always-on;
>> +	};
>>   };
>>   
>>   &csi_mux {
>> @@ -34,7 +61,9 @@ imx219_0: imx219-0@10 {
>>   		reg = <0x10>;
>>   
>>   		clocks = <&clk_imx219_fixed>;
>> -		clock-names = "xclk";
>> +		VANA-supply = <&reg_2p8v>;
>> +		VDIG-supply = <&reg_1p8v>;
>> +		VDDL-supply = <&reg_1p2v>;
>>   
>>   		port {
>>   			csi2_cam0: endpoint {
>> @@ -56,7 +85,9 @@ imx219_1: imx219-1@10 {
>>   		reg = <0x10>;
>>   
>>   		clocks = <&clk_imx219_fixed>;
>> -		clock-names = "xclk";
>> +		VANA-supply = <&reg_2p8v>;
>> +		VDIG-supply = <&reg_1p8v>;
>> +		VDDL-supply = <&reg_1p2v>;
>>   
>>   		port {
>>   			csi2_cam1: endpoint {
>> -- 
>> 2.34.1
>>
> 
