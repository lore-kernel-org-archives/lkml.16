Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B51237194;
	Sat, 31 May 2025 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748679142; cv=none; b=C7ftAGMV8MeutAE1K3/CSJGm8lqYwWfP9mdtoG4lTIJIZNOLa/odHGh3tXKzP1dRrkAnS3h0AyC0iKS2C+BS1yTzphyIHeM0ir7aq4a6+DAawO4Q76txqrs6meyqBoNSm4XidRe+Y7DTeOFtZSNolX73lVP/Tggg73IK/dskv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748679142; c=relaxed/simple;
	bh=iayMRQ98qGrlv+ohmpwc93OMUZ+eFmNV8TLVa1jLUV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQLM3hbaXfEyUDskiAXoRQ3IF3gezkFcO55SGwh/DbUj2mhk2G82Q/WSXj3InotDMci63kQoVK5OnXzgm3j/ye1Qpx4TqOIrTRaE++RkD1htzBnSvLXUzp6Tvr2zzBPGtEFSzGKNrdk5G+IdwdELkY/HjacrKXF1MUqflkTZIHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJ6qHbQ6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJ6qHbQ6"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acacb8743a7so485396266b.1;
        Sat, 31 May 2025 01:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748679137; x=1749283937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhJev685Fr0kXE+aWbeZYAHB5uEBBNEX54M1joDMg6k=;
        b=QJ6qHbQ6Iz/AICutFiVwq9qswlQY15OEykv5GfQlso1QJgjMQf4VuNlPKdm15+4678
         U4xU15+FeTr4TjVi5dRkiG1KdVuOwstXjRMzdwwXoRSi0Qry+OlfsI1PIeTbrQo3dBWJ
         D/MFbkoDrbW9Za/fB8B5HuXyckefUzX0GutEPg1TZtODLUHbh00jrB9AxEzt4dgyBgrd
         4X/N918MuzNt4twSrbYbhc/tFIlpyYb7ylQRd6b8Bdm9OPquNpyFqXUSzhzd0oFcxL/M
         DCDEJLWivi317PoCmROe0XIn6D0B/MY3RnvtGYLVP3lwb9BbZGFoXSMBUfiq5eHHEYuv
         Mtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748679137; x=1749283937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhJev685Fr0kXE+aWbeZYAHB5uEBBNEX54M1joDMg6k=;
        b=tshfe5+LVKXSfbR7twYfgmJvvWs9dHCtOxBvuMl9BQy839x4aZIiyAtxB5C9P03XHe
         8YTUrC+ToZshINXuWYuQsd//It1N98Nqgfo+VICYLxrskvfkF1bJ0wfFuPoZHFuy84kM
         DRVopiW4kRg/+7Qwbyqy1pQC0kXIpyP/vuWaTD9hqCpn35O4zP+oQQRotHJIICs002bv
         4RcmhYT1dmjtg2rQbbfdBeKXB+G7vpTJFogtQV1dbHwbd7dJChuhDydxnzwaE7wBCR4E
         V4VIbHmkYYS4vV/tWMfa989dESA8hS8NpkBNRhDJDaevTgs/IfN4Uxdslx/FD0EKbU7Q
         Ca0A==
X-Forwarded-Encrypted: i=1; AJvYcCXkYKtcYBIlcrKbPDP1K+Nc1HmAuCd159TbNL75Y5f53+hsEmBWXsYei78FeOl9Dg+mU60AR+rMDw2c@vger.kernel.org
X-Gm-Message-State: AOJu0YwfUX+FZbVzz97lG2ZzY9Q5k4M/44+D4f2LyOsUbL8NFjWtBCxj
	CrzEZMI4l2JQIq3O3bt6wvo+vWoR4U/dqhOL2hY8+jEezraNEsbjN6whGm23WR23
