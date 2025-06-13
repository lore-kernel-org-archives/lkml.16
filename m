Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5D12900B0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749799021; cv=none; b=WKC04xkp6aK78bdRosrXji3xzoYsJM+Od27dF/u9KEzKzcWgMUvLqJMvaTazLMglo3M3ji31PXUnV6GRpbOymKLxcg8uOBFnOvUG0jk1LZ/0iTgFsW2xWknybgNO66AcgfoNW7Xg79edrzb3CAh92s4UxtFvgRt+LSmkd6qy13I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749799021; c=relaxed/simple;
	bh=s7H8hAOu8r6PsF0xyvqZ3QYYYUvxVZaHwOSbxv1Gj8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qHw+66j2s1ccMr/Uenk2q/MFz/cA0SwrkxTlpH5xDlBOOWXk8tBhc5mbPO9L0G3RX5bhIwPeKgOH8ZgYX/ThCjurP19faWg7p1sjVDK5ZO2uuwan4r7hB2SjyEq/Rth4sRJLSR7FuNi7uEYqVx2VEu+/XbqjWKiD8CJCEy+7uvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dhCA2aE/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhCA2aE/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so163788f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749799018; x=1750403818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmM3uzbZnyWX7ZTyVsPhybFQT3KPyRdO9ddniD4WDrg=;
        b=dhCA2aE/1Bns4NAqje1kAy9UQcDDMl3NqX4q/WKh6Q4VjPTb497ofSdgRdrho5EKnU
         gTtSskcNUHbt62U8kUwrHh0c9wk0z9cMIoUqWi9mrmo7YNjLdNyjWBaeq+VgMaKNSQ75
         98mqFeLnDjXWtNoszaJq29yrOj9yQ86H9krklTjJT0gf/RBXzKSFSphBan+uWOYGdtBz
         SLN43AfC9jsYQ5pOw0Mlgd3Ewko4uZ3b8/FCsRjW6sPb5kD6BFX1sk8F4OY153v6eOUa
         tRwIR9AUaPJ8lyaT6xC3Mo32QYNsLIQetTnlPp6OQLVqYidU1s8wgdfvK7AVd85ggyNR
         szeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749799018; x=1750403818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmM3uzbZnyWX7ZTyVsPhybFQT3KPyRdO9ddniD4WDrg=;
        b=RO8Djyd5dfiH9Z9ThmA/FiesTy56y3R5tL2Wugi8U2iVdYkD9kkxZK2fLBqnRnaC1L
         4mYkNYJHhUAsYNtwYsmZmd9p2A0U2fPhVFdDmSs/dcNIAuqBTqSg/GhUcGQyegz/yaQB
         nJS1K8NgkLhyZWSXqN0pqSccT44+8OQWYJ3kWvD/qvSxyujsz+KdyaCdyPb65A3ytxKt
         grSmwSURoFJg/EVM4L5A3HNEN9O7IeH+UFbkASgspC3moyCdjzpUExJC/3zYV1D1fsog
         LnXsOZ6u0JQg7JbPzDLRZIuI+Sli4nQ3whjhkXN2eZOWV1skEGEdnZZ362xlka4J+uyn
         VT/g==
X-Forwarded-Encrypted: i=1; AJvYcCV7h3+LHBZmqMFBmeyBHgvu1IF44x0njCu84gd3KblhbFBj8xUnTJat7c+cF4CyZR/r47/PXcLn6En5Oy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrHYlybcnv8kj3HCFfAKrYEuUU5PHawHAyUnL/J3w6AvDgXb/l
	zeXOrHuuCH82xufs1dgiySP1WmBF4MTrv8Sj9ewcmsgQGogHCyqB5CHwopQE0FLxEhxCiXSvvWa
	X6HI5
X-Gm-Gg: ASbGncuGkpfYkCvOTwghnV1lnl0Xk54flSjuPPsVc06zJs68yJVJq8fw4OxrWdyYEFT
	K6Z7cycySrkZpvo557aznbjWf4AZafPTiadKqgzkzA2tkPC/rvouxN38cdgzicaQyW4qlhOOW+F
	USvL445qBY5rANy5cRR0e30ykHEJh+cezKfptnDEwEdHDrLvUZClKkPLoMIV28G0Bcd10ujQGK9
	3RWa+ciSQOdRku+q9fGw0e+kqj2ILlgV1o3DmnCdMbi7anq2wRfUDmBYyaBUorbVDnlgSxW0+9z
	JbfmtWbADfPu3xSPv26F32wiTE0wukRastLGKjnxXS4eT8eVRcRPEGxn6IEdDDa7SnrUtdG0gg=
	=
