Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983751862A;
	Thu, 15 May 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747268910; cv=none; b=lvTXNIFh8HOXixXgJnCt2P6voCuy+hEyQJwviY1k+nF7a9roRvgKnuqj6auD2LzjssuS0qundx8tHeDd1+xUXOItHH2exp+5jsfxqzM/d8gO//PS2Rl+KppQaxIW7vO5BsLOGHXlMtWuXhAfklhOLb7e8idWA5h3TR2pdwkVFUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747268910; c=relaxed/simple;
	bh=q185UwyoDplon82ymMbU2Sm6La+T0VY1csqVxD2TrF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clX9vKh/UjXV19gCDFE7zzKX1eWIMJJKan3cNjhzvBYG/DmzI7YHGCo1cAhIjgryqkzdK702mqXoHsqKglXnHn1Xa5E+TRd+llNnHudrVqGO7uAyz2o5fVSM4Zt+rKgDABqgw7LjtHjoCSCNCBw4ujmsErzJ14VNEM4liRf8pSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQvtOnNX; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQvtOnNX"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4ddb4b29fe7so243432137.1;
        Wed, 14 May 2025 17:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747268907; x=1747873707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wAlq+RDtTjD2UcfsoGur/ZaQ5F7oeyRLQwS9RX50K+Y=;
        b=SQvtOnNXhHh+sEmuRSOS5Po0voJPDwI2/gIEbABNfVl9ycXA1wqqUDfv+i6tG/6YXv
         hxhnEBmWM7c1LWzDaOoqmFlmlWeM298TKoY8gU4gxx9d23WR8kZfUIChNbTK4WKuF+nd
         dlOe2RU5nwUky3YxJDj+Jef82RD4AHCfcHiGZzVFgbTyyAIrq/ECybLwDIdXMbSTccQ+
         +s3u7wO7BtRhLbtfZH6YO78kn90VDT+beBv8BT/TMo4ZHnW1AXdl+4knSbLaGR30F+By
         iSEf8fMEZzU7EQBnFK8i/t3LgYY5dk5hJplHlEZzelU923WkGYxINFlPIzyAqQdPeVnj
         G0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747268907; x=1747873707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAlq+RDtTjD2UcfsoGur/ZaQ5F7oeyRLQwS9RX50K+Y=;
        b=q3F0hRAde18LCxoDkCEdh0L6I5z3Usds5r2Ef94v8eDLQPey0K4tzU+YEws7Uc3wd0
         vMtS3XC50eHgBVpCalejI1OVt0/e8L3jZHdb3NHYgnq3fJFf0gQEEUM4orPZuXlO6rAL
         VVYEORQ/m8FpmhHPDEtWWG4M5dCApU6DO3Ao4sZkJ61hKnczJ5W/jz6pNRXPvnfuGMif
         U+8yd7kBD5bmPXAlsBdAcGJNh0ZyP8WoaE6wAzZ+jjgKrPfFIwR0P29JHgBNaxl1nZ4i
         /dAVV23BgxblITocON1/WsV3LDg8dRukQhd7aHwHOHaSW2HZ4YTh/LJWjW5XUiTGUUmV
         PG5g==
X-Forwarded-Encrypted: i=1; AJvYcCVbw4nBhw7L/hJ4D23f7YdkRIdjwTEqchffMGMrLGvzbWRra88zqKZm7CTdg8eHoyf8XKdM0/x9ADQ+FjtC@vger.kernel.org, AJvYcCWEHTJocat0y2pQduwTybaDrZd0MnYCcSyYHrJUIO1u2dV2ay1Z/NRqq8n2XZQR0W4NDQ611/U1vIyc@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfQXqe4ZZsJFOmQ2cUGuEskP42UcauHNUYcnfyLcKGpcVQP+D
	DR+MLMymryM3OhupcPon2dpSLaO+bZltEJoC+zkjqSOlDUORLlGQNxTbisdz
X-Gm-Gg: ASbGnctBSKc/g8CARHfDcxDjXM94Mxrnq2HVb6YtCzl47Ka3Kr/QNGBCP41dBfjMyZL
	/FNPcXdrRHhw9FalgsX/VjIQJMC0qQjMbgknX7zFzDZL+7RXAikVw7xVahJcpwJ5lMYErV5+/x6
	wsLns9yFSpG9Lpt/zl2OCv3AjTE5JbvmbFCRE2BuRHXkVQmJefuUb1ZlT6WJlOO/3wmSrYn6bss
	NoHSV8mNcTzx2ycQAXx7C4Wvd0Sdif1gpEg/KCYtNRJFid0cUn6IIi+blw73dT5k4p3IqjV8+10
	1bpgvn+Seck6CZV283vSfgBPfRLrLNXhZ5nMTwcnBlS1fxMnNEpt84pDhhdhH25sgqBGqKffhHg
	=
X-Google-Smtp-Source: AGHT+IEM+tRLJYIxC23mq7sJMLr054t8sT712OwTyhfCE+lh+QYhfD3dohaD9+RkOXG641Pl9UmDHg==
X-Received: by 2002:a05:6102:80aa:b0:4c3:6979:2ef with SMTP id ada2fe7eead31-4df7ddf4d98mr5300512137.21.1747268907246;
        Wed, 14 May 2025 17:28:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4df3fe369b7sm7531119137.16.2025.05.14.17.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 17:28:26 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings:iio:gyroscope:invensense,itg3200: add binding
Date: Wed, 14 May 2025 21:21:16 -0300
Message-ID: <20250515002817.81863-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no txt file for it, add yaml for invensense,itg3200 gyroscope.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Added @Jonathan as the maintainer here due a suggestion in a
different thread for a different binding file.
Created this yaml using the driver probe and comparing with other gyro bindings.
Tks and regards.
---
 .../iio/gyroscope/invensense,itg3200.yaml     | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml

diff --git a/Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml b/Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml
new file mode 100644
index 000000000000..0656dbb58cf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/gyroscope/invensense,itg3200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Invensense ITG-3200 Gyroscope
+
+maintainers:
+  - Jonathan Cameron <jic23@kernel.org>
+
+description: |
+  Triple-axis, digital output gyroscope with a three 16-bit analog-to-digital
+  converters (ADCs) for digitizing the gyro outputs, a user-selectable internal
+  low-pass filter bandwidth, and a Fast-Mode I2C . Datasheet can be found here:
+  https://invensense.tdk.com/wp-content/uploads/2015/02/ITG-3200-Register-Map.pdf
+
+properties:
+  compatible:
+    const: invensense,itg3200
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+
+  mount-matrix:
+    description: an optional 3x3 mounting rotation matrix.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        itg3200@68 {
+            compatible = "invensense,itg3200";
+            reg = <0x68>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&itg3200_pins>;
+            interrupt-parent = <&gpio2>;
+            interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
-- 
2.49.0

