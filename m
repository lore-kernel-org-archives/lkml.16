Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0388219A9B;
	Mon, 21 Apr 2025 21:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271202; cv=none; b=Dm07xZOHjaQo9UxWeDM89BiNnutn/lwITd1Nmd223ABICWXFz1+rvHJexfQv6RhvzelVWM0C784h3JyWsF+uPmGRiyK/5OzhA8X7X88A+62aJcBIB6qLRvwq6UC4PtHZ+q51XRpc9fwa7prlZkWGyo1HJm06kN450cUPvsQYgto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271202; c=relaxed/simple;
	bh=Xx+6cpWE1kjaraijDBvdCNjbdF2zjzXih7eBRZD0yvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTtshAF27TAXLL5Dfz6Oy8eZcwj7FeZDml13skBrkYxe6MpZHWkj56IqdbaI09g5iA6oJWBTAuK2/nYRg+/xvTaaAnZktKEFFLop0SqLmhZdh14ZmFQYSJ5czJ3oiXcebdR75ZJJ2UgFuFYZ6B24E8uC1SHOyylPEdXjRCic4Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9pGxRxH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9pGxRxH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F67C4CEE4;
	Mon, 21 Apr 2025 21:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271201;
	bh=Xx+6cpWE1kjaraijDBvdCNjbdF2zjzXih7eBRZD0yvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9pGxRxH/UgCZOvI4Zk6EjYMfXppgkIHmHzfoJwkNRNCrBdMyStejGKUfMBX+5fXq
	 VCpxF1jSKykmzz5K0Sw/qysXNVzGRoVelDA2CKPHMsLuRCYCsJDEFBYmY5hEMGDKHJ
	 lfk3nbi3MlnvM5TEPX0r1HD3EYwCGB6xKz/PiFTb92bS0JbC2+XrnKwv7ZUCyHJ8Xq
	 0DDSU9KzunyA34JF8VqV9MI+jgg0yEQ4pky0afnTTCpZ1lCv8/rif5RTpByyHlaXaN
	 3+7hq2j/kuLyBTqIeL0dT3vSLJOYAWUG/0thc9ZM8VH1mjFLEUtqm/JuZ3R34VlAIk
	 Y4rXO++chZKyg==
Date: Mon, 21 Apr 2025 16:33:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, kishon@kernel.org,
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
	vkoul@kernel.org, linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, p.zabel@pengutronix.de,
	chunkuang.hu@kernel.org, conor+dt@kernel.org,
	chunfeng.yun@mediatek.com
Subject: Re: [PATCH 2/2] dt-bindings: phy: mediatek,tphy: Add support for
 MT6893
Message-ID: <174527119912.2965252.1352584821821232964.robh@kernel.org>
References: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>
 <20250416120220.147798-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120220.147798-2-angelogioacchino.delregno@collabora.com>


On Wed, 16 Apr 2025 14:02:20 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Dimensity 1200 (MT6893)
> SoC: this chip integrates a MediaTek generic T-PHY version 2.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

