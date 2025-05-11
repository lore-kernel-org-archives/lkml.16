Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0580C2F2E;
	Sun, 11 May 2025 03:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746935840; cv=none; b=m4ngTK/otFEv6t8nqq3qHUIL+P51uhkyDepsMvtPaEBmhhnPqLON/PJKEGi8JQrS++B6euX+JuRjml2gZjlhQacC/ueInsXFBAO9Deu78lhYFXhnrwND42k06U/CZjNMUorbMwQjChyrGs4WXPKCu1ze3zPUXTY6k+T1M9xnW0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746935840; c=relaxed/simple;
	bh=f/UTi+V9OBTgwKw1gQAScv/Z3Q/LzPwLJAcAhilQgdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H43oad+K4jvxm22Nn1mD6FIjI1Y/nhdd9XQBNhOSbYM4Crf1CZnEH06dVhaD/PQbOHSf6SgMXBd6jz+7ynlb1mDgkvmYfVlmij1K1NsiPIf1nEwfgUZ1l/t5JFt3TABNrbyBgcZlMr8lU7iB1EZKDd9gyymk66/7x6KSVyjAGew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gk8Tqx/i; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gk8Tqx/i"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so36593705e9.3;
        Sat, 10 May 2025 20:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746935837; x=1747540637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEhQESYwkokAzogW2qk/KK801wxi9MLakYUcNUui9Ko=;
        b=gk8Tqx/ihKwcOIW5rP08lKzKethfYHEGzXRG5/uly0qvJZ7KJn5YH3K8qMEGIrqeQq
         6BA5BR1xZaLDd3rmku/DGHnZNSDQm+Fif9ycv0CuswOIwO+hpxOVxcahfYz8RwofCvsK
         jiYbe0vvhh1wmQLXKhD7qvVC/YnNxTQT+ItuBc/+PEtzc2Q/Sz6/TBoga32oaoxLatFx
         kJYBKBxo0pG6BqKgqI8SfpjBLwqKjQHD0udwTfY4x3OJxIPFQz2x7p5pZEYw6P//UqtQ
         /g63pdAFUeGO7qb+yr0mvEKCjaqJpGSmOmFxH14aSrba8Nos6VKBF3XiHSp70B4i/keL
         rj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746935837; x=1747540637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEhQESYwkokAzogW2qk/KK801wxi9MLakYUcNUui9Ko=;
        b=TxH378MSLM6ksJu9Z5F9K3EDEcK2OI2IwYjCB79Y3Nz68qw7T1nfiCTteWtmgwMM/X
         r1o4vnm/KdHESmOezihIlBbFejBiJ9CbCrWGhqEwPJM+NgQj9oVaRxRZWs8E3qztuqqY
         ULOxm4V14kdvQErvng7EK1y8pHjmEuiyknbXBv7IpfdFPWP3ab48RAclfDJ0Uamb8N5c
         KlDYDa48fBIAayR2fIJyr8HKpLoAcGbzt6jWv/VNGQ+WNMjclON9Yt5kgdkvWfHlaE8i
         n4DAtCdaM63j0AvrDw6nUWW5coOKpxwWQaU4Oje92nhx5lkAlTjI/anAwSXNd6pbJEYL
         tsqw==
X-Forwarded-Encrypted: i=1; AJvYcCU62ppuY7wgRVLxYTIqgxjTXzvdI31B39RoAOXyIsTZUu7zcTQjKzRLK3df21xhpFH5F5bIBuLzMFSR@vger.kernel.org, AJvYcCUIetkcQdJMKi3/kpkn5ptX8L24Kfu8l0Ghqv/z63uuOWz7zH8/Pje/a5zzceD5q8HrloOrBGDV707eRM28@vger.kernel.org, AJvYcCVniFEKuNKOwZDqr+WWHQCnQjpkL+f2OJSqdBpuihfQeSWzP6IvQGlU17yALRedWm04y8T6bAuOoca3@vger.kernel.org
X-Gm-Message-State: AOJu0YyqETy6CVDl/zeNa/Loka3XWU7aPVk/0b+lxPhVo/CJez5XJMbS
	VgqUW2LhrZKooWCAncIoapz1R1UNQ+swSxH3pGAe/kedcvvA5juJeGRcNoWv
X-Gm-Gg: ASbGncucoZA0/3rKE1ysO3Fkrs2j6NB2skypfi/qUyhNwccYezGAblhkuRph32P5uvj
	zsRH/y17i/eT3Sq3Q8EA1T4JrPTUfD8Y5/2n4YI78XozfuHck6TWF2MB0Ei1Ov1aIIKloq3evwq
	TCDHu8stSL3WnAIW1gBv1BMEY7t8kY/xxocLbF3dA8JOYj9ExlH7wRH0W0bTQjgh5Pqiwl2xn2m
	EenQF8SPp0W5FLob+Pz65/PT6iPXh5On9nC/3N1hW7lieG4tIc5EyycgQ1/zMM9Zu4XAv2JR7/0
	7MR1E4jkiEhlsaTnUBf97A4HgiP7WWCoy6f7b57V+ixBzAMZa3R6G+i4fDmLuEA661Bld4OUK1C
	b
X-Google-Smtp-Source: AGHT+IH8aK1oMDdl3+d+9QndIotL8zgwEtnhri+Fyp0sXJHR+IOaMhBjYpvad+nt5NUr51Gp/yoM5Q==
X-Received: by 2002:a5d:4807:0:b0:3a0:a09d:b31e with SMTP id ffacd0b85a97d-3a1f64ba5afmr5322166f8f.59.1746935836706;
        Sat, 10 May 2025 20:57:16 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c76dsm8163963f8f.92.2025.05.10.20.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 20:57:15 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 1/5] dt-bindings: hwmon: Add bindings for mpq8785 driver
Date: Sun, 11 May 2025 05:55:44 +0200
Message-ID: <20250511035701.2607947-2-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511035701.2607947-1-paweldembicki@gmail.com>
References: <20250511035701.2607947-1-paweldembicki@gmail.com>
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
v4:
  - no changes done
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

