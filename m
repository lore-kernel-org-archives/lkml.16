Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A21C5D4C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725206; cv=none; b=jtsRidizy2fuhmKTZUebpWmaG1MkIhTIMU1RqrJdLGI4zKHZm/WPL7hIYlI+R5kN9NevhXnIarfgJ26dC5aZYyvbacOkOhfvDSxquKp5yH1/s+ruajHXg+ksT/x0BQhyzoAVqSlSK7Bkji62Mn2LH11fZbhH9rlP5llpBn/+Uac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725206; c=relaxed/simple;
	bh=pasHWSU2nGmm0wTdGpnA+YTR6fwTfPInkJzIhRwnGrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8kVB8C7f98vfkMqvenHmX7I6L66Y69vIJuSdLcQ0WOdkU6SQf8fMSG/Q6ynw1KWiMx7lgbbrbtb7I8Ovz2V+dlLvp8mscXJo3rBEcapBSvXEfARSY5ffE+AeeO25mHnedv5p3lm8nhDEZjXT8a5JujPXmsiOhdyE8rYcOxdO8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXqnwST7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXqnwST7"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso962187566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725202; x=1745330002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pge4o9cHBqaAOg3mTeBAmeDqZJrFMUn1AiEvtXGp2iw=;
        b=OXqnwST7WFfDrifUexDB9Soe7hM9674ZD3EZbzJsHKIxHd1b3t8VkB7dzCB4mpAaba
         XkuiEUTS5Xto/qnjouI91TO2T1t9Xh566Yz13xWMg0/oR9nEkoipyRkzLQVDDoOK1Aba
         2ixY+FobFkHu/pSZmcavbcSs5lFJsp/Ao8clM8Yb4R58ujFwSrr20M0WxPNvuRx8JfhQ
         DAeOJFcM7vyODG6kP08l+fwS0RRQBUtwp6mVabwmNvDGD5k73JKb+Bc1kfkfXQP3ifqf
         hFtOIQD3LgQpdvAv8DppiAnF1taoSzIk/GfbVOBR89ZGX6+twoYMywX8McdC4A1MErlD
         Kgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725202; x=1745330002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pge4o9cHBqaAOg3mTeBAmeDqZJrFMUn1AiEvtXGp2iw=;
        b=sVcwJVYscV8Wp2Gx0Vs/sG1yVqFLCEZr1h9EOlZTLiunJdTc+5Z+BjUjIuqvE5bJKX
         rJidngRlAiRz7QRZhHD4eFMdSk1RhtEuKelmVwBRDXjmigXB/u+iQBbJfc5TkY+cvL3b
         gIMhf8vllLPlz1GySbQzCBu6XBLi9pwzdau3mZA4Y8uWB1V/I05VuXEF5d7OUQtjITjf
         uLyF9VsMW3VWp4sDPjYOg1++JSh0J7l9yuXPBO9597QaR3Ed/eewdW7f15BeC2KVF6xk
         8MnufbEuOE1t6HFt2yo2VSE1q/HzG8xHc8d+pg8IAFfBB/358TdTzrIijZJe327QNSQL
         TV3A==
X-Forwarded-Encrypted: i=1; AJvYcCWrc5HN2NFcOMV2o5o3qcCX2MILJFdJSz9mltvArtqobc7SD51xdj9h7SlntTzijSoXE/E/dJMhjkTNQk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWs0E9tMFFgR1B7MTLqmn8ku5D3Wx3ZStYHI/HUJOryDhOviVN
	w8f3atMM7/vqPrZIE7vHQFU2u8UVnSTcd3/9FMhmnZsU8GwZh0RhVLh5/O3WC3Q=
X-Gm-Gg: ASbGnctIumUqR3KZn1V9vrhwde7yLoETwYm8kunhy2OT3Fqci9cE+7fcm5+MD+Ou5Ev
	eWS79L8h9kv0Iqq2i8RYPKRYaLRzPJmlT8CQSFKaoEpF2c01WU9dYIfPFxh/YkHq7o8JIxtjlqN
	+oUQQijo2sy1Plya4SJrWb5HWLPsM19Rxv9WrS+x9U/lNFHkuXmGi8zxg9Va1IW8xkcbHLzo3Cg
	9E1Mw9tiz8jZbmj7jWejLER3LLSa3+NFGAvxI7E9GMshOtHOHR9vS5RVkwNg/I0Qo5geC/zRf15
	xhiDIepJQzyBJ2Vc2pMh9DQtuNLuN7sMLLvXFgdaZIq39HtHhlD1siE=
X-Google-Smtp-Source: AGHT+IFzbpbH4GLJ5InXnSEyFRv0wczgq6f5oEy25Mu0yL/aDFPOfMB7Jlpd8NTCxr4BmMOv9fFWgw==
X-Received: by 2002:a17:907:8690:b0:ac3:446d:142 with SMTP id a640c23a62f3a-acad3445e2fmr1369567166b.2.1744725202370;
        Tue, 15 Apr 2025 06:53:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:48 +0200
Subject: [PATCH 5/8] arm64: dts: qcom: apq8016-sbc: Move non-console UART
 pinctrl to board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-5-a1d33ea994b9@linaro.org>
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
by copying the definition for the 4 pin UART1 instance into apq8016-sbc.dts
Having it defined separately in the board DT file makes it clear that the
set of pins/pull etc are specific to the board and UART use case.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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

-- 
2.47.2

