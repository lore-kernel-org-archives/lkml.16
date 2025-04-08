Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FE11F8921;
	Tue,  8 Apr 2025 06:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094712; cv=none; b=pOlyMwp0VPr4VQZOhE6UsjJmeLka87bE6JF84yvbbZqykWKqY162WbWyvUvO6CT2EIfk85vCujzzmDZDZO71TFIov/DBoHN6F7QpFgcOrGcVQc6S2llR0Fz7/65eKWzPZ4wq416qE3joIJpmkBaC37fPRFLrxnQceehVYTfU6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094712; c=relaxed/simple;
	bh=mOv+HvzRrxAHJGRbI+qsfBmoBE1QErM9V08wm89ZPdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g40McBjTSTMu9BMLTup9KzWF/Pf28ztplqSZwh4UBSC9u1Wl3O6X4LOTrTcc/WJTVuibugrFLxvleqlsfsBTTBsURxM5kVU7B7WxH4z3Gxo7VXhU2yjVRRFoMs/E/kBy13ytqPAW+mUyC0oigWmtlvp9UL6/UsgRwHnqgB8UClY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knKVOs6t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knKVOs6t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA3AC4CEE5;
	Tue,  8 Apr 2025 06:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744094712;
	bh=mOv+HvzRrxAHJGRbI+qsfBmoBE1QErM9V08wm89ZPdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knKVOs6tQaE1iv88Hyq4JBbX/wpDy/tGlgs+QemkXkB+9bADFBEpf8YN+O+rQqOp0
	 x/E114SgTJiJ+Qlve/r7TS7jBBRBayeexEQ6H/i0SNUVssM2gjbKDVJPC8G5CodVUe
	 T3yrGPfVvJt+kQ+bjwpPH5RqHZW86KfiSAHjtGBl2VFA1HFNIfeFSS5+/21zULDYh5
	 WMn9w58KUj5fb0tEm1fq4x3ETD6UJL0yxkD2EbnbeLqiiPGL0i7sn6kukOR0paBtIQ
	 /M5bpqJnPyJX/bZkSMTz+OQxuKfdYaeXD2UiZkMdn0SKNc295OPZ0zItxyX/+2ZjRy
	 7uqyprPyh3o8Q==
Date: Tue, 8 Apr 2025 08:45:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 2/7] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
Message-ID: <20250408-magic-arrogant-hound-0f2de5@shite>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250407-upstream_ospi_v6-v8-2-7b7716c1c1f6@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250407-upstream_ospi_v6-v8-2-7b7716c1c1f6@foss.st.com>

On Mon, Apr 07, 2025 at 03:27:33PM GMT, Patrice Chotard wrote:
> +  st,syscfg-amcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The Address Mapping Control Register (AMCR) is used to split the 256MB
> +      memory map area shared between the 2 OSPI instance. The Octo Memory
> +      Manager sets the AMCR depending of the memory-region configuration.
> +      The memory split bitmask description is:
> +        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
> +        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
> +        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
> +        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
> +        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
> +    items:
> +      items:

That's not what Rob asked. Are we goign to repeat the story of Benjamin
and VD55G1? You got the exact code to use, which only need corrections
in indentation probably. Why not using it?

You miss here '-'.

Best regards,
Krzysztof

