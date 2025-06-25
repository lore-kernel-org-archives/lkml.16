Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5912326980C;
	Wed, 25 Jun 2025 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864086; cv=none; b=BeUOHIA+fqCRmvrHO8+PQdiV3rzvk2r3PnjZIMylw/MLQr83frEh94WnnzlRotWGqxCIev5ldFuHcZ1FpuovgIReb39WwiyUbspkzo91OnMO53eQAkJALw1ovv7sJB6kao5An5C/n38c0CJmCs+K0qd+wtCmVKcpcm2CJUxgufw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864086; c=relaxed/simple;
	bh=JmhAkoif1otrp384soDK37/o6hqYnuIKtKUb9uvXqk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/rjbNkdVloId7Oep4dssNQQlpkHsYDzlcPzzlC+lXn5ToZ7Fz3/gvBOl7h3KOESp7lchXo/NV3N7G6GYsfcnneoQlL14Ye5X5Qs2Tx6IYVinzqzoMRBj+Xjdrc8P5K+SMgE+nt4vyUXbQTni3KfYsT+tcJ6jJsKVMsIvVl9no0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkTnQF1k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkTnQF1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1312C4CEEA;
	Wed, 25 Jun 2025 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864085;
	bh=JmhAkoif1otrp384soDK37/o6hqYnuIKtKUb9uvXqk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SkTnQF1kyikqilYsD7Cczd6oJ8b1ODVaVkobfCt2Vx/C1mGrS3OEP/0IPQEIY024y
	 klkF+vtj6vKHtgnKajEtGt8/uTXf0OLUA5RwfIvl24T1XdGW9bxiLGfgcrK6yaehC5
	 rSu6aPzzOLMUc+hVINWtEmCPCo8Uo8QcpPQWRIz675T2H4/2GSSfTlO8+8WHiczNlP
	 mXGyBWv+D2H8Vnj5PSx+4p0q6brFUrCqyY9MoDTaAfLRJx8drbwr3g24Gum3FgOJbN
	 b3Xpjv/JucxgDLzwqJH7eoG5upgbyI3UfXrGH75udDUmJo9IwBQ3pYmGKyjQ9IjfWK
	 3Ocx9DbtPgFwQ==
Date: Wed, 25 Jun 2025 10:08:04 -0500
From: Rob Herring <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel driver
Message-ID: <20250625150804.GA1201460-robh@kernel.org>
References: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
 <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>

On Wed, Jun 25, 2025 at 03:38:44PM +0530, Kaustabh Chakraborty wrote:
> Document the driver for Synaptics TDDI (Touch/Display Integration) panels.

We document the h/w, not 'the driver'.

> Along with the MIPI-DSI panel, these devices also have an in-built LED
> backlight device and a touchscreen, all packed together in a single chip.
> Also, add compatibles for supported panels - TD4101 and TD4300.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../display/panel/synaptics,td4300-panel.yaml      | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..10ac24afdfbc43ca6913bf8a343413eed81f12ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/synaptics,td4300-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics TDDI Display Panel Controller
> +
> +maintainers:
> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - syna,td4101-panel
> +      - syna,td4300-panel

Can a TD4101 be anything other than a panel (controller)? If not, then 
'-panel' is redundant.

> +
> +  reg:
> +    maxItems: 1
> +
> +  vio-supply:
> +    description: core I/O voltage supply
> +
> +  vsn-supply:
> +    description: negative voltage supply for analog circuits
> +
> +  vsp-supply:
> +    description: positive voltage supply for analog circuits
> +
> +  backlight-gpios:
> +    maxItems: 1
> +    description: backlight enable GPIO
> +
> +  reset-gpios: true
> +  width-mm: true
> +  height-mm: true
> +  panel-timing: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - width-mm
> +  - height-mm
> +  - panel-timing
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
> +        panel@0 {
> +            compatible = "synaptics,td4300-panel";
> +            reg = <0>;
> +
> +            vio-supply = <&panel_vio_reg>;
> +            vsn-supply = <&panel_vsn_reg>;
> +            vsp-supply = <&panel_vsp_reg>;
> +
> +            backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
> +            reset-gpios = <&gpd3 4 GPIO_ACTIVE_LOW>;
> +
> +            width-mm = <68>;
> +            height-mm = <121>;
> +
> +            panel-timing {
> +                clock-frequency = <144389520>;
> +
> +                hactive = <1080>;
> +                hsync-len = <4>;
> +                hfront-porch = <120>;
> +                hback-porch = <32>;
> +
> +                vactive = <1920>;
> +                vsync-len = <2>;
> +                vfront-porch = <21>;
> +                vback-porch = <4>;
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.49.0
> 
