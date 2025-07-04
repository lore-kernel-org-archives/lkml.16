Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813BC2D8788;
	Fri,  4 Jul 2025 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632776; cv=none; b=AAen4NlKSZ5dN4o/QqH9jJIzDUULV7sQFGJDFCD9jSc6XYN4YKEq48HBqwmwOpkwG2mPmr2WJfbfESC+dbHzIy6WTQSgyTyVfV3QKmG6mk6vAHAs3HL3vkBzS7F+6xG9Q+rekqyo62KSHpCLda+K/YYKVuzYPesgro2OhwDd2Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632776; c=relaxed/simple;
	bh=N2/8vcNOs7mN3IP+BTPTU0wQw9ihePSqUHCngA0PHUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6HSmRSHj2cnnkB+ant6bdI7czC1fDWhndcVnyPJf0kpxhW6l6UapNqnwTbq048T+980VFKZngTJpDbNTZ4lU4dxwY9dCvT+QaxVmQNqLnFH+P2gAyJFX+QZgtEHmAbR/nmS72iwKRap7aMSRgw6QQNC2GlsUjVPMMWgt5FXOpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JogsA1P2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JogsA1P2"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0b6532345so362085466b.1;
        Fri, 04 Jul 2025 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751632773; x=1752237573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQT0ExasWV+wZ6JznVS93n0nNzR3Gg5wVG9Ipyu3MvI=;
        b=JogsA1P22Be+Nf63eAH5QUFY5Na1xQXf3anjH+IZgFScSZ+/WyHezbqA4GHti4bTjh
         vCeJgrP2b02NGXJT+umKtsIujdBbCidxCZBhDSQ/VdS8Mm4ZVPNWbUaNxNM4hL89g7rI
         L5vnAEJhLBr44su4cYTnIR/0Tx/v9t1Khdy9UAiNO060txv7szxn5FBDVCMytTg7tJ+r
         e7aXYOcPl+FZBEaZw8ZnbO1gZwTkzgTK/lgFJRtgCglcatW4sv8uKEvPViv613GM8hgH
         pGoMgrkruiXKFgyKPUWIZBl6aOL6xDTBqCJRZeBObfebzx7SYcJgTGYa5EqQ1y2JiT21
         mLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751632773; x=1752237573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQT0ExasWV+wZ6JznVS93n0nNzR3Gg5wVG9Ipyu3MvI=;
        b=MzB51hi59IMxB5nW5dCpyse9EHUAV8hkU5cB83Tbh23DYV79IzELU1fWQJzFgJk/Uj
         mDUgL8NB0O7fnKMAqz1zZkfejacETXQYCOHmabB0S1oJt7K+akRcORkW06kNcaMDpswr
         fjkvdN8v/eIvvdT7Yu5SfJn0tmbFyBsij4+857HLI8AvF5JP4QkqVTePMBMrYK5J7qeF
         dHM4Ce4UQL+Ci2Gve+y50bMFE3Y3FTYbYE6RDAmy40bBckiZJ7piNbY+3fYA48rYstMU
         mjjKyhUYeVxcZd00dJ/u3F5aJu6KLMHX1zEa9QdlBCuy1HiI/l8uFRRFhQet0LNgfk+1
         +xMw==
X-Forwarded-Encrypted: i=1; AJvYcCV5uM0Jd7sRoAsFgG8Utj1+DMaIUNUZwxUefaSauXFx7YyfMN5KF6gBPg8wcOC5XcbiETnSKnPuEpQa@vger.kernel.org
X-Gm-Message-State: AOJu0YwDNmANPe8PLIh27eHcp17w6xVr6WUsJB25ixeDny0+9MAALttp
	kSaTJd2kSuRnZ8gOykptL3kDJr8EiIWI9dZbfWzQf/k2kUV0DT0VmX5CXoNZIA==
X-Gm-Gg: ASbGncsbzlBkkru0LLPB6xUo6xgctluQoB1lABP5sI77fdrW/x/F0hHdC+TCjY1fSnx
	SB8WeLK1BEwSWS0y9tNdAibNuEAo4qXB5pDPONNKdE/Es3eXHwx1ma/J1vtUdKOJC07MZGshEO4
	vaEBAqz7IM3kzQ/kpwyJCxDnMREZp3cY6S9G49bMEaTfRLm22Zj9Z+y8VGCRnjGiZZQ9bU98/Gu
	A+xcM+AgrZMybXwBD07xP5cGiT6j1eXbJCZ0bozvokSyJMA9RgFnwHBys8C2YkZ4XlLMkWloeTw
	W+FOf0dz9CU7EcxcmB4ORoOw5ls9+vrGPLQvwZUP7lywm8vN6HAfjzfmGGlW869c39oHfVwGSMK
	jlpRkGTUidYxZ433IO09GRwmQIgWnuCZ7o0VqTgJm+Iq+3a3z
X-Google-Smtp-Source: AGHT+IGDzjOl/QOJIs8fSSNbbSxSI9BueKFZ3nqM77h9usNcB6QVuMRQG1hUQnN/svWbHwsphrmsOA==
X-Received: by 2002:a17:906:6a07:b0:aca:95eb:12e with SMTP id a640c23a62f3a-ae3f9cee771mr274038166b.24.1751632772348;
        Fri, 04 Jul 2025 05:39:32 -0700 (PDT)
Received: from masalkhi.. (ip-078-042-182-222.um17.pools.vodafone-ip.de. [78.42.182.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b43264sm166648066b.141.2025.07.04.05.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:39:32 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luoyifan@cmss.chinamobile.com,
	abd.masalkhi@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: eeprom: Add ST M24LR support
Date: Fri,  4 Jul 2025 12:39:12 +0000
Message-ID: <20250704123914.11216-2-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704123914.11216-1-abd.masalkhi@gmail.com>
References: <20250704123914.11216-1-abd.masalkhi@gmail.com>
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
---
Changes in v5:
 - No changes and already reviewed by Krzysztof Kozlowski
 - Link to v4: https://lore.kernel.org/lkml/20250608182714.3359441-2-abd.masalkhi@gmail.com/

Changes in v4:
 - Moved the binding file to the eeprom/ directory
 - Updated reg property to use items: with per-address descriptions
   instead of minItems/maxItems
 - Link to v3: https://lore.kernel.org/lkml/20250606120631.3140054-2-abd.masalkhi@gmail.com/

Changes in v3:
 - Dropped reference to the i2c-mux binding.
 - Added reference to the nvmem binding to reflect EEPROM usage.
 - Updated 'reg' property to represent the device using two I2C addresses.
 - Fixed DT schema errors and yamllint warnings.
 - Removed the unused 'pagesize' property.
 - Link to v2: https://lore.kernel.org/lkml/20250601153022.2027919-2-abd.masalkhi@gmail.com/

Changes in v2:
 - Moved file from misc/ to eeprom/.
 - Updated $id and $ref paths.
 - Reformatted maintainers field.
 - Clarified description text.
 - Added enum and default to pagesize.
 - Replaced additionalProperties with unevaluatedProperties.
 - Revised example to use explicit i2c mux layout.
 - Fixed style and formatting issues.
 - Link to v1: https://lore.kernel.org/lkml/20250531081159.2007319-2-abd.masalkhi@gmail.com/
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

