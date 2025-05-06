Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE22F6B33;
	Tue,  6 May 2025 02:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498173; cv=none; b=IPkxMWBprMRvMrH4xH4WEEIiPuCeYtXhpwfiow0D6fMP65K0uleM/9gBGx9JO2uG9j0K+9IvX8jlCHszWgAQbjKmx/wEXZwd1fJZf1lGrcxqi2WzI8y99kjaKPn8uDzfNfSyfGYfose8PKI2RDh4spPrGbsl+tpvxqB92Z8E87Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498173; c=relaxed/simple;
	bh=OVS58OrZMlpnGd1U59nNCwXNQd1FABRJ80V4eflMctI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s7AH9W6jFMh9xbhJtTMDIIoS9OTYkdvd70OLYFT7uxwpCa+mzzt7gJplRqy65mBJ0gtKxRI2oUJXLf8rN0EclWsVQgWK42TakmDQ6gA3GiNYhduFPDdnY0zAxSbQXCdFihoyX3jLNYmluPGvREHk3Jr3KZ5E9U20lNYQ7K6MpXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6G1mz5x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6G1mz5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB00C4CEE4;
	Tue,  6 May 2025 02:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498172;
	bh=OVS58OrZMlpnGd1U59nNCwXNQd1FABRJ80V4eflMctI=;
	h=From:To:Cc:Subject:Date:From;
	b=A6G1mz5xnknNExr1GswC1HdJWSkyYAXcnd9U4UGIlnD2RXJ6RKvBSbunoWGBL36TQ
	 GCVY2qcok7w7fiVxFyI+lkfMDQOM82v5uRmm3Z3Z9oYgQLRq9Atx5H6ySiKhcMmjuK
	 s28mH4MH1R1Jrd5dXMBIrf40ucMrru+SL1AdhqWnAzEg3P7zQ4Jsib4+KbOT43Safo
	 hCV4CQX2sxI3mj2IW0PZKxEw/uf5SA7kQE7JOOdiWRoSUF2Eg0TOcXP2YjH8aZ5Me7
	 RVIjmDJpBvygdbyhcBiv7ZkP+gsiWxqy85/E3FBCJxwbI4RP9iFvgod4ocHOCoyJx7
	 Ot7wwq6ntKTyw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert img,pistachio-gptimer to DT schema
Date: Mon,  5 May 2025 21:22:48 -0500
Message-ID: <20250506022249.2587839-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ImgTec Pistachio Timer binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/img,pistachio-gptimer.txt  | 28 --------
 .../bindings/timer/img,pistachio-gptimer.yaml | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/img,pistachio-gptimer.yaml

diff --git a/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt b/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt
deleted file mode 100644
index 7afce80bf6a0..000000000000
--- a/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Pistachio general-purpose timer based clocksource
-
-Required properties:
- - compatible: "img,pistachio-gptimer".
- - reg: Address range of the timer registers.
- - interrupts: An interrupt for each of the four timers
- - clocks: Should contain a clock specifier for each entry in clock-names
- - clock-names: Should contain the following entries:
-                "sys", interface clock
-                "slow", slow counter clock
-                "fast", fast counter clock
- - img,cr-periph: Must contain a phandle to the peripheral control
-		  syscon node.
-
-Example:
-	timer: timer@18102000 {
-		compatible = "img,pistachio-gptimer";
-		reg = <0x18102000 0x100>;
-		interrupts = <GIC_SHARED 60 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SHARED 61 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SHARED 62 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SHARED 63 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clk_periph PERIPH_CLK_COUNTER_FAST>,
-		         <&clk_periph PERIPH_CLK_COUNTER_SLOW>,
-			 <&cr_periph SYS_CLK_TIMER>;
-		clock-names = "fast", "slow", "sys";
-		img,cr-periph = <&cr_periph>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.yaml b/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.yaml
new file mode 100644
index 000000000000..a8654bcf68a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/img,pistachio-gptimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pistachio general-purpose timer
+
+maintainers:
+  - Ezequiel Garcia <ezequiel.garcia@imgtec.com>
+
+properties:
+  compatible:
+    const: img,pistachio-gptimer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Timer0 interrupt
+      - description: Timer1 interrupt
+      - description: Timer2 interrupt
+      - description: Timer3 interrupt
+
+  clocks:
+    items:
+      - description: Fast counter clock
+      - description: Slow counter clock
+      - description: Interface clock
+
+  clock-names:
+    items:
+      - const: fast
+      - const: slow
+      - const: sys
+
+  img,cr-periph:
+    description: Peripheral control syscon phandle
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - img,cr-periph
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/clock/pistachio-clk.h>
+
+    timer@18102000 {
+        compatible = "img,pistachio-gptimer";
+        reg = <0x18102000 0x100>;
+        interrupts = <GIC_SHARED 60 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 61 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 62 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 63 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk_periph PERIPH_CLK_COUNTER_FAST>,
+                 <&clk_periph PERIPH_CLK_COUNTER_SLOW>,
+                 <&cr_periph SYS_CLK_TIMER>;
+        clock-names = "fast", "slow", "sys";
+        img,cr-periph = <&cr_periph>;
+    };
-- 
2.47.2

