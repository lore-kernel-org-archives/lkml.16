Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5B28F944
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789641; cv=none; b=jjB/4PU1jbsJV+pjS99WN7R7nOBGfRXhtzg+QSnnaNEDyqVvR9EdS7ddmkPG7pFb1RUHC/zwkuCVC4BPfRxiUgKj+WPOY8anaI+DGHFkM+sKXzDneA2vQcpxO+A2wiTqg7rsoVFAgTDCS+gomJA3RRy0CztfGvUzfCAwZsGyMYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789641; c=relaxed/simple;
	bh=JbvxIKNnm2l02MeokP48X8vc1GIBXzEECfh/a24p9gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dideQ2NVTeIXeQSvOQJDRDtg3t6kuLItp/i3z2SaSoqe+MmpvySNJnWQrVLSM1A3+dLKCG4atEXg2mWnn0bPCsK1pX4qKtldOIf/KIc8QuARe5Iv81sEg6Hm5bNjKDwUfUGx42FIeuiCoA2PpQHtRhOVY8miiGZH0Y4yQFFHWwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hH64x3oh; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hH64x3oh"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-86135ad7b4cso79773139f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789638; x=1747394438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81a1v+nMC7nJeIGTMZQ54emwTNg/YN8dMbbTK1LgyT8=;
        b=hH64x3ohvzqCqb+D3d4JU4Mu0AUyUrk7RPO0U9aUeckjqbqsV8aF7OZ7+jp+FwGV4k
         UiRje9D6BoX6TW4Ul9r+303Lktz0/rUReSxsflcRv9dscyst4RRS87onTV6IsKpqB0gD
         hmEUaNKYwHyck1lZttNqrovuZtlSqwzFwyc9oquJKSFovw1+oBH3WfX+kHOZZTtopDZP
         H8SVJhLsvlrMjf570QsLrE2JPki6IodSsxrpit1HJEdIXDT10+lGhw7mRd8YR9RB6bXB
         cvqX4aPADjPO0YQWsdZinlhaBsO5xFli2IMVxR4GRkE99DN5oJPkVNUCJ1Olz7BLRNyr
         OaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789638; x=1747394438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81a1v+nMC7nJeIGTMZQ54emwTNg/YN8dMbbTK1LgyT8=;
        b=EmgQ3/bdO78HzhaEH0GuitpYiwHCuODcsr8YDeo6s6ig5QAnP7hdI6iEumpyZGWKZ1
         Q4xsCGsevSI6s+uKrKYHgHuudLic/qxtnB2KhsA2LBSA+exjLBw+p9YpAhCXTqvmJhcD
         o8BD9MVmFQmqV1m4mQyzRw5mdkYOsDp38qLrdbmYrhIsl8kWtMVNZqKg6kGcv60chM8d
         Su7nozV1JnMtC7OV54JZx2Qo/EDbUu36wEjG9AptO052b6ojXQXJkpJ4hSZmpG48k9Fs
         2jFaZKJN63CZuU/g7XL2zuhXWuaTCTLVmqzrJxEQiTfYbfd+2X1LHvApekzHtReaeCU2
         mImg==
X-Forwarded-Encrypted: i=1; AJvYcCWZx0JgXt0qpGRyJrj5FHEpIyjFpPHHaAPv8BWX6lk6eveniKooBICS0ErtBDWHng9JJEt6pZS8seC9RVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIG6xSm4AGe/1rzjzgsa58gwt4koe6AkqZgR+XnagEQ6Of6lb0
	7DAXbN/sxJ/wHM0Y8NQY13yxMS0IgFNKuKo8fb8qFqmgnsucDT0hsy7Uhkf0QIAWKRgkMuioN75
	d
X-Gm-Gg: ASbGnct3y1rNNnsjHUd3WoEmkGzbqH1Sb5xR0f8nzOh+BzMDisv9Ssd+InN8NtHgd54
	4+gBH+ozkLzaHP5GgqaYEH2a1LVaIcrORB/N5J0S35u79jaOIdiOrF1xWzwSRTxFkzolP7x3Wbb
	NhQeqRJNRvJsSepdIQlGHkG1DzwBfuTDKunhzn+OtxzuYvHsfv63FHx0lN/TsLP+nOBcNidkt8V
	R8pksqVb4Vvj9Yu4Xarf79sNxk4bh3CpDZceKKIY7kCfMa0q5y+mZNRHk2LQCWmrOsc9E3J2VkW
	+OhrZxRX7gnH5QdiajhRGKhc3ofEKCCsNYfP50LRcUUOHNcTCTzDqkPpH+lDbHa1Om6GZJPqnb6
	mDmX6TT/1dbFUeA==
X-Google-Smtp-Source: AGHT+IHIFOd9BxSrCUcPfDazC4FevD+g6jgrAHKlwXuPMXe2lOKzMYuF4zbA6JhgjJ+OgEiRD75umw==
X-Received: by 2002:a05:6e02:216d:b0:3d4:36da:19a9 with SMTP id e9e14a558f8ab-3da7e210280mr31801165ab.15.1746789638269;
        Fri, 09 May 2025 04:20:38 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:37 -0700 (PDT)
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
Subject: [PATCH v8 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Fri,  9 May 2025 06:20:26 -0500
Message-ID: <20250509112032.2980811-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112032.2980811-1-elder@riscstar.com>
References: <20250509112032.2980811-1-elder@riscstar.com>
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

