Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DE91E5B93
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166854; cv=none; b=h8thKxeRbL4+uYk5Of5Zo0H19MhCJOaYEdItBn5WW+CzNWTdHjyahAvRxBWWOZaToUC0Uwv5xc2qXScQLdYd+pzsfzuHCU0aaOmlrrUwG7bsKejA30RcWI8Cj9/bjzf2bXmOl2HzGFIuDi2mmj/G35m4ZMhMi6v/LCUi2zy+qDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166854; c=relaxed/simple;
	bh=TUq2DOTUsyGeAFQFsktbvp0jcp9HEko6lVzJAFmj57U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufxGJA75F8eL97+N4hVoHuWNtjJyywmrbItsmLy069t/wXBj9UmqlZMobF6CDXnljzS/M0TdyepnPR4lte+CAI8FhDzdsu/wFNsEqblQmCjo9PXD+XdX1Tq8hJJWQIsqJDLEcLpg9QMJBhbRLWgp9Y3e3aa4i52bSpm9Ziot5f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bn4r5f9Z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bn4r5f9Z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so2400495e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 23:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746166850; x=1746771650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Otf/iu1Yf9aOcycjfUFRJv+7oQmWkMNHohXscxzbZsM=;
        b=bn4r5f9ZT7QeXwgpGclEuBmr3OWNw/tz6AZS8c/KoLAXAVd01r81VLzF2YH8AF6FpI
         +g4zH37Zh4TbWmFWQkrLpJ3wkDwaGONSevzOBcBFdSXamrOPdCO6zQpPnp3BUDFlhmu6
         yv+MnFYCX8REfmCkwqNSs5ohYbLGF4LwMvDPQ4b8NFrtjoelWK2QD858RCJv124Efv3J
         JhMW2An0Ths0RbCVMFiDxKAHqaQYkiw3wx1Ic4I6U8oxwbycMh2OlUJGo/Y9TrvON0Hu
         824wvvWuFGjlBIS/niEQOi7ChTF61MkfeYCvvuvj6DBnYqnHJPWZR9H3Lk0uYRchkc/v
         aYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746166850; x=1746771650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Otf/iu1Yf9aOcycjfUFRJv+7oQmWkMNHohXscxzbZsM=;
        b=PhYEuyIVOTYf8fHxnepZVq4CJVMZsfbWYDsgiw6wAM7aYxGB5x7zxbF8E2pHqR5rtu
         I5SWxstRP3GTyoKDDaAV9apTokByazODxOgGFf/KTY/4Soy7whJt0WVDFzTqj/Qnx+Sw
         xIYnar+UNx3RjE9MyynT9DqP9Xpy6rjlaIM3Vex/xbXBvmMEGUw302TsAFzBKb9ZFQmF
         2c/Ls7lzgW//+juo5yYqm9i2MnHMcixWeFvxd8KdD4QtlkZ4jdnMsMvtCRmZlMXbZTXy
         q/8dF49zpzHFBsbRqtikMOf3wM8KflG5rV+QmYE7yLSRZeUeXfwNOO1PONiSlAx6319G
         8Rgg==
X-Gm-Message-State: AOJu0YzWtp13jzH+UGQd2jOfxlnXm0p7DDEE3WmFGIb9/h2l+ak901vs
	w8rFmUiQpzdXL1g/kX+C1/yuZQXlnq7aXRZrfiy5WjZNISDeU9OzdTqENP2IIqR5bR13wQ/GCxK
	1
X-Gm-Gg: ASbGncvoteSt7r15GU4g6ziFGIFHDZ52q2AuvXIJ72UWzcj6XXBTHJU+/ZTMH/HEbso
	idAe6I1XURiurfTjz4UmlmU8g7x/i6SCLjrQLUGWuZYKoAyOcUn0Xvx8/Pkz2deZfAFFlJTvI72
	M4z+iwWP8UsDdJtt1nRMXeBRWjdkXuxH4DR6IqHflHRHPWmxDT/p9UglNe7tdKz7LcLsxHpEMnx
	RpBOOmOYq+x4DeEy9QK6PhvgitgFVa2rmQT7s6OaQ1nXnac0mxKhiDXv0fliZ8uYi8XUrucHb2U
	vtKRUQ1c3pDAHqAP0xCc4tqQn8HkS5vSaER6X2T6PG56kqqJZMkM95nugYU=
