Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B8265CC9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456240; cv=none; b=kmMu6aXYm2boOpkIh1hA0xpVyiGS8Hdx/oAbBuW+qXNAGY7rOBixdUNu9GqOv9b5GQdtaBsUnDFNH3WPa0BonPKHXh0a8658/v3ktU+PoS8srCAGGw4yEShYSh6Dma5dL9QaoG0hCm3nr2r8tAAGSPFqFRp4yDfpMK2uMNSu8aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456240; c=relaxed/simple;
	bh=CEVE/DIIGrcD5g99FGcrMcaUT/C8M4qKM+gQUhyG9fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjYejS/LPJjrNY4YYGi5h/UgQsJRmnP8bV6LQXsU4CQBYKFBNWN/WI+MTZxQJskmHJ92cgTmD3OVPDU3WUxqZxYdDHkoRWpvOsUIGkhtM2BcwJOn3JKuIbp9BcSIzkVQiS+2L09Meg9ihMM9DICHUZIb7lF//WGKeKxeQKvhRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=n/uVrvo9; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="n/uVrvo9"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ecf99dd567so58818326d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751456235; x=1752061035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJLcOqbX1M7XqlFxK7mA92KamIHaBxAn/nE4MeoSV/c=;
        b=n/uVrvo9j7yAAXgOMyChE2F673ipYbt61peUK2gZ3LlJNDcqOuoO/imnIKxGG25amJ
         wCvjSCSC+8Zl4/JdUxFUYWkPf2a17xCAj48IhtbNTFIoEZ/BW14GvFU7X+O+OnSvWev8
         bgmehD7XBiWvK6wHQclq3EEN/XaLNNp/va2Vhe2rbvFGC/XTZJrFOYzmvTfvSetwaxgq
         /XC9DKl2xw7JX3kXFokhQoWsroTheSnEmk6MiPkeScmNwuK9PgKWNsqZ2vjgsYc+HMp6
         4lOd+XjIyqzu5Nq8Tz2scUR02q1WVV/14MfwncCcgbVsgFI3N3HslLC0gTkWrGjnZh+z
         1n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456235; x=1752061035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJLcOqbX1M7XqlFxK7mA92KamIHaBxAn/nE4MeoSV/c=;
        b=bTPTTGG/tTS2uQAbCGBERkjFmPr3+AD9V8lj8SZGXMrt9yoS7vz7q58DtRw9pZpe70
         rx8/JN50PA2MGfVUg21dHsZTCvsa3SIRGMPXWwUsBRnz/T4V+EKvWQjACQ37NCBeo8yh
         eb7uo77GIPBLRLNsDFUnt5a/laYADao4rhAVvtR2Umy7ScgYjKMRGiceeB4XLhmEdyJ1
         aT7noXcGIGMnjpLI3PuiYsFxatB4P7YHzJd/qSzLq+cKzsSWfdfXtn8pmTf/23IHDkqz
         lRXw56Wxd+Bpc6gLbsRncZSBu2mqo0Gzig1xpfPF0tATFvovK1JROAmxZkqs/6JZErdT
         v96w==
X-Forwarded-Encrypted: i=1; AJvYcCVwQVRzEMWqVqoTAVBZi/YWHlNt/TB3tjPfOyTcwzc8jRR3u1xDNf8MQAbw+4emWHgicFO1+uTWQTuIQjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkTHd7kL+11gmjsUGq0V3X7sCGUGP9uEwAcyEt+xP7c2/y9Jmi
	NN9vJ0dakWQa/VKXe3UWGv0l1dR7dCY/MNLTAk4AKLAfl8EcjU7bpViLns7Uf1wjEYU=
X-Gm-Gg: ASbGncvfS33H9YHZuIiyGLk6pu9RaAy/OXxGGQYzYZa2HQqSQyk28uGPNUIzTvHHJpJ
	4p+K1gLA1C+ip+brVk8ntbz6b5DYmkfALaAmip3eNKEIJSNs97lvNcPDFDcchkgtaihuz5UxLx5
	Unuzjv+Ir3ZeHcPjiAYDzrtHo2EuoNmDUpvxgtS08H5a0Vp42xP4jPY6z9sSIjS5mZVOPRxjDSB
	y1iLArOXUudJ96Sb9WMJLp02gKmMOfvqZW+td/n7QjBJQU0QDkinGw0FwJVauEc+ZOURMhj5wuc
	xuiKdKcRVQ4lYRABrQW3KCt4edVK0k2fGosD7SldMOi5JbtSBQwMFlAfy9Mohxga3UcsCuoz217
	hnJw4FU8E/rdPZ16eHY6soM2kyKdF30co+x3Qn2H0hOGTXQ==
X-Google-Smtp-Source: AGHT+IEcNGwa4EyflCaI/5VoYR6JO4vu4+SYgL4zrEJl1LhoNyjhxxY2wHsEGrp9KsD1oSCnhHVU3Q==
X-Received: by 2002:a05:6214:d64:b0:701:a0e:861f with SMTP id 6a1803df08f44-702b1a3e75bmr29890616d6.9.1751456235338;
        Wed, 02 Jul 2025 04:37:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm99218046d6.103.2025.07.02.04.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:37:15 -0700 (PDT)
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
Subject: [PATCH v12 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Wed,  2 Jul 2025 06:37:03 -0500
Message-ID: <20250702113709.291748-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702113709.291748-1-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
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
v12: - Rename PCIe resets to align with their clock counterparts

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
index 35968ae982466..2714c3fe66cd5 100644
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
+#define RESET_PCIE0_MASTER	23
+#define RESET_PCIE0_SLAVE	24
+#define RESET_PCIE0_DBI		25
+#define RESET_PCIE0_GLOBAL	26
+#define RESET_PCIE1_MASTER	27
+#define RESET_PCIE1_SLAVE	28
+#define RESET_PCIE1_DBI		29
+#define RESET_PCIE1_GLOBAL	30
+#define RESET_PCIE2_MASTER	31
+#define RESET_PCIE2_SLAVE	32
+#define RESET_PCIE2_DBI		33
+#define RESET_PCIE2_GLOBAL	34
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

