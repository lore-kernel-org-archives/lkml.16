Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498C8136A;
	Thu,  8 May 2025 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706592; cv=none; b=coBrK3lu5dHrpduocahlgrCd8HVHlVOhB6f8xmuicBz39TZaVpZXWaJhl/MV0QwHf178DzXxjBbe0Djl3a5fcqF+hUK2ulcDaDfHrs4wErQhWmvPl/5klq1HyPf7OHlvPNqPTVC9aCLBTMX0AiWH3qdzhCKuEg8041sy9S+a4qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706592; c=relaxed/simple;
	bh=/+MyKa2c23H6IuarHPujtgb7pa8hC7CWUMxIaIlmEDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mxytEVYsvzjfBTXZ0zetIF347zlRl/X3c0TPPFnHMfugwT0bZKijSZH0AggsBV2QLx7xx/o5t6xJj2vwokA30KZVAXWYYSs74P7vDmjTBUd8G0rGQwBS3hyhjgC4adwGCZM5gRWvnfT4z+jC9xbd3j2ax9DZqYndkcwxdTsG7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uT2VNFOt; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uT2VNFOt"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548CGENn1091456
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 07:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746706574;
	bh=15aok1oCi+ow5KG3/DT3pU2ISBdSkGTBhBS/f9pFazw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uT2VNFOtKoniv3xYTs8+bgmIt7UaDyl1H9flqDZSGyO2Ms0lVwp4VmNCFdwuwKDFW
	 2jTD3OIU/npASKwQmi/e0rswcm31BzqByY0UJTdHnc799fstLlakBfmSZ9yuVZ4Nq2
	 sM1IZlGoaPtQQCD5+oVWfzmHjUItGVTHB3vTSM2I=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548CGDsv024274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 07:16:14 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 07:16:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 07:16:11 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548CG7qW009348;
	Thu, 8 May 2025 07:16:07 -0500
Message-ID: <9cb4f94e-00e8-43d5-be7a-85dc1188e856@ti.com>
Date: Thu, 8 May 2025 17:46:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI
 OV5640
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>
References: <20250505115700.500979-1-y-abhilashchandra@ti.com>
 <20250505115700.500979-3-y-abhilashchandra@ti.com>
 <a6329e9d-409e-4f62-b26d-c4d0e49d772c@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <a6329e9d-409e-4f62-b26d-c4d0e49d772c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Udit,
Thanks for the review.

On 07/05/25 13:50, Kumar, Udit wrote:
> Hello Vaishnav/Abhilash
> 
> Thanks for patch
> 
> On 5/5/2025 5:27 PM, Yemike Abhilash Chandra wrote:
>> From: Vaishnav Achath <vaishnav.a@ti.com>
>>
>> TechNexion TEVI OV5640 camera is a 5MP camera that can be used with
>> J722S EVM through the 22-pin CSI-RX connector. Add a reference overlay
>> for quad TEVI OV5640 modules on J722S EVM.
>>
>> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/Makefile               |   4 +
>>   .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 358 ++++++++++++++++++
>>   2 files changed, 362 insertions(+)
>>   create mode 100644 
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
>>
>> diff --git a/arch/arm64/boot/dts/ti/Makefile 
>> b/arch/arm64/boot/dts/ti/Makefile
>> index 829a3b028466..76b750e4b8a8 100644
>> --- a/arch/arm64/boot/dts/ti/Makefile
>> +++ b/arch/arm64/boot/dts/ti/Makefile
>> @@ -123,6 +123,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>>   dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
>>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
>> [..]
>> diff --git 
>> a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso 
>> b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
>> new file mode 100644
>> index 000000000000..537224ea60e3
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
>> @@ -0,0 +1,358 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * 4 x TEVI OV5640 MIPI Camera module on RPI camera connector.
>> + *
>> + * Copyright (C) 2024 Texas Instruments Incorporated - 
>> https://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include "k3-pinctrl.h"
>> +
>> +&{/} {
>> +    clk_ov5640_fixed: clock-24000000 {
>> +        compatible = "fixed-clock";
>> +        #clock-cells = <0>;
>> +        clock-frequency = <24000000>;
>> +    };
>> +
> 
> Please check once , this is clock is 25M or 24M .
> 
> As I see CDC6CE025000ADLXT/U28 is marked as 25M OSC
> 

This is the crystal clock with in the sensor.

>> +    reg_2p8v: regulator-2p8v {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "2P8V";
>> +        regulator-min-microvolt = <2800000>;
>> +        regulator-max-microvolt = <2800000>;
>> +        vin-supply = <&vdd_sd_dv>;
>> +        regulator-always-on;
>> +    };
>> +
>> +    reg_1p8v: regulator-1p8v {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "1P8V";
>> +        regulator-min-microvolt = <1800000>;
>> +        regulator-max-microvolt = <1800000>;
>> +        vin-supply = <&vdd_sd_dv>;
>> +        regulator-always-on;
>> +    };
>> +
>> +    reg_3p3v: regulator-3p3v {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "3P3V";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        vin-supply = <&vdd_sd_dv>;
>> +        regulator-always-on;
>> +    };
> 
> Sorry but on connector QSH-020-01-L-D-DP-A-K/J27, I see only 3v3 available.
> 
> May be I am missing something here but how you are getting 1v8 and 2v8 
> supply
> 

Yes, 3.3V is provided as the main input supply to the sensor.
However, required 1.8V and 2.8V rails from the 3.3V input.
Please refer to [1] for detailed information.

> 
>> +};
>> +
>> +
>> +&main_pmx0 {
>> +    cam0_reset_pins_default: cam0-default-reset-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x03c, PIN_OUTPUT, 7)
>> +        >;
>> +    };
>> +
> 
> Please mark GPIO you are using for this in comment
> 
> example
> 
> J722S_IOPAD(0x1dc, PIN_INPUT, 0) /* (C22) MCAN0_RX */
> 

