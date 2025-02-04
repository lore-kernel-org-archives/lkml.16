Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F73215F45
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692205; cv=none; b=lFvO6MSqqYVG7jCgg5+oZVz4Q8/6WhTw31hcHCv5WQ5ll32ajTuKXCMCQKrNzWDuXANa0aI8JhqLcKc56XWVEZxb1MOFhtRhTamGsp62xDpCHUsxe9GGWv+M2CUwEiYE5OcQ2XwEGExvFYXDm5WyOR+Q8O6Pla84mqXtYk8ZaUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692205; c=relaxed/simple;
	bh=xfFeaA3aQ/gpQCUTZPba7AJ+HX38O5FL0YsuMNgMClk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A0pErk+uM9PPc1jcBt2lFpv+ivS4+cbtP6YxfBOvLNaf4BpT3uQgXsuDtG9MEWk4H3qdMf4dabVsCw+f0zeLmSCDDb7Ul9IZLdJKObcwjL/2P3cJv8us7NDe6qQtZpynLu4Bku8HEp29EHEmrn2n2fiI+cy+/dIucveGTpnQcTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ci4wS7Br; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ci4wS7Br"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38da72cc47bso801242f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1738692200; x=1739297000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyTJpLynAZ3x16CbnY5MWeiGrmP7Yk69R+UM5RrX7wA=;
        b=ci4wS7Br0lAx0ETJ0CjWFeEfRb/XsMLYek+Lz2QVvilttY15tX2cYZdELiWgg/DAms
         0dXb9ustUvPMtXTFcOWO/F+PJWETrPs3xwhwhUqUk0wnajUuC1cpu9kWO0GKg6MZk21N
         9SXCWUt8xKYzleZgb+45C817t//N4NRnJg/6GV2Eda9zb8XOjPkDZwFYnflh7dN1GknM
         Qr4pZXcZWCfgfIu1nQfgRvjFT81dDWr5/Eyf2DFR9IeFYA9freQO6ONTm2/WfiOxsdz3
         CkpZ5S6pmhDWyf/DbtCtNxrnKbAWBsNHcDnO6x1UgXfCWbvrC8fdVRV3zR+PD94nd6ML
         ki1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738692200; x=1739297000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyTJpLynAZ3x16CbnY5MWeiGrmP7Yk69R+UM5RrX7wA=;
        b=rwu6z7nbQqrpWHNZ8ojInUhuYH6nTszuZF9gg5W8ycpe/foE7HzIkl/gSXUMoQp+v6
         anF+i0LECh0hSPURSGCTOB2pxwLcIY4lwXez+QxwIAoa0rxCF/HHzmoVFxLyv4lYLIAw
         jARd6SOgb3pQwxfNysrUAUYnzjf2WKDvaA2zGmHKltd/Zud+FnKfS8DaPxPa25dDnpsi
         63q6wsl0CJItPkitKprj288/gL0+kDMGkY4jret1HeEoZBDkftwHQbzC9uJjPp1FZBWO
         W4cAzYk6D7dZGWiSp+OEHR1RvLkFOANN+DRCya8c7ls18oykERO1vMQgv9Lz9P7f63o/
         OXlA==
X-Forwarded-Encrypted: i=1; AJvYcCWf8OuWmDOVtjuAcQGl+Eb7rH+YihP0nY/H/D783olD4cpgSCxnybAlDSYrS1hLw+1H3whO3eL4uYjPXEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHY4Ssljf305eZtaQ8GpJ+yzrwK3tVwEYXE0PT+A+uNzzvJcwT
	mjfhRNtw1Ew2qG6sx4UZv3aLVEeBmZKNOa/HWX6wGQQwSy3OxaUCztJ0Cs7T7HE=
X-Gm-Gg: ASbGnctozgO1uYYw0ZyQkZcN2ozZd/qRhZ48AQ9LQgK/g5IrwNT298F/FOg3jN/yQP0
	yrxLs8G0ja5w1dcNaSZnOCDBVQSCrRFueX9NipisCbLClPeqykCd6zzp011CT7mDR8sjsRZMCOG
	dM+0wJyb07X8dY8vautJO6JmM9dzrCQYaP+gaCwpmkyEggIUYMoIhT11RFx8wLrAurcH2TnxbWd
	H5bNuMUibgGl3ioDAtinio5tY9Kl6qo/EXYM0MrW1U+3+ZiCMlTzzxfN0VmTgOkYEknY/i5V9kd
	QUgmAF3BadUqG0Sg1JUIy3o/e/KZUA+8VepdjMskIoYQ+P1b0bXxbVOaZn5CY8LZ9/ThvrVpy6S
	J8SGj9e13rxw=
X-Google-Smtp-Source: AGHT+IEF5gLfCU74QaWjKlf6C+ew0dh1VudWuQXDuNCEip2RjcGq0sjA/qgAiNB9pJOUTiqQbpkMHg==
X-Received: by 2002:a05:6000:1869:b0:38d:b051:5a0e with SMTP id ffacd0b85a97d-38db0515fe4mr1728729f8f.49.1738692200108;
        Tue, 04 Feb 2025 10:03:20 -0800 (PST)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ecd6sm202687235e9.28.2025.02.04.10.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:03:18 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	broonie@kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	Naresh Solanki <naresh.solanki@9elements.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt binding
Date: Tue,  4 Feb 2025 23:33:03 +0530
Message-ID: <20250204180306.2755444-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move dt binding under hwmon/pmbus & align accordingly.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 .../hwmon/pmbus/infineon,ir38060.yaml         | 61 +++++++++++++++++++
 .../bindings/regulator/infineon,ir38060.yaml  | 45 --------------
 2 files changed, 61 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
new file mode 100644
index 000000000000..e1f683846a54
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,ir38060.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon Buck Regulators with PMBUS interfaces
+
+maintainers:
+  - Not Me.
+
+properties:
+  compatible:
+    enum:
+      - infineon,ir38060
+      - infineon,ir38064
+      - infineon,ir38164
+      - infineon,ir38263
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      list of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@34 {
+            compatible = "infineon,ir38060";
+            reg = <0x34>;
+
+            regulators {
+                vout {
+                    regulator-name = "p5v_aux";
+                    regulator-min-microvolt = <437500>;
+                    regulator-max-microvolt = <1387500>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml b/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
deleted file mode 100644
index e6ffbc2a2298..000000000000
--- a/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
+++ /dev/null
@@ -1,45 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/regulator/infineon,ir38060.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Infineon Buck Regulators with PMBUS interfaces
-
-maintainers:
-  - Not Me.
-
-allOf:
-  - $ref: regulator.yaml#
-
-properties:
-  compatible:
-    enum:
-      - infineon,ir38060
-      - infineon,ir38064
-      - infineon,ir38164
-      - infineon,ir38263
-
-  reg:
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
-
-      regulator@34 {
-        compatible = "infineon,ir38060";
-        reg = <0x34>;
-
-        regulator-min-microvolt = <437500>;
-        regulator-max-microvolt = <1387500>;
-      };
-    };

base-commit: bfbb730c4255e1965d202f48e7aa71baa9a7c65b
-- 
2.42.0

