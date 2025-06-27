Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63D217741;
	Fri, 27 Jun 2025 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012322; cv=none; b=QRJEFt7dzcOBYcUhlmtqk76ud+joo3tVvEBTNwpypPlxs4glleV3TnFEyPxOTKTfLp4pSETr0uRquRmroRJzFxNqcLzrMI8f9P0FSKrg/IJnN35LVq1b137p/+LWJO1zGfcAnZQteQCoF53+oRtpxo4+7qCfLfpnZxN0jbkBNZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012322; c=relaxed/simple;
	bh=/o9ZO57wn41Pket5Wzm+vGinxIbfR+TSFjHBB2eIaw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiBwb28KR08264zFaXw6sKz9BT1HXzI34pXPiVQXlI3KdCjriamEbwici6X6WF4cEL8SQ/cqsqH5yzBzNVf4q3pEqfgFohKCXvCT3Zi0WXyPfgm4akmiREroVgomtfQk794G8U5NrS1QVMrztMUV9LFlRwIedfcw633QpfoAA9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqPvWOJU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqPvWOJU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9D9C4CEE3;
	Fri, 27 Jun 2025 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751012322;
	bh=/o9ZO57wn41Pket5Wzm+vGinxIbfR+TSFjHBB2eIaw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqPvWOJUhq4fNqUaLX6/zVEbiJ2ufRXlXJd7iW5yx4AHgsSLPzllrYXxv9XZzT9+2
	 G8WzmyyT9tjvwtDSzZU5k8kzB1IgZ+LVupkvMVDDxDg125evJNNdWpdryOPa+WFEXY
	 Ln8Msa63aBbT1ragSp1KsJhOg7xOtAHByGSVqQjoxkwoyAAq0p7KfuxvnY5DjOcWns
	 OGbi+1/L12w6tXsfPCFRZQXn/MccoPSWkQF+5WKzwAgZNWNU+7XuEYnyuIFkVETk53
	 3U05TSllX4qHMt7Qc1RzWLDIPF/o9mQp3I7Spdz1Lz0nfnrddAvc0AoP0qbi/8q1D9
	 wTS106R9JjfuA==
Date: Fri, 27 Jun 2025 10:18:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/6] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
Message-ID: <20250627-neon-hidden-sheep-ed8dae@krzk-bin>
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-4-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624073548.29732-4-angelogioacchino.delregno@collabora.com>

On Tue, Jun 24, 2025 at 09:35:45AM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> MT6373 PMICs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6363-regulator.yaml  | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> new file mode 100644
> index 000000000000..f866c89c56f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6363 PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MT6363 SPMI PMIC provides 10 BUCK and 26 LDO (Low Dropout) regulators
> +  and can optionally provide overcurrent warnings with one ocp interrupt
> +  for each voltage regulator.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6363-regulator
> +
> +  interrupts:
> +    description: Overcurrent warning interrupts

Are you sure interrupts are physically not connected?

> +    minItems: 1
> +    maxItems: 36
> +
> +  interrupt-names:
> +    description:
> +      Names for the overcurrent interrupts are the same as the name
> +      of a regulator (hence the same as each regulator's node name).
> +      For example, the interrupt name for regulator vs2 will be "vs2".

You need to define the items or pattern if this is really flexible in
the hardware (not drivers).

Best regards,
Krzysztof

