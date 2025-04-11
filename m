Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DACE22CBE6;
	Fri, 11 Apr 2025 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392111; cv=none; b=FKIfgnUfbZChTJDSh7fULWOlttFxLpSScFI53CSrhQT6gw5IlzanOhCCsSyvazYMUhJLP+SCmTSLZNkQ4KifmaA3oeBcYltY6n+TK9CkMH8/QKcYUNelBZ7j3RqwlKo5m+rE2EINKvoZpKPaWNWIA0/GDgXtCc07RuZEU21oPH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392111; c=relaxed/simple;
	bh=wTPBagsj4ElwWlYBiHEHYq9pY64izexZsXD5qh2E0TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Szj2bH2vtqjtnEQYuJT4/azpbdtNzUO/mn9vl1AoXGw3Avksm3rUxax1uEMCOGbW/uwSZ+pL7307UVBcAonlPRkNvxkczJ7AjqWXx3I+oR1Qa7VeelsRXuc8LkRUkmYY+etJIFTnWEtPthJAwEC+9TjONAtnvp8JEvwO1zwGDlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3Tmywx6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3Tmywx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E362C4CEE2;
	Fri, 11 Apr 2025 17:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392110;
	bh=wTPBagsj4ElwWlYBiHEHYq9pY64izexZsXD5qh2E0TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3Tmywx6RBQubYx+gshdwNzpLadpwLONa/JXZ2+cByAIyHimdCAf8dJgslgqK3je0
	 wiZ17zsuRnmX1ZNz6j7kdb1HCBNTbHsPjLYeJuYeFXHIW8q8gO+War6J2CfqgmC7Dt
	 rcJGH/ncTKw9WM0DT1lljR8q5nJgbkhdIahZ4owOZLJCXIb5dhScRmpxTx1u3Ox03P
	 6yrl9s2Rjml+aWVC/1cCJmUQp5Z7ZXzMOXlPbak7L+NZ+yenzBRuGTa5/VXqqOrxvT
	 xFQ5ojPvq3i0Eb+TnpErDyukPnDVxNx4rxjT3pMsCkEUqC5ONhwy8ElmAoRpmPr7Qi
	 8spN1e4KCIXOg==
Date: Fri, 11 Apr 2025 12:21:49 -0500
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <20250411172149.GA3468525-robh@kernel.org>
References: <20250410-clk-cdce6214-v3-0-d73cf9ff3d80@pengutronix.de>
 <20250410-clk-cdce6214-v3-2-d73cf9ff3d80@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-clk-cdce6214-v3-2-d73cf9ff3d80@pengutronix.de>

On Thu, Apr 10, 2025 at 12:34:57PM +0200, Sascha Hauer wrote:
> The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
> Differential Outputs, Two Inputs, and Internal EEPROM. This patch adds
> the device tree binding for this chip.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 155 +++++++++++++++++++++
>  include/dt-bindings/clock/ti,cdce6214.h            |  24 ++++
>  2 files changed, 179 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> new file mode 100644
> index 0000000000000..12737e67dcf2d
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
> +description:

Needs '>' modifier

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

How can you have 2 clocks, but only 1 name? See my reply on v2.

> +    items:
> +      enum: [ priref, secref ]
