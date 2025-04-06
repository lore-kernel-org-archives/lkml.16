Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83066218584
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969037; cv=none; b=nQKIQwtXFGMA3wLKbO92JvgOzsYynsZRwfb+qpNY70Zd5831ZLnDzGv5FLuOUtUHnSwW/o8aWSz7NE2Y3MymMWbRxj3lq6jXyzmlYavhdY+oW01YbOnR8hnZqV61QZ0m6rl6bGbO+BsBjSx8aMkHpVwiDUuaIFEI1PvUjPrVrLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969037; c=relaxed/simple;
	bh=JGGWrG4absQUDWmRbcKC4qXfgvzU72WUJzF0YeEqSjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qE4LhM9mcaAKZNh5sIMz+HhrSsLaGN+4klftqbris3GLzO4HID7sLsfc4pKC7fZdLltSzQjy+SCz4dHiIKd1JLYd4havByJ7o088jy6sXvW8BAQk5ZCH7IOqbHjQks8HJHXUC1SZz3ITVHJQVLFUapVX3fnY4s7OhvtS9H3TVZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZdYI48t; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZdYI48t"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so3217795e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969034; x=1744573834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6V7osuV6lovwu0xN384fR/yvO6h1FfTw5XdE2hnaBMI=;
        b=mZdYI48t3V22asfGDRK9Pl5/ic7LEjlyZyqSPcfFF8gILgNCpFajKXCawf6NjrkHmG
         rj0JpWtw76bf9mFC6Xhn0SVFBgX2rtIkivpQTfVguWGym4Y2neprwThoQUkkUdhzMt6s
         MR+xPAz4fF6FPGdOTaeZBSwAm1waD5PheRI2dOW24cgkozAgwURS8qNiaQ810UwMY+W9
         fI8jzGPXktM0PaSUbT62WLFsMfvaCEG7vl3+XkO8WTwxlEfF4IJ22h9QFSOHrSvy2872
         NS7P2AjeYvog90w3EzEa/M/uhQfUWVAupGsOrXNHHOAa9YPSpEzqzJ7VoGqJtzeKUQ3s
         pjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969034; x=1744573834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V7osuV6lovwu0xN384fR/yvO6h1FfTw5XdE2hnaBMI=;
        b=n8AFYXrcHjWHaZAtiSMborBet2YJb6ubaEj2IKMXOi2GFvyHL+4otnYbt/gCbt3EhZ
         ztFTzf2PsivRYvgL1jzyrI15OwdAp6fA5ILExinHcsZJJfZVKjlZx8JWfIured1/UjAE
         K+CCzN7STNW1DN0Wn8ecYGIinAedFOxlGrejghRiv/gJLIo18aYn3QBK7PKEZAsNjx6Y
         cunBEuv+yf+L66/UKqE4eYD8IsK2dvLGp6PLaOGJEoNuGNN3amhlos8tTQxvyqJAq4gJ
         NuW18dW5vCI2v81MN1B7a+QOZRv6eDqqIZ6jNY1MJ8Ch9+GVQiayLuGaoGd8PEXqe+vO
         IkZQ==
X-Gm-Message-State: AOJu0Yw2KZsXtLEpS86jvQEZGXK1YV65ZBFxP6Mm0OKRmsUNUXko36lD
	Y5EtWS2Uf+XIaimefj6eqbgFmzZMOTesWhHNPFCTMYgspc5bUDNB/MFllJjm2qw=
X-Gm-Gg: ASbGncvQJ5NhthAbybWA14pZrej8wKBGfWPK1xRW7dKwwRRA8QqoGHqSMlxe2C2+M/I
	QEBV3JYbqG7EW3Bi/9TMdp/WQQaVw5vFn+cT5LMCuFDdwX9FjgA4mn1tLkT20PwtHkHbPg/MfaD
	5EKq7xnuv+UYhgKWcIptj1BKIfL+JMPvI4FlJ1ZZaMmMT2uPyF7WE1gJ64quT+mr7yrieB43R0b
	BF0XkQro7W2N9hINZHQIlKrIN6u8sYiW2UL656vAi+y68ecahKb+HZ2D8qLezZDRyGG7vzoo0+Q
	yAhFMf7cjjaRbHKKgqw0RedMskRhm+sfzP7l93qUqHXTFTSFQpCVjTkb7za19ts=
X-Google-Smtp-Source: AGHT+IGgzNK2npnlRNa+wPYD4/voMS34S6t/YpwmY2KhFc8g7SgC0GLpOsJxH1fI5JY5ItovfSkDAA==
X-Received: by 2002:a5d:59ac:0:b0:391:2a9a:47a6 with SMTP id ffacd0b85a97d-39cb3595265mr3076887f8f.4.1743969033715;
        Sun, 06 Apr 2025 12:50:33 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm10053842f8f.43.2025.04.06.12.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:50:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 21:50:13 +0200
Subject: [PATCH 5/8] mfd: max77705: Fix wakeup source leaks on device
 unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-mfd-device-wakekup-leak-v1-5-318e14bdba0a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=810;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JGGWrG4absQUDWmRbcKC4qXfgvzU72WUJzF0YeEqSjc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8tr5H5hFgsx7YapzOJe/iMliWoB0ayQn2moZK
 T4gYym7oxKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/La+QAKCRDBN2bmhouD
 17RJD/98Z5aTZjNuITrUPDHZaMEx/JdRNkIfLvJ5ErWEr/bWhuoqlmLUb01B/5FGEdNcfA8AXBB
 Y3axWMt+mob9U7FDmqQlpCyRb8OwYun4twwoFsMhaksJ7gZ9l2rwxSwfkgRA+3xzanjZVxbu+15
 DcX54i72iRLw+wB2Sinl7kHj8of1v0pbdUnZyKK9oZA++US7AE9b8G3VN91aPOBmflRQMLOQAqW
 qPC4dPTvIdgbw/R0h+ckmUnQCpM+QQEAUQRuLpJpHhM++lAK0cy64+TmjG7/HCXyq9RpUeaou7A
 P4bV7y0q64n6H1tSxyd3nOfVS6mvOnrxutnRnsWsKsbF3Ubncss7GXs6ccVrI87OFRs2mrlXmDi
 2T1gwmpzNf97fSGv8iL1NfcuBfTZoIGLvrN7ARoqH9R4pGPiQUr8GIjwNXiTcEOC8aFPyENsI1U
 kAiTF0mhgDHsZcB8in45OZQLgzkcMSDe6bYzErvuViNGdYJHcCNW6W4cL8Br4Qr6q49NfnXFfUO
 L87YB7u+M+rNYhlNKau6vQbo9XP/70WE493fZey/7Y7qEQp427LsVuRJPCkfQgCrY85hwGBMwfE
 bzee13woXUu8R9Qp9gVqism7dNOLxZmqjdTtF10CMTiucvUimJpjacJd/r66mMeplithOMGkHUy
 Y2s6kublX5R/1bw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/max77705.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/max77705.c b/drivers/mfd/max77705.c
index 60c457c21d952c2ad485f29619e014f5b85a2087..6b263bacb8c28d980e890777452db58be84d7338 100644
--- a/drivers/mfd/max77705.c
+++ b/drivers/mfd/max77705.c
@@ -131,7 +131,9 @@ static int max77705_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register child devices\n");
 
-	device_init_wakeup(dev, true);
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init wakeup\n");
 
 	return 0;
 }

-- 
2.45.2

