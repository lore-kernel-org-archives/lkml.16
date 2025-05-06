Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0C4300A3D;
	Tue,  6 May 2025 02:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498192; cv=none; b=ZWl5IdJiqSJViizJIYo7GBDosYLANJZu8KDcI+5EIQC0AurneVb6uRoyatdj/PEZTPF5bP/UetWzgwpo+vQh+2j7/y5igll03HksdkS+P5dxkXiMkYeCiL+TCTA34mR4mmy9YmY2lkbCeRCS7yi/0sb2Iqd6blRM7PTjEz5J9+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498192; c=relaxed/simple;
	bh=YsQQYmAyEWbC3o5G6oULnNwwypV7pWStr7GBaGzsLgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OpWWyCcz9tcDOFOoxjcn+73XTZp2mvNFIvPjaYMLMG0HzU7sTEUvGyJCYjvh2cEpZ4nAaD+Ae1UzTHZSyEFxN5QpHXbNSuS6TMvRsLjfl4k3Q1INZ3/rjEPFGk4gHof7dM6PaAfWVN2J5GgDO/ATPTmNT+q+R6WjIYfzq5b405s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pO7dFxVb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pO7dFxVb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9445C4CEE4;
	Tue,  6 May 2025 02:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498192;
	bh=YsQQYmAyEWbC3o5G6oULnNwwypV7pWStr7GBaGzsLgE=;
	h=From:To:Cc:Subject:Date:From;
	b=pO7dFxVbl8dzRyrWQ6uxhGuyDghrmCrbnq08U9Su4gPKeDY8VjVCh8ULAFiN52XDR
	 qnO9JR3BV+i+s23j/UqB8Lgs0CwbL9CKdERKvxoxPdcYo8QhtibZAkXNPS09z7nv0B
	 3eGXvE7k+EzL0PIK+KLzPGQ85fj0sUHesD0WA9SQM9sdj1cfsMf9aOL7MRzxUB4U+B
	 vpSVcRKx3434aYGj4wc/Yq/cSPU/tTi7vhIOOLUPg8p20WeDnckZnPQZIPlUFbw6D1
	 yULFLJFpXjc7ei44gZVn8RMQV4ldJ/CvraD9zoyXYStef96GxIlxv2wu6ao85JSJSZ
	 FfUUcYiys0ClA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vineet Gupta <vgupta@synopsys.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert snps,archs-gfrc to DT schema
Date: Mon,  5 May 2025 21:23:08 -0500
Message-ID: <20250506022309.2588605-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Synopsys ARC HS 64-bit Timer binding to DT schema format.
It's a straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/snps,archs-gfrc.txt        | 14 ---------
 .../bindings/timer/snps,archs-gfrc.yaml       | 30 +++++++++++++++++++
 2 files changed, 30 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.yaml

diff --git a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
deleted file mode 100644
index b6cd1b3922de..000000000000
--- a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Synopsys ARC Free Running 64-bit Global Timer for ARC HS CPUs
-- clocksource provider for SMP SoC
-
-Required properties:
-
-- compatible : should be "snps,archs-gfrc"
-- clocks     : phandle to the source clock
-
-Example:
-
-	gfrc {
-		compatible = "snps,archs-gfrc";
-		clocks = <&core_clk>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.yaml b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.yaml
new file mode 100644
index 000000000000..fb16f4aba1c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/snps,archs-gfrc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys ARC Free Running 64-bit Global Timer for ARC HS CPUs
+
+maintainers:
+  - Vineet Gupta <vgupta@synopsys.com>
+
+properties:
+  compatible:
+    const: snps,archs-gfrc
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
+    timer {
+        compatible = "snps,archs-gfrc";
+        clocks = <&core_clk>;
+    };
-- 
2.47.2

