Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6C271459;
	Tue, 27 May 2025 11:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344393; cv=none; b=OTp4eQiChxROXNsTdyW1wX9xkGaeMZx5leyikrbkGUmNSxcHWrwhSXHS8LjYvnm7jXTBdE9ajrfcXNI32NP52RP/M9AYOrtKVQ8OxW6SAdSabUHmYPzWrnX5CiTDI2sIjljRSkPeYNcy0quthLLNBkExNB1gWJNmfPO7X6FcMXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344393; c=relaxed/simple;
	bh=BRmYYMvaki8BNTEhpCWVyr4VVraTkLE+BoW8c4vBS88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHYPtTqSuA+FnB9Tq+z9BOynI+FA1iK6TiYRmhqYyIDj+lQVPgQpfzpE/HrotpxwlPMKmtChUY+w+ikzBNk0pjlN/5ZgpUomsoeaobeP0xMqQymcfeLbRinGTFjK7A+dLo+rjTRwuitYzRjHofSQfywHMYQ4DmdCrnmhV5Mzjtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from localhost (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1691f3ea4;
	Tue, 27 May 2025 19:13:05 +0800 (GMT+08:00)
Date: Tue, 27 May 2025 19:13:05 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
Message-ID: <aDWeQfqKfxrgTA__@jean.localdomain>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
 <20250527-energetic-pink-cricket-a282fd@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527-energetic-pink-cricket-a282fd@kuoka>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHhkdVk9NHx8fTx4aGklLGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISk5MT1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a971172311503a1kunm501ea4fda7052
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDo6Cgw5CjE6PlY3ORchTzcP
	MD8aFBVVSlVKTE9DSE9PSENNQkxIVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFNSUJINwY+

On Tue, May 27, 2025 at 08:51:19AM +0200, Krzysztof Kozlowski wrote:
> On Mon, May 26, 2025 at 10:40:18PM GMT, Ze Huang wrote:
> > Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
> > (MBUS) that is not their immediate parent in the device tree. This bus
> > uses a different address mapping than the CPU.
> > 
> > To express this topology properly, devices are expected to use the
> > interconnects with name "dma-mem" to reference the MBUS controller.
> 
> I don't get it, sorry. Devices performing DMA through foo-bar should use
> dmas property for foo-bar DMA controller. Interconnects is not for that.
> 

Hi Krzysztof,

Sorry for not clarifying this earlier - let me provide some context.

The purpose of this node is to describe the address translation used for DMA
device to memory transactions. I’m using the "interconnects" property with the
reserved name "dma-mem" [1] in consumer devices to express this relationship.
The actual translation is handled by the `of_translate_dma_address()` [2].
This support was introduced in the series linked in [3].

This setup is similar to what we see on platforms like Allwinner sun5i,
sun8i-r40, and NVIDIA Tegra. [4][5]

I considered reusing the existing Allwinner MBUS driver and bindings.
However, the Allwinner MBUS includes additional functionality such as
bandwidth monitoring and frequency control - features that are either
absent or undocumented on the SpacemiT K1 SoC.

For this reason, I opted to introduce a minimal binding that only expresses
the required DMA mapping relationship.

Let me know if this makes sense or if you'd like me to adjust further.

Thanks!

Ze

Link: https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/interconnect/interconnect.txt#L60 [1]
Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/of/address.c#L635 [2]
Link: https://lore.kernel.org/all/cover.f8909884585996f28d97f4ef95efbcab19527dc4.1554108995.git-series.maxime.ripard@bootlin.com/ [3]
Link: https://elixir.bootlin.com/linux/v6.15/source/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi#L328 [4]
Link: https://elixir.bootlin.com/linux/v6.15/source/arch/arm64/boot/dts/nvidia/tegra234.dtsi#L3052 [5]

> 
> > 
> > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > ---
> >  .../bindings/soc/spacemit/spacemit,k1-mbus.yaml    | 55 ++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..533cf99dff689cf55a159118c32a676054294ffa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-mbus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT Memory Bus controller
> > +
> > +maintainers:
> > +  - Ze Huang <huangze9015@gmail.com>
> > +
> > +description: |
> > +  On the SpacemiT K1 SoC, some devices do not perform DMA through their
> > +  immediate parent node in the device tree. Instead, they access memory
> > +  through a separate memory bus (MBUS) that uses a different address
> > +  mapping from the CPU.
> > +
> > +  To correctly describe the DMA path, such devices must reference the MBUS
> > +  controller through an interconnect with the reserved name "dma-mem".
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-mbus
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  dma-ranges:
> > +    maxItems: 1
> > +
> > +  "#address-cells": true
> > +
> > +  "#size-cells": true
> 
> No improvements.
> 
> 
> > +
> > +  "#interconnect-cells":
> > +    const: 0
> 
> This is not a interconnect provider, but DMA controller, according to
> youro description.
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - dma-ranges
> > +  - "#interconnect-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dram-controller@0 {
> 
> Either dma-controller or memory-controller, decide what is this.
> 

I think memory-controller is better.

>
> > +        compatible = "spacemit,k1-mbus";
> > +        reg = <0x00000000 0x80000000>;
> > +        dma-ranges = <0x00000000 0x00000000 0x80000000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> 
> Nothing improved.
> 

The #address-cells and #size-cells properties are included here to satisfy
`make dt_binding_check` and `make CHECK_DTBS`.

Without them, warnings will be triggered during validation.

    dram-controller@0: dma-ranges: [[0], [0], [0], [2147483648]] is too long

>
> > +        #interconnect-cells = <0>;
> > +    };
> > 
> > -- 
> > 2.49.0
> > 
> 
> 
> 
