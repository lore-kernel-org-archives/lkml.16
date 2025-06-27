Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C4282EB;
	Fri, 27 Jun 2025 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012216; cv=none; b=C3tWulvUFupx5mJwddCyGdMiUj8k7vPhtiG8iIXiWbycPC5tN8hfJX6xBmkX4pbKYfJzzM3B4nzwf7PB3niEepL5nCpcYMdL9RIfpcR4eimPtafAtLbhkjC1vsMFBOizpFZxExjYMjHO35BOTaaXbqyWd6FhyhMH5ZCaNOQl+BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012216; c=relaxed/simple;
	bh=U5s9iEMSbWh9IK7RltR780D3binhRP0cWZphzDzaaHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jz7tY15AJTOl4v3S2pc23Ps2Ja0r4qYsBslgmgNUqT+vtOw0m7+a5PG84/BHl1I34KYaKBmfXwwcnv39adddcMv0clacd2XjCGt2gyM+TnBX8n1pGPJR37aVqUDcHaf+fETNEy+tyT2udik6RWOtP5th0lG22n+9RkOkxU1ZKAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaRZCi9h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaRZCi9h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEBFC4CEE3;
	Fri, 27 Jun 2025 08:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751012216;
	bh=U5s9iEMSbWh9IK7RltR780D3binhRP0cWZphzDzaaHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaRZCi9hyS1TFB/6tfgC0csFv4IxtOprlLG5DcPHHj16yXQENW0cUnsHdVsPv9cMx
	 t3N17ORjeqvREbx+w2UYGGLJ96P8ozvDNAKGtXAuLme9otsRCyt8vXjGoeUO+xawHI
	 7MTozUbELHLWy+ZIZeAXNyb+JSekvOdms4liIFvfEZoYo4cPrMqHLFfpUErfufmkso
	 ZLE6fD1VE96JOgNTFQkC0qbeDSmVzunJuSf2YgykOONTB0p9dhtkQ5DQ1oKg/crkWZ
	 yrI2mhw8Fb+5RqGfOVxjqOZqTutv2LzEX4aohTqxp434Wa4Ht0Mn9U14cht2jbrPQB
	 iywRgC33cR8IQ==
Date: Fri, 27 Jun 2025 10:16:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/6] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
Message-ID: <20250627-premium-clay-husky-9d32bc@krzk-bin>
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624073548.29732-2-angelogioacchino.delregno@collabora.com>

On Tue, Jun 24, 2025 at 09:35:43AM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
> 
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6316-regulator.yaml  | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml
> new file mode 100644
> index 000000000000..019c3c36997c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6316-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6316 SPMI PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description: |
> +  The MediaTek MT6316 PMIC is fully controlled by SPMI interface; it features
> +  four step-down DC/DC (buck) converters and has multiple variants, providing
> +  different phase configurations. In particular:
> +  MT6316BP/VP:    2+2 Phase (buck 1+2, buck 3+4)
> +  MT6316CP/HP/KP: 3+1 Phase (buck 1+2+4, buck 3)
> +  MT6316DP/TP:    4+0 Phase (buck 1+2+3+4)
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6316b-regulator
> +      - mediatek,mt6316c-regulator
> +      - mediatek,mt6316d-regulator
> +
> +  vbuck1234:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +

Here you define all regulators

> +additionalProperties: false

This goes to the end.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: mediatek,mt6316b-regulator
> +    then:
> +      patternProperties:
> +        "^vbuck(12|34)$":

Every device has different regulators, so there is little benefit in
keeping this in one schema file.

Best regards,
Krzysztof

