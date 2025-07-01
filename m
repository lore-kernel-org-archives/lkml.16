Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D328032D;
	Tue,  1 Jul 2025 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393556; cv=none; b=hrd2SiBloqIFXOavcBL2fasGdWTwXO0ht1rJSYzu8yWdZVGZaR9j+tlZNNqEYwVh0i+C83EKkodh/any/v3ZqEC8RjDSzl+F/B89rVQbUxPfNQXmXHMTMgCK/FIGIa8a4VzyyU97SB5SrbtVXI74VlJfRwW3ht6wOgAYYowGpxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393556; c=relaxed/simple;
	bh=9telUjGSF+GybXyJst3tXGc/221aHdApJbH8OYOUNUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DpUf2W55N+hvzHYMO34gRWQyJj4Uu7XZSUPLOq7yfxTd81CiFSBdnKKm0BJorJ0KtVgvWrEHR7icVwJNmJhsTxf6xQYvivN1ng/vlWix3uD8VlTAZMu/oanljog3UVrIV+4oPK/oCO4QGJUAYnKAY8rb8VgvYZAzVFoyRz0avHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ah3csqtO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ah3csqtO"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2403917f8f.0;
        Tue, 01 Jul 2025 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751393553; x=1751998353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/w38IyoNLiEik7l94V7zsmtJBhZqWLOt5OMJJ0bZOf4=;
        b=Ah3csqtO1VigbAMU62hQJ9gp46o7KlwMEq1eQlzv22afs0I3WVAWfUhXJt/qQRUX4q
         5C7tlRfMbmzHuX40bh/MoMGZsKX2QYFlpzKhm0LTpyJ+F1fzSAm+RVJ65GgN0KS0W7lY
         BmM+TNlNHk6HFBSro5Cqcrk7BuB56pQqV0LuunoEL2VKKN6OOjeZHV64JBrM//VZ6cwB
         wECz3LlIZEhOd2Kq2XksngKgkpexN6YE0R3im/XSXe9SEcFMBAiHMCCV1ju2BLbtOmbV
         ULT4mWbAYNxLeGmNBti1oV0p2YBNFO1vsMIqCiCJCd5Q789MrC8hn3QJwC562QOtzcyI
         tqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393553; x=1751998353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/w38IyoNLiEik7l94V7zsmtJBhZqWLOt5OMJJ0bZOf4=;
        b=EFvyi6rV/m9UBHaikBM8D/sBQbphkAXtWX1ztwdvRBR8AQfwZLbLlqim/f25lI1IbL
         NeuMr3chj14gxgbB7Gw+JfngXd2tjo55q400zJIearr2wXvgvGSKTotvPLglqUA1zXJ0
         KfxrjbnPga/4fYSJoyNHR8IFeLhIS8D0mR178fx+vbENijbxky7w8iCZzCMjTG3aw/Ew
         rn50kJy2f9SSyBENpJcck7MerzkUDxMsXJc/yJX8ze8tsfWGmvI2rr/1p2hftaLYXM4Z
         5lHMqqhtLE2qOp/4bTQPvPBiilK+hvEYpK6LBCZUGRufkqGtaQ4zt1h3Zkaya3NCJJUM
         PgXA==
X-Forwarded-Encrypted: i=1; AJvYcCUGgfnaU5YSIu5WuU1x3ns6g3qOqgEz1DP/ERTxf60WzqNWxfIl0y+5s1u2FaxcXtm474lMoJh3JgQJVjWo@vger.kernel.org, AJvYcCUczBYoflHUaRl1YZxtrwJcQVXmLfiSMaUA5Zsu3r/mbQeMELl3rAKX4fi8QjCkz/+mYdSrkcbElNcX@vger.kernel.org, AJvYcCVyGB+RNoqfurJNWBgndnB7akx8xZexH8Fz7IH9iO7q+mjLbV70MuUEovb2lNSD/LIht2se6kkM6+qM@vger.kernel.org, AJvYcCXnudBDWZLgP7ZATBzmrUIeHtIFdD2EiVMa+kFMyl657lgvrOCUoMyvNrBSyA3xRdgOe9bIom4yBuKTLXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTalBmK1zvv0Kban8NJkk0QnioOygskUMIh47qHM9hd43TH/yD
	wVbzumMrUysJSvjNvpkLt5S8gCuZs9nyzsbEBPOnCyp3PTE+5OCpUJB3
X-Gm-Gg: ASbGncuBbEq1VnwNpHoETad45foQNYXZNT0FO+Q20Wp6Rowwud3HbHeCKXdn2S7whn9
	+2zjzUwu1lc4S7496TYNh65RhFqDR8fctRLG2M9yk0ACBTkL79iGoZ0Hq1TeMvbkfpTA0CxP43C
	2SWgFLSjlumGpAJNCdolZqHu0/AtXwC6Uaq/zr+w464E/3hA2sLPu4hO+nkeofYSQI0gW/JQuce
	MzMh8S5kDjTUTCb/9OPM9JkBX2MrO+MiHOpgsHwokHPJtw407mtCvFUCGW2mHM1+GIClh/v0tFy
	p3ntqYK8x7kTRbXCm/KYUntGYra+AS4GkMQALuZ+wWYuMQKvjiqz358e+/JO7ieKGwNnLn0UeVn
	MjPdpN02tMZKLSwRudCs0d8e6yQMuJpn7aPR+cC7OtbuQZeX+nuWIkeJfq7LJe65DucnwI9EQ9A
	==
X-Google-Smtp-Source: AGHT+IH9WZzlub8Sdy9TrrzDK3ap8VO1bz4r7BoLZy1xDCUOKmjigpTATCUFiYPy2xmrAwPVWNIiTg==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:ead4:5ea4 with SMTP id ffacd0b85a97d-3a8f53ab011mr16392993f8f.24.1751393552784;
        Tue, 01 Jul 2025 11:12:32 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-2e00-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:2e00::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa54dsm13707437f8f.23.2025.07.01.11.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:12:32 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: hwmon: Add Microchip EMC2101 support
Date: Tue,  1 Jul 2025 20:12:27 +0200
Message-Id: <20250701181228.1196102-3-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701181228.1196102-1-noltari@gmail.com>
References: <20250701181228.1196102-1-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce yaml schema for Microchip emc2101 pwm fan controller with
temperature monitoring.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../bindings/hwmon/microchip,emc2101.yaml     | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml

 v2: add missing properties.

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
new file mode 100644
index 000000000000..0966559d373e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,emc2101.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip EMC2101 SMBus compliant PWM fan controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+description:
+  Microchip EMC2101 pwm controller which supports up to 1 fan, 1 internal
+  temperature sensor, 1 external temperature sensor and an 8 entry look
+  up table to create a programmable temperature response.
+
+properties:
+  compatible:
+    enum:
+      - microchip,emc2101
+      - microchip,emc2101-r
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#pwm-cells':
+    const: 2
+    description: |
+      Number of cells in a PWM specifier.
+      - cell 0: The PWM frequency
+      - cell 1: The PWM polarity: 0 or PWM_POLARITY_INVERTED
+
+patternProperties:
+  '^fan@0$':
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        description:
+          The fan number used to determine the associated PWM channel.
+        maxItems: 1
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan_controller: fan-controller@4c {
+            compatible = "microchip,emc2101";
+            reg = <0x4c>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #pwm-cells = <2>;
+
+            fan@0 {
+                reg = <0x0>;
+                pwms = <&fan_controller 5806 0>;
+                #cooling-cells = <2>;
+            };
+        };
+    };
+...
-- 
2.39.5

