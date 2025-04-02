Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5DF233727;
	Wed,  2 Apr 2025 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586190; cv=none; b=UXIQbF4w48JQlj5F21QcuYqrTTHuD46eZZoYU4UQqit7Pe6XncooSQM57KYZFxeHg0vEOMYnozgWsCX8RXt6FGBoeNX/pbKrwZDeGkIHxYqaP0usU7VN5kl1GK6iZ8/YAzH/SdGLIMh9Iv8fgqNZtngmiS4+dJvnnspO8thpn2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586190; c=relaxed/simple;
	bh=oTNcPm9CQ+qW72NuToGQZDO4pNruAfzTixpa9SRTHYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bZ+aCTmn8TpVb9qNG7nlg7PXqzLtGaIgYAeSC5oZ4X0pZgRPfjsD9D7a8xeG/nmQUKc9wRZG66j986r6a4WhKxXRWwiuAi/mFQuQZq+4WkqPkc6XfYlyhDk3WJc9VeKl/GADnJeaWDU24cMQQR5rjpY51ySYhkHhqx1I/gCh0eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o93tEZRE; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o93tEZRE"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5329TcIv3883367
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Apr 2025 04:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743586178;
	bh=JyPZl8MjDJAyq5XxRRx62R/Qh5a744uvuUmkjqbA0Qc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=o93tEZRE6wTUbVpeez+hnlVOzkJ7fxp8EcrneN4/uJAPO7Yn9d6S9ojHUeEmLZ8o5
	 OiC9FElbGeiJVToUwH6eXt2PORPfsS+OysLMZjw3eoJh8S1EoBmJCCSVM2wDtOCYft
	 WmdGNSLxrTaWBRKUZifc7Y979b5pamgIKRko6eu4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5329TcQD050918;
	Wed, 2 Apr 2025 04:29:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 04:29:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 04:29:38 -0500
Received: from [10.24.68.210] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5329TY1R026769;
	Wed, 2 Apr 2025 04:29:35 -0500
Message-ID: <6d4d8d36-5c15-492d-8adf-17d95ae1e38b@ti.com>
Date: Wed, 2 Apr 2025 14:59:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: soc: ti: ti,j721e-system-controller: Add
 PCIe ctrl property
To: Rob Herring <robh@kernel.org>, Andrew Davis <afd@ti.com>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241016233044.240699-1-afd@ti.com>
 <20241016233044.240699-2-afd@ti.com> <20241018130447.GA40439-robh@kernel.org>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20241018130447.GA40439-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Rob,

On 18/10/24 18:34, Rob Herring wrote:
> On Wed, Oct 16, 2024 at 06:30:40PM -0500, Andrew Davis wrote:
>> Add a pattern property for pcie-ctrl which can be part of this controller.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../bindings/soc/ti/ti,j721e-system-controller.yaml          | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> index 378e9cc5fac2a..2a64fc61d1262 100644
>> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> @@ -68,6 +68,11 @@ patternProperties:
>>       description:
>>         The node corresponding to SoC chip identification.
>>   
>> +  "^pcie-ctrl@[0-9a-f]+$":
>> +    type: object
>> +    description:
>> +      This is the PCIe control region.
> 
> What goes in this node?

This node corresponds to PCIe control register
(used/updated by j721e_pcie_driver for setting the mode, RC or EP)

There are new overlays now that need to be updated as well, with
each SoC.
Will re-roll v2 with updated description and examples in the bindings
and taking into account the new overlays.

Warm Regards,
Jayesh

> 
>> +
>>   required:
>>     - compatible
>>     - reg
>> -- 
>> 2.39.2
>>
