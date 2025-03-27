Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471F9C2C8;
	Thu, 27 Mar 2025 04:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743048775; cv=none; b=TAfM+XA4NdoXysTYjVf+kAgUq6KPAmBe0Z4jW0UqhJapFQ1V3q9cu656SqXQec9UUZ3Li7omG7iK6PEZhbkWJexoVucwSH0R1qvnV6fru00bkLzOA+j6ccJq/P/HEOvVgHAWp5+3KECzsMsmp4XcZ20MWgT0BAwrAerpvYEZCeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743048775; c=relaxed/simple;
	bh=JmCZSUbNWMfIFUh6Av6OLQn87rP1uQlH7td6P0E7CEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ItkOgtePFRtvnIS3WWGl6hlJ2xmfj9zenLMCPz0/C/ndclsWLhWdK7j7ocQxOAnWR2MF/NoqU4PnNsyjvBiY8d69Mgr0EwH40EeNnUibcakfU2qScyYj/4oJPbF/Dyyo4tlbKp4mv3FYIVyg1y3+EdxwtQwA0pAZYy72rpThTpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o5W243hy; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o5W243hy"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52R4CgO72377169
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Mar 2025 23:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743048762;
	bh=QTcUvUKbScEe+aC02fC8wk+Yibgrocm6jZqJKvio2YM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=o5W243hy9wtXdmPurOWIA15/QglK5GrnUCVZ43J+FL+RcULEpBWXXXckZfDfl6cs9
	 9Z0B2cd3CjqNfyAhXIIgFvEbpWjw35HZMFHMEasivGG5WU8dzPrxFDhduDWp+qvSpb
	 tY16gxj1F9yvWYHhuJD/ggqG4iW2ioFEQY4EpprQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52R4CgUQ033117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Mar 2025 23:12:42 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Mar 2025 23:12:42 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Mar 2025 23:12:41 -0500
Received: from [10.24.69.37] (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52R4CcVx045056;
	Wed, 26 Mar 2025 23:12:39 -0500
Message-ID: <bd7bee62-38fd-412b-a2d4-611890238e9e@ti.com>
Date: Thu, 27 Mar 2025 09:42:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: misc: bist: Add BIST dt-binding for TI
 K3 devices
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20241128140825.263216-1-n-francis@ti.com>
 <20241128140825.263216-2-n-francis@ti.com>
 <ho7ktcnbtl7mvamfthqho23co2fc4z7bgjha7pu4wivxm6ndhu@tfbpveonhckz>
 <837d329b-bcdd-4c3b-b508-e916b110ce25@ti.com>
 <e57dfc3e-b702-4803-b776-20c6dbd98fef@kernel.org>
 <8e58b093-1c64-45b9-a9d3-9835a3bbc4fd@ti.com>
 <1da4e402-62f3-4bad-9129-1f5a08148987@kernel.org>
 <f39d80fc-3600-4c2c-b09c-980288f86fa2@ti.com>
 <a2397c92-2884-4f4d-b036-808208892af5@kernel.org>
Content-Language: en-US
From: Neha Malcom Francis <n-francis@ti.com>
In-Reply-To: <a2397c92-2884-4f4d-b036-808208892af5@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 24/03/25 12:53, Krzysztof Kozlowski wrote:
> On 19/03/2025 10:02, Neha Malcom Francis wrote:
>> Hi Krzysztof,
>>
>> On 19/03/25 13:16, Krzysztof Kozlowski wrote:
>>> On 13/03/2025 12:14, Neha Malcom Francis wrote:
>>>> Hi Krzysztof
>>>>
>>>> On 29/11/24 14:45, Krzysztof Kozlowski wrote:
>>>>> On 29/11/2024 08:43, Neha Malcom Francis wrote:
>>>>>>>> +
>>>>>>>> +  power-domains:
>>>>>>>> +    maxItems: 1
>>>>>>>> +
>>>>>>>> +  ti,bist-instance:
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>> +    description:
>>>>>>>> +      the BIST instance in the SoC represented as an integer
>>>>>>>
>>>>>>> No instance indices are allowed. Drop.
>>>>>>>
>>>>>>
>>>>>> Question on this, this is not a property that is driven by software but rather 
>>>>>> indicates which register sequences have to be picked up for triggering this test 
>>>>>> from this instance. So I don't see how I can workaround this without getting 
>>>>>> this number. Or maybe call it ID rather than instance?
>>>>>
>>>>> I don't understand how the device operates, so what is exactly behind
>>>>> some sequences of registers for triggering this test. You described
>>>>> property as index or ID of one instance of the block. That's not what we
>>>>> want in the binding. That's said maybe other, different hardware
>>>>> characteristic is behind, who knows. Or maybe it's about callers... or
>>>>> maybe that's not hardware property at all, but runtime OS, who knows.
>>>>>
>>>>
>>>> Sorry for such a late reply, but I was hoping to get more details on
>>>> this "ID" and never got back to the thread...
>>>>
>>>> The best way I can describe is this device (BIST) runs a safety
>>>> diagnostic test on a bunch of processors/blocks (let's call them
>>>> targets). There's a mapping between the instance of this device and the
>>>> targets it will run the test. This ID was essentially letting the BIST
>>>> driver know which are these targets.
>>>
>>>
>>> So you want to configure some target? Then this is your property. If you
>>> want to configure 'foo' difference in DT, you do not write 'bar'...
>>>
>>
>> So the difficulty in doing this is, what I mentioned in the earlier
>> email just copying it over again:
>>
>> "Yet another way would be the BIST points out the targets it controls via
>> their phandles in its node... but this approach would trigger the probe
> 
> No, it would not. Which part of OF kernel code causes probe ordering
> (device links) if some random phandle appears?

Going through device links now, I realize I may have come to the wrong
conclusion while writing the driver. Let me try to respin the driver
using this approach then post which I will resume this series.

> 
>> of these targets before the test runs on them. And in hardware, the test
>> must run only one before the device is used, else we see indefinite
>> behavior."
>>
>> Property that has a list of strings (targets) instead of phandles maybe?
>> Would that be acceptable?
> 
> 
> 
> Best regards,
> Krzysztof

-- 
Thanking You
Neha Malcom Francis
