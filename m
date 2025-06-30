Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAAA2E8DF0;
	Mon, 30 Jun 2025 23:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751326009; cv=none; b=Q+wbFX/XMfyltjAvPdmNZUyt5tjnDyapvQpftR3eYaYIXdpF048Nbi1V1i1JhNcLUJCtBS4fM1KI1HcAO7sra5lT4sGn8tfK/blgaTRwQ11rbdtnz7YUg5RzbwUtfWRo8uA1dtcJlOXTW+M7bYOT+AIdfACJVvkrd5TziBXioTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751326009; c=relaxed/simple;
	bh=VTv7opCZXxZ4GXzYPfNqPS1L7/gEKWDzBH62J409Juc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LiHO4lvKjB4ftfh8m5p40bsS7mWFd9H5Nu1jZITNuwL600TxuqAae/JZyPwPAP/vR6HCqPK2YGvmF2n+t9e8Pe8hnXkno47Jnr2vlmEzEVkeKhNoE27+mEmOD/0yj/2B3sXgYBTiCqlGUlOfVzFuEU2/Zy77Yu/cACjTbGyfSHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3XFDYs7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3XFDYs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EDEC4CEE3;
	Mon, 30 Jun 2025 23:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751326009;
	bh=VTv7opCZXxZ4GXzYPfNqPS1L7/gEKWDzBH62J409Juc=;
	h=From:To:Cc:Subject:Date:From;
	b=f3XFDYs7sgcJnbJo1jUQFAKDo6NG28AED9efX0YCBQLSMfkOEQIBJdPfO84ueAFq7
	 GvDQ1xlJW0Oqnne9EbcLqU9mDwhlB0vlZAbs9fTr6YGtt8b2qmYbQIAW2EivwMv3VU
	 //N1FLqQsGHY87gxsWNuxhextTvFpCdakbJ7jwpqw14mONaCeaPj/32+SBdbM6UEjm
	 pbxdQR/nQNoVzExnijzh/14orklJyRdd/8KFZvIWVeoZKFQt7mN/8YfndnVrS99JLq
	 DGXQOntOI5dSjO4lFpDjfK7Sq+ae6oe2rTHqMydA032hdV1qaudbDC5d78Y3wzfYyp
	 Sr8mKJpU6HLhw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: clock: Convert moxa,moxart-clock to DT schema
Date: Mon, 30 Jun 2025 18:26:43 -0500
Message-ID: <20250630232644.3700781-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/moxa,moxart-clock.txt      | 48 -------------------
 .../bindings/clock/moxa,moxart-clock.yaml     | 38 +++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 39 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/moxa,moxart-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt b/Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt
deleted file mode 100644
index fedea84314a1..000000000000
--- a/Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Device Tree Clock bindings for arch-moxart
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-MOXA ART SoCs allow to determine PLL output and APB frequencies
-by reading registers holding multiplier and divisor information.
-
-
-PLL:
-
-Required properties:
-- compatible : Must be "moxa,moxart-pll-clock"
-- #clock-cells : Should be 0
-- reg : Should contain registers location and length
-- clocks : Should contain phandle + clock-specifier for the parent clock
-
-Optional properties:
-- clock-output-names : Should contain clock name
-
-
-APB:
-
-Required properties:
-- compatible : Must be "moxa,moxart-apb-clock"
-- #clock-cells : Should be 0
-- reg : Should contain registers location and length
-- clocks : Should contain phandle + clock-specifier for the parent clock
-
-Optional properties:
-- clock-output-names : Should contain clock name
-
-
-For example:
-
-	clk_pll: clk_pll@98100000 {
-		compatible = "moxa,moxart-pll-clock";
-		#clock-cells = <0>;
-		reg = <0x98100000 0x34>;
-	};
-
-	clk_apb: clk_apb@98100000 {
-		compatible = "moxa,moxart-apb-clock";
-		#clock-cells = <0>;
-		reg = <0x98100000 0x34>;
-		clocks = <&clk_pll>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/moxa,moxart-clock.yaml b/Documentation/devicetree/bindings/clock/moxa,moxart-clock.yaml
new file mode 100644
index 000000000000..bcf7cc240eba
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/moxa,moxart-clock.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/moxa,moxart-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MOXA ART Clock Controllers
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
+  MOXA ART SoCs allow to determine PLL output and APB frequencies by reading
+  registers holding multiplier and divisor information.
+
+properties:
+  compatible:
+    enum:
+      - moxa,moxart-apb-clock
+      - moxa,moxart-pll-clock
+
+  "#clock-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#clock-cells"
+  - reg
diff --git a/MAINTAINERS b/MAINTAINERS
index 8a928ae141de..1dcc1b70224f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2893,7 +2893,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/arm/moxart.yaml
-F:	Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt
+F:	Documentation/devicetree/bindings/clock/moxa,moxart-clock.yaml
 F:	arch/arm/boot/dts/moxa/
 F:	drivers/clk/clk-moxart.c
 
-- 
2.47.2

