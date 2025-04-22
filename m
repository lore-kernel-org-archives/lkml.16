Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD7277816
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319865; cv=none; b=aETNKhbJV4i7YB+0dGXSs5nWtfblVljhBQE+N9TKT1evM00zudmxUg1L21EiONTFLcbQKMl+PPLS9h9wLsoEaKeSRV5QY2+Vo/vgWNx1kGOlg8JiydHWhrrRQ1Hzdnff9cqZe0uKOe/ENWwbAftyA1sv/1uxcWjbJfk4kH8y8kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319865; c=relaxed/simple;
	bh=khrIOuPNydaoE0R69LRaxeUdmtv0GT+QtuOLskCJVgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnY+ka8In9E3AAFudi45B9IkG3SPBE8f+1DaFG5KSP2UBiGhlPV4A/N2z1Juy/jxvGjTY731t1QaMXoiSKzISlqbiPpVzOG2S7gBwSQpDG1XLuUUeRkl7w/p+oEM+tSNA48TJN0vqe849tjaVb5xkJGsCqHqi6ioCOKEAiPlMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9dzKfqm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9dzKfqm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so37178275e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745319861; x=1745924661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ci38G1RmPeuAoUiNuhDTBFPaBQP/k30oBtFbdnT3L54=;
        b=p9dzKfqmx7Eux9glMhReTxMCtnPQN4hKKGTPMg5dHsN0ZpERmTj3k/0+qjnAh8PN5B
         /Cgm1dAMOK40RETNMH3GY5a3tgj49Hid0NAAdB4VLbSKS+0ux19jhGFkXEOJ7IMPKBwN
         rTj6Nte3dg6wZn4XVFe7/lHl5Zkq8b2sSSfTRYu5q11i0Z9iyL1SRxTSykrnnRrVw3up
         JaI0t9D78dQQ3nizhLA25BcJ+MugbKLLxpsMh/mc+XcMX5WrN5d5Z9nrhw8B0H61objR
         CtRB1K/IBeNKXIiYcxh9KkmexIEb6jhKW2Ghdq2XJ+OYBkNhZdEIBKEYYih4DTpLOAtf
         Pa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319861; x=1745924661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ci38G1RmPeuAoUiNuhDTBFPaBQP/k30oBtFbdnT3L54=;
        b=o+JCh+0N6/JKCQciqXpZTHUTMElWIwxx/9AxhrqfM5L/AggQdk3400acempJ98jZDy
         F+qq36FpVdnrioHSR/WF39efe03f1OLwIPnApnda959wT96W6+f3FYeuLDnzT2tIyWPi
         PmZpZlQBsn+WNUzVnpypCP+u8SJQ4GvKPLLlWejhslaKVX0M99y44WtYGQM1O8swDb12
         ZteyvY4roRzFcllmgaXO1s0ME2aC1ES1hakkDJlNiy3L7jZ5I+yisB3ouzoQmFSG+RZH
         WEKDWMEB7uv28fRNAgI2vLi+ljYTEYmPE+iTIZJBwfhytlTIluQb1GC1Xij0HQvuuIIK
         mXkA==
X-Forwarded-Encrypted: i=1; AJvYcCWOJoc6tQWIhVz1s05I6XM20ir+7nOdQ9a93Y0yGotTrECELw96mCJL/8m2EHOo80yJc0SBQbJzFwv7290=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLvVuv1hIIBakpf//5rmfU8Nu9BoSg3pM+Z5XzlISKIjultqX
	99DVbB+TYItmDkAvFeXfXDX6W2IEA+ujbEMm6caYDsm9/NnTeFH9Sze5KG8zen8=
