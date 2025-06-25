Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6F2D4B7B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869687; cv=none; b=YQSeG9QvkIbn/fJj9xmO2rxntacyguOOgbFnqNKNfCGzMe/trtfyTjL3zG7kdvJhFtTJT/UK7ukI731hncRB3Ajue9ufBrJoJZoLbzE+H23CLxtb8w0J/nIDZr//Ju4hjh4OiX5A7SC0PJ00DmDuxA+tmwpfdd2omNyPDWJMGag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869687; c=relaxed/simple;
	bh=hMn6z2AZyzcbL/cGMK7HwRD4mhVABvJkOEyvUbzSheE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0hIMK3yZKQ1Ncfg3f01bhbkvpy3ajjiIy2duI06BWogSDjOqoDYag+49G3GkKhhMU8T6Sx/6gQ3e+WVCTADitP784KTBxKTcK1MMKf9gDdgWqDUiyu/XwZQWzZcSMXnVs4kVzJ7UMrzk6gKp/20Fs4fzp5TvIEIXHrCeBZtDhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0lnVmzdc; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0lnVmzdc"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fad8b4c927so1526756d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869685; x=1751474485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=0lnVmzdcyco+AcCWPdejdfNP73E040O3ytndwojuKP/0zZ+6VsjO0ZvLb0r7yE1qGb
         28qd4vt/oDd5xoS/WP14/01BY8C1ftpiZDDAkzA/AqueXfU3I6QpnGKODCLmwtnheGRS
         e54ys3QXpjVC8jNBDduCR/CgKAvGxVPW4RTtUj4Gk/Ah3c/12RC0AaLXvPRlrch4EyLC
         PFvQl1nQI8AoJbSd0HRo2mZCgS/pY42Tj2+kQY72DyE+1ix0cKc4Fuu5yswuWCuB02hB
         1vLklzXem+JtEorWPQ7FZ3KWgKaM4/FoRT3ML9SferpIzfxwxt6qbRVjNe2g0ANcLgg7
         KMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869685; x=1751474485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=ftvaaCpI5SIuHG5NjkaBMJ2khX5qnU32L3D/bAqmIbB11VyJ7frXLXe+M/aVmHnbZ0
         NlEcadYbwi75Jhya/XoVzA4UP/CyD9Ai9nuXwgd//v+nFrEHqShk7E/cuj3wflf+KqGw
         KETwPnm1p+kP0KavGHEsA4E+hfinpB4EnVNzGkMCQ53sCB4OGL4UXgHR1DQ0fNRevOK3
         Io+h/H/dX3jCyHP22lzMLOn72M3X7X5RQlyMMNan70Vb1YwDHYGYazrYR0YnhuH4IYEg
         2geCvsY8yocEJ92XvwkAiVH9P/yOa75FYqCqE6nPiTZ6CaUoUUar94wH9KXzYgoRam9T
         KwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq6+qfp3/FfvhHgvarm9alFGsy0SXqNKYIKKHs4EFrdOzyfqCy+AOjUwCrBjmUKneWpPf2jFcoCsWKssI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTPWPFscp8nltylPGOEvbVEy9bh3ARVwZl2HXgYEx0Two/zeVH
	rsXTJrd4eiivZUKgrF8/ICJoRB6KsYkEmLPcHwbCBCInZ6Mldxs7++f6b/iQO+C3tDM=
X-Gm-Gg: ASbGnctHSKqxpctfceW70vXazo366yIb73Z/jqgH1d71hXyVjLVLZ/I0SKcjdu1jsUg
	mwutuuO1BNoNTgfDI4GXQF1SAINgQn/MgWabii8HY8MD/ID3P7MNJ8ed7I/w1VwFd3HxZ9sPjRa
	w+4RQ6nKUvoBPfXcHJfT9blLYFT5KXlUG7IvrAx4krBrOlSli1el7+9Wt9IeT//8eCW7MuR+1t3
	lbgpV19MBQD4hqKc8P9LP7rGpqCYktq1p7cry5KhrLTkR9beFxK0PZwEy6dU44yVhJWzYl1YjtI
	WLvQeNiuH9jYW0BX8ztANTi8FPMmXp2SndenH1ZCValWiaMr9W3pwXdIyeyzKWsOwbSR0BrpMD9
	5ECE1imy5i3n+RrEcTtanoO8YcPY19fwu1yYEXMddqQ1fIg==
X-Google-Smtp-Source: AGHT+IEJjH8bQjuNwdtdMHcIqr7TaeXw94sA8Sz7we5uKf6oSd/0mHR3v6BiNGUMN+0Ha8bqXVo/yg==
X-Received: by 2002:a05:6214:dad:b0:6fa:fcb0:b88d with SMTP id 6a1803df08f44-6fd5efab193mr58692036d6.28.1750869684773;
        Wed, 25 Jun 2025 09:41:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Wed, 25 Jun 2025 11:41:12 -0500
Message-ID: <20250625164119.1068842-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
only the RTC and regulators will be supported.

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

