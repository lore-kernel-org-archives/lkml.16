Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D951C1F3FEC;
	Thu, 24 Apr 2025 07:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480118; cv=none; b=HuKRYCTVoi5ea6gLDjn1H3y0QcCQogn/kR7Dysm5NbculWjj04BH0T/Q2RKV5rSMeoso/VrIfFJZhEE7EV2D687z+mwKJHwQiLXYwHv8vmTYx84lRgFy1qxDhEneJMP3C5K1itNW3Ie5Uxn3RJvL1O+PvEI++rss8Srnv0xKN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480118; c=relaxed/simple;
	bh=kqdftvwo3yqYPI14qAH7mrwpx4M3j6MZCFUBG/sb9Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3h0z0lmervTVvfoEs4uCxrOALQI5Xn4n5VfvGdMI7oViNcGlJt0DYwvGWus0iqa9BCwBa3pNjA1FI8GFVIpkguYZKROWNLuFu/NIDWeBq5ylO2yQWpqBHTe1CdRbp6X86tgh1ANlK7J2i8fUPESMssdM//Q1W63ceav/z8aEjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJDumgVW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJDumgVW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5402C4CEE3;
	Thu, 24 Apr 2025 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480114;
	bh=kqdftvwo3yqYPI14qAH7mrwpx4M3j6MZCFUBG/sb9Ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJDumgVWKKh/Ap6cT++S2/pVQcEExv4/jB5AxGOOqueaKcGEs3Oxn7oXWBC7q01MM
	 HQFltblZJwBePcq8wdYGQEWzr5xeF0hrMpq6gjlJZlPshX7K9fOWSKGX/kev2nx2u4
	 vvayvzC8nchfrKa55JdJvo1d4NJ6aaa2/pagtgTGOXcAH4YC1tjsY290umFRKFhYlQ
	 e/DLkkg5+1sG+hMweDNikHzws0SdZtZEPxDu/9RC26D0cIW5ix2D9OcH1TxdlnO71V
	 TsxndLYHZ32gn6qMcQKMRaM74OgXbKaU5WSN/coPP0bBLoZHkv1y7b+3JZkk81yyeb
	 NcEwhCMx7EAfQ==
Date: Thu, 24 Apr 2025 09:35:11 +0200
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
Subject: Re: [PATCH v4 4/8] dt-bindings: phy: mtk-xs-phy: support type switch
 by pericfg
Message-ID: <20250424-auspicious-boisterous-pheasant-7d1f9f@kuoka>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-5-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422132438.15735-5-linux@fw-web.de>

On Tue, Apr 22, 2025 at 03:24:27PM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add support for type switch by pericfg register between USB3/PCIe.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v4:
> - changes based on comments from Krzysztof
> - change to phy type configuration controller/register
> ---
>  .../devicetree/bindings/phy/mediatek,xsphy.yaml   | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> index 3b5253659e6f..0bed847bb4ad 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -151,6 +151,21 @@ patternProperties:
>          minimum: 1
>          maximum: 31
>  
> +      mediatek,syscon-type:

Although this should be probably mediatek,phy-type-syscon, because now
it feels like you define here type of syscon. Anyway, keep Rb tag.

Best regards,
Krzysztof