X-Gm-Gg: ASbGncs5X0pOqraI2fedPPasTK7GAKwT/RCWEazLmfou4qZU+fYlGKnPtmb7yO3f1uT
	f25o7Goy8ahxwBStVvPGBtuukHb74mMF7dQAE5SyXebQu1BW4bE7OxdXebGEBrwDLTCtpfw/Zzo
	P7+7+Za0DQC248U9LOimwSZ8xl0VFzY4JlrCv9W2Zlf1Vw+PBxpQh+Dcb+0oWWDT/XkpMHR9/Cu
	gjD7Q+GRABP6UlLmc/a11oe1JbufiQo96Jm3Rs40InJUiiUm9S9Xws6zwSTSO4AAPkQ9AlE7UN/
	iNEaMWDQG0Gb/MPTzeRUFH3eTh4ziJb9ObT9lD4sqN519raolRtTrG/lbA1W/w7rDg==
X-Google-Smtp-Source: AGHT+IGckcdlnWQqBL6qiNxjnkHkWJyUfuh1CJ+EyBVjThrN7w/33qBUkDxftZXEgQa6I55NFkVdlQ==
X-Received: by 2002:a05:600c:384f:b0:440:59eb:bfc with SMTP id 5b1f17b1804b1-4406abf94bamr115861735e9.23.1745319861045;
        Tue, 22 Apr 2025 04:04:21 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8847:e39a:2a2f:e614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acddfsm169609725e9.15.2025.04.22.04.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:04:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 22 Apr 2025 13:03:53 +0200
Subject: [PATCH v2 6/6] arm64: dts: qcom: msm8939: Drop generic UART
 pinctrl templates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-msm8916-console-pinctrl-v2-6-f345b7a53c91@linaro.org>
References: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
In-Reply-To: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.2

Remove the generic UART pinctrl templates from msm8939.dtsi and copy the
definition for the custom UART use cases into the board DT files. This
makes it clear that the set of pins/pull etc are specific to the board and
UART use case.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8039-t2.dts | 22 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/msm8939.dtsi   | 23 +----------------------
 2 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
index 4aa0ad19bc0f7fde6f5f3a93cdb6be19fb4f1f65..38c281f0fe65ccfc49de70eaef2a970323ecebc8 100644
--- a/arch/arm64/boot/dts/qcom/apq8039-t2.dts
+++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
@@ -122,14 +122,6 @@ &blsp_uart1 {
 	status = "okay";
 };
 
-&blsp_uart1_default {
-	pins = "gpio0", "gpio1";
-};
-
-&blsp_uart1_sleep {
-	pins = "gpio0", "gpio1";
-};
-
 &blsp_uart2 {
 	pinctrl-0 = <&blsp_uart2_console_default>;
 	pinctrl-1 = <&blsp_uart2_console_sleep>;
@@ -329,6 +321,20 @@ &tlmm {
 		"USBC_GPIO7_1V8",	/* GPIO_120 */
 		"NC";
 
+	blsp_uart1_default: blsp-uart1-default-state {
+		pins = "gpio0", "gpio1";
+		function = "blsp_uart1";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	blsp_uart1_sleep: blsp-uart1-sleep-state {
+		pins = "gpio0", "gpio1";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	pinctrl_backlight: backlight-state {
 		pins = "gpio98";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 52a99aea210e04f04f3d25696ecd6b9c604c743a..68b92fdb996c26e7a1aadedf0f52e1afca85c4ab 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -905,20 +905,6 @@ blsp_spi6_sleep: blsp-spi6-sleep-state {
 				bias-pull-down;
 			};
 
-			blsp_uart1_default: blsp-uart1-default-state {
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
@@ -944,13 +930,6 @@ blsp_uart1_console_sleep: blsp-uart1-console-sleep-state {
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
@@ -969,7 +948,7 @@ rx-pins {
 				};
 			};
 
-			blsp_uart2_sleep: blsp_uart2_console_sleep: blsp-uart2-sleep-state {
+			blsp_uart2_console_sleep: blsp-uart2-console-sleep-state {
 				pins = "gpio4", "gpio5";
 				function = "gpio";
 				drive-strength = <2>;

-- 
2.47.2

