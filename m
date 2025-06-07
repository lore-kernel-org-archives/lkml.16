Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E1920B81B;
	Sat,  7 Jun 2025 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331593; cv=none; b=KBpg1HfYfMDcCDANZz8BDbNkm3GOElqTkd5Y4jaONcgZyYxqm3E8iYBfFX+IIFM31PRV2PD18FOshHbE4hHXk+3pRpL01Lf+mxgw9goMWXnUJx7CP4ltay7rqhX4q0eHz9/gExmmj2X3ZzQFZH6LmgKDSG2qYazBxWyQmIeUW1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331593; c=relaxed/simple;
	bh=nRisKPNacvoseFqtxNXckU+ZjYBIGNp5wV6i5Jl2UTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fB8UmaBMjFxtj9RmIiNJYEqdrZuoFHTMkAEYme3hA5RUgOD0DCCbi3HLSNo2KoywUX+ilE4UznUaJUJOr0d2d4v6118wuYSULGN/1F4Qny8bhFVhD5auO8iGqZ9iA21VXM5owlmq4qI6OAcgaxN59Tb2r+ecEAH20o3k+Ir4G/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H64H16zm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H64H16zm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29C9C4CEE4;
	Sat,  7 Jun 2025 21:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331592;
	bh=nRisKPNacvoseFqtxNXckU+ZjYBIGNp5wV6i5Jl2UTA=;
	h=From:To:Cc:Subject:Date:From;
	b=H64H16zm65Zi1YeZCsv1mcwfdWR/NBzPHRL4rtxGMBd4jarEPuSd/+HVbWhzQ2gjZ
	 FykD2+eeeXNU8Z2pJa7XVOcD0DMU95fZ2n4rTo++Zq8L/zbWRn9NOosRBRorAnWWfY
	 uo7SU/UHjfS798vm0g4CrzhGWg0zoL3Tux/qKdJE2iUsCyvfo4MrbdUIrWWO2sqT0l
	 5D/ZH0EY8XbFot0U+7mJUZsT8h6zoeuc0F9SKAg5onPe6YR8GI1bXjHOWjzC8R3bsc
	 yIJWpPAClKJjMlwT408AvJFkr0o6oOnoQlRDOlgc8JI/sui/JQET3bDHHPHaxtda0I
	 cDI72xqzF3IYA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratyush Anand <pratyush.anand@gmail.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert st,spear1310-miphy to DT schema
Date: Sat,  7 Jun 2025 16:26:28 -0500
Message-ID: <20250607212629.744191-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ST SPEAr MIPHY PHY binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/st,spear1310-miphy.yaml      | 53 +++++++++++++++++++
 .../bindings/phy/st-spear-miphy.txt           | 15 ------
 2 files changed, 53 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/st,spear1310-miphy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/st-spear-miphy.txt

diff --git a/Documentation/devicetree/bindings/phy/st,spear1310-miphy.yaml b/Documentation/devicetree/bindings/phy/st,spear1310-miphy.yaml
new file mode 100644
index 000000000000..32f81615ddad
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/st,spear1310-miphy.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/st,spear1310-miphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST SPEAr miphy
+
+maintainers:
+  - Pratyush Anand <pratyush.anand@gmail.com>
+
+description:
+  ST Microelectronics SPEAr miphy is a phy controller supporting PCIe and SATA.
+
+properties:
+  compatible:
+    enum:
+      - st,spear1310-miphy
+      - st,spear1340-miphy
+
+  reg:
+    maxItems: 1
+
+  misc:
+    description: Phandle for the syscon node to access misc registers.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  '#phy-cells':
+    description: >
+      Cell[0] indicates interface type: 0 = SATA, 1 = PCIe.
+    const: 1
+
+  phy-id:
+    description: Instance id of the phy. Required when multiple PHYs are present.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - misc
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    miphy@1000 {
+        compatible = "st,spear1310-miphy";
+        reg = <0x1000 0x100>;
+        misc = <&syscon>;
+        #phy-cells = <1>;
+        phy-id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/st-spear-miphy.txt b/Documentation/devicetree/bindings/phy/st-spear-miphy.txt
deleted file mode 100644
index 2a6bfdcc09b3..000000000000
--- a/Documentation/devicetree/bindings/phy/st-spear-miphy.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-ST SPEAr miphy DT details
-=========================
-
-ST Microelectronics SPEAr miphy is a phy controller supporting PCIe and SATA.
-
-Required properties:
-- compatible : should be "st,spear1310-miphy" or "st,spear1340-miphy"
-- reg : offset and length of the PHY register set.
-- misc: phandle for the syscon node to access misc registers
-- #phy-cells : from the generic PHY bindings, must be 1.
-	- cell[1]: 0 if phy used for SATA, 1 for PCIe.
-
-Optional properties:
-- phy-id: Instance id of the phy. Only required when there are multiple phys
-  present on a implementation.
-- 
2.47.2

