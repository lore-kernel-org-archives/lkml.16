Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB64B1E6D;
	Wed, 21 May 2025 00:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788571; cv=none; b=N4tGnGMVCjslXMG4xnvPgclgCsxXyz8am1tS88f/goKBkIge0VMItllHyEdL4Hb5P8St6pr4KibkrMTT7AgGt9O8iB0jOmq/mC536ozKBjmMk721axBIXsD2l+JMTt5QM+N2K7f4Hovj9/vf8Gr73RVJDbhrDkZkKzlTY526SiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788571; c=relaxed/simple;
	bh=rXFN4RjgCiG7fwDD5qYlK3l1XbN4YwddNXy/py+DCVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WK5aMHPU6XAPF0PXP3+/0/ED4Nizu4ykRdIaQ0mxIlvYlQoEji2SRBPdqdxyofdV82IaY1qd47Iyio90/jjSudjvjA6McuGYRoOqVS+qjAUhdEPzGf9VPGdq6/pCkSdLdxCdEr+UHJwCWG9NvOi1hR822MgJZZwP3tEzTZF1FPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csQFLzdW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csQFLzdW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F96FC4CEE9;
	Wed, 21 May 2025 00:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747788570;
	bh=rXFN4RjgCiG7fwDD5qYlK3l1XbN4YwddNXy/py+DCVU=;
	h=From:To:Cc:Subject:Date:From;
	b=csQFLzdWojnA/76Gp7OhKHPg2gxSdVpXjAPDhJC8xW3JDtAIejF+djmR4EkOxu/uA
	 xochShDdiy1DK2r+u77jdNqorKgLT6oGVLH/iBjW6Gzb1WOJablfLMo/yzvZkcTpcq
	 1u+fKVyOyvzTcIAjRap4IjkBHNl7IaxYoLhAh8qaYRgY+axkLnem7E6fi88O5bHrOT
	 plbvlD9dtmD0rz/iS1u5LbjULY/hrWJ5uaIpKRx4DVe3ek1HHfRPBLnaCm6ZAxQbPZ
	 pyJAQ9CCOq6A/7AzO+R1wzB+ARKIEO9f6/T/FZuO/EnllJ1ygRtOu7535luBRh72Qq
	 i6tCNzOxVc5Og==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert cirrus,ep7209-clk to DT schema
Date: Tue, 20 May 2025 19:49:22 -0500
Message-ID: <20250521004923.1795927-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Cirrus EP7xxx (aka CLPS711x) binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/cirrus,ep7209-clk.yaml     | 47 +++++++++++++++++++
 .../bindings/clock/clps711x-clock.txt         | 19 --------
 2 files changed, 47 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,ep7209-clk.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/clps711x-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/cirrus,ep7209-clk.yaml b/Documentation/devicetree/bindings/clock/cirrus,ep7209-clk.yaml
new file mode 100644
index 000000000000..fbd0d50d46a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,ep7209-clk.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/cirrus,ep7209-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CLPS711X Clock Controller
+
+maintainers:
+  - Alexander Shiyan <shc_work@mail.ru>
+
+description:
+  See include/dt-bindings/clock/clps711x-clock.h for the full list of CLPS711X
+  clock IDs.
+
+properties:
+  compatible:
+    items:
+      - const: cirrus,ep7312-clk
+      - const: cirrus,ep7209-clk
+
+  reg:
+    maxItems: 1
+
+  startup-frequency:
+    description: Factory set CPU startup frequency in HZ.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - startup-frequency
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@80000000 {
+        compatible = "cirrus,ep7312-clk", "cirrus,ep7209-clk";
+        reg = <0x80000000 0xc000>;
+        #clock-cells = <1>;
+        startup-frequency = <73728000>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/clps711x-clock.txt b/Documentation/devicetree/bindings/clock/clps711x-clock.txt
deleted file mode 100644
index f1bd53f79d91..000000000000
--- a/Documentation/devicetree/bindings/clock/clps711x-clock.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* Clock bindings for the Cirrus Logic CLPS711X CPUs
-
-Required properties:
-- compatible       : Shall contain "cirrus,ep7209-clk".
-- reg              : Address of the internal register set.
-- startup-frequency: Factory set CPU startup frequency in HZ.
-- #clock-cells     : Should be <1>.
-
-The clock consumer should specify the desired clock by having the clock
-ID in its "clocks" phandle cell. See include/dt-bindings/clock/clps711x-clock.h
-for the full list of CLPS711X clock IDs.
-
-Example:
-	clks: clks@80000000 {
-		#clock-cells = <1>;
-		compatible = "cirrus,ep7312-clk", "cirrus,ep7209-clk";
-		reg = <0x80000000 0xc000>;
-		startup-frequency = <73728000>;
-	};
-- 
2.47.2

