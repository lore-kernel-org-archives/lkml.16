Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B700221FA0;
	Sat,  7 Jun 2025 21:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331596; cv=none; b=nKlQs00aLnl9fia7tGnM8s8hTnv12zHjKOkdVtdjezgNrONHjP0pqh4NNi3+Ykl7IDbqcKq3Xo/JSOnOYbbpf6HsbT0FVp5975a1gBdJcIgJDYOnPPYF4h7OtdHcTKMbFpZ4W1ZPaLMK164VCmGSkzXxlqC3arGteAWZGlXgSXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331596; c=relaxed/simple;
	bh=8fCLr76Iztc6QlT6QEUsCfdY22i6jx3Cf8kHklqZmp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b22QVknPpJspNlS+TZLSnQUCXPOy/f4OoeaKkXD1fo6MFqiOPBNBmJJDzqwaw20rVCVgAjZZ89dUqnpAuorj1OVMAhRAVP9NpTmLDfKdWfuniditBBK4/RffPVtDTrSBrPYKPN5VFdkdQ7bKdw4aQU52A2KSaMIHprpWHlXK5po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpQQeK7p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpQQeK7p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53250C4CEE4;
	Sat,  7 Jun 2025 21:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331596;
	bh=8fCLr76Iztc6QlT6QEUsCfdY22i6jx3Cf8kHklqZmp8=;
	h=From:To:Cc:Subject:Date:From;
	b=gpQQeK7p68QN6/Xx0Eo4Y6fIA1/AODd2tg1HYI4hr8rkrlGynCe+7elJipRiu8rrl
	 /8lVRsCQsIp4sCiCvT0RcDODV8HWaZJA9lzDoeWSH3PgK9odqCyMPRpvYn4lNvoGqg
	 9AkwV9WRyXcSZBi73Gk3thLFf5ueUobHAjDL8H2bY5EXTv04oS838YmKxh+JvG0yoX
	 4thCKl5rKW0JlQw4JVstfVt5RRPdvT4axYTJQFcbKo2wOwyWfh0otRYAqcP1lLQwCf
	 v6qIB4ulmY4yoCi6SFQFHVywxz9MWNg+frH0bkUmIJoMiAvgn851Lmlw3ayQuTRrhT
	 K0NJGub4FdWpA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert ti,dm816x-usb-phy to DT schema
Date: Sat,  7 Jun 2025 16:26:33 -0500
Message-ID: <20250607212634.744373-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI DM816x USB PHY binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/phy/dm816x-phy.txt    | 24 --------
 .../bindings/phy/ti,dm8168-usb-phy.yaml       | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/dm816x-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/ti,dm8168-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/dm816x-phy.txt b/Documentation/devicetree/bindings/phy/dm816x-phy.txt
deleted file mode 100644
index 2fe3d11d063d..000000000000
--- a/Documentation/devicetree/bindings/phy/dm816x-phy.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Device tree binding documentation for am816x USB PHY
-=========================
-
-Required properties:
-- compatible : should be "ti,dm816x-usb-phy"
-- reg : offset and length of the PHY register set.
-- reg-names : name for the phy registers
-- clocks : phandle to the clock
-- clock-names : name of the clock
-- syscon: phandle for the syscon node to access misc registers
-- #phy-cells : from the generic PHY bindings, must be 1
-- syscon: phandle for the syscon node to access misc registers
-
-Example:
-
-usb_phy0: usb-phy@20 {
-	compatible = "ti,dm8168-usb-phy";
-	reg = <0x20 0x8>;
-	reg-names = "phy";
-	clocks = <&main_fapll 6>;
-	clock-names = "refclk";
-	#phy-cells = <0>;
-	syscon = <&scm_conf>;
-};
diff --git a/Documentation/devicetree/bindings/phy/ti,dm8168-usb-phy.yaml b/Documentation/devicetree/bindings/phy/ti,dm8168-usb-phy.yaml
new file mode 100644
index 000000000000..673dc1d37dcb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti,dm8168-usb-phy.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/ti,dm8168-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DM8168 USB PHY
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+properties:
+  compatible:
+    const: ti,dm8168-usb-phy
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: phy
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: refclk
+
+  '#phy-cells':
+    const: 0
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle for the syscon node to access misc registers.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - '#phy-cells'
+  - syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@20 {
+        compatible = "ti,dm8168-usb-phy";
+        reg = <0x20 0x8>;
+        reg-names = "phy";
+        clocks = <&main_fapll 6>;
+        clock-names = "refclk";
+        #phy-cells = <0>;
+        syscon = <&scm_conf>;
+    };
-- 
2.47.2

