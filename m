Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E077928D820;
	Tue, 22 Apr 2025 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328305; cv=none; b=Rldw9jIMGvKTx1uJDI/Mu0CsDd7wv9oqWVQ6nACnqOn1Tt3+aUvDQvpPmSZB6JLK+sNt/a/5IEm88V/nZ1JYH7cfI7hHTicahQ6DXxNshR++ccY28x+lfETWLcZo5usHrThOhMkLRie9uhoc1qn/VbOqfLOmr9joOMHwR/t/R/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328305; c=relaxed/simple;
	bh=21eAx4qdovnFQdUocuHwoDbkCn3gioL4y3Mbe12E8Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCnVE/alwYbS5AvovwblVDyM/MQYFyMtWO58NtUyM0kv4yRMhIUNbMlVopvtH/thSofuCMDscGrBia3b7VUKbn5MaJOrT0Opd99gskcRqTHHFjD9h6tRGeFSK75BXok71BBfDIEdTw7L4GUXjvhIbIHch7NmdtqKEcNZe+0D2ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=yFWNV9qO; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="yFWNV9qO"
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id E85A661561;
	Tue, 22 Apr 2025 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745328297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lAaZA5qK/vVGDqno3S4/pNWQHPXmaevDq5rdyc2qK0A=;
	b=yFWNV9qOzdoT1XGn0n3XyUIxew8wXFVlrFYhQQVNxnGDgCHGh7EFeF6eV2R0U+rILyQ9Oq
	6ijwGR1h6xvjGIWgOpw1gvnYM3L9vLwD9Va5AIaCZ58c1NvZhF0e7ul08r5s+6VoetfqL8
	oT9E8q76HEy7ZvKEB4Zfc/gaoDTiln8=
Received: from frank-u24.. (fttx-pool-217.61.156.53.bambit.de [217.61.156.53])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 21BE4812E1;
	Tue, 22 Apr 2025 13:24:56 +0000 (UTC)
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
Subject: [PATCH v4 8/8] arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy
Date: Tue, 22 Apr 2025 15:24:31 +0200
Message-ID: <20250422132438.15735-9-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 0bf218eb-9965-4df4-aefb-1c24f469b40a

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
index a59f8708f0ef..8f6d1dfae24a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -560,7 +560,7 @@ topmisc: system-controller@11d10084 {
 			reg = <0 0x11d10084 0 0xff80>;
 		};
 
-		xs-phy@11e10000 {
+		xsphy: xs-phy@11e10000 {
 			compatible = "mediatek,mt7988-xsphy",
 				     "mediatek,xsphy";
 			#address-cells = <2>;
-- 
2.43.0

