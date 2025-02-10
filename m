Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4252505CA;
	Mon, 10 Feb 2025 22:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226550; cv=none; b=kOdgx41pUPO/yuzjtZ0zSSpaCFYd5EnP/hArGitUIfwBX9C+ITnQZJhm4zdRqEgXN5Ky/7N/0usMYa0rejW/v+qPOpxLzZzvHebkdlsiLeAfinq2F4y5ZQIhPTc4mej2SW71hUN3fre2muQEpYPss817J6iVW6HjtMPcsOaBsvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226550; c=relaxed/simple;
	bh=ByFoZYycOEnMo8v+be1ijDpKswWGIl5bZwExcPiyvvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMhj7p7SG9YwplraFyjg/rte3sFLZ3EHLuMsJTgQ5yyHlQrw/GhxHPouaCYHhZCxtoGTRcu/3e+qO+r0PLVJYWDykOA/uuWC6zyQ5tV9QEb+Z7PHVgm4oQ5I/2zlVvlQwzki1f7y4fNqSx5D+DxA2YzHJpoMhj4RkQbYrmvNzVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdH5P8xZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdH5P8xZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394820123dso7873705e9.2;
        Mon, 10 Feb 2025 14:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739226546; x=1739831346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3d3ndInuX+/aX+c3kZ16FGE7FXky+SP+vLiCNKyizbs=;
        b=jdH5P8xZOoYM1V1+scQGcrceiDn3DFLMej6TntDQ6VYLfh/esMc+IR49ivuZCsz1G5
         q9JHmXpVWJybiQZAncA9/6N1bMy8nFendaNGPgQdCwd2rCi+eEyONHJUenxB4V3wuDR9
         BfJpoZJRAn+71dQ9xrPQP8yyvDC2pq18Uhh660Vuc7u6akp/52GyhaGiuH3hhZp82xNM
         iVzmk83vyWYGWHrveXgiRcvvKEjr0ZdhPP4qvA+ezgToLHFEdB02z7zKGmXmsTfdJcId
         yOc6MBau9sLPb+h6wGkmBK8tXmylobFUBJMXjCOOe0AIwHUzSBv/94At2mjfVrPY0zCo
         7S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739226546; x=1739831346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3d3ndInuX+/aX+c3kZ16FGE7FXky+SP+vLiCNKyizbs=;
        b=bx9kM3yHTPg3O0nHRty+cRb3vZnjwmA+kHDTEJnUO2ySLxi++15s6bhFyvetgr2TxY
         D9HjdYFqbJU+yworaO+TpDRIMOfsHHlO7lwrSCHbMhvDpKuPrOr3u1pASfrJT21juq/0
         4rJAJQbRD0lOxmEVzAOVacjcMhT8hr3QY4Tn78zHyngz9Xn+xvCi3kiHkmpUpqJni+eN
         gMc8IuJ1wa70iwVgfNumR/GXPoMT3Ev8dy6GN4BEljXYt4pjWRXy3f1bSwEnd72cKuR4
         +wzRk0KNmbqMaCX+Zb2/Y9F7cX6e/3A3bh41zxiCKMFqZJDW27CPNuieAWT6Q2UN2bwH
         UqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0tV2TaOMnuTYnyuHM8alp10PUboa+OXFmahvAFxxH7bTRZBxv1adupI25lIt258stQ6TcKuk8kMJFPg4=@vger.kernel.org, AJvYcCVGRJvRNGSRLAZU7aTZ/mHoYSAXJ7/+JVmPu0NN3ljUvZqMDSs5JJbXZ4ByvWxv04ZJsY7d8Y+Y7vW3@vger.kernel.org, AJvYcCVypB9nvRzBZb6qJw5AN/UvZKl9GarPkpve+8qH2kZTgUSqLClJXRcSbftH7ccP9AZEFGIl5MNXMWrBTbUe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz1n6jle8QRK5ltlyeYBMuqu87IJ0nuM68fMquYe1V8DVcQ0MU
	YWrR3QpF0M+fWtfCtSgTVcnvdmUzQoOoh0S/J8UJyyTLjcAzg4bhknLm+AY8pf8=
