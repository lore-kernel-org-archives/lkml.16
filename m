Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187F125C71A;
	Wed, 14 May 2025 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226599; cv=none; b=uiTOU/flSlSFOgiMXFZMGHrPCYlRoVHL8GCbqbxhbGNrDpzW0poa908Puc0FrNH0EdK2lyPaJxKKuhHXH8naEo6aMGelkwhJTNuDyjDWFUvI8caKz3EgNT4ulD4fqu/ULFh0ki9sstYgkvneTd7P0p2098c7QL2KG6EQtb9u3Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226599; c=relaxed/simple;
	bh=D/UhFncoTOD+fb3+ydS2upDmu7EB98QPAuGaj00u5jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k80sEwtRUqq0cKZyja7EQ86FHB4Eh6C4m4xsWJn1BUe1kqH80n6tp0/lXh5cR+L6IM/UGbVq1dx0PFIE8Ex9lSVMd+E9R5N4UGQdlldQZ30wabLDQCdeX19Bm1AbtLEFUBNapr12Q5o942LwDQuBh1rD2rEVDPCAw8W0WQV04RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wlm2+c1W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wlm2+c1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEA3C4CEF2;
	Wed, 14 May 2025 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747226596;
	bh=D/UhFncoTOD+fb3+ydS2upDmu7EB98QPAuGaj00u5jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wlm2+c1WoBARvxNkE2J1kIKh0KgE/rWg6Li4Br2uQjHmtItBVy2zt4/IUKcFs3W00
	 F2GBZQAsjxI9SDdJ35sVDM0u4uJ4/BgahzwXyRDH/wqRSjM73wUPEHWJj6bL36E0/S
	 TB95yXaRj5rnjesp/8I3aDcHBQM+dwVW+AUjbr7+ETW6QciXU6haseIO+BJzuTJZt/
	 gCECTsv78TsN00uUeTmbjK6siPuSAdzWWyt5vIsM4K/5k+o7SjTUPwNHXlzcMRYJEZ
	 R6t9+rXvS7jAxHMvcZyPv7J3gcSECd1BbBOnwTsuKDzZ5qMpxE49fnHfoL6usQkr8t
	 PclJojWMhXjnw==
Date: Wed, 14 May 2025 07:43:14 -0500
From: Rob Herring <robh@kernel.org>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com
Subject: Re: [PATCH 1/2] dt-bindings: clock: eswin: Documentation for eic7700
 SoC
Message-ID: <20250514124314.GA1770882-robh@kernel.org>
References: <20250514002233.187-1-dongxuyang@eswincomputing.com>
 <20250514002516.290-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514002516.290-1-dongxuyang@eswincomputing.com>

On Wed, May 14, 2025 at 08:25:16AM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add device tree binding documentation and header file for
> the ESWIN EIC7700 clock controller module.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  .../bindings/clock/eswin,eic7700-clock.yaml   |  43 ++
>  .../dt-bindings/clock/eswin,eic7700-clock.h   | 588 ++++++++++++++++++
>  2 files changed, 641 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
>  create mode 100644 include/dt-bindings/clock/eswin,eic7700-clock.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml b/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
> new file mode 100644
> index 000000000000..c39fa99b503c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/eswin,eic7700-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Eswin EIC7700 SoC clock controller
> +
> +maintainers:
> +  - Yifeng Huang <huangyifeng@eswincomputing.com>
> +  - Xuyang Dong <dongxuyang@eswincomputing.com>
> +
> +description: |

Don't need '|'.

> +  The clock controller registers are part of the syscrg block on
> +  eic7700 SoC.

Wrap at 80

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: eswin,eic7700-clock

Drop 'oneOf' and 'items'.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/eswin,eic7700-clock.h>
> +
> +    sys_crg: sys-crg@51828000 {
> +        compatible = "syscon", "simple-mfd";

Must have a specific compatible for the block.

> +        reg = <0x000000 0x51828000 0x000000 0x80000>;
> +        clock: clock-controller {
> +            compatible = "eswin,eic7700-clock";
> +            #clock-cells = <1>;

There's no need for a child node here. Just add '#clock-cells' to the 
parent node.

> +        };
> +    };
