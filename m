Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE29A381A3;
	Thu, 10 Apr 2025 07:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269942; cv=none; b=MOqtRks2Pxfpibv1liXwXiVHpwGUA7LroWakA7UQ3e5SzUAqIcobmy0p+updVyMxqEZiLLFCFQj9+r5D14PecNUQrru7cgQhxvliIIdDwkcx5+pwmG5IhlGBAzkd5daFP83lnmL8fvdlEtsfDUmhumBCY6cIiWUcc+MYhMyCWBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269942; c=relaxed/simple;
	bh=wdhexpca82pOg2frcD7dElT2Y9hP2W3XNJhHJVyO12g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wzo7iN+Pms70wqo2RihRYQAnajdq2l1hqJ7nmF5fFjL7Vk4kq4FTg98GeWmomkimhXcFa5f/5Me22MvEM/dvEjLL6qTgpV9AzabdKvjkeY9lSi90OmoW+7GRIwRF+VOpmPApT8AHKrQKaImqDZcQ1yw7X2BsAwbqNVO+6dZhp7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rhZA+x/q; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rhZA+x/q"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53A78u1U1199054
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 02:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744268937;
	bh=AJ5g9/Dd1PSleXQIVwzaLKCRegVo7owIHyrp8FOD2xs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rhZA+x/q5M8yvne56uwJC8GvYS8ZlRWLekbC2E51stJEBZAqZ3IKrLC/N5Y0e/XLm
	 T9g5EMlmM11Nd3s+B0yNvJqdp9EgeMa+BLgwCaqp5bPDfRaxqASsaoX701axKFy+U9
	 tIAWqEGnejGBGdLfZnOwbTCBzfAR4SsjgK2ulHkM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53A78uDJ101138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 02:08:56 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 02:08:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 02:08:56 -0500
Received: from [10.24.69.37] (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53A78rVw035873;
	Thu, 10 Apr 2025 02:08:53 -0500
Message-ID: <0f1dc639-20e1-49b2-a813-08b6c8a94744@ti.com>
Date: Thu, 10 Apr 2025 12:38:52 +0530
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
 <71f19095-02c5-4d9a-8c6f-c51fb4ea9b36@ti.com>
 <26ab079e-9178-4936-9dd9-6aa66916a59a@kernel.org>
Content-Language: en-US
From: Neha Malcom Francis <n-francis@ti.com>
In-Reply-To: <26ab079e-9178-4936-9dd9-6aa66916a59a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 29/03/25 10:08, Krzysztof Kozlowski wrote:
> On 28/03/2025 13:42, Neha Malcom Francis wrote:
>> On 28/03/25 17:18, Krzysztof Kozlowski wrote:
>>> On 28/03/2025 12:14, Neha Malcom Francis wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    const: ti,j784s4-bist
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: cfg
>>>> +      - const: ctrl_mmr
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  ti,bist-under-test:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    description:
>>>> +      the device IDs of the devices under test control of the BIST device, the
>>>
>>> Still not phandle... What is a "device ID"?
>>
>> I took a shot at working with the phandle, however the test devices may
>> or may not be present in the devicetree at bootloader stage which is the
> 
> If the nodes are not in DT, then you should not reference them here.
> Bootloader is supposed to receive all the nodes it is expected to work on.

Understood.

> 
>> only place this BIST driver can execute (I know I shouldn't be bringing
>> up the driver here but it's crucial to how I can model this property).
>> HW mandates you run it as early as possible before any other software
>> executes on the test device.
>>
>> So now thinking of other possible ways to define the test devices, we
>> have unique HW identifiers [1] for each of the device which is what I've
>> used here...
>>
>> [1]
>> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/arm/keystone/ti%2Ck3-sci-common.yaml#L31
> 
> Then do not redefine properties, but use one common definition.

Right, I'll respin the driver and the dt-binding in this direction, thanks!

> 
> 
> Best regards,
> Krzysztof

-- 
Thanking You
Neha Malcom Francis
