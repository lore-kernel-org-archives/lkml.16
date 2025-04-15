Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295BB21C18C;
	Tue, 15 Apr 2025 21:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744754124; cv=none; b=OgsTMfnk3OmuDN2T15yHA6oemjpVTVfngru/Nvu1dHJeFrjqWYPQQCV7U7Xa38DaVv52SuE2vodbZEAdXHUyzvqgBmpeKszi9y+8uMjcIDpLw57cbmfVwbjNH/7MgmYbukeqWbShWzQ5P3x+gr7tcnT2MlnPlUG2aVbK69zESwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744754124; c=relaxed/simple;
	bh=Irh4ZUoJ9T5Hybpb0m56g235zNm/FuCOcynTFFvhkek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2v69UwYGueGiJqfCXXTbu+sNylgDKnlY760YE9wQgT7K+6IXdHZmtxYy38Pg1RdO4Nk/+97EZxdf6Aoww3Tjxli9RNWjYY/NE7yQ8gxADQKiqsnDBvSduB4QsM71EQHCBHB0cUhLxXsNRF6TOjGMnJ/hRi/7kqxgQ+xKiin+v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qd7buMXE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qd7buMXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B7FC4CEE7;
	Tue, 15 Apr 2025 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744754123;
	bh=Irh4ZUoJ9T5Hybpb0m56g235zNm/FuCOcynTFFvhkek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qd7buMXEcTbOLQGc45T2Y0lUb/U2b9/kI4fA/2bVx58Sw4Fv7FmB7GP4fyhsRH/K1
	 mhrkJN25k690EgRBIke2FSNk3u1VkdL9j4F0IBpitd+llhWEvZXNqpqHcDQxUbaqEj
	 Di6z3Ngid4604b2TLeX1GabaWkQMPzJaokqqdXUhDYNy/2/T2mP0sPbMqTKlcqPIBn
	 KHeFuenpGTjv7Se1246wUE3PIIH3tAI2ScMA0Ed4Tvm0h/bI234IcR83spZPYlOcyp
	 cBPyWgKmkaF7AUlftC1uCkA6s1k8e21d2GyaruSkOdOWmcEM+vXZLy5lujR8dq0Vui
	 47T+9PieiSunw==
Date: Tue, 15 Apr 2025 16:55:21 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: display: panel: Document Renesas
 R61307 based DSI panel
Message-ID: <20250415215521.GA885658-robh@kernel.org>
References: <20250413112401.12543-1-clamor95@gmail.com>
 <20250413112401.12543-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413112401.12543-2-clamor95@gmail.com>

On Sun, Apr 13, 2025 at 02:23:58PM +0300, Svyatoslav Ryhel wrote:
> R61307 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/panel/renesas,r61307.yaml         | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
> new file mode 100644
> index 000000000000..a98d2d2e02d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R61307 based DSI Display Panel
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:
> +  The Renesas R61307 is a generic DSI Panel IC used to control LCD panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +        # KOE/HITACHI TX13D100VM0EAA 5.0" XGA TFT LCD panel
> +      - hit,tx13d100vm0eaa
> +      - koe,tx13d100vm0eaa

Usuually when the display IC is known, there's a fallback compatible for 
it. Then 'renesas' vendor prefix on the properties makes more sense.

> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: Regulator for main power supply.
> +
> +  iovcc-supply:
> +    description: Regulator for 1.8V IO power supply.
> +
> +  backlight: true
> +
> +  renesas,gamma:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      0 - disabled
> +      1-3 - gamma setting A presets
> +    enum: [0, 1, 2, 3]
> +
> +  renesas,inversion:
> +    type: boolean
> +    description: switch between line and column inversion. The line
> +      inversion is set by default.

The property name is odd since there's always some sort of 
inversion. Perhaps renesas,column-inversion? 

> +
> +  renesas,contrast:
> +    type: boolean
> +    description: digital contrast adjustment

I would have expected contrast to be more than boolean. Is this 
something any a-Si panel would support or somehow Renesas specific?

> +
> +  reset-gpios: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - port
> +  - backlight
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@1 {
> +            compatible = "koe,tx13d100vm0eaa";
> +            reg = <1>;
> +
> +            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
> +
> +            renesas,gamma = <3>;
> +            renesas,inversion;
> +            renesas,contrast;
> +
> +            vcc-supply = <&vcc_3v0_lcd>;
> +            iovcc-supply = <&iovcc_1v8_lcd>;
> +
> +            backlight = <&backlight>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.43.0
>
