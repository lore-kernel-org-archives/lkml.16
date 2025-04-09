Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB46E21421B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233469; cv=none; b=mundJMy4SSQKcC0e2yGpy2h6dONjxnF/6FLV+OqwqKv9n6xlym8QY5zHTtwWvj2noaDwACyuJ5lInI401jth0qc1bgKdNn3rvTlXGsyIxMt7v8FaMRylnjuvKFouG8GjxegY7mTdToPPpXKTYyZ78ry9QsYPQKI6927ZX/G739k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233469; c=relaxed/simple;
	bh=MbCdEMU6mcfi5DUiGc5qT4xrhg/pjSeF3S++e48tF4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJlpHE9oWnGM6lg+T2ZF8HY1rdStfrnHFZOh0m8GM4ZX2l3ELpKHEuLErLIi12LUGSc+tDjWN2nM5FrLYl/Ad9CuLKTMotNPNKHDLijYZopzMSRSqrdvEDdUzdkmh2hSxfL4dRlV89C8EhQjOWGdJAn3qT4LAyqqaSiSnOiPnp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xlziR6zn; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xlziR6zn"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85e15dc8035so7783139f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233467; x=1744838267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uckU6cSrVb4mv3XjrpocuI6fDt+drUK+mGcGqyhezA=;
        b=xlziR6znxZucMUdkzKnYvJOnvARrk/Ps0AxYtJ9/lB/YlHbIHIafm02WzUx+upP2mA
         jz+uh4Q0ZGMh7zOUsGyXLYEx4yqYIoDGQOSiLXnV5cZQ+gNZzeGPCwP3o3UaYNPkC7bn
         kUHU9R9z4s8VOtAuBACaPiQS0JT/U2HMSjKf9DVTs6V9pEtOKUFNrpE/nIEVr+H3V3n3
         aV+VhOky2vZUJmpVXi8vQgAvFA8s0HD6A1lfHItrKt7P1mVMC0DqUattjx+Aszlw9m4c
         5N6NqwD1QbDekWhxhjgxmljp98Tn5y6O3u6eGalg4niwZDWrNrzSe0GgFtuW6MWFoSHW
         FdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233467; x=1744838267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uckU6cSrVb4mv3XjrpocuI6fDt+drUK+mGcGqyhezA=;
        b=w2OF0eAGaW4AxQu3gQqhbR+xk/QbnHD2vKqRC+PCMQqf6OCJaA5DF+pTbrNwZRndLG
         XDeJwJExVYjxXdQvYC7IsIAZJMWxo7Hv/LrAZC+z4szLDCOSZbwokqafB+HgbqGR2277
         eRAqNwNFEJYAwC4ee6/8FFtRZ0DWL8HUAq3Sj5LKY55jZ6RK5hBj5cJk30qhrfMf8r5D
         NXhg+/43dBFLeUJ4VxTTuB+pAXzGDmN+8SVDpOe8EC1OZpQjLvWkWuaT9fIprLacweKE
         fg4GL8ItiOeBMDWMy7A242/qhbDZl+FuUWRNESdTQplNNNAZvfgy+T8BtjZBGoioBUBf
         cFpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGVysbZKJxM32lUq8rFLq1qmrL+YpB4AOs+iowUbYg4/Q6bPtegTUUaVj0UVpmwzStZFd0YJuerHgl9rE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcxtrEFO/rc5EYTW2/ICOb59OamPzBC+z8YhiataEIFOAdK6U
	nGmDEY80qSEhSabjSpF25cGgf7oSfHfSip42/NFTInymKyU8pKhguM0WeeMee6k=
X-Gm-Gg: ASbGncv1gDEiIAhvvTW86wu3YMvvcodsnEP0VdLhHHUgC8KysYWBXzot8HSHy0P6pfZ
	/A7vF9aPOk/VKmMdsKY+yiwt8RgmvcOzC00txFZniYuAsYuK6sZroVei5fgKLiqRT3jFFe6V+Uj
	GjC8LWV/2+34vL3U16UFDLa15Io4GqqtDfyEWFTaf+7Ifa5s0Uw8XbfjKJaAe8QyHmEdV9B7Txo
	3eJZ5sspbqhlTsadltzLDogJm50uLjhHyERQZSNPT05/f+iiLrjRN5jbRBnXB7Cd1nPKOscgetm
	dtNbNXTaIXmx8sDISkFwO+k0ftgWgKXsSBoRKyAWwQENpCv/ok3Z/cldm9I65KCepRKqwCW81lD
	SUpsrNsCdZx8gDw==
