Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682424F5BB;
	Mon, 10 Feb 2025 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205950; cv=none; b=Sz8w+9/by/EsbM99Q2Fl6jBrOxmPKyFi19AkjVMHWWGFyzDkKr5gT0Er356U2fkL7ZjNjN6Al8mo8CP+7b+HmPYw2w6pWzmPbTK/fP4z9YI5iCne+1btEHkClsEalGsFKTiHqyz6/nEt9RyfXG90AP4MHfF3Iti+nI6Y105sryE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205950; c=relaxed/simple;
	bh=GMFw1/abymd1ov05uZwkd1yWlJK+I5N0ohjbO8CqvMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GM59R99g6eoq2ZDw1Z33wI7ggHHg3dcObJQN/P7zN/63O+aBPu3iVMGowj4L1BkWdzEHSKSqBgDQt99kgYK3zPadKp5HRegAJN+ytWdnuDYaAkDVXwW394hgWMGWIQ18lh3D6MC+crdzNyJFl5koa2A+3aMG5FjgDbRJuoLLRaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=mt+s6AcA; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="mt+s6AcA"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD53C1480320;
	Mon, 10 Feb 2025 17:45:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxVraOdaNDoa+gL84QMf+jc4LDKQyFyDdKOVrhJTQNU=;
	b=mt+s6AcAI14JX3eZwDjERM8NyrjFx+5WuXH238XMXaxWVLeZ7DgMKY7ipf84kiRGqCHUJi
	FERQ3cjmDy1cnVGCXBATXKBXaj/gaqnP3i5QsqYOAaRVbrOh+8Sn6ZmApR6hz9xwmuNdAb
	8Zbd8cfM2P3eZV3jOW3+snM/g1cyh5HCe6WSd/+3QtONJnaIErcHgbVCuf5jWBscMhyScU
	wIiMN1/BRmIbINqqmb/sDMHFlOunGmcw7M5d5cuNxRTin1TdNzTQywB4PX/ols3QFOki04
	/axBkI/mbF5FKp/5mGgLUQwnbACzIyP/2QVIUO/YHUiGtGDGdq1CuYfDPbV31A==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 08/16] dt-bindings: nvmem: microchip-otpc: Add required clocks
Date: Mon, 10 Feb 2025 17:44:58 +0100
Message-Id: <20250210164506.495747-9-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The OTPC requires both the peripheral clock through PMC and the main RC
oscillator.  Seemed to work without explicitly enabling those clocks on
sama7g5 before, but did not on sam9x60.

Older datasheets were not clear and explicit about this, but recent are,
e.g. SAMA7G5 series datasheet (DS60001765B),
section 30.4.1 Power Management:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - new patch, not present in v1

 .../nvmem/microchip,sama7g5-otpc.yaml         | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index 9a7aaf64eef32..1fa40610888f3 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -29,6 +29,16 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: main rc oscillator
+      - description: otpc peripheral clock
+
+  clock-names:
+    items:
+      - const: main_rc_osc
+      - const: otpc_clk
+
 required:
   - compatible
   - reg
@@ -37,6 +47,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
     #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
 
     otpc: efuse@e8c00000 {
@@ -44,10 +56,26 @@ examples:
         reg = <0xe8c00000 0xec>;
         #address-cells = <1>;
         #size-cells = <1>;
+        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
+        clock-names = "main_rc_osc", "otpc_clk";
 
         temperature_calib: calib@1 {
             reg = <OTP_PKT(1) 76>;
         };
     };
 
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/microchip,sam9x60-pmc.h>
+    #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
+
+    efuse@eff00000 {
+        compatible = "microchip,sam9x60-otpc", "syscon";
+        reg = <0xeff00000 0xec>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
+        clock-names = "main_rc_osc", "otpc_clk";
+    };
+
 ...
-- 
2.39.5

