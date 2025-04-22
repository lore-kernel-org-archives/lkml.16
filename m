Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64727C14B;
	Tue, 22 Apr 2025 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328982; cv=none; b=hO1DgpRB222czdnbIue7iFzSO4ecHQjh+WoLHXU0IMm0NBtaf5zEhYgg7iubwGKPeXdoDneofqKFI53DNQgtbh25Hx3UJuUzESAufUKorHCvJY3V/Qx/bLMSVwTU9FkJgRF/m0Yt2vK0wNURkitwXC6Q+agXC4Zus7hSt0EriFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328982; c=relaxed/simple;
	bh=cU7HPtncX36Rn1Avtb4Vg3B3sBjlxUdnwJZpkguYTjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnYg8g6Ts3IW2KKEREio/ahSih340ckCRUVyFHkyk8tSqRDLjloHPmYr2ywM5A8hz7eWbMqL475VdS9LNpfoTth/eiKML7G9qiil9h8Itxdo/q2O/fL/K3eMODpqr/WjPiZKFVXrZYZL86F+/We+D2D/Os6erndZObQ6nL831tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUp5UMsL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUp5UMsL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884D6C4CEE9;
	Tue, 22 Apr 2025 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745328981;
	bh=cU7HPtncX36Rn1Avtb4Vg3B3sBjlxUdnwJZpkguYTjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUp5UMsLAzaQvc/wsa1G3HSZV/CrF8W22sd6vkQF2Ru08XDz7XLhkOTkrAVOUupgh
	 r5C52KdqMsvQa9Al++xGDanllpJnOdmARSdvwcet70BKiMYbDEaoybbzdSf4NHqqCO
	 qjp6oFuUj9A7ZP0KYN27oy7aWCslgI2jq/aIM0GY+hc/I1o6GPS/7ZeWfuc9kpV4Jr
	 CFS7j7v6XG3CGyJQZFXxiEPpJdnCAQqyu8YFh0k4lXD6VlSfioNg6uPY5N5GyCRBvQ
	 lTqrjGQyJ4stWzHT9Rh282RVB/Y5HxoeUUCHyq2bx6LQqiW7P3LgCdEyVR9nhFA0UD
	 FMVxfiyZGEjiw==
Date: Tue, 22 Apr 2025 08:36:19 -0500
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
Message-ID: <20250422133619.GA1095169-robh@kernel.org>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>

On Thu, Apr 17, 2025 at 10:14:49PM +0200, Sasha Finkelstein wrote:
> Add bindings for exposing SPMI registers as NVMEM cells
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 54 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d16b27128f97b5d38fb6ddb5109c70cda5e2ee15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/spmi-nvmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic SPMI NVMEM

What makes this generic?

A generic driver is great, but "generic" or "simple" bindings are 
generally a mistake.

> +
> +description: Exports a series of SPMI registers as NVMEM cells
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,maverick-pmic
> +          - apple,sera-pmic
> +          - apple,stowe-pmic
> +      - const: spmi-nvmem

What happens when there's some other feature of the PMIC exposed that's 
not nvmem?

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    pmic@f {
> +        compatible = "apple,maverick-pmic", "spmi-nvmem";
> +        reg = <0xf SPMI_USID>;
> +
> +        nvmem-layout {
> +            compatible = "fixed-layout";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            boot_stage: boot-stage@6001 {
> +                reg = <0x6001 0x1>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b82704950184bd71623ff41fc4df31e4c7fe87..e7b2d0df81b387ba5398957131971588dc7b89dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2277,6 +2277,7 @@ F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
>  F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
>  F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
>  F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> +F:	Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
>  F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:	Documentation/devicetree/bindings/power/apple*
> 
> -- 
> 2.49.0
> 
