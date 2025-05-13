Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254F71EB5E5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129818; cv=none; b=np+6awn+jTdE/VGnUsJ8iL9GxN4258jLU5i1IYJ+lADx0HSjJ2E6+C0r43QT1ptWzHChaT6JPmKgNvC3iAI39tcam2WLlOinqBnbTE1avDho4cWU8ui/l3DfZSxP3PfW8l0hQeGo+5cdQxMrHaDB+zQBkSbmpP/tczDECkuGgZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129818; c=relaxed/simple;
	bh=TUKwT3goQGW7BgcxvA/BGgnrg1MvnylmSbViGWkZyUE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFP0bB1E1HQSaXQTbVyA/BNFHdCgM31eMUl5g5ZGA1/iEA8VRZ0rvcZTCfpddIzzgloa6meifOphuQXmKJIF1uW3tA+gLEtITBzA6TewV+wU5hgBU+jhgZv1tPFh8O1t77jnuUFstTx+9AbX8jMYNyUgyGjIQ3s+EA0Zw1QDzYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 54D9nqRh044911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 17:49:52 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Tue, 13 May 2025
 17:49:51 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v3 6/9] dt-bindings: cache: add QiLai compatible to ax45mp
Date: Tue, 13 May 2025 17:49:30 +0800
Message-ID: <20250513094933.1631493-7-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513094933.1631493-1-ben717@andestech.com>
References: <20250513094933.1631493-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 54D9nqRh044911

Add a new compatible string for ax45mp-cache on QiLai SoC.

Also, add allOf constraints to enforce specific cache-sets and cache-size
values for each compatible string.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 .../cache/andestech,ax45mp-cache.yaml         | 52 +++++++++++++++++--
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index df8bba14f758..dc03ffae6c9f 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -28,7 +28,9 @@ select:
 properties:
   compatible:
     items:
-      - const: renesas,r9a07g043f-ax45mp-cache
+      - enum:
+          - andestech,qilai-ax45mp-cache
+          - renesas,r9a07g043f-ax45mp-cache
       - const: andestech,ax45mp-cache
       - const: cache
 
@@ -44,11 +46,9 @@ properties:
   cache-level:
     const: 2
 
-  cache-sets:
-    enum: [1024, 2048]
+  cache-sets: true
 
-  cache-size:
-    enum: [131072, 262144, 524288, 1048576, 2097152]
+  cache-size: true
 
   cache-unified: true
 
@@ -66,7 +66,49 @@ required:
   - cache-size
   - cache-unified
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: andestech,qilai-ax45mp-cache
+
+    then:
+      properties:
+        cache-sets:
+          const: 2048
+        cache-size:
+          const: 2097152
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g043f-ax45mp-cache
+
+    then:
+      properties:
+        cache-sets:
+          const: 1024
+        cache-size:
+          const: 262144
+
 examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    l2_cache: cache-controller@200000 {
+        compatible = "andestech,qilai-ax45mp-cache", "andestech,ax45mp-cache",
+                     "cache";
+        reg = <0x00200000 0x100000>;
+        interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+        cache-line-size = <64>;
+        cache-level = <2>;
+        cache-sets = <2048>;
+        cache-size = <2097152>;
+        cache-unified;
+    };
+
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
 
-- 
2.34.1

