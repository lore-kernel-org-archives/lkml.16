Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4B1207A27;
	Thu, 24 Apr 2025 07:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480064; cv=none; b=GjkuI+tEVJMHj4SkCGcP7IEaErN1DT/TMm1WxDUK6JhHBdHFjdx7egN+6vDNHBFgqZpRDOAQcM53ZynSmue+wPoeJ4KHMjzYVZJmI4fm83V86Lo4bz7qq2qfITvgIeNZj6e3v0J8IJ3VbLGz7X3X6QbluwJqgk3Krdf8mKAK9rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480064; c=relaxed/simple;
	bh=rGl4QjSoKK2+SbhVWRRtNC1El4VOWXYBbVc1P2EXWdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRjiy66w5FHaU2LYyZt2P9PeMcP83EqxKqxz2RX+s+gnHBfDqE+UdNt1No97JJ/c8Cm4+rM+w+835kVs7RC66rgt7AH0WUqjOP8kb8G9JE67ePLILPSGmP03xgb55qoV1Jj9hZhcgpRtBGCCN0j9EB4uMUlYCT1uVjwAUW12thE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJHH5w0b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJHH5w0b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F84C4CEE3;
	Thu, 24 Apr 2025 07:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480064;
	bh=rGl4QjSoKK2+SbhVWRRtNC1El4VOWXYBbVc1P2EXWdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJHH5w0bCFhjooGe42U2kOEnmwjLmprQMBr8Ek5a1J6cl8auMWUbV/SKfHaE8131E
	 08IU14q+hwb8HU4b3Dr+JjuSOS1CnIcHp6Tv0rb3K4Q00HRoGONZ1hgt2LgvghVarM
	 4mai/E98rBTkBKCzPmXImX9G0nIPjtk55U9jqwOccWP7IPGNN/n+OiuanIwP8O4Tsg
	 K3iSL4DX+Algi3n2I+qW4NoJSh3wygFTYtY7Q8y3aplQqTmuxfzMRp94Vc96tMXqZC
	 GuKRyKuEKOL7nJ+eJ2PvPGfrwqUOStWE4NE+/WK1pB3brOXqKay/dYUnyd8pt9MK74
	 Ef9oye6LNchzw==
Date: Thu, 24 Apr 2025 09:34:21 +0200
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
Message-ID: <20250424-witty-outrageous-parakeet-7c93cc@kuoka>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

