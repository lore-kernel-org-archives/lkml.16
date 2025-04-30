Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F41F03FB;
	Wed, 30 Apr 2025 07:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996841; cv=none; b=P2cP30PKQaDf374ZvzXblZLfFE495141nJRu3OiR+b9LHv7BGR9FfeNLtsEeJ7x1o0AcDEuAJS8LAyNwhbxsBioTuTxeTsGc/NSLPcW4V2DsAP3PpguEhw8GtbEH3zGC+eKqV4LK2coradj7UJgxguUyUFEuGHga9U2MpGUJ8fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996841; c=relaxed/simple;
	bh=C0axKSujZ/Zy3i7sWIyGn35sKk7Z8FY2faVK4kpx4RQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h008YDYbZR6bykV/gu0U3I2GC65BkU/4xqnZn0opUtGIhRAhLgWK7O0P/hf1Pb+vhUzTbLlK8LegxHr+rFKeKGisH0MulK7Uw/x+1Id2D1vRAOkUIhcmRj+BbTxg5nkab/Ji2IX2OI/0zLhSsb6wjhCK8WXaYK5LZmQtTBMLFYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvtHAanR; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvtHAanR"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso10688198a12.0;
        Wed, 30 Apr 2025 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996837; x=1746601637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsdoJSin8peETgUZX/EH4A7o3cuAiQtJzSEsM3DCxTg=;
        b=JvtHAanRCWfzFUU1hRuMkYmccn38GfaYhEP9kpTegDWZMqjrrxgpHJUlleDps9R4Gn
         balwnTjavsX5SMzJ2mIp+Ei/uJJ0bDP6NN6tjR0a+8n2m0Nynh7olm8/sih50NXa5Ckc
         zZnHZIhOS1umkirTlFr2tMW0qtmAD/NKK03AY6ETE3by5HtRkhJF1bgAXFKiYNIw0H7H
         hgjbRo69WwXOmgfTk4PC8jhE3Mqg+U19ukmn1F19ooccp8F6dEq566EDf7F9Fr+wKnKN
         tQeDforEJAfaL5E7cPVaLeUHnraSgbX5rTSDJqyfw1oWzS4A1JskywBLdgvO4VYBe2uu
         xP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996837; x=1746601637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsdoJSin8peETgUZX/EH4A7o3cuAiQtJzSEsM3DCxTg=;
        b=MvEa9khqa5FXMF+vHdQE22sy8NQQ4aZTvNd95iNVKDgWP49AFB/+3KR3vuud64WwpM
         eNftDGwVY5eYC4uzE0aNG88DlqdiMtR+KxzGd71h5eYlZGuPvWscOorA4UQLdq8jZTyE
         DLDIl1raNWWLQwHwhvECi/uv4iT6PJVuAAcq8lqDah4SZ2Bgk19TIZcfmL9Cblmp2BM1
         E6bzSvqTLQXW5QrNRh+m2s1qbanu+tmFUDg/j7g+uV1KyOWfDQI+SI2rwmARxpfggtZb
         84Gv4/kZkHsXhGXA6aey0qDvH4PTWoo/O72CDN5c7N0OC8J3FBI6VdYH5m7+A5gxm2Ef
         oaxw==
X-Forwarded-Encrypted: i=1; AJvYcCVqX3UDJ8/FgsnR88b6i5oUwfXV7Bota7Yy6Th4GPzbJiV3TQ38mrBTOkqSgSs+KR4Ml0OkNsiRRF3M@vger.kernel.org, AJvYcCW421+7AG4VhLadjrhctNlMxi09KXSwUFf/Y8WoaYCCthqPLXlBWhUoEclJHkG+kaP0/HBjmH5WxKbMistk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2kNiohfbr1r3ZMtu48q/bGyBj+VcDEfjMq5o/NbAfG3Jh3qXH
	NQMZMuvG+wMO+vYv8FzgkwmOSQucsWlR2YzIbwdPuf0u8ucAZbUE
