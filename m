Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B4A1F4CBE;
	Tue, 15 Apr 2025 01:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744679913; cv=none; b=CTUHeD/vU05HWJQz01paCYXWBULs1fQk65s/W/7bo0M/2Fq7ZMSU36qXNB2stEtMwSgBLjFO9pWPsnUhyjMkUxhnuWKorEaY2LceHOntFo0l8V09V1IHGQmj3vTDGHwIJQY782CEoT7fyKS8drZurLxWDYcVjweNj3A+YnkN+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744679913; c=relaxed/simple;
	bh=/I+5JJgGfjGwoTlaskG17YojLd/pT4v5CLvzr+PFAkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jlUY5R4WJTGezRog14JTRFEWNhn9aTDZXsCa/BoT0q41WQncsPgzbTdpZWKPWXbbF0I42qluT9rH4k/36xNOwJ3eByoyFWoeKchvNKm4UmrVXk6tSU1KvfnhZFlMjcl8QYxjBu5oB+K1yTQ8E370V08ZTRjT99Nq2HyDCycW4SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvxzZzfc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvxzZzfc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EF4C4CEEA;
	Tue, 15 Apr 2025 01:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744679913;
	bh=/I+5JJgGfjGwoTlaskG17YojLd/pT4v5CLvzr+PFAkU=;
	h=From:To:Cc:Subject:Date:From;
	b=pvxzZzfcBJDh9WP08XfI5yj2vV8vO+llRommnmxgivBzqdmSsNKaoFZdt80kN6z0M
	 C9bDj1SaNRNckQdvgKh+//5jR9e69jC0Dbn2afcKYxvuK8wC8BFQe0YS7C2Yp5Zphu
	 wIPp1I4pfLR05Z6oEqPxPLKt8mvYTuLkyZdx5zW/0zC3JVd80aYj+atahStfW7oXOK
	 gg+LenB6q52ZWWiGKaZlabA5zEVvyEj5IFZOftXjjPL4DotlGeWNCGVLv0Kja655xH
	 mMnEbx5tfuEtj3a1gnEvoi8KHWAD+C4LWb0JxyJ2Qs6w8AxDz3CkKwJ6/9KxaHqrQ4
	 G2BkArsUHPIJQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY to schema
Date: Mon, 14 Apr 2025 20:18:23 -0500
Message-ID: <20250415011824.2320039-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Rockchip RK3399 PCIe PHY to DT schema format. Move the
example to the GRF binding as that has the complete block.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - actually include new schema file!
---
 .../phy/rockchip,rk3399-pcie-phy.yaml         | 45 +++++++++++++++++++
 .../bindings/phy/rockchip-pcie-phy.txt        | 36 ---------------
 .../devicetree/bindings/soc/rockchip/grf.yaml | 13 +++++-
 3 files changed, 56 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3399-pcie-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-pcie-phy.yaml
new file mode 100644
index 000000000000..f46f065e5dbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-pcie-phy.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/rockchip,rk3399-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3399 PCIE PHY
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3399-pcie-phy
+
+  '#phy-cells':
+    oneOf:
+      - const: 0
+        deprecated: true
+      - const: 1
+        description: One lane per phy mode
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: refclk
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: phy
+
+required:
+  - compatible
+  - '#phy-cells'
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+...
diff --git a/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
deleted file mode 100644
index b496042f1f44..000000000000
--- a/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Rockchip PCIE PHY
------------------------
-
-Required properties:
- - compatible: rockchip,rk3399-pcie-phy
- - clocks: Must contain an entry in clock-names.
-	See ../clocks/clock-bindings.txt for details.
- - clock-names: Must be "refclk"
- - resets: Must contain an entry in reset-names.
-	See ../reset/reset.txt for details.
- - reset-names: Must be "phy"
-
-Required properties for legacy PHY mode (deprecated):
- - #phy-cells: must be 0
-
-Required properties for per-lane PHY mode (preferred):
- - #phy-cells: must be 1
-
-Example:
-
-grf: syscon@ff770000 {
-	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	...
-
-	pcie_phy: pcie-phy {
-		compatible = "rockchip,rk3399-pcie-phy";
-		#phy-cells = <0>;
-		clocks = <&cru SCLK_PCIEPHY_REF>;
-		clock-names = "refclk";
-		resets = <&cru SRST_PCIEPHY>;
-		reset-names = "phy";
-	};
-};
diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2f61c1b95fea..fc328c4a35e4 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -201,8 +201,8 @@ allOf:
 
         pcie-phy:
           type: object
-          description:
-            Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
+          $ref: /schemas/phy/rockchip,rk3399-pcie-phy.yaml#
+          unevaluatedProperties: false
 
       patternProperties:
         "^phy@[0-9a-f]+$":
@@ -326,6 +326,15 @@ examples:
         #phy-cells = <0>;
       };
 
+      pcie-phy {
+        compatible = "rockchip,rk3399-pcie-phy";
+        #phy-cells = <1>;
+        clocks = <&cru SCLK_PCIEPHY_REF>;
+        clock-names = "refclk";
+        resets = <&cru SRST_PCIEPHY>;
+        reset-names = "phy";
+      };
+
       phy@f780 {
         compatible = "rockchip,rk3399-emmc-phy";
         reg = <0xf780 0x20>;
-- 
2.47.2

