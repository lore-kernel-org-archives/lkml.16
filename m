Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4722066CE;
	Sun,  6 Jul 2025 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799216; cv=none; b=ebPsXLig2KAtLRxqlG8WDMz197yV2iMgoeheW1JuSW7N78uDBO7VAX/FONJHQivS2zPtN/ASkZXfE+RwEg80cErmV36HJLtdpyABrVhy+vC9i7LnWNKVPTMz8lnuYNERMLxfAOZKR2A3R6Gy6WVnwJDsfUSkMB7S3FqrEmF0h0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799216; c=relaxed/simple;
	bh=szUa33vd/ZeNRlK8+XAGw9kUaHmYiqKdYCwv2f2LtGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4y6K2+Hgy3qWvns3LgShzeeEMRB01NlDKPOM8G8yHKpBZNFyafRe6Dnri8ZnbJOxWmFdrh3+riuM95znkwjAHgn1a+SIwToPVtw+JZY/8pmCQcduv4qmhFrIAZ+3slQsFAoo6DgTCzoDXXVV4rCGSeGmTGwnscY8t493Y7JV3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goJLOkFD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goJLOkFD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb79177so11860015e9.0;
        Sun, 06 Jul 2025 03:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751799213; x=1752404013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+lfzTeL1Wak4vcj0bIfTcePGEdzEu1RxZDN+yd3UWY=;
        b=goJLOkFDu1s9CUKVmu+aEt1SDLY5KllTrmUTnWLfzx9mHyw2AJu5+XLCOC/9iaMH8y
         TbKCs9/jGna6KeCjDIVYJ3oEDCH931NQWSLHUHcvQhZGv51akBHIki/t2hgWYJJZj5VY
         uoyjN+sXpTL8ywrkIkhPSavEdfdUjmAqqqbpDYNJxBIKglrvkVF3f9XnfzavuGaLCyq2
         Xns8skn2RGczP5pdf9eZpnnbyxV0iDUje+y37YD1Qz5S2ACaCSO8Fq8dJBJe+OTcRKdy
         dsiZLkfWRulyy8xdo0BrY8lIAyl2Ktoo8ipZNjRKd8aypPjKduMTOHMHWOcUsoyFnAGc
         77mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799213; x=1752404013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+lfzTeL1Wak4vcj0bIfTcePGEdzEu1RxZDN+yd3UWY=;
        b=efloAXPEf8l3hiHzWMSeLrrW0kONiyODrvctnSgUFFhUXcimXI5ehaT+BAPz7/3NVF
         /nmKPWtBHadMBRrkELdSXCULQBzq9EoA5na2ROcsqhGYx8qd9MKT23N+8gwIzXLyagZD
         5iVCDCB8bUi/oaZNXj4AbIwd+XwDIGNwbwIbtoVpI3GlrfPOi1WW+PN8YmHMb3MuxAOi
         1ljY6fIWy5nugxDZs2iYUayQKFkykUh25aESniq1N4pYHtIKD7tN7ZYq0T6hCZ+nIcaV
         Fgn5wEVBnvFX2QHBpnZEukXXDIfViSZ7PXKzmS2v7KFGfQXMBcA7H6BXiDa/2TTuYJwL
         reaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGIPqWJ2boFxn+3TSBJf0Y3CBe0UiuURjonBqYg0eSj9o/sZzt87zpm545JoiKQ9mjXFjgo+MpxaQp@vger.kernel.org, AJvYcCVfZJQnvgotRUB3vxyy0UjY7qEUwt8L98p2tgjGs3/uta+RmZjymaUxTSh048fEJr1UbmMGAoYgPqYqsxgO@vger.kernel.org
X-Gm-Message-State: AOJu0YyIP8aXBMXlVt0591wy8jORDzy8TJElaBLnY/DPjJdXCeqouvm1
	iiiG+2XaHcH9E5z8nscszL28HpyHvetdAe8OfKvlGHU+9lmsltRBZ/rI
X-Gm-Gg: ASbGncvT1eXE1eYpg3GeMTxqwh/0pNlLmWWQY3QR5kE5bi/5EEjWi4Cux9IHbx3Uz88
	7wT+oL3MzHit5CPi8YCSizq7lb8wYF0h022x6jAFQvKqgglbNkNoEwreElu2VLgLGPle9I6Ef7Y
	yXR27hBcNnUCCjwkXQglkcu5AebLpWE31jwwNhcZy1LiWCNEhge7D3g+nG+AK67mVY1Qxn5GdpW
	CFlfUejxOh21fogh4YwlBVABWUyjaoYw4PvB5ZNaCFA4HsjStFHtDh2u7rUskIHc5bifxgaWYH3
	Dqk6lXIC33tjSlTSQFFXtiZPQpqbhu1+PMeADxcGQxz2QgsR0FA1nmzvnx9M65+5rk15B7iBmmG
	+yvEIFvbm6XhMBgCuVw==
X-Google-Smtp-Source: AGHT+IH6R0Jp8Hq/t985W7tyvZXkpIUDCZuy1jOGNEjME/e3KuDxGRGllcRtTyI7IW1Go5tnEGrfqg==
X-Received: by 2002:a05:600c:348f:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-454bb736a88mr45526065e9.0.1751799213084;
        Sun, 06 Jul 2025 03:53:33 -0700 (PDT)
Received: from masalkhi.. (pd907d170.dip0.t-ipconnect.de. [217.7.209.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1634147sm80283985e9.18.2025.07.06.03.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:53:32 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	luoyifan@cmss.chinamobile.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	christophe.jaillet@wanadoo.fr,
	abd.masalkhi@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/3] dt-bindings: eeprom: Add ST M24LR support
Date: Sun,  6 Jul 2025 10:53:09 +0000
Message-ID: <20250706105311.395162-2-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250706105311.395162-1-abd.masalkhi@gmail.com>
References: <20250706105311.395162-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for STMicroelectronics M24LR RFID/NFC EEPROM chips.
These devices use two I2C addresses: the primary address provides
access to control and system parameter registers, while the
secondary address is used for EEPROM access.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/eeprom/st,m24lr.yaml  | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/eeprom/st,m24lr.yaml

diff --git a/Documentation/devicetree/bindings/eeprom/st,m24lr.yaml b/Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
new file mode 100644
index 000000000000..0a0820e9d11f
--- /dev/null
+++ b/Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/eeprom/st,m24lr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics M24LR NFC/RFID EEPROM
+
+maintainers:
+  - Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+
+description:
+  STMicroelectronics M24LR series are dual-interface (RF + I2C)
+  EEPROM chips. These devices support I2C-based access to both
+  memory and a system area that controls authentication and configuration.
+  They expose two I2C addresses, one for the system parameter sector and
+  one for the EEPROM.
+
+allOf:
+  - $ref: /schemas/nvmem/nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,m24lr04e-r
+      - st,m24lr16e-r
+      - st,m24lr64e-r
+
+  reg:
+    items:
+      - description: I2C address used for control/system registers
+      - description: I2C address used for EEPROM memory access
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      eeprom@57 {
+        compatible = "st,m24lr04e-r";
+        reg = <0x57>, /* primary-device */
+              <0x53>; /* secondary-device */
+      };
+    };
+...
-- 
2.43.0

