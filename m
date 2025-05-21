Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E92BD02F;
	Wed, 21 May 2025 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861703; cv=none; b=GnV7x2WfG89lE+c6QuMzkVtJ+k/CQfrZotP8X+bx6uLE7smJ8VoTBz8Wn6JhNS6aLXuctm9vO89KtXT/HCP+6xoznpC4edIDCxXahz6nzC5ya51dqT1VEqnvxXAP6GfK9a9fzuWgJcKBpCRoTyauK49SEqmutX2PnHv891BJLMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861703; c=relaxed/simple;
	bh=bsepDjAFjjMpeSLvwHWeAxx3GACIKSBZWd+zCBN5z6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iMo4I1GDl0qHx9gSgrusTWBY8oipwJgb3hWGClMHlpLUBM7Svaj8LCY7nY/0OA/WaWJFrQY9NL8LDOVKDJ9K5oA5WoojUZ2loxpUyNi2+X7wxk2V5pd0jSY8r4enHwcHbAjKCEE5vh1Cd6MeoeqO7GfKqQHJnZH0D2fthJFEsXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJzNwVGH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJzNwVGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03616C4CEE4;
	Wed, 21 May 2025 21:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747861703;
	bh=bsepDjAFjjMpeSLvwHWeAxx3GACIKSBZWd+zCBN5z6s=;
	h=From:To:Cc:Subject:Date:From;
	b=CJzNwVGHQJMkcaaUUqZB8/Y6a6kHmsGkr+c3JcjuyIyQsXmEyTi+QB+X3pGa7mGs0
	 Hsg9ckEd/06EfYBkGqxTN/pq1oB7FMA017OdMuf6bkDV1dlDAYIbrCyj1sPXhidInF
	 ooyr+vz3PQfIPfZs92awnZxHdk26BKt5WQto8lWHhnyWCkrPGW1T7+a3qkFxEVCMCm
	 Yum5kt4awB6RC23IPFlYUZmH9ofbWOiTiungziLGmONv4KdW7SarMbNmeiwWuUjC/+
	 cZH+fQgwO0l+YuwdXyNXtuFkeSFyQnAJu2SAzJyxWy7ppG6cvhhqbe4YgOnJlFoo1i
	 PLoUJuV0C6UCg==
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
Subject: [PATCH] dt-bindings: clock: Convert marvell,armada-3700-periph-clock to DT schema
Date: Wed, 21 May 2025 16:08:18 -0500
Message-ID: <20250521210819.61718-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Armada 3700 peripheral clock binding to DT schema
format. The north bridge is also a "syscon", so add the compatible to
it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../clock/armada3700-periph-clock.txt         | 71 --------------
 .../marvell,armada-3700-periph-clock.yaml     | 96 +++++++++++++++++++
 2 files changed, 96 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,armada-3700-periph-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
