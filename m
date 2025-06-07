Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4390721CA18;
	Sat,  7 Jun 2025 21:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331607; cv=none; b=RachYZnSflnAqo9G2Zczsi+bDKI2/MkVEX91dGp21livwLhFlMhThSrP6Ilb4n8lSl3Y5oSYuJIH2uJL2pT9dj4lMHQgGysyoGVP9ecdkGPmGO09YlZlqKnyeOLAAOaLxmLF38s0fTXxzcNE/Arv8awjAVEqAtgR1ZPskV0RJrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331607; c=relaxed/simple;
	bh=b7Ks2MMNciFeMLa8eUiYSRjsz/aoPmB73xGRIMh11d8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYDdX0lrr798P7Y4ip9DvE9uLEh53wzJtxbXMm08vyU+X/Xwy2iyhOQy57CrjLE2kP8Ef3vzAwh7XaibTm+3zSwd3ar9oqlUIdx4cBOTwey3yqHzSUIiIkuCx9MoXyTtgFf2kOHYbKrsv43r1m0pwQfQPN4ydNmWH7emFFhsnC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRGS1Dpw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRGS1Dpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FC1C4CEE4;
	Sat,  7 Jun 2025 21:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331607;
	bh=b7Ks2MMNciFeMLa8eUiYSRjsz/aoPmB73xGRIMh11d8=;
	h=From:To:Cc:Subject:Date:From;
	b=NRGS1DpwNcFMHcGTM8nGqQ2Y1DNAtodeiH2blXhu411xMZydUqqhsrzTrxF+NOQsS
	 LJNmTcikSiuWSwzaiduSNsVpsMxTRSnJ9nP/8haEyl7B0xEaR9vskBamFsI1PzHjT9
	 y+XKCdNPimjxX+My0GNiVGh0N7To+rL1WXprRLb+5zx96Ru7NPLh5kuNmm8iEOVbqL
	 DjD0mABzV7Kv1ebKlZ7m+BkF4ZPoTEDyVzfPFDoGKRLLJFfuVnNiejRYeveAxA+am2
	 iVzv7NM9EcFdQfWecGEMnjz5o7aZtHFU5+zwa7bv7wdgEzQnf+zNhkpCuYFDXNRWdD
	 4k3tBqBqyw1NQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert ti,keystone-usbphy to DT schema
Date: Sat,  7 Jun 2025 16:26:40 -0500
Message-ID: <20250607212641.744683-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI Keystone USB PHY binding to DT schema format. Drop the
"#address-cells" and "#size-cells" properties which don't make sense
without any child nodes.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/keystone-usb-phy.txt         | 19 ----------
 .../bindings/phy/ti,keystone-usbphy.yaml      | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/keystone-usb-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/ti,keystone-usbphy.yaml

diff --git a/Documentation/devicetree/bindings/phy/keystone-usb-phy.txt b/Documentation/devicetree/bindings/phy/keystone-usb-phy.txt
deleted file mode 100644
index 300830dda0bf..000000000000
--- a/Documentation/devicetree/bindings/phy/keystone-usb-phy.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-TI Keystone USB PHY
-
-Required properties:
- - compatible: should be "ti,keystone-usbphy".
- - #address-cells, #size-cells : should be '1' if the device has sub-nodes
-   with 'reg' property.
- - reg : Address and length of the usb phy control register set.
-
-The main purpose of this PHY driver is to enable the USB PHY reference clock
-gate on the Keystone SOC for both the USB2 and USB3 PHY. Otherwise it is just
-an NOP PHY driver.  Hence this node is referenced as both the usb2 and usb3
-phy node in the USB Glue layer driver node.
-
-usb_phy: usb_phy@2620738 {
-	compatible = "ti,keystone-usbphy";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	reg = <0x2620738 32>;
-};
diff --git a/Documentation/devicetree/bindings/phy/ti,keystone-usbphy.yaml b/Documentation/devicetree/bindings/phy/ti,keystone-usbphy.yaml
new file mode 100644
index 000000000000..08dc18e7feea
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti,keystone-usbphy.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/ti,keystone-usbphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Keystone USB PHY
+
+maintainers:
+  - Nishanth Menon <nm@ti.com>
+  - Santosh Shilimkar <ssantosh@kernel.org>
+
+description:
+  The main purpose of this PHY driver is to enable the USB PHY reference clock
+  gate on the Keystone SOC for both the USB2 and USB3 PHY. Otherwise it is just
+  an NOP PHY driver. Hence this node is referenced as both the usb2 and usb3
+  phy node in the USB Glue layer driver node.
+
+properties:
+  compatible:
+    const: ti,keystone-usbphy
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@2620738 {
+        compatible = "ti,keystone-usbphy";
+        reg = <0x2620738 32>;
+    };
-- 
2.47.2

