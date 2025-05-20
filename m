Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A453B1C3306;
	Tue, 20 May 2025 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734463; cv=none; b=Lv8QQakOcYt4Cfkc//7oy310VpZEnuSUQRisg47UK7RRS6hCokUW0IZoCSHeXkt4NVvFaHH1acmNkA7kEV9FVOgZ2t1+1B8xi6PQHDkzxQHUta4cc8YmQ+3oNC4TTGvoSXB2Prb9WRkhJwh7FWkOlYQHY0eCSOPttF1p5mHyMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734463; c=relaxed/simple;
	bh=DBGPnEJJRtWOLGffcQvnQBXkpXJUe5Cw+ywavZ+qnQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dek2dUYEFIHfsgMnjMHjRZB+QiQdarfdpzIxOts1j4esCaNCJ9u4qD3mdTA+kN9tmuc6/0GrCjzKJnnDHPEG4zVJjdT23VGA0jnts3j7uFB1C7SwhNPlN8JX7JP53eJAFYCUcHu/MBSLwx7713jYZf/brT0NEJ3ZJZNXAIlcTww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JdXto/qr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JdXto/qr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747734459;
	bh=DBGPnEJJRtWOLGffcQvnQBXkpXJUe5Cw+ywavZ+qnQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JdXto/qrBmxynP/97NRajMT4XAPSguV97LWyK+veoB3dQMr6PTLPvBIPPRnD12YkJ
	 zJhIgVozU9XrSkEdCjIoX1rpdUa5Eknpb1LFMPA87J4thSNPkJNPQvyZcRgfCmeAzN
	 Tx/WRs1DZ1ynCgwjA+kmTkufmibYOeN/5/BgDs6NPtyV062Eqc0jygDx8N9ncA218B
	 nuuri5LlXOYNrq1lvqid6nsBVM5tSiyteGMe9RKpZ82nT2Oyj7PdWgPBpYB950sYlG
	 EHIoP4e/nykfRacACrf5QI2iGbVlyxOlT13LG+1v5Xri9+BJENvdX+NwCmfCGF64x4
	 JSxn25fNmZMew==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFB6417E0256;
	Tue, 20 May 2025 11:47:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v4 0/8] Add Bananapi R4 variants and add xsphy
Message-Id: <174773445869.2947010.18205156294642701979.b4-ty@collabora.com>
Date: Tue, 20 May 2025 11:47:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 22 Apr 2025 15:24:23 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> With this series i continue the mt7988/bananapi-r4 dts upstream work
> 
> changes in v4:
> - changes based on review comments in v3 (mostly bindings)
> - changed topmisc unit address to match reg
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
      commit: dedef1ddbd1bb8e36530626f75eaba786a818dfe
[2/8] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
      commit: 2bec30e8fc935b0868e87c32685e6f04190b1390
[7/8] arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
      commit: 45885a2c0bd8a6e91adb2c8897880dca228850e8
[8/8] arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy
      commit: ba0f084948e1f273c6264b1c8cc3cbed814f3b62

Cheers,
Angelo


