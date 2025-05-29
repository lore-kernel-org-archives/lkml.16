Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A02248AB;
	Thu, 29 May 2025 12:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522656; cv=none; b=Tbb24VVIr0wSDo8s3zAjvSL86OvS5djtjgldWe+Pm1qnsVG04ldrxpSZTa5Oy3eoFNm6xp0Gm3qtOUbQVyYpkqODet8eMvFHZP4CFzAu6Oi7DaywPa3A01leFW3Wsl67K3e2oierSOmyuWnRdqq0gLTR6NeMsF4P/RDL69fVEnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522656; c=relaxed/simple;
	bh=/jrSP6yN6Ik99p3pz+dkFU53s4pI3KuRDwCiogvnSkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADwNfUszE9c2ldQspYOnZqpTlBoytX2z5kLbmZNK+yrJ98/mKf09zCXSz+t89zG0ksFBgSXZRgE6BOnjO1YFFje9jNF8WJ6LPGAK1FYQcpayJ1tpyKHeM/1BDcUUyYviu3bm1L318+Zs3XrO84f1qKC/hpD9AVN7bAxtmnfot+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tETzAO10; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tETzAO10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807BEC4CEE7;
	Thu, 29 May 2025 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748522656;
	bh=/jrSP6yN6Ik99p3pz+dkFU53s4pI3KuRDwCiogvnSkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tETzAO10Nvjt+ZyDwwUYkxnnb7k7IPlXoWK0Ou9nutJvpwHXbL9PQPAIHdQWbW9P+
	 i/eKv/pr7s9QmdP41aPEWgM9A1BLa8m/cyc8El7qvA2GtyQz8PKm1R6yTGLBDyFOta
	 4phECYvwGjO2aQZVaExHqm+ukxROq3sfYT0PRpViXoa4PsSHRijcQ8ckoLMCGNAt5C
	 pBSF4q2gc+fAVCi2rQy6DejsAeJmNHEBWIjD9q2qnt9HpO1OsCTiMY8sBlvhdNCdy1
	 EnEYwiEGclOCWJ6biGq3THhiAJSHHOWU6oMcqqYx4yd0bM+Bhs1Bt4z1x/5Aes4BKR
	 REM8TjLEqH00w==
Date: Thu, 29 May 2025 14:44:07 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, peter.maydell@linaro.org,
	andre.przywara@arm.com
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <aDhWlytLCxONZdF9@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>

[+Andre, Peter]

On Tue, May 13, 2025 at 07:47:54PM +0200, Lorenzo Pieralisi wrote:

[...]

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c8d124c3aa63fd1ec24acb40de72ac2164adeebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v5.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Generic Interrupt Controller, version 5
> +
> +maintainers:
> +  - Lorenzo Pieralisi <lpieralisi@kernel.org>
> +  - Marc Zyngier <maz@kernel.org>
> +
> +description: |
> +  The GICv5 architecture defines the guidelines to implement GICv5
> +  compliant interrupt controllers for AArch64 systems.
> +
> +  The GICv5 specification can be found at
> +  https://developer.arm.com/documentation/aes0070
> +
> +  The GICv5 architecture is composed of multiple components:
> +    - one or more IRS (Interrupt Routing Service)
> +    - zero or more ITS (Interrupt Translation Service)
> +
> +  The architecture defines:
> +    - PE-Private Peripheral Interrupts (PPI)
> +    - Shared Peripheral Interrupts (SPI)
> +    - Logical Peripheral Interrupts (LPI)
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: arm,gic-v5
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
> +  "#interrupt-cells":
> +    description: |
> +      The 1st cell corresponds to the INTID.Type field in the INTID; 1 for PPI,
> +      3 for SPI. LPI interrupts must not be described in the bindings since
> +      they are allocated dynamically by the software component managing them.
> +
> +      The 2nd cell contains the interrupt INTID.ID field.
> +
> +      The 3rd cell is the flags, encoded as follows:
> +      bits[3:0] trigger type and level flags.
> +
> +        1 = low-to-high edge triggered
> +        2 = high-to-low edge triggered
> +        4 = active high level-sensitive
> +        8 = active low level-sensitive
> +
> +    const: 3
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    description:
> +      The VGIC maintenance interrupt.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +  - "#interrupt-cells"
> +  - interrupt-controller
> +
> +patternProperties:
> +  "^irs@[0-9a-f]+$":
> +    type: object
> +    description:
> +      GICv5 has one or more Interrupt Routing Services (IRS) that are
> +      responsible for handling IRQ state and routing.
> +
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: arm,gic-v5-irs
> +
> +      reg:
> +        minItems: 1
> +        items:
> +          - description: IRS control frame

