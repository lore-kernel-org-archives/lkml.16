Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB961FCFDB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039466; cv=none; b=SJpbNe//zEvIrP4mGj8VHeYR5Y90e3rm6FInx3KfRBjVxHO5kA+8oPf2XpvSTHeKdUEM70lOdvHMRunSa2WPHsd5ciBb8gRFd27o9Ce0C7pk62pfxLTlb/xw4Q2dSmC2g950Iw0fpVfFPlXdbZ6Y6NDVWGPV0PDq8z7cJT2KExo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039466; c=relaxed/simple;
	bh=RVAZyY5IcoBzQEHI3gKR0pYiz9xjpwuFm7lVMrzCleI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOH6wrBjV1fOU10rSoCU8kaSaGyVWX3qkSMzY5eti8P7PzxzwKBlKGwp87J7UhtUqN7o95HZCIe7ApPc0po9QYWr8mBq3uHJJeKNOylLCnqtyMKwAMDoSOuuYdtcP36aDZ3irjFu8CCYrCR9CIP1KEjFW84Mh0rIUKvg6RRdk9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXG9qmOL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXG9qmOL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c30d9085aso2633831f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039462; x=1744644262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFhBT6qWaqm/ORgbP/ajYYPXDSwWN3XeFcOKJs5rzCY=;
        b=GXG9qmOLC3FyKdd1A6xKb9j5z6/RzEia7hqJqVJm74J7zK4VIyWWyU6WPpwtSubzU+
         Xnihhg/E8SxILR9j1LJRUfh4uyQLuk4Zj3YZZWntwljNW8M33zofr7pJtPjqfXrdsktO
         u6CCh1QrMOzryXYh+KzKL17qyZwV1yOoSnHtyEQzawYDrJojcxztApKHDbB7O8k893Nx
         wJib7FYBV0j7vhiiRQJgFf2iWR7jbuzf2ptqtbdxF8azebjUkUqW8lWAeJlRvyVgWQSW
         wCfM7WxVsxEwJcU/e2ap2BtGESsbhTIgbgY+BHtEslG7GXDFr+ICL0ob/NONZiM6QNu+
         DtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039462; x=1744644262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFhBT6qWaqm/ORgbP/ajYYPXDSwWN3XeFcOKJs5rzCY=;
        b=BVQ91b1hDSHHh8Ire/tRSB4BI0CL6lNaHW1r+ItFYa2tPOHtgLYX8Ffk8P/3AkAz32
         F8w9imRDsITu6obK2XctzjKHhIdiFv2M4sbxwWJnX9U6aYT/jgEbs0XigLSiJgPSmTQj
         ZnbsxWg+HY8NYO/6lHrWuWjfYhqHliH/Mn9JxG7NCqaCZw79BLCzfFIYVMIzCdeaUyvP
         f09NB9PiejO5zyhPeFuOlI7N8OM7LrkduV4PLo9uwkKtxaZ4i8HxmySbhAkYQLpNuG0r
         5exTWAbVzinElAjIYBKq9lFYtcunhM3G6plPcyU4GQEN4ENQxYzNxgm67qBhJ3+Hsyel
         o5pw==
X-Forwarded-Encrypted: i=1; AJvYcCVfQ6BaCQ4uNQRhrYYQUgtHsQWl/dIZAWJjHJ3Q829gQT5jJuhHHfIHYPzHdwFSxqEqzQFynJCdsXSXok0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqbo2JlwT0vXox8vmt7C0UFn87KdFwEIH65A+xQLg8E637pxvo
	SdLpEkDE0B7gcSSpsXob6LB3tsFkjVTdEyTeHF1P5cXViuVUsgSspZ4C8wUl6pr/nNluR5L0jry
	d
X-Gm-Gg: ASbGncsqc5w/z2IgKZ9Wp8tpGlxmhLSqvoiPifGNdxXovJcg7varFhzbpF2byZr/CW9
	bMy+ByUVlSiHP/YbE0M567JCSSbRexrWCbXSlJxo0fh1LZer5HIBzClPtkV2cPDhY0+9tMXgdmf
	VuYs6MYKg7AdZTkaA18ghcoe6MKx/PPzpD9bVKrznHjiilzqKZXap7upJrb3ulgrNr+RdBKJmf/
	NmJeKwS9ohrLNMN8//ucPYnC8BfRvjd4wWpnZalQcifK7fZw5xqysaPUKImUh7SoD8SeCGBdiko
	AOhYus7AZD+OIJNYDBCKVd7/RMutKfFBoyRk8S+RftStOtg5PfRqGBALtq+HJlQcfw==
