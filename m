Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6211F8908;
	Thu, 17 Apr 2025 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871344; cv=none; b=fyxdAgCpmoEEAI4O19wZs3Lvx2G7KMEglPI4//zogs7Vu5c0VySyC7YiRZarNozKzISp9yOKTYq1Sl7csVAfcfDq+ib64XJwUvzBZIrGSQH98h5EkhQQDEcMxaet2Pktt33wunEBUJiooYRzwmmDTWtq9ppve0zfFkjDuyzTAz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871344; c=relaxed/simple;
	bh=7IAS7u/qyeDA+3kCVGKykpqGrK/XcXN5eUwS62reNK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rotCshyEO8iu87sOhHINLjLDq/nlW4oe2sAb8uBmPr6ZvCFht7G6weq2SwPGw7vISzFGa6CLnqeyLWewZ0shOiIb6Wnx513QAlvhFEWdC4wz2Ga3MNLzCNNpSeN/ZeHaULR+ahnn85kKImClFjBJjNmkbpy9bdKXMbK2zw8vn+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgFcS3y3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgFcS3y3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96E3C4CEE7;
	Thu, 17 Apr 2025 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744871343;
	bh=7IAS7u/qyeDA+3kCVGKykpqGrK/XcXN5eUwS62reNK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgFcS3y3UHQw9SyyZDhs8yKzZcuIEoe57HITDLImj6A11NPPAyrHQSJ9xUg/AFuFe
	 xOLpwLraz8ffZcLpYyyyGF0como1vwUQvXhYFRLmfNOOomn7obPIhTAKjouuUrCrYd
	 +UwlcZGslCBWCMrUyueRUD4aVASK7sggMb1Jmx/k7S05AdSqcowupyn9XUAMA4wL59
	 tjfzjPP987AIoUMM7NYFD00DgbqU4xvofP+Ey2tfzVogiJW6bIa4uMLAUTo+Yt9ttG
	 +7qZeJPNyE9VsEiVwYdy6kPfDRKUvbpuGqTZW7+omMmdBXv0pQNyJR26D6XLizcpBc
	 ttBso8DqragWA==
Date: Thu, 17 Apr 2025 08:28:58 +0200
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
Subject: Re: [PATCH v3 1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy
 variant
Message-ID: <20250417-red-smilodon-of-aurora-e5beaf@shite>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-2-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416095402.90543-2-linux@fw-web.de>

On Wed, Apr 16, 2025 at 11:53:53AM GMT, Frank Wunderlich wrote:
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

