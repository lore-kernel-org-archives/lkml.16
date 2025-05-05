Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BE615AF6;
	Mon,  5 May 2025 16:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460994; cv=none; b=ghWBeRqEqPDEhRTKfZghhRZKtAgsF4qgZld3aRdt79HH7A+DyPYyeNbOKG7b3JI/L4b1WYSsvXSfbNJdzFl1WxZ4auej40mUiCj1G18j7lF+t00/E1o4T/lySZmbguJ/TDD4y/WKV7ZpNdGl7KcHxcUsqWbs6ejccy59scGlADI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460994; c=relaxed/simple;
	bh=JShUoHNOxcFtMymlCDbXQT4jf0W+lgjQzqYxCFWCtdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O2c3ohwGke3F30CvgBOOw9Ax32Z3kPvCL8Fnm6cIwkoeCvbkez/LAxvFUovyQ2WuhfF6jm81rULHRJKA/0MML4RrUXF31TvudD3gCRnWk+BtOEbQYo2j1Nw2yzQ3qo1Nflslzkoskxz8mE4WZt2jW5v7GjaQVndlx4RvT3Gvmjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=ORUpY0pX; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="ORUpY0pX"
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 4E544440F5F;
	Mon,  5 May 2025 18:57:15 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1746460635;
	bh=JShUoHNOxcFtMymlCDbXQT4jf0W+lgjQzqYxCFWCtdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ORUpY0pXkoPMM3sK8BZwYsIzlsNX4uinKRBLTP0+ztPwc/savUZQbYomplJ73ST7H
	 IC2/HweQzUlIOCO7ruYHaeuA957fPRWdRiTIJQMK5ye42lVqWbVptq1VFUQz45sUYc
	 R19iKlNYQN/DGJjk5Sa7EgQk8d8ghtbHJ1kmDHYZt7LtX9tEC/hO/+04lB9SBOHthY
	 lnLqDB0V05YnVrO3QjB8Df6qyJ+JP5QYUhHNewzMgFHhztAWPG0z3elAQneVRHp7c1
	 B5JwQrAQ0TGH5j8pQS3N7AzuldtQPksuU+M1t8umBmXRgLrg0SJJTZe5Sg82SWYM/j
	 NhAOHS8MHPC+g==
From: Baruch Siach <baruch@tkos.co.il>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 cnxt,cx92755-ic to DT schema
In-Reply-To: <20250505144644.1288617-1-robh@kernel.org> (Rob Herring's message
	of "Mon, 5 May 2025 09:46:43 -0500")
References: <20250505144644.1288617-1-robh@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 05 May 2025 18:57:22 +0300
Message-ID: <87v7qfyrrx.fsf@tarshish>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Rob,

On Mon, May 05 2025, Rob Herring (Arm) wrote:

> Convert the Conexant Digicolor interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  .../interrupt-controller/cnxt,cx92755-ic.yaml | 47 +++++++++++++++++++
>  .../interrupt-controller/digicolor-ic.txt     | 21 ---------
>  2 files changed, 47 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
>
> diff --git
> a/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
> b/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
> new file mode 100644
> index 000000000000..3f016cf47812
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/cnxt,cx92755-ic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Conexant Digicolor Interrupt Controller
> +
> +maintainers:
> +  - Baruch Siach <baruch@tkos.co.il>
> +
> +description: Conexant Digicolor Interrupt Controller
> +
> +properties:
> +  compatible:
> +    const: cnxt,cx92755-ic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  syscon:
> +    description: A phandle to the syscon node describing UC registers
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - syscon
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@f0000040 {
> +        compatible = "cnxt,cx92755-ic";
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        reg = <0xf0000040 0x40>;
> +        syscon = <&uc_regs>;
> +    };
> diff --git
> a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> b/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> deleted file mode 100644
> index 42d41ec84c7b..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Conexant Digicolor Interrupt Controller
> -
> -Required properties:
> -
> -- compatible : should be "cnxt,cx92755-ic"
> -- reg : Specifies base physical address and size of the interrupt controller
> -  registers (IC) area
> -- interrupt-controller : Identifies the node as an interrupt controller
> -- #interrupt-cells : Specifies the number of cells needed to encode an
> -  interrupt source. The value shall be 1.
> -- syscon: A phandle to the syscon node describing UC registers
> -
> -Example:
> -
> -	intc: interrupt-controller@f0000040 {
> -		compatible = "cnxt,cx92755-ic";
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -		reg = <0xf0000040 0x40>;
> -		syscon = <&uc_regs>;
> -	};

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