X-Google-Smtp-Source: AGHT+IHqLMOAFTB52Fyo9zxahFjl2RnMnWeOq9211jTTHoADDLr0M+XinXubk6HrztJffoyUE6f5tA==
X-Received: by 2002:a05:6e02:3807:b0:3d5:890b:d9df with SMTP id e9e14a558f8ab-3d7e475e4admr6578655ab.15.1744233467018;
        Wed, 09 Apr 2025 14:17:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:46 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Wed,  9 Apr 2025 16:17:34 -0500
Message-ID: <20250409211741.1171584-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are additional SpacemiT syscon CCUs whose registers control both
clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
previously, these will (initially) support only resets.  They do not
incorporate power domain functionality.

Previously the clock properties were required for all compatible nodes.
Make that requirement only apply to the three existing CCUs (APBC, APMU,
and MPMU), so that the new reset-only CCUs can go without specifying them.

Define the index values for resets associated with all SpacemiT K1
syscon nodes, including those with clocks already defined, as well as
the new ones (without clocks).

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Made clock properties optional for reset-only CCUs
    - Removed Rob Herring's reviewed-by tag (because of this change)

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++++++++++++
 2 files changed, 150 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index 30aaf49da03d3..133a391ee68cd 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -19,6 +19,9 @@ properties:
       - spacemit,k1-syscon-apbc
       - spacemit,k1-syscon-apmu
       - spacemit,k1-syscon-mpmu
+      - spacemit,k1-syscon-rcpu
+      - spacemit,k1-syscon-rcpu2
+      - spacemit,k1-syscon-apbc2
 
   reg:
     maxItems: 1
@@ -47,9 +50,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
-  - "#clock-cells"
   - "#reset-cells"
 
 allOf:
@@ -57,13 +57,28 @@ allOf:
       properties:
         compatible:
           contains:
-            const: spacemit,k1-syscon-apbc
+            enum:
+              - spacemit,k1-syscon-apmu
+              - spacemit,k1-syscon-mpmu
     then:
-      properties:
-        "#power-domain-cells": false
-    else:
       required:
         - "#power-domain-cells"
+    else:
+      properties:
+        "#power-domain-cells": false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - spacemit,k1-syscon-apbc
+              - spacemit,k1-syscon-apmu
+              - spacemit,k1-syscon-mpmu
+    then:
+      required:
+        - clocks
+        - clock-names
+        - "#clock-cells"
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index efe29c976a01b..8733f59422fb6 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -78,6 +78,9 @@
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
 
+/* MPMU resets */
+#define RESET_WDT		0
+
 /* APBC clocks */
 #define CLK_UART0		0
 #define CLK_UART2		1
@@ -180,6 +183,59 @@
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
 
