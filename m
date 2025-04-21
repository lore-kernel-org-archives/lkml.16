Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C521E9916;
	Mon, 21 Apr 2025 21:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271199; cv=none; b=RksNwol7ryc/IWl9S8FdFSdba74Q3GflVmzXM5JYLiZ4N0Jrs8Mre3gu5Svgnj/HqhVf6yIfDnP6cZeKzOCQbUi9veRxZ6FkqPpDK+xd50Gcd84bFobmtYyS9N9I9LMr+aUBbJhq/sW9Jrsl6u8oYL/LAjD4ajH1/TZqyt0i5bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271199; c=relaxed/simple;
	bh=eqF+MyBX1r7/lOmnP6a/7aYsckU/IXClGdPLidP0oJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ON8MCQg8ta5tpPAwFTNLmnn6dPUdCbHmnstTgz9Do7ltE1n7PX5yNPgYVROTp+rhOsrlXlZcodS1YHReQC24RLWbaOaZmaFNHNQ8DLe910euKRJOb/gKdlMDpEdPy/prmDaBwMaonHxTdqIoRFxjjxejwEAxjEErs19/hxqB6Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1r+lhge; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1r+lhge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C9FC4CEE4;
	Mon, 21 Apr 2025 21:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271196;
	bh=eqF+MyBX1r7/lOmnP6a/7aYsckU/IXClGdPLidP0oJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1r+lhge0tzEevxHJYliMUA4pCBeIkPmf5Wkt4LNojU/JiCKA5pvCNqt1xSa8eW31
	 mxTASZE5jvy3k/SWBCH7C5viz8cuvj/3PlxR4i8qFTMzcogXk/rKhXAoKnOPEOIEJ2
	 m39OFF+OYi1Tknl/okIiWoTsK+JGPimADjyIyrukCfAMDZrG3opwwbyfmiUlt1hn1q
	 4xGQXEIUvHfIDU3WiJt1OEzDvZjp7sk2Jd2DgGhCGm5Ouwv/Rtk4kaTAZwBtcUEVR/
	 vCms9JX/fXMCcUOzz+tPHHdcFmFcxBawdGspQB13+pN3lqSugu54WTGg3gtg+ceEGi
	 iI5aqMbpOQWcw==
Date: Mon, 21 Apr 2025 16:33:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, kishon@kernel.org,
	linux-arm-kernel@lists.infradead.org, chunfeng.yun@mediatek.com,
	devicetree@vger.kernel.org, matthias.bgg@gmail.com,
	vkoul@kernel.org, kernel@collabora.com,
	linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
	linux-phy@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for
 MT6893
Message-ID: <174527119351.2964924.8279076574908790939.robh@kernel.org>
References: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>


On Wed, 16 Apr 2025 14:02:19 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the MediaTek Dimensity 1200 (MT6893) SoC: the DSI
> PHY found in this chip is fully compatible with the one found in
> the MT8183 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

