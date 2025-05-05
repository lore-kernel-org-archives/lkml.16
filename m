Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083FD25C70B;
	Mon,  5 May 2025 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456488; cv=none; b=MJKANsLmeuBehORLXTuj0eJRXS6nN56uLbZx54XNZEdVy3VhtfO67EHK6zWojZY3MW0wBWcCgqkw4OQ6jFK57tZxosNWDroNXwm0D6gAWw6nlv9mjB7RRcOiHCi9f0qxDmGDCCgwqNO46yqbmL7RG4F7cOU6uEnqqhASZveTeAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456488; c=relaxed/simple;
	bh=y52hba/QVmRFrWMvhUjoTQRp9UlDg4XZvO/O+VBqz7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oihPTiuplHy6CZlr5QTaIaUAEf+ex7g4P12WAEk+96xBz5dzP5sbp/YpF5E4746ZTBAqHo9QJFXI/Y11NeHXCJlGfwQVbwIzRJAMu/fBZNDitSih61sZG3ulh8rFG09DYSuFXFmqSDDcONhZ9u5Q1uEOUlOhSZCxVCb5Pph8lzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9cmsUeR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9cmsUeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4414C4CEE4;
	Mon,  5 May 2025 14:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456487;
	bh=y52hba/QVmRFrWMvhUjoTQRp9UlDg4XZvO/O+VBqz7s=;
	h=From:To:Cc:Subject:Date:From;
	b=J9cmsUeR0aYVYFT+wRwNZGg0fTPvbiFJgdJzZiuYCKTx9pVhgkEBLh/6s0YDG/czn
	 fDK6Ne5q+7KnSsRz0APEDzbDTtgKDhOA4I6FDANCQHW/d0JbaVRRTMXlpgJ7R60vsi
	 RMl6KtVdLYChJvdAT74jW9s/AcKgtmpQxxvms07S95xNa8NCodRhQN6TJsg99wAKMj
	 8ljbjDRPWBVczwEpRMdAYG4Lg93Qg1nOFrY8FvR6yWGryBfvzesUhpbqI0G7E5lrW/
	 mWPjfTbIPq8uvfQvz4oKVCV5EOiTlNVbnq6LGAm0deucGwM2k4raspRqwtmM0IAFFS
	 YEpdhObH/6Shw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert opencores,or1k-pic to DT schema
Date: Mon,  5 May 2025 09:48:02 -0500
Message-ID: <20250505144803.1291424-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the OpenRISC PIC interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../opencores,or1k-pic.txt                    | 23 -----------
 .../opencores,or1k-pic.yaml                   | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.txt
deleted file mode 100644
index 55c04faa3f3f..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-OpenRISC 1000 Programmable Interrupt Controller
-
-Required properties:
-
-- compatible : should be "opencores,or1k-pic-level" for variants with
-  level triggered interrupt lines, "opencores,or1k-pic-edge" for variants with
-  edge triggered interrupt lines or "opencores,or1200-pic" for machines
-  with the non-spec compliant or1200 type implementation.
-
-  "opencores,or1k-pic" is also provided as an alias to "opencores,or1200-pic",
-  but this is only for backwards compatibility.
-
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 1.
-
-Example:
-
-intc: interrupt-controller {
-	compatible = "opencores,or1k-pic-level";
-	interrupt-controller;
-	#interrupt-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.yaml
new file mode 100644
index 000000000000..995b68c3aed4
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/opencores,or1k-pic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OpenRISC 1000 Programmable Interrupt Controller
+
+maintainers:
+  - Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
+
+properties:
+  compatible:
+    enum:
+      - opencores,or1k-pic-level
+      - opencores,or1k-pic-edge
+      - opencores,or1200-pic
+      - opencores,or1k-pic
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "opencores,or1k-pic-level";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
-- 
2.47.2

