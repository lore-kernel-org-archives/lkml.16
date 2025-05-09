Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E69C4B1E5C;
	Fri,  9 May 2025 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807948; cv=none; b=rfocGJWBOf4VI2sM6QbxRRuYihVnOR/ZmFTDomo+HrExZeM5+nPF6PjSKT4IqixAI4J7CYGvFGH8Vf/LvNjkB92xmGFZPwX8jTj5Dslnc/zdCDxAAJvGk5Jo21RlD131lAPrK6aK5oUQRbaZDV8t2vW4o3GLH7Lw6KI31g8RPSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807948; c=relaxed/simple;
	bh=pWBgsTEX8GV7+i3t+seP0AVeCM2U+ftwb9bTfHMqsr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiFwMaFG1hxb4ILsbUMcJYwQYtsR68lP80ddFdNB3bh9IDT3XnuhDd7mKFlpopy4wBhNMNr0PNdNfMvWsGA/wbSqbKRSkk+KuNFlSngCucqyqgOKd0OSEALYgarriBOIryLg6yOxenz/zgEz6DojumNBUqMwf3p7Q+XpRkNSkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjckqt4f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjckqt4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95B4C4CEE4;
	Fri,  9 May 2025 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746807948;
	bh=pWBgsTEX8GV7+i3t+seP0AVeCM2U+ftwb9bTfHMqsr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjckqt4ff3yPZ9Z10wyhN9E27yWp8UPgNgf6MpU6+T/JD774nJHwwYaNW4sDl/SIv
	 tfg1KoT010YGjS4DsOoZ9apCkuuoMfDPErP3HTTF2W39sCgP4tBvFreluPtO5wau4d
	 2uhFEKXxRJl3DYzqRfZYf6lOtv1XFS4TpcbM+wktnwpetlf4PeuLGT6Bkqc9DgfxTi
	 QgdakWKRAagwX8iDrcCZy7OUbgA0CasETjjnktKwlZ1fLZ3yogIzz/V+0gl87d4Nrh
	 B1JmU4CKusHRWfFkwq077jjNOpgz//HQO7ovyXp1sTub4/91Pzypmi9kQQJEqm1NwS
	 oaDsGvN7jKTFA==
Date: Fri, 9 May 2025 11:25:46 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 16/19] dt-bindings: clock: imx8m-clock: add PLLs
Message-ID: <20250509162546.GA3704130-robh@kernel.org>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com>

On Thu, Apr 24, 2025 at 08:21:46AM +0200, Dario Binacchi wrote:
> Though adding the PLLs to clocks and clock-names properties will break
> the ABI, it is required to accurately describe the hardware. Indeed,
> the Clock Control Module (CCM) receives clocks from the PLLs and
> oscillators and generates clocks for on-chip peripherals.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> (no changes since v11)
> 
> Changes in v11:
> - Fix conflict while rebasing on master
> 
> Changes in v7:
> - Add 'Reviewed-by' tag of Krzysztof Kozlowski
> 
> Changes in v6:
> - New
> 
>  .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index 4fec55832702..e83f08abd44c 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -29,12 +29,12 @@ properties:
>      maxItems: 2
>  
>    clocks:
> -    minItems: 6
> -    maxItems: 7
> +    minItems: 7

Increasing the minimum entries looks like an ABI break to me. The .dts 
files not being in linux-next confirms that (from 0 warnings in 
mainline):

arch/arm64/boot/dts/freescale:859:50
    122  clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
    120  clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
     61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
     61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
     60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
     60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
     36  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
     36  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
     32  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
     28  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
     26  clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
     17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
     17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
     14  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
     14  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
     13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
     13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
     12  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
     10  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
      8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
      8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
      8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
      8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
      8  bcrmf@1 (brcm,bcm4329-fmac): $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
      6  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42], [43], [44], [45], [46]] is too short
      6  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
      4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[43], [44], [45], [46], [47], [48]] is too short
      4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[40], [41], [42], [43], [44], [45]] is too short
      4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[36], [37], [38], [39], [40], [41]] is too short
      4  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short

Please fix the binding or drop what's been applied so far.

Rob

