Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A138B332EDA;
	Tue,  6 May 2025 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498152; cv=none; b=pUS/UfhSp8aBhrzpqx3qRT1MHfIpYKwtKBvBO6/5QdBvxKqw18Fy9g0n2qHwEqzrZlyMB7OKBwS8dVKJcW1nB72lDRd+OyYK2+/XN8N0gS30oVMQf6aU0aRNyE7WluktmuQEWqd95XTgK2iXIuJx6xUJhh9iWsFj1KMh9miiQT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498152; c=relaxed/simple;
	bh=TXg77fIcMszeWDgtEPPpFgS7yt4IHhAZAxH2auE6e2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GY7yjqDz50rKpPPk3WRQHNBun+osIlJG1666KW/3IMGtktcUwOuCgXtWBUdzPGKNktQR8tMuvBOaFFMaMo0nHZar2VlBUFLA4lO+QiF5KeBS2l1XcDtTq5wyKOHwduz11BKWi57Q1jEnGjQpOX8Z/UygQnp92OWqPLnv6hPcT4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQoO6tMo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQoO6tMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE190C4CEE4;
	Tue,  6 May 2025 02:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498151;
	bh=TXg77fIcMszeWDgtEPPpFgS7yt4IHhAZAxH2auE6e2o=;
	h=From:To:Cc:Subject:Date:From;
	b=iQoO6tMooFiAZDEiGjY3eZm0f6ND04tPzi8f1IDuWajXlxE3biUqCUwYpm83oERYa
	 Mjggjca7RuuT/+1hPqFRyUVuCQri5x6ZvjtbYoFQuZeBDmviB8xHgo/jIESZgzjOHN
	 ru25CUdI1pukBv1SjbpTpkbhwW5/HLecmH8TVB4EvDcyi0uG0N0ZFNJucPKKNx6GHN
	 u+SK8Bsmj0PpGJ6cqWnJaBIacB/9st7i5htByItFKdDUDwOgCROA/zFR++Txbc1h5V
	 jJxfU/CX8WXn8V88NolVLYLkDtLXlpcBBl2Gl1Lg7ZqJ6ziRcWRW9EamvT5qdQ8UFG
	 no1c7xYdTGCuA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Flavio Suligoi <f.suligoi@asem.it>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert csky,mptimer to DT schema
Date: Mon,  5 May 2025 21:22:27 -0500
Message-ID: <20250506022228.2587029-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the C-SKY Multi-processor timer binding to DT schema format.
It's a straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/csky,mptimer.txt           | 42 -----------------
 .../bindings/timer/csky,mptimer.yaml          | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.yaml

diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.txt b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
deleted file mode 100644
index f5c7e99cf52b..000000000000
--- a/Documentation/devicetree/bindings/timer/csky,mptimer.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-============================
-C-SKY Multi-processors Timer
-============================
-
-C-SKY multi-processors timer is designed for C-SKY SMP system and the
-regs is accessed by cpu co-processor 4 registers with mtcr/mfcr.
-
- - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
- - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
- - PTIM_CCVR "cr<3, 14>" Current counter value reg.
- - PTIM_LVR  "cr<6, 14>" Window value reg to trigger next event.
-
-==============================
-timer node bindings definition
-==============================
-
-	Description: Describes SMP timer
-
-	PROPERTIES
-
-	- compatible
-		Usage: required
-		Value type: <string>
-		Definition: must be "csky,mptimer"
-	- clocks
-		Usage: required
-		Value type: <node>
-		Definition: must be input clk node
-	- interrupts
-		Usage: required
-		Value type: <u32>
-		Definition: must be timer irq num defined by soc
-
-Examples:
----------
-
-	timer: timer {
-		compatible = "csky,mptimer";
-		clocks = <&dummy_apb_clk>;
-		interrupts = <16>;
-		interrupt-parent = <&intc>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.yaml b/Documentation/devicetree/bindings/timer/csky,mptimer.yaml
new file mode 100644
index 000000000000..12cc5282c8f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/csky,mptimer.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/csky,mptimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: C-SKY Multi-processors Timer
+
+maintainers:
+  - Flavio Suligoi <f.suligoi@asem.it>
+  - Guo Ren <guoren@kernel.org>
+
+description: |
+  C-SKY multi-processors timer is designed for C-SKY SMP system and the regs are
+  accessed by cpu co-processor 4 registers with mtcr/mfcr.
+
+   - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
+   - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
+   - PTIM_CCVR "cr<3, 14>" Current counter value reg.
+   - PTIM_LVR  "cr<6, 14>" Window value reg to trigger next event.
+
+properties:
+  compatible:
+    items:
+      - const: csky,mptimer
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer {
+        compatible = "csky,mptimer";
+        clocks = <&dummy_apb_clk>;
+        interrupts = <16>;
+    };
-- 
2.47.2

