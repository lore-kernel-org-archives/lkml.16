Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D57299AAA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771166; cv=none; b=iA4WtpFXm8YKkpRIFp84p5iiz24ri+prH+D6IDfRPn70XHtm9qSCBZhWfWOX6PKDguugtVWRPA/ZqCDZ69oGvDqqdZlSIEonbSehR1pOHXCvhnY3y2vFIFCQxsnKGi2/4AMzh0OHjqnRqeCv/BN/D1JILWFgdy+6w8JKghPT6vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771166; c=relaxed/simple;
	bh=3DcdRVGEsb+ACq/FtQo5TjN05SRc5Vjjh0GYhgt/kns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKG0bAF2vwwIs7lmiyOqmZEYEkqmho8JiDf884TM0d66y0PFnaIoKWNJS7H1S47sJ1/JBTAOHU/YmnaHKM4pcKFQVAwJ9De2UrQk5WtHlPmFnsRPuBr65KrIhhXbaWjeQGpRM2/Mqq3q3CFhfXMIddQL0RFV0BNIC4F/2CJvMTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RK79lqMZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RK79lqMZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d3f72391so48719875e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771163; x=1751375963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tg0mRooHGRn5NykMyH/KV9HEFTTYvVA7Ojb23IHtmak=;
        b=RK79lqMZ7RudwR1jHlCxgOjsQ5gzgPUhX6EFtQsbG5a+DNeX9Brb6onbTzvnBL5n38
         DMhr1iFfkCMn34VG5DOFe41YVmx6LTjryGlwGeFvezCkyy/jnD/j+pG0W92VSap8OFI2
         EIFSKJduQgzxTe5B8U7aPJlZN9XANXC/U0FFOoNDZFeNdFvRGwGETXMrplH7kH4ZBsKI
         jhXu+2Pf+xkroX/8mdZrt4lnoT/k+ER4cjlTo/06hVMhF2fDlD7vlxnbCFAjCiSYkY7o
         QjALxcNAkJzcL6ofZJgjtUJiBVd76UXLWm4VKdRA5TADjwvP59+O6jKPR8aMSWXlqi0V
         besg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771163; x=1751375963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tg0mRooHGRn5NykMyH/KV9HEFTTYvVA7Ojb23IHtmak=;
        b=UJoRuhle3pVaHDAdRm6K+3xpuoxt3xZqgXtAscMnxSOlPcWl3bEIDWJ73DSqG/6WSA
         t3pczUNg2KxHuEwhcPZjIusk8nKikw1ca/w91n8SD25exNuPZx/pBGq5dj6cGS0i6opX
         MauN975SUoG02Bk5Rom0Uq0AGyIt0NPX4Q9cxkHYcdUObKwTIh25SYunruH0Key3FvcM
         YotzrkjL8aVq7thU5dC1WKYbxgtRlp56Af337Z7jQe84HLbNafhe9Q1FvM/PMN0IIo2C
         igCQnUaszOp2FjKAOOatDThvxhl2DHxwjKW+anpwcPnTGmRIiYxyPo4vPigKlh6unmeu
         gFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeBOAJ0QF8IaOnE6510IwJmzl6XraXfdh/WZNPvp+PlUrOZd889VSHV04FEIJX3TDzFkL0sru3anKc4Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQQWwkuVLkDJ8d+vqMeSnyJqjCQRwuERVjmyj+GQxxxbrQGvd
	0VLu+H4jwHlzSMLmX1FDUXbjnl6xRipO9vBr3Pr7cZb4iD2vmKrj9uUQDArRIF5x8WU=
X-Gm-Gg: ASbGncurZVs2Bkpn1RBYGslICwMatoiT+cXlFGSp7IwvSwiXP1VprQ0hoDJxKiX7KUO
	E33LlBSXDmyDAMMQXxrGXZ/mDnEO2wfiX8Uk71URrNtUwLQkbligsZ+t6V9tEeq23qSwN7D4V9f
	A2wH0hc/kVlXmujMmdXQi4n89qYo0GZXvyqXIYScxEZq+WtCK4LxHrkoOIamvpJ2El9arthbpvr
	pre86fAeMF+bP1aJxRYQZNoNzj8myB7NaaUpzJDfilrUGCAuNwPquZXMQU+Hw5AUYgGKkdyKqkv
	LxdxjpE33C48+epscimQbH/suytyD6vvWn9TFTN44C+zIOb8o7IJNOg=
X-Google-Smtp-Source: AGHT+IFqVsUMNkskN7j0iU8FIkymNyWUVdq66py+zAf7HndvvTiiHB1vrcYgqEVFpM7yRp7iDODuOA==
X-Received: by 2002:a05:6000:41c5:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a6d12c4483mr13480483f8f.7.1750771163464;
        Tue, 24 Jun 2025 06:19:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:12 +0200
Subject: [PATCH RFT 1/6] gpio: mmio: drop the big-endian platform device
 variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=z3/zra3kN9nXZTz56dedVkj+298LVjWZ5HQnjkpNGc0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXVTocp2LRJnqJmPhyZdXYqUYB9W1Pi4/38
 +4ka8H0AFeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 cpcbEACbyOXoPzeB9I06bs0F+81Fkjgw+J37W2LT86j5na56S1eXe78vgeUNxpRU1vCPdAPW9BT
 DcEs6ZeYowO9isB+rIP52gU9KIjpkZMce+6zcXuco/dLq/Z8nkcELA6ME2iqRAQaSpXCUg8K1Wu
 3DlGq8jLj1OKsMJm5P9YCfmrSKpfKeFfU0cmjjaJWaQBkuJA1lGDcmWxXI5Kt7Rk5awRVCkOIjR
 TE5aK2FjtBwxWzedg6h6Dv9aPLQkuOTAnS+F9hCwXxJwyK8O5G0PEiXm0TQuXNtntFBJtcNp2b1
 JUJNTO7pl7QJDvUZEfakkWGXM/SMdPBtWLm1LUMssPxlYSTNOJcoM4OKkEa8cyPFMPNhFEh08W/
 yoQUHKJAlg50Z86zhePj0yw8bnWHksDY4EYxW7ZWpkS8spjGmA1Fa/hEThi1kEhAdrEK3uP1adA
 jSZOy79jX/rLGhwtIh74KGqeAk7OdaUVqiGnyRDZGsUzwavHtuu5VCnzJJS2tckOMIM0el6TFwT
 or/WaFvU9MZ8udeIcduADx1B1w5v/bhz0pYU9sQjJgnffWWWVFK7gIGeBJTBLyfbPKJf64SQQhy
 8KrILygqD0RYRRH9oRjFhdFUWP2nZvMfid/q28RjPJkOuEDBQjag/WQhOh9x6XaR3dMaoNkonb5
 yRV1tuWz6xJ3kBg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more users of the "basic-mmio-gpio-be" platform device ID
in the kernel. We can safely drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 08466e123818e958755fe6e7baf5a4e8b8d863c1..ffe6b6f6cc9b1e9341e1c42cf8fee917e0147bf3 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -831,9 +831,6 @@ static const struct platform_device_id bgpio_id_table[] = {
 	{
 		.name		= "basic-mmio-gpio",
 		.driver_data	= 0,
-	}, {
-		.name		= "basic-mmio-gpio-be",
-		.driver_data	= BGPIOF_BIG_ENDIAN,
 	},
 	{ }
 };

-- 
2.48.1

