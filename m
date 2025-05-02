Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B47223706
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166856; cv=none; b=LDVfBb+YypLofGl9XBoWiWoHW+kdIZckimx1HAUGRVgJBj1wX3cyW4NG7KlMDIKkp1O3zx0gBABNB+geA//SufhDynBaxpsk1C4EyC4293kydT4S6r9yThjwbbkSMGN33dlIuQCcdtBqQl9kwK/s+XQ9eidtGu2rslWg+0dOG6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166856; c=relaxed/simple;
	bh=lPWy4bOLyUZ+9BmsblQ+hYim7bIM9SUYPuuB7xK9K0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ParSYzimBHgHD1pLUAQjuG0wYPzpMHr8zwNi11g/4NRIDsBXWSpY0eSIiJ8rjECZesTmevcV6TFxuJs6r5KZwUmSCFQR91PIa89ugPH63taobbfC0vqOyBU5jb4IsL1oNGnikC3PSLlDawRajgfcHeDRLKaUr/ml2zUhhQG5dWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iYLdLXH3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iYLdLXH3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso2233145e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 23:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746166853; x=1746771653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dhEFQGpYf0nHWdlWr5W0WRnazrmSz4hEICnVYSr5qM=;
        b=iYLdLXH3LTmesVOERg9U9ci69xKbIwZ4OIMuD9hdw5/luC/k8JTG+/xbkHT8xDY49X
         g63RhNHUQ0wjNTth642h3lqI3uRCg7/o3Sk590OuvTzS8aTDqLngMVRCzqYy1oBve6OK
         aTATrhy3GIquyRWdUf0h7ag7X9WKTWm41q9K6VX1ZLrU3p5bROcJPHzsryvSJEOzcBG6
         uZ1duEJ4yQ+MJrysWFfDfSVYR7ZK8IoFvxfZsg67TOjR/HulIanpZ7WUtzK2DrXmyu6w
         BkQuIZLpQCLKyaqUAlfdgPpWnGhaNTPtkg2apjI2MT1QjAA9ozOc1IlgVPOACVkzREv2
         9Okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746166853; x=1746771653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dhEFQGpYf0nHWdlWr5W0WRnazrmSz4hEICnVYSr5qM=;
        b=u4DHpVT97tW55SB3CfRqyAIgZdLfxIcbRsPytvGP65iWuNGK4Rb6jDIjGo+OV+UQBd
         LlBszkXsDwE6b22WV+Ajm93m7AC+KAGJ1XASbvdKJ5X7HKrSWs+drV4rZ7kkPg9ocxC1
         UwAQoZxqpglxqH2uROxvypm5dDlKhJdZmEHZhJ26nWJ7waDktZ5xEfTP4OCQSq4DoRnx
         F8bakWiQoILFlTubiSDnQrCqwvjO7uIZY1W5xNY4+ZyFpmf/7bheXxRxLuaX6OB8caJg
         eA4rQOGD934toj6aVAKPgAsAcYPbsOc2oKNh+rUKH+bFHHX7ecUeqEAfNoslBiGfySxW
         1Lqg==
X-Gm-Message-State: AOJu0Yy/0HNeSRc0fD88GDCp9X2RGgSw4ERz3gIDHVUr6Tjf/OiCcvrd
	m0cyDfJ34J6xCh/D6DCk5NP/w7drRl+dYyi4W/j1O31tiHRrLVys5mA9nQ41aIE=
X-Gm-Gg: ASbGncsAuZa7NbjBAlT6D8MsPrqK6BrJZ4LclYokcc/hSnFzGxZUDt9bmVxh5lfeVEX
	GQJfMcbvQ5Ify24DGlR3T9oh34wjsPybekp76xLmEwUAu+djhsKLafzn2bLVMxJfgkkDpauQfeI
	wr5fy+qVctaDSNd5J7YeYVAfjLrYUGJ1zqBrxQ3rUJ/d5/SvOFQGNncv+mm0obLjLLsdtIPY5Z1
	7gLwT+oV+hVrS/S33k6GRFDzU8VV/2rDQcYVodnKXXb4VxFH7q/J/XuqQL/OVop1yj0Gbiaih1P
	Y7JbpB7X6yUYd/tbPwq4DF7hca4C778QTrNpeArxSHFntKeHuU9OhdUd2xw=
