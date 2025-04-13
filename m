Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68049185B48;
	Sun, 13 Apr 2025 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744534697; cv=none; b=cpwD3NVlO9QmubSIFMgZTVLZd7arqceU8jZegBQRehax1QTru8ikxZaqkl3H+8XZQY2CWdjF8B2U1qSWQ2o/V8pjRUTv5pKlz/LhaTOSh63Oz/d/ODl5+Yf92EiHMbb9rXsPyqpgIZT7UM+kfNYNUhQ4h85iZZnvl0AfHYHhTLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744534697; c=relaxed/simple;
	bh=MHLdY3b1/dBwpiIDGQwINLz2AvTaYEyjenFWp0RCNPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pKKDywKUU7lDbGgO68xDyIvXCMjapmeEXJ8pv9P7frA1PbRNa41EnA/o4K/tf2CP6EXW4HlmmVFGSG4bdPPIt9gPg9JIkbGIzI6KL7fiuRm9/ZypBBr2ztZuaRWga7IHp/3UJ+p444FB8WgHMuccqxucs96gccSjVGRfR8DApzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=cDGfs988; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="cDGfs988"
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 108B65FC6A;
	Sun, 13 Apr 2025 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744534692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SkS+vSuo1znIoysQeehovZJ1m0kqebSTrJLxr1xkdnM=;
	b=cDGfs988LIIYqcjiBKSyw6TwXfDQDp1uPMMGUitip6CDKhA7ECg11X5UOhErtB/remUPCz
	3UnW6VKdgwOqndaB9+6KGu2jRN0BGd569DiE+0gDk1SwxQ6T6IAhABO/UQxA9+lMm1wDtI
	ZCZpacRkyp9eOA3WwXE7i3BsBOvg/6k=
Received: from frank-u24.. (fttx-pool-194.15.86.153.bambit.de [194.15.86.153])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id CA8EE4006C;
	Sun, 13 Apr 2025 08:58:10 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 0/5] Add mt7988 XS-PHY
Date: Sun, 13 Apr 2025 10:58:00 +0200
Message-ID: <20250413085806.8544-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 29a3ad43-8079-44b9-9f98-200054c44558

From: Frank Wunderlich <frank-w@public-files.de>

Mediatek XS-Phy is a high speed phy used for pcie and usb on mt7988 platform.

It requires a topmisc power controller to switch between USB and PCI mode.
This topmisc system controller is also used by ethernet-node which is not
upstreamed yet.
---
regading syscon-fallback...i know that it should be avoided ;)

based on these commits:

ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a "syscon" compatible")
5728c92ae112 ("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")

I tried to get it working without syscon by changing

instance->type_sw = syscon_node_to_regmap(args.np);
to
device_node_to_regmap()

then xsphy was probed sucessfully, but all pcie (not only the one with xsphy)
stopped working.

for ethernet its driver uses syscon_regmap_lookup_by_phandle which needs to
be patched in syscon driver to also use device_node_to_regmap instead of
syscon_node_to_regmap (with create=true). But have not tried this.

regarding the pcie issue when dropping the syscon compatible i would leave
this compatible, but send this patchset as RFC. Maybe anyone can solve this.

Daniel Golle (1):
  phy: mediatek: xsphy: support type switch by pericfg

Frank Wunderlich (4):
  dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
  dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
  dt-bindings: power: Add binding for MediaTek MT7988 topmisc power
    controller
  arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2

 .../bindings/phy/mediatek,xsphy.yaml          | 17 ++++
 .../power/mediatek,power-controller.yaml      | 35 +++++---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 39 +++++++++
 drivers/phy/mediatek/phy-mtk-xsphy.c          | 85 ++++++++++++++++++-
 4 files changed, 164 insertions(+), 12 deletions(-)

-- 
2.43.0

