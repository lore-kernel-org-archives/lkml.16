Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED41F63FE;
	Sun,  2 Feb 2025 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738505093; cv=none; b=PJldYadLZowXQRKDetJoN4S8efRVih/pZCDNsdLocU8adN80IZvfOUW0TBU+s3MLOVqLaGwvq9z8hZHb/HLXwtI46E/EYT0pNS766cmDFbAyCygO00EW8WPBhTmDrnqUuwCOfQAsS8qVgpEgPuaKs7Vv8U7ogE21AP7PH7pqZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738505093; c=relaxed/simple;
	bh=uSAACILdXcmGs5Cazow/o3163E9ZhAaknS4XL/ORnEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCfliEBM1R/aeWwT4SxxPfS8SbT1uX9zCX59uhXAyYPposgEvcj2lKf7+K9p1WRkfCrK3BpOfvgWoP7XtP0TzwVSV7ty5wEoLMSWn49mV7oGr8KN13+60olRWvZfg/vrqkj9Wm70T/usuLKiivmkBUtd5BaEUiF0HE0wf6zD/7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzNRWQpd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzNRWQpd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38C8C4CED1;
	Sun,  2 Feb 2025 14:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738505093;
	bh=uSAACILdXcmGs5Cazow/o3163E9ZhAaknS4XL/ORnEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzNRWQpd0XoMCl2ZD9MFvua+vSUgsqK2KqvIhPaLLyQtV5e4oi7faz9rWUkilRI0k
	 OM/9cpmmkCyOLVD7xVch2bWSnK94s18QqC6ta6EYIooSrC63v8oxJsTJZ9LTdlDhKm
	 wrya+FR80OWUc+a16j3J6AJLNOvSCqPVSgPB6QgIC7Jr0o8LMjBLlLcpVOzdWTZ7LL
	 ClBmTU2n/br7rb7Ml6L02TTE1gv9J+RmcANydPGXpfefxA2qQSxSYQnSafXn5FDe/A
	 nenNMxKIT9+zSwmwnQ1dhIFQHeF6qaUM5adGf5e024z2PwQwhwSJSAUnzsBbTgTyC9
	 Q4pRcx3gSgEmQ==
Date: Sun, 2 Feb 2025 15:04:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fred Treven <ftreven@opensource.cirrus.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: mfd: cirrus,cs40l26: Support for CS40L26
Message-ID: <20250202-stoic-skunk-of-promise-cc3c4f@krzk-bin>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
 <20250131195639.1784933-5-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131195639.1784933-5-ftreven@opensource.cirrus.com>

On Fri, Jan 31, 2025 at 01:56:35PM -0600, Fred Treven wrote:
> Introduce required basic devicetree parameters for the
> initial commit of CS40L26.


This looks like soundy thing, why isn't this in sound? but title
mentions haptic, so maybe input?

Anyway, not MFD.


> 
> Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
> ---
>  .../bindings/mfd/cirrus,cs40l26.yaml          | 81 +++++++++++++++++++
>  MAINTAINERS                                   |  4 +-
>  2 files changed, 83 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml b/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
> new file mode 100644
> index 000000000000..a3cccb1a2d92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/cirrus,cs40l26.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic CS40L26 Boosted Haptic Amplifier
> +
> +maintainers:
> +  - Fred Treven <ftreven@opensource.cirrus.com>
> +  - patches@opensource.cirrus.com
> +
> +description:
> +  CS40L26 is a Boosted Haptic Driver with Integrated DSP, Waveform Memory,
> +  Advanced Closed Loop Algorithms, and LRA protection
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cirrus,cs40l26a
> +      - cirrus,cs40l27b
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  va-supply:
> +    description: Regulator for VA analog voltage
> +
> +  vp-supply:
> +    description: Regulator for VP voltage
> +
> +  cirrus,bst-ipk-microamp:
> +    description:
> +      Maximum current that can be drawn by the device's boost converter.
> +    multipleOf: 50000
> +    minimum: 1600000
> +    maximum: 4800000
> +    default: 4500000
> +
> +  cirrus,bst-ctl-microvolt:
> +    description: Maximum target voltage to which DSP may increase the VBST supply.

There is no such supply as VBST (see above, I see only VA and VP), so is this output?

> +    multipleOf: 50000
> +    minimum: 2550000
> +    maximum: 11000000
> +    default: 11000000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios

Supplies as well



> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      haptic-driver@58 {
> +        compatible = "cirrus,cs40l26a";
> +        reg = <0x58>;
> +        interrupt-parent = <&gpio>;
> +        interrupts = <57 IRQ_TYPE_LEVEL_LOW>;
> +        reset-gpios = <&gpio 54 GPIO_ACTIVE_LOW>;
> +        va-supply = <&vreg>;
> +        vp-supply = <&vreg>;
> +        cirrus,bst-ctl-microvolt = <2600000>;
> +        cirrus,bst-ipk-microamp = <1650000>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc8ce7af3303..9c4105bf0a32 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5546,11 +5546,11 @@ F:	sound/soc/codecs/cs*
>  
>  CIRRUS LOGIC HAPTIC DRIVERS
>  M:	James Ogletree <jogletre@opensource.cirrus.com>
> -M:	Fred Treven <fred.treven@cirrus.com>
> +M:	Fred Treven <ftreven@opensource.cirrus.com>
>  M:	Ben Bright <ben.bright@cirrus.com>
>  L:	patches@opensource.cirrus.com
>  S:	Supported
> -F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> +F:	Documentation/devicetree/bindings/input/cirrus,cs40l*

So input or mfd? I don't understand this.

Best regards,
Krzysztof

