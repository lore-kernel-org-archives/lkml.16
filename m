Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A6727876A;
	Wed, 28 May 2025 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748433419; cv=none; b=CxQ0lWE6izSIRUrHgqF3JbCq7jKANm5HQRcQPnOq2zeXjSwt2E+OEMfLRHbHROlCPyFlDrFYkqdmuMT3Z8nrliwHTe8eO8w+Q50RwtyLirQYg0ul5rPp0wfBJb9ezkK+35QpJJkhGCndngIROBbPNjz0YwIeebCkfmi9FALH8XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748433419; c=relaxed/simple;
	bh=33oeSjTLQKDkwvECcdEQbSGGAT2GJkxeaDlQ5VZ2A34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aalb54BO1cSDanAVgYrZJoU0ffPNhk8qyLdlqrPBW133JUNMgoF6GHSfwtNx514Mczoc3/P6pyQPlNQFSI01d/EO5r2lEByHBNO+6WFKvr6lZx0JttLEBQvEI/LDddQX/NC9P8PCPkMS4H1w0gdqid/5lGXE9Pg162DN+zoPTNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nT3aTKV1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nT3aTKV1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B76C4CEE7;
	Wed, 28 May 2025 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748433419;
	bh=33oeSjTLQKDkwvECcdEQbSGGAT2GJkxeaDlQ5VZ2A34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nT3aTKV1VTgUwWQdvlzDwruiyqFJR3cjI3SmGAGa4lEwwSKo15o1kQamXgBN1YgsB
	 1zMXRZEsF3A+9UkTB2464tz5uI5dwv9IR5SY8HgDXeceLJJlRXB580qWgylTjpFT/A
	 ACSuKx6dAF4ivLCBAqOOPc3/tLuYYMeEVPxB4GEkLnqycwyyaN8qU97Jc8KarWWE1s
	 ej5xPz5x9TbElbCn0mW5LeXrVXc/q6JY923Mf6B1QnX91dYv6MBkeN8QLlZc0pWv/t
	 LKG+1tEBGKb+HIUPSLLhcnKdMtEet5ktkYpkoX6RGiCSfc/EI4BwUWxTFjtHRyR74A
	 UWqCKKel/sLIg==
Message-ID: <969c42d7-0a40-4daf-a074-f2713d0d0412@kernel.org>
Date: Wed, 28 May 2025 13:56:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: clock: airoha: Document support for
 AN7583 clock
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250528004924.19970-1-ansuelsmth@gmail.com>
 <20250528004924.19970-5-ansuelsmth@gmail.com>
 <f9aebfb8-6312-45db-be12-94580ad412cb@kernel.org>
 <6836cf62.5d0a0220.35d0aa.2025@mx.google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <6836cf62.5d0a0220.35d0aa.2025@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2025 10:54, Christian Marangi wrote:
> On Wed, May 28, 2025 at 09:30:37AM +0200, Krzysztof Kozlowski wrote:
>> On 28/05/2025 02:49, Christian Marangi wrote:
>>>    - if:
>>>        properties:
>>>          compatible:
>>> @@ -75,6 +78,17 @@ allOf:
>>>          reg:
>>>            maxItems: 1
>>>  
>>> +      required:
>>> +        - reg
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          const: airoha,an7583-clock
>>> +    then:
>>> +      properties:
>>> +        reg: false
>>
>>
>> No resources here, so this should be part of parent node.
>>
> 
> Ok hope you can help here. This is another case of "MFD" thing.
> 
> I was with the idea that it was O.K. to use this with very different
> devices. (current scenario Clock controller and MDIO controller)
> 
> The node structure I had in mind was
> 
> 		system-controller@1fa20000 {
> 			compatible = "airoha,an7583-scu", "syscon", "simple-mfd";
> 			reg = <0x0 0x1fb00000 0x0 0x970>;
> 
> 			scuclk: scuclk {
> 				compatible = "airoha,an7583-clock";
> 				#clock-cells = <1>;
> 				#reset-cells = <1>;
> 			};
> 
> 			mdio {
> 				compatible = "airoha,an7583-mdio";
> 				#address-cells = <1>;
> 				#size-cells = <0>;
> 
> 				mdio_0: bus@0 {
> 					reg = <0>;
> 					resets = <&scuclk AN7583_MDIO0>;
> 				};
> 
> 				mdio_1: bus@1 {
> 					reg = <1>;
> 					resets = <&scuclk AN7583_MDIO1>;
> 				};
> 			};
> 		};
> 
> But you want
> 
> system-controller@1fa20000 {
>         compatible = "airoha,an7583-scu", "syscon";
>         reg = <0x0 0x1fb00000 0x0 0x970>;
> 
>         #clock-cells = <1>;
>         #reset-cells = <1>;
> 

mdio could be here just to group the bus (it's pretty common I think),
although not sure if compatible is useful then.

>         mdio_0: bus@0 {
>                 reg = <0>;
>                 resets = <&scuclk AN7583_MDIO0>;
>         };
> 
>         mdio_1: bus@1 {
>                 reg = <1>;
>                 resets = <&scuclk AN7583_MDIO1>;
>         };
> };
> 
> Again sorry if this question keeps coming around and I can totally
> understand if you are getting annoyed by this. The reason I always ask
> this is because it's a total PAIN to implement this with the driver
> structure due to the old "simple-mfd" model.

... and Rob was saying multiple times: be careful when adding
simple-mfd. If it bites back, then I am sorry, but everyone were warned,
weren't they?

What is exactly the pain anyway? You cannot instantiate children from
SCU driver?

> 
> (as again putting everything in a single node conflicts with the OF
> principle of autoprobing stuff with compatible property)

I am not sure if I follow. What principle? Where is this principle
expressed?

And you do not have in your second example additional compatibles, so
even if such principle exists it is not broken: everything autoprobes, I
think.

> 


Best regards,
Krzysztof
