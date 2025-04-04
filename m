Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4C20F081;
	Fri,  4 Apr 2025 20:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797280; cv=none; b=Sub+L5JYm9t1hIK7X+V8pcaabf719KSl1qHwo4iwSmynp735hyO8PgU4Axnl2BdeUOCqNwg9GzAsuKphWHxqL5w/711YJilZIRl5rIIh0luRjXVaOrg+CykxA9GBCJ7Q0serzZt8/6T8/9UTPuXltZ2DMMe80WmT/mPGhylir1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797280; c=relaxed/simple;
	bh=MQkJVPYMef7wiIUxarAmWlfaTGvrEmpftIzp6I+KRKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkJZ2N1JqU0A7JpWJogNSxukwic29bzQ4U6KcJz1bH8Yzxda90wCLxk96OZu2y9mg35iVUY899HsFTt8rS+RC9gX9StOV3YCuA3GNt1Zc3xRlcMGa4vPoezga/NSSIWyr4a/1pF9YGLjf6IlZUoMLZp59zvsV7pPMme3EayvwhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtI7iiGR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtI7iiGR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2381CC4CEDD;
	Fri,  4 Apr 2025 20:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743797279;
	bh=MQkJVPYMef7wiIUxarAmWlfaTGvrEmpftIzp6I+KRKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BtI7iiGRDfogz2kjM4bzX5qVfy2seFRTTSGQWGgvA8XoqUJH3HexYKUACAZTSWMTF
	 rsqwpuIyFrHz+e0ZLYE9/zVBv3hFFaLfUY+3LAuVVzdWLana1Gsyshk4cpXEotV7UN
	 F7aOPdRk2t4FX+Yji3psAf+Yw9LbDe7moGxPW+J9F5dNipGA7Ud+x20ZDBB8F4JfH2
	 H0W1rStWvTtcMusKpuEjKS9xRMrTtvrskNbUhuXYgPkhFpAsr3N0YIXblHcRe8yN6S
	 IVVdma36w+V3R5Hl27ItViqQ44Z5/CSzudq/E65uDTO19GfH/+UYfph+2du7NeYy1H
	 RBLAfEs+H2izA==
Date: Fri, 4 Apr 2025 15:07:58 -0500
From: Rob Herring <robh@kernel.org>
To: cy_huang@richtek.com
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Otto lin <otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: dt-bindings: Add bindings for Richtek rt9123p
Message-ID: <20250404200758.GA218697-robh@kernel.org>
References: <cover.1743774849.git.cy_huang@richtek.com>
 <61a77673fabc4f9109b05c19fad4ef1087eccfa5.1743774849.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61a77673fabc4f9109b05c19fad4ef1087eccfa5.1743774849.git.cy_huang@richtek.com>

On Fri, Apr 04, 2025 at 10:22:13PM +0800, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Document the ASoC Richtek rt9123p.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/sound/richtek,rt9123p.yaml       | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml b/Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
> new file mode 100644
> index 000000000000..836cd369a68c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/richtek,rt9123p.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Richtek RT9123P Audio Amplifier
> +
> +maintainers:
> +  - ChiYuan Huang <cy_huang@richtek.com>
> +
> +description:
> +  RT9123P is a RT9123 variant which does not support I2C control.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - richtek,rt9123p
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  enable-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Delay time for 'ENABLE' pin changes intended to make I2S clocks ready to
> +      prevent speaker pop noise. The unit is in millisecond.
> +    default: 0

Ah, it is documented. But my questions need to be addressed (in the 
patch).

> +
> +required:
> +  - compatible
> +  - '#sound-dai-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    amplifier {
> +        compatible = "richtek,rt9123p";
> +        enable-gpios = <&gpio 26 GPIO_ACTIVE_HIGH>;
> +        #sound-dai-cells = <0>;
> +    };
> -- 
> 2.34.1
> 
