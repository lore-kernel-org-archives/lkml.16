Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91A338BF6;
	Tue,  6 May 2025 02:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498189; cv=none; b=P6QXc/mkGIheH6S3Y5NjCvT6Ri7iIjAdtT0qOJZPqCbPeEjgmLtLGATRidXbPIbQ0XOPq0CMu4UkCrLzaR56G1dmADI0yLKC4h8fMnQ7kswgieNR7twh7MHgDadasP+s0U0+egoW+8GTv9m1mta+KsQoMgd5Uys9Y31SSbMclfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498189; c=relaxed/simple;
	bh=p2VThZz1v3Wx04Mvu/n4pyFuxEQ0Dv1zbwer2XSOSdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bqq6YUgBdBxYtrotQ3i57T3SFVY37Mp131DT5MS97cYK4W6OWrsSNZFHG8F20ORsyXXSAnGxpFetgU8RH6qLDC81Nk3j5rOpq1TMxOjny8/4pw/U9+i2tcvbjr3bW+mxNmiyAyuZL4W52YuJg0LmnmWeDvoZGoKi3pG8MYLVfsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKTlvl04; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKTlvl04"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA586C4CEE4;
	Tue,  6 May 2025 02:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498188;
	bh=p2VThZz1v3Wx04Mvu/n4pyFuxEQ0Dv1zbwer2XSOSdU=;
	h=From:To:Cc:Subject:Date:From;
	b=TKTlvl044L6Ba8VS7jlAQs5V8j0zQLP+nMg/xIHNnQTrgeUjIEQho5+WZQNO/6Qfu
	 YqVlCdU7gDFyoRiTZTY8sL5vXa+SZnd79VYs6zt/S/5nAdJSQ6z25GF22Z/KWqiuLk
	 40uCyISmgcJtAVPQUvJrlB9NPjAfr1ZBZRrx2P00crINClH9mEyC4XzYzus6aCfx9+
	 synE1SKkyCbWwG1XcCBCdJ7V4flB/RNhj04URiF2w4ZNLV8gTV+ZPZA2LdMuB5MBJr
	 hJ5AWCQdfH33CK07wa7FgZDjc320gWojvw6LSLlatP7k5NC0D+IpdozQL/6qrR//p9
	 r2gfjLhwrCEPA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert marvell,orion-timer to DT schema
Date: Mon,  5 May 2025 21:23:04 -0500
Message-ID: <20250506022305.2588431-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Orion Timer binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/marvell,orion-timer.txt    | 16 -------
 .../bindings/timer/marvell,orion-timer.yaml   | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/marvell,orion-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/marvell,orion-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/marvell,orion-timer.txt b/Documentation/devicetree/bindings/timer/marvell,orion-timer.txt
deleted file mode 100644
index cd1a0c256f94..000000000000
--- a/Documentation/devicetree/bindings/timer/marvell,orion-timer.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Marvell Orion SoC timer
-
-Required properties:
-- compatible: shall be "marvell,orion-timer"
-- reg: base address of the timer register starting with TIMERS CONTROL register
-- interrupts: should contain the interrupts for Timer0 and Timer1
-- clocks: phandle of timer reference clock (tclk)
-
-Example:
-	timer: timer {
-		compatible = "marvell,orion-timer";
-		reg = <0x20300 0x20>;
-		interrupt-parent = <&bridge_intc>;
-		interrupts = <1>, <2>;
-		clocks = <&core_clk 0>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/marvell,orion-timer.yaml b/Documentation/devicetree/bindings/timer/marvell,orion-timer.yaml
new file mode 100644
index 000000000000..f973afffa5ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/marvell,orion-timer.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/marvell,orion-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Orion SoC timer
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    const: marvell,orion-timer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Timer0 interrupt
+      - description: Timer1 interrupt
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@20300 {
+        compatible = "marvell,orion-timer";
+        reg = <0x20300 0x20>;
+        interrupts = <1>, <2>;
+        clocks = <&core_clk 0>;
+    };
-- 
2.47.2

