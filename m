Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A8E2C3255;
	Mon,  2 Jun 2025 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748852024; cv=none; b=qxalZ2+i07G3/PSC23A5P/+KaXBbgBZ39hQNjiEnSIKhWqc2kLHJ7Q3JuFcO9KUQ9e1w93lkf5ZLf6NrLvvSiKbUm9aI0AHUVZhFXOxayJcf00U843shSkgHtd9mJCC1BpqZUq5AvH+qfTllD9O2I+hOKPlnp79z5Uq8lJXOJNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748852024; c=relaxed/simple;
	bh=XzzqHVbOtagpoblhmdguIE8ADu39Ux8iTVasZh53L9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+cCWFnS9/YT4EFR6alJfd3Vrj6cP2HqfaQkfF/ngpadHrxI+Vyqy9oCqD1C4t/dYfZWbZF63f12YPyZ4a4GFsGdlLFUrAEC5D0Rjq4m5AuwXXEecE7MOfzbqhQIBQQYYVxKtvIQnwB/qoCVpilCtvgy84N2tnT9CoNp5x8aqk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIIysWJK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIIysWJK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A053C4CEEB;
	Mon,  2 Jun 2025 08:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748852023;
	bh=XzzqHVbOtagpoblhmdguIE8ADu39Ux8iTVasZh53L9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YIIysWJKn6eoXyJpVTrAlyAHICrqAqhb+Xki1dfu753llwqDqVREtTN//FqX/7mQo
	 rIX13w4yAQauxr/Qu9KZW4kLo4qvle3g4LWHckyd5IU5sflfXAu2Y/3kJv7ze2KPr5
	 wRfOeAaP0E7GC1npQNnyvESUir5Ed0LpKRE1lCDqnV9/lqyKwED8PU4TKryOnU8ORY
	 jPTayhgkELjOmc5il49gxvjqr8FmfqLVqiBDJS6dNZkz0n4MFC3YoAnezd/WIm524U
	 XhKyG9S56+s5/Xth52vuodzzwG3pUeIVV53UzixwzL/7ewdX3cpTR7wn2do9JaBpgx
	 yRmiKVDRdDuEQ==
Message-ID: <7e293d04-da1c-461c-b58a-18c1b942193b@kernel.org>
Date: Mon, 2 Jun 2025 10:13:39 +0200
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
 <969c42d7-0a40-4daf-a074-f2713d0d0412@kernel.org>
 <6837084c.050a0220.1e474f.3f20@mx.google.com>
 <3fb8ad2b-016d-4eee-af57-be7dec659f4c@kernel.org>
 <6839ce13.050a0220.1038eb.83e1@mx.google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <6839ce13.050a0220.1038eb.83e1@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2025 17:26, Christian Marangi wrote:
