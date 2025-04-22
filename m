Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33380277035
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319863; cv=none; b=pWhxifGRa2bt/hDLzY/4B0mtBo1X67yv1lxOHA2bV3KxOrKUAspSyzZfj8KejB+pzfzZVAAtYqZraSAgiiEuQbLlLTchMr+dKwxGBPzw2kEbgeBu7jEN1m27xI/8+MsF4SomMXhWpmqgQ/ekucZenSRdo+y/AAay/LUUqnZ3d8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319863; c=relaxed/simple;
	bh=7OOpqHwAl6ZsroNDq7h1uadbYYWiGNX5+yXf9CWEZY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsqDnBDr2ImS+GZiciQr6nmFaCCqTtJ4ewmckPAz5+P/i6jdW/FgaNK7keXBRWknHHKIMGhW+4SZqoPyUXvNz/9HOAP6nvNcj54jDFVaq/Dai1FhmnTRRUNjQ9MOPmR4LZCNBVR2Wt5KO8/3HLEq82K3N2QarhRCw3kfSkUgRhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1fNGtnV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1fNGtnV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ede096d73so36543345e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745319859; x=1745924659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ao68ISDYdAe/LpOy6+LvZhiAStAN5lmsqAbHwNcsg74=;
        b=a1fNGtnVj3FPwJbdSbaAI4l4uSj1qZkbhpOnsAKNRCtwVAclJhki6kiNEHO/d0piZK
         JLQFII9o5rAyJNzP3KwhrN13K2Vw6CwYxu5Q29y/z+YJN6xcp/9Gn+3fZDSgH1pJhmR6
         Lzr2KACRCfA8IPQS6JMwHvlxzYaiaTekkAloAnMQqdmM/o+qLW7FNToyFOpy4mGJEq5x
         krHnNXlpB1MMshRkJvYTgakWsZEOy2LBk1I4jBdU6Oq35gpp6IRECUoWT57WlKxwJEcr
         d4dAqz1kfzKBKy0+T/pGxD0PC9nlrTVbGx2ILnoCyJe53yTP5r0ZF3yc9J4ctd5HCkFI
         /QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319859; x=1745924659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ao68ISDYdAe/LpOy6+LvZhiAStAN5lmsqAbHwNcsg74=;
        b=aFhWsy1YKmXm1aZRzSYR4zq9tlBWKZEXA+sbUY3TxenjKIsSP17n/Ltadk/WJG3V9I
         1+bBF8sBzUyGPLBa3PBzOVCGVNJaWFi1mtpEeIXkP5UsFpRtkPlTD/DWPbXXXTdun0sL
         5gpKOWjGAgwbRouOsIihlKxdP0R6U+paagDLyGM01L8mcvc0opL0D0ygHvDHegYbXIwY
         JGZbB/5XfoQNRJC4qlITw+xGCCmQP1FLs4510OvmI+WS8sWEnECOCRkhOR59p/hLfXFi
         I2PTXBIiGpxjv2nTY+e4/OKg4NQJzRPkr91ZCvcIbtsWOF7+4QaIP/Kgj7IN1B69QX9E
         9mFA==
X-Forwarded-Encrypted: i=1; AJvYcCXZRztIdB4SSLdCawg8Doz5F/hoRZixxWJjfNVciZeoCC3pWVMfiIsYRBCLzWkuR6fTnydlol5B2rbfgJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMkXaCFrxTrjsIq+yCxFsmhrM8E7DgcO2CRx6OMLuF66cXJXvL
	mfEgsStRr/J79tYv6mwQqnxWafLjWSWjChz/96A18vnseYFgcueamvV6fukiOus=
X-Gm-Gg: ASbGnctBf6SvlAJcaWrLwPOfuW33vMC0Iyg20fjoN4JjjZn/QSu7dS8Pd62cZZRamKC
	KNHQP7ZXwTcln1V6oQwut7b+23rQV8yMTY5bBkUMUpKPGzPFyfb6+t3Iay29gDcdREPeCvc0Jzj
	+/tO/M88G01SJqFMdAikGy6GXWnMimZ1B1tUvI7+G2tBoGFUN5vqJZq8xte2/kvhqsjn16/ZMx8
	7zPz4AJ/I04YpdNlT9ztEe1xEeCLXcabQBNINHniWXS5c8KOnuApX+blasnghpE2Tw+J/VZRfHO
	w8VJHRftOMzxMfZYJz97xZl7SNBFlpWKhiD18B4zjPqYbExuqRLJCzo=
X-Google-Smtp-Source: AGHT+IFnYz2Y0/0qxK9WJrqa+QqzRTeaqkUgmZSNsSOH5LL62CPMEyS2mK+2KEEHAF1X1Jefr4TeRg==
X-Received: by 2002:a05:600c:1383:b0:43d:585f:ebf5 with SMTP id 5b1f17b1804b1-4406ab7a7dfmr124462585e9.1.1745319859243;
        Tue, 22 Apr 2025 04:04:19 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8847:e39a:2a2f:e614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acddfsm169609725e9.15.2025.04.22.04.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:04:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 22 Apr 2025 13:03:51 +0200
Subject: [PATCH v2 4/6] arm64: dts: qcom: msm8916-motorola: Use UART1
 console pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-msm8916-console-pinctrl-v2-4-f345b7a53c91@linaro.org>
References: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
In-Reply-To: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <casey.connolly@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

The Motorola MSM8916-based smartphones all use UART1 with 2 pins (TX, RX)
as debug UART console, so make use of the new &blsp_uart1_console_default
template. This applies the needed bias-pull-up to avoid garbage input,
bootph-all for U-Boot and avoids having to override the UART pins.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
index 48134e5ff524fd5708db7b9c3a567ec3f751868c..4e202e7ed7db1921f347ca8b4a01ccec593a8d8e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
@@ -69,8 +69,8 @@ rmi4-f11@11 {
 };
 
 &blsp_uart1 {
-	pinctrl-0 = <&blsp_uart1_default>;
-	pinctrl-1 = <&blsp_uart1_sleep>;
+	pinctrl-0 = <&blsp_uart1_console_default>;
+	pinctrl-1 = <&blsp_uart1_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
@@ -132,14 +132,6 @@ &wcnss_mem {
 	status = "okay";
 };
 
-/* CTS/RTX are not used */
-&blsp_uart1_default {
-	pins = "gpio0", "gpio1";
-};
-&blsp_uart1_sleep {
-	pins = "gpio0", "gpio1";
-};
-
 &tlmm {
 	gpio_keys_default: gpio-keys-default-state {
 		pins = "gpio107";

-- 
2.47.2

