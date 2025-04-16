Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9195D23875A;
	Wed, 16 Apr 2025 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797272; cv=none; b=auFNehYkVZ7oV4tsbSt31rtSUQBLJr2o+Abc1r7fqm15wyRNZQtNMgPaHRseEhGXxP+METVZ78BoA3HFBaCzgSp/ZAD5Fi2aVC7bnZ3Bgr1RgPUKa/g6I6BW/nZK9zaMHNN7oh8LPUgfDIc0La4ruiLMd+qCf62Os2EV+KnPK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797272; c=relaxed/simple;
	bh=S2Paxtu9OlVHsXYskEHwg81iy5Nm7F5lqjEeVAsy1gU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edR17nYgWJfEKjSA7aTOf32Yve3FWP4b40K2qyFFgHOKw+C3nPexSOVcYqhBgU/GCH9rlvnAWyQgNxd2Nug2u0LvhVA1/EvszzjM9SVyOftk+MRQG/G97AZkIY4Gii6qnbhMHAQ6YzG3Xls2AR0abbmUOeb/xakjXk7zk/gMeDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=FM+rpkf9; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="FM+rpkf9"
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 012306045F;
	Wed, 16 Apr 2025 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DpoyvF8vHF6pvhV8jyXEYvZjATLDZX8GvBDzWRv6FA=;
	b=FM+rpkf9eoW+lvZoYQzoN1vxV8CnHsRP+vdDcXt0tEh/wI8JQkPLieYDu73s6xE3+OB1Yr
	Np9xUHAicWx6/od0Ph5/TDrgULa8Ns00rdVhp35BYQ49Q8vsHqp6R+Q2ufInwbDCh+xYF1
	nuFXlQpjbekCQyllLCjsbu3W4iNNhiM=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 1D5E33600F2;
	Wed, 16 Apr 2025 09:54:23 +0000 (UTC)
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
Subject: [PATCH v3 8/8] arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy
Date: Wed, 16 Apr 2025 11:54:00 +0200
Message-ID: <20250416095402.90543-9-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416095402.90543-1-linux@fw-web.de>
References: <20250416095402.90543-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9f979f6b-afa1-4db6-8f8e-fb832d51291b

From: Frank Wunderlich <frank-w@public-files.de>

Enable XS-Phy on Bananapi R4 for pcie2.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                 | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 0d332822971d..37e541a98ee1 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -397,3 +397,7 @@ &tphy {
 &watchdog {
 	status = "okay";
 };
+
+&xsphy {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 72792f4ccde3..868d6c0742e7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -560,7 +560,7 @@ topmisc: system-controller@11d10000 {
 			reg = <0 0x11d10084 0 0xff80>;
 		};
 
-		xs-phy@11e10000 {
+		xsphy: xs-phy@11e10000 {
 			compatible = "mediatek,mt7988-xsphy",
 				     "mediatek,xsphy";
 			#address-cells = <2>;
-- 
2.43.0

