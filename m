Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC5198E75;
	Tue, 13 May 2025 01:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101178; cv=none; b=YcyqO+19gpIkb4m6j1Hw8tZS6f9kpCqFmHDOLvXCGvmeu5TZIT8rh0mBg/b02KaPzdkW/6jHgoBEC6hmtRBXWLi6d8ts+z3bmDh+58IQO3s11fodDatxoEVpuQexINGrqDfjnYCfy4Qx0RP/6bAd1gisTWPdsJvEC+gq7Ou92VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101178; c=relaxed/simple;
	bh=jl/FpWQhL2KmC31Y5BDsKgeO6wFNGMuLkMZGebpnU/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yp4jqIJg5ccoNgSmsM/wAjiacMrZEzAc2bWbG444Qjd1w+KhwAe3oQ9lhOYozRJhPpB+fxlLxZuhQAalW9rWedOzX8TX1+CAgwKdQKqzJROgp6KjfU+P6mfZqUFaiyvp7AUNdRQUUz2XwZ+lPD/7hSfAcbimHpEtMvzNYK6hpxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cE3EIW0B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cE3EIW0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0950EC4CEE7;
	Tue, 13 May 2025 01:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747101178;
	bh=jl/FpWQhL2KmC31Y5BDsKgeO6wFNGMuLkMZGebpnU/M=;
	h=From:To:Cc:Subject:Date:From;
	b=cE3EIW0BqvPNDsfp24kOaMLFHkRtLv7TzDGf15McrxFXxyd5HeeKqO1m1nrX7FTCM
	 4jmNJVzQpIO4zj8S5dYkBdb/Mjx4D7CN5lxdoMp9Ld3KVYRfGvWZpsATTRrOnxzaJi
	 Rq2LDiCEYBwAz+y2JUDCkxIA2iGLtrvVDA2bolK/pMuQFtNqIdpkYMjF3ilETiuen4
	 FNOUN4xjov0+H+4Hl7ORdnSmwcCDBSVqY47ATbbyfjNfqIYQL0toX8KZq6cJI76bqK
	 5POBpHFx9727PFIU0qd08v4qXx7g6txZhkA3+Uzqwhe2bAiLbgaTbdDGvWvwEZzI+L
	 S3xRbnkE8MDfA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: cache: Convert marvell,{feroceon,kirkwood}-cache to DT schema
Date: Mon, 12 May 2025 20:52:51 -0500
Message-ID: <20250513015252.1049409-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Feroceon/Kirkwood Cache binding to DT schema format.

Use "marvell,kirkwood-cache" for the filename instead as that's only
compatible used in a .dts upstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/cache/marvell,feroceon-cache.txt | 16 -------
 .../cache/marvell,kirkwood-cache.yaml         | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/cache/marvell,feroceon-cache.txt
 create mode 100644 Documentation/devicetree/bindings/cache/marvell,kirkwood-cache.yaml

diff --git a/Documentation/devicetree/bindings/cache/marvell,feroceon-cache.txt b/Documentation/devicetree/bindings/cache/marvell,feroceon-cache.txt
deleted file mode 100644
index 0d244b999d10..000000000000
--- a/Documentation/devicetree/bindings/cache/marvell,feroceon-cache.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-* Marvell Feroceon Cache
-
-Required properties:
-- compatible : Should be either "marvell,feroceon-cache" or
-  	       "marvell,kirkwood-cache".
-
-Optional properties:
-- reg        : Address of the L2 cache control register. Mandatory for
-  	       "marvell,kirkwood-cache", not used by "marvell,feroceon-cache"
-
-
-Example:
-		l2: l2-cache@20128 {
-			compatible = "marvell,kirkwood-cache";
-			reg = <0x20128 0x4>;
-		};
diff --git a/Documentation/devicetree/bindings/cache/marvell,kirkwood-cache.yaml b/Documentation/devicetree/bindings/cache/marvell,kirkwood-cache.yaml
new file mode 100644
index 000000000000..2bfa3c29f6a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/marvell,kirkwood-cache.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cache/marvell,kirkwood-cache.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Feroceon/Kirkwood Cache
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - marvell,feroceon-cache
+      - marvell,kirkwood-cache
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: marvell,kirkwood-cache
+    then:
+      required:
+        - reg
+    else:
+      properties:
+        reg: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    l2-cache@20128 {
+        compatible = "marvell,kirkwood-cache";
+        reg = <0x20128 0x4>;
+    };
-- 
2.47.2

