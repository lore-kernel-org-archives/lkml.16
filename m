Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB317253F35;
	Mon, 23 Jun 2025 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683417; cv=none; b=rPekfi464hdukI1mPN1emIywaVKvlvd1Cso0Peirqd60W5IWyZXcKmfYcHdphFcIU36t33ciR8JD3fX6u5zdUN9qbK0vveG+WCF1krMrRn0RLt2r5vKTmmkWuCnZXoX0dYNa+gEHq60lgoa9+UOz3QW8tHXfRqs3nfZcNAhydrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683417; c=relaxed/simple;
	bh=PIHOS5LM4Q5ULhIpiS+e6H3YXH5KbzpMBhW+qqqEPHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obGQgiT9RwToGmhGRJnXd6F+SFuEo70nEtCiFCzL0T6pBJFQxV9CIweHtFhs/VjxA0BRc//pxBqv8xK8ubzHsOQSAjZbNiu3i/3EMCbRmW2V5++AJo2iqW0+2WVK4/4yBkM0zLiUL9MemB+TiXLpv6TqF7Q+pyNms6fIvszD6BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNXbW/13; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNXbW/13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4504C4CEF2;
	Mon, 23 Jun 2025 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750683417;
	bh=PIHOS5LM4Q5ULhIpiS+e6H3YXH5KbzpMBhW+qqqEPHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gNXbW/135BTxQgteCZ6aZnwg0bZcP2fpcaoQBVoKkCrUsItwnPWJ4j7XkiCovARAv
	 Iw/MoVJ2oXMf1JmTBnWkO9bQadh4pTU/m7zg3hhRppXu9gPl+kiTcJFesQljIkj2ci
	 1+xWant1y5AL+FeiyxrYm3jLBzrvLrRocqBvYbynLQOETtgFJTiDzXqrMD8CDL3Wgx
	 VP7ojKyRLBlwX2ax0qBdxGBcTerD28xPgsoOZU4/BiBESumF9MnP64f5Zppl2OZkYv
	 99Ay0ROvx2Ik/Mt5mJwcCpEqffvcLMgV2ScTWVgVEnAGugwRBYIG1VCNBPBHr5SaGM
	 nPcdPjDn1dTxA==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] dt-bindings: soc: microchip: document the simple-mfd syscon on PolarFire SoC
Date: Mon, 23 Jun 2025 13:56:16 +0100
Message-ID: <20250623-underwear-refinery-9203f771bc39@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623-levitate-nugget-08c9a01f401d@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2876; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VHCdWiaaucWgmq2/9huhuDTRmVGS9+Jq0xOGf5lOCpE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmRfu+XC5877sWkIJNSLM2868HGEgW9+sqV0zrmb2xzS 0uSWCnVUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIksUGP4Z7I9XIihYDJ3lkqs /9f7ob8660Q1dN+qHRP1e/+qPu/tTUaGx1bnKu7N3XPU9vGxYJZXsk9+CvdL9P+btKr/v6fLiqP GjAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

"mss-top-sysreg" contains clocks, pinctrl, resets, an interrupt controller
and more. At this point, only the reset controller child is described as
that's all that is described by the existing bindings.
The clock controller already has a dedicated node, and will retain it as
there are other clock regions, so like the mailbox, a compatible-based
lookup of the syscon is sufficient to keep the clock driver working as
before, so no child is needed. There's also an interrupt multiplexing
service provided by this syscon, for which there is work in progress at
[1].

Link: https://lore.kernel.org/linux-gpio/20240723-uncouple-enforcer-7c48e4a4fefe@wendy/ [1]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v3:
- drop simple-mfd at Krzysztof's request since the child nodes do not
  yet exist.

v2:
- clean up various minor comments from Rob on mpfs-mss-top-sysreg
- remove mpfs-control-scb from this patch
---
 .../microchip,mpfs-mss-top-sysreg.yaml        | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
new file mode 100644
index 0000000000000..1ab691db87950
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire SoC Microprocessor Subsystem (MSS) sysreg register region
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description:
+  An wide assortment of registers that control elements of the MSS on PolarFire
+  SoC, including pinmuxing, resets and clocks among others.
+
+properties:
+  compatible:
+    items:
+      - const: microchip,mpfs-mss-top-sysreg
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    description:
+      The AHB/AXI peripherals on the PolarFire SoC have reset support, so
+      from CLK_ENVM to CLK_CFM. The reset consumer should specify the
+      desired peripheral via the clock ID in its "resets" phandle cell.
+      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list
+      of PolarFire clock/reset IDs.
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@20002000 {
+      compatible = "microchip,mpfs-mss-top-sysreg", "syscon";
+      reg = <0x20002000 0x1000>;
+      #reset-cells = <1>;
+    };
+
-- 
2.45.2

