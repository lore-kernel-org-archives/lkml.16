Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCBB2BCF6E;
	Wed, 21 May 2025 21:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747862327; cv=none; b=Kt3isa6Pg26xkPFH//FWpiU/Vdi6Z40PiYau+qrw73XVmer4zkgYUPoTy2Fj9Zi9wFdl6zyTla0BLr0Oz9q4JuWPHgztv36QoP/kbg9HJnmXkQKXVJ+W2cEv/5MNBdT9j2ZxyNx3QHFueBtCZuRFExBqkfyl6CUXLu3xZXjJ6ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747862327; c=relaxed/simple;
	bh=UCQYXa4FIW/7qRUCHzxu/FB3cWjftjkwb4tAf3/9W/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+tvkWNQNCM0F40GDQPVENNe/V4p0hQbs/AgUXAY/HOE9pKSq3ex4PX6oD834Bzt6sX/XorzfUaDVCyt50hMPGTGuyTndDaBd9TObMcCjcQAoLcl9+qg4gP9sZZhKFrok1/aC6oAjUspn/jDtB6kHtrJT4s0EIDAgrVUf+YRhvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMRwaIP4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMRwaIP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6FDC4CEE4;
	Wed, 21 May 2025 21:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747862326;
	bh=UCQYXa4FIW/7qRUCHzxu/FB3cWjftjkwb4tAf3/9W/M=;
	h=From:To:Cc:Subject:Date:From;
	b=NMRwaIP4E2b2IWdqBzhTMpZb0o0+SonpkmSp4wgfKdJei5jhRTpiqZl0k2Ykg3MJV
	 T3jzhhjWfnBuq3M12jfV/o0oqBB9uxRbw+8Yhl8nYuBhYJLTU95fvYMisZEy8n6o5o
	 h1Yp1yI2Su0if2KwLeRKlxk9tdPuJkJoF/kdReeptEKwEyuDakhY1USGXtbjmvAsMf
	 FRHW2ahoc4S33u6h8XvkTbdhRT1e3fSTilluRhHCijB3uw7CstGiuc57002WjMuSfk
	 Fl8KOD5YuBDKdQFMENhFRnTph7gXGmK3xQMmqoK2G/uXs29SyokJ6pQWeqnoURQksP
	 ah3FwROlXc5BQ==
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
Subject: [PATCH v2] dt-bindings: clock: Convert marvell,armada-370-corediv-clock to DT schema
Date: Wed, 21 May 2025 16:18:39 -0500
Message-ID: <20250521211840.77487-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Armada 3xx Core Divider clock binding to DT schema
format.

Add the missing "marvell,armada-390-corediv-clock" compatible and
"clock-output-names" property.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
- Fix indention (forgot to commit the fix)
---
 .../marvell,armada-370-corediv-clock.yaml     | 52 +++++++++++++++++++
 .../bindings/clock/mvebu-corediv-clock.txt    | 23 --------
 2 files changed, 52 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,armada-370-corediv-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/marvell,armada-370-corediv-clock.yaml b/Documentation/devicetree/bindings/clock/marvell,armada-370-corediv-clock.yaml
new file mode 100644
index 000000000000..9d766558cdb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,armada-370-corediv-clock.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/marvell,armada-370-corediv-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell MVEBU Core Divider Clock
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - marvell,armada-370-corediv-clock
+          - marvell,armada-375-corediv-clock
+          - marvell,armada-380-corediv-clock
+          - marvell,mv98dx3236-corediv-clock
+      - items:
+          - const: marvell,armada-390-corediv-clock
+          - const: marvell,armada-380-corediv-clock
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@18740 {
+        compatible = "marvell,armada-370-corediv-clock";
+        reg = <0x18740 0xc>;
+        #clock-cells = <1>;
+        clocks = <&pll>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt
deleted file mode 100644
index c7b4e3a6b2c6..000000000000
--- a/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* Core Divider Clock bindings for Marvell MVEBU SoCs
-
-The following is a list of provided IDs and clock names on Armada 370/XP:
- 0 = nand (NAND clock)
-
-Required properties:
-- compatible : must be "marvell,armada-370-corediv-clock",
-		       "marvell,armada-375-corediv-clock",
-		       "marvell,armada-380-corediv-clock",
-                       "marvell,mv98dx3236-corediv-clock",
-
-- reg : must be the register address of Core Divider control register
-- #clock-cells : from common clock binding; shall be set to 1
-- clocks : must be set to the parent's phandle
-
-Example:
-
-corediv_clk: corediv-clocks@18740 {
-	compatible = "marvell,armada-370-corediv-clock";
-	reg = <0x18740 0xc>;
-	#clock-cells = <1>;
-	clocks = <&pll>;
-};
-- 
2.47.2

