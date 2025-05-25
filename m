Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73912C181
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 02:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748141129; cv=none; b=TmVx0iXNyVFGjdt1s1FIyltENMhS1t9+sTrwMXy0Ooyr5nMcShn0sKPPlCZE2iM3bsoitWsesv66bmhc5rAtUxENPKBw0q72EPy052C4wxiMvFV7djapTVrTdXDwrdekvUSfuw8s/E0Qgi00jsl95iP+o3HwtHlreY7Mymx4yK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748141129; c=relaxed/simple;
	bh=IYlqTj4fnbNa3NHUfvp38OGv8B+DCsJi7SZuJLOpcVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKOqGefOjjDnbWw0Cm61NQadPXU7fUPwWy3BdORvhs9GVaQ2EHdTFa1uj56dfHTs8MMtV2WYzsV/6CWlu+TyKdDAEVxwjovcHBJvwUrVrxWghINL3NSCuYT6eq1Y7LWe4fGIaIjxWRPEs3qCjjjUPFwGCrS95+KlHESlO0SjKFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lCvLQmPL; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lCvLQmPL"
Message-ID: <2ea8e74c-ae85-48ac-b6b2-9d2d07c2efcb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748141124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/VGYMPCRsZqyLoORFYnZrDpnhIcMfNxO5C+FLY1phw=;
	b=lCvLQmPLL/pHbkotWbuX/47ZwArlPfr4LlMOSHH0WtcBost3uR7bOFS32Sp7ndIDMYwvWa
	+n/D93CDC3SzmlNbsigju+w8H+cUDpFSCh82j97d3vxDTXkvXWZk6DFiyo28L60IbGihqs
	2+PpQ4CuFPVwchmb9Eqc+v4XBRf71kI=
Date: Sat, 24 May 2025 19:45:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 snps,archs-idu-intc to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250505144830.1292495-1-robh@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20250505144830.1292495-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/5/25 07:48, Rob Herring (Arm) wrote:
> Convert the ARC-HS Interrupt Distribution Unit interrupt controller
> binding to schema format. It's a straight-forward conversion of the
> typical interrupt controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>


Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

> ---
>  .../snps,archs-idu-intc.txt                   | 46 ------------------
>  .../snps,archs-idu-intc.yaml                  | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
> deleted file mode 100644
> index a5c1db95b3ec..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -* ARC-HS Interrupt Distribution Unit
> -
> -  This optional 2nd level interrupt controller can be used in SMP configurations
> -  for dynamic IRQ routing, load balancing of common/external IRQs towards core
> -  intc.
> -
> -Properties:
> -
> -- compatible: "snps,archs-idu-intc"
> -- interrupt-controller: This is an interrupt controller.
> -- #interrupt-cells: Must be <1> or <2>.
> -
> -  Value of the first cell specifies the "common" IRQ from peripheral to IDU.
> -  Number N of the particular interrupt line of IDU corresponds to the line N+24
> -  of the core interrupt controller.
> -
> -  The (optional) second cell specifies any of the following flags:
> -    - bits[3:0] trigger type and level flags
> -        1 = low-to-high edge triggered
> -        2 = NOT SUPPORTED (high-to-low edge triggered)
> -        4 = active high level-sensitive <<< DEFAULT
> -        8 = NOT SUPPORTED (active low level-sensitive)
> -  When no second cell is specified, the interrupt is assumed to be level
> -  sensitive.
> -
> -  The interrupt controller is accessed via the special ARC AUX register
> -  interface, hence "reg" property is not specified.
> -
> -Example:
> -	core_intc: core-interrupt-controller {
> -		compatible = "snps,archs-intc";
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -	};
> -
> -	idu_intc: idu-interrupt-controller {
> -		compatible = "snps,archs-idu-intc";
> -		interrupt-controller;
> -		interrupt-parent = <&core_intc>;
> -		#interrupt-cells = <1>;
> -	};
> -
> -	some_device: serial@c0fc1000 {
> -		interrupt-parent = <&idu_intc>;
> -		interrupts = <0>;	/* upstream idu IRQ #24 */
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml
> new file mode 100644
> index 000000000000..286a964f23e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/snps,archs-idu-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARC-HS Interrupt Distribution Unit
> +
> +maintainers:
> +  - Vineet Gupta <vgupta@kernel.org>
> +
> +description: >
> +  ARC-HS Interrupt Distribution Unit is an optional 2nd level interrupt
> +  controller which can be used in SMP configurations for dynamic IRQ routing,
> +  load balancing of common/external IRQs towards core intc.
> +
> +  The interrupt controller is accessed via the special ARC AUX register
> +  interface, hence "reg" property is not specified.
> +
> +properties:
> +  compatible:
> +    const: snps,archs-idu-intc
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    description: |
> +      Number of interrupt specifier cells:
> +        - 1: only a common IRQ is specified.
> +        - 2: a second cell encodes trigger type and level flags:
> +            1 = low-to-high edge triggered
> +            4 = active high level-sensitive (default)
> +    enum: [1, 2]
> +
> +required:
> +  - compatible
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +        compatible = "snps,archs-idu-intc";
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +    };

