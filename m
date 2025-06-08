Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34D61C3BF7;
	Sun,  8 Jun 2025 18:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749408368; cv=none; b=FbcOFgsRFfZyTcmH5pqxGFOlIY9VvHt4vpQBccK6Oe5AVveWGbGgobbFfLkWCyPBZcvE7KaF/9y+9KqiKbhvcpfTh20h74+hOieQ/UcvZdDwFYmk68EmpRN6gHbWP1iQOyx5EiCbR29Q4RBl2vHcvgtsYzQevB2np58FtSqcYR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749408368; c=relaxed/simple;
	bh=BoMe2w87VCMZS8u+ptoRh/u+YAr8a/+5Nxt1dp8aSa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJec9q1kbyBtCclbSezCBSydQV0IR9oEf1rUjI+ebBPF0jEnjksmHN6xnpHKwtQEZdRpvfudpaVR7F0W45OsUiR9TfeBhVkZAo5czUVBVJ0OwShuDY2gxMIIlveOz1ezQPkY4ZiMaCRxarcpey7X4FStBzAaC6vU6kSE8fzRrh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIyFPOa0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIyFPOa0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450ce671a08so23028515e9.3;
        Sun, 08 Jun 2025 11:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749408365; x=1750013165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4KSSPvtxQcn1jUN07zB5p3F9NXBdBxtVhggAw+LtFk=;
        b=NIyFPOa0CyGSkD0HFb7A6Fv/46rbkgXMzUCKCnTv/4JL5ps+1zo3LF4auL9/oC7sl1
         gP8OPkZ88IalEqCgRuB82BvEK7Ld+dMFoUkyfUlJeZdtwaeFbGYJuyBARL4rWLHmNUlL
         2eYPVgASMmklXZk8Drq7C+VgeHp2/PUBJu+5/tYDcmpMHE9qL52JgeQxwX9g+E6InPop
         ITCy706s3Baxzz0KpTVdAfyFJOfpf5yVECIU9ZKTblz9heq4UXN1JhBu/3QRO+Vcm97R
         PklQWlLXiy5mMUJCCLXMU0bBXE4oRm3fFrhxweYaPsGMvvV3peJVJg1QZEj/V3IVFwbV
         7Bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749408365; x=1750013165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4KSSPvtxQcn1jUN07zB5p3F9NXBdBxtVhggAw+LtFk=;
        b=E2A9H+OQv8FbT9I5qWO1aeO/ZW5fpUe7UxyVPvLS3v2mEaGH+ix2Pkqm1lnZ+5/qCw
         rJ1UoL5lM20l3cH2wt5oy3XnfaOZQ9vj8ko8AO1LxmvbMqPARK91ra0RQqpgLRbepe6z
         clzBZasBjY5abnbJT93CYasY968isoan4hrprVKRCYV4xVAfeSRzhi3xuB0Uq7BmHVdR
         j+f5ldNTBWNYTgm8Oa3Xjnln71JxewZ88CNJcKMPcD6TFgqUlJw7XPwjYQJnQpTcmyEr
         rWakdLICvnK3d1/an7h1+2hs2I+BRrZFcJdrIbAwexFEP48Cit8fKY45yGJ/MA0ZO7Jd
         vM4A==
X-Forwarded-Encrypted: i=1; AJvYcCWdrZZWIaRrRih6XOUUW3taLsTWvvJy9xmUyWWR0uMaA+GPgAtqhSYUD2XR+ag+kWC4fbDR/4Kek4Ee@vger.kernel.org
X-Gm-Message-State: AOJu0YwZXvKFNjEXdbpA7xni2qasLUhdR5xdv/Sq9sRSsRQKDKlT2vvl
	Sz6i6rrnj6Di0wH2E4amISdBBgIxZh8NF5p0CdbVU3kYSH309/wPKmRPEUZGTvg1
X-Gm-Gg: ASbGncumKYEbPZaJ0ZJjfpFpQZMisryf+W0xPJ+05r9fuNUgBMy+aKnemSyC8X/PBDn
	houQN9pbLFBsLO7dWRWkvA/JNNu5xg1rHkUTOJuFV87Xe8npnnopZn8MuOk7xv/gfiUtHUBbdS3
	ZPR37X4IxiD0sg9weeql6+8Lqx8tuGwTX+R6ODIS31xvu+KDDeK7sT1t2a6SjAnUZPSexEwM8lh
	n37+8P85ns+YBSP/H9B2VTmUMZs33FqVdqTnEncttQ8DEn1RYyfMGjuhiv3RYPoOdlKA4s07Kpt
	gIBBK4uZLakaXr8aH6yjthPwFS9jJe3mkbXsIeL00furVWVu1Zk2kH+wIs+kZ7VRpmz6H3pLmGy
	dvrLurNVNHUVr3A==
X-Google-Smtp-Source: AGHT+IHHMvL44I7O3GJl+TF1UTZ0SxxrEBTZ69AbDVYKwnW8VDF2pFsNyumQpewbrGFMOdRzwiq5Wg==
X-Received: by 2002:a05:6000:220f:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3a53168400dmr8336659f8f.4.1749408364752;
        Sun, 08 Jun 2025 11:46:04 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-112.web.vodafone.de. [109.43.113.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324361ffsm7621418f8f.47.2025.06.08.11.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 11:46:03 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	W_Armin@gmx.de,
	luoyifan@cmss.chinamobile.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abd.masalkhi@gmail.com
Subject: [PATCH v4 1/3] dt-bindings: eeprom: Add ST M24LR support
Date: Sun,  8 Jun 2025 18:27:12 +0000
Message-ID: <20250608182714.3359441-2-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608182714.3359441-1-abd.masalkhi@gmail.com>
References: <20250608182714.3359441-1-abd.masalkhi@gmail.com>
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
Changes in v4:
 - Moved the binding file to the eeprom/ directory
 - Updated reg property to use items: with per-address descriptions
   instead of minItems/maxItems
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

