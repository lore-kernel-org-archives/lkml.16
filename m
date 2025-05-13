Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B485920101F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173233; cv=none; b=Ig1jnEP3hnJpMGhEsS9Hv4nAY64GD61RndyPEzoL0VUJWUu8P06+3TDucPB4S+9VnmZ9VI8zhOyp+iPZ5CwXYzg1WwErmZxQa7fuqGOT3bCizrayhnkelv7XeH6eHEtWwB8HPo2oWE+Ls9V1mLYYxWizpnaGM11YanP1KrrzHJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173233; c=relaxed/simple;
	bh=xlBMWsAZrqj5zy1JFeRuVY1+wAPVI04rIBiY1I2C57Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANqb3KM9Z2u6nnqvkkiDyCpo+LxYDKGg88FwnY4nyWz0X5QVTUE15EVJKRUr5jnPeBFSckueopVJux9G3G6UAQ9Z0fCQgU03PVutrz8Rh7eaoozP7z2InDfxVdAGmH/Z23iWnkFYh8V0eBAylalBrHMW0kHVHs/kl5F3p1ZEiec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=gQOw305X; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="gQOw305X"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85e1b1f08a5so212419039f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173231; x=1747778031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbxBBUJvcqhwil4A23CurPH0+5tzcAPEUu3t0yNeO0E=;
        b=gQOw305Xr8BxwBoF5DJ3ZG9zSLmJugwkzUo3kapeQxc1BDCjNYPkd11Wt34dpkYbs2
         lIyBr/hVnfN740X1TDdC4+5EGZUkFYh/iKQm+J88cjUUPzeqLzQsgyBpN/KxNLYbW9I5
         +16bunPS0QZooZAQ/Eu4NwPSiUKObGDOhUQ2Ia+uWfULQ1jVT2/g25YvJemb57L0xGBX
         6BmtBtWql4x2WfICSwqQRoYX6oJEHLjj0bvY3l1rCDJ0HWAIrAZHG8fDHqQ19qzS7yoC
         QfjrhYc09sFIR1Xk2yy2LCUb7CdzmL7PggDnL0s+Wpf9N3vjSF2HXxahVhXHGXu2G9jz
         hmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173231; x=1747778031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbxBBUJvcqhwil4A23CurPH0+5tzcAPEUu3t0yNeO0E=;
        b=CpQB3cT7MeSQ9qb85CqVKJi9l4dPKQ1Aqy0UTMbrQ4KsM3FLw0r7f2FfFutYWnsr7X
         0IExtx8i4ZEtkTNsNO76OTQhIQnjrCZavrxiYKViFIFQjEJE3dbU3e7AKHmDr+vdrTco
         8gD+oEsl1QhSob/CWHmVDpBPrezCZKBDjB/I1jWFdJTahurGOyCnk9NyxFzO96pND4uq
         nHf4oq0pgrhbdZuikGnbHliDl1n+NBR4h5pQPal7UgzP3KhbWrJOuNPxr9cJaSPpo/ib
         HvrV48nT50HSYAFfenb7b7j/xxH+xHj05zTtIKMXQAxDO5mkVGaTIqhkwz85s6RJNTrC
         KUeA==
X-Forwarded-Encrypted: i=1; AJvYcCVYpl5VnZ201mO3RtSPakOc1HzCPUNXQ5HUZPZSywzNdqunZSvPS77f+4f4zlebmemZH8O/JD2AvQjPDcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTXK3LMYn7cK9lXlaOzxjxcHYS53TaxwD5vDI2Bzjt6NRnfIWn
	MUKsWSpmkU7nEoycYrKrV9IVAYFgZWk+eXDyNw8sjPhG5zbHtYqGIlYRCWX/p+g=
X-Gm-Gg: ASbGncs8j27AtQuyE6+Hf1U3oXRZpdRLeTpQoA96/7IN6qQ2NoUSUnZv+LDSTPPVE5V
	rsZV+UvB1eeArOy1lMVJKwFSlsaXrYF2uisBOXtisdqkJrGgdNah0XBGo7qfOzFUr6o5LcDSQJ+
	7elMnZIWAivRZw2nHJqg6GJCGYmgE9jYbGGkT5d+n+BQ3y35St+eQAdC6L6isgl+RK4FL8+gL/J
	VRqpo1mgOaG9b0Xisc+vGrTOYS/x/8gvBkge4wBDUT/qQ/E19Ls19tIv+NG46Xcd+B9NXiqJibR
	GpvHtjGDk1wfgsmYYPu1MgkCjOV//8SBQEvNV53ZfTu5IzigFpRsh6uk2nAv71kBQYd8aR7rCsU
	wmhlsGaaXVtgOekHiENjyK9Y8
X-Google-Smtp-Source: AGHT+IGvo6n2g9cBDD2EPmW0d36VXyq1iYDSLwfbLFArP6tvYEi7yO4G7udR7LYtSrUEO9d5t1FPbg==
X-Received: by 2002:a05:6602:3a05:b0:867:47af:5df with SMTP id ca18e2360f4ac-86a08ce2933mr143963039f.0.1747173230761;
        Tue, 13 May 2025 14:53:50 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:50 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Tue, 13 May 2025 16:53:39 -0500
Message-ID: <20250513215345.3631593-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513215345.3631593-1-elder@riscstar.com>
References: <20250513215345.3631593-1-elder@riscstar.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
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
index 35968ae982466..f5965dda3b905 100644
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

