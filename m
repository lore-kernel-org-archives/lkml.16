Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EF15477F;
	Sat, 10 May 2025 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746868855; cv=none; b=Xk5GXROVbrnaLsLHEUQGAXUhOsb+YUFdH4WgbMzDkUOd2ffRgNm5dYmyaveH4wZvefO1IsRJGFy+9ynJ+GjkFPyczZt+zPy/eqSyOXp7IwXkXqxNbW09uc11b1z34BlHwUcqdPt0RaTmk0t2QLKBYfVZjbudquMqcOANGMkF4PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746868855; c=relaxed/simple;
	bh=YjSNZ9Mo40M8YA63UVmxnhxy9W5jrVfUJVhs6MQwv8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=higSvs19t4YEVLSTRkcJRLEe3z1+3nYN4t9qipfXxaDYF9e0l9gj5YxXWSwNvYAjkrSiRgV0UJoXg5pjjeHLK9quKngda7ypKWI24qOEXRAVC6aAAx3CCE/GGotGKmGRuofyKnkWu+WzIHMILRc7axSLoAsRw9okUqpb9Clcx7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdWmfh7z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdWmfh7z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so28708605e9.1;
        Sat, 10 May 2025 02:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746868851; x=1747473651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lDvfRluNg5GEJWtSISMAA4AYOh8fmZr8HKCT3H4D/o=;
        b=BdWmfh7z8QtxYiCTruPY1cVbYQdqZz6/pugocYKRk5HTn0JRwp4GckENbLodWW7+5E
         mPrjt2o2h1mLse8fJMEacs+EugoJUk7VF/WW/5WXX/LCp0TtWM8PIzXIwlZ6g8cvVDSY
         04qkx+IAO5Qg58lUiT8AMw/P3uL5A9wVnQq995ZuxBMXZAOpZiBCLXCqLxJQarOJTN79
         CtA+i03e8+qlN8yQRL3DtylAaa+s6zYgN6rPHka4OxVc7yIyTNLs5ouFyZddzMkgEIv5
         bWV4bcnL1EfCeXD39uWNIri0yRuufNkvmyS0h2lWuFz/f7cqUleZOQ34gzz7iNnujzn/
         Oq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746868851; x=1747473651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lDvfRluNg5GEJWtSISMAA4AYOh8fmZr8HKCT3H4D/o=;
        b=ToIPpf3ASW9yTTqNdbD1lhiLhIibyF8WblS0UzK81ifmUnZ9X7luGFgOEnfUieHbYg
         2LROU9yQ6EHZNDSvHf3QcEFuX7e542wUOjgHgqgCq1nEsyl+QiqDZQAMpWEoJfcHSWnD
         reUIewpZmvkpchWfYHaLk2MIfmFAvGwdun8tm9DpxOt3B2CuosaQrt/TQfrhzYRp636R
         JNPYXbWrjtoq5GPF6kmaoME/9nE1IQtOr6jCLX028WfYBo/OdM1YhWIWQHT6UES32GCI
         Mcn72pgqA1Se8E+kijLMQZGBdayi04r61PYbYPym8EdXmmZd7pLDakS662mqymVcv2OT
         CHfw==
X-Forwarded-Encrypted: i=1; AJvYcCVwXJvhB9HAFpB7ImnhVlpcCc9M0qYyWA5AYRKSdsEWAA+VAodDBlT0wl77loBSp9Rj9fXek183Ix0o@vger.kernel.org, AJvYcCW/63BRNneFv8cOUuc+vjhKVNDonxsVVWGkRtP759r1cW0qfX3eADKkS3TglGSzLjvkxzFQfGTPd7RqIuTb@vger.kernel.org, AJvYcCXI5aUOC7btftDN6E353lsmp8F4XivHd2n0WsnqPo68gKfr18yyJCj9/tXbUvtalZpJPe99kp0axs4S@vger.kernel.org
X-Gm-Message-State: AOJu0YwE15VieGKBpCPSY7KDxFav5oh3YNX5C4RHdVZut/vI3GghoPEe
	jK/lCKAg6NUQkUg9bgwrs4Dt2m0yGOeBDLMwrE78jKebBJMBzr7/lQtku6S6