X-Gm-Gg: ASbGnctcmpGVXbls9OweTSqskozLivaoYQrqMvFfg8Ou3UNmsVXATrmzVcyDXoRKSV8
	0PXoU9fXJ/K+yn5fmxpyA/xu/mrK3nO+fbGRo0KvLAHyDL+yRIgFAQw+pj0z+UpaWxcSsBaPKyD
	1ofF09/6ysyPEAGnb255Bb88DgulShvcVmobFOgGs2oODtRKqe+TQ8MEWglrDmyKkhTkeEfbl/s
	K3HMsf5BpJseNR+x/EdC0BUdnP7o5khO3tcUnf0ycejP4JIdQ+97mlVDZDaXSM31LbFHx4UZrVc
	eklUvsseBNsHugYPCKWqQZI3BAJBEIUj9uYbsnoGXKm9tHWlsg1/gW4GfjVaUQc/jTq/MvfQV/p
	dolX/osme9ButjjbhxofjAOtr
X-Google-Smtp-Source: AGHT+IGOr7L8a0oC+fGl279R6OI5GNPUvEzkCGzPfxDx509AZxOzjlBjT9czz5jOm3IxJ6gFa1hVrQ==
X-Received: by 2002:a17:906:c10e:b0:ad5:6258:996f with SMTP id a640c23a62f3a-ad8b0e38931mr853764466b.19.1748679137065;
        Sat, 31 May 2025 01:12:17 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-114-141.web.vodafone.de. [109.43.114.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf05csm451352766b.113.2025.05.31.01.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 01:12:16 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	abd.masalkhi@gmail.com
Subject: [PATCH 1/3] dt-bindings: misc: Add binding for ST M24LR control interface
Date: Sat, 31 May 2025 08:11:57 +0000
Message-ID: <20250531081159.2007319-2-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250531081159.2007319-1-abd.masalkhi@gmail.com>
References: <20250531081159.2007319-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Device Tree binding for the STMicroelectronics M24LR series
RFID/NFC EEPROM chips (e.g., M24LR04E-R), which support a separate
I2C interface for control and configuration.

This binding documents the control interface that is managed by
a dedicated driver exposing sysfs attributes. The EEPROM memory
interface is handled by the standard 'at24' driver and is
represented as a child node in the Device Tree.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 .../devicetree/bindings/misc/st,m24lr.yaml    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/st,m24lr.yaml

diff --git a/Documentation/devicetree/bindings/misc/st,m24lr.yaml b/Documentation/devicetree/bindings/misc/st,m24lr.yaml
new file mode 100644
index 000000000000..5a8f5aef13ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/st,m24lr.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/st,m24lr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics M24LR Series NFC/RFID EEPROM Control Interface
+
+maintainers:
+  - name: Abd-Alrhman Masalkhi
+    email: abd.masalkhi@gmail.com
+
+description: |
+  This binding describes the control interface for STMicroelectronics
+  M24LR series RFID/NFC EEPROM chips (e.g., M24LR04E-R, M24LR16E-R).
+  This driver provides sysfs access to device-specific control registers
+  (authentication, UID, etc.) over the I2C interface. It act as a
+  I2C gate for the EEPROM. Therefore, The EEPROM is represented as a
+  child node under a port and is accessed through a separate driver
+  (the standard 'at24' driver). This implementation is possible because
+  the M24LR chips uses two I2C addresses: one for accessing the
+  system parameter sector and another for the EEPROM.
+
+allOf:
+  - $ref: "i2c-mux.yaml#"
+
+properties:
+  compatible:
+    enum:
+    - st,m24lr04e-r
+    - st,m24lr16e-r
+    - st,m24lr64e-r
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  pagesize:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Maximum number of bytes that can be written in a single I2C
+      transaction. the default is 1.
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
+      m24lr@57 {
+        compatible = "st,m24lr04e-r";
+        reg = <0x57>;
+
+        i2c-gate {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          m24lr_eeprom@53 {
+            compatible = "atmel,24c04";
+            reg = <0x53>;
+            address-width = <16>;
+            pagesize = <4>;
+          };
+        };
+      };
+    };
+...
\ No newline at end of file
-- 
2.43.0

