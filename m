Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CA5D53C;
	Fri,  9 May 2025 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772831; cv=none; b=WDX/fEiVWlODX/cFbFV4ayHoXgbC1w1cjxjf3T7hzshXq2GNDL8Bk3czGFBzB//zKk4l59MwpclQCUIjBhacXefKVJB6dmPDYx7v4RJTVKiAytrqLeo7QoZkm/tp+HfGY21+/RkS1NZnNRUTcEovGLz1gWxgS4+R46nkaCc8II0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772831; c=relaxed/simple;
	bh=efT4gy3DPSJVddrgV3Coynq8JjHJLhPlxsgqiMB2KA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtOkGYOlykcErgdrRztF307Oalprbk5FVMGAEdk3ChBA1x8T8C5DFOaDeQfKCAvgv9DJp/78I06lJjAaQNDoI8gxxpO9JOk99rpGEwyESUE+6nFuUMyfmbc4mgWMehrkfSc5xKgk665srgNLdQ0BqpS3aHZSbRG1Iw5tVhmc6Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7XwOpH5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7XwOpH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A1BC4CEE4;
	Fri,  9 May 2025 06:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746772830;
	bh=efT4gy3DPSJVddrgV3Coynq8JjHJLhPlxsgqiMB2KA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7XwOpH5E6EltH7WTXdpxVBPYMzno7SRjM/s9++39HRHcEijg1HXhFRtp/yg44q6l
	 y7dszeimOpth5KQTRYPe2xHrpebYWpiW0cBjvmy3+1iZsqGvpBApip9ax9cgIivGAm
	 3/K/iZPwmnlnnCvPVp9QmTbgSgWOb2vgiyNuGF2lFt2smO41K4jjEJIrxvcpql5Tvq
	 i9owDKb8IIt7cuGCYG7shtzr5+Ib/VobAsQI1l+5JsmVevnL8al/+Oe+SbpQGaAZ7v
	 8M/NYJlJUVNLstW+lw0lDCuJHKjEm4xm7DGNMKfQiSdzcIP4rD3dGoO1z7USZnnAIU
	 KYUKhfXaCAPFA==
Date: Fri, 9 May 2025 08:40:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Cyan Yang <cyan.yang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management
 controllers
Message-ID: <20250509-small-graceful-limpet-d0ea41@kuoka>
References: <20250509021605.26764-1-nick.hu@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509021605.26764-1-nick.hu@sifive.com>

On Fri, May 09, 2025 at 10:16:04AM GMT, Nick Hu wrote:
> SiFive Domain Management controller includes the following components
> - SiFive Tile Management Controller
> - SiFive Cluster Management Controller
> - SiFive Core Complex Management Controller
> 
> These controllers control the clock and power domain of the
> corresponding domain.
> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>  .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++++

Where is a patch with the driver (user of the binding)?

>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
> new file mode 100644
> index 000000000000..7ed4f290b94b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Domain Management Controller
> +
> +maintainers:
> +  - Cyan Yang <cyan.yang@sifive.com>
> +  - Nick Hu <nick.hu@sifive.com>
> +  - Samuel Holland <samuel.holland@sifive.com>
> +
> +description: |
> +  This is the device tree binding for the following SiFive Domain Management Controllers.

Explain the hardware, not that "binding is a binding for ...".

Also, wrap according to Linux coding style.


> +  - Tile Management Controller
> +      - TMC0
> +      - TMC1
> +      - TMC2
> +      - TMC3
> +  - Subsystem Management Controller
> +      - SMC0
> +      - SMC1
> +      - SMC2
> +      - SMC3
> +  - Cluster Management Controller
> +      - CMC2
> +      - CMC3
> +  SiFive Domain Management Controllers support the SiFive Quiet Interface
> +  Protocol (SQIP) starting from the Version 1. The control method is
> +  different from the Version 0, making them incompatible.
> +
> +allOf:
> +  - $ref: power-domain.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - {}
> +          - pattern: "^sifive,[ts]mc0$"
> +      - items:
> +          - {}
> +          - pattern: "^sifive,[ts]mc3$"
> +          - pattern: "^sifive,[ts]mc2$"
> +          - pattern: "^sifive,[ts]mc1$"
> +      - items:
> +          - {}
> +          - pattern: "^sifive,[ts]mc2$"
> +          - pattern: "^sifive,[ts]mc1$"
> +      - items:
> +          - {}
> +          - pattern: "^sifive,[ts]mc1$"
> +      - items:
> +          - {}
> +          - const: sifive,cmc3
> +          - const: sifive,cmc2
> +      - items:
> +          - {}
> +          - const: sifive,cmc2

All of this is just unexpected. Why any compatible should come with
these? You need to use SoC specific compatibles.


> +
> +  reg:
> +    maxItems: 1
> +
> +  sifive,feature-level:
> +    description: |
> +      Supported power features. This property is absent if the full set of features
> +      is supported

Compatible defines this. Drop.


> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: ["nopg", "ceasepg", "runonlypg"]
> +
> +  "#power-domain-cells":
> +    const: 0
> +
> +if:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          pattern: "^sifive,[tsc]mc3$"
> +then:
> +  properties:
> +    sifive,feature-level: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

Missing example.

Best regards,
Krzysztof

