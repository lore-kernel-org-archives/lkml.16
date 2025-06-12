Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751F32AE8D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732154; cv=none; b=gsMl2/hmMkDazGZ1tjeYAxs6L7FeCOMLiCM4bCopYXuYrilqYSOf+vnIcMDa2D5Qe0N6tdo27I4kEDJFZhQn2HYqr7zhWCXZMnRvwGHWk05CBFF/TNU/iCOZX4ojgym+OKr9vpiJIJkV9fgvYH2kBi/eGfIRZS0rLMyQHd1PMfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732154; c=relaxed/simple;
	bh=697PY5Nbn19ygEdhBM6ksoSsaGIhpIVkom3/BoDU+O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3+g/4p5JhzM4QXks2KWp9+urCBB3845pd9Yvpv+c8ld0YQYMIPO/EO+ihIwlKRqARaAy4pxd3Y+Msy+3HPYYN6L0kwkR9ZQsDEZbBmzTWeDNBuHs03DHKRlQFNpxgFpnzAlzPixRNAeuoYg86Wgczo6cclN3L++2W2kJAsc4TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1uPhG0-00029s-Mk; Thu, 12 Jun 2025 14:42:12 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1uPhFz-0037mO-05;
	Thu, 12 Jun 2025 14:42:11 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1uPhFy-008uO9-2t;
	Thu, 12 Jun 2025 14:42:10 +0200
Date: Thu, 12 Jun 2025 14:42:10 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: yassine.ouaissa@allegrodvt.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
Message-ID: <aErLIriSYa1meukJ@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	yassine.ouaissa@allegrodvt.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
 <20250605-allegro_dvt_al300_dec_driver-v2-2-1ef4839f5f06@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250605-allegro_dvt_al300_dec_driver-v2-2-1ef4839f5f06@allegrodvt.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Thu, 05 Jun 2025 12:26:57 +0000, Yassine Ouaissa via B4 Relay wrote:
> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> 
> Add compatible for video decoder on allegrodvt Gen 3 IP.
> 
> v2:
> - Change the YAML file name, use the existing vendor-prefix.
> - Improuve the dt-bindings description.
> - Change the device compatible identifier, from "allegrodvt, al300-vdec",
>   to "allegro, al300-vdec"
> - Simplify the register property specification,
>   by using the simple min/max items constraint (Krzysztof Kozlowski)
> - Remove the clock-names property. And remove it from the required
>   properties list (Krzysztof Kozlowski) (Conor Dooley)
> - Use the simple maxItems constraint for the memory-region property.
>   Also for the firmware-name (Krzysztof Kozlowski)
> - Example changes:
>   - Use header provides definitions for the interrupts (Conor Dooley)
>   - Improuve Interrupt specification using GIC constants (Conor Dooley)
>   - Use generic node name "video-decoder" (Krzysztof Kozlowski) (Conor Dooley)
>   - Remove unused label (Krzysztof Kozlowski)
>   - Change clock reference from <&mcu_clock_dec> to <&mcu_core_clk>
>   - Use hex format for reg property (Krzysztof Kozlowski) (Conor Dooley)
>   - Reduce memory region size (Krzysztof Kozlowski) (Conor Dooley)
> 
>   - Link v1: https://patchwork.linuxtv.org/project/linux-media/patch/20250511144752.504162-4-yassine.ouaissa@allegrodvt.com/
> 
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  .../bindings/media/allegro,al300-vdec.yaml         | 75 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  2 files changed, 77 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..26f9ac39682431b1d4828aed5d1ed43ef099e204
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allegro,al300-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allegro DVT Video IP Decoder Gen 3
> +
> +maintainers:
> +  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
> +
> +description: The al300-vdec represents the gen 3 of Allegro DVT IP video
> +  decoding technology, offering significant advancements over its
> +  predecessors. This new decoder features enhanced processing capabilities
> +  with improved throughput and reduced latency.
> +
> +  Communication between the host driver software and the MCU is implemented
> +  through a specialized mailbox interface mechanism. This mailbox system
> +  provides a structured channel for exchanging commands, parameters, and
> +  status information between the host CPU and the MCU controlling the codec
> +  engines.
> +
> +properties:
> +  compatible:
> +    const: allegro,al300-vdec
> +
> +  reg:
> +    maxItems: 2
> +    minItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: apb

If I understand correctly, "regs" are the registers to control the MCU
and "apb" are the registers of the actual codec engines, which is
controlled by the MCU. The driver never accesses the apb registers, but
uses the apb address only to configure the firmware and tell it, where
the registers of the codec engines are found.

Maybe a separate node for the actual codec that is referred via a
phandle could be a better description of the hardware?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: MCU core clock
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: False
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    axi {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        video-decoder@a0120000 {
> +            compatible = "allegro,al300-vdec";
> +            reg = <0x00 0xa0120000 0x00 0x10000>,
> +                  <0x01 0x80000000 0x00 0x8000>;
> +            reg-names = "regs", "apb";
> +            interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&mcu_core_clk>;
> +            firmware-name = "al300_vdec.fw";
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index abc6ba61048771303bc219102f2db602266b7c30..1ff78b9a76cb8cdf32263fcd9b4579b4a2bb6b2a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -816,7 +816,9 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
>  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
> +F:	drivers/media/platform/allegro-dvt/al300
>  F:	drivers/media/platform/allegro-dvt/zynqmp
>  
>  ALLIED VISION ALVIUM CAMERA DRIVER
> 
> -- 
> 2.30.2
> 
> 
> 
