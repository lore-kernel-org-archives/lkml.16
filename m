Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52573176AC8;
	Thu, 24 Apr 2025 06:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745476918; cv=none; b=LOf7RCGiG+MWi9es8+Q+BlNM8L3XJIheC/1SGsx/0jnNVo9WSxRdq/p6PBJkDqqWMuSwrdZnQtYPwwHOoQSqshkVMLz/ZS+hHFtsTddAZDqnh5bdRtOlIpSWgb0Bb7bwX3ZZeVCT/YzysNJj5zD1KDupvwwvGB3rY2zEKV+cx98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745476918; c=relaxed/simple;
	bh=M+nFHMzEVi+QVGMGUalVB1g9i8u6j31DvTqyfMj/nZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIyijmty+Z1KoFEV6zy0QyfnKfZnMdSQoa/TGBHRkLvHX7cBlExXAXADC1SzgKXnnlRir2+JwE3L3FxeViZNWcb3gS7AaeDlEx1qfqxXUykduijmOjYr+F9uldHmXxngJbjdn1HwFqOpxZrJBCw/2imqSUA1iI8nZ0LB4qJ4D0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glGhtIHx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glGhtIHx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E344C4CEE3;
	Thu, 24 Apr 2025 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745476918;
	bh=M+nFHMzEVi+QVGMGUalVB1g9i8u6j31DvTqyfMj/nZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=glGhtIHxFk/2r+VTB0xJFT4DLQovRwqbnEKJJ92e3nGBYsoINW1bT6kHDV/tdy9Nj
	 2DqM0oVa8gmje7rIHU80vw7Bd+SLjzDIZNziRR127GQoBxyaM8k6ijIJay8vINFh//
	 IYPsRJBgLhLOL2u93AdfpSfLwfojpdGpGnjM1CaTXptDRCmvJLVsX9z3aE36Bk7d9a
	 GMRIHoIQlndwOdf9TRW6KYvEz0IwoV/076tOtoNdWF9bjZjQXbGwJZy6HquV9ooEm9
	 pFRdoB+ddQTRlTkrd0zcGElbP1YxgMBf11W5XqiWz2vFAHM62j0q/mmja99G0gfhWg
	 /Gv70M5zcytzA==
Date: Thu, 24 Apr 2025 08:41:55 +0200
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
Subject: Re: [PATCH v4 3/8] dt-bindings: phy: mtk-xs-phy: Add mt7988
 compatible
Message-ID: <20250424-muscular-ginger-hog-3047f6@kuoka>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-4-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422132438.15735-4-linux@fw-web.de>

On Tue, Apr 22, 2025 at 03:24:26PM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for xs-phy on mt7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

