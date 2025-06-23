Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F3E24A047;
	Mon, 23 Jun 2025 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680097; cv=none; b=IdqYKTG2/ux2GUPwm3RqXCJra8meeEi9qNzcLEQNkvh9MbtYzsNyfto70UXp4C52D+uL6O6LBbdZT1wVIZzaRztzT4666cdsnY86XrGc6K7XbPyKVD2F4wQaXSZ3qXvxfe7vDnKdGxh/EEXllFwUBgebu4LnbVSSprIN6KsKhVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680097; c=relaxed/simple;
	bh=Gs8IvznRVgT9QfG9eZ/tmPi3BniOH2KnrQJ6DGc6zRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJF+nwAjZnBb9W7ruR3yRVQK8QHWN/u6jQJODkrOApWne4WX1x1gU841+q0tgvxvMLdBpMpo7YEvJf1UcGBnHIkII49TuuJG8lSyZEhEb7cxx+fbzgZrQVhu+1mms/+IhGbMh9uO8mCwUj7ghEFWF56y4hKSXPqsGGePylqrV9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iYYPAhYB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iYYPAhYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680094;
	bh=Gs8IvznRVgT9QfG9eZ/tmPi3BniOH2KnrQJ6DGc6zRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iYYPAhYBcEdWr2Pxq7RQr0NcnTAzg8eNQ3Lj+CKpm1G8aQueLVHP7a6Df41JAMuEt
	 URG8wwmsX1EIRPagkUkfnlF/YzCMOAB2bKnjxgTYySeUCg+VfO+M1hb7xsO7EzGLzk
	 etorfcCnmjlCwqzwh6SnhW/82GTNSE7ejCA5hhsQQj767em6vdi+7TPH/G2e4yob53
	 1Y9AjtswGVbgmvZBNvQsOKKc0a2zaAbM01hpUIFI5/d5FX5OqdzHf8zmc6+gw4rVhp
	 nAfc7rll6eRC0P0RIrW+P84YwLDiXqH/t0xe5hN6IZqLIb5qjy8T6SaH/zFvVpZqNp
	 g8ayy4k5RE+MQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69F3817E0EC0;
	Mon, 23 Jun 2025 14:01:33 +0200 (CEST)
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
Subject: [PATCH v1 1/2] dt-bindings: mailbox: Add MediaTek TinySYS MHU mailbox
Date: Mon, 23 Jun 2025 14:01:26 +0200
Message-ID: <20250623120127.109237-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120127.109237-1-angelogioacchino.delregno@collabora.com>
References: <20250623120127.109237-1-angelogioacchino.delregno@collabora.com>
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

