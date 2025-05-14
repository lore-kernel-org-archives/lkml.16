Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6E71F4261;
	Wed, 14 May 2025 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217417; cv=none; b=mZ67DEEzESxGCJ8hJtKZZUYe2nWGXA97gsP6JK0EAcKIMpAFYQe1YPtFSws5WpT8wug42zh5VZN1JzsXVfB6OF1mNCLlU6f2oNSnwr7kCGW0D00zrhlg6fB86rKPlvNFhcV0SXjioEjto1HFu7aRZx/g3R9paZCXsICjdWCBlSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217417; c=relaxed/simple;
	bh=Rnp4YFwxvkQA1GE+Gc5m7dCLgWzNM8KPkmN7EVB1ut8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqAVrCR6MiW9sYUFU4Dxn/fE6EhNqh6Td/lJ1/H6boa622ATt6/4otGNiGAWQ8DB+4Ifd+rYxg3wX6BQx49xtleiOtn794zcQdQtM8YvZ832+ZpXbWruXhX/tFtBWNEgS02B0/We+nQxBU+v1SlCwkXWxoo3rvpBYveEWu8VsE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0oxu1o4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0oxu1o4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AD0C4CEE9;
	Wed, 14 May 2025 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747217415;
	bh=Rnp4YFwxvkQA1GE+Gc5m7dCLgWzNM8KPkmN7EVB1ut8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K0oxu1o4qKpgt9uIubVnm+1eo4YGAql5YLMbzrswl7JBo8JMQFWTD0nT4HJXDKnXf
	 BdXkFyKEIGgQrgryALKU7HfyGnnpVP1bPehV24KDVGnS6uFXCfjTb2BtZLtX2nw/GU
	 VD7W3dwd/nYOiASZOqEU8ShIajVVq4bZfeYZ8lP/MAO/vBhnUPpBl414RlwUzAphNe
	 a1gVL+3KKN7ojRSN7eItovfMJt1Ho47PFAEsW/s4rp+a4yO6VEyr2VILVzvOuHz0I5
	 9wefl0gAwYO8x0lBmD+lcq/0rQHcSlO9RS4uPN6YRPfFEJLMDG4FYtpbXPZY8J/AGC
	 zwRtIdQIrwJPQ==
Message-ID: <ef92c390-d136-46b4-8219-294c449e4092@kernel.org>
Date: Wed, 14 May 2025 12:10:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Vikash Bansal <vikash.bansal@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Shashank Rebbapragada <shashank.rebbapragada@nxp.com>,
 Frank Li <frank.li@nxp.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
 <17145d2f-5d07-4939-8381-74e27cde303c@kernel.org>
 <GVXPR04MB9778335A5DFAB37CC8D011FC9997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <GVXPR04MB9778335A5DFAB37CC8D011FC9997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/05/2025 13:45, Aman Kumar Pandey wrote:
>>>
>>> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>>> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
>>> ---
>>> V1 -> V2: Cleaned up coding style and addressed review comments
>>> ---
>>>  .../bindings/i3c/p3h2840-i3c-hub.yaml         | 332 ++++++++++++++++++
>>
>> Not much improved. I have doubts that you really looked at other bindings.
>>
>> Filename matching compatible.
>>
>>
> 
> Thanks for reviewing the patch.
> There is no existing entry like this one. It is the first device tree entry for any i3c target device being added to Linux upstream. 
> For I3C target device, compatible is not required as per i3c.yml. I am adding compatible for backward compatibility with i2c binding ( i3c target device have backward compatibility). 
> Should I use compatible matching filename in this case ?

Do you have compatible here? Yes, you have, so I do not get what is
unclear in my comment. Rename the binding to match the compatible, which
you have here.


> 
>>>  MAINTAINERS                                   |   8 +
>>>  2 files changed, 340 insertions(+)
>  
>  
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^hub@[@.*]+,[0-9a-f]+$"
>>
>> Drop
>>
> 
> Sorry, did not understand your point. Could you please give some clarification ?

Drop this nodename. Remove it.

> 
>>> +
> 
>>> +
>>> +  cp0-ldo-enable:
>>> +    type: boolean
>>> +    description:
>>> +      Enables the on-die LDO for controller Port 0.
>>> +
>>> +  cp1-ldo-enable:
>>> +    type: boolean
>>> +    description:
>>> +      Enables the on-die LDO for controller Port 1.
>>> +
>>> +  tp0145-ldo-enable:
>>> +    type: boolean
>>> +    description:
>>> +      Enables the on-die LDO for target ports 0/1/4/5.
>>> +
>>> +  tp2367-ldo-enable:
>>> +    type: boolean
>>> +    description:
>>> +      Enables the on-die LDO for target ports 2/3/6/7.
>>> +
>>
>> NAK for all above properties.
>>
> 
> These are not vender specific properties. all these properties are as per i3c hub specification.
>  What should I change for above properties ?


What do they represent? Regulators? Why would you add custom properties
for controlling regulators? Why would you enable LDOs for ports which
have nothing connected? Why would you not enable LDOs for ports which
have something there? Why these are not properties of the ports?

So many questions.


Best regards,
Krzysztof