> On Thu, May 29, 2025 at 11:00:39AM +0200, Krzysztof Kozlowski wrote:
>> On 28/05/2025 14:57, Christian Marangi wrote:
>>>>> Again sorry if this question keeps coming around and I can totally
>>>>> understand if you are getting annoyed by this. The reason I always ask
>>>>> this is because it's a total PAIN to implement this with the driver
>>>>> structure due to the old "simple-mfd" model.
>>>>
>>>> ... and Rob was saying multiple times: be careful when adding
>>>> simple-mfd. If it bites back, then I am sorry, but everyone were warned,
>>>> weren't they?
>>>>
>>>> What is exactly the pain anyway? You cannot instantiate children from
>>>> SCU driver?
>>>>
>>>
>>> Answering below since they are related.
>>>
>>>>>
>>>>> (as again putting everything in a single node conflicts with the OF
>>>>> principle of autoprobing stuff with compatible property)
>>>>
>>>> I am not sure if I follow. What principle? Where is this principle
>>>> expressed?
>>>>
>>>> And you do not have in your second example additional compatibles, so
>>>> even if such principle exists it is not broken: everything autoprobes, I
>>>> think.
>>>>
>>>>>
>>>>
>>>>
>>>
>>> The principle I'm talking about is one driver for one compatible.
>>
>> There is no such principle. One compatible can map to many drivers and
>> many compatibles can map to one driver.
>>
> 
> I might be wrong but there is currently a limitation on the OF system
> where if a driver gets probed for a node then it's ignored for any other
> driver. (sorry for the bad explaination, hope it's understandable)

Yes but this can be changed easily. See: depopulate. Whether you
populate or not-populate is not a reason to model hardware description
one way or another.

> 
>>> (to be more precise excluding syscon compatible that is actually
>>> ignored, if a driver for the compatible is found, any other compatible
>>> is ignored.)
>>>
>>> This means that declaring multiple compatible as:
>>>
>>> compatible = "airoha,clock", "airoha,mdio"
>>>
>>> doesn't result in the clock driver and the mdio driver probed but only
>>> one of the 2 (probably only clock since it does have priority)
>>
>> I don't understand this example. It makes no sense - clock is not
>> compatible with mdio.
>>
> 
> This was an example to put every properties in the oparent node.

So it was a bad example because it makes no sense. You move the
properties, not merge compatibles!

> 
>>>
>>> The "simple-mfd" compatible is just a simple compatible that indicate to
>>> the OF system that every child (with a compatible) should be also probed.
>>> And then automagically the driver gets probed.
>>>
>>> Now the ""PAIN"" explaination. Not using the "simple-mfd" way with the
>>> child with compatible and putting everything in the node means having to
>>> create a dedicated MFD driver that just instruct to manually probe the
>>> clock and mdio driver. (cause the compatible system can't be used)
>>
>> You already have that driver - SCU. No need for new MFD driver...
>>
> 
> The SCU driver is actually the clock driver (currently). This was done
> for simplicity and because in SCU there were only some bits.
> 
> But now with AN7583 they put 2 MDIO controller in it.
> 
>>
>>>
>>> So it's 3 driver instead of 2 with the extra effort of MFD driver
>>> maintainer saying "Why simple-mfd is not used?"
>>
>> Sorry, that's a wrong argument. You can use simple-mfd, iff it follows
>> standard practices. If it does not fit standard practices, you cannot
>> use an argument "now I need more complicated solution".
>>
> 
> Then I think we are getting confused because I am following the usual
> pattern.
> 
> This is what would be the ideal and easy solution. (ti what was done on
> EN7581 with pinctrl and pwm)
> 
> 		scu: system-controller@1fa20000 {
> 			compatible = "syscon", "simple-mfd";
> 			reg = <0x0 0x1fb00000 0x0 0x970>;
> 
> 			scuclk: scuclk {
> 				compatible = "airoha,an7583-scu";
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
> 

By repeating the same you will not get different answers but rather me
become annoyed.

> 
>>>
>>>
>>> There is a solution for this but I always feel it's more of a workaround
>>> since it doesn't really describe the HW with the DT node.
>>
>> Really? All arguments you used here are driver arguments - that
>> something is a pain in drivers. Now you mention that hardware would not
>> match description.
>>
>> Then let's change entire talk towards hardware description and send
>> patches matching hardware, not matching your MFD driver structure.
>>
> 
> Ok to describe the HW for this register block
> 
> SCU register:

What is here?

> - clock

Here are clocks, but what is in "SCU register"?

> - mdio controller 1
> - mdio controller 2
> 
> So this is why I think a good matching node block is:
> 
> parent node (SCU register):

So what is here?

> 	- child 1 (clock)
> 	- child 2 (mdio controller)
> 		- child 1 (mdio bus 1)
> 		- child 2 (mdio bus 2)
> 
> Is it wrong to model the DT node this way?

Yes and I explained you already why.

> 
>>>
>>> The workaround is:
>>>
>>> 		system-controller@1fa20000 {
>>>                         /* The parent SCU node implement the clock driver */
>>>                         compatible = "airoha,an7583-scu", "syscon";
>>>                         reg = <0x0 0x1fb00000 0x0 0x970>;
>>>
>>>                         #clock-cells = <1>;
>>>                         #reset-cells = <1>;
>>>
>>>                         /* Clock driver is instructed to probe child */
>>>                         mdio {
>>>                                 compatible = "airoha,an7583-mdio";
>>
>> Again, drop compatible.
>>
> 
> To drop the compatible a dedicated MFD driver is needed (or adding code
> in the clock driver to register the MDIO controller and that is net
> clean code wise)

If you need to do some driver changes, do some driver changes...


Best regards,
Krzysztof
