Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F31B280338
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537032; cv=none; b=Eycr+9vplzBNhuGup/DtnuMb0QGxNBObnw714/W8iSd9tyWNAcmW2YQ/XukIZqB2d7LiayLg+12GJUPr8hX+7qSE2goaImx9Fy/yp0lzSyRXa5RAvUDbkNPk12Y3HTBV+WJ55QAW5mEGST0rXPSG3Fx+ivn2+uzCxAyLCQYpDPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537032; c=relaxed/simple;
	bh=dYgm4NlH5IPfrUOXQB7Rxpf3oTIhlLONuVDqq3iAZvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOPAZTiimd54J6gNJOv+pEi1fWB+7uyNd3H9SQgt8ktYuwASBMb28/vI+iWiW+DxeWs8rQWavimZwipIS9TKBEUmNRsU1u9nCaC4MuBwKzuhbcWr+s9mQmBpiv/F1xx8V04JSHjIWZIgV7WpucncB12AoBsNtmt/AwO5rdMcYxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/l2YURg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/l2YURg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so47568535e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746537027; x=1747141827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjTp/aG9h3L2/xPCCH1ShAi5uTe++Ief7FWXdc/5tOU=;
        b=h/l2YURgLeT+rf4NEzDX2p0MgKrifr0yHvBozo8IhI0tq7YA/GgReFHjp9R9c88c+q
         OdFNMPs/fcYQ7wBc3YSP9H1gLZecg1H/4CvgCAXwWo71igwMtX0diLJuTBPc71kL73k2
         pqYMvYUd52RrcE4AAAPCyZAKwHhLaiSA/jm2Wa+Ti6efiJD/FvqlRStvOUqrkKhDutEI
         K/38joCVEfpXtC3wDUYd6Bi2Nwd+ME6L2nf7OdkzWHU9YY3LQUw8RUCwW6EfnWSRtDa7
         qJub9sDhtCWEOIwnTYfCUmaa9Mg+TeqGcEJxCFXNatrlwmKGU+2+UWZ1eDqI6y/cDUfZ
         XDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537027; x=1747141827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjTp/aG9h3L2/xPCCH1ShAi5uTe++Ief7FWXdc/5tOU=;
        b=kaaJG/2bDaZ2TjW8bidni1rp9GAaLubienGy1y8zcemqiUgWTrVTdYZ2S56re5W8hk
         0j2kSu8xu3kQWbXEeE1t1GnCAmDduz6FN1gjpXFe4ae53cJ5AuTVyhsJ39Ns5mhBs7Tg
         76LoWSKX82bPxznNawp/HOKuzQ6QvzNY8gHyY0kng0xnV5+fnFUVBUtga3kFGwA2cmli
         xHqBnkZl9QW3S+4KxM06TzsuQd+Z60nSUQXfLWx6p2OZLiUqgPmdwvSm13JUMmgqMHO1
         R41kxUKCcn53woSN/jw3z2B/ZzufDE1Jh9yn1XFwaCkibiBNYJybnknvDa0VlNUh3oOR
         TJfw==
X-Forwarded-Encrypted: i=1; AJvYcCWBOrk3VHFaEQEuRg+9LB5CednqH/MXrHXaYUmqdGB0a1GIVqN4ZRIXMII5oNLM32FkNo2R/jDn4Fa5Us4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIGhEMZQzCsWlUMVnFYtirNaD78wXeQOMsUZT72/mhjsOKSjlM
	LjKuDr6yy72RSO54WqiUR0OQrppk5wfUzcCWR0RD3ecHkQdEIVbA5ORPKHBgBnw=
X-Gm-Gg: ASbGncsGmC/1DIdg0yqrdGuvmCzGLyAJ8DE0eUA/VwQwRJXg3Ija5jiVW1c1y8SdATt
	EmL6pnImgodXs4B9Vg8+NqP7Lp63WOyAd1PSr+Qg5rvlhcXS/1d2AgSiu4idDSHYJ651T2ToxHC
	Jy0+hNB3J3d4405H8vLiu+kRhlQOrvpbVdWpnBMpzjAGFesrk6hF+niYT6so7k7kiAYDi4P9NGV
	QWVKgxi+4aj/dKHpJ84Ccp0SEkdaV0IK/3I/rrjEwk2MEaeACrdaLzMxhvGbyAPCILRVDsZEJxn
	NZJwArwBoqk6SA5ZrOYFLImj8HxzOOfSfQGD7u/d9NZYlCPXeBe82fw=
X-Google-Smtp-Source: AGHT+IFaFB/FZezjripHyQEZgUYd+jxmBl3+AL6siEuRgHFWmNVit4blU6ZNo6pVl6a4NIiA+7gYKA==
X-Received: by 2002:a05:600c:1c84:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-441c4919f07mr78232605e9.20.1746537027193;
        Tue, 06 May 2025 06:10:27 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3f93:4614:996d:f5f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0af3255afsm1771268f8f.66.2025.05.06.06.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:10:26 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 06 May 2025 15:10:11 +0200
Subject: [PATCH 4/4] clk: qcom: apcs-sdx55: Obtain clock from own OF node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-qcom-apcs-mailbox-cc-v1-4-b54dddb150a5@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
In-Reply-To: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2

So far we had to obtain all resources like clocks from the parent device,
because the qcom-sdx55-acps-clk platform device did not have an own OF node
assigned. Now that the parent mailbox driver assigns this, obtain the
resources directly from the assigned OF node to add support for describing
the clock controller in a separate child node. This allows breaking up
circular dependencies between the mailbox and the clock controller.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
@Bjorn: If this looks good to you and you are fine with merging this
through the mailbox subsystem, could you provide an Acked-by here?
---
 drivers/clk/qcom/apcs-sdx55.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
index 76ece6c4a969266aecb32806269c791712f98804..e0e779a81f2c6b8b9cd34d839eee9aaf9fa33f03 100644
--- a/drivers/clk/qcom/apcs-sdx55.c
+++ b/drivers/clk/qcom/apcs-sdx55.c
@@ -79,7 +79,7 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
 	a7cc->src_shift = 8;
 	a7cc->parent_map = apcs_mux_clk_parent_map;
 
-	a7cc->pclk = devm_clk_get(parent, "pll");
+	a7cc->pclk = devm_clk_get(dev, "pll");
 	if (IS_ERR(a7cc->pclk))
 		return dev_err_probe(dev, PTR_ERR(a7cc->pclk),
 				     "Failed to get PLL clk\n");

-- 
2.47.2

