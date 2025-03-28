Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B41EEE6;
	Fri, 28 Mar 2025 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165790; cv=none; b=AANrE5cSrXK5wX0Q4ou/aAwYk4mQEPqO1lGWm9NKy3AIA6pQxZ3Y0qk5RejpMsrppW20sxBK8O8ymwMXl0FEJD+VCbRoRCbwSZPQUO6qSI3BPyOgq7Oyw4bpEcJRA7R+Dp74+asCBpia8whaTm0/mpNtLPWbSsbqm7zb8heUMjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165790; c=relaxed/simple;
	bh=oPpOUjjYcmBqnhn28AbXabU2P9tkrXx7l3Xf3nge+HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bW2Q+1AEPD9Ji6FbevOZysymGtwqBiJ5WZ6IVWyyk23vTtzBB3nnLJ79J/mVmILSzBbpvSC4PQGmxIAOeCCoA7alfWBJj2jWoHHY2XieApI0imSM8/x6VkXHfaWpqRLC1bQitYYwIh5SqkT8PX9TW7sgd1XP0tfkWwOP38W7f7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KutOjeNG; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KutOjeNG"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SCh0Ol2149260
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 07:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743165780;
	bh=vnX3eQ6ImWFHV3yinCub9dwiAWQ/AdU8d6C5xkRCwOM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KutOjeNG6E928QIhhp6BEZu1OUKddC2aamjOjK+7Z3uTxxtq/oCZMZi7GeS8bNcGH
	 SKZXtVdRxuJ9r6MTTqs5rYvpciQPe0ptnxnLP2imOBlcLAK5KWvGrLxqjWKi1g8k/3
	 ptooCMuhlInRQ4sZiQ+jUrxcgb9xXU17ixenjA00=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SCh0mK001229
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 07:43:00 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 07:42:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 07:43:00 -0500
Received: from [10.24.69.37] (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SCguCw001359;
	Fri, 28 Mar 2025 07:42:57 -0500
Message-ID: <71f19095-02c5-4d9a-8c6f-c51fb4ea9b36@ti.com>
Date: Fri, 28 Mar 2025 18:12:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: ti: bist: Add BIST for K3
 devices
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250328111439.374748-1-n-francis@ti.com>
 <20250328111439.374748-2-n-francis@ti.com>
 <fc4d9a33-2d3f-47e2-b1cf-59962cc54bce@kernel.org>
Content-Language: en-US
From: Neha Malcom Francis <n-francis@ti.com>
In-Reply-To: <fc4d9a33-2d3f-47e2-b1cf-59962cc54bce@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 28/03/25 17:18, Krzysztof Kozlowski wrote:
> On 28/03/2025 12:14, Neha Malcom Francis wrote:
>> +properties:
>> +  compatible:
>> +    const: ti,j784s4-bist
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: cfg
>> +      - const: ctrl_mmr
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  ti,bist-under-test:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +      the device IDs of the devices under test control of the BIST device, the
> 
> Still not phandle... What is a "device ID"?

I took a shot at working with the phandle, however the test devices may
or may not be present in the devicetree at bootloader stage which is the
only place this BIST driver can execute (I know I shouldn't be bringing
up the driver here but it's crucial to how I can model this property).
HW mandates you run it as early as possible before any other software
executes on the test device.

So now thinking of other possible ways to define the test devices, we
have unique HW identifiers [1] for each of the device which is what I've
used here...

[1]
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/arm/keystone/ti%2Ck3-sci-common.yaml#L31

> 
>> +      number of devices may be more than one. The HW logic will trigger the
>> +      tests on all of these devices at once.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - ti,bist-under-test
>> +
>> +additionalProperties: false
> 
> 
> Best regards,
> Krzysztof

-- 
Thanking You
Neha Malcom Francis
