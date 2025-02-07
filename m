Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B3423C8AE;
	Fri,  7 Feb 2025 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738944858; cv=none; b=Rzn+UXdm+ad7QbtBrUDr1i9k9SqBv24vXE/p+E+vNmDg9QQFf2ncbKO0AJR1DQDs874OE3eOS9BkRFINRnaFsRXL1LAsI6g6xmdKnbB9ueoItsXN/R2jJWUXaD0Rq0lyG7gq9TBAW8XZiQ8yJ9vcKoUZJmkY0u3BzVHadrkFvd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738944858; c=relaxed/simple;
	bh=EM9klKFY4xMwaWQWmsojjGWIcEKo0Aso40CzFs3PHgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJV+mQTZqlO70bBLcbd9fAt4SVcRQ+KYrDdnE7uBbvY5J8hLew3IrPD2hLV5WfAU44NDeHryJzjslGuv63PT0pddLkf5ctZZ4U37cAH9MFdLB6y0iWcP13050fcSwg4ir2XU1cKTE6Wmklp4pvFBf0d3w9Q6j+cpm3sJn7tKk9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIlQp5cM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIlQp5cM"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaeec07b705so388757066b.2;
        Fri, 07 Feb 2025 08:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738944855; x=1739549655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VNoNUqAETs1xeTDeK4+IVuq9A5rrpEE0Blu4HixpU0g=;
        b=EIlQp5cMMe+jmz6FojOSa1Yo2AlCnSuMcXN/AdXqJXPlt6UWmQRRyqSlQsFWYEa/LV
         Xub9lCz873J69afS5gKyoQ6A9WRBmaE9MISxTnDttY433aslgD4GP96cmqu0nkg6+BuN
         pbcyyanZw74wd5WdDShVuYKii2hDD3rE69R3U2RtTlefL7Xdt4lv7EHC6DavXcpxx0qe
         R6FCaRm4C3B6b5GesUxpKVw6TsbuFrbNsSX2LvBSGcvQXRJW4DWNFtYrReEx5gzq/CF/
         G0abhpyZ+z4huafSz3v9Bsg2MCcykjwbFvW5j49shdilrigJqxo9iAWvYZHDReHb4IiA
         jFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944855; x=1739549655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNoNUqAETs1xeTDeK4+IVuq9A5rrpEE0Blu4HixpU0g=;
        b=NIsml22ALST+jPe+wyLPaW6YqMyls8ZiT2IebaGecf54GPWh5Vm0TWdeKxpMJ+R34h
         nBA7ic+dbxe4hw2hLAaJsSMndBCk4G/q5CWvFUgOi71jAqkuopEOHfcmwUD9jAFEEGbb
         fexZjlghs9ILXROLGyjWLpYJlmTvJfbLCMeadgoa5vjWn71nT7KpXjM1WgPt8EqKEK0X
         whgx5O162buZQnJEZ+DshL/lLqydw4gj6q/Togiro1ItWN/C1QGdLjGiGgXHG6FEj5gB
         hkfsRv67Q5axoX71BFDMoMnvHcDR3jnoWhO0fkhus6njSoWGJWSQKL5YEmBRRVfFfmKl
         JOJg==
X-Forwarded-Encrypted: i=1; AJvYcCU3moPVxn67d2K+m7KzFCE5xyxWJF1Nnvw6MpT92tZFDj6x2xREuqJoCScLKOXFFvOq4zEYrM1KZpfO+rM=@vger.kernel.org, AJvYcCVxOKwowT/7O8BvizwoVJxEnqrbTsXeUrgShe9eQsU471BK8HzFSrTfPPdEXobz0wfkqTodbubCG8zWfo7Q@vger.kernel.org, AJvYcCXHd/Lj3FmvwkLRU9IITyvd4ykw+SQtWyD1ERgtN9/Pmeigdg5Lik1kttH18d62Ivtl3Et0dDb33V0O@vger.kernel.org
X-Gm-Message-State: AOJu0YyCzlz45f5MbjnlYCnYYj2FlfYS92FaK5on5R1BxRUMLLUvj6AA
	DzjW/PA0T4thrykjcuIOWM+WvhWedyDe2Mdcv7jNQxhpdLvVLL5k
X-Gm-Gg: ASbGnct3LzSS2L2Ohw4NGF77+JvUqYjRr1cB+v4MAUq8pfQZtejInIPPWZl/6rdrfVO
	weQx2RaSVNc3gIHvlBtJXwdJmycI7Rtrc3CwXqk2Ul5NHYbopPiWFJsh609HrGOdWsoQqR7LMaa
	TnEvzfIBYQMGZhlJKjE7cuLOOATQKNTArWj3hfAyj6EKBO9QqaUboeVqRVEuvQGpgKe6echvwSH
	bHJCbz0s+R5EO64c6JlSTIsJJ4K6WX4pdI3vAOCdVms78cfbElYOZM2hK4JISPDF/UNH+BPLn9S
	ZC4tgMMN/2oh2jcZenT3gP5Xe8UPt9Q=
X-Google-Smtp-Source: AGHT+IFN2gwGauYCLmmBl6S5dp3zPHiMgY1Un+kohLntY/fjgMFUk0oT6fB3bJBthbtbFhaptqU/oQ==
X-Received: by 2002:a17:907:9719:b0:ab6:e10e:2f5 with SMTP id a640c23a62f3a-ab789bf6ae5mr424561866b.37.1738944854519;
        Fri, 07 Feb 2025 08:14:14 -0800 (PST)
Received: from CYBER-ABAKUS.kucica ([87.116.134.57])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab7732e712esm293592666b.96.2025.02.07.08.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:14:13 -0800 (PST)
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
Subject: [PATCH v3 1/2] ASoC: dt-bindings: Add cmx655 codec
Date: Fri,  7 Feb 2025 17:13:44 +0100
Message-ID: <20250207161412.6281-1-nikola.jelic83@gmail.com>
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
index 5079ca6ce1d1..c471a4b905cf 100644
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

