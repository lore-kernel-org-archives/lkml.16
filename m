Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E622F1ACEDE
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969033; cv=none; b=Cg/sYFpslAQgiaedD5pH22pMSUAgd1uFVi6F6+umuKXHCLD3mh/GCrTBYCgPhQWBS5KWItDEQO6dGPPX4ERsH9WQOxjePn3YYpJM3JwH5md/vTPjt83Sv3kAWaMzS3RwIV79XQ7RtmbkSxGbIeOVAHPm1dIE2+JyVazR6JLEKkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969033; c=relaxed/simple;
	bh=7E3lHXVCsgJOkQ7AaPEKNlLTmxxbGsbpfYEKauuK9hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFP75WOokBnCvsM2Y3qqZkxCnriTWXQcNwy88GJ88+uZX28X7+DHIBEDCqwGK2XxddmQDdwbj6vF8XcSNJgASRRrjbNL/UtQHqhvWmsbqgXbb7ZQFi6WGWV264nJGbg/ngXQ6f7ZgBmCeGQ1Fw6xLHcjHs240jVyifpwgojtOKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/NHdnbd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/NHdnbd"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39973c72e8cso400091f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969030; x=1744573830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VR97euHE162ApOlfxWuhoAZeFnhz9Q18WWSjNJsmRcQ=;
        b=A/NHdnbditwDch8uCa9jbR2tnHEbVteQ3oBNr9ktgflABJNFU1UvqbwVmIHM1EOd9N
         9FjD0t7009TACnVcWCTtTchSF+4roU6uz/ANDjdj1WHXIVEsPnO7mZe1alGN6C7Go/KV
         Vc0FxuGhHNnscc5S+YI7sJOxeWvmzXK9PpHHno3zizE2MI9zfeL8Dd/GH7TapcHVk4y9
         xuSoOiCFLEmaRpWppAGnscbY9+9e6NGDPrzmQpxtUUpcWtOzo5rLoz2l6nGnhOQgCuqT
         U/NophUNsIXA4zjA4cg1IkfyQzPa2ngixJO+GLtpZ+q7oVloOAfWw6Jz39gc2S/w20+O
         5JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969030; x=1744573830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR97euHE162ApOlfxWuhoAZeFnhz9Q18WWSjNJsmRcQ=;
        b=MUACwBMWzf3FqNu2iW2V1Y2DJg1go2FwJvvQ6UB0JBocWVm2ljVsQzDFVnAaV5O4sm
         q5CHu2KFmzmT2EuHfus7bwjC90XW9wVrjTSoZe997teOpEcEndrKEkWFC0lh4LnUWjx+
         ovwgHlWNmCJzQwPtSJU2QSZNpttbfHV9DsgtGOmAtFEciHQNfZRHzDC2jCA1g50dCH6v
         Jm5WQvTRNoyeKDo0oTCG2BVV0CLiwO1xjeMJmlr1nkekZpxUOQk0QWIdo9gVRVchSFyq
         SWz3kvUyZ2KUZQYMFR055/OnlWKvk+xKbab66Vs8D2fFDRIDBHYCvscply7tFATDXb14
         pX9Q==
X-Gm-Message-State: AOJu0Yx/e1otX2zJQVLGwr6vxQICKkMgIv+GmWZYPwceYrJ1HIQUpcJO
	eb1PTnadnVSyfPkC9j/KTal38pzTYk/29iB9UMqUurtdQwVf+bCQNvDic03z3LlYq8JWt+v7v/X
	4
