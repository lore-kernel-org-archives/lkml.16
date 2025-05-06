Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C88A3365E9;
	Tue,  6 May 2025 02:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498162; cv=none; b=Vdj7yZwROgvWcR48MBbRC4nJgmCiNRrC14PC2EG495j/67vkhdBTMUCpogNtXR+bmjrU3NDjDlxsXJ0JzKcRPYwXUwI4udR8kE1A8J2eI8a9qsTjcU9GqMz1h1AmRopS/cES7vR/6QIi1H6vaSACOMDVHBIVJS0SssgcbVNAZsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498162; c=relaxed/simple;
	bh=s8mhfLhCGAtF0bguEvGQoujlaMzsaSBRGrkTBQxcYzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m1uhysxgm8VVxYQo9vGzQqaLh5+Jc38M20YQcEYFQk57z2p4eJeP2Le/rqEQqOKc2UIdAayLxWJRy0BckQW6qES9XFAsAgTxsOJILWO7tvw6dg9Sra8p2yEA049L4ELm9eQOgz5Jx5vLqC+wD10BGSrasqCz+KMyhRrSghF+Kk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXXwZyQ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXXwZyQ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C59C4CEE4;
	Tue,  6 May 2025 02:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498159;
	bh=s8mhfLhCGAtF0bguEvGQoujlaMzsaSBRGrkTBQxcYzM=;
	h=From:To:Cc:Subject:Date:From;
	b=aXXwZyQ/th0UCAFKK6yzRASnv9wK9gwMuwohX6tOq0m8bchsYzqN8ZXZR1KlZnTND
	 02Q6jlKLz3XUGyo2Eq33Kj+4zSphf4srHXbYaiVr0CXw0BtNXWvYy0yjlm2ERU4sc4
	 iBGrA46+p9zWiZTn4JYLx15NPQHz3NQGyLRS8JDr68VR+MFhj2URVNQ0NR0z/sgp2u
	 BCdXyMnE1KCMJWqU0Pbqavh3FIN1ssID0JlE1HNLr90SFa+mx1SxQfbGU4lM7lC4Ax
	 VEqTHJweUeq5pASmfiKXXiEzUc77v5InrzzW1RB7KDVF6W4aZrlEdEXUzCMjmDKOfi
	 0Wvb7Ioarqvhw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Noam Camus <noamca@mellanox.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert ezchip,nps400-timer to DT schema
Date: Mon,  5 May 2025 21:22:35 -0500
Message-ID: <20250506022237.2587355-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the EZChip NPS400 Timer bindings to DT schema format. It's a
straight-forward conversion. The 2 bindings only differ in compatible
and one required property, so the schemas can be combined.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/ezchip,nps400-timer.yaml   | 45 +++++++++++++++++++
 .../bindings/timer/ezchip,nps400-timer0.txt   | 17 -------
 .../bindings/timer/ezchip,nps400-timer1.txt   | 15 -------
 3 files changed, 45 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
 delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt

diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.yaml b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.yaml
new file mode 100644
index 000000000000..317c5010c4c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ezchip,nps400-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EZChip NPS400 Timers
+
+maintainers:
+  - Noam Camus <noamca@mellanox.com>
+
+properties:
+  compatible:
+    enum:
+      - ezchip,nps400-timer0
+      - ezchip,nps400-timer1
+
+  interrupts:
+    maxItems: 1
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ezchip,nps400-timer0
+    then:
+      required: [ interrupts ]
+
+examples:
+  - |
+    timer {
+        compatible = "ezchip,nps400-timer0";
+        interrupts = <3>;
+        clocks = <&sysclk>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
deleted file mode 100644
index e3cfce8fecc5..000000000000
--- a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-NPS Network Processor
-
-Required properties:
-
-- compatible :	should be "ezchip,nps400-timer0"
-
-Clocks required for compatible = "ezchip,nps400-timer0":
-- interrupts : The interrupt of the first timer
-- clocks : Must contain a single entry describing the clock input
-
-Example:
-
-timer {
-	compatible = "ezchip,nps400-timer0";
-	interrupts = <3>;
-	clocks = <&sysclk>;
-};
diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
deleted file mode 100644
index c0ab4190b8fb..000000000000
--- a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-NPS Network Processor
-
-Required properties:
-
-- compatible :	should be "ezchip,nps400-timer1"
-
-Clocks required for compatible = "ezchip,nps400-timer1":
-- clocks : Must contain a single entry describing the clock input
-
-Example:
-
-timer {
-	compatible = "ezchip,nps400-timer1";
-	clocks = <&sysclk>;
-};
-- 
2.47.2

