Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65E31E1DEB;
	Tue,  8 Apr 2025 14:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122449; cv=none; b=HBdNEVoiqvm6GvgilxWdOIsldTv4jdoJs+IMIsd2iljIXdaF76OY1YBwPkmAAWPHVIR3hpiT1avF5L0YpHXZ+bpSZ2Rlrn7g4AZWlgozimgFKcWTW3xqISfiwIClC8CcFtypiSY0uhwr3zJfRexYyTDJJa7fd6yJY6cC8wh1Ucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122449; c=relaxed/simple;
	bh=HaCdujLpcs1ViV4+soV1n8EIjCN7TY5Kpzu/24ehm0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIs04YrQnlj20/uQ2CzFZjNqhba/hr8rJCm08L3STEfW/9U2wY7a8c7pvQpWMhB7fn/HwMjiLbySAwyo+8XcJkLLeSlGbl5dA4RhpzZs80YCIlXcpZWYktkGgqsVozcm7X+s513SF8lSz/qS8NrjFPptHqeMpTEwfaAmtmVEOxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9Lhw1GW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9Lhw1GW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85289C4CEE5;
	Tue,  8 Apr 2025 14:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744122448;
	bh=HaCdujLpcs1ViV4+soV1n8EIjCN7TY5Kpzu/24ehm0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d9Lhw1GWzL1hq7Tac6TpQDxSyuxSCUe/63q9gLH56qRDISIT6CnuH8hwZ2uqCvbOO
	 S3/SS/WOdjAIT4YVrreVrImDGPG8EG/gSGjkBqmKaf4KP4Fd+cjsKVeEFF59SQBdKC
	 7Jy8G/5URU+iGuhqf6BhJr25yt70II0jIWHQK1USc+W151dpVHwzdD39FIHYGOnhq4
	 59Bu69pmOlMvHTjF+9bNzP1GblotdqvC+ahlurGd4Hqv5MTRG3Wrlxk8tp8sBjAogu
	 46Vdq0In02ETa3XlY5KXcaGQoc6Lk0J0mNgOudqyoJLkTTTn9CWiPK3+L94iREAFUf
	 m1vZzbmiyj9fg==
Message-ID: <5766d152-51e7-42f5-864f-5cb1798606a3@kernel.org>
Date: Tue, 8 Apr 2025 16:27:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: clock: add TI CDCE6214 binding
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
References: <20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de>
 <20250408-clk-cdce6214-v1-3-bd4e7092a91f@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250408-clk-cdce6214-v1-3-bd4e7092a91f@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/04/2025 14:00, Sascha Hauer wrote:
> +

A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


> +properties:
> +  compatible:
> +    enum:
> +      - ti,cdce6214
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: priref
> +      - const: secref

So one input is optional?

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  "#clock-cells":

Use consistent quotes, either ' or "

> +    const: 1
> +
> +patternProperties:
> +  "^clk@[0-1]$":
> +    type: object
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      optional child node that can be used to specify input pin parameters. The reg
> +      properties match the CDCE6214_CLK_* defines.
> +
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          clock input identifier.
> +        minimum: 0
> +        maximum: 1
> +
> +      ti,ref-xtal:
> +        type: boolean
> +        description: |
> +          If true use input as XTAL input
> +
> +      ti,ref-lvcmos:
> +        type: boolean
> +        description: |
> +          If true use input as LVCMOS input
> +
> +      ti,ref-diff:
> +        type: boolean
> +        description: |
> +          If true use input as differential input

So these three are an enum string.

> +
> +  "^clk@[2-9]$":
> +    type: object
> +    description: |
> +      optional child node that can be used to specify output pin parameters.  The reg
> +      properties match the CDCE6214_CLK_* defines.
> +
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          clock output identifier.
> +        minimum: 2
> +        maximum: 9
> +
> +      ti,lphcsl:
> +        type: boolean
> +        description: |
> +          If true enable LP-HCSL output mode for this clock
> +
> +      ti,lvds:
> +        type: boolean
> +        description: |
> +          If true enable LVDS output mode for this clock
> +
> +      ti,cmosp:
> +        type: boolean
> +        description: |
> +          If true enable CMOSP output for this clock
> +
> +      ti,cmosn:
> +        type: boolean
> +        description: |
> +          If true enable CMOSN output for this clock

Looks the same here. Anyway having these as subnodes is too much. You
have fixed number of clocks, so you need one or two array properties in
top-level.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ti,cdce6214.h>

This file does not exist. Something is odd in this example.

> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        clock-generator@67 {
> +            compatible = "ti,cdce6214";
> +            reg = <0x67>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            #clock-cells = <1>;
> +            clocks = <&clock_ref25m>;
> +            clock-names = "priref";
> +
> +            clk@CDCE6214_CLK_SECREF {

That's not a valid unit address. Use simple numbers, see DT spec and DTS
coding style.


Best regards,
Krzysztof
