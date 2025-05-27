Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F6F522A;
	Tue, 27 May 2025 06:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328682; cv=none; b=DJFutCACYU2XvbflLvHVrG18FAyECWPU67j5b/IaaEoF6y1j/ivye0QY5X63tMgxnoY5LAXwOvpX1aY7kOTMba0UZiy1CDujOCwfVuXzty/YlEpMwkqvcohYhBlXdc7d1DWTbYFEq8mv9ZI4HZuHlQu0YH9g/X2WXrMXBpIYgPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328682; c=relaxed/simple;
	bh=GyLshxmTVFon2TnwhUpFaApuHuBTyELSnTFqumadByA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8cz7EHc/R5NTEfuJsWUAOuUFRSlxv0pWVzIFOlfqAUhooBRO7Y7nyFnGOmDaLRibV3F+swBrlSUJX8mwquuI+8ATFMdA43G5KTJZn5rXjp0nsOlZBZwPw/NJtr0a+BklVdIzH/4X0Zei9BkZgPwqMBeRGoK/FsGN3J1JgVG96s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh+b9Akh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh+b9Akh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FD5C4CEEE;
	Tue, 27 May 2025 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748328682;
	bh=GyLshxmTVFon2TnwhUpFaApuHuBTyELSnTFqumadByA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wh+b9AkhGc9pqdWY0YH4mmFPkSB41l0YnTQNG7zxMMs9d8hG9ugmazSDX/DESsEdZ
	 Oyir4rLP4YJYCNHOM31HmVMfLsP3RnAkkRAKt7ydjjKu2NzzCQXP2yDbJEOFzggs3H
	 48vnv2INWQw77m7c9yP131Ipo+75Oer5+ptrtUN5FzYWwvuGUjpQrKFjDpVfspwRFJ
	 xrVwnnDqLqep96FxaIh3OSpLr9je7+y7wcZgHwGjAkXF9KJzIFehPuKxEJ1UazYN+E
	 oZD8Vw5wioLTG039XzzgPyfZSpwioReS3vzsuLO8y8hkuG2aGwyz8B+N1O8vs5C2vf
	 QqqH8LkJY2lbQ==
Date: Tue, 27 May 2025 08:51:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
Message-ID: <20250527-energetic-pink-cricket-a282fd@kuoka>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>

On Mon, May 26, 2025 at 10:40:18PM GMT, Ze Huang wrote:
> Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
> (MBUS) that is not their immediate parent in the device tree. This bus
> uses a different address mapping than the CPU.
> 
> To express this topology properly, devices are expected to use the
> interconnects with name "dma-mem" to reference the MBUS controller.

I don't get it, sorry. Devices performing DMA through foo-bar should use
dmas property for foo-bar DMA controller. Interconnects is not for that.


> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../bindings/soc/spacemit/spacemit,k1-mbus.yaml    | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..533cf99dff689cf55a159118c32a676054294ffa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-mbus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT Memory Bus controller
> +
> +maintainers:
> +  - Ze Huang <huangze9015@gmail.com>
> +
> +description: |
> +  On the SpacemiT K1 SoC, some devices do not perform DMA through their
> +  immediate parent node in the device tree. Instead, they access memory
> +  through a separate memory bus (MBUS) that uses a different address
> +  mapping from the CPU.
> +
> +  To correctly describe the DMA path, such devices must reference the MBUS
> +  controller through an interconnect with the reserved name "dma-mem".
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-mbus
> +
> +  reg:
> +    maxItems: 1
> +
> +  dma-ranges:
> +    maxItems: 1
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true

No improvements.


> +
> +  "#interconnect-cells":
> +    const: 0

This is not a interconnect provider, but DMA controller, according to
youro description.

> +
> +required:
> +  - compatible
> +  - reg
> +  - dma-ranges
> +  - "#interconnect-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dram-controller@0 {

Either dma-controller or memory-controller, decide what is this.

> +        compatible = "spacemit,k1-mbus";
> +        reg = <0x00000000 0x80000000>;
> +        dma-ranges = <0x00000000 0x00000000 0x80000000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;

Nothing improved.

> +        #interconnect-cells = <0>;
> +    };
> 
> -- 
> 2.49.0
> 