deleted file mode 100644
index fbf58c443c04..000000000000
--- a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-* Peripheral Clock bindings for Marvell Armada 37xx SoCs
-
-Marvell Armada 37xx SoCs provide peripheral clocks which are
-used as clock source for the peripheral of the SoC.
-
-There are two different blocks associated to north bridge and south
-bridge.
-
-The peripheral clock consumer should specify the desired clock by
-having the clock ID in its "clocks" phandle cell.
-
-The following is a list of provided IDs for Armada 3700 North bridge clocks:
-ID	Clock name	Description
------------------------------------
-0	mmc		MMC controller
-1	sata_host	Sata Host
-2	sec_at		Security AT
-3	sac_dap		Security DAP
-4	tsecm		Security Engine
-5	setm_tmx	Serial Embedded Trace Module
-6	avs		Adaptive Voltage Scaling
-7	sqf		SPI
-8	pwm		PWM
-9	i2c_2		I2C 2
-10	i2c_1		I2C 1
-11	ddr_phy		DDR PHY
-12	ddr_fclk	DDR F clock
-13	trace		Trace
-14	counter		Counter
-15	eip97		EIP 97
-16	cpu		CPU
-
-The following is a list of provided IDs for Armada 3700 South bridge clocks:
-ID	Clock name	Description
------------------------------------
-0	gbe-50		50 MHz parent clock for Gigabit Ethernet
-1	gbe-core	parent clock for Gigabit Ethernet core
-2	gbe-125		125 MHz parent clock for Gigabit Ethernet
-3	gbe1-50		50 MHz clock for Gigabit Ethernet port 1
-4	gbe0-50		50 MHz clock for Gigabit Ethernet port 0
-5	gbe1-125	125 MHz clock for Gigabit Ethernet port 1
-6	gbe0-125	125 MHz clock for Gigabit Ethernet port 0
-7	gbe1-core	Gigabit Ethernet core port 1
-8	gbe0-core	Gigabit Ethernet core port 0
-9	gbe-bm		Gigabit Ethernet Buffer Manager
-10	sdio		SDIO
-11	usb32-sub2-sys	USB 2 clock
-12	usb32-ss-sys	USB 3 clock
-13	pcie		PCIe controller
-
-Required properties:
-
-- compatible : shall be "marvell,armada-3700-periph-clock-nb" for the
-  north bridge block, or
-  "marvell,armada-3700-periph-clock-sb" for the south bridge block
-- reg : must be the register address of North/South Bridge Clock register
-- #clock-cells : from common clock binding; shall be set to 1
-
-- clocks : list of the parent clock phandle in the following order:
-  TBG-A P, TBG-B P, TBG-A S, TBG-B S and finally the xtal clock.
-
-
-Example:
-
-nb_perih_clk: nb-periph-clk@13000{
-	compatible = "marvell,armada-3700-periph-clock-nb";
-	reg = <0x13000 0x1000>;
-	clocks = <&tbg 0>, <&tbg 1>, <&tbg 2>,
-	<&tbg 3>, <&xtalclk>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/marvell,armada-3700-periph-clock.yaml b/Documentation/devicetree/bindings/clock/marvell,armada-3700-periph-clock.yaml
new file mode 100644
index 000000000000..7f13abb75b22
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,armada-3700-periph-clock.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 37xx SoCs Peripheral Clocks
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+description: >
+  Marvell Armada 37xx SoCs provide peripheral clocks which are used as clock
+  source for the peripheral of the SoC.
+
+  There are two different blocks associated to north bridge and south bridge.
+
+  The following is a list of provided IDs for Armada 3700 North bridge clocks:
+
+    ID	Clock name	Description
+    -----------------------------------
+    0	mmc		MMC controller
+    1	sata_host	Sata Host
+    2	sec_at		Security AT
+    3	sac_dap		Security DAP
+    4	tsecm		Security Engine
+    5	setm_tmx	Serial Embedded Trace Module
+    6	avs		Adaptive Voltage Scaling
+    7	sqf		SPI
+    8	pwm		PWM
+    9	i2c_2		I2C 2
+    10	i2c_1		I2C 1
+    11	ddr_phy		DDR PHY
+    12	ddr_fclk	DDR F clock
+    13	trace		Trace
+    14	counter		Counter
+    15	eip97		EIP 97
+    16	cpu		CPU
+
+  The following is a list of provided IDs for Armada 3700 South bridge clocks:
+
+    ID	Clock name	Description
+    -----------------------------------
+    0	gbe-50		50 MHz parent clock for Gigabit Ethernet
+    1	gbe-core	parent clock for Gigabit Ethernet core
+    2	gbe-125		125 MHz parent clock for Gigabit Ethernet
+    3	gbe1-50		50 MHz clock for Gigabit Ethernet port 1
+    4	gbe0-50		50 MHz clock for Gigabit Ethernet port 0
+    5	gbe1-125	125 MHz clock for Gigabit Ethernet port 1
+    6	gbe0-125	125 MHz clock for Gigabit Ethernet port 0
+    7	gbe1-core	Gigabit Ethernet core port 1
+    8	gbe0-core	Gigabit Ethernet core port 0
+    9	gbe-bm		Gigabit Ethernet Buffer Manager
+    10	sdio		SDIO
+    11	usb32-sub2-sys	USB 2 clock
+    12	usb32-ss-sys	USB 3 clock
+    13	pcie		PCIe controller
+
+properties:
+  compatible:
+    oneOf:
+      - const: marvell,armada-3700-periph-clock-sb
+    items:
+      - const: marvell,armada-3700-periph-clock-nb
+      - const: syscon
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: TBG-A P clock and specifier
+      - description: TBG-B P clock and specifier
+      - description: TBG-A S clock and specifier
+      - description: TBG-B S clock and specifier
+      - description: Xtal clock and specifier
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@13000{
+        compatible = "marvell,armada-3700-periph-clock-sb";
+        reg = <0x13000 0x1000>;
+        clocks = <&tbg 0>, <&tbg 1>, <&tbg 2>, <&tbg 3>, <&xtalclk>;
+        #clock-cells = <1>;
+    };
-- 
2.47.2

