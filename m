Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EF143151;
	Wed, 23 Apr 2025 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413639; cv=none; b=lJEkJyXf/VlI8rTF6PJGEV2aunDU1y6UeqJG3ai+sdl7LaRw9c/P6WLcu+oSxIZgmLWkFt5eeWciYsFNbm1GzhRV2Z0prkYgVMV8RH3wg4PZ1gpVGcXsELiH8WQK2eBT2hwaMVnOFAs9ZV6/sVx3wF9LsZ544m6O4p2gM3Bvo7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413639; c=relaxed/simple;
	bh=0Y/vxfE7FmeLJELsNe9Pzm5m1MeRdkYQA8cGN80GuXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5AIUmD+x6CLcKYflTpDxn2/kxxgi94ukqU0vhLU3F2JA8zzAMdvRAFfZ0VEw6L/4eB8rVB+TCP32GBRk0uSzICzgLDb2NrtyTAc2ws5By0kE4V9yK+Pc7VUyM9kaY4h6ZZugfto7qbTYj7JaL9xpK6GvuQjuGGFBNPG0habJR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k00bUcuz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k00bUcuz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9298FC4CEE2;
	Wed, 23 Apr 2025 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413634;
	bh=0Y/vxfE7FmeLJELsNe9Pzm5m1MeRdkYQA8cGN80GuXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k00bUcuzt94H99b5OY0qhTC84pXfBi6bfR6OnrBnIHaQeMDR4+xmydUhxe8DvgBEE
	 oEL/tkdD1xi2i9EMOrBoJTceIyU/HXQLafOI03SigmHw1ARA8AtOoAMVRwxeXjkIt9
	 R259pVkXHd8ccmKxFquhMFpthMtPMKmOMJmRNPSqG+D1nDmHMUrLlFMSqfC3nYSDSI
	 eVjQOkGgXtIh2akPdANVWsWViLu8jN9XWN2ev0PjDfF6reM4NRDozL/8wqeoicKp6X
	 l7NkvRZHyW+uzqv4jxsqVv1xuVMJKdYlw2EuSjdVdmuWL/B7SQtPnGTkejCEIpeXsg
	 tQFUQNCRmK3NA==
Date: Wed, 23 Apr 2025 15:07:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Wunderlich <frank-w@public-files.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Daniel Golle <daniel@makrotopia.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy
 variant
Message-ID: <20250423-debonair-tasteful-barracuda-e41c7e@kuoka>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-2-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422132438.15735-2-linux@fw-web.de>

On Tue, Apr 22, 2025 at 03:24:24PM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add new compatible for Bananapi R4 with 2.5G phy.
> Base board is compatible with existing BPI-R4 only 1 SFP is replaced
> by RJ45 port and use mt7988 internal phy.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3:
> - new patch adding compatible for 2.5g variant
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