X-Gm-Gg: ASbGncv8vYj0OAxxesrUU1hKJZfbTtqOJuPyWvd7iI+Ja2w43CUBEwn7kodmDwPINn3
	cJp8oyEEjFIg3dQBXx/3kwDWKCgD3LBTeuKShhJm57rFVdKLghhKz2jaQoOleFevM1DPYBVkh/A
	Wf7yj9ZtyFsaT7KPi5e7DXqXxJhFDLGZiZ1/EWlmOfNUjTX33k5cWHSTMF8kEx2SStEzqpa8cqS
	Q+VteU2Jq6F+Lqir0b1PONo0o3rsyomHgObRYAEtH7klXs5eMUCGEnEllgU4Lchu1gf0QqO58IX
	hFFlC/kSp5mybD56Ks/SB+Ui6Qmcg+s=
X-Google-Smtp-Source: AGHT+IHMNvUqNc/4x9vRuhzjOPcgViR76J3SZVmT/VILJ17HTreCwfc34AV9CbrlyEvygrdWPcHeSg==
X-Received: by 2002:a05:600c:4f90:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-439249b04f8mr119334925e9.20.1739226546136;
        Mon, 10 Feb 2025 14:29:06 -0800 (PST)
Received: from CYBER-ABAKUS.kucica ([87.116.134.57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dd07fa80csm9105081f8f.13.2025.02.10.14.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:29:04 -0800 (PST)
From: Nikola Jelic <nikola.jelic83@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: rwalton@cmlmicro.com
Subject: [PATCH V3 1/2] ASoC: dt-bindings: Add cmx655 codec
Date: Mon, 10 Feb 2025 23:28:46 +0100
Message-ID: <20250210222903.88282-1-nikola.jelic83@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nikola Jelic <nikola.jelic83@gmail.com>

---
V2 -> V3: fixed dt_binding_check + yamllint warnings
V1 -> V2: removed the txt file, fixed review remarks
---
 .../bindings/sound/cml,cmx655d.yaml           | 78 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cml,cmx655d.yaml

diff --git a/Documentation/devicetree/bindings/sound/cml,cmx655d.yaml b/Documentation/devicetree/bindings/sound/cml,cmx655d.yaml
new file mode 100644
index 000000000000..1648f606bf48
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cml,cmx655d.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cml,cmx655d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CML Micro CMX655D codec
+
+maintainers:
+  - Richard Walton <rwalton@cmlmicro.com>
+  - Nikola Jelic <nikola.jelic83@gmail.com>
+
+description:
+  The CMX655D is an ultra-low power voice codec.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cml,cmx655d
+
+  reg:
+    description: Local bus address
+    maxItems: 1
+
+  "#sound-dai-cells":
+    description: The first cell indicating the audio interface
+    const: 0
+
+  reset-gpios:
+    description: GPIO used for codec reset, negative logic
+    maxItems: 1
+
+  interrupts:
+    description: Interrupt for the CMX655D IRQ line
+    maxItems: 1
+
+  interrupt-names:
+    description: Interrupt name for the CMX655D IRQ line
+    maxItems: 1
+
+  cml,classd-oc-reset-attempts:
+    description: Maximum number of times to reset CMX655 class-D
+      following a overcurrent event.
+      >10000 = disable limit.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 10001
+    default: 5
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        status = "okay";
+        audio-codec@54 {
+            compatible = "cml,cmx655d";
+            #sound-dai-cells = <0>;
+            reg = <0x54>;
+            reset-gpios = <&gpio 24 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio>;
+            interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+            cml,classd-oc-reset-attempts = <5>;
+        };
+
+    };
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 333491cba969..bdb42c22325a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -308,6 +308,8 @@ patternProperties:
     description: Carl Cloos Schweisstechnik GmbH.
   "^cloudengines,.*":
     description: Cloud Engines, Inc.
+  "^cml,.*":
+    description: CML Micro, Ltd.
   "^cnm,.*":
     description: Chips&Media, Inc.
   "^cnxt,.*":
-- 
2.47.2

