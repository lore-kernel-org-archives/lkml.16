Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F411193402;
	Sat, 12 Apr 2025 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744483054; cv=none; b=lspgEuclxdToC+ahjbT+7JOJIWvpSO2fFqNtRKgZ/UVhLK9HhqM9cEbY9R9O5JyDOX5mbr1B7GFyy8yGJVCOenFsFb9761hnVSU/JwqL9Co7Snsa4QmL5UgEIE8NKlxE6jUn+FYBM0WCzHBqMWTwdF3dZZmLulB5wpvO8BTTgwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744483054; c=relaxed/simple;
	bh=BpK5R2sMEdkLTQEHgR6WN8H07iIrsSB4lh+8YOdW9E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcXPHetOf+SrUZRjvjxnb8BzOMUfozGSaI1i4kPr0J1JAawWwZ1xiq9mdEXIyLCOPG3AkrX0eGBQ8cBlhArLxekvQhJ+khX2bQ2S0akVqbR4LF1/6TDYkUXD2wcG+o7SaHL6mhKgXs0Pq9RKQAw49MCRZW+aZtp9z74ujjVO9vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sGY2UJk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sGY2UJk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C5BC4CEE3;
	Sat, 12 Apr 2025 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744483053;
	bh=BpK5R2sMEdkLTQEHgR6WN8H07iIrsSB4lh+8YOdW9E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGY2UJk++YQ1QXmgTg8+wiGU2gcjReDVYbJr9JZQvfrf95buap1K864GDorOsjW5Y
	 eJ7/25SeCxcgJocaq8e82rZJ5O8/KHFwePtqbOGPEEtHWvY36KynDfMBDn4qtXptzR
	 twc8Ti6ObYZpmFrMBq5g1mo13eYpqpmr7RYaRcahoVxcXDVlkIKIH/bHK7kwgDjgWj
	 cDwSPYDs1voQFN7COJHN8kjDPiWgyCOde1agQXnZU8K3rOT2GsFpxEnq2WNLFXTJmj
	 ijDXQIMgXK8xx4ScvQNfhXlfgX2rpe+8WKFLbKBTqIdn200Up6jaY0diylNwJo2sP+
	 UZ3SzSyBu8MhQ==
Date: Sat, 12 Apr 2025 13:37:32 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Crystal Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
Message-ID: <20250412183732.GA1442430-robh@kernel.org>
References: <20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net>

On Sat, Apr 12, 2025 at 02:49:38PM +0200, J. Neuschäfer wrote:
> This patch rewrites pmc.txt into YAML format. Descriptive texts are
> expanded or shortened in a few places to better fit today's conventions.
> 
> The list of compatible strings (and combinations of them) is based on
> existing device trees in arch/powerpc as well as compatible strings
> already mentioned in the plain-text version of the binding.
> 
> One thing I didn't handle are soc-clk@... nodes as seen in
> Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> Changes in v2:
> - Rebase on v6.15-rc1
> - Link to v1: https://lore.kernel.org/r/20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net
> ---
> 
> Note: The examples include a consumer (sata@19000), to demonstrate how
> sleep specifiers work. I've heard that "unrelated" nodes in examples are
> generally discouraged, but I'm not sure if it's better to keep it or to
> drop it in this example.

I'd drop. Unless you want to fix the error. There's nothing really 
unique with how 'sleep' property works.

