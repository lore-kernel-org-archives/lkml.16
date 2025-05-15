Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3969170A26;
	Thu, 15 May 2025 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318600; cv=none; b=KGLmC3J4xUXIedbVTtbCdKRKIm3Z0m/voVqo997jLFG8ZwsvmyXTAOwA+qZXsau8aTe1yNg+CiuVYkPJYLxQi+gNTMg0A9P5Xb2YIM/9y/AywU0NozPUiSi5cC9fUF5vt07Cq4F7LfkUGMnve8fUeaZTXZCS3jkcMSURO+pbM9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318600; c=relaxed/simple;
	bh=pl2HEbe+CyuHOD3OyLZCSAaiFxQmceMkPEwlgJ22HCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CpSYlHyZU+Ui20Fq2IZRJHNbiP4kjSemJ0IFebVk+0QXv9Ix0m1KiQjKlYnG4oPqbU2fsGhw8e+d7Xi1l3Ed9kPb/3AedPr3Rox+6tHtT/qngAyeKUqtW+pesQY8mSCtZ/fI4tIhbaeXuE2KR64kTfXN3HWJSJRNnyu8yaHxNzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0lThGq9; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0lThGq9"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acae7e7587dso152780866b.2;
        Thu, 15 May 2025 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318597; x=1747923397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUAKfGSHAephwzkvvqYScDjeaSuBh+AeZg+JkcSpqSc=;
        b=Q0lThGq9qejMd+dhm27YDDtR48pNHVfa38O1mEBpOWimm9BLZFzEe2S4EyeBkts2V9
         XS/BaXb5+ORUosScpG7GHPEoGNon+vXG4PpEOIsORiK4oPOpqfwfdihy2BLBWdQ54MHf
         zhJ/7u3OmKfbQcQbfAm8KX7ZRCeNmq+FTW8PtRUpXWNnES7183iK/n51eCcVBihb32o8
         q5DSyc1XJIO6dNQYJZ/2yNNcinTF7m9ppkHp+UkJ1LA6QW9j+ynnbLLBhteDQOlCZHi1
         jbVcbx93R+P3wZD2o8SWDCMKIDFQnKJVWgSTNBinxc+YSbEXSnwx5VhslsHusafEAOCe
         Jc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318597; x=1747923397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUAKfGSHAephwzkvvqYScDjeaSuBh+AeZg+JkcSpqSc=;
        b=qKb71p5Vf7BA8nyTw6joea9f4P87jeI1rrGgQ+AkUoCAPt31X3ufpjeM5B8ettUnuG
         jgyJMTVm9OrMpKpvu+LyvGdtlNTlP/3Kpv4UNTzRkdZVmcxURdB/feyPMinaRC0eDRfY
         bI3MCSxf6jVwOITROMJtzR5+ogzrMpn4+mVPDhEr6EE46IQOADBSS6hwsov4PzVDhGvK
         jS15kRCTBKWfb53+kFi6/kZo60ChKVQLVtj6n8NkqfZlDK6ogQebIVhz2tZlb0UGefXN
         IWd3/HtWruviWI4FJcqfToV6r+ifgyXjGjkPYVQtV24BatS99GKDeqo843jLcm9vngsm
         a62A==
X-Forwarded-Encrypted: i=1; AJvYcCV4H9pYLbEsnP522Yw+BGwEuENHdePLen7kI6L3uVtyKmj8fvRHNwNIH39VneC3eFigYID5w3HzxlpMQvbq@vger.kernel.org, AJvYcCVwyYMH8OhiW2bj3IXfE5pgWTa/5mqtCYU+FPBv4a+hrD6iDpZFsOguO/2gxIsY4B3FV/QCeTVjfbBI@vger.kernel.org
X-Gm-Message-State: AOJu0YzhYcEK89kp0b5wy385llWwdhfJIF7yVVQxV1VtRkLG+4Wmd/RV
	XXdoxzWmYmLbKo0xUu/TlqeCw+ED5m5ar3bOD5kternVPBizN6k6
X-Gm-Gg: ASbGncswENEQlVhtqFMx1HsW0xy/yy/ogHBwG+b9ajFqD+25zygtMIw2fZ00I1qRvmN
	qgF7CjAy/ly6jymFo/6WUjGM25/ocvtxP26Vr51fer9rRksMIgQLlvc3s2ESyrzUlALIMpd+k9o
	yKDj+uNRNl/za+Jx3N9uvHG9uPsOpAL4daFMc/shYdprLnRK8Dyb7jJMUwLN4N6t5EX0cjSYt+4
	pHTS0C98o6ywMeWoune5HHn1f2p23DUJK+gS4qaVs0M3fNz5AgJSSNbQjFA09JfD7mGwSw8pWbO
	HQ6akq8EaTYs0ZwzaDT7KXLsfQITdgRbz9OEFVDaUZA6E41bcVU5eNK/4XQ2uR+U8tvdWSSu9e+
	rOD//FQ59GhSFd1elx3MKtg==
X-Google-Smtp-Source: AGHT+IGH4uAijkHrPJ8SE6urjZ2Hq8G2vtE100Phz8L83U7VYNex0D/QaJL6ECz27Y2hKGs1s+a+Aw==
X-Received: by 2002:a17:907:268d:b0:ad5:2260:e02d with SMTP id a640c23a62f3a-ad52260ea7bmr138931566b.42.1747318596371;
        Thu, 15 May 2025 07:16:36 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:36 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:29 +0200
Subject: [PATCH v9 2/8] dt-bindings: mfd: brcm,bcm59056: Add compatible for
 BCM59054
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-2-14ba0ea2ea5b@gmail.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=4546;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=pl2HEbe+CyuHOD3OyLZCSAaiFxQmceMkPEwlgJ22HCI=;
 b=iMNOwu9LI02MG4hZzFjCkGpeQJUyEniAZud0282jaff5Atik+g2EuLWpiaVkmoevA8XzZBt5p
 F5Uf6QtbylhBiwaFdr8jeo96Z+Xh5JPog+Ch1DNXMiJ2fbzxsI4eLLa
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The BCM59054 MFD is fairly similar to the BCM59056, and will use
the same driver. Add compatible and specify the allowed regulator
nodes.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
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