X-Gm-Gg: ASbGncuDr++d2x+r2uY7EIXEKc4HQuaUIEgPaJmddHyNvOKfpkWAoMtUyvrRTNuaoit
	f5fhAjer0ayUH/KkQIKHQbPYzgtyrA9SAydE1oRs3s2TQvBIA18oa1zUUPFLUJMDAmhyfWYX6Kt
	p+4uP3R2jiNHy2GRz7sB0MVDxp3IXK5sxhJxT02TsUUfD6IJLafXXKhKWrF0ibfx48PPTotLx0l
	4FM9iRD9NaDNlvwXrVMqy/r+wN5gda83LvG5GeYAenU2AMBK4JIsuCHJ+giuCe8jREuLEpbH1R2
	KtarsUezDnMI88IJrZxSPOsu4TNsVExtOuUrjR2ifpXNkEr2QomzZbRFTBvArAvpJcNkgCc2Gpy
	RE84Q3t4D/HXcSjNxzHT8kA==
X-Google-Smtp-Source: AGHT+IH7C3G6uB8DnhJutIPeMwYVSq5CWSioYsidNZcpPZr8cTBg9evZWDUTGYfQNanBPXB4XkSYMQ==
X-Received: by 2002:a05:6402:50c8:b0:5f5:f890:3dd5 with SMTP id 4fb4d7f45d1cf-5f89b254ac1mr1398704a12.15.1745996836582;
        Wed, 30 Apr 2025 00:07:16 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:16 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:06 +0200
Subject: [PATCH v8 2/9] dt-bindings: mfd: brcm,bcm59056: Add compatible for
 BCM59054
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-2-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=4488;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=C0axKSujZ/Zy3i7sWIyGn35sKk7Z8FY2faVK4kpx4RQ=;
 b=ZjctfsXHvdz8eCGR8T1uMb9UeGC0Dtwn8c4b/zVMbMkqpVQdFUZo85lGKSMxyKnvJ3f+6tKV7
 NZhT5i8hmMjCYU2eQJV+z92eomdu6uKk5snBgSNrjU5BIAvwB/BH56d
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The BCM59054 MFD is fairly similar to the BCM59056, and will use
the same driver. Add compatible and specify the allowed regulator
nodes.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Replace mfd/brcm,bcm590xx.yaml with mfd/brcm,bcm59056.yaml

Changes in v5:
- Replace mfd/brcm,bcm59056.yaml with mfd/brcm,bcm590xx.yaml in
  regulator bindings description

Changes in v4:
- Fix yamllint errors (missing unevaluatedProperties)
- Drop comment with regulator name list
- Use full schema paths for $reg
- Change description of regulator binding to mention BCM59054
  explicitly
- Drop quotes around vbus reg name
- Change "Power Management IC" to "Power Management Unit" to match
  official Broadcom naming

Note that I did not end up moving the regulator refs from
allOf compatible matches; I explained my reasoning in [1].

[1] https://lore.kernel.org/lkml/ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com/

Changes in v3:
- Split regulator node into separate file
- Removed quotes around compatible
---
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 26 +++++++++-
 .../bindings/regulator/brcm,bcm59054.yaml          | 56 ++++++++++++++++++++++
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
index b387ef9885c3ac524e0782545dbca9c0e81a556c..b67d7a723fc242869e5bdc6b3602785f62af45bd 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm59056
+    enum:
+      - brcm,bcm59054
+      - brcm,bcm59056
 
   reg:
     maxItems: 1
@@ -21,7 +23,6 @@ properties:
 
   regulators:
     type: object
-    $ref: /schemas/regulator/brcm,bcm59056.yaml#
 
 required:
   - compatible
@@ -30,6 +31,27 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm59054
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/brcm,bcm59054.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm59056
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/brcm,bcm59056.yaml#
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5b46d7fca05e21aa1eae991b5f9f60b444f20c1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/brcm,bcm59054.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM59054 Power Management Unit regulators
+
+description: |
+  This is a part of device tree bindings for the BCM59054 power
+  management unit.
+
+  See Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
+  additional information and example.
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+patternProperties:
+  "^(cam|sim|mmc)ldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(rf|sd|sdx|aud|mic|usb|vib|tcx)ldo$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(c|mm|v)sr$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(io|sd)sr[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^gpldo[1-3]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^lvldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+properties:
+  vbus:
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false

-- 
2.49.0

