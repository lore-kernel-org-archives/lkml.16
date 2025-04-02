Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D41AAA29;
	Wed,  2 Apr 2025 08:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582477; cv=none; b=AegrD1hGorQoLhV6Fh3q0C+kpKgJX3ZRRjVTjJoCQEGZbBMECnJyTJHGww2uc+Y9Y+wqrcNbL0u+4gVHmNDc3+gC2WsoQfsS7RX9XNXLFdjakohM+ec8SGJZI8Tk6L1woof6fdsZei7+JQiwtcaMAp6e0lzNs5pDWXa28KeKtcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582477; c=relaxed/simple;
	bh=fBfmi+UvdP/eUpQ/8ozTCbqqVHLfNXYxLlPHS6YEA74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVHjR6a6CezHFwD8BZhRknd7kJPwlP3aFl2nYnLVA7aqsOwa4Mi0KuqD5QhWlyoh2/NHKDi6sqIZBDskat9Gf39J63mxEaz4Jkq2HjcblTo5HKyizRiF88KXc2KFKvdXBXBTsn9i2GBunyURbF/+Fm9OVAt60IR5ZA/XPZ8oxYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMIY7G+p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMIY7G+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD6CC4CEDD;
	Wed,  2 Apr 2025 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743582477;
	bh=fBfmi+UvdP/eUpQ/8ozTCbqqVHLfNXYxLlPHS6YEA74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iMIY7G+p2hLBrxGJS7aqCyxCOO6eEZUmrU/GvI2HYqsOusDoi+S7epdpauGiJrL/X
	 c+bxk1OPgU3kFItzSR0/+ejjdIS3BA1Ugo4RS5iYnLHkuEE1NziBCGVELNuJ+lEYoA
	 KfSZROjbmCcQc3IBNQ75jsLtBhUOs33EdV1AP/dSILCoEi5dLsWZ5nPmeBUN2kJmxC
	 HaaJVowKIL4IH0MyTsdDDnxcW30woxacSs4K3Ao24VPujt3/FbCQTvuaF64YOSPOcJ
	 sflRO8LkY7+76c4p7AMWjEWMOBDVJpsqSxHPN9vC0mn06qt8y0MLnx2NJ5XTzZP8QI
	 aL7eTHlRn7ilQ==
Date: Wed, 2 Apr 2025 10:27:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: st7571-i2c: Add Sitronix ST7571 panel
 bindings
Message-ID: <20250402-rare-slick-carp-dbcab9@krzk-bin>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>

On Wed, Apr 02, 2025 at 08:12:10AM +0200, Marcus Folkesson wrote:
> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this is for
> the I2C interface only.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  .../bindings/display/sitronix,st7571-i2c.yaml      | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6e5e0994a98db646a37bb17c4289332546c9266e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml

Drop i2c

> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sitronix,st7571-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sitronix ST7571 Display Panels
> +
> +maintainers:
> +  - Marcus Folkesson <marcus.folkesson@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: sitronix,st7571-i2c

Drop i2c

> +
> +  reg:
> +    description: I2C address of the LCD controller

Drop description


> +    maxItems: 1
> +
> +  sitronix,panel-width-mm:
> +    description: physical panel width [mm]
> +
> +  sitronix,panel-height-mm:
> +    description: physical panel height [mm]

No, use standard properties.

> +
> +  sitronix,panel-nlines:
> +    description: Number of lines in the panel
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 128
> +    default: 128

Ditto

> +
> +  sitronix,panel-start-line:
> +    description: Start line of the panel
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 127
> +    default: 0

Ditto

> +
> +  reset-gpios:
> +    description: GPIO connected to the RST_N signal.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios

Keep same order as in properties.

> +  - sitronix,panel-width-mm
> +  - sitronix,panel-height-mm
> +

Missing ref to panels schema.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #

Drop

> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        display@3f {

Look how this is called in other bindings... The binding and example are
not following existing code. Why? Why doing something entirely
different?

Best regards,
Krzysztof

