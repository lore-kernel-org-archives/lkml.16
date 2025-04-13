Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A55B16CD33;
	Sun, 13 Apr 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744535068; cv=none; b=HRfNuJQ8+NgTiIh4M1p51ak01MmzpiHnwRCDT3Xz5o57fyUSJPKToa4LJ8Z25aXe/l5Q5zyfPQN9qY0z8A/qzs3cVQBMh1KA/A5SmWyqqSlwIznA9+cj7ioOAFPyAtHUsIHhti6eh5PpLoBXt+3ICLIVwxFxVivkmLnvR2tWV5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744535068; c=relaxed/simple;
	bh=m/xG/jfFeu0ykB2GVPn6x1/feKRxP0Iq8oiokxpxlIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUlEyrujmKj2huaHEXjmbM6tnao1LuXi0Yu7+FMpXSsf1FXMeMD+i73aYYAYx06EWfbnTmYj2Vl5/XmDRmVC49ZBKdcHaMaOOw7Glp+GVK6dFcVGsOpqJSF3AD43mmdH5ZiP+i/XRP3ucnmehoHUGwUH47It8iF5HrslixLb334=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=pCzmcJ1B; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="pCzmcJ1B"
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 7FD6460533;
	Sun, 13 Apr 2025 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744534694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bfhYzFpGn1B5RnzNyN51+I0POHsgnSqYypq5zUupqA=;
	b=pCzmcJ1BcwSaDmCCw1UdgyY2Tn8jvDcYynkIZRXOv3KEw2hvW1Jvz42jNDdlX/zuTTcI8F
	6LEXt/pxULn95Qzr2TZpIN9xnRsb6wYmOY/6Bcu1H14wO/bOSM4B4fT53vF5PTpPmWWZOC
	T87WS5vWaPzwJRijvKHymcZtqUMkaWc=
Received: from frank-u24.. (fttx-pool-194.15.86.153.bambit.de [194.15.86.153])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 7FE4E40089;
	Sun, 13 Apr 2025 08:58:13 +0000 (UTC)
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
Subject: [RFC 3/5] dt-bindings: power: Add binding for MediaTek MT7988 topmisc power controller
Date: Sun, 13 Apr 2025 10:58:03 +0200
Message-ID: <20250413085806.8544-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413085806.8544-1-linux@fw-web.de>
References: <20250413085806.8544-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9abf532c-77b9-424f-a697-dc702d13d513

From: Frank Wunderlich <frank-w@public-files.de>

Topmisc is a systemcontroller used for xs-phy and ethernet on  mt7988.
Add binding for it.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../power/mediatek,power-controller.yaml      | 35 +++++++++++++------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 591a080ca3ff..60d2fc7963e5 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -22,17 +22,27 @@ properties:
     pattern: '^power-controller(@[0-9a-f]+)?$'
 
   compatible:
-    enum:
-      - mediatek,mt6735-power-controller
-      - mediatek,mt6795-power-controller
-      - mediatek,mt8167-power-controller
-      - mediatek,mt8173-power-controller
-      - mediatek,mt8183-power-controller
-      - mediatek,mt8186-power-controller
-      - mediatek,mt8188-power-controller
-      - mediatek,mt8192-power-controller
-      - mediatek,mt8195-power-controller
-      - mediatek,mt8365-power-controller
+    oneOf:
+      - items:
+        - enum:
+          - mediatek,mt6735-power-controller
+          - mediatek,mt6795-power-controller
+          - mediatek,mt8167-power-controller
+          - mediatek,mt8173-power-controller
+          - mediatek,mt8183-power-controller
+          - mediatek,mt8186-power-controller
+          - mediatek,mt8188-power-controller
+          - mediatek,mt8192-power-controller
+          - mediatek,mt8195-power-controller
+          - mediatek,mt8365-power-controller
+      - items:
+        - enum:
+          - mediatek,mt7988-topmisc
+        - const: syscon
+        - const: mediatek,mt7988-power-controller
+
+  reg:
+    maxItems: 1
 
   '#power-domain-cells':
     const: 1
@@ -43,6 +53,9 @@ properties:
   '#size-cells':
     const: 0
 
+  '#clock-cells':
+    const: 1
+
 patternProperties:
   "^power-domain@[0-9a-f]+$":
     $ref: "#/$defs/power-domain-node"
-- 
2.43.0

