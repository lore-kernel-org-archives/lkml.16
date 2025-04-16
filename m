Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F232DFA49;
	Wed, 16 Apr 2025 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797262; cv=none; b=cH1KwNi0Of6hELjYIX1hTt0PyQh97QRwFRAZgzEsNMgrTcDq5ge8MTroL1fYMYdp1IvmHtc8/TIffw8ctDiU0N47/BlD6dLVEzUgcMpvPjuN9CDmEc881pfU5Q4E5Tu1v14Lr4SrxkAZVQP/K3gb+jezhVJsuhT+ivSmk1x+M7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797262; c=relaxed/simple;
	bh=wfB0jdhQ3bSQt96NUJ74aG7MvrsFAp4cW9qzPJUo+M4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eLczdlNbfa46vKuH3wUZ0IYewlq0TmsWkpStKNic3nGAkw3RldpUZ9lZ8nbEPNu9mQcU/Xb/+5u/o4JEYnnrIARA8vhlA876ziYx0W0poGlQkGGioY9Cr92rwkDcssvW/Fan1hlA7/8PCqVcrBNevZELz/A5JpsG/oi0cknQRAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=RJEb1Cmg; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="RJEb1Cmg"
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 9FA1F60F58;
	Wed, 16 Apr 2025 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rVB2PVIxoX5y0VwNAUTU6UTUCxBZyuk9nnudYr7DJnI=;
	b=RJEb1CmgobI1aJLc6mB14rwQZcd0xdKnCoexAjengZud24wB39P5LmWApsdemzxEZHloq3
	M22aysxnjBCbDzaV4NwnppmVYB/Cr3bxtPzLPc4FxKrDHBsi8qAzNxuAvtse8YinD90a9M
	J3hIyX8PBYCkra+vLlSpTSBmtVM6H7w=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 6C124360084;
	Wed, 16 Apr 2025 09:54:15 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 0/8] Add Bananapi R4 variants and add xsphy
Date: Wed, 16 Apr 2025 11:53:52 +0200
Message-ID: <20250416095402.90543-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e76a1c3f-a271-4636-9d6e-a4f44f5271a4

From: Frank Wunderlich <frank-w@public-files.de>

With this series i continue the mt7988/bananapi-r4 dts upstream work

https://patchwork.kernel.org/project/linux-mediatek/list/?series=952704
https://patchwork.kernel.org/project/linux-mediatek/list/?series=952805

- Adding new Hardware Variant for bananapi R4 (1 SFP replaced by RJ45 port with internal phy)
- Adding XS-phy for pcie2

because of new compatible for 2g5 variant now requires also a series i merged both into one.

Daniel Golle (1):
  phy: mediatek: xsphy: support type switch by pericfg

Frank Wunderlich (7):
  dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
  arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
  dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
  dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
  dt-bindings: mfd: syscon: Add mt7988-topmisc
  arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
  arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../bindings/phy/mediatek,xsphy.yaml          |  17 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |  11 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 400 +----------------
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  36 ++
 drivers/phy/mediatek/phy-mtk-xsphy.c          |  85 +++-
 9 files changed, 564 insertions(+), 396 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

-- 
2.43.0

