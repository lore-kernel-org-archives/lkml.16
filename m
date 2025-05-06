Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24358280325
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537030; cv=none; b=usAfCSTO22cNIV99NY6XxIaVfvC6SZ7ttLIRK4zU/Pg0vysY49R7svB/OyfHV6xMrIJxvK4ttjjkGJL88xv81pV4ZEE5nYMsveBDgSyTXYdTvuA9Sr/ebJHqa8Eu/HhTaIRD2wChfQYjz0ciruLYZX5CD8XxhmbXtgkFoBYMSYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537030; c=relaxed/simple;
	bh=yxf14Ljk58+UMoTg7Yyge6qVosH5ZXrWvi6A5xwpE58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q6HBLMTs60NVB78RdvW0N/pmhLVu8BoTww7Gg0aF6oOSbGet8diEh5hP4SI2ykeL/aAq8HMMulqtaio70OJcPiE30AJKwC0WzhbNX6KUfiHy+hs/0yTmcdoc7+Avlumk3TS5er52i2e01cBzrfiHNt38pft/VrQ2zIjA9d/YwA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cptEZha7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cptEZha7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe574976so35862375e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746537026; x=1747141826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgxrymKBqlMpBOa4fXvZbXrP4W9uX8YtK+8DIxg3UAo=;
        b=cptEZha7oz2gk4leZ3179fl5bOD1MXNRE9fZM93udsp24gxoJexzpHeE9lWgsMrf3Y
         blVG1y8SxyHSw0abw7cZlHaLw8c9v+6qBiFTQeuY9p/F9t9FqTarACbaCXvWQjECZQ1/
         PBh2omLc6+OuxVSqM1XMzYU6ZslauQikCob2oimdrtEl0YFX/A3vBFHiU/37lvVudOWx
         E9yjaXKNGEDbalAquXZCCiAHl0YBcE/tPOqAxJMuMcZ+ChcLNc4pc72irqY/OE7kNWK7
         LldukcY+Z7bn0Bqy8AIAV9obrgGcXfgBcYV3m36H73i6EKmHXGV2TnRiWIzQw8FGOIjB
         MtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537026; x=1747141826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgxrymKBqlMpBOa4fXvZbXrP4W9uX8YtK+8DIxg3UAo=;
        b=KIe4jK0MyzXo3vEfqqrN0GnWA5N1M1ztkrtT0lSPjVwo704iO50a2J7Izr/tg/4ILA
         rqTe4/ZybnzADLN8qrnE2yi3Vzfr43RtqCIU0vssdAmgA5hAkZiX/g4eJGfRDWiz4J50
         Hwc9baBc9UziZEfTkVqBFOPkLCcC4gNlRXaMNUiV6QKLK8Zbft7qSIM648NIpxv8p1O+
         Ts/lQQf7gDwnQMSlKtc/vuJPYDVr47Tbd8U7YL4kuWpr13YbB7NN1KROEvwg/cEDcpn6
         wu18PdRPAVd5wee8JgZpCgzMqpfWGzez+UdUpSD/sFD+hRLpj3tQhsU0oViQ/lY/Sp7e
         uweg==
X-Forwarded-Encrypted: i=1; AJvYcCVLNQX6wYy+AiMK5mIOc+NJfnrpK5fX2XlNdw/efIQBZ+QizsHOGkRfp0UwDDLaaaASPINVLbQQS98OSaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdDkkUouOjaLD0iKnHKYGRSTwWLNNGFaWRXgCznK4xFaKnSrPC
	E4ZxIrT8JbsdESKTiGbhyk1/cfHn7rCMnntr+FZZ1jiHhmkt8VKWQa/QyzqsSLuS4WSUZWZpSUu
	S
X-Gm-Gg: ASbGncsU3sgrOjYZkx98pfqRC32lwJ2MJOX9hXSvQC+uoMTXZhcOxbliUH2C36oOvDf
	IMk8APPRBPGE0KjaozBrBjtRQNH3ZwECRmfXjlrRGZ65tW9Qb5ibHSjVfeJRxXsZ+vLOR1m3cO/
	2MEmjKKMeCg1D78kpD6Rbz32DzyMjW9U0sgH4IQacFnaoqtPuYHdIOGRquC0ecukg7nPtHGyPDh
	/tdzHQZlZzjkY3Htx8wphlid69ZBZ4x3j/JWZNLVi8rmcB4VnBfp3Ce6ckltO/+t8afUmrYKIf9
	iU9jT9HFhJKyBfL9E5i2bT9zIQhbcAXZADXGJiaXGYGy1sqlqoqcemCUtj+Ds2Dbbg==
X-Google-Smtp-Source: AGHT+IH4gKCkUyIZVMKUSRcuZsuNAPJ6O+y8mkjQv/iAU3euFY+19csLb2q2NlIB4YzdYULF7KFX4w==
X-Received: by 2002:a05:600c:350e:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-441bbe2c815mr163710535e9.0.1746537026227;
        Tue, 06 May 2025 06:10:26 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3f93:4614:996d:f5f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0af3255afsm1771268f8f.66.2025.05.06.06.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:10:25 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 06 May 2025 15:10:10 +0200
Subject: [PATCH 3/4] clk: qcom: apcs-msm8916: Obtain clock from own OF node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-qcom-apcs-mailbox-cc-v1-3-b54dddb150a5@linaro.org>
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
because the qcom-apcs-msm8916-clk platform device did not have an own OF
node assigned. Now that the parent mailbox driver assigns this, obtain the
resources directly from the assigned OF node to add support for describing
the clock controller in a separate child node. This allows breaking up
circular dependencies between the mailbox and the clock controller.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
@Bjorn: If this looks good to you and you are fine with merging this
through the mailbox subsystem, could you provide an Acked-by here?
---
 drivers/clk/qcom/apcs-msm8916.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index ef31386831ebd2404b99edaeff4c95a31eb68477..af60f3ab1f82068e5ab046ee4a2231c7fb85ff41 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -82,7 +82,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	a53cc->src_shift = 8;
 	a53cc->parent_map = gpll0_a53cc_map;
 
-	a53cc->pclk = devm_clk_get(parent, NULL);
+	a53cc->pclk = devm_clk_get(dev, NULL);
 	if (IS_ERR(a53cc->pclk)) {
 		ret = PTR_ERR(a53cc->pclk);
 		if (ret != -EPROBE_DEFER)

-- 
2.47.2

