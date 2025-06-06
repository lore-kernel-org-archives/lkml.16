Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85B5289340;
	Fri,  6 Jun 2025 12:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211638; cv=none; b=thLhbqTsVyn8z/rtiRoiLQAskLYHCqPdQSpX22PxuOBjwuu0C7iyaiDAEk5rVLOJbC8YsYyO1gm2X9lebnBTpZdc7x5UkMhzpLFTwAU0i97lwJ0wfc0FHLB7Lu71Z6QQaK3MO2FaqLTYjnDyDCucm4aaReEK9c91E9LXBYVaa+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211638; c=relaxed/simple;
	bh=dQLEdNUdN2l/hNT7UgALgimh2FWKT7OVd1iN24fNj+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5kGMNrLcpTgb2DCK+61Lw5NyF53MkI8czl/BTbsxA+uE48PRsDYa/T8TSoSrwhLkz1yNQMu9a8QI9ToJXONkQjNVjPI/8X7lYDSAjTnk5VvmCCjBukRKpQJwl/IJ/W4yrO76uZGtSy+3as8NhIBop5/Oc0WTbeSkAXRonYh5Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk0UpC+P; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk0UpC+P"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so24964605e9.1;
        Fri, 06 Jun 2025 05:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749211635; x=1749816435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFHAbclmiC1TBKhrN+ddCpgt7t400uvyyz03PUe/ABs=;
        b=jk0UpC+P0kU0O8/D/d82/hCMOY87tzonILCagCQ7LHWuBXwvnDDNmVywFTvaXC5HPQ
         5CD5JQBFXZweTmpSDzoE8rrJQbcY0R3S6uAyBBQKMmDcRVkSE77Up4Dr2jUZbl/pkuls
         qGiHf6jEChMqchhqTJKlZMhKoKK8NIcROChBvrLr6tbsiEdYa0T12IymiVhlHQYCnUU2
         rmOWh43R/u4HSpR41ysqdsIwYxhcKkuS+8cL2t4QmjiwoTl8htf2Y0Tp0FdG3zu7JK9J
         MimWkCdy1z6HTfqxY1swDIAOpC/g4F21bgnOo3TRp7AvDYd7nzBNFZjPOYLw5GFnp2Z3
         7slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211635; x=1749816435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFHAbclmiC1TBKhrN+ddCpgt7t400uvyyz03PUe/ABs=;
        b=WVinU43uNxF5rFVUf+pMr7eGQOst/3oZhapOlkHfv73aQQzKJQ48h/7XF8utBOLHyw
         1RUPhgDZE6tlP3LMX3CRBGGZWP2TPG1V6H/o0/1nw4JDK1/cJi4ASKyrGZdsPUknErq7
         GRntbqEcvXjmLlfCqyK5uGyBpL8u1BcOveACX19LhpqHwPIoCoF2DsmuYuGK9FyZfuvO
         CQEhKmBMpJK78tea6AI4PUveDagHhTkOpFkL7zFGwTiXpYgBLkwmG9UgzlrggCE2knJ7
         DoGulr96miWcgpBU80L5dqsBvnOTqvkaLrKpf/2N23X50B+wPCVHZ0uwzfQJQ9ck1QNi
         cMcw==
X-Forwarded-Encrypted: i=1; AJvYcCX4MSAkTs3kfvvqJ1p1rD9CoPJeeQ9rAwDLOHLj5maKVhDewH3/fe/mCl2JE2Cbq3T2FFp85cLPkqFQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwnJcJEFszKan164Rfr10/kMkxsGZnmaTFp4P1ey8VZJtOk8UoK
	yFiqykH/DySpa+y+L4dRw5kaXv0q4C8+FACNvhSc12PAPt0EFhLd0lXAoGLd3w==
X-Gm-Gg: ASbGncvd6X5Mp/TwB4LPz7HSS0NxmaLruagbUjz+y5FEJNrCBzoZj1DJ7pXoUcch7kR
	WeCZ8EBV8H8tFX0bCTzZ+e8thc8g2BMTCqnApf3I+AwQV+9pNPpgM2es5cuOEdA4ntaWowqfO8j
	usz/uRqQAmoPNzZX5ArN2mksorvEJJRyJ/q6o1YfROe0wtfStaaExsVQ1jq7dQB5DnYl7onRQu3
	PzONx9ZAqF+wfNN6eo7lmRp4jAh9sitEAfTsi3a0bVl/ofQr4o7svpU9EumaEnTnssUPhAf48lD
	X0BQBTiyAyoCF+UMByDhAWHbJMZApViXi0cnaTq0m4vXeUe0BCpfpDd4RoAz67Gt4DgoNt/vgiI
	TNQTeN/tkLY0OWQ==
X-Google-Smtp-Source: AGHT+IG3TVH6jOiZ+yEcPvEe/kgM/u71qBIw1h+zOPS0mfXdwJ6w4oDybJPAHp5zgUw7VXUgKU2gcA==
X-Received: by 2002:a05:600c:4e12:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-452013abb30mr37000255e9.18.1749211634514;
        Fri, 06 Jun 2025 05:07:14 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-198.web.vodafone.de. [109.43.113.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm1671874f8f.74.2025.06.06.05.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:07:14 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abd.masalkhi@gmail.com
Subject: [PATCH v3 1/3] dt-bindings: eeprom: Add ST M24LR support
Date: Fri,  6 Jun 2025 12:06:29 +0000
Message-ID: <20250606120631.3140054-2-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
References: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
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
Changes in v3:
 - Dropped reference to the i2c-mux binding.
 - Added reference to the nvmem binding to reflect EEPROM usage.
 - Updated 'reg' property to represent the device using two I2C addresses.
 - Fixed DT schema errors and yamllint warnings.
 - Removed the unused 'pagesize' property.
---
 .../devicetree/bindings/misc/st,m24lr.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/st,m24lr.yaml

diff --git a/Documentation/devicetree/bindings/misc/st,m24lr.yaml b/Documentation/devicetree/bindings/misc/st,m24lr.yaml
new file mode 100644
index 000000000000..775d218381b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/st,m24lr.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/st,m24lr.yaml#
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
+    description:
+      Two I2C address, the primary for control registers, the secondary
+      for EEPROM access.
+    minItems: 2
+    maxItems: 2
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