X-Google-Smtp-Source: AGHT+IEiHsh2Nce1GW5dOD5+VPcV4Zm0BgzwRm3HF37lw7EeV/W0AjtTg+sofOx9KzPgT0WOa2ifpA==
X-Received: by 2002:a5d:59a2:0:b0:39c:30d8:a44 with SMTP id ffacd0b85a97d-3a099ad6aabmr356942f8f.5.1746166850461;
        Thu, 01 May 2025 23:20:50 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17748sm1159725f8f.100.2025.05.01.23.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 23:20:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 02 May 2025 08:20:34 +0200
Subject: [PATCH v3 2/5] cdx: controller: Simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-cdx-clean-v3-2-6aaa5b369fc5@linaro.org>
References: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
In-Reply-To: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TUq2DOTUsyGeAFQFsktbvp0jcp9HEko6lVzJAFmj57U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoFGQ5V9p4oTfT9meaqOEcZ5+P3d04T3AJv9jlT
 JucE6ktr/mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBRkOQAKCRDBN2bmhouD
 14QnEACXm3r2ZWvYSj9lS6+NUP8s0lMGpLYaSuhwXUV4vF1ltznKEuXFBSmAk4fJ7i7f28NeoN8
 OY3YtdgmbjZuQUI25xwxksTkywQNJAIyEBCxVmFywYHWFAPwJlkeLfyM4cSiri9BvRMhWt5rkPc
 D/peQV3XuCFkwXO6eM/6IPew/k5qDV0PfMikdFDl2swdYaEWg8ILn9CiNE6s3zRucfx5fITJqXa
 FR2o+pbCW36DkInB1VX7ejvPg8UMRQIP1AyIVDNeP/5vmE7NOmvhnc8blcuybrsX5VVE8v9dZLa
 jX/yZLCu8k7gfG6RpbyQs6hOljLUeBZ30dth5sDcQPeK+ZLju0XIRWa1p44GO9DtdggCAn1kK3D
 8OWN59fpADzR3fU73xa14ynqjVbuaPMRK9kZagXafu3bSUpa6RIQFlwAIr83YIAjQPko/L1JbfJ
 bPmy+WNMN4oDxWEG8Kbg7o2JCQ8XkGuL1WYGn26hB+7dmoBVJ2FNdUXW0FstBQJDU5MnbgZbEp1
 1Zpjc7vxyxb3qHHzVcFYXgcpn1Uju7+FLc7Ac87r1yS43zE8J3h0jH4JewbN90gQEmTPTVxDGft
 B+YXiLic8EPBqo4xsepcNLmqr3FqOFmSp5Q6GcxX2upUartTT8j/7nVX4or4aTCujr95MrgU6to
 n9xyx+hzLbvGv+g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify printing probe failures and handling deferred probe with
dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/controller/cdx_controller.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index d623f9c7517a86c06082c0db348688e7f33b7be6..3df35833f0e0a994af0606eee0dc1dfc9c7c22f9 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -195,15 +195,13 @@ static int xlnx_cdx_probe(struct platform_device *pdev)
 	/* Create MSI domain */
 	cdx->msi_domain = cdx_msi_domain_init(&pdev->dev);
 	if (!cdx->msi_domain) {
-		dev_err(&pdev->dev, "cdx_msi_domain_init() failed");
-		ret = -ENODEV;
+		ret = dev_err_probe(&pdev->dev, -ENODEV, "cdx_msi_domain_init() failed");
 		goto cdx_msi_fail;
 	}
 
 	ret = cdx_setup_rpmsg(pdev);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to register CDX RPMsg transport\n");
+		dev_err_probe(&pdev->dev, ret, "Failed to register CDX RPMsg transport\n");
 		goto cdx_rpmsg_fail;
 	}
 

-- 
2.45.2

