Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A19279787
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537029; cv=none; b=o/yZ7u5LkM92c7pfiOiDruJ/8ebpN/iZiwNwpqnOgGJJZEZpdUoxxBeb5bX80jLG1AFneS+VQyT3lwX5FZz4qXlYPqDDP4BKo+7PcJrhlrTilOyMHHjfXLH0QfpK5a1bnzcVKgP0soCZl6o5v5c/CV1qgLpRcyWHnXudKMlvCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537029; c=relaxed/simple;
	bh=fK59Oou5drgQyhp0Ss+j4VYrMmVw0bDtAiWMF9Ozu5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L37Ym9qij4n/XlMBfspg613UKaeyYEaAJDQ1u7Svq4w0cFzMDJgbeneKSqs7/wF0CltINRuIle0sNLWObAzj19Lm2YhhGw/kxnfM8fW4K/92mtoXoCbqo5TtB+Lbyk2Y59hfeY6Bub5SQU0rQb0MvfbQcZ3LaYtqyun340iSxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rgQdvIU8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgQdvIU8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c14016868so6592556f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746537025; x=1747141825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7hjl3tAkLPYtX6/B2YAWQ6GsOIrYFPOtKZDg5lJipo=;
        b=rgQdvIU8Wgoph89KHmvIdRzGLA46hKnq8YNvFmQU9aFK7mKkcLsmi9PAeaSckyZz9D
         U0kzWXeyKmcv8uh9VdBlXIaF7SvqveE1dV4qWDXOwihJgblTSvxniE3jDMDB01W68lE/
         T4Ts0SRiAKT3nNiSFeKJ3S/ET9iiUV80+tlsqfyWIQpFhspSDeo7I9F3neo0LppTRkbY
         Gapgm2ng1hvYfAYNbh6UVdZ/ejpADcdgtz9VbnFGmWHT12VnjHlvk653SRnEl7ECZ3Pg
         ic521jpizxKEEaMVvlZCCSWOOvpTz4lm3Bkf1pTh+sQd1cKTdpwCC3RWyRtF4LvFi3Bk
         WX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537025; x=1747141825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7hjl3tAkLPYtX6/B2YAWQ6GsOIrYFPOtKZDg5lJipo=;
        b=WENPXdCHDWBT2Lb9KNx0y0quwwLQNW27pVYUnRL1ksx90VTyuGbqVS4Z6Pb7sorGO+
         BHvBE7Ly5AILYREwabco9xQiSEmt0Unvzx1Twdnm/TZFdHvC0fGNXP/1umf+ZI3PUs7r
         o/ypF4ndDWnJIdi6GxH/YWIvSoMnAS2tNGTXV2iegIwGmwIazJCY6eexQ2TRmXB69E7c
         sD0ZTYRO5VSZzGt6/ZttCcjry5NVnijFBGtKsPEsEGoV/Ue+uQejwSQBmN1jlDsAfq8y
         zA2pAZORI7R2CTVh2GqOCv1GLChGZS9Qo1E9Gx5s0XWYRrAiEz4/YAfFCdziAQsfOvdK
         1w8w==
X-Forwarded-Encrypted: i=1; AJvYcCWuH2UHkSq1a+fcSxhNAHkIoOUk6sg1fUIL7oSvfvKLqYtzVey/7Jd5YBWRiJZBKhF+ywvznaYrmqQMqMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCI0qAH/wwiO7rNpypKoDk0lrer3RB0sou1FZUXu3p5++g3tq5
	xxM8B9gDeBU58D8X9GZ170gOa1L9QsR9OhYtsJUZnO+lv+58DWKe6YoNe+TMgGQ=
X-Gm-Gg: ASbGncvNEnW35FxMquMNTG7fzCdK41ia9KJvJnEGiBoTN3ecMm3PRFRDaFG/Bh8Ibke
	XoNzlo4mw1Q3lb/7imfbfRWneKZsuwsVfBCfQ0+ot780pZY2dhiKTeN9btwufKef63Tf2NcJsCU
	qveyprWVI1wXR/TrETMQhtwY/gLKmF92+1qflHubbdGl95yRX/gNP7YZdP9ni7rgNWpQ09h6cmP
	QULbYbKIMp4ItECxRBvtI5aTEwDZiehNu1B7JkNkfiKwzXBIAgIAQgX/Mf75qOgrT23Fp9cB2BA
	eLsWSQPpqENyziG1PiwXQYrritpr1nPwD3GjSOo8O8/PaJVMDuNgonk=
X-Google-Smtp-Source: AGHT+IEiRsxAkVrXgPCAZV3F4X2CztHeRG9ctQ5zIhdFUM3PU84EJKKoITEP995ACO1Ck8FEqkm68g==
X-Received: by 2002:a05:6000:18a6:b0:39e:cbe3:17c8 with SMTP id ffacd0b85a97d-3a09fd6ce46mr7930291f8f.12.1746537025293;
        Tue, 06 May 2025 06:10:25 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3f93:4614:996d:f5f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0af3255afsm1771268f8f.66.2025.05.06.06.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:10:24 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 06 May 2025 15:10:09 +0200
Subject: [PATCH 2/4] mailbox: qcom-apcs-ipc: Assign OF node to clock
 controller child device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-qcom-apcs-mailbox-cc-v1-2-b54dddb150a5@linaro.org>
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

Currently, the child device for the clock controller inside the APCS block
is created without any OF node assigned, so the drivers need to rely on the
parent device for obtaining any resources.

Add support for defining the clock controller inside a "clock-controller"
subnode to break up circular dependencies between the mailbox and required
parent clocks of the clock controller. For backwards compatibility, if the
subnode is not defined, reuse the OF node from the parent device.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 11c41e935a3619b74ad0f5e2d82699ca8aa05722..8b24ec0fa191efc975625d9b9270140ad1fe7b9b 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -116,10 +116,18 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	}
 
 	if (apcs_data->clk_name) {
-		apcs->clk = platform_device_register_data(&pdev->dev,
-							  apcs_data->clk_name,
-							  PLATFORM_DEVID_AUTO,
-							  NULL, 0);
+		struct device_node *np = of_get_child_by_name(pdev->dev.of_node,
+							      "clock-controller");
+		struct platform_device_info pdevinfo = {
+			.parent = &pdev->dev,
+			.name = apcs_data->clk_name,
+			.id = PLATFORM_DEVID_AUTO,
+			.fwnode = of_fwnode_handle(np) ?: pdev->dev.fwnode,
+			.of_node_reused = !np,
+		};
+
+		apcs->clk = platform_device_register_full(&pdevinfo);
+		of_node_put(np);
 		if (IS_ERR(apcs->clk))
 			dev_err(&pdev->dev, "failed to register APCS clk\n");
 	}

-- 
2.47.2

