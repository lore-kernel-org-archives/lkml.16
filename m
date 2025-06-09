Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09727226520;
	Mon,  9 Jun 2025 23:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510254; cv=none; b=NI8E60+b5NzgFljOQT90lARRkOkw3BACIvWuf8e6jrB6CH5oz8NOZ3o9PgzV8v9MpcfvDGtc1KyyT8sBIcqRu/Rc1wI3f13qBQMF6JdJF+18plsd9cN7LRSdyqkPRIQwq4DnBle02bMB66qiG8HUtyLphH5x6RLQYyy//2qqzek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510254; c=relaxed/simple;
	bh=4P/wiuPesFnh/Uyov5jXLEjhp3/xkYsDmOpBw88N8HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPr/LC6fEjNQ9LNI0eKLWXsgz/xHaRbTEJksnPQtplohOC4oZ6r82Y+Sph/jr9M4EzaUORjgkUyKwbrbas6vt8IdGc+s4lVkFQcvO4Ef3KZwuIVX6FsmEP0mUHo93/7+YIDuwOh5U868lhs/ho/dszAISELZZiP8FevPqJyuX3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AacSO7Z3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AacSO7Z3"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1902468f8f.2;
        Mon, 09 Jun 2025 16:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749510251; x=1750115051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCo+d97U76PkBGkWutYUHF4lfk0UocX8ijiUCJ/8WCQ=;
        b=AacSO7Z3r9ir/mFD5gH9ro8u8kYK9VxKKOnKD0yhOKBsV6oucqO41hbOzMydqqsrVH
         wGindFk6m8VfhV7F8g6R7rWETNSGzk46MIBAASEc8tYmNNQTS40UdeNd6BZxdoe0Fcg3
         WYY8AJW19j2Nt1srVr7kC3Vd9ew1nHBG+dZ7Jo9lNm70NGxiPSHd+uAGYEK+4S/f9tRK
         EzUriqUmCX/bxmyp5oY68ah8MORg0NkbZnDyE5eMYGUrKm/UiX5Ok7KJh9mIg3ab/Nmq
         7AmZkoKmqtpbjMpXZPaCR1HT/02U1JwcfsmAQ9zU60SkGcFkAbWIP9VFZjNRZWC/ViYf
         n+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749510251; x=1750115051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCo+d97U76PkBGkWutYUHF4lfk0UocX8ijiUCJ/8WCQ=;
        b=bok0KukcCReWjziULI+kypkwZhjXo6/3yB4u/RzDkWWlZIrPQl4vd+HO5s9VMOLJg2
         oTlT3UZwRsXEajoi8tIhEL6R6NbCCRMDjwPiDQ2HACR1XesRLEJ7P6Mz99uHCLjvdgtP
         UHNARJKdTEJXbp5Kp/ouiMscR1or0AtEW7NG2Ac3uUUUOIJnZkYR2YA5da1rqC3CBtI7
         g4gwsDbOiVjoSQWE5kPfn1dRr8q6Cs1f2i5i5pKBCaHMxSe+btVDhrHDH6e1KZqzslhM
         qu9yI7AySt4HlEnb8y4+iPH1ROQYhDNL5xFCrp4HXSS71ABmqGpOc7a0c7/AVr4ErLvp
         ddcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDwVAuYuFgRfubTb9qXNgJTIbr1wyHXtmTyvix7iBfkBUzw4Zg5mAnGamYcxZEmBWkF1N0WCHZ1wHa@vger.kernel.org
X-Gm-Message-State: AOJu0YzByKrCgZtpad5qtangKslp+C2FQbD6HeqGKfUBgZRBgF0sFRFo
	QmeFf71h2QMA0iHtE7Ihti1esjDRqA0L5rPCmuOb9qHMXf/A3Met5VjoFlZlGJE6Hso=
X-Gm-Gg: ASbGnctlKvDIfLTLVJ28p5Edu+4ui3r5z4QdU2eKAsW98WksjQ6Sg3W5wJ2tqrM4YRq
	Cp91Co5Ks8kQUfWQKZh9m+Bm/MQS1pCFBRH2FrUqeHcTD380xlcU/apJUX1fd35kp5dFSN0FKTG
	ORlU6dGBjVXdg92Nay6wh5N5SZUM7cOqHHX8hf0SNwJ1WMaNcndEutZvkpE9CczkzeuNhUTO8bz
	BxrppCB/cT9nOc/+mhK6rc8ggG0+njBVozBRazmyswExm9YmP8UPEs/gEdODhbg6oUF695vXROo
	NAEPZdKq/GvTn4iACGdSw3Eh12iEMusw0ORx387Rh8AIQoZWG9mYOHoF6N8g8m117vXV4GAQ9h8
	0te+jqove5A==