X-Google-Smtp-Source: AGHT+IEolEb7tfFX0Bt2Sg7VF+35gzR6nKVWcO4jX4ONIvd6pX3z/jY8SqI9dzduB6tESwjhI8nX3w==
X-Received: by 2002:a05:6000:401f:b0:3a3:7be3:d0f3 with SMTP id ffacd0b85a97d-3a56874a312mr648054f8f.14.1749799017861;
        Fri, 13 Jun 2025 00:16:57 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a72cd3sm1479822f8f.32.2025.06.13.00.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 00:16:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sangwon Jee <jeesw@melfas.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] Input: Fully open-code compatible for grepping
Date: Fri, 13 Jun 2025 09:16:54 +0200
Message-ID: <20250613071653.46809-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=s7H8hAOu8r6PsF0xyvqZ3QYYYUvxVZaHwOSbxv1Gj8Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoS9BldlK1h6nRICmW5g3qvf7r8ym+wnDpkfXeU
 DxMLIRUhMuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEvQZQAKCRDBN2bmhouD
 17BFEACbck70vrGqWZcrG0AXxn9j9xycYF2Hd/YtQ0ckdRj/G65KoOMz9eEuVojxIuZpJg9rkun
 F5lVaneeh34cJ0EEMPHk4w4t7pJ3i82l9rRByG6NOHPk6zYa8zMzo5b5UL7RwM+UREIIrTMU9s5
 7HJMdLfJlVVvGCIVDewunl9XNq6rYTiSun6u07eeyiatuHi6pCPDDkrGa5Q+JkVdakewfss8Itl
 VY7I+pEp9bF9Fysx5i14nTZqeM2rSRAyCIUC0MF9BeHxoZTd+42Gq9xCTLVleugvD8GpyK1ckSV
 jiu3a2yS7nq0/cHly18Pu5ii1jw2WuMyfqGMg1vLnFFVdSZ49zNnUkW2Zj7678gg9WohARn43C8
 VqS2bchHSzvYFDZSkUyzsEi/rUzgEe8C/FRfYtOUn2Xjg/QuPiQrWgU7MqaLB6SV+I+tTbGkxaE
 Qx38u3c05SJXQiLEUcvCOMnyx3NdOnwwZF9+2XOaA2RGhHPThoq7PsFJ8LpZ8P41yN7j7YvUYed
 tJP8mCZSD74SOV+1bMzzFhLPS5/+ajC+Va8igThqg8orZAn7Cf/55XxzoI13B9/JnWz9tZF1/To
 iwdm5wcDGVceIL44FeRitBUulnggd+JenE0/qpniIX2nH3ePMJ/FQXMeQJwtbhrHrmh9ToQPcWo 1W/0EE9IvQs50jw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

It is very useful to find driver implementing compatibles with `git grep
compatible`, so driver should not use defines for that string, even if
this means string will be effectively duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/misc/gpio-beeper.c        | 2 +-
 drivers/input/touchscreen/melfas_mip4.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/gpio-beeper.c b/drivers/input/misc/gpio-beeper.c
index d2d2954e2f79..3d65cb4f4ef3 100644
--- a/drivers/input/misc/gpio-beeper.c
+++ b/drivers/input/misc/gpio-beeper.c
@@ -94,7 +94,7 @@ static int gpio_beeper_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id gpio_beeper_of_match[] = {
-	{ .compatible = BEEPER_MODNAME, },
+	{ .compatible = "gpio-beeper", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_beeper_of_match);
diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index a6946e3d8376..869884219908 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -1554,7 +1554,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(mip4_pm_ops, mip4_suspend, mip4_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id mip4_of_match[] = {
-	{ .compatible = "melfas,"MIP4_DEVICE_NAME, },
+	{ .compatible = "melfas,mip4_ts", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mip4_of_match);
-- 
2.45.2

