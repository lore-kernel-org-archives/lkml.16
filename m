Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D427224E4D1;
	Mon, 10 Feb 2025 22:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226513; cv=none; b=qnWTdPN4m8CwssgsQBFQHNloY9l9WsKWpdypH5JE1f8+aLp8BSTYEhOF2ALcW3WoCrzTOGKRa0l3pY1E2aqJmVAkTFXVDAa8eVtYiMcEaQ3OVNzYfMflRxlzEVaOsIaDmXjmrPEILd7Az+rqAs6jO/nNrpZGIY7+88sCC9+LBZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226513; c=relaxed/simple;
	bh=ByFoZYycOEnMo8v+be1ijDpKswWGIl5bZwExcPiyvvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQM4Elr+912U2/AC5AYpqio9WQkLSy+XL9e4p7o+eO7v3QE/RWiNlIBCmh59t2erXelOuQzqFI8kT8ylSD3P1oaTTpjutD2zGgQV4G+EaPXfKWQwoeTM/qJCawnbqaEkifBNk/LNRQ9T092egwPcErP8P5BNgMuTOddv4A7c6qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eX4691bW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eX4691bW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38ddc36b81dso1174370f8f.1;
        Mon, 10 Feb 2025 14:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739226510; x=1739831310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3d3ndInuX+/aX+c3kZ16FGE7FXky+SP+vLiCNKyizbs=;
        b=eX4691bWq5//3lmddX+e5Kd9fMIU0OhRUjv3cyijQGu7qpVEqtMeC9390ncJH30kGf
         BsC+vreKjrPAIu9r7MWCFwkEc7qg4y0h8IPf25V+AeqbXB+8c4H588AjMTsqlerTRObK
         YOjkXQ2UJV/xair6VF2bFApNzle8HVym5wKOgboX+S2kM+F9yr+NCAKEpToBOh4CtvZH
         O9ISEImPPC2hLdaCvYog4p/L7czzovsZtoozVHckmdsajfGZU8lrlxX+NhGDIPjBcdZF
         ZImJ26RfRBA2IF71tLTSvFFbxL63K0OCscPDT675Ddok8JNsraeXi63BM9fdcOOe653Y
         CWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739226510; x=1739831310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3d3ndInuX+/aX+c3kZ16FGE7FXky+SP+vLiCNKyizbs=;
        b=JiHITDb05rXXTN9Sa1y/r1VnkxqH7IU+tGkExsWtY0qL+rCYIGkkJ+9foO8o+wfWRD
         uxgGCYOI8IIxHTErXPyIZoGd32UoIOGQXYlfKAU51IB4TiC5Q05DTKYWN9QFKSYEGhZf
         VoJZCpm6Arf8p5E/1AOASLBWBAgLhn2+xZUu7BbEeN74pENe6Po6AoOYQBaIXh2+KUcs
         35xx7SMR571plT6FML5+h4o2W8z//cl4s8cX7dKbpv9KdiEakqq6fqxM2tgzxGJTfEBp
         UOKyCfAwwtyj1piBJ5R1giL7J6uWZTflbmpF6U9QMs96mnzcjH7oXO5se4DYPzEQxdCj
         unZA==
X-Forwarded-Encrypted: i=1; AJvYcCUHQbMRyEmuadwFzGMfZEG0q2c+GdJMhKeBIXcTWISvoGKHdjwgD4Dts9LXcU+C5XgZCDCAEoWYXfO+@vger.kernel.org, AJvYcCVOlf/fGQaKbMKWfuuVkvMLpjjcV/0dRhKJli9DPbIy+ADWiNyBrTre5eQCAIbHMVf7VjBrKRHlyIgCeu2n@vger.kernel.org, AJvYcCVu2DmlDVYY62Ra8DZVsfVUYaBA/yviYL0MnSjiQ4+ig4jW5HhtLf2c2fOVy0dPkUSeCR4Icof65s3ZQnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgW4j5GEBXV0WPayU0qXAj6lmUpWuxyu/PZmXo+1NS0SLa2Vl2
	y9KQUV5jL6r4L7CAPL3z+Pc80giqr5pQ54MRqTGQ5nspltzUx6lYsddo76XcHPs=
X-Gm-Gg: ASbGnct9djqM+fLk6lXYEy3F8DSo7hWnXEjveBSEF03PlQgoB0B8eFb9BPW7PqswZbq
	o4DtRzCAx3ThqeEYAd5zrsm8LVwfGEzc2JK/Et+5oWg3zD1/oXwhgC48ANFgDUuttcTdFtKsLBF
	pNa7oMMIFuff06TUqCL6BFyMGbITDZ2zFpxgccDXI6ESwiCbV72pDstNMsqvrfKr/vKlOkOo82M
	NRZAUIkRoDDVSW2FOnLfkI72QtYf67WXdmf3oYkP6gP3IWVo/5EU9Rmz3biYBKQXzKWF6EpfIir
	4eim7XUyvwHeHLIrYAqQGBEE8Ketr0s=
X-Google-Smtp-Source: AGHT+IFXIU18dLzViUZXXs3cfXXsk83rSkzcXzRc+lVd4GO++ZwyVOmMLXMNDGsW6Y9xo1I8lGPpSQ==
X-Received: by 2002:a5d:598d:0:b0:38a:8b34:76b0 with SMTP id ffacd0b85a97d-38de43ec4b6mr836146f8f.27.1739226509950;
        Mon, 10 Feb 2025 14:28:29 -0800 (PST)
Received: from CYBER-ABAKUS.kucica ([87.116.134.57])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d802sm198475845e9.12.2025.02.10.14.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:28:28 -0800 (PST)
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
Subject: [PATCH 1/2] ASoC: dt-bindings: Add cmx655 codec
Date: Mon, 10 Feb 2025 23:28:06 +0100
Message-ID: <20250210222825.88248-1-nikola.jelic83@gmail.com>
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