X-Google-Smtp-Source: AGHT+IHBOLrX9hJVpiyQi7xpuFvt7jnPbdlf4ABzm7L9Q4dlQ+R6Fz+CFJzUT+ceifsEKtvMg0L7wQ==
X-Received: by 2002:a05:6000:2203:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a552272cccmr312945f8f.21.1749510250875;
        Mon, 09 Jun 2025 16:04:10 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b92d4sm121340585e9.19.2025.06.09.16.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:04:10 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH 1/2] dt-bindings: reset: sophgo: support SG2000
Date: Tue, 10 Jun 2025 01:04:14 +0200
Message-ID: <20250609230417.620089-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
References: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the reset module on the Sophgo SG2000 SoC.

Link: https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
Cc: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../bindings/reset/sophgo,sg2000-reset.yaml   | 35 +++++++
 .../dt-bindings/reset/sophgo,sg2000-reset.h   | 92 +++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
 create mode 100644 include/dt-bindings/reset/sophgo,sg2000-reset.h

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
new file mode 100644
index 000000000000..ab44d45ae061
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/sophgo,sg2000-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2000 SoC Reset Controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2000-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    rstgen: reset-controller@3003000 {
+        compatible = "sophgo,sg2000-reset";
+        reg = <0x3003000 0x28>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/sophgo,sg2000-reset.h b/include/dt-bindings/reset/sophgo,sg2000-reset.h
new file mode 100644
index 000000000000..23604a800f66
--- /dev/null
+++ b/include/dt-bindings/reset/sophgo,sg2000-reset.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+
+#ifndef __DT_BINDINGS_RESET_SOPHGO_SG2000_H_
+#define __DT_BINDINGS_RESET_SOPHGO_SG2000_H_
+
+#define RST_DDR			2
+#define RST_H264C		3
+#define RST_JPEG		4
+#define RST_H265C		5
+#define RST_VIPSYS		6
+#define RST_TDMA		7
+#define RST_TPU			8
+#define RST_TPUSYS		9
+#define RST_USB			11
+#define RST_ETH0		12
+#define RST_ETH1		13
+#define RST_NAND		14
+#define RST_EMMC		15
+#define RST_SD0			16
+#define RST_SDMA		18
+#define RST_I2S0		19
+#define RST_I2S1		20
+#define RST_I2S2		21
+#define RST_I2S3		22
+#define RST_UART0		23
+#define RST_UART1		24
+#define RST_UART2		25
+#define RST_UART3		26
+#define RST_I2C0		27
+#define RST_I2C1		28
+#define RST_I2C2		29
+#define RST_I2C3		30
+#define RST_I2C4		31
+
+#define RST_PWM0		32
+#define RST_PWM1		33
+#define RST_PWM2		34
+#define RST_PWM3		35
+#define RST_SPI0		40
+#define RST_SPI1		41
+#define RST_SPI2		42
+#define RST_SPI3		43
+#define RST_GPIO0		44
+#define RST_GPIO1		45
+#define RST_GPIO2		46
+#define RST_EFUSE		47
+#define RST_WDT			48
+#define RST_AHB_ROM		49
+#define RST_SPIC		50
+#define RST_TEMPSEN		51
+#define RST_SARADC		52
+#define RST_COMBO_PHY0		58
+#define RST_SPI_NAND		61
+#define RST_SE			62
+
+#define RST_UART4		74
+#define RST_GPIO3		75
+#define RST_SYSTEM		76
+#define RST_TIMER		77
+#define RST_TIMER0		78
+#define RST_TIMER1		79
+#define RST_TIMER2		80
+#define RST_TIMER3		81
+#define RST_TIMER4		82
+#define RST_TIMER5		83
+#define RST_TIMER6		84
+#define RST_TIMER7		85
+#define RST_WGN0		86
+#define RST_WGN1		87
+#define RST_WGN2		88
+#define RST_KEYSCAN		89
+#define RST_AUDDAC		91
+#define RST_AUDDAC_APB		92
+#define RST_AUDADC		93
+#define RST_VCSYS		95
+
+#define RST_ETHPHY		96
+#define RST_ETHPHY_APB		97
+#define RST_AUDSRC		98
+#define RST_VIP_CAM0		99
+#define RST_WDT1		100
+#define RST_WDT2		101
+
+#define RST_CPUCORE0		1152
+#define RST_CPUCORE1		1153
+#define RST_CPUCORE2		1154
+#define RST_CPUCORE3		1155
+#define RST_CPUSYS0		1156
+#define RST_CPUSYS1		1157
+#define RST_CPUSYS2		1158
+
+#endif /* __DT_BINDINGS_RESET_SOPHGO_SG2000_H_ */
-- 
2.49.0

