Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DD5265608;
	Mon,  5 May 2025 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456395; cv=none; b=JHCe2BiNk2UO+1IzcUovU58QQVl18IHX80LTuef/tdxepiOtbH/8j3SBnWd/DlJBg74qooSTxndJ/KQCGZlROVF8ejFrHaOv9KgNzH/rPCa2F4y9Ad0l4uDoqH46JSz+rMmgTFf/rg7GHjIskyM+B3KtymN+5l+1jBBzw6uaR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456395; c=relaxed/simple;
	bh=smp7EZxOCEiPNJ2rxRoq4mI+3WHMfSLdIkuatxvrfnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YBScXh5Ye/ubIaeMO/61zygSJQuRRFMz9s6smeYuuvnD//YRECDC1+6ZY3d3tvVoFAToVe0CVZtX8qZ4nHSDmmxQ72BPX7aDx/HXkrw/FM961ARq/9c7X2RUSql/BxrVTDz5cJ/kKQRRUHCPzbGm51OIEsmS5hb52zven84t0x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKcWyyts; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKcWyyts"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834E4C4CEE4;
	Mon,  5 May 2025 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456394;
	bh=smp7EZxOCEiPNJ2rxRoq4mI+3WHMfSLdIkuatxvrfnM=;
	h=From:To:Cc:Subject:Date:From;
	b=dKcWyytscoxod2xRi4PQHcXciwx4oQzH6nNPPl/sCO8CQjOHAddezh1S8P17JVq8a
	 3LjJ8Zvc7zcvt9XjkmjhaAZVZO3DXUuob9ozfXtUe0kNrVZUSPVp6r1McnW+dtksiS
	 l2Wj3aVeELl/ciW7tfZJ3UjeK4KARLZoAasacy+hny/mHXvPzE9/GJMSu4XdqVTjZ1
	 KAIYtpYIZj8Uqzy9KFJb9khcXyPsmVWw8XBtDe3rwA5uOJ1FXe7nF7b6fGmT2kpJXL
	 K2l7mOfbeHiugeLnXEGimpQhL5aaRiQmRHvbQ0y4Rz1DHy5hdEmry5HjeP8ZPPpTPP
	 3wUK7URsCsxSA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert cirrus,ep7209-intc to DT schema
Date: Mon,  5 May 2025 09:46:30 -0500
Message-ID: <20250505144631.1288086-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Cirrus EP7209 interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../cirrus,clps711x-intc.txt                  | 41 -----------
 .../cirrus,ep7209-intc.yaml                   | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/cirrus,clps711x-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cirrus,ep7209-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/cirrus,clps711x-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/cirrus,clps711x-intc.txt
deleted file mode 100644
index 969b4582ec60..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/cirrus,clps711x-intc.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Cirrus Logic CLPS711X Interrupt Controller
-
-Required properties:
-
-- compatible: Should be "cirrus,ep7209-intc".
-- reg: Specifies base physical address of the registers set.
-- interrupt-controller: Identifies the node as an interrupt controller.
-- #interrupt-cells: Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 1.
-
-The interrupt sources are as follows:
-ID	Name	Description
----------------------------
-1:	BLINT	Battery low (FIQ)
-3:	MCINT	Media changed (FIQ)
-4:	CSINT	CODEC sound
-5:	EINT1	External 1
-6:	EINT2	External 2
-7:	EINT3	External 3
-8:	TC1OI	TC1 under flow
-9:	TC2OI	TC2 under flow
-10:	RTCMI	RTC compare match
-11:	TINT	64Hz tick
-12:	UTXINT1	UART1 transmit FIFO half empty
-13:	URXINT1	UART1 receive FIFO half full
-14:	UMSINT	UART1 modem status changed
-15:	SSEOTI	SSI1 end of transfer
-16:	KBDINT	Keyboard
-17:	SS2RX	SSI2 receive FIFO half or greater full
-18:	SS2TX	SSI2 transmit FIFO less than half empty
-28:	UTXINT2	UART2 transmit FIFO half empty
-29:	URXINT2	UART2 receive FIFO half full
-32:	DAIINT	DAI interface (FIQ)
-
-Example:
-	intc: interrupt-controller {
-		compatible = "cirrus,ep7312-intc", "cirrus,ep7209-intc";
-		reg = <0x80000000 0x4000>;
-		interrupt-controller;
-		#interrupt-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/cirrus,ep7209-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/cirrus,ep7209-intc.yaml
new file mode 100644
index 000000000000..d3cc49d29e10
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cirrus,ep7209-intc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/cirrus,ep7209-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CLPS711X Interrupt Controller
+
+maintainers:
+  - Alexander Shiyan <shc_work@mail.ru>
+
+description: >
+  Cirrus Logic CLPS711X Interrupt Controller
+
+  The interrupt sources are as follows:
+    ID	Name	Description
+    ---------------------------
+    1:	BLINT	Battery low (FIQ)
+    3:	MCINT	Media changed (FIQ)
+    4:	CSINT	CODEC sound
+    5:	EINT1	External 1
+    6:	EINT2	External 2
+    7:	EINT3	External 3
+    8:	TC1OI	TC1 under flow
+    9:	TC2OI	TC2 under flow
+    10:	RTCMI	RTC compare match
+    11:	TINT	64Hz tick
+    12:	UTXINT1	UART1 transmit FIFO half empty
+    13:	URXINT1	UART1 receive FIFO half full
+    14:	UMSINT	UART1 modem status changed
+    15:	SSEOTI	SSI1 end of transfer
+    16:	KBDINT	Keyboard
+    17:	SS2RX	SSI2 receive FIFO half or greater full
+    18:	SS2TX	SSI2 transmit FIFO less than half empty
+    28:	UTXINT2	UART2 transmit FIFO half empty
+    29:	URXINT2	UART2 receive FIFO half full
+    32:	DAIINT	DAI interface (FIQ)
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: cirrus,ep7312-intc
+          - const: cirrus,ep7209-intc
+      - items:
+          - const: cirrus,ep7209-intc
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@80000000 {
+        compatible = "cirrus,ep7312-intc", "cirrus,ep7209-intc";
+        reg = <0x80000000 0x4000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
-- 
2.47.2

