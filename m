Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C12277021
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319864; cv=none; b=XMf8gVvLulxbwT7nBgO9Wpnp1pZblQd86lhDLHWNJ4kei+pNnBbVMJYTwPEJnNUH0mvhGI5Rgbm3pUGxMdPV94TcetZgx5AQ3nktHW1KyFlhPdzCIo3+U79T5M466phUt4h3e0+TZoWGAr0PvMO2nRL4JSXo0rFsP8tJPtkm4sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319864; c=relaxed/simple;
	bh=5kbIp82RPAZiz/xlTwKFHo0uGiODTBWvbN8fRxPfuhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ch+gLIvWPe22vapT46GLihbaoXbrNE/cvuvcmDsk2paIygebMwEfX9vg/L/PM9eKLAUvQt+qIBo1DoIatU4sjuubdbzMWIy+ZF3n55LWFT73sXPalsCStOl+E6nTjPBsnlM8TJtrarxbt2tR5F2oDCCsXNBn69zEXmOtrHE0qCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bfFaIEuT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bfFaIEuT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3418178f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745319860; x=1745924660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hH4RIXXguM7lHrs/AeYp8nicZoPIjvYCmKUcwhiq8VI=;
        b=bfFaIEuT+XzJdQmqfthCTG/mcVsUzVhAz9IeT5n1B4oZFT2ij4r0wwRfDIC7qVrzNC
         hEPnxT6dC1PTD6ONPFLZMc6xLbOOX+xZw147FhIFc4HnhYX1wclMys0FRXm9WsAKjXm4
         0qkr+NNp6FC3KwFVbC0O66ur4/AiG1fuxb5v4uN4UFnlnACDC2I33NSUHfj11a2Gght6
         R+TD96w5m3DGU6sdX8MeveVUvWc0mSx3F3Oy6dCt5CGcNbvdQABqfKQRR4/hX3xlYFOM
         +EpuGHoJZVAAhlLms3pb71Q5RpFAXGJPv5ff5rbSLVlxsNZftk3/FHn39q0r+fC5rSfW
         5njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319860; x=1745924660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hH4RIXXguM7lHrs/AeYp8nicZoPIjvYCmKUcwhiq8VI=;
        b=h4Dw2LV4kaZcWjnE8ahbCCPTzOGoMF1Xe9u46Y2119VTennp6VnyXLzAMzyc+7s5v8
         MCKTDH61ES3i+423P/QlPRh3/V3vZ7N5yQxX8Kg167nya7/xuN/VTfhSOyRp+BrAv4Oj
         wopYCrcrtwd26ewYrwObW0vxDSmUYYKNFXJwE1Cm5095JHkbgXxrPQrteDnVx8sBn897
         TDvc4Tqqi2H6iEzWGnS12nC2e2VEAMRlhlk1jK2bztbIV/gysCO50jVHxnurSfbS9IIh
         heAlU/NJnvpS/nIKy0XAcUtO3d7uuohe0FyuvhRhfdAqyFlEieWs1wAciM80T38jxAo0
         tMZw==
X-Forwarded-Encrypted: i=1; AJvYcCUmqSf411/NAhPhXNdRDef6enUyme2EZjgoowN+y9JgvI3UEVX+gw+hCFFDBV1IF+35yqNhYLCqUSdlDc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkHuczkdY9weTShU/167zSms87KPm34IeeeGrqRv0YKyNMAGJI
	uCWUvSlGsfVmRgTPP+be7pA+sro9mdoxoy455ZeV85pqZHJQ2BBdMUqV4HsdR6Y=
X-Gm-Gg: ASbGncsQZyq5g1iU59Qa+JIGRoeR+9Tjt2wGYkzTy5MZh589C8GXFqSYJxGKQ/e2can
	5mseWVoE9n294ITiN5xR+WCDiCOR5Yf1CtTWaeRAzpXD5OPVlL/NtmWuzENB1G3pS/QPwJ8VOI3
	HNLnS++L8AfgsbB3BSW922yxz6dJammsvQGcjtg6gP5w+bcNJ/jDQo50YYc9QkeesenhQRmkr2i
	+Jl5/7fNfru3V4gQuiXZeplMXhAvBUujf1Y6yWY1HSPBhJhjtpBwdLWhf7rld/PsB4AoD2sm8zU
	JY1WMLmMd7L9SuH+IT7SwmSJ6YlV+G3bgr3tdCnlkVDFodTjFPVM4ss=
