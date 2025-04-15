Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C2E1F4635
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725209; cv=none; b=XmH13GfzXi2goLSYALXhQFcmJxuY4DDgwUNYsQIz3dlvAzRI+DTf/Id/uyGYguTf1Qpol9qBikMKGqEt9M50nwDNCJTXdmfkHWP1BMOC0xHMybyqZpFnxlKq+3hfE881GC+uCrRLlQAFtQpkt1zUg453tFg4Ej6TEIx6+TxV0cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725209; c=relaxed/simple;
	bh=vHHaCmn/9aX14sPYqzMHTDqRNgtEpmUR2XVR9kxw4us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0t/H4f7Fpg9P85b+IHY3D0p7hwn6iB6RCXp3ihqPDvwrMFEyA2zCOYoJdeXpWrNkoOjqM+eAGrb/TYYg7lGxYAe1ammi6Hk17TEKOPnwLvttpW86cplhC/Z0E+15wzPGMuzAkDoUe0FLh0uMF0+czzWqjI1O4211o3pDQIJRIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMZ3lR7U; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMZ3lR7U"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac29fd22163so890349866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725205; x=1745330005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4l6FA9ivn6gypUQ5rfKT4sB7wf6dagDvJ3RDh2XcgA=;
        b=LMZ3lR7UIsJ9tfCDq+sA6fcKM2jFaPcqVG015fmPGAT5WMYmxD2nnLkHWN5wvnMLO7
         p5tV7ZsTsgr8HT8/m+ENLr5zCrsQ8ULfFKj+zFRDm6ZF80B0ybYzDK7eIIKPhnBbe/cC
         AlTl5xWFZ1KfKwHDPIRk84RiPzFGrWQE92G1uY0/GovRkbUaec0o0sV1cNNvJTNSMY1t
         w6mSoU18P9o9RxbTaPB3muXBJDhFJh9Hu6LSDImktT9q2iibYw/AXbw2FcaQosp5EpGf
         /0zw64yU6XXaxVXB/8Wg+oAvEGq4ikU8BELQUg5y3Q05p/xBmef2bG4Ji0WYfIikLDzE
         a4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725205; x=1745330005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4l6FA9ivn6gypUQ5rfKT4sB7wf6dagDvJ3RDh2XcgA=;
        b=bYCmukJSW0WvZR1CTZmrzkouyT+AaFhmXeSKMDjWdMVdSQIRd/yDSVYGxJOV5VTQ2W
         41l3ZCyH2DvEDZGXPLCivITmWB18MqDc1lG6upLFTg+aAcAiiFHLbK7Ubg/j9++dACvw
         4K1ceNA7J49aEfeGL6LbcNkUZD+XYWcW8FCNpF6csABVLU2EWjzUyQBDFSMUFQumeUIa
         QrUptuS5jDqxLTpuoOq8uXNtBHd3qFo0hzbyqa4wymUCPaO3JWx3sybtxt4EPn+nzXab
         Ehpv7DSwSG6yQP5AN+Nf5DZjmi5V1LH5wHTDYhcmzRhEsoiQiOwy5H9lZOTz07EBteY5
         k0/w==
X-Forwarded-Encrypted: i=1; AJvYcCWRwyaukhc4GaTLQNuS6uKZEuYLc/bQ9wfN0KRQOnayG+9Lw13/Bt7hwr7/UrFQ7KXZjhgMy0PBtWcnDdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaT1/KWdNUZmR2I065HP7iAiz83ldw1pD0Jsr975Q3xk0vZLrf
	Im5ptmCzR+YWLpFqzxoZxWqYC+uteRtAGlZbEAJn51MzI7vXR/GwFm7xkXbOrN0=
X-Gm-Gg: ASbGncufqn9po7ARhmD6vibnfk+HXK+rGbWmu1Fx6C5VAlLwRS9utiYwIQOtyRnuKjc
	m/larT0+zn5XMj7ohbW3lXCjzDP/gJNPUhNJz6V05eYtG+mfa+nZIpUUbzZmqKOjgVvHPN2cedN
	s7DgF7M7bMc+Ikbzgp9WnIsiuixW2mvmNkrx6Z+X/Gzd7DIZ7QUi13xHg8EUgSjpKwqJ80eRRHg
	uyGmEPiBQ2TSTJaXxqCQ/BuE6RJrZlwQrsMjSM/Ah++jg3JMTOm0YZVG/ihmVXfSd7e8j820f5p
	yfEoQdwmQM4LFk86skjSWOh4HKiKFrB5l1NA7q8l0F1YS/y7+xngc0I=
X-Google-Smtp-Source: AGHT+IGLoagUswLH/ZZJxI5K2dTSGE3DxsOQWCM3VHaHo3ThpnYQbzNk4zQXdqBSRKUbftY/ghk2xw==
X-Received: by 2002:a17:906:db06:b0:ac6:ecd8:a235 with SMTP id a640c23a62f3a-acad34c1a5bmr1656932066b.28.1744725205043;
        Tue, 15 Apr 2025 06:53:25 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:24 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:51 +0200
Subject: [PATCH 8/8] arm64: dts: qcom: msm8916/39: Drop generic UART
 pinctrl templates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-8-a1d33ea994b9@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2

Now that all boards use either the customized console UART pinctrl
templates or define the UART pinctrl directly in the board DT file,
drop the old inconsistent generic pinctrl templates to reduce potential
confusion.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 24 +-----------------------
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +----------------------
 2 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9f1796222c597afd45dd31131b198f3574e97885..4175abc20fa7d26180ea4c69a0e1972222261354 100644
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
@@ -1271,13 +1256,6 @@ blsp_uart1_console_sleep: blsp-uart1-console-sleep-state {
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
@@ -1295,7 +1273,7 @@ rx-pins {
 				};
 			};
 
-			blsp_uart2_sleep: blsp_uart2_console_sleep: blsp-uart2-sleep-state {
+			blsp_uart2_console_sleep: blsp-uart2-console-sleep-state {
 				pins = "gpio4", "gpio5";
 				function = "gpio";
 				drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 16c16ec0f4560a7102f8ffef20c58fbec81dee38..3ee61acc0f96aaf79a182d21920b3664a0daa5fc 100644
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
@@ -943,13 +929,6 @@ blsp_uart1_console_sleep: blsp-uart1-console-sleep-state {
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
@@ -967,7 +946,7 @@ rx-pins {
 				};
 			};
 
-			blsp_uart2_sleep: blsp_uart2_console_sleep: blsp-uart2-sleep-state {
+			blsp_uart2_console_sleep: blsp-uart2-console-sleep-state {
 				pins = "gpio4", "gpio5";
 				function = "gpio";
 				drive-strength = <2>;

-- 
2.47.2

