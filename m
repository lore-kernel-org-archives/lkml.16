Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F401F1F1309;
	Fri, 31 Jan 2025 18:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738347240; cv=none; b=uciH/1EOozSmO3KNhhzhf5xocgEvZW9U0zehZvIPu2xccK6JOsQWJdOekc67txuUP1FMQPltgfNCzDw1Ipk3vbHfCHxis6wWbd/3tAiYy6Zkn21DRy8TwF+rtAtj/OTuITADEWGbDNW+3ownylnGo4FIhhzboirysA27B/QDKpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738347240; c=relaxed/simple;
	bh=OZ9dPuuxBTKP3Wt2se5BJr4wjcpa5aP2mHso7Suck2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dmsubUbgcF872hwtSYpMwF7TFKMFG4eH3kd2AnRD3uKT4pBFbybtYLEghNAADxZc2YRPlpypjOtfO3Hq0IzV/j5KUMjN+zxRyedkrtZCWOoli/IPFKvIoUGnP5gsAu32XPfL+lJvebpmq3kgmcaZ25tcCq/6NS8sPmUtLZXi4X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeM1we9p; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeM1we9p"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso4308690a12.1;
        Fri, 31 Jan 2025 10:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347237; x=1738952037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+pPKfqXieDOQM2ayfee2XUul8g+kNgXcNPv52SLqjM=;
        b=WeM1we9p3eITPajP3m6OgJAZQmPE8miaaBfJQnp9VL89iGUxK9xxJr0TzovW9W4+0H
         1ifqwoTHuCcRud8XULAghVdZgxU7NdsjcY2bzjXq4CSPikuB3/yh4zxkC8LnIT/NgtdU
         Ke48AWynM1/k0F7/Fg/ckcD/9z+IQAMVUMpt+1JQji7kTdxgDnkK1EXU5aUG5MtnVLRr
         zPJWf4be/YcLeThJF/rgrlLhG7eilc4I4YsfUToB13ol8nr0qcbwHhpTOwyXEgcdkbNe
         MluQYPED6j6sK707F+tqE1EuyVvJZP2DCXneMWu2P5fuZrY2mRZUnOQTc0h41nQj0FhB
         oU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347237; x=1738952037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+pPKfqXieDOQM2ayfee2XUul8g+kNgXcNPv52SLqjM=;
        b=WqeLtEEi5fmazE63XiIV4ulANkj5HpqLp7/72EWeMmMSBc9/4qcrZgiNn2Y17pLH+6
         +8z9NxTSiZqGGH9cZ4v3ufaiJaFgKSJ/ZPuBQv/huIBOvheFLH5TW9HiLafm63WFg5bz
         dWR4zpGj+o1TnkZSwYMOxV5cHJm1N/IgRxmwTwbWDGi0VTKsezSreWtGqp29FfLXbpHZ
         V5G0Sh/RYiu3QeEgwFFfDmcuuV9arI++mEbxMrgl3uniYnQ8OgjqWmoasNCuVsfFeLhd
         cqL3CBemoclneh2wW0uGCND6Vj1GQksHCXmLmcxXODjd+NSMi03g/M9JnPP3WPG/jjnt
         cDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHrS0AhoCr4tM1x5zPWGmLuD+tn1P6N7uI4ynzrVdqL3RDiFA3mu3RSpKUSI4hqnN0jhoh9fqfEjTu@vger.kernel.org, AJvYcCX3UnBWXu+8gErvbcjy4IBsSwmKfJGFEd8zv6gEFnnxNGjW8ClvspAo6P0QkfXTQWrRA2P6zBG+q573JmJ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/t0/Er2rAEzcVZBkWXn+hkRxuyMXSdpFdOYJIAzht0b9ZdQCD
	ehxHAH07vG41I8ZOsB88xjbC8lBpNhyL4qVq9dihaIo6HOb7KOKGq+g08w==
X-Gm-Gg: ASbGnct1Qj/0rAhMfikrSfU6Q4K2UQdzwWAMfpecqS0Jpnq3A9HUPl63nsd9EuodPc7
	PySEFaIuQO7i+2LG/FQnCegClSnQsfwwR1/TW68+beEkSYT8XH3et7iWJ9S9XzwAOCa6OwS81Wc
	2Oyk0F/QRKz/b3TVVkRO2mzcDVfMQW/STRa7HSUoM0khMADJPu7mx/ENLJ+vZQ/sMXmXcg0PUl3
	ONc7vlVigljtNsyVpfQ1FTTq1o5bJuI3IGLfSLr2slfTMIZwozidBj+2JuEmVmhr0c/WS/OBMAG
	6H9J/V2mdKb6m8gZNnbrlJ8E1LijZ49foxKcNYRj95zsJMJ59H01pcju0tMAhA==
X-Google-Smtp-Source: AGHT+IFtTQye6C3PynwMaQIyS58K2Z5A6uetfs4VIhAtqWyYJRvYEwXPz0AnJMxAM7WDcKCtun4YpQ==
X-Received: by 2002:a05:6402:354a:b0:5d3:eb50:4e33 with SMTP id 4fb4d7f45d1cf-5dc7fbb5845mr5223948a12.5.1738347237063;
        Fri, 31 Jan 2025 10:13:57 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:13:56 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 31 Jan 2025 19:13:50 +0100
Subject: [PATCH v3 2/7] dt-bindings: mfd: brcm,bcm59056: Add compatible for
 BCM59054
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=3753;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=OZ9dPuuxBTKP3Wt2se5BJr4wjcpa5aP2mHso7Suck2o=;
 b=sqaHEVnsUFrd0UYoHhD18OH9xeCEUeiPUJ+MowEyl9X/4ehA8iO40GJsD7V1cKqk2u2x9y2Xs
 lj0TeVO3mrzBXZ+b9IySsXfgeTaE+S4Mt/Jd6wNhdheDaNvKl3KjfZv
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The BCM59054 MFD is fairly similar to the BCM59056, and will use
the same driver. Add compatible and specify the allowed regulator
nodes.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Split regulator node into separate file
- Removed quotes around compatible
---
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 26 +++++++++-
 .../bindings/regulator/brcm,bcm59054.yaml          | 55 ++++++++++++++++++++++
 2 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
index 3296799eb452fca2a4b03699fcb5aa27005a8e8d..87d663416ed9e7f5ec4aa25c1aa2d9e650c42e2c 100644
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
@@ -22,7 +24,6 @@ properties:
   regulators:
     type: object
     description: Container node for regulators.
-    $ref: ../regulator/brcm,bcm59056.yaml
 
 required:
   - compatible
@@ -31,6 +32,27 @@ required:
 
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
+          $ref: ../regulator/brcm,bcm59054.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm59056
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/brcm,bcm59056.yaml
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..719621c7f0e71cd9368f4d7243c79aaa97ca7255
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/brcm,bcm59054.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM59054 Power Management IC regulators
+
+description: |
+  This is a part of device tree bindings for the BCM590XX family of power
+  management ICs.
+
+  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
+  additional information and example.
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+# The valid regulator node names for BCM59054 are:
+#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
+#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
+#   csr, iosr1, iosr2, mmsr, sdsr1, sdsr2, vsr,
+#   gpldo1, gpldo2, gpldo3, tcxldo, lvldo1, lvldo2
+
+patternProperties:
+  "^(cam|sim|mmc)ldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+  "^(rf|sd|sdx|aud|mic|usb|vib|tcx)ldo$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+  "^(c|mm|v)sr$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+  "^(io|sd)sr[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+  "^gpldo[1-3]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+  "^lvldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+properties:
+  "vbus":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+additionalProperties: false

-- 
2.48.1

