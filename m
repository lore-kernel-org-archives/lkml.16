Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548BF20FA81;
	Tue,  1 Apr 2025 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743528301; cv=none; b=BcaN5wJVKPNxwbLmL6EITdOjd/ujq1F+xoq9T887Zz25m64fBObp5tjjMxjr3VlpkrHxm10s/lGWnv/MU6eTYtxdzMM7MGyUNESBW4DK6NO+AWJHwVQZU4ewGKgsxJuia0z2uuZpMAlMxGwR5IVgmyj8y9SuojGrOZ3RPpIdubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743528301; c=relaxed/simple;
	bh=8c6COWP7Dw3rM2JKdudVcfXRIkxcSQg0Ocq+QX4CSfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msEZkzr1RKmFOEGlK60ahO5dWeR16BLi8pxTjl8bSM4Jo59T7y6xuBOO0VfchUbtp4JxGhuc6mEGDwriyd36WjzoyKTs18H9ff6zTnUydkNlfR/w6VYx2GKupxVT9257IjI+z4o2b+B5DFvDsIe8G09ed0Fx/mrDsyiSuc8Hd7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=YVFozjKd; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=cmCWb2Wv; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="YVFozjKd";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="cmCWb2Wv"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id C6559EC59FF;
	Tue, 01 Apr 2025 10:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528298; bh=8c6COWP7Dw3rM2JKdudVcfXRIkxcSQg0Ocq+QX4CSfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YVFozjKdg42UYsIrQHKCPVuKKIB2zd65HgOw6rd4c4+Zb55bwwpfRG2MZTTYuixvL
	 DRMcoVMRZWpsbbGlNgc+4LRD1z4QbLrAd6ZxojMC89Lscgyoi3bmEiqSJtKpGeDK/u
	 +v0pNxBmoCLqFoE5xAUEfEX7XXolqNz19yk5kVKcV8WbJtwnv4PWBn3FN/uEnMaMdP
	 bRFa2sfQ/P8gErovyf2qvYrZyuAJKc2xG3f5sOgpW/OOZ5JmRFFJSIFKdbw/qFewxE
	 Jzhu/Z7PyhPEaof6hdFZ9YNYlWLGliVVAZgk1R+fwg/pkfpxCsQBAFnDVSYeYOdVM6
	 XgyC+HAEeA5kw==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nie_wgcdoo2K; Tue,  1 Apr 2025 10:24:57 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 60EC6EC59F9;
	Tue, 01 Apr 2025 10:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528297; bh=8c6COWP7Dw3rM2JKdudVcfXRIkxcSQg0Ocq+QX4CSfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmCWb2WvS0S0sSOMt0p6Fk0Ek5jNVTrnK4TqJoWo/WpJbwcXYq7/lT8goDlll+cKv
	 vQMYO3ORaxY+M1l1ehdufm9BW5jyg1jeHI9TrvWx9B2a56PZkx0s/ttwwjSoKPvBk3
	 HjMRsqoq2XSY9oCbvBcKZn8iOcr7h6frrsDRr/FxhC/xhVHNGvrvg2wQMPWrtL6kwd
	 K+Q7ZkTHaH0Hb7umMMgWkaubgic53iqX9HowrxrwLtoPeed7FPFfwXbiQ7ILCsZl9N
	 /TbEdXNQkYAUizzha5LM/irUgG02DKYP7GMWX3KYiW/sb+I8Zj32h4tFDactjRyqKS
	 XSbkjbtMjJJjA==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 2/6] dt-bindings: clock: spacemit: Add spacemit,k1-pll
Date: Tue,  1 Apr 2025 17:24:30 +0000
Message-ID: <20250401172434.6774-3-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401172434.6774-1-heylenay@4d2.org>
References: <20250401172434.6774-1-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add definition for the PLL found on SpacemiT K1 SoC, which takes the
external 24MHz oscillator as input and generates clocks in various
frequencies for the system.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/spacemit,k1-pll.yaml       | 50 +++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 37 ++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
new file mode 100644
index 000000000000..06bafd68c00a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/spacemit,k1-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PLL
+
+maintainers:
+  - Haylen Chu <heylenay@4d2.org>
+
+properties:
+  compatible:
+    const: spacemit,k1-pll
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: External 24MHz oscillator
+
+  spacemit,mpmu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the "Main PMU (MPMU)" syscon. It is used to check PLL
+      lock status.
+
+  "#clock-cells":
+    const: 1
+    description:
+      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - spacemit,mpmu
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@d4090000 {
+        compatible = "spacemit,k1-pll";
+        reg = <0xd4090000 0x1000>;
+        clocks = <&vctcxo_24m>;
+        spacemit,mpmu = <&sysctl_mpmu>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 61c8d7360cf8..efe29c976a01 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -6,6 +6,43 @@
 #ifndef _DT_BINDINGS_SPACEMIT_CCU_H_
 #define _DT_BINDINGS_SPACEMIT_CCU_H_
 
+/*	APBS (PLL) clocks	*/
+#define CLK_PLL1		0
+#define CLK_PLL2		1
+#define CLK_PLL3		2
+#define CLK_PLL1_D2		3
+#define CLK_PLL1_D3		4
+#define CLK_PLL1_D4		5
+#define CLK_PLL1_D5		6
+#define CLK_PLL1_D6		7
+#define CLK_PLL1_D7		8
+#define CLK_PLL1_D8		9
+#define CLK_PLL1_D11		10
+#define CLK_PLL1_D13		11
+#define CLK_PLL1_D23		12
+#define CLK_PLL1_D64		13
+#define CLK_PLL1_D10_AUD	14
+#define CLK_PLL1_D100_AUD	15
+#define CLK_PLL2_D1		16
+#define CLK_PLL2_D2		17
+#define CLK_PLL2_D3		18
+#define CLK_PLL2_D4		19
+#define CLK_PLL2_D5		20
+#define CLK_PLL2_D6		21
+#define CLK_PLL2_D7		22
+#define CLK_PLL2_D8		23
+#define CLK_PLL3_D1		24
+#define CLK_PLL3_D2		25
+#define CLK_PLL3_D3		26
+#define CLK_PLL3_D4		27
+#define CLK_PLL3_D5		28
+#define CLK_PLL3_D6		29
+#define CLK_PLL3_D7		30
+#define CLK_PLL3_D8		31
+#define CLK_PLL3_80		32
+#define CLK_PLL3_40		33
+#define CLK_PLL3_20		34
+
 /* MPMU clocks */
 #define CLK_PLL1_307P2		0
 #define CLK_PLL1_76P8		1
-- 
2.49.0

