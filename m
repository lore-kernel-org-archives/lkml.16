Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8130E219A95;
	Sat,  7 Jun 2025 21:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331539; cv=none; b=kYWZ8adUfGPQZsCH+Mn+Y6+K3e55Rwu6qoZbBSJvX9ek5WoffcPH2Ar9hvukFmRgFzHhJEm46hmWH9zFvV5YYB7O1+8gr6BPuNMgq4fK0HQ63F/A8Hfrzeo/2uP+21JUh7bTgCG/wU7M8Tnw9F0huiNAzaO0c7ZDbMtsT8o/arM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331539; c=relaxed/simple;
	bh=K6AgqbCW9JSjO83IIZgLlFEbhS3N7/Ckiy1gB7abu3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kapUbfFRyyp5s+JLi2IS1iV1X6OOdZ/9JJsgb7/AjTjzv6hzcMtBqmOZ/xZeI/4xr5qjlpMcCvaAPNj9ffh6Urj9qJqtS+UoIMDoOmGOMHx1W84vFYsHIe3XjOBppeqziYth0pbAAC1NNdN+dYw9CmemBtwJZNxnjKAMktk2SRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoZqJDT0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoZqJDT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9488C4CEE4;
	Sat,  7 Jun 2025 21:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331535;
	bh=K6AgqbCW9JSjO83IIZgLlFEbhS3N7/Ckiy1gB7abu3E=;
	h=From:To:Cc:Subject:Date:From;
	b=AoZqJDT0febyKLlUO3MJ4D8cpngI3LYXICgQK5r1J9BfeHhXiP7PK0j/+XcDa4HSF
	 cCJXXRbSAPYd8rJepUHpb0dbRoKtvphOROemAMC8H73VeVjvrGLxPnCoM1HymbyotC
	 aRajyi8gXQjymv0HxOv/0RojHp7V1UEnv/hr6NTZgOhHNyvWE1PGO5N7+7GKF0VdPL
	 rr6M5stWF9tl5M79gEZ5bVbHTJoXqckqimxrk5uvEUD15hHMfcrxm+X/5fpTPS7vCs
	 0dy2lmLp0SZuwNN7m9gZzfjT81qootIKeqdGKMe/gDShAfhdhdiD+8be/wkuTcWaNU
	 CgKoGLlpyUX8g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Bresticker <abrestic@chromium.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert img,pistachio-usb-phy to DT schema
Date: Sat,  7 Jun 2025 16:25:30 -0500
Message-ID: <20250607212531.742082-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Imagination Pistachio USB PHY binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/img,pistachio-usb-phy.yaml   | 62 +++++++++++++++++++
 .../bindings/phy/pistachio-usb-phy.txt        | 29 ---------
 2 files changed, 62 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/img,pistachio-usb-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/img,pistachio-usb-phy.yaml b/Documentation/devicetree/bindings/phy/img,pistachio-usb-phy.yaml
new file mode 100644
index 000000000000..bcc19bc68297
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/img,pistachio-usb-phy.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/img,pistachio-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Pistachio USB PHY
+
+maintainers:
+  - Andrew Bresticker <abrestic@chromium.org>
+
+properties:
+  compatible:
+    const: img,pistachio-usb-phy
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: usb_phy
+
+  '#phy-cells':
+    const: 0
+
+  phy-supply:
+    description: USB VBUS supply. Must supply 5.0V.
+
+  img,refclk:
+    description:
+      Reference clock source for the USB PHY. See
+      <dt-bindings/phy/phy-pistachio-usb.h> for valid values.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  img,cr-top:
+    description: CR_TOP syscon phandle.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#phy-cells'
+  - img,refclk
+  - img,cr-top
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy-pistachio-usb.h>
+    #include <dt-bindings/clock/pistachio-clk.h>
+
+    usb-phy {
+        compatible = "img,pistachio-usb-phy";
+        clocks = <&clk_core CLK_USB_PHY>;
+        clock-names = "usb_phy";
+        #phy-cells = <0>;
+        phy-supply = <&usb_vbus>;
+        img,refclk = <REFCLK_CLK_CORE>;
+        img,cr-top = <&cr_top>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
deleted file mode 100644
index c7970c07ee32..000000000000
--- a/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-IMG Pistachio USB PHY
-=====================
-
-Required properties:
---------------------
- - compatible: Must be "img,pistachio-usb-phy".
- - #phy-cells: Must be 0.  See ./phy-bindings.txt for details.
- - clocks: Must contain an entry for each entry in clock-names.
-   See ../clock/clock-bindings.txt for details.
- - clock-names: Must include "usb_phy".
- - img,cr-top: Must contain a phandle to the CR_TOP syscon node.
- - img,refclk: Indicates the reference clock source for the USB PHY.
-   See <dt-bindings/phy/phy-pistachio-usb.h> for a list of valid values.
-
-Optional properties:
---------------------
- - phy-supply: USB VBUS supply.  Must supply 5.0V.
-
-Example:
---------
-usb_phy: usb-phy {
-	compatible = "img,pistachio-usb-phy";
-	clocks = <&clk_core CLK_USB_PHY>;
-	clock-names = "usb_phy";
-	phy-supply = <&usb_vbus>;
-	img,refclk = <REFCLK_CLK_CORE>;
-	img,cr-top = <&cr_top>;
-	#phy-cells = <0>;
-};
-- 
2.47.2

