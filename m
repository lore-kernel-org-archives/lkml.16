Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F1128B419
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341119; cv=none; b=BMbO9xTlWy3rBQ9YfbEG1W7dV/Z0Qdaiq8biXla8eMai7wX4x0XqFihqPN4I9UP88SyPQZHPTi5UUZTNCSEP2T9bwoTujwMx+boL/9lMrMdbqJnFdZujS0wcHQioQ3OTIOBe3oPYTQBnB8dXUmRwDYYPOJt8rE1jVUEm5BEQ4Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341119; c=relaxed/simple;
	bh=cAHhOLAHGIZflg/S4SymZ2z4viws5qDWxv85YpH2WPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqUW+yzhXwAsp89DLgkEMWYb3uZTGARsfMfwmiGm0qO4hS8+aVJfCTQ7JV8rsAulTlGVNBt4S8iYXhydT/3gOml+yg9YNka15hm7vwP2MhPTJrSbgb7+1p64HBExZzu3r8rXzstlPb48OWBAnedasWHOxJIK0M8XfTt85QY+Glo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ShGiAx3Z; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ShGiAx3Z"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ddda8e419bso2530535ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341116; x=1750945916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9OZBf2ZEclqneULzr0nY5IJTm6h+hkq5rFp6zftd8k=;
        b=ShGiAx3ZCWh91myRrzNX4ENCkOaZtxWFMiaw+2T8eEPRNgtYJCtvXdaCyqngfHy/19
         4frg2J7LBSL8vSuD21BIwhU66wAnmG1s6W/YMmNqI3pBfIm59a/MtLRDpQ8waB4Yh/Ij
         TEXabsb9sFu/UzLwI2SXR0c+eHWk+1RMQY84yp8ZFYqAYLHKCxZp3Tsynwxnm+gXT8Sm
         RQPXrcpF6p5hmnMU/coCq9cr+pbbfa8Dz8Y++gQxbQ4gTp2UhCyGd0FzTcXNmRb5padE
         UO9W5zSUyMj5tcmjtMUUIYUOauJKLezbL12riZ1K/qx9MvnLlYbEZ2uL1fkwk+/mMaYU
         1+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341116; x=1750945916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9OZBf2ZEclqneULzr0nY5IJTm6h+hkq5rFp6zftd8k=;
        b=jYO7+f4JpfTyVfa6voda7ZOH22vfCSKmWDA4fstuv5EcNc2sS+h6wNOfiP1G4eebHo
         Web7Ti/9hYcOTfq5Dm+08lWxpunKDv5kEWYdyQodE2xpBCH6/2vOZYlpQUSy0N86KQGq
         24cDtJ6xbLqntCU9cM7Yqko8LY5rJBoFl+gIwVjs9mMusIsyeezReebH2o/TD/Yqfvr8
         uoeP+QTmk+11HNGVqwlICUg5LsaUNwCvhkkJVuI7WW2GERlePwsT03c7d0TmNutVAlp0
         6ZULXuliQi7S/XiLcGBO2K8W2/deNKYnY9NYbQK7wFWRj5jpVw9Fm3mBdPktVfmoFDff
         KIwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW74tJ95IzCuGpwjUwKHjSsTgRJA/0L/JA+u1kptGETTl4Yfsb0FPBa7czgOKnyKAhX0py6wHvZKtlGdR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPfBE/gKdPVkMU+r04UAOUym9Xk61jYE7zViDol30u1FbEZ/e2
	c+3CQoEjbQGprOC4/pIspHYSsw6DemGULBUBdnmXxN3fBHCGF6VkmogFUNq6vlq1eY4=
X-Gm-Gg: ASbGncv2s6y+S3hutZHPREJvHy3eucATJzk0a7EMY8T5LXKc6cjVFTQEahTKE7/q1Tm
	5hk51yYW3YH+s/lwxqboZze2/l7WzK0PUN8lDIeB2bW+NMl9Nm/Zc+CuwvI/t9GuDulLD5Poykg
	IApXzVRrtrKI7p22f15HivEzwC4/k5SGDoW4ukK2zGO4ihKtNaiZTMVCE66q/SJqvlWMOreHW3G
	z8PsFB3LhkByuVbWB4VTJChZymcJY1YKIurDkHwH6LSr/xEMnQP/MpgfkvAOsPBFw/qKR6qJT6c
	mMpCKjBaF5TS/2Fq9etofrWvqQ9oGVJd5A9khZA0ikUzkGSA+ttOgLnhoJaMToyOlX2Iqq6rFCI
	onwTrpg5tgYtZTW0aCuxIM7Aowb9LoP8=
X-Google-Smtp-Source: AGHT+IElaXHZ2UeHWaQiwWXotIWz/yHFM2kkgPfUkrNCPfPJv6aoAzGBdh75tg6zZAr4XQkckxbbkw==
X-Received: by 2002:a05:6e02:378f:b0:3d4:2ea4:6b87 with SMTP id e9e14a558f8ab-3de3029bcd5mr30770725ab.11.1750341116498;
        Thu, 19 Jun 2025 06:51:56 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:51:56 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Thu, 19 Jun 2025 08:51:45 -0500
Message-ID: <20250619135151.3206258-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
only the regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Spell SpacemiT correctly in the subject line

 .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000..5cc34d4934b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT P1 Power Management Integrated Circuit
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+description:
+  P1 is an I2C-controlled PMIC produced by SpacemiT.  It implements six
+  constant-on-time buck converters and twelve low-dropout regulators.
+  It also contains a load switch, watchdog timer, real-time clock, eight
+  12-bit ADC channels, and six GPIOs.  Additional details are available
+  in the "Power Stone/P1" section at the following link.
+    https://developer.spacemit.com/documentation
+
+properties:
+  compatible:
+    const: spacemit,p1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vin-supply:
+    description: Input supply phandle.
+
+  regulators:
+    type: object
+
+    patternProperties:
+      "^(buck[1-6]|aldo[1-4]|dldo[1-7])$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@41 {
+            compatible = "spacemit,p1";
+            reg = <0x41>;
+            interrupts = <64>;
+
+            regulators {
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3450000>;
+                    regulator-ramp-delay = <5000>;
+                    regulator-always-on;
+                };
+
+                aldo1 {
+                    regulator-name = "aldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+
+                dldo1 {
+                    regulator-name = "dldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
-- 
2.45.2

