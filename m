Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487D61DDA32
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725207; cv=none; b=FwwNDFlnbv2nqww3zAc/Ug9VhwOc8sLtx0RNIMojcVKmxdBw4nS5izmDfRnpkbzmyGJp9zeXEDoBfH8bcCyjpBCz/bLgW26CffIOC6gY1k0H8XhKv6SyAEPIs8ghXTG9rlc54jsj2XiZQHRo7rZXnJMTxjvVN1dJyxr1nDS8UCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725207; c=relaxed/simple;
	bh=2KwIlvvGECXFrETJCT6z2gk+hxmBfBaHfHMjOZSbJew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SMgiDj2XsLwl6E286TK0HEEd2Uy+Uklg+urssxhLeEUJOpXEszujqqR2tzDqPfhubd6LCRyM0a7rGG0TqozxhE9fixapsQrdWz2nkNsRvmqg+oKBlrWA3DklenyDAbQBazKxrk1uM1zJRV/wLn09rsk0O/It4F8SB0ImnN/JZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ow4Iftyv; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ow4Iftyv"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acacb8743a7so835991166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725203; x=1745330003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzromOuf9zzJyEBnUnC0UIApSp7seWmK6Swkwn2TE30=;
        b=ow4IftyvpsLLhLr7EM9k4WQnLD38TPJD0GMXoSHK6tEddkfqBDwasXqc6AcA9DY/aE
         sXuplFWIQTB6wA0Tbe+ApnedhZ9exwiKI0vG25lMDi7PWkHUzF3eGaAs3DfAGK8cIZ3n
         mwuCzDyerdEXCBpMuz8oOX96UyuJxMSWgRhoLvkHgPl5Xbqei7xe1zQufImgGQV06WRX
         A6cByR6fPOeb94Z02/R7bXPL3o5X+yqgebCQEWyuz9eTA50xLm8Z/4gzMWwbmeS6lp0L
         PbjuzsmOi+gn8czrdGoZLU94jc+hU1jaAYpqyM17E1i8X6k4K007dMv3zqwUyZHu81j1
         tdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725203; x=1745330003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzromOuf9zzJyEBnUnC0UIApSp7seWmK6Swkwn2TE30=;
        b=EOniKK0XgXY6t8KK2HxEjxMbcW2sGDwZzDpwOwNNCq+KFgtx6wZzroBBCSEBwtHFv5
         qN0/VmFvY02jeyDq09DR7H8kQrrCi3YilytI9tKV4DfQoJHKr/PIkuH/zL6WSyAi5jP4
         i0YwSRhx5u3dCueRCadETtvHgJq8XSdMpqZXasnGrgtPPnL0WnqnHgQB+jlHdKTwPkzC
         9uCETlGP/Jqsh5pGfN/7PfgSOur7jFuQMajLFIDgOv8+9HYk0FJggGEUsH8G0V61kLaq
         w9/tWPYO876ZJJDS/zI8S1keWZYfKL1kcuhBTMHm1zRq7kkkumwYwT/cLMD3B6rFCOf0
         XbbA==
X-Forwarded-Encrypted: i=1; AJvYcCVWOk4OQoQQMdIHemGieu2zowTaWHEKjBaN7bGXYtDvBt2webJLxuHEXuMp0jK3kn/EfrvxTfk0nfGrq08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+z4oueiukQvqCdHs24ro2pT7hwo/sGxmXm/+efivPcb+bvHKc
	UtFSJOhiWrNNYWu3+MXfkbQ+ASuVMEkYgDixq4o7jwtCT4dZlthlflfn9WPIbPs=
X-Gm-Gg: ASbGncsqc3es9ut67AjqoZH+PcAZogCDfbC0X9fnDsN7MNUHXx+lJmswMGKBm5wWF8i
	2/qUbbuwLdiGleH96kDtG++uiVm4K0/byvHHL1Za0DyQbUUXIRwTc0aJ8K2BknsOhtjbYC+6q1S
	d3PQkWyzRnI+iDYd7M13LLG5F5ugC5s3ZQc7Z12gW2RUdS9CMNjAsr1TST/6r4KtnrZisKs5zMn
	1D3DCkufv2AEtE+f3fJOJrGGbPeH0QGHtkmXQt1830J6v6DfOWU17nwFHEZJ4J5ZePImLRXbQ6z
	St2Go40WptZykW5wr97HA5NjpVCvGdy8xLItVrts7MXKoPn0rp85VIQ=
X-Google-Smtp-Source: AGHT+IFwlxOkxM+FSTXk89qNtD3AqxVqNDqmG63ewdt7FIeooDU3A2bPFLmNB60nWDT25K0clFz4aQ==
X-Received: by 2002:a17:907:d15:b0:aca:d48c:916 with SMTP id a640c23a62f3a-acb166d6d5fmr282910266b.9.1744725203245;
        Tue, 15 Apr 2025 06:53:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:49 +0200
Subject: [PATCH 6/8] arm64: dts: qcom: apq8016-schneider-hmibsc: Move UART
 pinctrl to board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-6-a1d33ea994b9@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2

Prepare for removing the generic UART pinctrl templates from msm8916.dtsi
by copying the definition for the 4 pin UART1 and 2 pin UART2 instance into
apq8016-schneider-hmibsc.dts. Having it defined separately in the board DT
file makes it clear that the set of pins/pull etc are specific to the board
and UART use case.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../boot/dts/qcom/apq8016-schneider-hmibsc.dts     | 35 +++++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

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

-- 
2.47.2

