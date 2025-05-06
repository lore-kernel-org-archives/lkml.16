Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492530035E;
	Tue,  6 May 2025 02:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498177; cv=none; b=BmS2pLyIwDa2JtduM38DhopKe/bz/4i7nvi/tpooDUw2Cb9yUg0lqIlq/1PFk3PwJYVtafbU7WStDrqW0O29CD8GYqu3g9X3FLILCJvXdX27D/+yOIdUNvr96PJMXbUC9YemzfVP24MJP2p+kO75Qx4JyALpOO6RviX7r/n1sWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498177; c=relaxed/simple;
	bh=aoP2ZDlLU9aCNsNz+l0LQe1BO1K6JwycH+j/L5/ciHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVjDz+l20AjU5bqtXAAqgyTkX3zXMUQa4r9jm/8kJFn/iFSwsQxIgJtgy42A+XO1kYkSCRcMCYSKnq1RgTOtXus7Egxo0BVb+ZFb5btkOgS27ldz9RC31OozS5LwxzHplcbG3kpv+WIjbGcCb92wl5u57yiytdCsklKuMMOsomI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rt37BkPz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rt37BkPz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0F2C4CEF2;
	Tue,  6 May 2025 02:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498176;
	bh=aoP2ZDlLU9aCNsNz+l0LQe1BO1K6JwycH+j/L5/ciHY=;
	h=From:To:Cc:Subject:Date:From;
	b=rt37BkPzh/vhT767RQQyd33AB2l4d7809g4OYyPwGmOXR1ImPTEYSTV8dNLPYKUf2
	 Byy9ejG6WwgCTvJWSv3YTZX9OYdlI3/zUVkfnbmdD00ACGYDEAEGmFASsDl/GB1wqi
	 D/wNeLd6xHHv9quqruKlZEdHgYV9J3iBAOhpeLOWHpc6QcrFillsTqMlKwcYoh8MUW
	 eeEcFGoYyPDoZ1YTCxdngTjocdUYiVXbC9Vv2cWkpmahWDE8fYQ8JA+lN3r/vPgWlx
	 D4qX6HlvzDLxwpECC2GlOaxVR68gjD1MbCq8zp66+nzfG/21mCbHtlH4hkBMmf1Zhg
	 MBCpX+HkMXdaA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rich Felker <dalias@libc.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert jcore,pit to DT schema
Date: Mon,  5 May 2025 21:22:52 -0500
Message-ID: <20250506022253.2587999-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the J-Core PIT Timer binding to DT schema format. It's a
straight-forward conversion.

Since the 'reg' entries are based on number of cores, we can't put
constraints on it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/timer/jcore,pit.txt   | 24 -----------
 .../devicetree/bindings/timer/jcore,pit.yaml  | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/jcore,pit.txt
 create mode 100644 Documentation/devicetree/bindings/timer/jcore,pit.yaml

diff --git a/Documentation/devicetree/bindings/timer/jcore,pit.txt b/Documentation/devicetree/bindings/timer/jcore,pit.txt
deleted file mode 100644
index af5dd35469d7..000000000000
--- a/Documentation/devicetree/bindings/timer/jcore,pit.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-J-Core Programmable Interval Timer and Clocksource
-
-Required properties:
-
-- compatible: Must be "jcore,pit".
-
-- reg: Memory region(s) for timer/clocksource registers. For SMP,
-  there should be one region per cpu, indexed by the sequential,
-  zero-based hardware cpu number.
-
-- interrupts: An interrupt to assign for the timer. The actual pit
-  core is integrated with the aic and allows the timer interrupt
-  assignment to be programmed by software, but this property is
-  required in order to reserve an interrupt number that doesn't
-  conflict with other devices.
-
-
-Example:
-
-timer@200 {
-	compatible = "jcore,pit";
-	reg = < 0x200 0x30 0x500 0x30 >;
-	interrupts = < 0x48 >;
-};
diff --git a/Documentation/devicetree/bindings/timer/jcore,pit.yaml b/Documentation/devicetree/bindings/timer/jcore,pit.yaml
new file mode 100644
index 000000000000..9e6e25b75293
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/jcore,pit.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/jcore,pit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: J-Core Programmable Interval Timer and Clocksource
+
+maintainers:
+  - Rich Felker <dalias@libc.org>
+
+properties:
+  compatible:
+    const: jcore,pit
+
+  reg:
+    description:
+      Memory region(s) for timer/clocksource registers. For SMP, there should be
+      one region per cpu, indexed by the sequential, zero-based hardware cpu
+      number.
+
+  interrupts:
+    description:
+      An interrupt to assign for the timer. The actual pit core is integrated
+      with the aic and allows the timer interrupt assignment to be programmed by
+      software, but this property is required in order to reserve an interrupt
+      number that doesn't conflict with other devices.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@200 {
+        compatible = "jcore,pit";
+        reg = <0x200 0x30 0x500 0x30>;
+        interrupts = <0x48>;
+    };
-- 
2.47.2

