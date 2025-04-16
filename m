Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41A212FA6;
	Wed, 16 Apr 2025 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811672; cv=none; b=iD2M5l2jK5AbtWBMVp5/yMuqMRuWTEjEJshJBAK9KC6r9loIaIyHcYUlxe4EZsGE+olXDDlOnlU16Ddw80FWBcnUb1VNQn87x+r+3Tgmoa4QpBMb2k0LfoLuUgybsCM0UwsxmYv/KAlPGRZmuU5jtxm1zjHjLPJF4+CEflZlvIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811672; c=relaxed/simple;
	bh=Uk+Yw2b6g3w4R+Xgn735v2jh1sdxTNZvpl+s7jsy9Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0oPFBQb5CtY/M8lpEhWIBSdQdSY/V3ywQcl63uBWlMaYUL3dPuvBvAvLrLUmn4K7Siyh71dEybQlGqNCyM8ul90ttH+XL2VFq52HdYdiXnfjzNg55WMfL2qj4INJzmbMnwXLpqIaklTvtJn414bmNms36bZYVW02T7E2Uss2BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=RtIZ7kpL; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=LZT3ZjHB; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="RtIZ7kpL";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="LZT3ZjHB"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 401DD12FB451;
	Wed, 16 Apr 2025 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744811670; bh=Uk+Yw2b6g3w4R+Xgn735v2jh1sdxTNZvpl+s7jsy9Is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RtIZ7kpLbS2WlM+CiPBThKK2xxFRVyNkH/zvF1dPbgFJNA8U0EUgB9lP6mznMTyK/
	 NQtrd5mh1ATWTFJVqWesvKBe2T0MfKBxdmkiIB2Ev3fxwZBPjU0b0+mV4kAYoiZmLg
	 ZG6HfczCwq3t0PYrAxoGMZWfG0SlldvDVCHaHYiAg27qHSUVMB/Hx6htYIJFg48lwh
	 5xXuStZuVyQD0QUh1rS0aACnh5Kj7nNpH69ZnVhoT0BuMeul1ctiuq+PMva/ML762h
	 4ItsWNc0O12Jk6Ay4JG6blcD9I35clOMkrKeQDuEjoJv+aLVkzQO0klWgpSy3TSgK8
	 AOHnt/fUiLUkw==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X49Y-H-kEcPZ; Wed, 16 Apr 2025 06:54:28 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.80.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id A976112FB435;
	Wed, 16 Apr 2025 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744811668; bh=Uk+Yw2b6g3w4R+Xgn735v2jh1sdxTNZvpl+s7jsy9Is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LZT3ZjHBgOkF0Y8s/IRhSQHZkKUfge2xgy36/UxICMb/f0KNvepnMkduxDULF9VTK
	 OKdohOH3K5yPsqnAQVRhpZHe/QPDqMEw0jO28oKC30WzyUK0AT8LWixj2+jmegje3I
	 JxXGBAE7goqEX2iPWVjQR/zRFcnOpaRccpZekvZcOdsZ2j9x3HO+Tm2AIQIQzEBJ+k
	 g9rnWfoTplr7XbfompbKCEOpiKFQBVfEMRQTt/oOfgkjU94J7OzxHkqi+6JPVaWpVY
	 Pcw703GpXs2jwqYPQK/EF938FubMPtuJNE0CWRBotNFNXZ9N8lN6WmLFspIN3FKbxU
	 598JpCka3cVpA==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v8 2/6] dt-bindings: clock: spacemit: Add spacemit,k1-pll
Date: Wed, 16 Apr 2025 13:54:02 +0000
Message-ID: <20250416135406.16284-3-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416135406.16284-1-heylenay@4d2.org>
References: <20250416135406.16284-1-heylenay@4d2.org>
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
Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
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
index 0c5b9b5f6073..35968ae98246 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -6,6 +6,43 @@
 #ifndef _DT_BINDINGS_SPACEMIT_CCU_H_
 #define _DT_BINDINGS_SPACEMIT_CCU_H_
 
+/* APBS (PLL) clocks */
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

