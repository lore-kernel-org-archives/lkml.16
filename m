Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDB723E356
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848519; cv=none; b=Wh5L4Z9YJ5Hg/Ucs8G/ghdNWT9VrUqssF033x8AdaPkNFqLjcrNV/Co93lcugV3Yzs/Ph6Ovg1U2v8G2+HQexZMyTfx5Z4sV2OFL0Oewea2OhJoK6QOV/jbPUufrqA+YsEOdRR2r1GN7RkF+g1EO6pCgnsKGr/OUSIsPNJbZlgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848519; c=relaxed/simple;
	bh=M3WU8j8D3ectPH33ard93KigKB3ohcn/1yhzmCZv54c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fd3V08sgbe8QEEaJ/gXJLPmz8U19gUcWRO8PhZ1PjlpjAsouCWiWhghoNjMIfSuNJGnpOtdmLw/zccDtBwRdKDJCbNe7OcUpPnKSxJkdKUylYpbjLKNRBhNSCo/oE959twIkyK80qRNI9yrRwtvGcSwfJShoYYvGRFJJJXIRN58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=jXJ30FtQ; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="jXJ30FtQ"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d8020ba858so26849125ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848516; x=1750453316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+0/C0PNGm7MxpNKW6kFIim9vzj9ziDhSWBIAnwFt1E=;
        b=jXJ30FtQJHsfdioDBpt8kwddW6ytzcHOQHy2+pglxOj2HFs4l5AHO4zGvHcynbccWd
         tvXpGg0nJyi6ywMCGcvG9tXQD9un8aXpMYJyM6ntipivPnpF+ucjTv2JNNG6QIpkt7Ub
         u4os6HiylYtm/uYpvziE1YVotJd03MNZDBJrmOMNLLtAyG2pH6ojBduFjWP4fg2f5TnQ
         OoOc1HSOSrEhO3KO2qIBzC9WIXFv8cZlNyOLfrFvVzh8xe+fi8mJgibWZffHfzMgAuo9
         ULCfLSpRhHN3wHEQkQ8F8YMbRIXuZO3IiARu2BWXPpdWhyEHu885eYQb614KzMKyh1HT
         6PgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848516; x=1750453316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+0/C0PNGm7MxpNKW6kFIim9vzj9ziDhSWBIAnwFt1E=;
        b=F6/3Nsf8B5oM+9BaBVvPAvcj8xv6S17zIaiBfewre82n7AuyPVm93NGpmjQHkPfnck
         nrkRT284eM2hGNlbz5LhBuRF+byDa0c0Wq6WUWqLxmudZDVub5dwvqVdnFAkeb+39+Y/
         5tpa6ywz1phj9vAaAp13QY6U+Blze9Ga6QLzNamZZcCpgRWIpK/lnO5jxiIWM8jLN2F3
         Lpr9gRhD2RUSvXaMMXWCvWBeVLYOngXGWHK+03CEvfqWyq90nziMwXaryJEPvvYjG/JL
         mhgb/CsvDtFre6063qJNLotIIZsp5gSU4I+YCnEfNP7O0Gd91SwJOyAE3TZUmHaGpSgX
         oSyA==
X-Forwarded-Encrypted: i=1; AJvYcCXuipj/VxFbFaVVETDG5tbk1NhZARsM4hNgchve6jx45QcHcIcJz82qx6PxijzsrcQWcnV92N8V3cOjNk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZwgk6mGZt1z6weOykOxYdDtr7914tCCUXFC4YYD/Lk7zgtKj
	w3cCtjRj3hPqDJvJ6/msSc3lRPGGCBWDhVSPoByli42R2jFNExjJC8w0K+vGBRtRpuI=
X-Gm-Gg: ASbGncv5YtS9pYlJcAhNOxpqP9icCmqaqdH1eBVJtqdPSQX5beqzweI1GbQJm2aIQDf
	+clynYBm1iFbzrczycbh+hh4f2YcnuMa4FJRnq5QcWotRy0ak2WdmovqDudkNCHNoR3QXxIEYj5
	BDRiNkTe6RPqnIevbcBKObIehPqxxeqGhQCtt5rosRADH5zgi3JeRuKJVwAqK+JaIJTd2bt5dBb
	PXn04zvPy5SXy7G0mDblsXyc7Oyzzpsod26JxHfxzdlIMCyhJLCwpNafnJ6FMmA2GnKh1OZraiN
	U79NCBd5ja51n9It3Yp7y/t/IUJ6KVNKuzOyyne7ueB9NQ1qy/mrxwLIeiLAt7pC3LyZxr7mS2D
	5kaYD8jH2l33iEKWbzfxIXS3gANKVZ34rwBaXnjU98Q==
X-Google-Smtp-Source: AGHT+IEAOZ4barh42QKEXjGCUuoE1CDyPc/l1EZnesaJ69ndQkqwdIOJcioQ8OP3PoKFNIqk9kUDPg==
X-Received: by 2002:a05:6e02:184b:b0:3dc:76c6:436f with SMTP id e9e14a558f8ab-3de07d018b2mr17478295ab.21.1749848516110;
        Fri, 13 Jun 2025 14:01:56 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: mfd: add support the SpacmiT P1 PMIC
Date: Fri, 13 Jun 2025 16:01:44 -0500
Message-ID: <20250613210150.1468845-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially we
only the regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
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

