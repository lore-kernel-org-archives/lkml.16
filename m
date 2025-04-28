Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69067267729
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840173; cv=none; b=fuWwKr6BwhjliXE9Ogf2ZCeiOVu5rVOnn6ZSBtL7KPD2oJB0f/hwcqwytX0zoPN+zb2UYoJYfhUOsLFFWXUbAD06JSIndLGyyf82CQdPEVVGdkQla5SlPC1YOHHlXclMuGV7bu2hpeqS+7dXi7bvfX9QvMamNRmyqPU4qLkwqYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840173; c=relaxed/simple;
	bh=U6P6ZeSrPYv97XE+r6V4N7rXLoprPzfswXE2mWXxNIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUxT+K1LVoAin5r0JYqXBK7lR2E84zgi5pwi0i/EgxCCWG6+nCbwPTGhNfiOvXfB9n8DU1QAulG1H6is3XBbWUgAMPICRwShBYGfe+dDmD9ZCzgXuKUjmi2sGKBTCsB923/mw94Bw3PT92TSW5Ib7AGLVp3vPb77xXiPXiBuQb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QIzvOetu; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QIzvOetu"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac25520a289so727414866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745840168; x=1746444968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBA5CuIc8YCbS4yzG+KOg86MsWIMfhXd5TGhL3Zsn8A=;
        b=QIzvOetu2zQNGBnY6qQ10Hd0E2cuXjR3yEknUr4z1FLnwaXDRKbM19Z5ZcAU8wm9M6
         lS9tLZJ19BvARJta5dYONz47toSyzpXr8C/EkCaZDalPz3aKqz13iePB1O/OVOX9USre
         o+EXG+Rq28vJy7hISuwU6UnYMG3tYs+RoYuFlIZUYBKmR0ZwXX38VRtzqSCN3v2jwMrn
         esWXADdmjmuGKxM3exWpDG8l1iQS/N3Ansdjjv6GL66QuBrBHsd+rLq71vRENBBFDIsP
         kxothbp/p6gsTA0v7Lro3gFRIEyyaR0bGhcCPIVqEuPGXiAt+c4EzKBv+KlwQzEHR8qb
         QTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840168; x=1746444968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBA5CuIc8YCbS4yzG+KOg86MsWIMfhXd5TGhL3Zsn8A=;
        b=m5jovAIYrs3mmvvrayvOBf+4LA2NmDhIySwrbJssYGQmU41u4g97gDju1/GFAtykfn
         KE4OB3b0JdLd9/hav3v0a2Sb5hm9hVii8/hweXVGGZxYKaPks932doB//YBFtkU0cpQ4
         UTlXoj8lgpjztbOLJSpuzguHZy1yONPR/6DS+i6R0fiid7PYLzxUjStKlS1svs/pVUbQ
         O0xpIUial++1tq3ardziTEx4tofsrB8ggeMc4IOBU4eIcgDcVN3GwqeYTJVJBrCzP+LE
         GEWpuAlYx+qNJ6b5quKbekYafpGrxaCOVa6GlVlSFrR2RXGhnMnto2wtDfCeLQ5pGHIS
         kGkg==
X-Forwarded-Encrypted: i=1; AJvYcCW5mgKEE4P1ChspRuATsyYFHtld7tiKtrInBcFeryLYbCcfOkn2h5D8LxRmK5kc/WHXeOFksrWExXy9dQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJlXbUzuv8tequVyhzbPUYiXEqNPsJG9cokZlvfgYWpfTyLqrv
	MnzNKxOXd0lo504qyycpZAgxXkaGTTsebLlI54Nghgcj6jxZPBf3EV4Vvk+f5OE=
X-Gm-Gg: ASbGncsInyVj+sCsSWf6x03Cbuh+PqHq8blfE0ZgbD1gbPRcQ96p26W838vENnH6tj/
	8/WPxn5man5P4Q7YBobzsAQVmUwhbwSsoBHvoQSoQpU4vvPwPMM4cDmpf5iIIF29n+s1CxPruYC
	yZNVBIeDm0lvz2YCEkYsebZJxHBX+8YVio4QDV/yTPS49kxx48mOqe0BPAXfjRQ5m1NVeBkV96x
	A0M99JQDZDEZWBF1PZ0rI2oHMToPgmkhAARw/Ui0tXcNPM+qH9rjtx3D1oHiC5uBDT7fy0WTBru
	XxPKr6SyQRgP1/pxjomPTXxmE3hJkwHwaePMFqXFLdrBBaolFLG1iOlONNUxvK7/mmNaxJwunpv
	VEAfhbmWlyUnAoBhR0ISdRmqM
X-Google-Smtp-Source: AGHT+IEg+c7X+Ta+5FJs9im5JHBiLsTS2tROmBMx41A+5pPg9TXu3iCXPaGd3tUwOuhF2Ei4yP46AQ==
X-Received: by 2002:a17:906:9fc6:b0:acb:5583:6fe0 with SMTP id a640c23a62f3a-ace71095745mr954872166b.15.1745840168498;
        Mon, 28 Apr 2025 04:36:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1580sm619937766b.175.2025.04.28.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 04:36:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 28 Apr 2025 12:36:05 +0100
Subject: [PATCH v7 2/6] dt-bindings: nvmem: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-max77759-mfd-v7-2-edfe40c16fe8@linaro.org>
References: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
In-Reply-To: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
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

This describes its storage module (NVMEM).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
* drop example as the MFD binding has a complete one (Rob)

Note: MAINTAINERS doesn't need updating, the binding update for the
first leaf device (gpio) adds a wildcard matching all max77759 bindings
---
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1e3bd4433007341a11040f513bf444866b9e38a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/maxim,max77759-nvmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 Non Volatile Memory
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This module is part of the MAX77759 PMIC. For additional information, see
+  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
+
+  The MAX77759 is a PMIC integrating, amongst others, Non Volatile Memory
+  (NVMEM) with 30 bytes of storage which can be used by software to store
+  information or communicate with a boot loader.
+
+properties:
+  compatible:
+    const: maxim,max77759-nvmem
+
+  wp-gpios: false
+
+required:
+  - compatible
+
+allOf:
+  - $ref: nvmem.yaml#
+
+unevaluatedProperties: false

-- 
2.49.0.850.g28803427d3-goog

