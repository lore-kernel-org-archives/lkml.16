Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B8728CF65
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798998; cv=none; b=nE9MeiyurWIQ7/pwueWWHKUXMPlonw4rXwzuQShULs7o7zcGea9Pew00ul4F1fLZkS7iZTjI+c5PcHOCy4VREO1+1S3Ya7cB42YCjXbOa1+PjIVWGluSivglp1uajdk6QAjfcX/JCfv7bmefGPru5e95zJr/zzQsx9c+G3AUBEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798998; c=relaxed/simple;
	bh=uLqMD1ikwZk4jDZUwpPdjjE34o1A38fgA3R42TYK8w4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CpsL5LL70Qh5ulAvUjw2m5TWsXaj/7fV/ZVoAaCTc0Bm9wq4/5tbgfkwtQjHAMKceawpDWzKSHpbnonFMvll5xG+viDrTEV0ITBSRJcAzu7XKtGppyiNQBQBIjRr0UPYLUsWDdYj36u9wgUsyhG4scfGerHnpID8oko3a7bPwTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jtlhvIw5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jtlhvIw5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso2230765e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749798994; x=1750403794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6c+aX61jkwbmsT/oE3ldzclDSvOJeQY9LNH4JsyNxI8=;
        b=jtlhvIw50Mxx7a2/e7xe6bQmIi5WrjobeJWJP1h0/grQfYQGtjaL3AaM6rWwiCMm0r
         n34+ILb17ETcr9+83ksgClTmKntg8nH0KNWOdSu5EVPPW4Obx+kqGu6vSNw1CUiQZRTE
         UA/a4naG7Nv8V8hmvwGXAX4Sqr9/1RcEpg4egD/F5kxFv4j/3kHj9v1FqHuc7qVB4Gtq
         7U41LpDfTmAyvheToyHaYSHBDixsV0SysQCQxncRpBgDs2//ewkHsnvyf56b+zDv01FQ
         NYMArcXO1WtZPnpeEK1PIxsDUdNCgnGR5B/X+BA3nR6QJ+6q87MthiBuAuJD+rfx200t
         Dr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749798994; x=1750403794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6c+aX61jkwbmsT/oE3ldzclDSvOJeQY9LNH4JsyNxI8=;
        b=bJ3rB0TfDhdGDx05EW36ZUlwO7OIaWaHSqsepdR8rvChGNkI0INEK4BkhNHcECVTNQ
         FMHJ1zRHXLkhN7XfkX/hBDxFToHzxm7KBTGagQOxmaXOa+jZukmpMM6EYzrHDg4J3NY+
         rc8BV31IfpbrSSv3b74XWpIIiGnOSZ3RbNEMhCxED0dSYHhvXrFf2SSn24/HkmiLAcBM
         b32vVMDl7M/Q13se/WJxgFoyHw/5JR1nJeEyZ0NczmseeOZHJoyHswTBzsl456DjT7Yd
         bbxZSTdjm9f+BwEPhOZIxJV4mQkyR4mjzsQXboALRxVEwYTgmCTs35CNrpFmYRyRG6PZ
         3QPA==
X-Forwarded-Encrypted: i=1; AJvYcCWS1Ml5sT/NaN8FPx5yTAKfRHzD+1x/TvnxhpJZ35+9v21lqZHiU+r4EIfDiC2zS3Hj5M9CYcqb4VCSX8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOOtyZ+2rQIEi2qtzHLq8Q6HjcedIEVsN05UzJPXEH9vmVRed6
	D9QUfEL5wvvT0e7oy7LxSPUwEP0sgh4WjhKINrWfTlj4P9G9Pho2bNX0gOgojP4DV44=
X-Gm-Gg: ASbGncu2dhhpP/TAjX0CeVPEl39b4JZnoNmL2gT0DInmiP2F+ewjjK6g/IpB5sS086+
	kYjMCbzDUxLnr3iYnItb97/8bbiyOKT05Eo3meEL5iR8VJ9MBBQhgbK1wp+5FPFG+AHC6fuWCyT
	vQz5+WDDk8ndvRZoqvbNJG5ZEYYHRc0ikkJ8fYJBcjD1Gjy5loJGbr7CiCcUct2DXHR+vGUJBPY
	TjaH40Nwghz0RU8grttqULbAueojJFPJlMIsLZ8X0RIIayrq5x9MtmEPxNP8V5MKVrzVIKwNjAc
	lo6GeWReMMbUxVcpAWN9QCIxj6KfoG/0VQA6mq+Oo+nv4f8INFBRAh4S/3FJrdtY6ehTrnZo7w=
	=
X-Google-Smtp-Source: AGHT+IFNj98jwyXNQSYPoKhPA/7VYwqqMd3mGfUcA0Zg65b6bZ732T4TLtCrPhjPGhXTDHCYXrqdJw==
X-Received: by 2002:a05:600c:3d07:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-45334bb5396mr6765075e9.9.1749798994449;
        Fri, 13 Jun 2025 00:16:34 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54e71sm1438963f8f.1.2025.06.13.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 00:16:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] gpio: sloppy-logic-analyzer: Fully open-code compatible for grepping
Date: Fri, 13 Jun 2025 09:16:28 +0200
Message-ID: <20250613071627.46687-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=uLqMD1ikwZk4jDZUwpPdjjE34o1A38fgA3R42TYK8w4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoS9BLgF9K4JV8CHRk2dpoC2eYF2y3+yVWn/6qP
 WT2nDYGdJaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEvQSwAKCRDBN2bmhouD
 1zJaD/44p2svcOC+1wtktO2m6S1H1QYIXL+khF0ZpFd05UA8dFSZGo1EgpNpGYmRC7o940VftTo
 HrXGsydUYWDgtBODXNxmXBypMDi4W95D2EK1wPavgXQ2FbbK3cvhmwqWBsAAL+895tS0MPObMvH
 BK60MyTSEqDlPU9og9GNGVIRIP3fSc8yUT57JybzgpI1PnJWpbsvcnZKta1SunqLKxeZ9Pz+1l5
 dvlyL6XLEqmpqy7kIUXp/dA7TSu0z1yArOWzaFNEOXCtyCz9d1nZNziz/oTjQNPW/nEDVJH5xT5
 8wnlvkVi9Cc1EKEeCYXjawiztzHMcKsFFUzK7Tahjb719/NojmagcZ8cp1huGv/FsshkY5f06eM
 WBhKVkB+8xjwwCmzCpFCeTrA82CSxan+dIQ+E74M8J8ezufnjByvyb/zZrmOMKj9RPc5jXisAQe
 rz+hfx8md1EPau8FYV9BBmfmPJGWBFYxS8LQ/1F5e4mMgtuRMWg9o25/M4m+v5jpi/2mr7G4V8k
 HBuj/idLJNrO4dHDtzoEzIfz42bjhsc8thffLJg4Oh78PqFQa/vdP8WW9D4z1FBfpVT34WId/4x
 xFd5gZA3djwCOzLD9R49odRbCIy9MxnDJetHKAWOeOn6afur2UGdwWY46aZ5cKLRB497qeoKY3q bgsM64YsLWcdLlA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

It is very useful to find driver implementing compatibles with `git grep
compatible`, so driver should not use defines for that string, even if
this means string will be effectively duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 8cf3b171c599..969dddd3d6fa 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -306,7 +306,7 @@ static void gpio_la_poll_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id gpio_la_poll_of_match[] = {
-	{ .compatible = GPIO_LA_NAME },
+	{ .compatible = "gpio-sloppy-logic-analyzer" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_la_poll_of_match);
-- 
2.45.2

