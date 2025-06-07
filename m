Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF1521D584;
	Sat,  7 Jun 2025 21:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331571; cv=none; b=Pfhnw564L2FZHU4Lf/M+F5+382se7xORNukkgYRm0wqyhAHGDbzm5CCRqRlyq/5Mz4Br7U2QB8E2r9Jl5Izsne/LwiqLghXpJinc/VTznpje+HXnkoSsN7xLg4Q84OFfmpG704EgQD/qu1DpAV8Y66HQW6A1ANqCMqXs+3m1DWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331571; c=relaxed/simple;
	bh=9qIg7nbVlH9lBf4gZhbYJUi7zeVRI83SNOM20GBH+CM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bb/SrdfoVQfSvdXGe+TFpryoV+Wcl0dmnu10qb94X7LD1JqouCOAud2cV2LXSe0C24d9sDcFnmDyWBtQ327kKephpEJO4DTMqgh39OFgeiwHfqisUcEShrMZh+W5PsXvdcmq+gOy9PCxwo0d3li3JBHq7KutLGexaEjrEiA7zP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouDPQgbi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouDPQgbi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3E2C4CEF2;
	Sat,  7 Jun 2025 21:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331571;
	bh=9qIg7nbVlH9lBf4gZhbYJUi7zeVRI83SNOM20GBH+CM=;
	h=From:To:Cc:Subject:Date:From;
	b=ouDPQgbiVnLPKhnyAvyov/3263kJMXAShxvV/Usojroe+jzVKurcqPn30gGnV4tQH
	 hwzu98oQEH5TjSPfThN84P7fz9jtH4X+EtbGR3UlYovTeLeH7YRj2akPnrQNLBeFX6
	 mDNQO8jLQnpZMx7UW9DM7NKMRb1MNcam8IWrQjika5zqU/ApkZaPXq4rNaKoTT+FAM
	 9atCRkVQdFmjndCrT2G5pPq9JZ3ku+EWDv1sJWd0/z5kve77yM8FFRruCJ5SDU6XFq
	 Pa1mPAwHG8IEbx3obaxZqDz0ZsdGHO0wqpMHHT984PbMmck+IzZNm8VCyysQU/2R2P
	 Y6ilD77tJlluA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert Marvell MVEBU PHYs to DT schema
Date: Sat,  7 Jun 2025 16:26:07 -0500
Message-ID: <20250607212609.743346-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Armada-375 USB and MVEBU SATA PHY binding to DT
schema format. It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../phy/marvell,armada-375-usb-cluster.yaml   | 40 ++++++++++++++++
 .../bindings/phy/marvell,mvebu-sata-phy.yaml  | 47 +++++++++++++++++++
 .../devicetree/bindings/phy/phy-mvebu.txt     | 42 -----------------
 3 files changed, 87 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/marvell,armada-375-usb-cluster.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/marvell,mvebu-sata-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-mvebu.txt

diff --git a/Documentation/devicetree/bindings/phy/marvell,armada-375-usb-cluster.yaml b/Documentation/devicetree/bindings/phy/marvell,armada-375-usb-cluster.yaml
new file mode 100644
index 000000000000..1706c31644e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/marvell,armada-375-usb-cluster.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/marvell,armada-375-usb-cluster.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Armada 375 USB Cluster
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+description:
+  Control register for the Armada 375 USB cluster, managing USB2 and USB3 features.
+
+properties:
+  compatible:
+    const: marvell,armada-375-usb-cluster
+
+  reg:
+    maxItems: 1
+
+  '#phy-cells':
+    description: Number of PHY cells in specifier. 1 for USB2, 2 for USB3.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    usbcluster: usb-cluster@18400 {
+        compatible = "marvell,armada-375-usb-cluster";
+        reg = <0x18400 0x4>;
+        #phy-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/marvell,mvebu-sata-phy.yaml b/Documentation/devicetree/bindings/phy/marvell,mvebu-sata-phy.yaml
new file mode 100644
index 000000000000..81e942428911
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/marvell,mvebu-sata-phy.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/marvell,mvebu-sata-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell MVEBU SATA PHY
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    const: marvell,mvebu-sata-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: sata
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    sata-phy@84000 {
+        compatible = "marvell,mvebu-sata-phy";
+        reg = <0x84000 0x0334>;
+        clocks = <&gate_clk 15>;
+        clock-names = "sata";
+        #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/phy-mvebu.txt b/Documentation/devicetree/bindings/phy/phy-mvebu.txt
deleted file mode 100644
index 64afdd13d91d..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-mvebu.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* Marvell MVEBU SATA PHY
-
-Power control for the SATA phy found on Marvell MVEBU SoCs.
-
-This document extends the binding described in phy-bindings.txt
-
-Required properties :
-
- - reg		   : Offset and length of the register set for the SATA device
- - compatible	   : Should be "marvell,mvebu-sata-phy"
- - clocks	   : phandle of clock and specifier that supplies the device
- - clock-names	   : Should be "sata"
-
-Example:
-		sata-phy@84000 {
-			compatible = "marvell,mvebu-sata-phy";
-			reg = <0x84000 0x0334>;
-			clocks = <&gate_clk 15>;
-			clock-names = "sata";
-			#phy-cells = <0>;
-		};
-
-Armada 375 USB cluster
-----------------------
-
-Armada 375 comes with an USB2 host and device controller and an USB3
-controller. The USB cluster control register allows to manage common
-features of both USB controllers.
-
-Required properties:
-
-- compatible: "marvell,armada-375-usb-cluster"
-- reg: Should contain usb cluster register location and length.
-- #phy-cells : from the generic phy bindings, must be 1. Possible
-values are 1 (USB2), 2 (USB3).
-
-Example:
-		usbcluster: usb-cluster@18400 {
-			compatible = "marvell,armada-375-usb-cluster";
-			reg = <0x18400 0x4>;
-			#phy-cells = <1>
-		};
-- 
2.47.2

