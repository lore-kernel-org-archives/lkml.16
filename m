Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BFF1A5B8E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970976; cv=none; b=IpmCfOumpuX4hOKEbfbQmteXoj+hQIddqwSFZq7vIa8BMF37MduNIzHaCQy+fNj1pyqdWbLb10nUyypA3MCSs3kGgtfCj6oW2GoqK3D30Wbh82HZvOmZR45vtvQMZcvNN8n1S6oriRmLJR3bDHldSbQPG7FGEIcBSW3xihY3PeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970976; c=relaxed/simple;
	bh=t/ClPnFK2Y4tw14RJzsVxyOOTn4d+SRgStXzq4Mnbr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mbq4SRSPoxDQDIMRunr2/X5KeS/ErEQF36JgG7vGm66s2FCObSdOYVfpTFy+/bGc6dNQf22xudawJUKJmtUIU6YDjOUaSabMHcKvZ2uOwsVe0Eb5f2I2fZxEdREKHRdnWt526rwe6K0lta+mUuxOBr9qEEpzR5O2mRkhUsZBSMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uc12eOas; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uc12eOas"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so500441f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970972; x=1744575772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E458gQJPEDLg7gt5tX3yC9GRB2p54/ySefPjbdFmnAo=;
        b=uc12eOasR2Pg89XyJXTlUSScA3Ykxn5LvbicjmJaWTX0gavu3ji9FUKonPG6h1BItB
         XNS4YT/Uo8vWFd1Ivm1lVB9XVqUDcGTJ53I4BN44ZIqkaBQ3RhXS+jqBTPHiVyawy3Su
         9doJmaH2Ys7U3v6PZRJ7VZLy8NjcYf4nJfJ7Lv+Vqa8WVK5W9e3YN4zDH6ljgj/sLOQw
         ddh5izkwHPn2shdZ/pkI+vLy+VSAvp817Sv+ZUxaBzqCIJjoHy76+Z3KNRUbJZsS6g7T
         7qRx1k1Oa1drrXfrvsWk6ZI20uKZIrfa9lexgoT3y7IIZYJTofrMaau/pvqtif+cj/w5
         n6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970972; x=1744575772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E458gQJPEDLg7gt5tX3yC9GRB2p54/ySefPjbdFmnAo=;
        b=LyIjzvCUA5zcrAqqyrNVWYzIhixGT36BxELJdx+38Fkv2PpqzqlCrpCLi7RpnksASZ
         RTIgH8D5wytI+oTUcrBdb4hbkru4gFoGljghfSaVs1+dvmUm4cL3aqceZkQe7sBDRXqT
         T7EcYnuBkWz7lWVbrAUzu3RVCQKpEiRAG+eWl//Ciquc2B2L3xqz4Aqj3EC49GhIjsMm
         V63pXAfXRyWTvIe78YuLwIdD2hDLI653vPR3CZSVo50oNh71W6Dg8oBqNRLI5wgcOZxu
         TmMZbTSjZLJ4PT+EjhU7TThAeR48vh0iq3elRzPyRwOTI29aGNIKmr1/ZpBfX8SC+6WR
         a8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXZvDj69P3u3270kYFKaMYI9y599KBX+6+++wVB5MagJPXlwupo7JhfWPQb+/TES7ArTy1t+YJb93O+fNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBr4DMhPQGHwQvD6O277sL6tGDBy5/YOkWNpRaQ0Jj3Y4jvb75
	eYFjZDAkuXyn+z1D6IV1Fkt04vQR4IngD/4CLSBwtQjkEj4XgdyAmPw8Frc/WZQ=
X-Gm-Gg: ASbGncs3mpOiNAOFUMgVpoZjhWS78y0TGXqDVmSJacx8Mcv1fkn08wfDI6FMA1BCd6+
	rpTNR3stMIsdD+aolnam70WNaPZyQdk1DOxsddG14LQja6X9xsE9ZmzIL4H4jQ2Ny/mTGPl7BHh
	t7BdwzivUTKTU06wwEK3oRCigLIx7sFuDlwin+fejsdtX7vdIxbzZQqpvd7/e/NwZR9DkCmZmi0
	vTCeVW6HLXeQZsWlZR7cYyYVbReNDk6qYNFo4a2yoEoapmVe/Xqc5ss7yvawT9TyEumMrzRceG1
	/w+YMLwN2RUNhnoTlB1P81eWoT1ymWFbQAnkBxh0R/ERW9cIWCA+76+6g9xK2dJ9
X-Google-Smtp-Source: AGHT+IEF8tj7Pq+6DZXgyHyaSB4Mgz8msO3r9oCeK6E+RJBMjaZB+pmLJuJSpG/6Qd5AvxQHxn7QGw==
X-Received: by 2002:a05:600c:3b12:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-43ecf86b411mr30682825e9.3.1743970972004;
        Sun, 06 Apr 2025 13:22:52 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec147c9dbsm115304655e9.0.2025.04.06.13.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:22:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] gpio: zynq: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:22:45 +0200
Message-ID: <20250406202245.53854-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
References: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index be81fa2b17ab..3dae63f3ea21 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -1011,6 +1011,7 @@ static void zynq_gpio_remove(struct platform_device *pdev)
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
 		dev_warn(&pdev->dev, "pm_runtime_get_sync() Failed\n");
+	device_init_wakeup(&pdev->dev, 0);
 	gpiochip_remove(&gpio->chip);
 	device_set_wakeup_capable(&pdev->dev, 0);
 	pm_runtime_disable(&pdev->dev);
-- 
2.45.2

