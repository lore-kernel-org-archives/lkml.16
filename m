Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB91E2BD030;
	Wed, 21 May 2025 21:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861710; cv=none; b=HRwgctBPCmvi7exIeRN5wcyxEXtWAxs0u9QiZPK7fXqquAYFvvFgFuaXxxrDe/TQ2sNVa1X5w7CIsrrwHxYE2jmcoM3NihMUkpi57bD4UcqCobJPxN+BV/JfZTYPsqh5xWKDvbbLm607bjri+PzkEQeOFtV6ytZlTEewR0fyj8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861710; c=relaxed/simple;
	bh=fQhYw0966S0302arpySZCQPOLVNCSWD9cdGSplTk/dE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gKXfOP9wVwNZruBNP+J0I45BSGa65iUOm9Tg4vvdx/suz3G7ZGOTKet8BCKwW0fSnACRj03M9ytgQVVqLTlR7oURrEIm6O5gRr2DkUhN/Cz6aBuUKqMHPBlu1KhSXA9z3Bv2575COrGtbYPqXYfJjY0crQrwABviggpQjE/Ua6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWWugTvs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWWugTvs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474F3C4CEE4;
	Wed, 21 May 2025 21:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747861709;
	bh=fQhYw0966S0302arpySZCQPOLVNCSWD9cdGSplTk/dE=;
	h=From:To:Cc:Subject:Date:From;
	b=UWWugTvsXIFsc7b7U1F2aEtGQjQ1kFgdw2dxf9dbNmnNBU7nmaaBSmOp+NrTx3EX0
	 pCp8SCjwPwPYjSkbPGD8wbeVBxdCJRcQsPeKitc85dgdCDS79Duh7sJNFwX/Heozsh
	 gaA6kIVDgBJcAnrBkgcgJ0kvxswQgbtgXkwCy/HaRrp1mWaz9FudEU8qof046eVs/S
	 uLZen68zXNFyQDFJVnFXCUo4RURDF0sDvFUpywCDk3bstAbNcHOS2EUSCgGFfProBl
	 z8FGx5gOXsEZdnFX8BL7iY1fQ1P1qzuxp21GwPASqQ2XU1n5jPGOUtC/yXNAN0YNTa
	 8ItdOyQOg4jow==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert marvell,armada-3700-tbg-clock to DT schema
Date: Wed, 21 May 2025 16:08:25 -0500
Message-ID: <20250521210826.61957-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Armada 3700 TBG clock binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/armada3700-tbg-clock.txt   | 27 ----------
 .../clock/marvell,armada-3700-tbg-clock.yaml  | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,armada-3700-tbg-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
deleted file mode 100644
index ed1df32c577a..000000000000
--- a/Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Time Base Generator Clock bindings for Marvell Armada 37xx SoCs
-
-Marvell Armada 37xx SoCs provide Time Base Generator clocks which are
-used as parent clocks for the peripheral clocks.
-
-The TBG clock consumer should specify the desired clock by having the
-clock ID in its "clocks" phandle cell.
-
-The following is a list of provided IDs and clock names on Armada 3700:
- 0 = TBG A P
- 1 = TBG B P
- 2 = TBG A S
- 3 = TBG B S
-
-Required properties:
-- compatible : shall be "marvell,armada-3700-tbg-clock"
-- reg : must be the register address of North Bridge PLL register
-- #clock-cells : from common clock binding; shall be set to 1
-
-Example:
-
-tbg: tbg@13200 {
-	compatible = "marvell,armada-3700-tbg-clock";
-	reg = <0x13200 0x1000>;
-	clocks = <&xtalclk>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/marvell,armada-3700-tbg-clock.yaml b/Documentation/devicetree/bindings/clock/marvell,armada-3700-tbg-clock.yaml
new file mode 100644
index 000000000000..7fd1d758f794
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,armada-3700-tbg-clock.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/marvell,armada-3700-tbg-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 3700 Time Base Generator Clock
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+description: >
+  Marvell Armada 37xx SoCs provide Time Base Generator clocks which are used as
+  parent clocks for the peripheral clocks.
+
+  The TBG clock consumer should specify the desired clock by having the clock ID
+  in its "clocks" phandle cell.
+
+  The following is a list of provided IDs and clock names on Armada 3700:
+
+    0 = TBG A P
+    1 = TBG B P
+    2 = TBG A S
+    3 = TBG B S
+
+properties:
+  compatible:
+    const: marvell,armada-3700-tbg-clock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@13200 {
+        compatible = "marvell,armada-3700-tbg-clock";
+        reg = <0x13200 0x1000>;
+        clocks = <&xtalclk>;
+        #clock-cells = <1>;
+    };
-- 
2.47.2

