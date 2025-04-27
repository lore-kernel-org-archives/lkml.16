Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56A2459EE
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739853; cv=none; b=IiaAePD1gKFRtPIBuMyunXSOei2pTO3SxUrAc4WozAZwJPVMOt4KbIV4jBIvpywQvsnGEfKBsA2jFkKshPaSGaPHjJgp2c6aWmmQZbapII7vdIoAOu56ejgzePVzwJ3iGVrgGtRncUevVlk+yIjQthzvo1JdPWUGN/fuP8X4bCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739853; c=relaxed/simple;
	bh=Fjn6a5R/gNqLw9tBNcBsmfV8WKgMwXQOeIVdmxwfqeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DP6mQsCLG6IJI0kmYAHqxO3RkfikUYSZ4GYLbkaWMnvEe9puZccX+Zk3noCOrOaqNw14kvX8Vgm+xtSg+AtDHauX2ZB1SoqPhTTbwArqvKDSAjaj7RfpbkooCgGY+nhoQOt4sb44kS/L1BiRplOqcbfq7qFYVLtabQ+V9wT+lmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Y15Qem27; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Y15Qem27"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so35314775e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739849; x=1746344649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noNFGyMHn+G12oU3fMyt85bZyrL7/rnSlw7jXK1JU9I=;
        b=Y15Qem27ddhRP2qxUM7QnLXQijXb872fokV0xaYfYNRj9FQIwLo3jdv4VvwfQ5bxLP
         WYFzdeMfa/MN+Ta4g6FcRNRjQ1NlaZMKUmmQ6urt69z/TPbyT0lmiL2h4/x+p+zudWTa
         02SzXHZ2QVL00pDkjhWTRSItawnezXk41NKkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739849; x=1746344649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noNFGyMHn+G12oU3fMyt85bZyrL7/rnSlw7jXK1JU9I=;
        b=wJfoKYXAYsaWDZAXI2C4Pthm9f/3sJdK+dCHuGAzclwWIA5Ibne8wTtf0azR3SMKCh
         4wrcbj6xJS9ufMN50CxOQa5TTA9MKq1u4JR22TvUvKCx4+ayeAB7BpWIjiTRUkcnWiu4
         o6Hfci//bUXRMKrijGvz20hawFrN1g7NrjImEPVCnH5vLLzAFYI36bjAxOEEZE2poE/U
         mHj6M/sMsO0tYAWgdltagGSEu/pV4cMrXEJD0+3NDK0bp7VY88gUy+7azleXT7NkEXVU
         VG1BeGcJ3kzCmlVKjc+4+q2Xps+TwmimJInW1p1HRqenJEtwva64VAOD8ejxI0Ch5cqY
         ywjA==
X-Gm-Message-State: AOJu0Yx4wdT1nvv1qZDZ48pOTXhEQWR94qrmwBtoFXT1s0YsboqTnAW/
	hBqLqaAOGTipI/bDo21NJ2h7uGCQ2y4MVnCcCPGns7bHxBh6vSZKDevdutTWQgm5MEjGAtINI0C
	G
X-Gm-Gg: ASbGnctZAO+fRUR90tKAaeOFM3vojx3bCGMse7tYgi9c1haKKKxAGbBYUf/5jL/EA1Q
	mZIenE/fg+dACNS8/6gRzwKislgBS1E4JELpgyCEXq5FLRt3t2esXefKRZHE/mZEe3auZ4LxRL5
	ycmZ0rEm4GC/A4+i6qvnQYWqv8787ZnIUD4caq8e7NHTC0vmcs8tae1SuTyT3dwLMptb21xG0XM
	8zi4ckqSUnD9cXPOKlp9Lc2E01k/kwpG3exbKXCUMgomvG10wu9xuTIAQQDhYV/WwK6KBLwePaD
	6S2W7B5cAOB2BGM8nxS8PG+bEFY/vMdiHL/you03E9ygvwL8VOEn2U5zOXlfsPDLRAn4Qm8tl9X
	0B5CU3rUpzeBcTsHH
X-Google-Smtp-Source: AGHT+IH4VnwQA0G2EjuoChB3GFw2EN00/9sNtBiR6r7qJ1qzu/LcPcmBTKtOPPgOwsnIXhXKwnF/jA==
X-Received: by 2002:a05:600c:524a:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-440ab845dfemr33087695e9.26.1745739849570;
        Sun, 27 Apr 2025 00:44:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/8] ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
Date: Sun, 27 Apr 2025 09:43:20 +0200
Message-ID: <20250427074404.3278732-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow expanding possible configurations for the same peripheral,
consistent with the scheme adopted in Linux.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi  | 8 ++++----
 arch/arm/boot/dts/st/stm32h743i-disco.dts  | 2 +-
 arch/arm/boot/dts/st/stm32h743i-eval.dts   | 2 +-
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
index 7f1d234e1024..ad00c1080a96 100644
--- a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
@@ -198,7 +198,7 @@ pins2 {
 		};
 	};
 
-	uart4_pins: uart4-0 {
+	uart4_pins_a: uart4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('A', 0, AF8)>; /* UART4_TX */
 			bias-disable;
@@ -211,7 +211,7 @@ pins2 {
 		};
 	};
 
-	usart1_pins: usart1-0 {
+	usart1_pins_a: usart1-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
 			bias-disable;
@@ -224,7 +224,7 @@ pins2 {
 		};
 	};
 
-	usart2_pins: usart2-0 {
+	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
 			bias-disable;
@@ -237,7 +237,7 @@ pins2 {
 		};
 	};
 
-	usart3_pins: usart3-0 {
+	usart3_pins_a: usart3-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
 				 <STM32_PINMUX('D', 12, AF7)>; /* USART3_RTS_DE */
diff --git a/arch/arm/boot/dts/st/stm32h743i-disco.dts b/arch/arm/boot/dts/st/stm32h743i-disco.dts
index 2b452883a708..8451a54a9a08 100644
--- a/arch/arm/boot/dts/st/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-disco.dts
@@ -105,7 +105,7 @@ &sdmmc1 {
 };
 
 &usart2 {
-	pinctrl-0 = <&usart2_pins>;
+	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32h743i-eval.dts b/arch/arm/boot/dts/st/stm32h743i-eval.dts
index 5c5d8059bdc7..4b0ced27b80e 100644
--- a/arch/arm/boot/dts/st/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-eval.dts
@@ -145,7 +145,7 @@ &sdmmc1 {
 };
 
 &usart1 {
-	pinctrl-0 = <&usart1_pins>;
+	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
index 44c307f8b09c..00d195d52a45 100644
--- a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
@@ -197,14 +197,14 @@ partition@0 {
 };
 
 &usart2 {
-	pinctrl-0 = <&usart2_pins>;
+	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
 	status = "disabled";
 };
 
 &usart3 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&usart3_pins>;
+	pinctrl-0 = <&usart3_pins_a>;
 	dmas = <&dmamux1 45 0x400 0x05>,
 	       <&dmamux1 46 0x400 0x05>;
 	dma-names = "rx", "tx";
@@ -221,7 +221,7 @@ bluetooth {
 };
 
 &uart4 {
-	pinctrl-0 = <&uart4_pins>;
+	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.43.0

