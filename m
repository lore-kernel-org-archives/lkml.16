Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB180300A4E;
	Tue,  6 May 2025 02:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498201; cv=none; b=Yi/DsdQDZ1yPD/lECWsKF+HKAUzEL1zu0mOhGv+F9ceKbhUJtMf8R4g4yEcTnP2Vg7YKI8fjsXfhdTI03dSLghrcZyA4SZvMAUNjAX/68sE5At/3+oXHvA+LKDvX9uT4OGdHEagZKHUQfYeomHMBeS/Yrsf2zJrfFu4s5KIUJ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498201; c=relaxed/simple;
	bh=jk0DHEwxd86WBcsMopxHi4Wqm24UGl4mULUquxtWEMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nV0xSpICVyVwYj44a0mX42C0u4VLYtS3nhiSbwfwnhBDP8nRyC7vxtCj3ss4vmILmLifemK9W7qtv5dgErUlknKbatURDgoSs/4oV1VaC1vSC6iMKL6QwPxg+szN1Ajv6nqO8nPC4KhUFaj0VZc7APXCRdVkHs3vpGg15SVE5U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLCMxhr6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLCMxhr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAFFC4CEE4;
	Tue,  6 May 2025 02:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498200;
	bh=jk0DHEwxd86WBcsMopxHi4Wqm24UGl4mULUquxtWEMU=;
	h=From:To:Cc:Subject:Date:From;
	b=fLCMxhr6GytCC6WdxMiwqadlXUBa5P7RevT4aOrApVjDb2xOzAW9c6I8WXGQSZEIH
	 VDt2kqfOn2lVTRvaPzeHwmDul9RWszyDPDJyITs0WclGDmYiq4mrNoCSVG0e5RupoH
	 Cyr5vur8bM/q2qs+i6R+zZ2nnw5hbuH6/ZML+GQo6krvXsqVRTSCUNfsNmuwVSEKqE
	 38OYSRJpdDtYywSUsbjmrJflGjCXAdqleYpDSg5tdGgku+J6qZWzGVu2PJQjxxc+ik
	 rR+BM5+P3hwiwvj478J94sh2D9nBljV99H6SMtEQX1KqC9py18sxpmzRUsjYRurKti
	 PajQOsD0jQDqQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vineet Gupta <vgupta@synopsys.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert snps,arc-timer to DT schema
Date: Mon,  5 May 2025 21:23:16 -0500
Message-ID: <20250506022317.2589010-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Synopsys ARC Local Timer binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/snps,arc-timer.txt         | 27 -----------
 .../bindings/timer/snps,arc-timer.yaml        | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer.txt b/Documentation/devicetree/bindings/timer/snps,arc-timer.txt
deleted file mode 100644
index b02ab0af10ce..000000000000
--- a/Documentation/devicetree/bindings/timer/snps,arc-timer.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Synopsys ARC Local Timer with Interrupt Capabilities
-- Found on all ARC CPUs (ARC700/ARCHS)
-- Can be optionally programmed to interrupt on Limit
-- Two identical copies TIMER0 and TIMER1 exist in ARC cores and historically
-  TIMER0 used as clockevent provider (true for all ARC cores)
-  TIMER1 used for clocksource (mandatory for ARC700, optional for ARC HS)
-
-Required properties:
-
-- compatible : should be "snps,arc-timer"
-- interrupts : single Interrupt going into parent intc
-	       (16 for ARCHS cores, 3 for ARC700 cores)
-- clocks     : phandle to the source clock
-
-Example:
-
-	timer0 {
-		compatible = "snps,arc-timer";
-		interrupts = <3>;
-		interrupt-parent = <&core_intc>;
-		clocks = <&core_clk>;
-	};
-
-	timer1 {
-		compatible = "snps,arc-timer";
-		clocks = <&core_clk>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer.yaml b/Documentation/devicetree/bindings/timer/snps,arc-timer.yaml
new file mode 100644
index 000000000000..0d1e37db6f8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/snps,arc-timer.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/snps,arc-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys ARC Local Timer
+
+maintainers:
+  - Vineet Gupta <vgupta@synopsys.com>
+
+description: >
+  Synopsys ARC Local Timer with Interrupt Capabilities
+
+    - Found on all ARC CPUs (ARC700/ARCHS)
+    - Can be optionally programmed to interrupt on Limit
+    - Two identical copies TIMER0 and TIMER1 exist in ARC cores and historically
+      TIMER0 used as clockevent provider (true for all ARC cores)
+      TIMER1 used for clocksource (mandatory for ARC700, optional for ARC HS)
+
+properties:
+  compatible:
+    const: snps,arc-timer
+
+  interrupts:
+    maxItems: 1
+    description: A single timer interrupt going into the parent interrupt controller.
+      Use <16> for ARCHS cores, <3> for ARC700 cores.
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer0 {
+        compatible = "snps,arc-timer";
+        interrupts = <3>;
+        clocks = <&core_clk>;
+    };
-- 
2.47.2

