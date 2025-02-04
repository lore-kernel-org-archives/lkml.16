Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEC5204F97;
	Tue,  4 Feb 2025 22:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738707545; cv=none; b=myDM2FSv/qdk7h/aEHDTNjIHOQ0uM0WXCXayiBv6bS2SAyTheN+e7OKtgtcq+g2skmWHyjxDOA6QH8/RGBMjhm5hDS+OeGspO0fpgANn8z4hWFQI5zxuPhn7UUawtHN2p3vkR5tNrLbqzhc7SF3YnR178kizQNEAXNMhCeMdfuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738707545; c=relaxed/simple;
	bh=mSWTaA4FOlQK8u5GFPiFaC9fwmBYXbSR8hWenUFKaFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eZqwnSsT3FZa39zFamUHOvk7JBvB5xcB37VAOV3hO2CZ+aKvIl5HoQ0k15vdl+HjHYVQ0114bCmI3HuAVw4wiVA6mxKZwzCk8McjdhpNQYMWk7D0cD2aW8KMHJK43lcX8v2tcy4/qy8wuX94pgBH+EV/x7VTS1gsGfgI81iOlkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pqq5Wjkq; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pqq5Wjkq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514FmQVV029185;
	Tue, 4 Feb 2025 16:19:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Jv5/X67eBTDFxWuGtLlJUmwB8Jbwp9sphVD7sIs3Sbg=; b=
	pqq5WjkqMzIZ8eYAfzDbPNIcURiz/KzHttv8dt1iot+SEUUTN2oLHrsfZS+xNEJL
	o7XFxWjRnKOnKiSYJL0cVYkiYq1F0IF+tFMzRuo+aLga20UAnGErckbzjeNx5JfU
	A7Zcr0O69Ep/hVCpg7FlHR998/MvEebsvbuGJtOuve6vePVCiuLjfAQUIFF1LrU2
	RehryqlwnrUOOIo9MYIkUTZyn7KXgxUI6oOkdveJXPn5tX3vKlgiUBYS5aJ6Cu4V
	s1dLsm8tpWENIbE0dDfywEWzcDuGuU0ZZaQdDNSfqo//o9dax3PnyIRV/vWSWUtK
	2PxcWe1XpDfMkDCO9ok4jg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw53mgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 16:19:00 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 22:18:57 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 22:18:57 +0000
Received: from [141.131.145.81] (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9BBB8820248;
	Tue,  4 Feb 2025 22:18:56 +0000 (UTC)
Message-ID: <eb2c68a5-e73d-44c9-9d73-0842f88d09e3@opensource.cirrus.com>
Date: Tue, 4 Feb 2025 16:18:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] dt-bindings: mfd: cirrus,cs40l26: Support for CS40L26
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
 <20250131195639.1784933-5-ftreven@opensource.cirrus.com>
 <20250202-stoic-skunk-of-promise-cc3c4f@krzk-bin>
From: Fredrik Treven <ftreven@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20250202-stoic-skunk-of-promise-cc3c4f@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v_LCcHuAqmbTcA_SxxhNfcQ32Bd0P8wd
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a29254 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=gEfo2CItAAAA:8 a=w1d2syhTAAAA:8 a=vVFwVY_uJSW2FAkeCz4A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: v_LCcHuAqmbTcA_SxxhNfcQ32Bd0P8wd
X-Proofpoint-Spam-Reason: safe

On 2/2/25 08:04, Krzysztof Kozlowski wrote:
> On Fri, Jan 31, 2025 at 01:56:35PM -0600, Fred Treven wrote:
>> Introduce required basic devicetree parameters for the
>> initial commit of CS40L26.
> 
> 
> This looks like soundy thing, why isn't this in sound? but title
> mentions haptic, so maybe input?
> 
> Anyway, not MFD.
> 
> 
You are correct; this belongs in input. I will resolve this in v2
after I have done my resend to properly thread the patches in this set.
>>
>> Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
>> ---
>>   .../bindings/mfd/cirrus,cs40l26.yaml          | 81 +++++++++++++++++++
>>   MAINTAINERS                                   |  4 +-
>>   2 files changed, 83 insertions(+), 2 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml b/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
>> new file mode 100644
>> index 000000000000..a3cccb1a2d92
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
>> @@ -0,0 +1,81 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/cirrus,cs40l26.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Cirrus Logic CS40L26 Boosted Haptic Amplifier
>> +
>> +maintainers:
>> +  - Fred Treven <ftreven@opensource.cirrus.com>
>> +  - patches@opensource.cirrus.com
>> +
>> +description:
>> +  CS40L26 is a Boosted Haptic Driver with Integrated DSP, Waveform Memory,
>> +  Advanced Closed Loop Algorithms, and LRA protection
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - cirrus,cs40l26a
>> +      - cirrus,cs40l27b
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  va-supply:
>> +    description: Regulator for VA analog voltage
>> +
>> +  vp-supply:
>> +    description: Regulator for VP voltage
>> +
>> +  cirrus,bst-ipk-microamp:
>> +    description:
>> +      Maximum current that can be drawn by the device's boost converter.
>> +    multipleOf: 50000
>> +    minimum: 1600000
>> +    maximum: 4800000
>> +    default: 4500000
>> +
>> +  cirrus,bst-ctl-microvolt:
>> +    description: Maximum target voltage to which DSP may increase the VBST supply.
> 
> There is no such supply as VBST (see above, I see only VA and VP), so is this output?
VBST is not a supply of the device. Rather, it is configuring the device for
an external boost circuit.
> 
>> +    multipleOf: 50000
>> +    minimum: 2550000
>> +    maximum: 11000000
>> +    default: 11000000
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - reset-gpios
> 
> Supplies as well
> 
> 
I will add the supplies here in v2 after I have done my resend to fix the
threading of the patches in this set.
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      haptic-driver@58 {
>> +        compatible = "cirrus,cs40l26a";
>> +        reg = <0x58>;
>> +        interrupt-parent = <&gpio>;
>> +        interrupts = <57 IRQ_TYPE_LEVEL_LOW>;
>> +        reset-gpios = <&gpio 54 GPIO_ACTIVE_LOW>;
>> +        va-supply = <&vreg>;
>> +        vp-supply = <&vreg>;
>> +        cirrus,bst-ctl-microvolt = <2600000>;
>> +        cirrus,bst-ipk-microamp = <1650000>;
>> +      };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index bc8ce7af3303..9c4105bf0a32 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -5546,11 +5546,11 @@ F:	sound/soc/codecs/cs*
>>   
>>   CIRRUS LOGIC HAPTIC DRIVERS
>>   M:	James Ogletree <jogletre@opensource.cirrus.com>
>> -M:	Fred Treven <fred.treven@cirrus.com>
>> +M:	Fred Treven <ftreven@opensource.cirrus.com>
>>   M:	Ben Bright <ben.bright@cirrus.com>
>>   L:	patches@opensource.cirrus.com
>>   S:	Supported
>> -F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
>> +F:	Documentation/devicetree/bindings/input/cirrus,cs40l*
> 
> So input or mfd? I don't understand this.
The driver is mfd that utilizes both ASoC and Input FF subsystems.
> 
> Best regards,
> Krzysztof
> 

