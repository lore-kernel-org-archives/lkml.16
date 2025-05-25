Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A052C181;
	Sun, 25 May 2025 02:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748141139; cv=none; b=Z9PsvE7hi2UHEU1p/G6c3IUPnr/rZoh6hmt2Psz3XgnAHcnxNao9xboVZaTgLwcT9rEJ0D4XfcD1hPwfibbmhwtiL+uhRzGyIH0meyPmTOFQVXIwTYP8DtDAznCVjRHgVGHsVjL7mcLu0dU5p0UVqRG8Z5SVvwmjpd5zCzfay1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748141139; c=relaxed/simple;
	bh=S6Fau+ry1gmJ6BpShZI9+5zRHmA6PBzL9b3ZyN/ZoAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3YFp0H0WeVyb7jug9Ua0ZTKAgDZtryDuk1ji52sbXgfV0M7eM8nPqNIFOaMGd2RhftqZB8ENkFhb5l6lIJH+NNF8HmHZVV2x9Pcg4yEFprpXPoOepXMNM495lBxXy7HFaDx/N1CbanW3tw3ULqWvRj8MnLJi6unrjtm+Sj6MtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVKw7+5i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVKw7+5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EBDC4CEF0;
	Sun, 25 May 2025 02:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748141139;
	bh=S6Fau+ry1gmJ6BpShZI9+5zRHmA6PBzL9b3ZyN/ZoAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aVKw7+5iupi3Y9ILHEI4pFZ+xnMoGtWMW2sTqOeyKlgRw0uspJ3XyNrTuQhAmG7kA
	 8okJyEQpPynzufkWu95qyqm5r8gYJvuU/FCLdAhe45pCN/er+YOmwMWOW0ubCfyF91
	 mQgwQiwQgKVU1EUkj8liRV898khMrh7Iaz2ZVmXtP3TvD9o7AHoLRLJObXzxbowjwl
	 roNC1Mjfo8meSpNheCS2hTakBW4vnKB3Sed8zmHqbLQCrFR2Nlqf9KA83bhuPBBrXX
	 U7Vy6ay9hVEX5rnydR9tcKycUeAWqxHAVrFG3fygb0Vw31c8LQQ0fY7NyHUcFBNYZC
	 BsRR3Ri8XyLSA==
Message-ID: <902daf9d-c728-420e-b6e7-4f52a0833e02@kernel.org>
Date: Sat, 24 May 2025 19:45:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 snps,archs-intc to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250505144834.1292666-1-robh@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20250505144834.1292666-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/5/25 07:48, Rob Herring (Arm) wrote:
> Convert the ARC-HS incore interrupt controller binding to schema format.
> It's a straight-forward conversion of the typical interrupt controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>



Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

> ---
>  .../interrupt-controller/snps,archs-intc.txt  | 22 ---------
>  .../interrupt-controller/snps,archs-intc.yaml | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
> deleted file mode 100644
> index 69f326d6a5ad..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -* ARC-HS incore Interrupt Controller (Provided by cores implementing ARCv2 ISA)
> -
> -Properties:
> -
> -- compatible: "snps,archs-intc"
> -- interrupt-controller: This is an interrupt controller.
> -- #interrupt-cells: Must be <1>.
> -
> -  Single Cell "interrupts" property of a device specifies the IRQ number
> -  between 16 to 256
> -
> -  intc accessed via the special ARC AUX register interface, hence "reg" property
> -  is not specified.
> -
> -Example:
> -
> -	intc: interrupt-controller {
> -		compatible = "snps,archs-intc";
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -		interrupts = <16 17 18 19 20 21 22 23 24 25>;
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
> new file mode 100644
> index 000000000000..9d248ef7fe3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARC-HS incore Interrupt Controller
> +
> +maintainers:
> +  - Vineet Gupta <vgupta@kernel.org>
> +
> +description:
> +  ARC-HS incore Interrupt Controller provided by cores implementing ARCv2 ISA.
> +  intc accessed via the special ARC AUX register interface, hence "reg" property
> +  is not specified.
> +
> +properties:
> +  compatible:
> +    const: snps,archs-intc
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  interrupts:
> +    description: List of IRQ numbers between 16 and 256
> +    items:
> +      items:
> +        - minimum: 16
> +          maximum: 256
> +
> +required:
> +  - compatible
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +        compatible = "snps,archs-intc";
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        interrupts = <16>, <17>, <18>, <19>, <20>, <21>, <22>, <23>, <24>, <25>;
> +    };

