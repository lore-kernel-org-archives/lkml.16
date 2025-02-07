Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B554EB51
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934907; cv=none; b=lUuu5nk8nrG/ZFjrodDRC9Fe3xV5x9xXckayJutyBZk6cayK3iq55IJ00IEb2+GzRKjKJmEo1cNBYsANzpWBQHooLhJItD19v6Q6Um0RXxdhGpbH2OB/PV+E/YVfMEZdPl8Dggfj2WohNoG5433UzF6UfBF/C/kIcFSWYZCSeyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934907; c=relaxed/simple;
	bh=LZasnWhFJJV34mvD6UVizSKN3QCXMXim04UIqmOaNRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHaIA5bQ5M6W0xwfawEMPJTd4xcXqk5oYe+ckWWJXgxROSBjTQHcA49PpIyObXJDBEEriYgYbLm8FoJxOR1pdM4mteMT04PMrxGhiNeN04mi7ogz+EsTiCz6vRBJs9pO/Np0WRiC4GeflmCXsEGX7B1HHEAOsN7MT4dy6KfgnY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=A4ESNtjX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="A4ESNtjX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4368a293339so22384325e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 05:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1738934902; x=1739539702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckZTEVvJkEaNZVoLWSjwZxia7bZkBvQAhD0vyw7gDKU=;
        b=A4ESNtjXE7iog4h6b3QAjrVU1HOkyUvh/hgkYTEkkCpajZWj9Bg3CjqN4LWoj1qwtl
         MYb1UN9gINQvZNmiEfJoUdO7y/TviGfif71nhrn5be6zQn6m10uOtVTvIDxBFSySPtMZ
         /8tCRMvrG7Zm9lB+VS+fqTRy5JU7xkNYUgNec+0qxnFvXa1SoD2mRmt/LzSuHfoAC4DG
         AO68Z3m0BQXOR2XRFgLcnjzz7Q/A+D/NofCKOXosAhWH7TyAE0mWU5npuwz5/G9IXQRa
         zRvYYJU8U2/kz9WNnUnefd6knqXsNtnIzgljpRCQ09cLHIaxj+nHHDdSSgY0eD4+o21z
         9IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738934902; x=1739539702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckZTEVvJkEaNZVoLWSjwZxia7bZkBvQAhD0vyw7gDKU=;
        b=Kh1in4tJXji/1kNN9NCmwtZvhlOWi1/LwvPKLipZFTMG94dUYkOMvKJpDl7mem/jCb
         vbk1v1xSLzLdzEiNDvb76AfoFwdbzP09LfCfPc3fBstG9S3wYB55PiIn5yb8GcFewg68
         +mtjUwVZsJVyLc3PRoP1hgadFKpVE2lfI6QuY4fW611maysLX7Pr0x/kxptt5maWI3Po
         qT33OIMhp3lj5xZHsDcj2+16TMx39/UqDuoM4QWX9Wuj+0mlII4VLcCy7R4NSRH1C46t
         9K6lBWirHgp+ylZBXgC1VbPYaUOFnDtpqKqHD9pkNHzntOf2SmQhrb+18X+UFhLMVxGz
         uHqw==
X-Forwarded-Encrypted: i=1; AJvYcCUMoIHPiPz+kl6U6pDi1kybgNF3evx/0208euHipJoTpWEu8DHqYn3QHpEHW6ACiWJ4r5d4YMN+VPujnOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjUlaFWKqNDfjON9eufsVLn/oU0emFXgNNMp6c4PFE6mhdz1aE
	ggre9VzcddorFHPZA6ouHpMSwn0fNoJKjs7x9bipA/+nYVf12niWD+F3oPLAcrc=
X-Gm-Gg: ASbGncs8x+pLyXB3bP6mXitEoc4uAILm60+cpNWYX7SHg5HTlzrV/9m73NDMRHf11as
	Tv5grc4fYPpiVzkY+GuE7OyNo/6PN80GNmEwKPvgxaJcikWGGqjFUoaXCnFdOzksS0ftxdB7pem
	USw7jwk30eY8Awb8n/X9d8Vmy1lDCCa2A8tRGpEa9ElcmAzQXg42ypAKJ7ND83dIkxvumXQZSbg
	rUCkulqJfq9twCta9aUQlTfDP4wK9I/w7dysxH5jHTZhDBEauKf769ml2bpK7YHrGdXe8sRFo10
	DY+ve8uPMQYCINMINKIHjsZ74hCFIah69tsyf34VblpgEpma7fNvkgBIbNItV6Fk6R9WaMrgKEO
	bpLkHLkEooW0=
X-Google-Smtp-Source: AGHT+IHGBSOeWsge7tK4CsQPKzL+OUxWSXZltyhfvpxwSC8WexQZT3cddURN1LChbx/tbT0l7rnAJg==
X-Received: by 2002:a05:600c:1c9f:b0:434:a802:43d with SMTP id 5b1f17b1804b1-439249c02acmr25919505e9.27.1738934902117;
        Fri, 07 Feb 2025 05:28:22 -0800 (PST)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc6b89ef5sm2641562f8f.31.2025.02.07.05.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 05:28:21 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	broonie@kernel.org,
	conor@kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-hwmon@vger.kernel.org,
	Naresh Solanki <naresh.solanki@9elements.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt binding
Date: Fri,  7 Feb 2025 18:58:03 +0530
Message-ID: <20250207132806.3113268-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move dt binding under hwmon/pmbus & align accordingly.

Previously the DT binding was invalid & wouldn't work with pmbus driver.
Pmbus driver expects a regulator node & hence added the same.

Fixes: 1d333cd641fb ("ARM: dts: aspeed: sbp1: IBM sbp1 BMC board")
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
Changes in V2:
1. Update commit message
2. Add Fixes tags
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