Sure. Will do that.

> 
>> +    cam1_reset_pins_default: cam1-default-reset-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x044, PIN_OUTPUT, 7)
>> +        >;
>> +    };
>> +
>> +    cam2_reset_pins_default: cam2-default-reset-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x04c, PIN_OUTPUT, 7)
>> +        >;
>> +    };
>> +
>> +    cam3_reset_pins_default: cam3-default-reset-pins {
>> +        pinctrl-single,pins = <
>> +            J722S_IOPAD(0x054, PIN_OUTPUT, 7)
>> +        >;
>> +    };
>> +};
>> +
>> +&exp1 {
>> +    p06-hog{
>> +        /* P06 - CSI01_MUX_SEL_2 */
>> +        gpio-hog;
>> +        gpios = <6 GPIO_ACTIVE_HIGH>;
>> +        output-high;
>> +        line-name = "CSI01_MUX_SEL_2";
> 
> As per table on page 29
> 
> CSI01_MUX_SEL_2 as low means, INPUT<-- A Port [CSI2 Connector]
> 
> Please check, if you want to drive this line high or low

These are RPI connectors, It should be high.

> 
>> +    };
>> +
>> +    p07-hog{
>> +        /* P01 - CSI23_MUX_SEL_2 */
>> +        gpio-hog;
>> +        gpios = <7 GPIO_ACTIVE_HIGH>;
>> +        output-high;
>> +        line-name = "CSI23_MUX_SEL_2";
>> +    };
> 
> Same as for CSI01_MUX_SEL_2, table on page-30
> 
> 
>> +};
>> +
>> +&main_gpio0 {
>> +    p15-hog {
>> +        /* P15 - CSI2_CAMERA_GPIO1 */
>> +        gpio-hog;
>> +        gpios = <15 GPIO_ACTIVE_HIGH>;
>> +        output-high;
>> +        line-name = "CSI2_CAMERA_GPIO1";
>> +    };
>> +
>> +    p17-hog {
>> +        /* P17 - CSI2_CAMERA_GPIO2 */
>> +        gpio-hog;
>> +        gpios = <17 GPIO_ACTIVE_HIGH>;
>> +        output-high;
>> +        line-name = "CSI2_CAMERA_GPIO2";
>> +    };
>> +
>> +    p19-hog {
>> +        /* P19 - CSI2_CAMERA_GPIO3 */
>> +        gpio-hog;
>> +        gpios = <19 GPIO_ACTIVE_HIGH>;
>> +        output-high;
>> +        line-name = "CSI2_CAMERA_GPIO3";
>> +    };
>> +
>> +    p21-hog {
>> +        /* P21 - CSI2_CAMERA_GPIO4 */
>> +        gpio-hog;
>> +        gpios = <21 GPIO_ACTIVE_HIGH>;
>> +        output-high;
>> +        line-name = "CSI2_CAMERA_GPIO4";
>> +    };
> 
> Please check once if P21 and rest above are pin number of SOC ?
> 

Yes

> 
>> +};
>> +
>> +&pca9543_0 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    i2c@0 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        reg = <0>;
>> +
>> +        ov5640_0: camera@3c {
>> +            compatible = "ovti,ov5640";
>> +            reg = <0x3c>;
>> +            clocks = <&clk_ov5640_fixed>;
>> +            clock-names = "xclk";
>> +
>> +            AVDD-supply = <&reg_2p8v>;
>> +            DOVDD-supply = <&reg_1p8v>;
>> +            DVDD-supply = <&reg_3p3v>;
>> +
>> +            pinctrl-names = "default";
>> +            pinctrl-0 = <&cam0_reset_pins_default>;
> 
> do you think, you should have reset-gpios as property for this ov5640 
> and other nodes too ?
> 

Thanks for pointing this out. I will add that in the next revision.

Thanks and Regards
Yemike Abhilash Chandra


[1]:https://www.technexion.com/wp-content/uploads/2023/09/product-brief_tevi-ov5640.pdf

> 
>> +
>> [..]