+/* APBC resets */
+#define RESET_UART0		0
+#define RESET_UART2		1
+#define RESET_UART3		2
+#define RESET_UART4		3
+#define RESET_UART5		4
+#define RESET_UART6		5
+#define RESET_UART7		6
+#define RESET_UART8		7
+#define RESET_UART9		8
+#define RESET_GPIO		9
+#define RESET_PWM0		10
+#define RESET_PWM1		11
+#define RESET_PWM2		12
+#define RESET_PWM3		13
+#define RESET_PWM4		14
+#define RESET_PWM5		15
+#define RESET_PWM6		16
+#define RESET_PWM7		17
+#define RESET_PWM8		18
+#define RESET_PWM9		19
+#define RESET_PWM10		20
+#define RESET_PWM11		21
+#define RESET_PWM12		22
+#define RESET_PWM13		23
+#define RESET_PWM14		24
+#define RESET_PWM15		25
+#define RESET_PWM16		26
+#define RESET_PWM17		27
+#define RESET_PWM18		28
+#define RESET_PWM19		29
+#define RESET_SSP3		30
+#define RESET_RTC		31
+#define RESET_TWSI0		32
+#define RESET_TWSI1		33
+#define RESET_TWSI2		34
+#define RESET_TWSI4		35
+#define RESET_TWSI5		36
+#define RESET_TWSI6		37
+#define RESET_TWSI7		38
+#define RESET_TWSI8		39
+#define RESET_TIMERS1		40
+#define RESET_TIMERS2		41
+#define RESET_AIB		42
+#define RESET_ONEWIRE		43
+#define RESET_SSPA0		44
+#define RESET_SSPA1		45
+#define RESET_DRO		46
+#define RESET_IR		47
+#define RESET_TSEN		48
+#define RESET_IPC_AP2AUD	49
+#define RESET_CAN0		50
+
 /* APMU clocks */
 #define CLK_CCI550		0
 #define CLK_CPU_C0_HI		1
@@ -244,4 +300,76 @@
 #define CLK_V2D			60
 #define CLK_EMMC_BUS		61
 
+/* APMU resets */
+#define RESET_CCIC_4X		0
+#define RESET_CCIC1_PHY		1
+#define RESET_SDH_AXI		2
+#define RESET_SDH0		3
+#define RESET_SDH1		4
+#define RESET_SDH2		5
+#define RESET_USBP1_AXI		6
+#define RESET_USB_AXI		7
+#define RESET_USB3_0		8
+#define RESET_QSPI		9
+#define RESET_QSPI_BUS		10
+#define RESET_DMA		11
+#define RESET_AES		12
+#define RESET_VPU		13
+#define RESET_GPU		14
+#define RESET_EMMC		15
+#define RESET_EMMC_X		16
+#define RESET_AUDIO		17
+#define RESET_HDMI		18
+#define RESET_PCIE0		19
+#define RESET_PCIE1		20
+#define RESET_PCIE2		21
+#define RESET_EMAC0		22
+#define RESET_EMAC1		23
+#define RESET_JPG		24
+#define RESET_CCIC2PHY		25
+#define RESET_CCIC3PHY		26
+#define RESET_CSI		27
+#define RESET_ISP_CPP		28
+#define RESET_ISP_BUS		29
+#define RESET_ISP		30
+#define RESET_ISP_CI		31
+#define RESET_DPU_MCLK		32
+#define RESET_DPU_ESC		33
+#define RESET_DPU_HCLK		34
+#define RESET_DPU_SPIBUS	35
+#define RESET_DPU_SPI_HBUS	36
+#define RESET_V2D		37
+#define RESET_MIPI		38
+#define RESET_MC		39
+
+/*	RCPU resets	*/
+#define RESET_RCPU_SSP0		0
+#define RESET_RCPU_I2C0		1
+#define RESET_RCPU_UART1		2
+#define RESET_RCPU_IR		3
+#define RESET_RCPU_CAN		4
+#define RESET_RCPU_UART0		5
+#define RESET_RCPU_HDMI_AUDIO	6
+
+/*	RCPU2 resets	*/
+#define RESET_RCPU2_PWM0		0
+#define RESET_RCPU2_PWM1		1
+#define RESET_RCPU2_PWM2		2
+#define RESET_RCPU2_PWM3		3
+#define RESET_RCPU2_PWM4		4
+#define RESET_RCPU2_PWM5		5
+#define RESET_RCPU2_PWM6		6
+#define RESET_RCPU2_PWM7		7
+#define RESET_RCPU2_PWM8		8
+#define RESET_RCPU2_PWM9		9
+
+/*	APBC2 resets	*/
+#define RESET_APBC2_UART1	0
+#define RESET_APBC2_SSP2	1
+#define RESET_APBC2_TWSI3	2
+#define RESET_APBC2_RTC		3
+#define RESET_APBC2_TIMERS0	4
+#define RESET_APBC2_KPC		5
+#define RESET_APBC2_GPIO	6
+
 #endif /* _DT_BINDINGS_SPACEMIT_CCU_H_ */
-- 
2.45.2

