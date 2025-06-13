Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C371D5CC6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777109; cv=none; b=mvLcaGraQL/JZFKzfuGuUpFWXXfFIgnuATQpHmy3CjjbaNVI6UBRXXXZ9sl2OloeQACq2by8zGNzi/xIRlp0cABhW+lBmEtnJGPE2n7le1v8EJfJ7R46jNWh3dEpm/4/fR+ujeEtQ12E+5n7e8qtc+4/aoqZX4A0+xgN9yzYXLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777109; c=relaxed/simple;
	bh=G2LJ8qdRmwkw39n+FaDEDWwgq7C6rp78wyzHDLz5i94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XiQgtmWrTUt+6YLFOOgxCUxVxsMISgRquS93h/fqjQvLCRw4taegX6ZdPLF2gZT23EHDC5OI3bhAixE3UWIPFEjzZRq9rQOsGRYXYp9D9c7f/JUu15jdZ2nEcHU2T0aO1U+qdouDQPQ8Rb0cZBGocPyQQk/KzQ0818tQKv0ytOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WyJqLkLi; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WyJqLkLi"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c27166ab3so1171528a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777106; x=1750381906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIMzta2AftTuOCZk7on/aypnLuIwPcK53zSW3MHSvpg=;
        b=WyJqLkLibSUbNhWW35E5Tgr+LOlUZLYYfrw1YBEp+vz9vFQBCjQMai6YMn2oem8L/b
         A9lduKRLrCQC/mcBPWO/uzuRHRW0wbXxpWUZ/vboE3b4kMygMRRre+Zj1VHWA3GZYr0/
         TsGrObU2tDgmi2glcotVB/TIFeGHMw9X42Bzk6G+jpb124A/Xgi5yRjgR9ThCwr3p31w
         v8dHEDGJXN5GT41D7Mc7B/TfGulRv596RMiCk5XI/RpHZ/zIMXthdCu6KJDZFJcjGhvx
         uQoj7KQRO0vi6qpkeWt2o087UWu5EjaENN0FqwnXGkK9u1D5UWiwrkalYkjH1xVtTLai
         pzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777106; x=1750381906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIMzta2AftTuOCZk7on/aypnLuIwPcK53zSW3MHSvpg=;
        b=o3A+T8fF2w5+nT+r0tvY9dR8E56zBV+3B6d/mA4x9jrFxHxKvO4GiPmUxHluECmMSg
         zYcrVV9U5JKKt7GfqUQJUZIqsd7lR66kN7UMah8QOAUfjlyxE0JLyXTTFlc+gbizfmj6
         US76U0Fg3LAySfqDCier262AxZeaT+eZ2ddvdq/cwateH1QUC3pP0O4ei2ZpenCOwVrA
         acCcPgO+ofCmEamdWc5gdthf3vh3+lyP3XiW9IdS0WF1QFOWJi2vzyPQ/tPoToeleih0
         /mM8J2Wf7NA89CF03/md3k1g6/gAaJBGRX6RYkylQ3OO062cyaPLz4FbWoDePHISuwDl
         o1qw==
X-Forwarded-Encrypted: i=1; AJvYcCVHzaCXuR/YtGsQWXtLkufLTu1UOQsSe7XZ4+HOPiBxWLJ2QTGUzGW2EhV7jqpEnLuc/biE4K/gb1liMZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUyczFPltrhyEgW0mN/j/r7Zrj9OwuyVcYu2Rj7utbymJgmF4k
	RkU8bl2v3t33hYTPmAXQfeV5Thfb+dTNL0xXsYHpg/8IbCU3hgilPmcEE3Ots0I3+mk=
X-Gm-Gg: ASbGncvAoLJxiZVtemxRD9FayPYOEox+iWk6Zs4CDZ8zC6uzivtQj/SdVhg/fMLaYJ6
	WBSoloIMAIDzM7x+Us4SG4X6tc+eJlRL6/uFs91vHwELpbxre51aeAnA7ri3TcOGsBOb5tu/1yD
	bc9VLEnMfZ1i0j0o7h57HuoIE8jGL9UXfmu1eaUWMcbqbKhIwOtPOR8I32jQ49FsKmXVlyigV+K
	WZUajsiWNaQ4vU1WQJewau8BO9inAESk8Upb7JTMV662mYk1x/Jz0stQkC01/7zZ8a66R4yHohu
	Aw8u0cuOALDElVmoOedV3arXmJ113N3UtLWrbAW5zlw5nrbs5PWd5DWvZWqT530aTqA8YHC+3WV
	hMRavjN71vihKTFQV8dUxizKlnGMBh34=
