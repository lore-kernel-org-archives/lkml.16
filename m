Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572E31B0412;
	Mon, 14 Apr 2025 22:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744671263; cv=none; b=tiNYhX7NuJnNew6+eMblNUie5CjKDzq1vKFfefAAIZvjlZ6pdn8fLUqAjxHIA4w6t/tfSaPtH5H5BjSAoULevk+lG7Ua44VyopVxvWQFcSNRgJL4uNIX2gnl/ZPsldFuYwfCS4l67wwMddalZX/VVDYRPOKVqt3/8h0jiy5GOXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744671263; c=relaxed/simple;
	bh=ghPGn+DUPYc+Jh9QH/Xyzy1W+UjOc9wYqcXMeDG62fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xq+flI8LsA8lJbyLNt8fe6NbYNSh3QBHySf4nFD97aiMkGdnRiMOo0HTIdbhgo/dAuleNvgkQk6BmXlnnqjH7KrwdhPXDabCErthjTkCsc3WZb908WCZq2JTiK+eb7Xisy755/kr8sO/MKSjbCzPjAp5Cx7SxJb1sFPe1SFWxbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oM1Vx58j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oM1Vx58j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA22C4CEE2;
	Mon, 14 Apr 2025 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744671262;
	bh=ghPGn+DUPYc+Jh9QH/Xyzy1W+UjOc9wYqcXMeDG62fc=;
	h=From:To:Cc:Subject:Date:From;
	b=oM1Vx58jytipBJXdWNnXqHQgB+IyN8/IWkn7e7XxhtZ0cNBmkyRL0kqlCL0Oa0Rxf
	 YuZbA1sr3oYTR2Njig+Y6mXtjpbgz+u0WquK/pkdrsfpQpPdIPf29r7YPwtcEZnqos
	 cV9eD+XIlu/O/TeTmh/H1jndfWnQnyw2JyMB2TeEbhytmCKauDeHprNhWuMCY+dsql
	 FtAPHXhLhA0ISG3XN2sf1eidEp+rcvW4QxirSCllqDgDCDI/xPHKT8kk0i8xGWTHtS
	 1KyMqMBJ0K0Y6wMM9BlwxA2qp04E7j5outt1hz9cA1NqRlLySWCwe1r27stHG3gdYF
	 yi12Pu8rU9ZbA==
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
Subject: [PATCH] dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY to schema
Date: Mon, 14 Apr 2025 17:53:09 -0500
Message-ID: <20250414225311.1913480-1-robh@kernel.org>
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
 .../bindings/phy/rockchip-pcie-phy.txt        | 36 -------------------
 .../devicetree/bindings/soc/rockchip/grf.yaml | 13 +++++--
 2 files changed, 11 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt

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