X-Google-Smtp-Source: AGHT+IGKeErGsgt3xcPUWlAhrhw6nxkHOMynywbipAzVLMif+RkANCAk8iXT2yS7MJ0iTjz0ErJlAw==
X-Received: by 2002:a05:6000:220b:b0:39c:2692:4259 with SMTP id ffacd0b85a97d-39cb35981fdmr11848571f8f.21.1744039461842;
        Mon, 07 Apr 2025 08:24:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b42besm12212001f8f.41.2025.04.07.08.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:24:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 17:24:14 +0200
Subject: [PATCH v3 2/5] media: platform: qcom/iris: add
 power_off_controller to vpu_ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-sm8x50-iris-v10-v3-2-63569f6d04aa@linaro.org>
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3736;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RVAZyY5IcoBzQEHI3gKR0pYiz9xjpwuFm7lVMrzCleI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn8+4hQgEq2YcIQTOlrbncUouTzB4PzdefeSFsA/tC
 k+lqsHSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/PuIQAKCRB33NvayMhJ0e9yD/
 0SWf4xKtoipk/G7pbt95vkS/sum8uS2GA0eVAILuEVoEHlWkfvTUeAy9FqDA96hN3op5Kb+dOSHqHf
 CVou7r5z8NX3LN+ZoHyYVQ8m3IPO5yTyWKu0D61IcHL/qzp+MYXiBMDycYqld6V3o9RSmSSedxQwjw
 U8Lnbng0DASYQJ0HeM8/cVtJOavX6eibot1s9WERleYwfG53a6ZdFVUO5D9vAqpGPutVWB0auYNrLd
 VGynC6TeDJ2EqPAFHC/7AjZLmRr2SJO9hKDNClw+X0ZHOmwdM3nyRI6jZYmpm98BjhtZU6lDgdNw3p
 2c2BllQ+3sAoMTk5fiFX0/em3pe5dAyP5/Y+w/uv8uIWMuy39lsevtna/jWkfVGd0UBCywWoI6LOd7
 LzWXSH7YkDDoXbtqmlLYpTkpdhm+Lomj8gh8wfYEUSz8sUu6BbVBldd3MFW0GWfpRyzS8ZpvM1i9M0
 9hjI0cV87lHr8bJ2TQV1p1/s7hCdGND7tPfSO7o7KsVS6TOaKxbsNfurxaqmwCFpNRwqDQ0DceZyb0
 GZonbkraSxGo0T90kyocm9TnFa40i7RU6wGqLwn/f1+2FNceWPhe4cYuhfk+njgJm9KTTDHweYEU1d
 AxsZ6I+44KP1IJO/t9smd3fkiMyLuXYFg27JyrMt0IHXFFiP+R7+E/3UCsSA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to support the SM8650 iris33 hardware, we need to provide a
specific constoller power off sequences via the vpu_ops callbacks.

Add the callback, and use the current helper for currently supported
platforms.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 8f502aed43ce2fa6a272a2ce14ff1ca54d3e63a2..7cf1bfc352d34b897451061b5c14fbe90276433d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -34,5 +34,6 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
+	.power_off_controller = iris_vpu_power_off_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
index b484638e6105a69319232f667ee7ae95e3853698..13dab61427b8bd0491b69a9bc5f5144d27d17362 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
@@ -118,5 +118,6 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
 
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
+	.power_off_controller = iris_vpu_power_off_controller,
 	.calc_freq = iris_vpu3_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..268e45acaa7c0e3fe237123c62f0133d9dface14 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
 	return -EAGAIN;
 }
 
-static int iris_vpu_power_off_controller(struct iris_core *core)
+int iris_vpu_power_off_controller(struct iris_core *core)
 {
 	u32 val = 0;
 	int ret;
@@ -264,7 +264,7 @@ void iris_vpu_power_off(struct iris_core *core)
 {
 	dev_pm_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
-	iris_vpu_power_off_controller(core);
+	core->iris_platform_data->vpu_ops->power_off_controller(core);
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 63fa1fa5a4989e48aebdb6c7619c140000c0b44c..f8965661c602f990d5a7057565f79df4112d097e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
+	int (*power_off_controller)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 };
 
@@ -22,6 +23,7 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
+int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);
 

-- 
2.34.1