X-Google-Smtp-Source: AGHT+IHGyKqIzZMGUS+0mLJ+XXdHKM3DYFea7kD1MLQTICc0wh8Dsy0iZHSyESayB407m7TuPOsAmw==
X-Received: by 2002:a05:6871:8011:b0:29e:65ed:5c70 with SMTP id 586e51a60fabf-2ead517c850mr729455fac.30.1749777106478;
        Thu, 12 Jun 2025 18:11:46 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:46 -0700 (PDT)
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
Subject: [PATCH v11 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Thu, 12 Jun 2025 20:11:33 -0500
Message-ID: <20250613011139.1201702-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
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
v11: Expanded combined reset index values into individual ones,
     e.g. AUDIO (3 bits) is now AUDIO_SYS, AUDIO_MCU, AUDIO_APMU

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++++++++++++
 2 files changed, 163 insertions(+), 7 deletions(-)

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
index 35968ae982466..8142b1b4c5d7a 100644
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
@@ -244,4 +300,89 @@
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
+#define RESET_USB30_AHB		8
+#define RESET_USB30_VCC		9
+#define RESET_USB30_PHY		10
+#define RESET_QSPI		11
+#define RESET_QSPI_BUS		12
+#define RESET_DMA		13
+#define RESET_AES		14
+#define RESET_VPU		15
+#define RESET_GPU		16
+#define RESET_EMMC		17
+#define RESET_EMMC_X		18
+#define RESET_AUDIO_SYS		19
+#define RESET_AUDIO_MCU		20
+#define RESET_AUDIO_APMU	21
+#define RESET_HDMI		22
+#define RESET_PCIE0_DBI		23
+#define RESET_PCIE0_SLV		24
+#define RESET_PCIE0_MSTR	25
+#define RESET_PCIE0_GLB		26
+#define RESET_PCIE1_DBI		27
+#define RESET_PCIE1_SLV		28
+#define RESET_PCIE1_MSTR	29
+#define RESET_PCIE1_GLB		30
+#define RESET_PCIE2_DBI		31
+#define RESET_PCIE2_SLV		32
+#define RESET_PCIE2_MSTR	33
+#define RESET_PCIE2_GLB		34
+#define RESET_EMAC0		35
+#define RESET_EMAC1		36
+#define RESET_JPG		37
+#define RESET_CCIC2PHY		38
+#define RESET_CCIC3PHY		39
+#define RESET_CSI		40
+#define RESET_ISP_CPP		41
+#define RESET_ISP_BUS		42
+#define RESET_ISP		43
+#define RESET_ISP_CI		44
+#define RESET_DPU_MCLK		45
+#define RESET_DPU_ESC		46
+#define RESET_DPU_HCLK		47
+#define RESET_DPU_SPIBUS	48
+#define RESET_DPU_SPI_HBUS	49
+#define RESET_V2D		50
+#define RESET_MIPI		51
+#define RESET_MC		52
+
+/*	RCPU resets	*/
+#define RESET_RCPU_SSP0		0
+#define RESET_RCPU_I2C0		1
+#define RESET_RCPU_UART1	2
+#define RESET_RCPU_IR		3
+#define RESET_RCPU_CAN		4
+#define RESET_RCPU_UART0	5
+#define RESET_RCPU_HDMI_AUDIO	6
+
+/*	RCPU2 resets	*/
+#define RESET_RCPU2_PWM0	0
+#define RESET_RCPU2_PWM1	1
+#define RESET_RCPU2_PWM2	2
+#define RESET_RCPU2_PWM3	3
+#define RESET_RCPU2_PWM4	4
+#define RESET_RCPU2_PWM5	5
+#define RESET_RCPU2_PWM6	6
+#define RESET_RCPU2_PWM7	7
+#define RESET_RCPU2_PWM8	8
+#define RESET_RCPU2_PWM9	9
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

