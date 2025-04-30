Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09F021B9FD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003798; cv=none; b=oyzBjkWC0lAmAZmI3bRKsyqbFTFpeLFmRz5ZoKlqat8qgje2hJoJhr3SYaAOau8Iv+vwOjSznBZ5U/6JVVHbyhhFtRwT+4M2Ei3aLLGevrusvehLpPRSlIUosCiqu5GIJgFKBghWtkl3tdhZiAv0Ikapw/FRoJ9Lw7cbp4tA8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003798; c=relaxed/simple;
	bh=bFksOeknh8d+JfpwdhA3LClj8Y8cCin0vyzLAmX/vl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BFbvjn/oTuofUFOqOQq9X9SGgXbOUoNZ5iNkrf23cFunVL5hsR0xYkTOiNpeTALmhB4LTFaUJxLQH5N5OpsFUcyG2ZhSjaS3t5ETKMqYpNw95Zph3Mw5D+n09yQFJPfpgCgNKvjOiqKogOPYYTm1r2AOo2+jKlyxamyOa8O0ysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SpnR9hNl; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SpnR9hNl"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2aeada833so148133566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746003794; x=1746608594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyiytjDRdFd6s+6c7xd37xzCdnxjjI1OzqbZfUcJ7Kk=;
        b=SpnR9hNl9mWf+MlzGEOO3WnMpHiOBSGnU437elz744n2CDKB5ZyIS62qos4elyYpZO
         m2aQxpVcXAxbhg0eUcNDuYhjJ0yPxl5Km1SA47YQ6EG3fURKHyWChpBw+jpSTzstIsE1
         KhL4KRQdgnc5bkNkubk3ixyYV/NVJcXwKG1dwNbvlu85t+ZXqsSSyzCe4XL73ccrA54l
         aOwRG8ByaUMAFGl3eVSKFgkLsWLBBeTaboTQcSM4seJiPhrjNnSv5ldBEx5+jaEc8a5B
         vVFkDvyHRUw5WXoL4blNNoZroeU3ZBVc8osHJs8gbIToUFuJoWwVM3FUZPqwXPI1Il/x
         WfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746003794; x=1746608594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyiytjDRdFd6s+6c7xd37xzCdnxjjI1OzqbZfUcJ7Kk=;
        b=MdkitgGptoLedtfcOH58//mhpGNt2LyD6SpQm+nog2hNjPS+9/1Z9fCUlu8MddX0jz
         IngL3tvNd64u2LDCpBSM3RhomC2UMr2ThIRTPTzwVAnx50EukzBhH4Cyp+DA0YQuNjg7
         gR/nPrsTWJVtPR9I4lggcBQM4sKkhh+d07pAQfn1uf7ag3trDbP+vXHNw3yrLqGeyPz8
         AiO64H7+0p6reRSbRoszZcSSmFqwv0tEm3iqiKoC10PZKWBmJyHpp6ZSrYr3Z3YJsJGo
         wBDbSNWQreHPN3ZOffvlYpTLRktcDf57tszlbxQiaNbUe2WrAVI8hXA1+rjx/xRReirV
         C4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNEzorkmmjx273KV4VjBeOg+lucyDXoM4nX6UYes9AAn3IpU5zaNGNkgLFBFLh56GLrBwBSdymCtg5ijE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0i9dqW2NE6RwbCWqgfKRGcfYJDSZCJQ0s/Gp4CYoizwTVrRoS
	WvuK9xfXbHuVtj4FK/CXBBrqe/qpNzc5mBGFA04LlfvMYR/pl6TXf8GQN/6NFbo=
X-Gm-Gg: ASbGncvKdJY8y2ATDnS0zsjBlK0t+GzNhvndVFB+Qm4v7/Lipex6WoDYSqitCwQi+z4
	QpC5mT7O8nrkzNR2dn3digILyZ8dGcbjQzKgah8XvG4q3lMG+lFJT3H4A8HCB6fqsR/8xLe9eNI
	jYOxYrD0/9TtNY4+vPfy8Y7IMlFV7irkd/TCiY/JdNFxur5fIeAnpkfmNKa4ReyEGqWQEiWCmuT
	TY9n1NlC8i6Gbngm1ypXmCj7ZC9W2rbN679C/NeaVUCPtgA4BVI9I6NGV5uFP8Q+Y7qUe6729KF
	E94fK1k+EzNNY3Orn4nLHfNLTneEa34V1X9eoNBoHBHlxIoW8p00LT7uws0NoZrLIGfKvyNyM+I
	riYcVOwTOjreb0T9xgL3GfIlD
X-Google-Smtp-Source: AGHT+IGcixekqMbiCwTt0euFgr8qyktPoka758m284mP8XwKbyfXBT71rs+QPFdZrVWILYzT2lipaw==
X-Received: by 2002:a17:907:72ca:b0:acb:37ae:619c with SMTP id a640c23a62f3a-acedf6be04dmr180503466b.15.1746003793663;
        Wed, 30 Apr 2025 02:03:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbb6sm889676766b.28.2025.04.30.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:03:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 30 Apr 2025 10:03:10 +0100
Subject: [PATCH v9 3/6] dt-bindings: mfd: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-max77759-mfd-v9-3-639763e23598@linaro.org>
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
In-Reply-To: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This describes the top-level device.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
* drop gpio-controller and gpio-cells, GPIO is provided by the child
  (Rob)

v2:
* rename expected nvmem subdev nodename to 'nvmem-0'
  I'd have preferred just 'nvmem', but that matches nvmem-consumer.yaml
  and fails validation.

Note: MAINTAINERS doesn't need updating, the binding update for the
first leaf device (gpio) adds a wildcard matching all max77759 bindings
---
 .../devicetree/bindings/mfd/maxim,max77759.yaml    | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..525de9ab3c2b7b431e48497330640857540625b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 PMIC for USB Type-C applications
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is a part of device tree bindings for the MAX77759 companion Power
+  Management IC for USB Type-C applications.
+
+  The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensors, USB
+  Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
+
+properties:
+  compatible:
+    const: maxim,max77759
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  reg:
+    maxItems: 1
+
+  gpio:
+    $ref: /schemas/gpio/maxim,max77759-gpio.yaml
+
+  nvmem-0:
+    $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
+
+required:
+  - compatible
+  - interrupts
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "maxim,max77759";
+            reg = <0x66>;
+            interrupts-extended = <&gpa8 3 IRQ_TYPE_LEVEL_LOW>;
+
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            gpio {
+                compatible = "maxim,max77759-gpio";
+
+                gpio-controller;
+                #gpio-cells = <2>;
+
+                interrupt-controller;
+                #interrupt-cells = <2>;
+            };
+
+            nvmem-0 {
+                compatible = "maxim,max77759-nvmem";
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    reboot-mode@0 {
+                        reg = <0x0 0x4>;
+                    };
+
+                    boot-reason@4 {
+                        reg = <0x4 0x4>;
+                    };
+
+                    shutdown-user-flag@8 {
+                        reg = <0x8 0x1>;
+                    };
+
+                    rsoc@10 {
+                        reg = <0xa 0x2>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.49.0.901.g37484f566f-goog