> ---
>  .../devicetree/bindings/powerpc/fsl/pmc.txt        |  63 --------
>  .../devicetree/bindings/powerpc/fsl/pmc.yaml       | 159 +++++++++++++++++++++
>  2 files changed, 159 insertions(+), 63 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/pmc.txt b/Documentation/devicetree/bindings/powerpc/fsl/pmc.txt
> deleted file mode 100644
> index 07256b7ffcaab2ba57b33cf279df45d830ce33b3..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/powerpc/fsl/pmc.txt
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -* Power Management Controller
> -
> -Properties:
> -- compatible: "fsl,<chip>-pmc".
> -
> -  "fsl,mpc8349-pmc" should be listed for any chip whose PMC is
> -  compatible.  "fsl,mpc8313-pmc" should also be listed for any chip
> -  whose PMC is compatible, and implies deep-sleep capability.
> -
> -  "fsl,mpc8548-pmc" should be listed for any chip whose PMC is
> -  compatible.  "fsl,mpc8536-pmc" should also be listed for any chip
> -  whose PMC is compatible, and implies deep-sleep capability.
> -
> -  "fsl,mpc8641d-pmc" should be listed for any chip whose PMC is
> -  compatible; all statements below that apply to "fsl,mpc8548-pmc" also
> -  apply to "fsl,mpc8641d-pmc".
> -
> -  Compatibility does not include bit assignments in SCCR/PMCDR/DEVDISR; these
> -  bit assignments are indicated via the sleep specifier in each device's
> -  sleep property.
> -
> -- reg: For devices compatible with "fsl,mpc8349-pmc", the first resource
> -  is the PMC block, and the second resource is the Clock Configuration
> -  block.
> -
> -  For devices compatible with "fsl,mpc8548-pmc", the first resource
> -  is a 32-byte block beginning with DEVDISR.
> -
> -- interrupts: For "fsl,mpc8349-pmc"-compatible devices, the first
> -  resource is the PMC block interrupt.
> -
> -- fsl,mpc8313-wakeup-timer: For "fsl,mpc8313-pmc"-compatible devices,
> -  this is a phandle to an "fsl,gtm" node on which timer 4 can be used as
> -  a wakeup source from deep sleep.
> -
> -Sleep specifiers:
> -
> -  fsl,mpc8349-pmc: Sleep specifiers consist of one cell.  For each bit
> -  that is set in the cell, the corresponding bit in SCCR will be saved
> -  and cleared on suspend, and restored on resume.  This sleep controller
> -  supports disabling and resuming devices at any time.
> -
> -  fsl,mpc8536-pmc: Sleep specifiers consist of three cells, the third of
> -  which will be ORed into PMCDR upon suspend, and cleared from PMCDR
> -  upon resume.  The first two cells are as described for fsl,mpc8578-pmc.
> -  This sleep controller only supports disabling devices during system
> -  sleep, or permanently.
> -
> -  fsl,mpc8548-pmc: Sleep specifiers consist of one or two cells, the
> -  first of which will be ORed into DEVDISR (and the second into
> -  DEVDISR2, if present -- this cell should be zero or absent if the
> -  hardware does not have DEVDISR2) upon a request for permanent device
> -  disabling.  This sleep controller does not support configuring devices
> -  to disable during system sleep (unless supported by another compatible
> -  match), or dynamically.
> -
> -Example:
> -
> -	power@b00 {
> -		compatible = "fsl,mpc8313-pmc", "fsl,mpc8349-pmc";
> -		reg = <0xb00 0x100 0xa00 0x100>;
> -		interrupts = <80 8>;
> -	};
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml b/Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..bb2db8adb74c54fec5d07393573f156c63a9e886
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Power Management Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description: |
> +  The Power Management Controller in several MPC8xxx SoCs helps save power by
> +  controlling chip-wide low-power states as well as peripheral clock gating.
> +
> +  Sleep of peripheral devices is configured by the `sleep` property, for
> +  example `sleep = <&pmc 0x00000030>`. Any cells after the &pmc phandle are
> +  called a sleep specifier.
> +
> +  For "fsl,mpc8349-pmc", sleep specifiers consist of one cell.  For each bit that
> +  is set in the cell, the corresponding bit in SCCR will be saved and cleared
> +  on suspend, and restored on resume.  This sleep controller supports disabling
> +  and resuming devices at any time.
> +
> +  For "fsl,mpc8536-pmc", sleep specifiers consist of three cells, the third of
> +  which will be ORed into PMCDR upon suspend, and cleared from PMCDR upon
> +  resume.  The first two cells are as described for fsl,mpc8548-pmc.  This
> +  sleep controller only supports disabling devices during system sleep, or
> +  permanently.
> +
> +  For "fsl,mpc8548-pmc" or "fsl,mpc8641d-pmc", Sleep specifiers consist of one
> +  or two cells, the first of which will be ORed into DEVDISR (and the second
> +  into DEVDISR2, if present -- this cell should be zero or absent if the
> +  hardware does not have DEVDISR2) upon a request for permanent device
> +  disabling.  This sleep controller does not support configuring devices to
> +  disable during system sleep (unless supported by another compatible match),
> +  or dynamically.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: fsl,mpc8315-pmc
> +          - const: fsl,mpc8313-pmc
> +          - const: fsl,mpc8349-pmc
> +
> +      - items:
> +          - enum:
> +              - fsl,mpc8313-pmc
> +              - fsl,mpc8323-pmc
> +              - fsl,mpc8360-pmc
> +              - fsl,mpc8377-pmc
> +              - fsl,mpc8378-pmc
> +              - fsl,mpc8379-pmc
> +          - const: fsl,mpc8349-pmc
> +
> +      - items:
> +          - const: fsl,p1022-pmc
> +          - const: fsl,mpc8536-pmc
> +          - const: fsl,mpc8548-pmc
> +
> +      - items:
> +          - enum:
> +              - fsl,mpc8536-pmc
> +              - fsl,mpc8568-pmc
> +              - fsl,mpc8569-pmc
> +          - const: fsl,mpc8548-pmc
> +
> +      - const: fsl,mpc8548-pmc
> +
> +      - const: fsl,mpc8641d-pmc

1 enum for these 2.

Rob
