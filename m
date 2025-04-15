Received: from mail-m49234.qiye.163.com (mail-m49234.qiye.163.com [45.254.49.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9312227A119;
	Tue, 15 Apr 2025 10:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713137; cv=none; b=RoWDKGL+H3//yGBEXQJufa9Gp2lOSAvMe5+N4qTHGQs9YinhDUcqHf7SN5+sc3GY+B5wcGwW5MaFBwhI4fT9OUewY5rGXPK7RDjKjolzPbP69B90uAS+edCiy682ltKsPt+TjhIbYFZhKzNr+fkF30pQIt/E6xU9NFXfUILfc1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713137; c=relaxed/simple;
	bh=pHjveY6KoURnQuwE5Fd0lcHQLQ3u3khaDsZ0Fw6YzOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bUPLntsTTi4zCy8saExqVIf0IezFvqbeyNZhfrwr9X2pS1I4E/gmiy79LaiNukQBQ0qis2gJzelj5WuyUPuygmsK39epdHJK/vguECRKAMQXQcKRfAgk/l7Y0XoY2fyWcgcLft9OucVSOl59msKVlkyozyBtQ3zDW/fiLuf2zPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Fpvav24r; arc=none smtp.client-ip=45.254.49.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Fpvav24r"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11f2f600c;
	Tue, 15 Apr 2025 18:32:07 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: nvmem: rockchip,otp: Add support for rk3562 and rk3568
Date: Tue, 15 Apr 2025 18:32:01 +0800
Message-Id: <20250415103203.82972-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415103203.82972-1-kever.yang@rock-chips.com>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0xIVkkeGkhDTEMdSkIYGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a963901956e03afkunm11f2f600c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PVE6PRw*NzJRMBgIMh4dIi4w
	GgpPCiJVSlVKTE9PTEpISklDQklDVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUhNTU43Bg++
DKIM-Signature:a=rsa-sha256;
	b=Fpvav24r00q9fYbGPkYAhH/bkoQv1u1vQmhEWGHRQNhoex6kebUG3A5krHs2i2h3fOqORNA6vqk3FqWVIAZbfmLkhzl6y/o+57CdlQgp/2FV4Bdn3tFyQDgB0e8PCWYxSQfY3QrqyNm1ytP5ozwjq0Ghp04uvIoTNLqI11gjDo4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=iiNUR2t26Uu7+OW1iXl8pE11P0d1ljLW8CEOcUnql5c=;
	h=date:mime-version:subject:message-id:from;

Add compatible entry for the otp controller in rk3562 and rk3568, add schema
for different clock names for new entry.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3:
- update the clock name from "usr" to "otp" and re-order to sync with
 other soc.

Changes in v2:
- Update the commit message and add maxItems in schema.

 .../bindings/nvmem/rockchip,otp.yaml          | 53 ++++++++++++++++---
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..8b257662f282 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - rockchip,px30-otp
       - rockchip,rk3308-otp
+      - rockchip,rk3562-otp
+      - rockchip,rk3568-otp
       - rockchip,rk3588-otp
 
   reg:
@@ -25,19 +27,15 @@ properties:
 
   clock-names:
     minItems: 3
-    items:
-      - const: otp
-      - const: apb_pclk
-      - const: phy
-      - const: arb
+    maxItems: 4
 
   resets:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   reset-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
 required:
   - compatible
@@ -62,12 +60,45 @@ allOf:
       properties:
         clocks:
           maxItems: 3
+        clock-names:
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
         resets:
           maxItems: 1
         reset-names:
           items:
             - const: phy
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3562-otp
+              - rockchip,rk3568-otp
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
+            - const: sbpi
+        resets:
+          minItems: 4
+          maxItems: 4
+        reset-names:
+          items:
+            - const: otp
+            - const: apb
+            - const: phy
+            - const: sbpi
+
   - if:
       properties:
         compatible:
@@ -78,8 +109,16 @@ allOf:
       properties:
         clocks:
           minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
+            - const: arb
         resets:
           minItems: 3
+          maxItems: 3
         reset-names:
           items:
             - const: otp
-- 
2.25.1

