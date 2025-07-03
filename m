Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0671E5711;
	Thu,  3 Jul 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543157; cv=none; b=Ip1OvcMiR9JYtwgxUDJgNVk5FzKojP2ayMghQx1WvEt7DO8whP+0QL8saJ0LNQVLO0GQO8g0UmWk2jSGXpfebopWDNUvIHojKLlHRKcFsMUGmj+ExFNCFf48ATLqL7ELL0h+gs/YAVjAkTrTe+oGQyi+qrkVvIWBe1eBpvogeDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543157; c=relaxed/simple;
	bh=/kocuTJp4qABRCevTCSJIuvY2BgxR1OBJlqSCLPXK0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LljCrDHlr9UR72OPsbnbdcf16yWjYG4jXNnvdx2eWgPqqQoPeijSBiPXBBSz9d7yiF5vYpHLSrXC5d415nUzKG0xXV5CKeTda01xh6/yM12LhZ7tOyHdNxF8hebZTPSFxzCl0vwWcHm8aJ3Hw7yaJxD9LuZMO3etKUpEyqsPo5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ubi7Am8k; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ubi7Am8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751543154;
	bh=/kocuTJp4qABRCevTCSJIuvY2BgxR1OBJlqSCLPXK0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ubi7Am8khEe9T+9pH18+Y/ZAK4KXhaTpEYuM2igKzmBDnOu/eBfv1mnqfQQBqiV33
	 6Zi1ZsQi0PoKSreyHEA8aQ4E+t+uZyqvi7Kgs7PBJF6D8ocIsubUTTtj/Jll5HxghL
	 FEa26FTIOYmuXjQ/et0WrBY1iQ0Wg1EZQVQ5vmsvWQHEdvxTp4S7/+Pj9DbjuLlQw8
	 YojV2I9zXkxSrbzoRATEA70/plRoPhzprbckjn3MR8jXy/bM4Egcx2fg75onQMYjvB
	 /QUWvl2WX6qt2M03Klx9QNovwC8iEDfc74QveWcvSNJsT900BPXrGiZ5LcOPCK4H/U
	 5k4acEj3XBZwg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80AE417E04C0;
	Thu,  3 Jul 2025 13:45:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 1/2] dt-bindings: mailbox: Add MediaTek TinySYS MHU mailbox
Date: Thu,  3 Jul 2025 13:45:48 +0200
Message-ID: <20250703114549.114313-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703114549.114313-1-angelogioacchino.delregno@collabora.com>
References: <20250703114549.114313-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the MediaTek TinySYS MHU mailbox, used for IPC
with the TinySYS hardware integrated in various MediaTek SoCs.

This mailbox handles a custom MHU enabling communication through
the TinySYS SCMI protocol.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek,mt6985-tinysys-mhu-mbox.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml
new file mode 100644
index 000000000000..20fa5cb0ca0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek TinySYS MHU mailbox
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  This mailbox is used for Inter-Processor Communication (IPC) with the
+  TinySYS hardware integrated in various MediaTek SoCs and handles custom
+  Message Handling Unit (MHU) enabling communication through the TinySYS
+  SCMI protocol.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6985-tinysys-mhu-mbox
+      - mediatek,mt6989-tinysys-mhu-mbox
+      - mediatek,mt8196-tinysys-mhu-mbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    tinysys_mbox0: mailbox@1c351000 {
+        compatible = "mediatek,mt6985-tinysys-mhu-mbox";
+        reg = <0x1c351000 0x1000>;
+        interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
+        #mbox-cells = <0>;
+    };
-- 
2.49.0

