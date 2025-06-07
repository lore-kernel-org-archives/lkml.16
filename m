Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DB11EA7F4;
	Sat,  7 Jun 2025 21:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331523; cv=none; b=XzyRYseT1JZZxWO6yZlS1CD6kr2hZT2ZkuoiFOfk0bU+mlxbB3DALw9Sd96TDEWmnaBH+mhRQL55UKW+fzFZ0GWvX/XWGxOKTcUrArxxUdCS4BjtqwBEeGYODzOMqUb7hwkt/oL5CBb6qRkeaWL5YIEMp692PeJj6Zg32D5+x3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331523; c=relaxed/simple;
	bh=uY8/U0KeeEqTksjlG8Tey8xZTBa6AbGenLLUPHv2utY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5hgXsYctkVHMd/Gjz8w96sIy5XaaREFvNAVuKyk2BK3GHJOLfjskXjnFBxuZVqq5JDs468jr9p+Qz/+58fTAn5xPj+ZUfKPB/+vlZ2gsYwxDEBNmzETZ1VJ8DTRdx6bxjaTJ3+MV5A1typBya7ij3hvEShtJFQH7THfqFcUjKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/Z5F9r8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/Z5F9r8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818EAC4AF09;
	Sat,  7 Jun 2025 21:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331522;
	bh=uY8/U0KeeEqTksjlG8Tey8xZTBa6AbGenLLUPHv2utY=;
	h=From:To:Cc:Subject:Date:From;
	b=Q/Z5F9r8+sjhbCx38iB1BgJcln0WwPIAZAVs+JOcA9mS1jU6Txgs9gzUg0tUzOq7Q
	 m+/ou88NXCfFJWRY4O7aBw12VilM8lsVVSMkEbsQ6e8ZZn4/yfpxkyx71NRZS4yJIs
	 58iS2kwytdlm6IRsW+dtGgzfNwKPyh4d6U1zfYRWc4+ZA/Ljn1E/Nflm4sEPKk3qRu
	 mkGV2ifM1iocYsE9yFmfxvfPFw8PY59DNN4l/cSvw6WWssforDFOTzL7WiKhoyi2cS
	 JVAE6IkxZRcdPDXpUa8ygvQrJMahypiVULaIDN9bhSzr/ID/cg2A07PAcfkT3vBkg6
	 of4AG3mTgXTjg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiancheng Xue <xuejiancheng@huawei.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert hisilicon,hix5hd2-sata-phy to DT schema
Date: Sat,  7 Jun 2025 16:25:18 -0500
Message-ID: <20250607212520.741588-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the HiSilicon HIX5HD2 SATA PHY binding to DT schema format. It's
a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../phy/hisilicon,hix5hd2-sata-phy.yaml       | 48 +++++++++++++++++++
 .../devicetree/bindings/phy/hix5hd2-phy.txt   | 22 ---------
 2 files changed, 48 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/hisilicon,hix5hd2-sata-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/hix5hd2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/hisilicon,hix5hd2-sata-phy.yaml b/Documentation/devicetree/bindings/phy/hisilicon,hix5hd2-sata-phy.yaml
new file mode 100644
index 000000000000..2993dd6b40a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/hisilicon,hix5hd2-sata-phy.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/hisilicon,hix5hd2-sata-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon hix5hd2 SATA PHY
+
+maintainers:
+  - Jiancheng Xue <xuejiancheng@huawei.com>
+
+properties:
+  compatible:
+    const: hisilicon,hix5hd2-sata-phy
+
+  reg:
+    maxItems: 1
+
+  '#phy-cells':
+    const: 0
+
+  hisilicon,peripheral-syscon:
+    description: Phandle of syscon used to control peripheral
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  hisilicon,power-reg:
+    description: Offset and bit number within peripheral-syscon register controlling SATA power supply
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: Offset within peripheral-syscon register
+      - description: Bit number controlling SATA power supply
+
+required:
+  - compatible
+  - reg
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@f9900000 {
+        compatible = "hisilicon,hix5hd2-sata-phy";
+        reg = <0xf9900000 0x10000>;
+        #phy-cells = <0>;
+        hisilicon,peripheral-syscon = <&peripheral_ctrl>;
+        hisilicon,power-reg = <0x8 10>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/hix5hd2-phy.txt b/Documentation/devicetree/bindings/phy/hix5hd2-phy.txt
deleted file mode 100644
index 296168b74d24..000000000000
--- a/Documentation/devicetree/bindings/phy/hix5hd2-phy.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Hisilicon hix5hd2 SATA PHY
------------------------
-
-Required properties:
-- compatible: should be "hisilicon,hix5hd2-sata-phy"
-- reg: offset and length of the PHY registers
-- #phy-cells: must be 0
-Refer to phy/phy-bindings.txt for the generic PHY binding properties
-
-Optional Properties:
-- hisilicon,peripheral-syscon: phandle of syscon used to control peripheral.
-- hisilicon,power-reg: offset and bit number within peripheral-syscon,
-	register of controlling sata power supply.
-
-Example:
-	sata_phy: phy@f9900000 {
-		compatible = "hisilicon,hix5hd2-sata-phy";
-		reg = <0xf9900000 0x10000>;
-		#phy-cells = <0>;
-		hisilicon,peripheral-syscon = <&peripheral_ctrl>;
-		hisilicon,power-reg = <0x8 10>;
-	};
-- 
2.47.2

