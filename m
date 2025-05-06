Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0FC336B6F;
	Tue,  6 May 2025 02:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498167; cv=none; b=rex4+o6Moagw+AySRxKHmmU1ajbvUKW2yCNK6VXtDOZfVU+IpDbxYdGTSSPB99YaQpBuuBgd6P45K+fP64MknLhscWdqmtsjWEeBfIXqdAuTbdQMqo7RLKo3x0tsw2U1l5z9aCDNfTdyrRmlXvrwNrTKhzP1uL6FgykNjIZebNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498167; c=relaxed/simple;
	bh=YtU3XhtrGdmElcr5Xcinm5PmM5Cdi+2rz477+giBWBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AmEkYdeyaC/YdjVmdRCTZhlastvWTwPotog9kxdsKaaW6StrP0WwdBwgKfFqRS6iswH+B2g6ULIPse+n1nnZTy50PQOZgrN1sNHWnh3mlyLjdTKMBH7dcsCw1Ju60QzDMPZ7vSIZ610qZs924wsB45CdMwAFlr74sko00/W4Vm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZ0iIMLx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZ0iIMLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E30C4CEE4;
	Tue,  6 May 2025 02:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498167;
	bh=YtU3XhtrGdmElcr5Xcinm5PmM5Cdi+2rz477+giBWBk=;
	h=From:To:Cc:Subject:Date:From;
	b=QZ0iIMLxwv4A5naKrIqerjqtlib7aHiGzl3zD5ojpJQlThm9ZpvvMhY5eoo6bsIOt
	 JjwDju2PEFHRqY9gHy0sWajHkDMhR4mGVjwJL5lKH7BiIVy1xbkWuMwgvzOnZ6dCNq
	 EQHHXJqGvkobVIoC7HsX06uPUe4fjEPsrjdB+eY5xHSq8eJftxrPBvarAqezSJzXFW
	 0sMX+aFdkaRwFRfmaDOYuygohWlLNmtLZvAp0QDYgUkNjHnbkTQLMJRjhhS00Ny9+0
	 HOaig3EU+A7SoGvgFr895b0s/VE/MKri+D63DAYW4ZohPU3Zb+MUUSegHrVyF2gFNS
	 /TFGOiJ/3YNFg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert fsl,gtm to DT schema
Date: Mon,  5 May 2025 21:22:43 -0500
Message-ID: <20250506022245.2587662-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Freescale General Purpose Timer binding to DT schema format.
Add the specific compatibles in use. Drop the "fsl,cpm2-gtm" compatible
which is not used. The examples are all similar, so just leave 1
example.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/timer/fsl,gtm.txt     | 30 ----------
 .../devicetree/bindings/timer/fsl,gtm.yaml    | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/fsl,gtm.txt
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,gtm.yaml

diff --git a/Documentation/devicetree/bindings/timer/fsl,gtm.txt b/Documentation/devicetree/bindings/timer/fsl,gtm.txt
deleted file mode 100644
index fc1c571f7412..000000000000
--- a/Documentation/devicetree/bindings/timer/fsl,gtm.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* Freescale General-purpose Timers Module
-
-Required properties:
-  - compatible : should be
-    "fsl,<chip>-gtm", "fsl,gtm" for SOC GTMs
-    "fsl,<chip>-qe-gtm", "fsl,qe-gtm", "fsl,gtm" for QE GTMs
-    "fsl,<chip>-cpm2-gtm", "fsl,cpm2-gtm", "fsl,gtm" for CPM2 GTMs
-  - reg : should contain gtm registers location and length (0x40).
-  - interrupts : should contain four interrupts.
-  - clock-frequency : specifies the frequency driving the timer.
-
-Example:
-
-timer@500 {
-	compatible = "fsl,mpc8360-gtm", "fsl,gtm";
-	reg = <0x500 0x40>;
-	interrupts = <90 8 78 8 84 8 72 8>;
-	interrupt-parent = <&ipic>;
-	/* filled by u-boot */
-	clock-frequency = <0>;
-};
-
-timer@440 {
-	compatible = "fsl,mpc8360-qe-gtm", "fsl,qe-gtm", "fsl,gtm";
-	reg = <0x440 0x40>;
-	interrupts = <12 13 14 15>;
-	interrupt-parent = <&qeic>;
-	/* filled by u-boot */
-	clock-frequency = <0>;
-};
diff --git a/Documentation/devicetree/bindings/timer/fsl,gtm.yaml b/Documentation/devicetree/bindings/timer/fsl,gtm.yaml
new file mode 100644
index 000000000000..31d8534ac868
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/fsl,gtm.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/fsl,gtm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale General-purpose Timers Module
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,mpc8308-gtm
+              - fsl,mpc8313-gtm
+              - fsl,mpc8315-gtm
+          - const: fsl,gtm
+      - items:
+          - enum:
+              - fsl,mpc8569-qe-gtm
+              - fsl,mpc8360-qe-gtm
+          - const: fsl,qe-gtm
+          - const: fsl,gtm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+    description:
+      One interrupt for each timer
+
+  clock-frequency:
+    description: Specifies the frequency driving the timer.
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@440 {
+        compatible = "fsl,mpc8360-qe-gtm", "fsl,qe-gtm", "fsl,gtm";
+        reg = <0x440 0x40>;
+        interrupts = <12>, <13>, <14>, <15>;
+        clock-frequency = <0>;
+    };
-- 
2.47.2

