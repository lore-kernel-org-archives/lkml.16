Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4EA21B9F1;
	Sat,  7 Jun 2025 21:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331575; cv=none; b=NOQXGsuH64dXVHXlhlGq68IoOCSvjPKTEbqB/wackUA0rn7Olgm5YKhNx+/rYjgjMUYAK/gseb/uLddWbZpWfy4LIQsWXBrvsVXpAImBY4m9hH+iUDYjIoBW0ZadKD+WvlrRWmhOXCHt2OCYYCc/cOUzVsbmbxWDDJYQpFPeDcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331575; c=relaxed/simple;
	bh=EPWwv5YFwd++RWtna5xn9/rjluNdas130e6t6KL0tBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YEJcisZzaERX2qSHPy3EkQI+gHEbvHlaCxGcuHsSQefDsQ//9Z5fxifx2rQ1iWXGo7Co32d31E+FJ0alg5jjs68KJgy9tvYwzJ1/k5lHmOieaZaqPmxzO/gFsN2V8Y5mba45QSkvWaruv/oV4BzKV+XPDI7FjJEosO8xn+oGQUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUbhco6b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUbhco6b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D148AC4CEE4;
	Sat,  7 Jun 2025 21:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331575;
	bh=EPWwv5YFwd++RWtna5xn9/rjluNdas130e6t6KL0tBU=;
	h=From:To:Cc:Subject:Date:From;
	b=PUbhco6bSe3W5GTiAStGHf2noglY9nC0GxCtcjlafz0G0G6sZ5pMTmBZ4Yxfzd48C
	 TxJxGTutYvWgi7Klqcr0jJwcKO1L98KE2BUjtGh790FPMIEJAJg0CrUCyraVR1c6xv
	 BJqln7KwQlb0oqltaP4iyg/eWOGsEeMWONOaIBhIRRDGQ+ezGeCgU8C9yQzPtGbJ53
	 l0s/PIPow2KMqxt2QThDcK8bWimD8n6OfsOfFoVtfZauxchaFntVBukETY+N0XYZFi
	 1i44yIJUBIf6AKBas4HbttkAhlzrZNZJqHDLYbIpP8SH+R86T0niLgtt73+8u5N7LV
	 /MTRibbu0jquQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert marvell,mmp2-usb-phy to DT schema
Date: Sat,  7 Jun 2025 16:26:11 -0500
Message-ID: <20250607212613.743515-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell MMP2 USB PHY binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/marvell,mmp2-usb-phy.yaml    | 38 +++++++++++++++++++
 .../devicetree/bindings/phy/phy-pxa-usb.txt   | 18 ---------
 2 files changed, 38 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/marvell,mmp2-usb-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-pxa-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/marvell,mmp2-usb-phy.yaml b/Documentation/devicetree/bindings/phy/marvell,mmp2-usb-phy.yaml
new file mode 100644
index 000000000000..2441c5fae550
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/marvell,mmp2-usb-phy.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/marvell,mmp2-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell MMP2/PXA USB PHY
+
+maintainers:
+  - Lubomir Rintel <lkundrak@v3.sk>
+
+properties:
+  compatible:
+    enum:
+      - marvell,mmp2-usb-phy
+      - marvell,pxa910-usb-phy
+      - marvell,pxa168-usb-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usbphy@d4207000 {
+        compatible = "marvell,mmp2-usb-phy";
+        reg = <0xd4207000 0x40>;
+        #phy-cells = <0>;
+        status = "okay";
+    };
diff --git a/Documentation/devicetree/bindings/phy/phy-pxa-usb.txt b/Documentation/devicetree/bindings/phy/phy-pxa-usb.txt
deleted file mode 100644
index d80e36a77ec5..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-pxa-usb.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Marvell PXA USB PHY
--------------------
-
-Required properties:
-- compatible: one of: "marvell,mmp2-usb-phy", "marvell,pxa910-usb-phy",
-	"marvell,pxa168-usb-phy",
-- #phy-cells: must be 0
-
-Example:
-	usb-phy: usbphy@d4207000 {
-		compatible = "marvell,mmp2-usb-phy";
-		reg = <0xd4207000 0x40>;
-		#phy-cells = <0>;
-		status = "okay";
-	};
-
-This document explains the device tree binding. For general
-information about PHY subsystem refer to Documentation/driver-api/phy/phy.rst
-- 
2.47.2