X-Gm-Gg: ASbGncu7tU/Qqo6vbZGcOPfFHgIXD67bLBMhMeoKqoy7cCImSh0p9G+aM2TEB8TMQPI
	l72aW3bhWoN00dsexXZE/qwkxWdJu2bmmw6WxZP5ZjxhpHDMNtkuPxZ8/TL2JFYZ5MI9t5eR/rm
	IYAJ1xkXF6tEowJ5kuj9q3VKHyki8wc8/dVRfqe9pJoKIJQY7HvA4ztqvAajByBT7vaZYsNg0W3
	GNsxOOL/AeY6MdHz9/MatEsUlvCm+x0m3qSXGooAlZS3NFFkJCDL8a/qX8vrYWVlO1NtgEwMA8F
	UOHcA1P2DJ0eyLEvMnepa3fxBLEM85dbsdKHs9RGwBWXURHyw7oh6PyHsH4OPyj1IGBPCLurC3K
	m
X-Google-Smtp-Source: AGHT+IEHOIKmWCF6V/Banh9eNGsFoLvVIXIIcMHWiH30NteigxCPcpQuOf1X2LM69jEk10Ck5awMZQ==
X-Received: by 2002:a05:600c:1c1e:b0:43d:fa59:af98 with SMTP id 5b1f17b1804b1-442d6de5140mr40168985e9.33.1746868850957;
        Sat, 10 May 2025 02:20:50 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae5asm55901985e9.36.2025.05.10.02.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:20:50 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: hwmon: Add bindings for mpq8785 driver
Date: Sat, 10 May 2025 11:18:44 +0200
Message-ID: <20250510091937.2298256-2-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510091937.2298256-1-paweldembicki@gmail.com>
References: <20250510091937.2298256-1-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for Monolithic Power Systems MPQ8785, MPM82504
and MPM3695 PMBus-compliant voltage regulators.

These bindings also documents the optional
"mps,vout-fb-divider-ratio-permille" property.

---
v3:
  - added maximum and default value to 'mps,vout-fb-divider-ratio-permille'
  - add enum to compatible check
  - move 'required' to proper place
v2:
  - remove mps,mpq8785 from trivial-devices.yaml
  - fix alphabetical order
  - rename voltage-scale-loop to mps,vout-fb-divider-ratio-permille
  - add mps,vout-fb-divider-ratio-permille min and max values
  - rewrite mps,vout-fb-divider-ratio-permille description

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 .../bindings/hwmon/pmbus/mps,mpq8785.yaml     | 74 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
new file mode 100644
index 000000000000..90970a0433e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/mps,mpq8785.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power Systems Multiphase Voltage Regulators with PMBus
+
+maintainers:
+  - Charles Hsu <ythsu0511@gmail.com>
+
+description:
+  Monolithic Power Systems digital multiphase voltage regulators with PMBus.
+
+properties:
+  compatible:
+    enum:
+      - mps,mpm3695
+      - mps,mpm3695-25
+      - mps,mpm82504
+      - mps,mpq8785
+
+  reg:
+    maxItems: 1
+
+  mps,vout-fb-divider-ratio-permille:
+    description:
+      The feedback resistor divider ratio, expressed in permille
+      (Vfb / Vout * 1000). This value is written to the PMBUS_VOUT_SCALE_LOOP
+      register and is required for correct output voltage presentation.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 4095
+    default: 706
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mps,mpm3695
+            - mps,mpm82504
+    then:
+      properties:
+        mps,vout-fb-divider-ratio-permille:
+          maximum: 1023
+
+  - if:
+      properties:
+        compatible:
+          const: mps,mpq8785
+    then:
+      properties:
+        mps,vout-fb-divider-ratio-permille:
+          maximum: 2047
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@30 {
+        compatible = "mps,mpm82504";
+        reg = <0x30>;
+        mps,vout-fb-divider-ratio-permille = <600>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 8da408107e55..7c1c0cc29655 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -293,8 +293,6 @@ properties:
           - mps,mp5990
             # Monolithic Power Systems Inc. digital step-down converter mp9941
           - mps,mp9941
-            # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
-          - mps,mpq8785
             # Temperature sensor with integrated fan control
           - national,lm63
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
-- 
2.43.0

