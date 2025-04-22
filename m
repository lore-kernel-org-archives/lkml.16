Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE632283CA2;
	Tue, 22 Apr 2025 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328301; cv=none; b=Fc/D70015DY/QovW6+kc3k9GSKwef/WZKH8GYVcIsMXiGYJXZP5f8GE462e4NvAVHUxem7TH1szNTQS0suXqUDZb6b6ACCMyDnyIZNjsnHkLqCdduhU9U8dx4fwCjIGVMfSZnzumoPF7QutvqhY1cBzYV7ACLrjuvAFjkvRFE6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328301; c=relaxed/simple;
	bh=g10YLCMlwB2V/wklN7BeTQqwlnmG7MvcYy1rnAtdhw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L9Ql7vdtuW7aTDI1Dq7Gb1P17V4p31LwP+ypKNHe1Pm49bO1t9mwVvtKPBy44GZmdglcRuItrQXOEB3QCwXLnR3Jc5zpZ72I/Iz70nwoJ7lbDWvBV/yoJNEoFTkQZtt4/gOGD7izZL7MfBeg0ETIutt4pbYrdnltQ5E7SsUIkdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=gMdVuls7; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="gMdVuls7"
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id 625AD40478;
	Tue, 22 Apr 2025 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745328290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yWdt4q2nBEN+fekwxjBT5bMLNlT9eKdoTAr3aBX/enA=;
	b=gMdVuls7LC4/Y3tfC0NwW0pDq+cSRNk9Y1walrBnMekNtF3+NqhfC0ojU+YTyPtcEL/F/p
	BI9QoHNMIKpoKSK1cVIyeq3fgjoFc8NYhIaI7QKG6FF7zw3sE0Xm/vkCnz4vp4/7Ti6WM0
	Vx7Nea8jAwyeNoFdvi+IhhfNnF06Lro=
Received: from frank-u24.. (fttx-pool-217.61.156.53.bambit.de [217.61.156.53])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 2C687801F5;
	Tue, 22 Apr 2025 13:24:49 +0000 (UTC)
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
Subject: [PATCH v4 0/8] Add Bananapi R4 variants and add xsphy
Date: Tue, 22 Apr 2025 15:24:23 +0200
Message-ID: <20250422132438.15735-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 1ea57a51-b49c-45da-a7e8-a99325a7d903

From: Frank Wunderlich <frank-w@public-files.de>

With this series i continue the mt7988/bananapi-r4 dts upstream work

changes in v4:
- changes based on review comments in v3 (mostly bindings)
- changed topmisc unit address to match reg

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
 .../bindings/phy/mediatek,xsphy.yaml          |  16 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |  11 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 400 +----------------
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  36 ++
 drivers/phy/mediatek/phy-mtk-xsphy.c          |  85 +++-
 9 files changed, 563 insertions(+), 396 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

-- 
2.43.0

