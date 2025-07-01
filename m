Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00D7280A5A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390943; cv=none; b=WN8S1EuDVjxEbg/ScM4il4KGgqDAHkJ1P2jwhz5GZsm90o21HY1oTP2/+sgWyNxpufiStmsI8Ouj/SBDqhc66vmpv3OZQVifYwQkB5nLtXmxca7FKM+WQoEtFIHUERy6mL9vtKrC4vmxr4N8htVS/adI4p7XeXJfFefyr6rTLKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390943; c=relaxed/simple;
	bh=uTC4kzf1I6Jz+bT8kOF3LyapejFqA2G+/FXP/SQ4Ej8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSgxEj1A6XxZXlHpyH/GeGPLNINMOAj0qBg5EQ+hj4sN9mEB1SKS/ipO1vRHpbPdEuDrj3CoNLSF1UaLqy6kEeKifv6pEScZ0gyhPdWqczhBtc91oWwB7gScK4z1aRx4/+J335uvSfhcI570ZfxmnupP+JA8Sq62eZNOX+GndD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=trNl/sC6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="trNl/sC6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso34246675e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390939; x=1751995739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PQE74E3+f+H3yVXqbUucK8HKDi4aSq8B7tA2u++UxY=;
        b=trNl/sC6PXa2bpFq8u5PC5IhChKNlwHTmFtLeWExI1a4Vj+IzWoOtYlKZTwgVWEh3E
         cK3W2msfgkhRI3FtQvrMT6/OgIvejZT7mj1VW3eidlcIJr3ugOIaO146jHmb6SnnrcY8
         4wwyQ91GwlPZuAsuJ+gO2wCFwgoQdOJAWy9LRd2UcuUrMbX2Whevbef/qInFiZaty50q
         /UzyYoMptzH9THMXqlKs785+H6IMYlV1KiVB0LRA6iGIWrv7LXI2Y9qTh9g9FTqbd0pm
         8CJUm/jbW8OMuqxduQyIlGhOY8QOleP8h6rGuSrxrhugEifSuCIO5hFIBZ9NJecV3cFg
         1NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390939; x=1751995739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PQE74E3+f+H3yVXqbUucK8HKDi4aSq8B7tA2u++UxY=;
        b=AbTsD6j6UDoISBgmuH97Jek/lZ1lGP11/mrnY8zRzH7UzVvsm1/2D7/ESSFlfIjLNQ
         ppH8ETTOYSB5XMnIqhHnhIAyFYTV99LWKSmZhb7mDFgiTQwGV0tc50/3cxm1q+/o0FXl
         mBrOLRJIGRnLZ61PM3bDMtllzvazlI1AoRa/H8/NlRWD/Ki9ajB7Po6e7YaGfbPrRFqu
         hinUJ7TuvP8Olr3ky91JGcD/+BtzBg+tAZZaooPD/M0iv6gaX7OrlxuPWEAlg411+5XV
         CLy50Fo64qZDcYBdIuepFVCHmO/yjAci1PDyYXXtB5xt6zVJFMjzy7i1hUQuI6+sMPrT
         /JuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGesC8dvDI2SzUBAchOMdHrjh6pYw0IJIHWxWq55mxq4r6v27JrbnGH+EC9NcljtrxK4ACp9A3wFtqltk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYCT5bDMlx1395eAqpYdEkPIp1Oc1XXEVe0qzhvP6Nu+l+6YcE
	dAw/JtFG1K+tjtq8FrJR4y9Ggw3w8i8+nkd4RzVC7AV7c8Pl50M+YNj4Z4LveEGSIbo=
X-Gm-Gg: ASbGncu/5nNGXkdTd/NNoSVnDX31/ogaxu8ZiafL4l9Kh3LwPSM+fkuF14M0xYskxAC
	vsVXvUBBWa9ublfwDBd7363mn4iLQFAeZIkZ3nA57p2u3kx38ZbIsxIVdEKQB4f6j/5TcSRjG2z
	ZOJfA7j0kFUpf5OG4MyzdumWufnTqZ9qFtXzzc2hZfvSMivweXZ7vCL5yf6HuzQJx1bW1xdS/oA
	YXbiciahVQAB2edPpQrrXBm86NgVF0JKx/Vss2aDGV2/jQ/91TVK3bROvqkaYmms3OwhBtxWv8I
	z/iE/Pbo5vY/tLRfE/V5ldZYCgmLFEpWke6XqdfBAtIU99cJG5vb/nMgmFAc8OeihwRfJ9iZTRS
	11w==
X-Google-Smtp-Source: AGHT+IGZP4VK3OGEwU0CEzKIJC5X6rK51GL6b45SeBsta0YIlXh3TGxScJL99EYRJd42enR5wJE46Q==
X-Received: by 2002:a05:600c:3b9a:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-45395338d3bmr182966045e9.16.1751390939051;
        Tue, 01 Jul 2025 10:28:59 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:58 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 01 Jul 2025 19:28:37 +0200
Subject: [PATCH 5/6] clk: qcom: gcc-x1e80100: Add missing video resets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-videocc-v1-5-785d393be502@linaro.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the missing video resets that are needed for the iris video codec.
Adapted from gcc-sm8550.c (with adjusted addresses).

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-x1e80100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 3e44757e25d3245e455918e9474c978c8dacaa5e..301fc9fc32d8e6e1ddf59c1d3350d84f6c06e4b6 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6674,6 +6674,8 @@ static const struct qcom_reset_map gcc_x1e80100_resets[] = {
 	[GCC_USB_1_PHY_BCR] = { 0x2a020 },
 	[GCC_USB_2_PHY_BCR] = { 0xa3020 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {

-- 
2.49.0

