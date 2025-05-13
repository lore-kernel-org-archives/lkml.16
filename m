Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E1A19E98A;
	Tue, 13 May 2025 01:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101188; cv=none; b=mfyqsD9aDSQc7tNdU41xEkQ1snXb/IlaBPoRjHV45IHOrEUdd+Y2mcvXlAO+B6vRXs38GJMhB3jeY+BMGe8O90ZHHA7V7Wo0ZKS0BCK+5x6WZzUuwtES1Mdi2/XDgxynu8e42JyzwWnwudXY4EbSmOFH37VpoG8fJGjTayGJT+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101188; c=relaxed/simple;
	bh=xH/n1xylllnKSsp2fCcJP15uxmoPNM6MP+NC2ALHIO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AQNffy0NHpMXZDdibt+HiWFbGfPR0KNokpQ8DWM23w7+5j+xp/HOA7bzu+nRKdRvYHUvwoJsHtqHyWKd1H6lGogp8WXGfPN5GMlc8iKTYW33ThkkVZvJUeGL1MxZ1XQ1DL9cq0Ffs/buQOKzVHpem4J6E/jT/pSLjiP0viX9Ed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7MWu5Mq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7MWu5Mq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8D2C4CEE7;
	Tue, 13 May 2025 01:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747101188;
	bh=xH/n1xylllnKSsp2fCcJP15uxmoPNM6MP+NC2ALHIO4=;
	h=From:To:Cc:Subject:Date:From;
	b=m7MWu5MqHjXeXf5EyRDnfEYieQSoSE4dENyjF+CsD8c1qCaNswduGhHaQA8QiA8sU
	 keAlP7aunUEG4b2r2wkkm2iV83RjTRZxW64OoGtAe1QNY8NKb1SzI0xKQZk8X0EJB2
	 QPDAu06IdJfnGxb+l6s7otvRyFM8kKtz0MJuhAOVMht1ICmm2G533IPUDDuPezzPWp
	 hygfpVgptZTzqea4DWMifZt8SL5lmy8dK/dMi2ob+rMftfNJVxi1nctJk+gxrwvWUm
	 YiljHua3dtU4nPiB2Nc9kDZZwATG8aTyQfWPTfi7hTnsMxZDg7778HN56JJ+gDzjqy
	 V03b+rOcqjSqg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: cache: Convert marvell,tauros2-cache to DT schema
Date: Mon, 12 May 2025 20:53:01 -0500
Message-ID: <20250513015302.1049682-1-robh@kernel.org>
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
 .../bindings/cache/marvell,tauros2-cache.txt  | 17 --------
 .../bindings/cache/marvell,tauros2-cache.yaml | 39 +++++++++++++++++++
 2 files changed, 39 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/cache/marvell,tauros2-cache.txt
 create mode 100644 Documentation/devicetree/bindings/cache/marvell,tauros2-cache.yaml

diff --git a/Documentation/devicetree/bindings/cache/marvell,tauros2-cache.txt b/Documentation/devicetree/bindings/cache/marvell,tauros2-cache.txt
deleted file mode 100644
index 31af1cbb60bd..000000000000
--- a/Documentation/devicetree/bindings/cache/marvell,tauros2-cache.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Marvell Tauros2 Cache
-
-Required properties:
-- compatible : Should be "marvell,tauros2-cache".
-- marvell,tauros2-cache-features : Specify the features supported for the
-  tauros2 cache.
-  The features including
-    CACHE_TAUROS2_PREFETCH_ON       (1 << 0)
-    CACHE_TAUROS2_LINEFILL_BURST8   (1 << 1)
-  The definition can be found at
-  arch/arm/include/asm/hardware/cache-tauros2.h
-
-Example:
-	L2: l2-cache {
-		compatible = "marvell,tauros2-cache";
-		marvell,tauros2-cache-features = <0x3>;
-	};
diff --git a/Documentation/devicetree/bindings/cache/marvell,tauros2-cache.yaml b/Documentation/devicetree/bindings/cache/marvell,tauros2-cache.yaml
new file mode 100644
index 000000000000..9f7f0d031631
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/marvell,tauros2-cache.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cache/marvell,tauros2-cache.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Tauros2 Cache
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    const: marvell,tauros2-cache
+
+  marvell,tauros2-cache-features:
+    description: >
+      Specify the features supported for the tauros2 cache. The features include:
+
+        - CACHE_TAUROS2_PREFETCH_ON (1 << 0)
+        - CACHE_TAUROS2_LINEFILL_BURST8 (1 << 1)
+
+      The definition can be found at arch/arm/include/asm/hardware/cache-tauros2.h
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 0x3
+
+required:
+  - compatible
+  - marvell,tauros2-cache-features
+
+additionalProperties: false
+
+examples:
+  - |
+    l2-cache {
+        compatible = "marvell,tauros2-cache";
+        marvell,tauros2-cache-features = <0x3>;
+    };
-- 
2.47.2

