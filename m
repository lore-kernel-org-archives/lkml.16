Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85376205E02
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921186; cv=none; b=S8JAuuKM7wD96sbgzAUYNTFptc+L6utzvAQ1yAdyh1KgnOJe4I8h4uO2JDFl0addHo1q1AnnvaJHSD1MIS636vkNaTED7fWiuIN9XfXh/53F/RfwiFOMKWUxbCFBsPK6tDUOjNfGyqud2e2Il8iOVivKutFHGkMdtrR27CsdTyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921186; c=relaxed/simple;
	bh=Rj1F1CdsQR7vodn4nbBSl2/cDOjmbBIYSSw51w9vcms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4WiqqRI9YNwTIZiHjQWuYyTI9iij+Fd4XA4jJgfl/7PaPt/Vp1bSLkJWwLHOTD7hEWaqWK6iG2Z/7WpSX/kq+3QDaYRqab4XQwRCfG/UisUyrYSdZJKtjfGjssM5GE4994liEXxn+3KV2F4lIXKA1FIzwLbRGxi8aSbHHqcALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=VZVbwhMy; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="VZVbwhMy"
Date: Thu, 17 Apr 2025 16:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744921171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCVV96dJMcjv/QwI7jUJEJjXmkeeqGgfyHC8Tptyc9k=;
	b=VZVbwhMyzExCTdelmD+YtGEOvSYjnW94qIJ3pG2W3JLQ8FOVRrR4ubFu9p1SBbkBb3bHOI
	72CiXjy8pRPnYrpbVMKw2llhwYBNGjdnvjj8kmQzA92Utxpfo4v1uCmjrQqbm90C32gLiR
	vnva1vri38rkQMtWjqGyYcUHmNj5Of0RESc24jBRUpcVa0iWieZDkC9ZWpxOFlbuUTTXLy
	wInaslIJH4dS+LIuzc3OqNkmLpWAir8C5x8IoymZVAIIzcs/duGvlM2Eg0pPfdelwgVVlv
	m2E4UVTkTqXWwHzI6EnqQz5uiilcIycJPySG3zXZSX+trFpT53MB7d5x/IkWBQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
Message-ID: <aAFiTtkcJ8VM9tXo@blossom>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Thu , Apr 17, 2025 at 10:14:49PM +0200, Sasha Finkelstein via B4 Relay a écrit :
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
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
> 