X-Google-Smtp-Source: AGHT+IGoIRW9y+H7mV6mt5lFFZP83MTVrzIlAEeK1G4q7+9Hdkkzt+OZunx6M9cU6tIoFpe0G/iTOQ==
X-Received: by 2002:a05:6000:2586:b0:3a0:7a7c:c2cb with SMTP id ffacd0b85a97d-3a099af6261mr312821f8f.16.1746166852757;
        Thu, 01 May 2025 23:20:52 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17748sm1159725f8f.100.2025.05.01.23.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 23:20:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 02 May 2025 08:20:36 +0200
Subject: [PATCH v3 4/5] cdx: controller: Do not open-code
 module_platform_driver()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-cdx-clean-v3-4-6aaa5b369fc5@linaro.org>
References: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
In-Reply-To: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lPWy4bOLyUZ+9BmsblQ+hYim7bIM9SUYPuuB7xK9K0A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoFGQ8tLij2jWL2dxZ7LgTbpEDRoXawkFeNxTls
 MSpwCqy6kWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBRkPAAKCRDBN2bmhouD
 12NoD/9oPluecPNLBM2FQ3cZKM3VEvAr/kR2/tstcyc/zQDxdXd7wKWEbfvxU6guTQLNkPjxDd0
 JCJzSZ7BMbYTR0AKeETADNhBYnDQCPVZXXdIzbj+OSCUloCwBPvJWGpVSlFaxlAvyQKtQxcA9SC
 D8jXk7SMqxCeT9WtVTxGDZjOfUZJs5hYevknl+Rmow08nQEWbNeJzdWshjFzi21zO/mboS0Hqoq
 es9z5TflK89PROxiAhURTgMT1BllAuMW5WICzkIo+M6Iz0LdO/hN45fblWJMlwOlQBVft8vpopC
 BA2DMCga0ZXh0u+Y+O2xJt4LHsJV+YFYn7mkYbt6TWoZWR5S28DSnvUd7Jz+6DOJQgtli+XhFZw
 NRCgnOU3E60oBpi9/3QMHH4twa3rLXuqJoUx0OO0V52mAHKxMHhWD7/tXXCgCKUW16RVN4udOgF
 e06xWCpBn9eFhdjRjrB5opTTzCXqzYbp5yd+LHcCO/k0hzN/ZB18xfMJy5V2Go4oc07qMXq+7Wt
 erF/QuhHEOn/KLyWI7sNzM3Kq5b0YYO3mt0gkO1wC2hHkqZBclSMC6KdWu6uu6BAwsHL0ihHkFc
 2hkspwAZ2aXQUwQRaGbrQQ1lb7Nnw4sy2AHA+xztVnmQVVWPHDLvujkLzAGmVl12ksSzmubhD/G
 vhWQdXpLp12Y8Qg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace standard platform_driver_register() boilerplate with
module_platform_driver() to make code smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/controller/cdx_controller.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index fce90926d3378ae60166426cbf8e4a4fe014af86..bfb5ac2d861f2708214ae28922a7c0cfdcdf5cc6 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -250,24 +250,7 @@ static struct platform_driver cdx_pdriver = {
 	.remove = xlnx_cdx_remove,
 };
 
-static int __init cdx_controller_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&cdx_pdriver);
-	if (ret)
-		pr_err("platform_driver_register() failed: %d\n", ret);
-
-	return ret;
-}
-
-static void __exit cdx_controller_exit(void)
-{
-	platform_driver_unregister(&cdx_pdriver);
-}
-
-module_init(cdx_controller_init);
-module_exit(cdx_controller_exit);
+module_platform_driver(cdx_pdriver);
 
 MODULE_AUTHOR("AMD Inc.");
 MODULE_DESCRIPTION("CDX controller for AMD devices");

-- 
2.45.2

