Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787751B6D06;
	Thu, 29 May 2025 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748509244; cv=none; b=dxjG0s9Dxoxmj6X9rxbfjSF/y+yIp5qHV6aVuqRWf0ynGHDdNk5LrwP6ilt9IIN+sqtaqbmuVNrH9hWm7QFTf9elgYgBezC3jGax95tN9SuLrYf9VoXx8FrnoalFhVF3PylKPnXDLLLzxyWAOWPy3iX/fz4V7nhkw2llY+x/CQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748509244; c=relaxed/simple;
	bh=z6rn8oeHUdTWK5F9qwdWd7GFhM+29i6k/K02iAi8NjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqBL1NR7oactxSUSug4cGpJYZx+i1twJxDSZXAhAabdbK8MgQ10DDzTqn2Pky/dNGEV5uNDsJW/NEQJZMveEZke4jkoKYLtmHhz+yUBoDWJtjy4SD4bXy9w/TL/D37Bm1wB1Ehsfxttz/UsjJjMSgNoYrJhTNg3U60Go2yloOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3C7bxoG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3C7bxoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E8EC4CEE7;
	Thu, 29 May 2025 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748509244;
	bh=z6rn8oeHUdTWK5F9qwdWd7GFhM+29i6k/K02iAi8NjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g3C7bxoGUoOdpvGlkqcYQDn6dC+O5ojEWiuQRaQKIc9ej0Qq2saE4UCEnQSXqrgDA
	 +DhXyaw8Y3f+O1zdbt23n3MMD/vXbGV3a2bAKSt5DcM94pBmLhtY+biMG8b3wY40j3
	 kXpuB63OXBhkGYCyk/JJFdl/ECYAWqqCGqzzJA34g/E+rxmIEaiPYTS+hCe0qI/05t
	 agrZ3U0aKlM1bQ9vApxjSTIlY3CRZc9khH7PBtd+iGF+tiVgIyyW0m8LD4JFzmiasM
	 vu7aosqlIU27R10eC/YIjsk3QwBH+anBTrNw+cvki/jystFwMn0dBRqIvQoAxPElLI
	 ixikskPP3qjrA==
Message-ID: <3fb8ad2b-016d-4eee-af57-be7dec659f4c@kernel.org>
Date: Thu, 29 May 2025 11:00:39 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <6837084c.050a0220.1e474f.3f20@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2025 14:57, Christian Marangi wrote:
>>> Again sorry if this question keeps coming around and I can totally
>>> understand if you are getting annoyed by this. The reason I always ask
>>> this is because it's a total PAIN to implement this with the driver
>>> structure due to the old "simple-mfd" model.
>>
>> ... and Rob was saying multiple times: be careful when adding
>> simple-mfd. If it bites back, then I am sorry, but everyone were warned,
>> weren't they?
>>
>> What is exactly the pain anyway? You cannot instantiate children from
>> SCU driver?
>>
> 
> Answering below since they are related.
> 
>>>
>>> (as again putting everything in a single node conflicts with the OF
>>> principle of autoprobing stuff with compatible property)
>>
>> I am not sure if I follow. What principle? Where is this principle
>> expressed?
>>
>> And you do not have in your second example additional compatibles, so
>> even if such principle exists it is not broken: everything autoprobes, I
>> think.
>>
>>>
>>
>>
> 
> The principle I'm talking about is one driver for one compatible.

There is no such principle. One compatible can map to many drivers and
many compatibles can map to one driver.

> (to be more precise excluding syscon compatible that is actually
> ignored, if a driver for the compatible is found, any other compatible
> is ignored.)
> 
> This means that declaring multiple compatible as:
> 
> compatible = "airoha,clock", "airoha,mdio"
> 
> doesn't result in the clock driver and the mdio driver probed but only
> one of the 2 (probably only clock since it does have priority)

I don't understand this example. It makes no sense - clock is not
compatible with mdio.

> 
> The "simple-mfd" compatible is just a simple compatible that indicate to
> the OF system that every child (with a compatible) should be also probed.
> And then automagically the driver gets probed.
> 
> Now the ""PAIN"" explaination. Not using the "simple-mfd" way with the
> child with compatible and putting everything in the node means having to
> create a dedicated MFD driver that just instruct to manually probe the
> clock and mdio driver. (cause the compatible system can't be used)

You already have that driver - SCU. No need for new MFD driver...


> 
> So it's 3 driver instead of 2 with the extra effort of MFD driver
> maintainer saying "Why simple-mfd is not used?"

Sorry, that's a wrong argument. You can use simple-mfd, iff it follows
standard practices. If it does not fit standard practices, you cannot
use an argument "now I need more complicated solution".

> 
> 
> There is a solution for this but I always feel it's more of a workaround
> since it doesn't really describe the HW with the DT node.

Really? All arguments you used here are driver arguments - that
something is a pain in drivers. Now you mention that hardware would not
match description.

Then let's change entire talk towards hardware description and send
patches matching hardware, not matching your MFD driver structure.

> 
> The workaround is:
> 
> 		system-controller@1fa20000 {
>                         /* The parent SCU node implement the clock driver */
>                         compatible = "airoha,an7583-scu", "syscon";
>                         reg = <0x0 0x1fb00000 0x0 0x970>;
> 
>                         #clock-cells = <1>;
>                         #reset-cells = <1>;
> 
>                         /* Clock driver is instructed to probe child */
>                         mdio {
>                                 compatible = "airoha,an7583-mdio";

Again, drop compatible.

>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> 
>                                 mdio_0: bus@0 {
>                                         reg = <0>;
>                                         resets = <&scuclk AN7583_MDIO0>;
>                                 };
> 
>                                 mdio_1: bus@1 {
>                                         reg = <1>;
>                                         resets = <&scuclk AN7583_MDIO1>;
>                                 };
>                         };
>                 };
> 
> 
> But this really moves the probe from the simple-mfd to the clock driver.
> 
> So it's either 3 solution
> 1. 2 driver + "simple-mfd"
> 2. 3 driver + PAIN (due to MFD required driver)
> 3. 2 driver + not very correct DT node structure

Option 4:
Describe it correctly. You have one device which is the SCU which is
clock provider and has subnode for MDIO bus. I don't care how many
drivers you have there (but I am sure one can do it in a simple way).

> 
> Maybe option 3. is more acceptable?
> 
> The SCU node is mainly clock + reset controller and the MDIO bus is an
> expansion of it?
> 
> Hope the long explaination makes sense to you (especially about the
> OF principle thing)
> 
> --
> Ansuel


Best regards,
Krzysztof
