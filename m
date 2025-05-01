Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0421C9F0;
	Thu,  1 May 2025 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746100483; cv=none; b=uGPYPOMqd456Z2OJ9jgUV5wKvGBazwn/jUrC0KIDIGeKq/J9PWlFC974FXoPXfkP9Ss2+a90s7J2Cc8n/Bdl0pS2ITcsK4udeZP5LJIEpxaonkSECDVYasiT0awsNbmlpoqUPW3AERfs8QjAjXGRlM7+NPHCg/QxFnKC0kfGd/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746100483; c=relaxed/simple;
	bh=L2jvwE9yLRhV5ty6dNZhqgMl4gYvE9YEZ/JInACmAd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASFjUUQsjE5trq6pNp6OJaDmfDNGJhNCLbpl/j5oEe4xYWV1+kK2GZ7qzKd39KxSCQC749moNTRrINb55LBjUSv+x6ysVzH7tAHgrWiRbyhwOgMrZQnEyB6r9hZdK47YEIwuVHQFduF2Q+aWZCD0TfGi8s5A1qi3efSH4MY+1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWlLSBCO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWlLSBCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C28DC4CEE3;
	Thu,  1 May 2025 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100482;
	bh=L2jvwE9yLRhV5ty6dNZhqgMl4gYvE9YEZ/JInACmAd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWlLSBCOuxlZFO/eyKUaOOTDO/JHeegmqGVYQGHWc7dIpAWJ3z9CJ7dao8T/paBds
	 qPVDb2STkNWNW8iN9oJof1dKpZXrUn0oKj2ar1oZHprzNiPqBSnCHzvGbmqkrtlWYV
	 zXxUXDM2zxy0zJDKJ5bU4SOzt4CHY0g7Uty++KzTTdVxE1b1aJu91Jx1aeja47JgTm
	 nhaxdcvO/NdKxFIR747s6EAyqeKv9UgyFl8fZezzwr2SyMPotgErwnYiP902Ww5SmZ
	 X4B0tSvMyzOBsl+gxk/zjmdnBgoHuzF/6JueAb8j/SXatua92iSwtsTe7abRWY4JbL
	 82KUOHhMT9AFg==
Date: Thu, 1 May 2025 13:54:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, 
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v4 2/3] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <20250501-stirring-groovy-ringtail-47efe1@kuoka>
References: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de>
 <20250430-clk-cdce6214-v4-2-9f15e7126ac6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430-clk-cdce6214-v4-2-9f15e7126ac6@pengutronix.de>

On Wed, Apr 30, 2025 at 11:01:35AM GMT, Sascha Hauer wrote:
> The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
> Differential Outputs, Two Inputs, and Internal EEPROM. This patch adds
> the device tree binding for this chip.

BTW, a nit:

"Add device tree binding for the CDCE6214, an Ultra ......"

so you won't use "This patch" and make everyting one simple sentence.

> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 155 +++++++++++++++++++++
>  include/dt-bindings/clock/ti,cdce6214.h            |  25 ++++
>  2 files changed, 180 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> new file mode 100644
> index 0000000000000..d4a3a3df9ceb9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> @@ -0,0 +1,155 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti,cdce6214.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI CDCE6214 programmable clock generator with PLL
> +
> +maintainers:
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +
> +description: >
> +  Ultra-Low Power Clock Generator With One PLL, Four Differential Outputs,
> +  Two Inputs, and Internal EEPROM
> +
> +  https://www.ti.com/product/CDCE6214
> +
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
> +    maxItems: 1

No improvements, this should be 2.


> +    items:
> +      enum: [ priref, secref ]

This can be simpler - and you need to keep the order:


  minItems: 1
  items:
    - enum: [ priref, secref ]
    - const: secref

    Best regards,
    Krzysztof

