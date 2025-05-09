Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E715233F3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 02:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746757059; cv=none; b=NEQ92ebe1fdlJYDzJEAm2BApnqsxZp5t+gEXXc3zv8kUGOqDm8rsWGdX8SmumumCm2cokb1hyEyFuTKSCXWtAhQ8KSXZUo3PBtExe7I+uhiwRsfG7RGecMMlsht0hxfYo2DIjskxiYvTLKWm9yZw9bxR5z2YcVgK8zNwJV4yRjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746757059; c=relaxed/simple;
	bh=qpBWzqwX7nlosrgQU26zA1xQBO/cCnyHtYyHlt0Dvlo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=kNz1tkccwwWSBMpt+GMvIU7yqV+LDmkceqlRDyZQ5vfiHvPI5eniqUhrp0ccarOj41e/XEH862TGQCUxk7AfyXBQeAvgZle1i3XdJeMVENhWu9T0nb8cGJz9wMscHR53AhHleUuvPGx3nELmsC6PwayujHA/JmGBNhZay6iB0Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=hR9lDDO7; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hR9lDDO7"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73712952e1cso1669291b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 19:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746757057; x=1747361857; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COuwbILi4TOhg1B2xAx95PCBRZphUGdmgoB7CQvJQtM=;
        b=hR9lDDO7bmCYS3Hrv1XHoxCRSlFWKFK9fDmuvFAv3noF22MlR5gPSZrtnofzck5iww
         6qap6czVqkEJaW5Ak41RdfDFG6qF/5gfu1FWMzcs3Vv3S/q1jXpc2NBxBOd7XIq++DKM
         2QGbdc9Sak0k5TjXb+jK92mZ1e7lvu8wazVZnMAG+jPXflhwR8tp2uVrSNsxcRnRnRGb
         TxUz9HHFDySq9LXQ4K1UyZc9+/jvjeBxjvQi6vGE8CbxOrEk5kKZ1h7T/lgvrKhEIH7s
         d329jaY8QY6BkN5LP4t7agU2QaXzhNozSQF2PKOfiX383AHcTgBR3dgZLxsnta/2bfuv
         Sx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746757057; x=1747361857;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COuwbILi4TOhg1B2xAx95PCBRZphUGdmgoB7CQvJQtM=;
        b=gxnmJQwHuddskyDLXsA6G0yPRYK5F+LtP9et4zzzGPIX3EWhWB6zQeFbta/gv71rTF
         0MAa63c/P6obarMW7kwbgYLVKE6D0LM1biAuzCpA96IZZoMrbN6upcuJj2WiJGYDHjjK
         CveZ0Za3Zu3j7hDu7PaX+YJs8gZoOg9z6tG84fdVZ8jS02puE8dX2pDFE5ZBt9lFmgjm
         BhV4oJvoKtBExTfEn+MmAu0jfoNUHECn+VHAyH5Bnv0qLRxr6ZZjoP/CZmeSrRIncR14
         mZ90lxCh9UM0+CHaDuLD+gMLVemQ3JWpa9iy+8DPvokEXykwbMsVEDPsAdPWt6FY3azt
         A+xw==
X-Forwarded-Encrypted: i=1; AJvYcCVHbb0scK/bmuzsm9i7n4SdPeT7n9lMET68u89Uy33PUvNHp2NY/dqVFcWRPS7wI27QeQCvl/KYQJbJOws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoqi+Josvbw7LhLRV+97fIvDeX8ZKLW7jCljTn3pEn1aFIxctS
	jMqbuYUzJ7lFJGoB1AoLNi9+UDP/Md3QUcCd44OpAGfySD7gWqp99nrXNhSQI/w=
X-Gm-Gg: ASbGnctwbql01mkJ3aWdd5v0P5WUuNZ21KlXFdhjJSiY2OzygDBQvy21WCA9ibgCuSE
	Dpi+tiY6WVTRnPlMM0eX3ySiulAPgyYyjgh7YFOgtk+hcH5A40xkCrKl1QvoXWzybsEjCm8zHTc
	mnznxgB4rDreEN1fd6zZrdhOAe8bSrPIzCkc0qSf0CPueFZVMRkPZQGgETtFoOKafWA/z2vXab5
	gemCemSh3nKr27tBcmBMmzsOIfb0Fidwq7hBXg9mK2vwigDcJSlCF2xuASigSoe2ML9cYIInQPQ
	nf5JSSD0Fx4eDIOKX8uLPnae/lJTLlD5LLi0A+yerTe5i7d9TpkjW2Y2KzB2YOM=
X-Google-Smtp-Source: AGHT+IHrxCZaQsfenVelF9R0H8Ri61vJWq7kBW24FBrc2xBa8NbB2J48U9ZpAcGWfdq7Mgah8BLxkQ==
X-Received: by 2002:a05:6a20:6a13:b0:1f5:8179:4f47 with SMTP id adf61e73a8af0-215abb3816dmr1810793637.20.1746757057126;
        Thu, 08 May 2025 19:17:37 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3dc09sm744688b3a.141.2025.05.08.19.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 19:17:36 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: Cyan Yang <cyan.yang@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] dt-bindings: power: Add SiFive Domain Management controllers
Date: Fri,  9 May 2025 10:16:04 +0800
Message-Id: <20250509021605.26764-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

SiFive Domain Management controller includes the following components
- SiFive Tile Management Controller
- SiFive Cluster Management Controller
- SiFive Core Complex Management Controller

These controllers control the clock and power domain of the
corresponding domain.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml

diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
new file mode 100644
index 000000000000..7ed4f290b94b
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Domain Management Controller
+
+maintainers:
+  - Cyan Yang <cyan.yang@sifive.com>
+  - Nick Hu <nick.hu@sifive.com>
+  - Samuel Holland <samuel.holland@sifive.com>
+
+description: |
+  This is the device tree binding for the following SiFive Domain Management Controllers.
+  - Tile Management Controller
+      - TMC0
+      - TMC1
+      - TMC2
+      - TMC3
+  - Subsystem Management Controller
+      - SMC0
+      - SMC1
+      - SMC2
+      - SMC3
+  - Cluster Management Controller
+      - CMC2
+      - CMC3
+  SiFive Domain Management Controllers support the SiFive Quiet Interface
+  Protocol (SQIP) starting from the Version 1. The control method is
+  different from the Version 0, making them incompatible.
+
+allOf:
+  - $ref: power-domain.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - {}
+          - pattern: "^sifive,[ts]mc0$"
+      - items:
+          - {}
+          - pattern: "^sifive,[ts]mc3$"
+          - pattern: "^sifive,[ts]mc2$"
+          - pattern: "^sifive,[ts]mc1$"
+      - items:
+          - {}
+          - pattern: "^sifive,[ts]mc2$"
+          - pattern: "^sifive,[ts]mc1$"
+      - items:
+          - {}
+          - pattern: "^sifive,[ts]mc1$"
+      - items:
+          - {}
+          - const: sifive,cmc3
+          - const: sifive,cmc2
+      - items:
+          - {}
+          - const: sifive,cmc2
+
+  reg:
+    maxItems: 1
+
+  sifive,feature-level:
+    description: |
+      Supported power features. This property is absent if the full set of features
+      is supported
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: ["nopg", "ceasepg", "runonlypg"]
+
+  "#power-domain-cells":
+    const: 0
+
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          pattern: "^sifive,[tsc]mc3$"
+then:
+  properties:
+    sifive,feature-level: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
-- 
2.17.1

