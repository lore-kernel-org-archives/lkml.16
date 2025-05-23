Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA3220FAB9;
	Fri, 23 May 2025 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026238; cv=none; b=o17RqeTtg/SXmtW+mwuGNy7MS8xD7IfaxdDnJXs4mxdZyzTh4+fkGf5Cl/WcNNY020Bqri2hbYX9MlGO2JpE9odUq2EIYR7LOyj//5fjOzYX3sqUec+Gvh7itkuxlI+Uf+HYQRddqDNV5V5BSLLCI9xwaXbsbaEucL18kL8DVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026238; c=relaxed/simple;
	bh=QA73rvaOKDdkRbR0mEATLJpwnxRumJ+05v5c9UPizr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGcsXXdalpyT2PJWaI7ToYVYZa8Lf1Lkwuyqhc/Dcpm9wu5Rv2MoJb8DWlmYrvq7lUaRsQBWhBU/egYgrGFr3muCI9BegYLSbWAFFlH4n9+iBnExfRGqhGhDY/OXkv7kWvZ/R/OIn5r1ilKTk0yU0QU0TkAhIm7y8UfFL7El+t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TOoi4Mpz; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TOoi4Mpz"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4C9EDC0000D0;
	Fri, 23 May 2025 11:43:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4C9EDC0000D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1748025837;
	bh=QA73rvaOKDdkRbR0mEATLJpwnxRumJ+05v5c9UPizr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TOoi4MpzuVGtGYFH7WS0XceS6teuJY/AKcqMSXk+DyoRfux2ihJ0619CX1r/lQzZ5
	 e1t7fAra4nGYr1S2VfmEOhyWKTRxHOgwYOJWGmVf1Kvutjn8prx9jwqiDc+4DeGDim
	 zkz6z+mcX09+MOFZyt3hjfF3yZEBtOPUrrCqXKrU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 2A187180004FC;
	Fri, 23 May 2025 11:43:57 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: justin.chen@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 1/2] dt-bindings: memory-controller: Define fallback compatible
Date: Fri, 23 May 2025 11:43:53 -0700
Message-ID: <20250523184354.1249577-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
References: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the DDR controllers beyond revision b.2.1 have had a consistent
layout, therefore define a "brcm,brcmstb-memc-ddr-rev-b.2.x" fallback
compatible string to match them all rather than having to continuously
add to the list.

Link: https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../brcm,brcmstb-memc-ddr.yaml                | 51 +++++++++++--------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
index 4b072c879b02..f08eb69fde47 100644
--- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
@@ -11,25 +11,34 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - brcm,brcmstb-memc-ddr-rev-b.1.x
-          - brcm,brcmstb-memc-ddr-rev-b.2.0
-          - brcm,brcmstb-memc-ddr-rev-b.2.1
-          - brcm,brcmstb-memc-ddr-rev-b.2.2
-          - brcm,brcmstb-memc-ddr-rev-b.2.3
-          - brcm,brcmstb-memc-ddr-rev-b.2.5
-          - brcm,brcmstb-memc-ddr-rev-b.2.6
-          - brcm,brcmstb-memc-ddr-rev-b.2.7
-          - brcm,brcmstb-memc-ddr-rev-b.2.8
-          - brcm,brcmstb-memc-ddr-rev-b.3.0
-          - brcm,brcmstb-memc-ddr-rev-b.3.1
-          - brcm,brcmstb-memc-ddr-rev-c.1.0
-          - brcm,brcmstb-memc-ddr-rev-c.1.1
-          - brcm,brcmstb-memc-ddr-rev-c.1.2
-          - brcm,brcmstb-memc-ddr-rev-c.1.3
-          - brcm,brcmstb-memc-ddr-rev-c.1.4
-      - const: brcm,brcmstb-memc-ddr
+    oneOf:
+      - description: Revision 2.x controllers
+        items:
+          - enum:
+              - brcm,brcmstb-memc-ddr-rev-b.2.1
+              - brcm,brcmstb-memc-ddr-rev-b.2.2
+              - brcm,brcmstb-memc-ddr-rev-b.2.3
+              - brcm,brcmstb-memc-ddr-rev-b.2.5
+              - brcm,brcmstb-memc-ddr-rev-b.2.6
+              - brcm,brcmstb-memc-ddr-rev-b.2.7
+              - brcm,brcmstb-memc-ddr-rev-b.2.8
+              - brcm,brcmstb-memc-ddr-rev-b.3.0
+              - brcm,brcmstb-memc-ddr-rev-b.3.1
+              - brcm,brcmstb-memc-ddr-rev-c.1.0
+              - brcm,brcmstb-memc-ddr-rev-c.1.1
+              - brcm,brcmstb-memc-ddr-rev-c.1.2
+              - brcm,brcmstb-memc-ddr-rev-c.1.3
+              - brcm,brcmstb-memc-ddr-rev-c.1.4
+          - const: brcm,brcmstb-memc-ddr-rev-b.2.x
+          - const: brcm,brcmstb-memc-ddr
+      - description: Revision 2.0 controllers
+        items:
+          - const: brcm,brcmstb-memc-ddr-rev-b.2.0
+          - const: brcm,brcmstb-memc-ddr
+      - description: Revision 1.x controllers
+        items:
+          - const: brcm,brcmstb-memc-ddr-rev-b.1.x
+          - const: brcm,brcmstb-memc-ddr
 
   reg:
     maxItems: 1
@@ -46,7 +55,9 @@ additionalProperties: false
 examples:
   - |
     memory-controller@9902000 {
-        compatible = "brcm,brcmstb-memc-ddr-rev-c.1.1", "brcm,brcmstb-memc-ddr";
+        compatible = "brcm,brcmstb-memc-ddr-rev-c.1.1",
+                     "brcm,brcmstb-memc-ddr-rev-b.2.x",
+                     "brcm,brcmstb-memc-ddr";
         reg = <0x9902000 0x600>;
         clock-frequency = <2133000000>;
     };
-- 
2.43.0

