Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA34C17741;
	Fri, 27 Jun 2025 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012491; cv=none; b=e0dBL2dfEORtbNQ09OokTIzkbo6oa/U7aGXh1zAjYH2jRTJuVwqeCUiivN4pmEooKBI+brvwRMmVymSIbYjdfwu82IkbLKd8ZeQOTxQUKoRwcev50m8WZgiBIwsfUUWHDdVmEkHaQ353s2EXilUYPAl0tMrsiOiF7c+pT+IMWsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012491; c=relaxed/simple;
	bh=R1sZzVC/82bShp+OXCNfF4U5u7UiznUIJE69/OzQOtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnU8mLnCZk1FlCnY1xQA/PretjCOeX/qtdttZ+riZh83ywYuO4R4x3F71GLy71qEQrgLlkaBE8flmEn8Tm/JHKHjNBd2dmf7gd7XvyuA8bLvI4dUx0OBj4Ncfs8lWL+DbBZmMt2mUHUflpK/cbIVTSkra/fl/njVjqX5F3A/0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfhF8km/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfhF8km/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00081C4CEE3;
	Fri, 27 Jun 2025 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751012490;
	bh=R1sZzVC/82bShp+OXCNfF4U5u7UiznUIJE69/OzQOtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfhF8km/BFAiaGhTzFhBCOiEFtu4vrTsTW3HOyzC/brHj3LwGcAj3peH9ZLLgCGHo
	 cDEDhbmPHrLRqP8fdh1c+R1J1BcI2AsspLUjfU7YOMg7ZZYqRXZEGgxIFQetMs9Ph8
	 WpcOCwFJUFNqpa+1vs2/OdlbSq/WT8clsFQlmi3FHuMbJCzugLzHB8arMGy/IIOVj3
	 awG43vJyBrsSoxVfP3zw5t/17rJw4LiJjC0FSMHmkkXH9xse/MPtgozMCc8m+5eBr3
	 vrZG18T7OAaoRxCjFXpOCrWTKbrAdsBvIWfinoJMTKq7d4c8ywSe2nmoXuwZhcCWEy
	 hLbj3j5z3pX+Q==
Date: Fri, 27 Jun 2025 10:21:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 5/6] dt-bindings: regulator: Document MediaTek MT6373
 PMIC Regulators
Message-ID: <20250627-meek-furry-mayfly-6bf0e1@krzk-bin>
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-6-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624073548.29732-6-angelogioacchino.delregno@collabora.com>

On Tue, Jun 24, 2025 at 09:35:47AM +0200, AngeloGioacchino Del Regno wrote:
> +properties:
> +  compatible:
> +    const: mediatek,mt6373-regulator

Where is mediatek,mt6373? Nothing in cover letter explains that, but I
expect parent device schema to $ref this one or (better) mention
compatibles for child.

> +
> +  interrupts:
> +    description: Overcurrent warning interrupts
> +    minItems: 1
> +    maxItems: 35
> +
> +  interrupt-names:
> +    description:
> +      Names for the overcurrent interrupts are the same as the name
> +      of a regulator (hence the same as each regulator's node name).
> +      For example, the interrupt name for regulator vs2 will be "vs2".
> +    minItems: 1
> +    maxItems: 35
> +
> +patternProperties:
> +  "^v(ant|aud|aux)18$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false

You need to document what modes mean in schema with constraints and in
text with their actual meaning (see regulator.yaml).

Also: Other comments from previous patch are applicable.

Best regards,
Krzysztof

