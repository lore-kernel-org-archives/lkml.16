Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EEB1E7C20
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195761; cv=none; b=mTDZP3sj1T0r2O9ZCELR/JeZHi8dI9YyHKvOBu/+aeD81/abos42+oC1Itok7QuIIcbsOuK3Vq7Qp933cmL0zbC1clkWvGJFLeLCVi7K9or9m5c86olXnkH7jWMfO/WnXxyHPpMXz232wJdYF2CpDZapZoq9mhItdQKB5gKx15g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195761; c=relaxed/simple;
	bh=GyqZ2MNwSjTkp/lvZiB/I3umjs94/62JYLwvXmqjf04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bnt7e0OaiK/JvrlUy2hljht6PeVeEerGIo5Xo/brs1VU7B2eqLZ799jnb0pC6mE/6Nt79pry1p0GXLNZCCjYrpe4V0u1l6oJ814ru4UhdM91hZh9R9nQ49xnvPOzDklq9/KRcdVGkx328Se/P1HuvKqP3vv6g/wdazGxOzPP0eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cefpM4z0; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cefpM4z0"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d589ed2b63so21356295ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195759; x=1743800559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+I4R8hFY8nbTjxThMP1fCn2I0A92HjRa+9lI35yvdA=;
        b=cefpM4z0s00E6S9nKBXaYb00oOmlearQcxueujSEaIs+QenuOkObEmSV+ROIJ26Ate
         LLwRijeF/h1hXapYNsbjoB669c0+Kwjk6z/7fvQkHV11XIod/SvoMQXmpaX6JilB/ERI
         8Qb3DwuY2GM0VKYRPTA8BXYhhsHOSaNoUjx4YIx5JZ8avqTWEEOBB5+T7ua0nXmH8pnx
         lW1mcwWIguMFKmf80UNG45SCUuXZfz6R0NPZurEKlxwVKWXKiP4YqzLSOW/ieEvqLjzC
         X6tWxmD6UXvdGFTlZe+HCDkuz/N9SSNhTKyfC47v3NMKW91llTfbBiRvmdUzqBLCoxcP
         Bv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195759; x=1743800559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+I4R8hFY8nbTjxThMP1fCn2I0A92HjRa+9lI35yvdA=;
        b=uHaI/9M+HUrBy1m+FdiWl7YVhzzrofEnb267QiJTs4TV3dEHSvv3nUwau7lfOUtWfj
         vEJnnaPdfBuszUq+n6WWMt0a2otisQgwLdVSdGT980BkTxSeTbDOkW44degsGWMeyuGl
         cfXPwSuKq+ArPlhvymF/VNeF68re5SMoN7QTNBozi4LbL1aBa3jwqPEmSqc4HxHbF2fT
         JyYti6Hev5/YWkqPGTaTN26z5mESQqgQb8tiystMWQ79e5XfdeFtrtk4H00230lUostZ
         dgLge7HFG8T4tBWt1WmsJ6IsLp7kFEKStxNQJUOsi87DvR+OrFBY7RV6TODX2HDMUNDf
         5r1g==
X-Forwarded-Encrypted: i=1; AJvYcCVPMAgtdD0RZ8zEGYXhB9X3D9yCeVARKrVsBokPtI4ebkhnatXjnfQn+BJHnxr1YX1NbZ6+ptssGkpzGcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH7U93CU3Gn3WGSS62oNAn1nukqoYIW6yo7F3JHMaDqjIQD8zN
	8ZgpetFOHr46B8yi9Vv6iunxvzMG/5RrGlfuxgzLs+4iCtxtXC0YD9iIVkbUoi4=
X-Gm-Gg: ASbGncvyxnpgqPlsETp13as/u0cSDz2HpMaVPMGNbAHlR80YLB3hmMex5QI/+2rA841
	GSCETvITf4wnmzEEUdbX3vwg82FfPPbwTqPduI/0wWfdbmZLGNENPJ/DUAbchutD8r/yxRZXA+p
	OkaD5n8o5M7I0ohe7vFn1a3dsLUWVe8mcySz6h7oQcL5ndjEI4caFIJq+aieRFgcG0uG7PVSnqc
	Cj1rZnmcBdf8/DBwXWQeVgU9OUkAcwSXzrR+x6JSc1pzSt2MhqfEqe+4oJ0JxUvTqEnADRHBvZU
	znx7+kSzONRIA6RuJWkQWkXyGEoKy/2b7Oex7JogKmDMOzda8AcEPLTJDznVDDmWNh6OOuf0osk
	D6IjQr/FAAyCV570+TyYAHyZ5km6y
X-Google-Smtp-Source: AGHT+IGrCkE4ALBvVvYXuJ5uIYIbMnM60Ht0P6jdptpmfqvQjmweZFQXjhwRhsQczTG2B1yYskoZYw==
X-Received: by 2002:a05:6e02:3c85:b0:3d3:f7ed:c907 with SMTP id e9e14a558f8ab-3d5e09e4ad6mr11092245ab.15.1743195758716;
        Fri, 28 Mar 2025 14:02:38 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:38 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Fri, 28 Mar 2025 16:02:26 -0500
Message-ID: <20250328210233.1077035-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are additional SpacemiT syscon CCUs whose registers control both
clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
previously, these will initially support only resets.  They do not
incorporate power domain functionality.

Define the index values for resets associated with all SpacemiT K1
syscon nodes, including those with clocks already defined, as well as
the new ones (without clocks).

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v2: - Names are now RESET_* rather than RST_*
    - Added Rob's Reviewed-by tag

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 128 ++++++++++++++++++
 2 files changed, 137 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index 07a6728e6f864..333c28e075b6c 100644
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
@@ -57,13 +60,15 @@ allOf:
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
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/spacemit,k1-ccu.h b/include/dt-bindings/clock/spacemit,k1-ccu.h
index 4a0c7163257e3..a4f68cba44d1b 100644
--- a/include/dt-bindings/clock/spacemit,k1-ccu.h
+++ b/include/dt-bindings/clock/spacemit,k1-ccu.h
@@ -78,6 +78,9 @@
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
 
+/*	MPMU resets	*/
+#define RESET_WDT		0
+
 /*	APBC clocks	*/
 #define CLK_UART0		0
 #define CLK_UART2		1
@@ -180,6 +183,59 @@
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
 
+/*	APBC resets	*/
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
 /*	APMU clocks	*/
 #define CLK_CCI550		0
 #define CLK_CPU_C0_HI		1
@@ -244,4 +300,76 @@
 #define CLK_V2D			60
 #define CLK_EMMC_BUS		61
 
+/*	APMU resets	*/
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

