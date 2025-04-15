Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A4778F4B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725208; cv=none; b=REUHTxP9Ct+/94WROZbY4cVG9TnCOovj3w/aF7iqZvM8HVM5gNInsn2s2yh7x4mXeMb2jI5m1U3Vi2j8v4CTvgr2LDpn+eV5Ws5AeE3WM4/rloQWEOUqQMyqRncqHx1urFLGDi0gGLXMedFeFV49+AGk2d7Gf5rkdQ+ETZMWeco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725208; c=relaxed/simple;
	bh=ZIi3kcYiMso2WJn9cew3pYXvwn9ZXc1TLzpsXS99dGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qR0QzPAfUKed0EFQ005bNKKLiMrNyzUTUKCvKIhsWGhRCRM7j+lqxRUevnQLeeyHMxNQ5w+lGArcZDQrh7zVdE5FfxPQF4e9hl7FZSp3VwPPramo/xDHNJGcMzML15jqjHZ10i7jxKKp0P+6kv4tmLMn79GkTBeMMdAFZ60j2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v9jvvfyW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v9jvvfyW"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso8929648a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725204; x=1745330004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MYD5mLPfBJwtdhmSlhM/n7g0njzNNoiH91RzZwtKY0=;
        b=v9jvvfyWu6G0l2ckXMU/H8V5aLqKncBMZafm55nGih2VSuAFGtgZhrftroS/wqo3L0
         s5GcHpWYI3eshVYJsVddUJDw6XHWb5FT1k3i8mZoMi2mIMzV0a2V6HbDf31T1VbMsuJc
         leiIdD9BuMaQBPrSXvPGVa+a6375hLPHrSXRTcmhHvCJoV7tp4B0IqRyxv9M+f5LE45L
         8US1JaProNJM9M+SqGViI5YObyONRr9fDJxAueb3GJXYQDA0k0JKlCBxz/E/rTKnMoF0
         dMv1gxVSGEi9ooqHcXlydc3B0MQvIOAOt7WzO75qo5rT8XKAhnYC3ozCvWSYrIsOwiBf
         /yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725204; x=1745330004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MYD5mLPfBJwtdhmSlhM/n7g0njzNNoiH91RzZwtKY0=;
        b=KJS4WsCHut1xgZAGu1fm3h7GCydrJOV12llvJNxTNxvkT4UeTI0B1EoBsfw1Ln3k4+
         aC3ESubDieSO0M2J1j0euoRHwTXWED5Q8bjnge/9vqQs4j9H/mPw/uCCyKnJl++Xi58s
         6Xe6yEOELqbvRAqtHsxHPcpJJcn2CPP3Fx7H64Tk2Ym9gaw8W/c54XDut7Q7kS1L1Daz
         DVmLIbNFiCT8BFh49YHHKUkTwgzO+bhqj/w89K+bfdnsWbxorlIftvxPh0XnpjLS1wJx
         z6PvMknmeFPP+uZGibkDHxJgKXv3+3LdayIQmIlX/rYHTjzP45t3WjGRz3Tl1ZpxCnoA
         CRLg==
X-Forwarded-Encrypted: i=1; AJvYcCWyzISGZHY4Fl330h+mEdzbKD3rStct1sB27NTN1q6/BqzBGYWXqZ19xZ34tdc4RBe0jJPGlsreSjAZpX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz22XUASCwly3xFOqKkRB+eIvBAV5VTEoa/Rk91DuFNWJbJFaAh
	7aP8syB0SIXXw+155W7KAPvnPWj4o8rm6+W4ZjayPA/XxS5+JckPsy2hGaM+4l4=
X-Gm-Gg: ASbGncuV2HI0Euklh11KceAQfFDgZ9QhMIhgMtKUmICmAoIMyCps0Hha+oTlbQXatpN
	lRYEDE+kmJhnQ9B/RvdjKv0esfAxK6N/mZLCAdfiVYIrvSl8eCinsY77KZQX9TUIL2he/AXikLK
	K38JICMsOHElZBd61kUU273SChAFt4BKjTEzOPOnLejVELUktdlex54/UrB1kuJOrXIDrGQrbtH
	VkxQMgr3kUdFqKCa+LwuxbJ/r94iY0lnkubo1QZNpy3v/aswZynGTgyeqK0JUtqjz29xK+KMT3Y
	u0LTCNYZyqASi8Q3Y1yzTesMX1+Vlbi++W6YpTYK3K6ZDte8O4fZF7s=
X-Google-Smtp-Source: AGHT+IEVRudoi2scqh4XMCLq7eGU/gtugjegdf6OGs4JINDcEGAAHxM95AejGZDsKYMpE+VTCck6EQ==
X-Received: by 2002:a17:907:3d4d:b0:ac3:8626:615 with SMTP id a640c23a62f3a-acad36d62camr1778426566b.49.1744725204133;
        Tue, 15 Apr 2025 06:53:24 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:50 +0200
Subject: [PATCH 7/8] arm64: dts: qcom: apq8039-t2: Move customized pinctrl
 to board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-7-a1d33ea994b9@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2

Prepare for removing the generic UART pinctrl templates from msm8939.dtsi
by copying the definition for the 4 pin UART1 instance into apq8039-t2.dts
and apply the override to limit it to 2 pins. Having it defined separately
in the board DT file makes it clear that the set of pins/pull etc are
specific to the board and UART use case.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8039-t2.dts | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

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

-- 
2.47.2