X-Google-Smtp-Source: AGHT+IFrhUEdiZQd68uZIJyQ5IJiCEtaO9t1bpG+0s26gO28q3G/g9OGy1Vj8lzjp2xNhaJdoZTwsA==
X-Received: by 2002:a5d:5f49:0:b0:39e:cbe3:881 with SMTP id ffacd0b85a97d-39efba246e0mr11245366f8f.12.1745319860102;
        Tue, 22 Apr 2025 04:04:20 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8847:e39a:2a2f:e614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acddfsm169609725e9.15.2025.04.22.04.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:04:19 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 22 Apr 2025 13:03:52 +0200
Subject: [PATCH v2 5/6] arm64: dts: qcom: msm8916: Drop generic UART
 pinctrl templates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-msm8916-console-pinctrl-v2-5-f345b7a53c91@linaro.org>
References: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
In-Reply-To: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.2

Remove the generic UART pinctrl templates from msm8916.dtsi and copy the
definition for the custom UART use cases into the board DT files. This
makes it clear that the set of pins/pull etc are specific to the board and
UART use case.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           | 15 ++++++++++
 .../boot/dts/qcom/apq8016-schneider-hmibsc.dts     | 35 +++++++++++++++++++---
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 24 +--------------
 3 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index f12a5e2b1e8c2cce6e85b8444c97a7e0d7b7c58f..b0c594c5f236c9c1d334e6acfcaa7e41c1f9f3a5 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -597,6 +597,21 @@ &tlmm {
 		"USR_LED_2_CTRL", /* GPIO 120 */
 		"SB_HS_ID";
 
+	blsp_uart1_default: blsp-uart1-default-state {
+		/* TX, RX, CTS_N, RTS_N */
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "blsp_uart1";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	blsp_uart1_sleep: blsp-uart1-sleep-state {
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_cd_default: sdc2-cd-default-state {
 		pins = "gpio38";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
index 7a03893530c7b89705f5544491c14edd7120acdc..ce75046ffdac48a206d14499bc711f8f4a777fe5 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
@@ -373,6 +373,37 @@ adv7533_switch_suspend: adv7533-switch-suspend-state {
 		bias-disable;
 	};
 
+	blsp_uart1_default: blsp-uart1-default-state {
+		/* TX, RX, CTS_N, RTS_N */
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "blsp_uart1";
+		drive-strength = <16>;
+		bias-disable;
+		bootph-all;
+	};
+
+	blsp_uart1_sleep: blsp-uart1-sleep-state {
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	blsp_uart2_default: blsp-uart2-default-state {
+		/* TX, RX */
+		pins = "gpio4", "gpio5";
+		function = "blsp_uart2";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	blsp_uart2_sleep: blsp-uart2-sleep-state {
+		pins = "gpio4", "gpio5";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	msm_key_volp_n_default: msm-key-volp-n-default-state {
 		pins = "gpio107";
 		function = "gpio";
@@ -469,10 +500,6 @@ &blsp_i2c6_default {
 	drive-strength = <16>;
 };
 
-&blsp_uart1_default {
-	bootph-all;
-};
-
 /* Enable CoreSight */
 &cti0 { status = "okay"; };
 &cti1 { status = "okay"; };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 07ae0b921afa1fec7350467cf1b299fe91112a60..de9fdc0dfc5f9b223ee252b80fc18d45c9bb6582 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1232,21 +1232,6 @@ blsp_spi6_sleep: blsp-spi6-sleep-state {
 				bias-pull-down;
 			};
 
-			blsp_uart1_default: blsp-uart1-default-state {
-				/* TX, RX, CTS_N, RTS_N */
-				pins = "gpio0", "gpio1", "gpio2", "gpio3";
-				function = "blsp_uart1";
-				drive-strength = <16>;
-				bias-disable;
-			};
-
-			blsp_uart1_sleep: blsp-uart1-sleep-state {
-				pins = "gpio0", "gpio1", "gpio2", "gpio3";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
 			blsp_uart1_console_default: blsp-uart1-console-default-state {
 				tx-pins {
 					pins = "gpio0";
@@ -1272,13 +1257,6 @@ blsp_uart1_console_sleep: blsp-uart1-console-sleep-state {
 				bias-pull-down;
 			};
 
-			blsp_uart2_default: blsp-uart2-default-state {
-				pins = "gpio4", "gpio5";
-				function = "blsp_uart2";
-				drive-strength = <16>;
-				bias-disable;
-			};
-
 			blsp_uart2_console_default: blsp-uart2-console-default-state {
 				tx-pins {
 					pins = "gpio4";
@@ -1297,7 +1275,7 @@ rx-pins {
 				};
 			};
 
-			blsp_uart2_sleep: blsp_uart2_console_sleep: blsp-uart2-sleep-state {
+			blsp_uart2_console_sleep: blsp-uart2-console-sleep-state {
 				pins = "gpio4", "gpio5";
 				function = "gpio";
 				drive-strength = <2>;

-- 
2.47.2

