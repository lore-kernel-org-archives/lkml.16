Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE9F220F2F;
	Mon,  9 Jun 2025 21:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504680; cv=none; b=eKtfT+lgMs4czCDh9niR2yB4ryx9npmP0aFfigq9+sRmzbL3sHRq6oGL3j3rBklANtoPNUIgpAkvCg+aGLYHZl4yFe/Tu5Krxbd7smoF29YDMuGrAxRDsfv9EupBL2i07ghIABAeTTxQpqEQX+GDDi4FGrP7OAgpCfpOuNEjCDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504680; c=relaxed/simple;
	bh=siG3t5h5VI/vBQgaAeu+KAIZnYD30RwbGz60qGNfCG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVNiZJ7apR2jYIt3zMwLZmBm2zHVL+euIE1KBlf10URCKkGMwk8QD5/v4SGQGaw7v4f+JgLSTmtaAwuEO8y8BdKk18qIIlp68SdywaoddHhQ+p5M/vdPbDbzAZJMB1Ke2FveSvlF+MIk3vbFxWUKAcfXnJGRXSHHr0exT6qp32c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=kFl3RpCb; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="kFl3RpCb"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 94DF8C000320;
	Mon,  9 Jun 2025 14:23:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 94DF8C000320
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1749504193;
	bh=siG3t5h5VI/vBQgaAeu+KAIZnYD30RwbGz60qGNfCG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kFl3RpCbWaRqC2pY0b+rw6E2shSaIF4eRTIO6zVbjFUz4hA/kJfOt1SfTXkVbzjlL
	 1NgVl/JfkF56q/xMcDYzo7EPauESG6Ssj0KZdvXeHRvjD4nY33s+IKEQwz94ESqluu
	 KP6yZz8veLgC/YcAJjxzTV/iaE/PGN/U+csJeMzk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 75C5418000847;
	Mon,  9 Jun 2025 14:23:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.orgg
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 1/2] dt-bindings: memory-controller: Define fallback compatible
Date: Mon,  9 Jun 2025 14:23:10 -0700
Message-ID: <20250609212311.2264108-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609212311.2264108-1-florian.fainelli@broadcom.com>
References: <20250609212311.2264108-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the DDR controllers beyond revision b.2.1 have had a consistent
layout, therefore define a "brcm,brcmstb-memc-ddr-rev-b.2.1" fallback
compatible string to match them all rather than having to continuously
add to the list.

Link: https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../brcm,brcmstb-memc-ddr.yaml                | 54 ++++++++++++-------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
index 4b072c879b02..b935894bd4fc 100644
--- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
@@ -11,25 +11,37 @@ maintainers:
 
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
+      - description: Revision > 2.1 controllers
+        items:
+          - enum:
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
+          - const: brcm,brcmstb-memc-ddr-rev-b.2.1
+          - const: brcm,brcmstb-memc-ddr
+      - description: Revision 2.1 controllers
+        items:
+          - const: brcm,brcmstb-memc-ddr-rev-b.2.1
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
@@ -46,7 +58,9 @@ additionalProperties: false
 examples:
   - |
     memory-controller@9902000 {
-        compatible = "brcm,brcmstb-memc-ddr-rev-c.1.1", "brcm,brcmstb-memc-ddr";
+        compatible = "brcm,brcmstb-memc-ddr-rev-c.1.1",
+                     "brcm,brcmstb-memc-ddr-rev-b.2.1",
+                     "brcm,brcmstb-memc-ddr";
         reg = <0x9902000 0x600>;
         clock-frequency = <2133000000>;
     };
-- 
2.43.0

