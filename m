Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FFE43172;
	Wed, 21 May 2025 00:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788373; cv=none; b=M2TFwj/EATsc8ae5wM1W0ZEdQsmGpbUwzENxyJO9w5RxlT3s6FlvGRENJbeHDLGbDYFN14lddJF9hZMuAtU5V3iOERFEq6vxBctzjvEFEez7P9qpAK9NZLRzjgQPknvqsiqfGM9CXvzpLzJCmhqV4GfbN/w5lpkXT+KacGXRCKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788373; c=relaxed/simple;
	bh=MUl6EF3DZ1O5Z1cCz6/++3LPdwMEd+CIVJiO/gjXJlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kRb9uJ9KJjvVL3Nyh2rv1z10kNlDx2YL3EkeoDJO8vIIwTmHoLMaxYc6E869Ns6WlJA1Tex6pOmG5USftWLV83UQazdXGGYxgI9u1RsYIE+Ssh4GPUncdR3EUqfMn295gFUiXNeT201GQa/GCsDVAjLV3rqnArtoZJ0MjsYDlj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlJsdL4l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlJsdL4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D46AC4CEE9;
	Wed, 21 May 2025 00:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747788373;
	bh=MUl6EF3DZ1O5Z1cCz6/++3LPdwMEd+CIVJiO/gjXJlU=;
	h=From:To:Cc:Subject:Date:From;
	b=YlJsdL4lJvgMQGhAKhk4xGA0YqEtVAMG45ID6M0ene4w/vgIIaMieaaMlihl5FCBa
	 6Aba68Uuailae0OGxvHl6OS4ycSS8y4Gf9C07H8JGVay0n+hjOieuMFJFJ86yMl7KD
	 Z8ynvWQngKqPh9rlNr2WTxgA56MwJw7eROBhzoJi0tmhKarllnbzgGxyRtL9AzHiSi
	 pRwfSEDM7i1Z2ccN8hJsqo2dqFJuW1/1c9po1KguqZzdvrtn2tJj7Q/mQ2ru4imS5f
	 GmoMcCNwOSVmFqCWeXKlHcubKz9Fw9Kuv/YioUVjA0JHKPvXE7uQyUTIg3tBkH8Q8x
	 tfAy2EEPotJnQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert brcm,bcm63xx-clocks to DT schema
Date: Tue, 20 May 2025 19:46:08 -0500
Message-ID: <20250521004610.1791426-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Broadcom BCM63xx clock bindings to DT schema format. It's
a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/brcm,bcm63xx-clocks.txt    | 24 ----------
 .../bindings/clock/brcm,bcm63xx-clocks.yaml   | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.yaml

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
deleted file mode 100644
index 3e7ca5530775..000000000000
--- a/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Gated Clock Controller Bindings for MIPS based BCM63XX SoCs
-
-Required properties:
-- compatible: must be one of:
-	 "brcm,bcm3368-clocks"
-	 "brcm,bcm6318-clocks"
-	 "brcm,bcm6318-ubus-clocks"
-	 "brcm,bcm6328-clocks"
-	 "brcm,bcm6358-clocks"
-	 "brcm,bcm6362-clocks"
-	 "brcm,bcm6368-clocks"
-	 "brcm,bcm63268-clocks"
-
-- reg: Address and length of the register set
-- #clock-cells: must be <1>
-
-
-Example:
-
-clkctl: clock-controller@10000004 {
-	compatible = "brcm,bcm6328-clocks";
-	reg = <0x10000004 0x4>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.yaml
new file mode 100644
index 000000000000..56909ea499a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm63xx-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS based BCM63XX SoCs Gated Clock Controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm3368-clocks
+      - brcm,bcm6318-clocks
+      - brcm,bcm6318-ubus-clocks
+      - brcm,bcm6328-clocks
+      - brcm,bcm6358-clocks
+      - brcm,bcm6362-clocks
+      - brcm,bcm6368-clocks
+      - brcm,bcm63268-clocks
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@10000004 {
+        compatible = "brcm,bcm6328-clocks";
+        reg = <0x10000004 0x4>;
+        #clock-cells = <1>;
+    };
-- 
2.47.2