X-Gm-Gg: ASbGncs9Lk9tWwWpcw7rLfzmK2uwjBbIpTCkWo0gEaCLIVLSAr2MZkkr2VHk6yUQSSg
	l+ohjBjTiPo2hNMzqrrBrKufw71XsQJzzxF2vtlaQ2zONUxAPiABo8CKFgc1AU6qmESCCQLGm8+
	fD7hKxrOm0S0PTOiOdblXnRnwCqk0A1kBQNJ05baMFD/bJZBEDIGFZEVqA7H1DAt4ZF7p7hhSQ1
	z5Pg/mLHtzpU/gdwbDtytdtEbxnj7RA9sCUxssSUWEyThM8ER8klNp+TvZzrd5V8fw1DgwohwDs
	JPx5fQ7r2Owczx44bJ3A+vgcwnn4KoYbW5wYz8XCcYMNNV3Q2yL6G9PizG6i9Vg=
X-Google-Smtp-Source: AGHT+IEtbLNMWw4XaETfOT1ZVrJRsoA6YQ4JX3rCVHW3wWScVhJbyysTJPCmndulqnls/c6HijzdPw==
X-Received: by 2002:a05:600c:45d0:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-43ecf57e769mr34648875e9.0.1743969030323;
        Sun, 06 Apr 2025 12:50:30 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm10053842f8f.43.2025.04.06.12.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:50:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 21:50:11 +0200
Subject: [PATCH 3/8] mfd: max14577: Fix wakeup source leaks on device
 unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-mfd-device-wakekup-leak-v1-3-318e14bdba0a@linaro.org>
References: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
In-Reply-To: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7E3lHXVCsgJOkQ7AaPEKNlLTmxxbGsbpfYEKauuK9hk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8tr3ROW9QB8peMNUt0PvVNsXHegREeVqqwtYJ
 RV5ejDG4dmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/La9wAKCRDBN2bmhouD
 13S/D/wPqpX4uT5yfTWz0Gu2YhI1/k6Xhy3CoEseQGJPBNQqkVSIvj2pNNtsG2YsuaYdAhB8e3U
 +5FEco5rUvBuJ8NQOtNzNjHFU2gNei8OUaW8U4aw2meFoaAIjTHZM0z5ZrWKUx5+EBDhfTzJH/M
 PqPWHmXkS/3EtilpaITZpFm7tyF27nMSLTjx3wni9vvYGvtL/eWarscK9lCA+UXrX/oGkuC2MLQ
 aZj/rrrWbjaHcXa8TYmMO8Tw7gHQMx8nMGwojJMqOixni7Gh8whWFaSVt54IoP/itQ1Qz9OF2tg
 H6r3onywTVWs/uUm9LtZYmi9L6zqcqCrlrKKwKsUUQLty9iRwAw2CzJ5FbU65nXkZS64J7awumE
 YmF6YK25RrYN8WIVUDwOtA+03ufB9iEMu4iFvu209zNYVpfGXDEcoTXa+3PNur54bWFZFkA2nxN
 PxC38C/sGPRoonPFT6IL/7rmakrDHI7DPn6lwrdAgXNsrl4ZiAvrTKJKnSzyS8iif5qqwGh0VqV
 tojzupb2rlHCzTc1SXdRo7cj8nopzZTkWvUXHwKHelsCSguBzozL53dh9MFgAf2pBjlKpDlT+nU
 iKPrOuycEmUTK/o2Ety2c3Enf3RPKKMAlOb5j09QxsPVFpOUIzBF2/OOO1qZEoDnTX9OpZGcX+F
 g1NzWNGZPsdJClw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/max14577.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index 6fce79ec2dc64682ef4d85f22d762ec8e2ce1adb..7e7e8af9af224660557e76c2b80d92b05c86d202 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -456,6 +456,7 @@ static void max14577_i2c_remove(struct i2c_client *i2c)
 {
 	struct max14577 *max14577 = i2c_get_clientdata(i2c);
 
+	device_init_wakeup(max14577->dev, false);
 	mfd_remove_devices(max14577->dev);
 	regmap_del_irq_chip(max14577->irq, max14577->irq_data);
 	if (max14577->dev_type == MAXIM_DEVICE_TYPE_MAX77836)

-- 
2.45.2

