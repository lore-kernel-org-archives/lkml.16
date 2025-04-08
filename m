Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D039ACF;
	Tue,  8 Apr 2025 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125090; cv=none; b=cDlRg5A52XikgimelFiXSLybIN6U19nFwIqff472jwnqHPSGO9aVolkJXHfpTp437HZikOLfpYx3nERJNywcYGMGU4tziynTNI6zATzRu47Rw9KO1+x6p1vTSTeeYE9Jw0j6KCz5WKab+F3ISYOwRmaszl0I5AtdR8TtRr5aQeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125090; c=relaxed/simple;
	bh=iDHL867Wm1Z34v53LOE/b0GskTUGIOuSB67G+ibvt0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQr+DY35lVeI6Tf3Xky6Q8dw0bDntZn/l5PbwS11OUVy/kdWfrXdpWstw7ADZEfXG1P6mt4NeAejG/oMn0FuIbp1W69OQd+Ixz8PVD3tdsxm88UhtcfKkw3RqVrfuUiEklV8U7zH0CZwA2ZuZ5Fr6tvXV/gy8Dh9TxwhXxpyUYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5MZzqRo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5MZzqRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48825C4CEE5;
	Tue,  8 Apr 2025 15:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744125089;
	bh=iDHL867Wm1Z34v53LOE/b0GskTUGIOuSB67G+ibvt0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t5MZzqRoVz8luWLE3kVME9RM0/xjP0+NP2lGKGmx8O1bjzyVXhWU14snopHUKGBu6
	 Tq0RmkonTX/WBEHHLRVFvEnJySyAeCELjYgoV4vu3WqOjZQVAUlm9BdYHPsGYXFGLx
	 Ml8tzceK7napCm+hHxluXm1TnjzJST3j+2hWwAcsSbYmll/TR0LsfVb71phkkXpOn8
	 Xyp/G9Z6zF4W2Fs1giPZE+6jzND2i62uDadkCbjAkJaqetviNP7RVgea34u6nLEIXg
	 AWCL18cUIu8obhXB3igMDMUVFu4pyXomzYcrEFDQQGyOqFsc5Q/1Mjlk0T9yvOZyOD
	 /xF7vLkvPdPVA==
Message-ID: <18365ed3-94bf-432a-a6f0-38e9c7ea0c6c@kernel.org>
Date: Tue, 8 Apr 2025 17:11:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: clock: add TI CDCE6214 binding
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@pengutronix.de, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
References: <20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de>
 <20250408-clk-cdce6214-v1-3-bd4e7092a91f@pengutronix.de>
 <5766d152-51e7-42f5-864f-5cb1798606a3@kernel.org>
 <Z_U6fUGbOV2SdO_C@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z_U6fUGbOV2SdO_C@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/04/2025 17:02, Sascha Hauer wrote:
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: priref
>>> +      - const: secref
>>
>> So one input is optional?
> 
> The chip has two clock inputs and to be operational it needs at least
> one clock, could be priref or secref or both.
> 
> Is there a proper way to express this situation?

No, this is fine, I just wanted to be sure that's the intention.

> 
> 
>>> +  "^clk@[2-9]$":
>>> +    type: object
>>> +    description: |
>>> +      optional child node that can be used to specify output pin parameters.  The reg
>>> +      properties match the CDCE6214_CLK_* defines.
>>> +
>>> +    additionalProperties: false
>>> +
>>> +    properties:
>>> +      reg:
>>> +        description:
>>> +          clock output identifier.
>>> +        minimum: 2
>>> +        maximum: 9
>>> +
>>> +      ti,lphcsl:
>>> +        type: boolean
>>> +        description: |
>>> +          If true enable LP-HCSL output mode for this clock
>>> +
>>> +      ti,lvds:
>>> +        type: boolean
>>> +        description: |
>>> +          If true enable LVDS output mode for this clock
>>> +
>>> +      ti,cmosp:
>>> +        type: boolean
>>> +        description: |
>>> +          If true enable CMOSP output for this clock
>>> +
>>> +      ti,cmosn:
>>> +        type: boolean
>>> +        description: |
>>> +          If true enable CMOSN output for this clock
>>
>> Looks the same here. Anyway having these as subnodes is too much. You
>> have fixed number of clocks, so you need one or two array properties in
>> top-level.
> 
> There are several properties I haven't yet modeled, like
> 
> - 1.8V / 2.5V output
> - sync_delay
> - LVDS common-mode trim increment/decrement
> - differential buffer BIAS trim
> - slew rate
> - BIAS current setting for XTAL mode
> - load capacity for XTAL mode
> 
> I don't know which of them will ever be supported, but I thought having a
> node per pin would add a natural place to add these properties. Do you
> still think arrays would be more appropriate?

Binding is supposed to be complete. If you send incomplete, you get
review like that.

Several of these look like pinctrl thus maybe this should be pin
controller as well. It's not exactly GPIO, but still configuring
specific functions and pin characteristics is the exact job of pinctrl.

> 
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - "#clock-cells"
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/ti,cdce6214.h>
>>
>> This file does not exist. Something is odd in this example.
> 
> It is added in the driver patch. Should it come with the binding patch
> instead?

Yes, because it is a binding.

> 
>>
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        clock-generator@67 {
>>> +            compatible = "ti,cdce6214";
>>> +            reg = <0x67>;
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +            #clock-cells = <1>;
>>> +            clocks = <&clock_ref25m>;
>>> +            clock-names = "priref";
>>> +
>>> +            clk@CDCE6214_CLK_SECREF {
>>
>> That's not a valid unit address. Use simple numbers, see DT spec and DTS
>> coding style.
> 
> CDCE6214_CLK_SECREF is a macro added in dt-bindings/clock/ti,cdce6214.h
> and it expands to a simple number (1 in this case). While I haven't
> found any examples of someone using macros for the unit address / reg
> property I thought I'd give it a try as it nicely shows how it is used.
> 
> I can switch to plain numbers if you prefer that though.

We don't encode addresses as headers in DTS (with few exception), so
definitely not as a binding. It just does not bind anything (in the ABI).

Best regards,
Krzysztof