I came across it while testing EL3 firmware, raising the topic for
discussion.

The IRS (and the ITS) has a config frame (need to patch the typo
s/control/config, already done) per interrupt domain supported, that is,
it can have up to 4 config frames:

- EL3
- Secure
- Realm
- Non-Secure

The one described in this binding is the non-secure one.

IIUC, everything described in the DT represents the non-secure address
space. Two questions:

- I don't have to spell out the IRS/ITS config frame (and SETLPI, by
  the way) as non-secure, since that's implicit, is that correct ?
- How can the schema describe, if present, EL3, Secure and Realm frames ?

It would be good if this schema could be reused in firmware to describe
the platform, for that to happen we need to have the questions above
resolved.

Thanks,
Lorenzo

> +          - description: IRS setlpi frame
> +
> +      "#address-cells":
> +        enum: [ 1, 2 ]
> +
> +      "#size-cells":
> +        enum: [ 1, 2 ]
> +
> +      ranges: true
> +
> +      dma-noncoherent:
> +        description:
> +          Present if the GIC IRS permits programming shareability and
> +          cacheability attributes but is connected to a non-coherent
> +          downstream interconnect.
> +
> +      cpus:
> +        description:
> +          CPUs managed by the IRS.
> +
> +      arm,iaffids:
> +        $ref: /schemas/types.yaml#/definitions/uint16-array
> +        description:
> +          Interrupt AFFinity ID (IAFFID) associated with the CPU whose
> +          CPU node phandle is at the same index in the cpus array.
> +
> +    patternProperties:
> +      "^msi-controller@[0-9a-f]+$":
> +        type: object
> +        description:
> +          GICv5 has zero or more Interrupt Translation Services (ITS) that are
> +          used to route Message Signalled Interrupts (MSI) to the CPUs. Each
> +          ITS is connected to an IRS.
> +        additionalProperties: false
> +
> +        properties:
> +          compatible:
> +            const: arm,gic-v5-its
> +
> +          reg:
> +            items:
> +              - description: ITS control frame
> +              - description: ITS translate frame
> +
> +          dma-noncoherent:
> +            description:
> +              Present if the GIC ITS permits programming shareability and
> +              cacheability attributes but is connected to a non-coherent
> +              downstream interconnect.
> +
> +          "#msi-cells":
> +            description:
> +              The single msi-cell is the DeviceID of the device which will
> +              generate the MSI.
> +            const: 1
> +
> +          msi-controller: true
> +
> +        required:
> +          - compatible
> +          - reg
> +          - "#msi-cells"
> +          - msi-controller
> +
> +    required:
> +      - compatible
> +      - reg
> +      - cpus
> +      - arm,iaffids
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +      compatible = "arm,gic-v5";
> +
> +      #interrupt-cells = <3>;
> +      interrupt-controller;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      interrupts = <1 25 4>;
> +
> +      irs@2f1a0000 {
> +        compatible = "arm,gic-v5-irs";
> +        reg = <0x2f1a0000 0x10000>;  // IRS_CONFIG_FRAME for NS
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>, <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> +        arm,iaffids = /bits/ 16 <0 1 2 3 4 5 6 7>;
> +
> +        msi-controller@2f120000 {
> +          compatible = "arm,gic-v5-its";
> +          reg = <0x2f120000 0x10000>,   // ITS_CONFIG_FRAME for NS
> +                <0x2f130000 0x10000>;   // ITS_TRANSLATE_FRAME
> +
> +          #msi-cells = <1>;
> +          msi-controller;
> +
> +        };
> +      };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69511c3b2b76fb7090a2a550f4c59a7daf188493..d51efac8f9aa21629a0486977fdc76a2eaf5c52f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1901,6 +1901,13 @@ F:	drivers/irqchip/irq-gic*.[ch]
>  F:	include/linux/irqchip/arm-gic*.h
>  F:	include/linux/irqchip/arm-vgic-info.h
>  
> +ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
> +M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
> +M:	Marc Zyngier <maz@kernel.org>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5*.yaml
> +
>  ARM HDLCD DRM DRIVER
>  M:	Liviu Dudau <liviu.dudau@arm.com>
>  S:	Supported
> 
> -- 
> 2.48.0
> 
