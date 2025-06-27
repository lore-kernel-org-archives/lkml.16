Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041282EBBA3;
	Fri, 27 Jun 2025 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751054858; cv=none; b=Zy0yWVSZRfjqZaNZazmaupQhCxT7Z/j7gphfPFk+OIqWX2+AOjTvX3u2ISKTHmIfPhlbXJCsLHiMHRPlKKyCgzeMKs/1G5gKSx/YIiNO0ubrZ4DQI0vIOb45F9BIl1CPQmbao0nJVmQ1S0CbjJ6g1Lo1RtP+0r6VLYobvyPThCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751054858; c=relaxed/simple;
	bh=evi9mrGpfq42RtZCClIuGM2tsnpjZlb3N0ftCknmAJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuC/uxREBW7+BN5SL2W6NKWPgvvHF2xbFKqB5esIoaw5l7/Orr1OuKKb/XA6ejkqJhGhBUcAc5i75MexbxCuW+lCwyZZqO3XLsUUN4hbrBGq4ezTBa29ll+Gy4CHkDmR+Cv/6gf4bNG7eZmyKkYgXlVKoMq5kiz1d92pQZpdQLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAh8YiI5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAh8YiI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63393C4CEE3;
	Fri, 27 Jun 2025 20:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751054856;
	bh=evi9mrGpfq42RtZCClIuGM2tsnpjZlb3N0ftCknmAJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAh8YiI5mCaW34lHKtdKCXr+8HAOMMwPUhydtdeIAAgVDnAoccZXq4QlSbq7wLnaY
	 +icmkC7dh4qVpD9rK8gZvSWPbaGaF28iMDGKLJZqNLHG/B9dbxu+AB/fvhh8HNzFgP
	 CgDKVjQBbSbkRLh2FAHx49ytuLJyhaGj8MWsJGCvKKqZu0mSFAgN+FRsLLWUDs26hU
	 wXA5lF98WraRg/8x50dLx17BkCukQwOxCYEbG3DgAfs6mUDr/vQU5EUO+p/RIc9syg
	 gBqpgrn0GTrONoP32XqBYsKai7UEnYPqIEW7E2IW7op7lQl4DsCRelgw3tUPLQGD79
	 kkq4b/ZgbLoUA==
Date: Fri, 27 Jun 2025 15:07:35 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/5] dt-bindings: spmi: Add MediaTek MT8196 SPMI 2
 Arbiter/Controllers
Message-ID: <20250627200735.GA4094329-robh@kernel.org>
References: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
 <20250623120047.108961-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120047.108961-2-angelogioacchino.delregno@collabora.com>

On Mon, Jun 23, 2025 at 02:00:43PM +0200, AngeloGioacchino Del Regno wrote:
> Document the MT8196 SPMI 2.0 Controller with a new schema.
> This is a MIPI SPMI 2.0 compliant IP, composed of a main arbiter
> and two SPMI master controllers with Request Capable Slave (RCS)
> support.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/spmi/mediatek,mt8196-spmi.yaml   | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml b/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
> new file mode 100644
> index 000000000000..d7eb63e81a5c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/mediatek,mt8196-spmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 SPMI 2.0 Controller
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek MT8196 SoC features a SPMI version 2.0 compliant controller,
> +  with internal wrapping arbitration logic to allow for multiple on-chip
> +  devices to control up to two SPMI buses.
> +  The main arbiter also acts as an interrupt controller, arbitering also
> +  the interrupts coming from SPMI-connected devices into each of the nested
> +  interrupt controllers from any of the present SPMI buses.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8196-spmi
> +      - items:
> +          - enum:
> +              - mediatek,mt6991-spmi
> +          - const: mediatek,mt8196-spmi
> +
> +  ranges: true
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^spmi@[a-f0-9]+$":
> +    type: object
> +    $ref: /schemas/spmi/spmi.yaml
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        items:
> +          - description: controller interface registers
> +          - description: spmi master controller registers
> +
> +      reg-names:
> +        items:
> +          - const: pmif
> +          - const: spmimst
> +
> +      clocks:
> +        items:
> +          - description: controller interface system clock
> +          - description: controller interface timer clock
> +          - description: spmi controller master clock
> +
> +      clock-names:
> +        items:
> +          - const: pmif_sys_ck
> +          - const: pmif_tmr_ck
> +          - const: spmimst_clk_mux
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      interrupt-names:
> +        const: rcs
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 3
> +        description: |
> +          cell 1: slave ID for the requested interrupt (0-15)
> +          cell 2: the requested peripheral interrupt (0-7)
> +          cell 3: interrupt flags indicating level-sense information,
> +                  as defined in dt-bindings/interrupt-controller/irq.h
> +    required:
> +      - reg
> +      - reg-names
> +      - clocks
> +      - clock-names
> +      - interrupts
> +      - interrupt-names
> +      - interrupt-controller
> +      - "#interrupt-cells"
> +
> +required:
> +  - compatible
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      spmi-arbiter@1c018000 {
> +        compatible = "mediatek,mt8196-spmi";
> +        ranges = <0 0 0x1c018000 0x4900>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        spmi@0 {
> +          reg = <0 0x900>, <0x4800 0x100>;
> +          reg-names = "pmif", "spmimst";
> +          interrupts-extended = <&pio 292 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-names = "rcs";
> +         interrupt-controller;

Indentation error.

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +          #interrupt-cells = <3>;
> +          clocks = <&pmif_sys>, <&pmif_tmr>, <&spmi_mst>;
> +          clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
> +        };
> +
> +        spmi@2000 {
> +          reg = <0x2000 0x900>, <0x4000 0x100>;
> +          reg-names = "pmif", "spmimst";
> +          interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-names = "rcs";
> +          interrupt-controller;
> +          #interrupt-cells = <3>;
> +          clocks = <&pmif_sys>, <&pmif_tmr>, <&spmi_mst>;
> +          clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
> +        };
> +      };
> +    };
> +...
> -- 
> 2.49.0
> 
