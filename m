Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81591218EA7;
	Sat,  7 Jun 2025 21:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331563; cv=none; b=kpp5acTZUQxRaR/nLefwjWVgZy/EYIHmyQO+fTniYiUkq30WxNftXN2MyHIpwVHQkplrU4L00BvckNnK2Fxx8tH8fZPl+uT9yLg7yzceIKDzdBoaBpD4BM5hfKZFIYtNuVxMpteJYY+JmnuAhRTWNgaDNVwoc2Uce0iJ37S1yxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331563; c=relaxed/simple;
	bh=swF8HFv4xHzI2CsnrsBHSyYi8nPK3ASVByFcyafT7bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRtXig6wVddu/Q6joSVPrBIfRch+HyWSGCWEm+RR+hTsY2Gjq4yK1viVZvgZsS5//RcCl3Q81evAwX2FsKoL4WLCt+Ea8b3T6eVViCeJ5LujGb8afz4T4E3MBLUwpJvmhbeSVlEHg56dIJgGpikWQpTbITyH1PjWAUexAUy+Dwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=th8faaSG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="th8faaSG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E5FC4CEE4;
	Sat,  7 Jun 2025 21:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331563;
	bh=swF8HFv4xHzI2CsnrsBHSyYi8nPK3ASVByFcyafT7bw=;
	h=From:To:Cc:Subject:Date:From;
	b=th8faaSGkC2vkk/lVWqKGYoRxG26W7Fr5RUEX2RhfjMtWALXBoDGw1RyeoGM4BU+E
	 Sb46PwZGPxAYyzZoXhatOkIwfzrLq/0pF+W+JGrgRAl6ayh7wgbgPsqKGrAD22pqNb
	 72mz2t7Xo4V7dcVFgBDu2fMvFBzv65UwX2nImSAzPPyOziIoSGp01UBnPHjonMCVlo
	 U9RC9iKXNgQ4BCyxpZgri/eaG6zJ7qszLS2o8Q4c0PyVBDxRB+ZIP7WZ2J2/c8ZFhr
	 6RcoEZ3YH9t5BORTkogZ/BP4WCYcTp5FQTjbNS+n8ppm09k/fV9a4pP7uKsdeBkCxg
	 WKE1lsPiv2EMw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert marvell,berlin2-usb-phy to DT schema
Date: Sat,  7 Jun 2025 16:25:53 -0500
Message-ID: <20250607212554.742884-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Berlin2 USB PHY binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/berlin-usb-phy.txt           | 16 -------
 .../bindings/phy/marvell,berlin2-usb-phy.yaml | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/berlin-usb-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/marvell,berlin2-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/berlin-usb-phy.txt b/Documentation/devicetree/bindings/phy/berlin-usb-phy.txt
deleted file mode 100644
index be33780f668e..000000000000
--- a/Documentation/devicetree/bindings/phy/berlin-usb-phy.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-* Marvell Berlin USB PHY
-
-Required properties:
-- compatible: "marvell,berlin2-usb-phy" or "marvell,berlin2cd-usb-phy"
-- reg: base address and length of the registers
-- #phys-cells: should be 0
-- resets: reference to the reset controller
-
-Example:
-
-	usb-phy@f774000 {
-		compatible = "marvell,berlin2-usb-phy";
-		reg = <0xf774000 0x128>;
-		#phy-cells = <0>;
-		resets = <&chip 0x104 14>;
-	};
diff --git a/Documentation/devicetree/bindings/phy/marvell,berlin2-usb-phy.yaml b/Documentation/devicetree/bindings/phy/marvell,berlin2-usb-phy.yaml
new file mode 100644
index 000000000000..b401e12a600c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/marvell,berlin2-usb-phy.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/marvell,berlin2-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Berlin USB PHY
+
+maintainers:
+  - Antoine Tenart <atenart@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - marvell,berlin2-usb-phy
+      - marvell,berlin2cd-usb-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@f774000 {
+      compatible = "marvell,berlin2-usb-phy";
+      reg = <0xf774000 0x128>;
+      #phy-cells = <0>;
+      resets = <&chip 0x104 14>;
+    };
-- 
2.47.2

