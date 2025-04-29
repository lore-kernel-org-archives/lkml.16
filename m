Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141BA293B58
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914933; cv=none; b=U4K3azMH7fBCJNDQSqfNgrsm8JjCGH+MR8HIj52DH8mZGh/wcDDAad2p7kHBVCFhig6kqhJtUBeO9pNiGdfe9YQKjZN5dnUA58QFokAzk5Zu8BgdkHyRCzbo9Lt/sdTOfMrM6Pwvo1vD7rXpB2ZzI4SjGzB9KgbrOfMS3JDThZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914933; c=relaxed/simple;
	bh=Cc1Ucs7d+DoVlcf66E1KPy7NQ5fP8mutIpm2TD0VDuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbvgkEMw7h9CWR7xFRJk9KNqCXKzTHJtS39MoSiirNo67LePIROrxnWHMatkjku3HESqyUi38kRi+/MMVsn93FbuQWxFvxhE/9sr045H2+70HAtXJ9y/i1CHL4Sy9g6FtV5lIF/+DKlWiMYg/V7jQ5CGODmy8HE3e7WD97IayN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JIx/2dq0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JIx/2dq0"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so983518066b.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745914928; x=1746519728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rgc6ivQ4v0OBxVxiMV//REmkxOVzSIsF9RwMWgdL0S4=;
        b=JIx/2dq0IdP5lsWIrTOPOeR6rm7/Ty0PDCRQFTGX5B+VLkE2tL7NxkZqVceAoqOeNb
         mVD3rpFNJ6vrN1bXWUjkrbklE8VG8Ln6Kh5sh7Qt/Aj2SIfW/dI01tp9c/K4CfrTojtK
         Zfj/SQ820rMqH2oHDyia9AyjQy9PTH3yhVUkUaFBUjETIPku/bTrUT/zp0CJOl7PYAi1
         kGrPUWO5WpfGeskOfcmfd/cZWKL2Wa1e19CNBqGFjMDPEUpKD1sOiZNyqigG9cfN8SOB
         V6pxHsDYgZCtHXs2xg9dJ0+OoeOeXDu/esQGmZiOihr4G2wPV03hZctH/+29F2WwLBWr
         lxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914928; x=1746519728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rgc6ivQ4v0OBxVxiMV//REmkxOVzSIsF9RwMWgdL0S4=;
        b=BgsovfjOgGi4+AyzBjiMI0B1/x7fuNi7Yn9her7fTRfzuv9thhWtxtMGRxmLrFMI3A
         rn8mhpCrJSmm2UoGpr4F0JAGm3qa6RApCkp59nP7v0RjrbcAoOCDQ+Y81+FnwkR0dQRV
         hviQM+s/gqT2DOOlmmwfFpScPsHHdkqgBJA0fVmF/EpDAyoq8D+4u0syy4XXvTGhneXW
         zvR/QMFce69U4X57X+S59TgAniveespwi4iIzxdm4FSmKN9LtEAb655n2zf5T83kMn/w
         OKHldxpN/MkrujzyMZBdduAKBiI6SWy/NE9+/9TgtcNscwLWe+OcZOMxvUSNWzSgbduc
         aUIg==
X-Forwarded-Encrypted: i=1; AJvYcCUJNe7JtneKQBh/pd0XgdZhdGgHuOausYfbRsHqb0RoizKliotD0GfGrqazOXi40SOqTn4Mtr9QtpoYSjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFSGojqqcnaLweLpGszV/03iL6iWnnYjaZvED3ZZlq3OnOdyUE
	M7S3CRTJdbawuqMs3Cv9qkyfMRvHdUJi7RbmaPK9MQvFiQpP040DVtzLrOLzQEU=
X-Gm-Gg: ASbGncv4b0KBqQU3zsJPaXytxnHmpOvA1gjtcK8Oz90ZqBRhBo2UEIh6yCLXtmlVeA0
	UuQTi+qEWG/B1Tc3cP7Lf7oO5mEfcgZH40f0iEKJf5xeyqIdy1hlmEjtCVQA1appyCSEmghx8sZ
	zmQe4rG/0l6gqaxB+e3jRQPe5FLfg2ifnGtJhnKivubse8HCzVUZwosDlo6rM1DuwS+RYzshRWU
	lk6ifOYQuZ8ycQvzgc4aF6rwOxt4nFlrG30TMCo2z5TVRTHT53gTQGtnKlIzyqryYJUM5ITUIhB
	hoUhzmBi/EYXbXMAV7kIaToYJn+3Dn8kPz8qbANySPbNu540xD8PK5oZJEebZvaYXkm9LjrF/kw
	cpXi0a7ucijbmWOCcAAHTwVwE
X-Google-Smtp-Source: AGHT+IFe3Pnn1X/IyxiNpZeYuCh2G0CyBjUHp/1BGmD7TkeokHlJhATW4MV7s/37c0u7zNh9awdx1w==
X-Received: by 2002:a17:907:7e84:b0:aca:d83b:611b with SMTP id a640c23a62f3a-ace84aad97bmr1190165266b.43.1745914928158;
        Tue, 29 Apr 2025 01:22:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbf4sm737905466b.36.2025.04.29.01.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:22:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 29 Apr 2025 09:21:38 +0100
Subject: [PATCH v8 2/6] dt-bindings: nvmem: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-max77759-mfd-v8-2-72d72dc79a1f@linaro.org>
References: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org>
In-Reply-To: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org>
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
2.49.0.901.g37484f566f-goog

