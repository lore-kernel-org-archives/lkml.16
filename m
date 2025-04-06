Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72E91A5B8E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743972059; cv=none; b=uywXLmwS6MCBljGhPqRCFEvjUyYIo10V+PZLmiPqvbxDB1ug0UNf1FXlxeP3t8Rr7ftN0iF5ESNXZ65WC9z2Hdogi+FvMJSFWuHKADJSFlNiIoSFAXFaBoAXzeJ/n0IUpCn1+/8Y+oJ4FPJvMak0w2IHmVWG8rEVMFp9Q/ZNhkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743972059; c=relaxed/simple;
	bh=lVCMtD03NGUi1+3/wJh+B38jb8GdFNhjnbe4ZG93O9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPdIyR8c5rNw+9bMPArm52gnMu46p07yYDTCdYngjA4ErhbPNXmdAdtsU93KwWwhFaygarhpsEFqhWSwiPgKdpSfGcLvCQcmCWkh6nSIu5/sjB2/POXGEmJ+y/sGqT5AatSJSpVq4zs9xxKfFoiDuqOgZUKqlR2mQk1FELFSYVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mi6iQWY8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mi6iQWY8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913290f754so449110f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743972056; x=1744576856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qeCppP+Rln/Mksz9KnQhz7mwwvDX1H3vv1ZRST/ETI=;
        b=Mi6iQWY8q55B5rRkT1abuFZHlxllVQD1ddO1cqxeMI5PyQX9hfq8sPsEfQm0c02Kb2
         GwPoS+XG3RKpu+S+C/asg3hSWIF/rZxeQ+UxBtxiu3cxWD+lWZ4A9OAwz+/vS4MiAwgH
         YmLG5pz2KglwOvPVonPal7GTiKgNzoJi9PvEedlPYyDBrMjiHo/nHdJdTUUIn4rDqa/v
         5DOhriO0aoLehljlYYfUKS7A+RBjvsNIh7qkoCrJw/C5ueagdF/IfohzbapjE/Zq26cM
         Ww/LaokW/uQ29ZKpgOp60yUfUpXBQc3/nkkK98bPu4cAOHrdSE72+LcWhrXnXBr7sCQR
         qmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743972056; x=1744576856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qeCppP+Rln/Mksz9KnQhz7mwwvDX1H3vv1ZRST/ETI=;
        b=bFW/4CfWBp+InaVnyvW9eGPvJKcXw3Xrc7hyd1nlAB9yp4M7sXO/wXVjLbje/6hlix
         q8HmwWhLR5s0xXu6hTGwdSJYcdj3sczKqkWBG5zKhmRaAvLO9s/OxbzxIK7QrSKEOv13
         agbRRDEiMi0ZSdgIs1rAaIXHKwEpgQyALJxMW6FMW7TJoY8C+868P9YNdj0f9roaRDCB
         Tpr+OkIvK9cab+TeM/3ml1QT5rigtAZJTNCscvvzNvgmMvRINf3dMNsPjXe7t/cUDIto
         aTVbhfL7qwl2JZzRnDc/2wPzjwhfwkw8570YZqXFfW7jCjOPRW778vHeQdn2kcLj1DK6
         mtTA==
X-Forwarded-Encrypted: i=1; AJvYcCVfYwTAY5zo388wC49PrCRyC24oBGKUB/zSELEhK02f8woeQIVF0bLTAYB0pReZ8oUFKuDffCnaGUYdNm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk1gu4SxFyhJXTH4Pay0A74Jp2pkzObrKd3vD2CZTP8m64MlJ3
	YYBKSknwCKtiiM+f8WrHWT2paCBa2WOycZDfBSoqoIuEH9t/lLXA57jTi5ABNmg=
X-Gm-Gg: ASbGncusRsHgBOVvZL9aRkPnOsU3Txkn4ltoK8uc5i+NcsRpR57jiv5vZC55kxQkquv
	u8bD3OHY9B+Tf1p2I/zGpi2SAtWmsHLl/gyt14I18+W05GoIRTS7+LWtrBUrqFvzE2tzTrAA39r
	pC1VR+UJlMvOB11kdqysenkYAIQ1e5hOeb1IDIiM8xMkzqiMdBqDyDQMJwKjY9+zOVPv9Fu769P
	aSBVR5vKU6+uQLVOFyunwOZhDoLNrxmFBnVmEiJbWBCwKrf58EmVFR7meMvVaZr2WPcD1ve8yxE
	jHJwwNMjPjqM1/hixJmgWh4OZ8YGDrSCEHLDECxci+Ss4GsXDwzqCw==
X-Google-Smtp-Source: AGHT+IFALjZG6RCT3tgEKFB/Q+s6vxmhQDm88jfmYRNHOnoIoO4cH/esD9rNMVN3x+CCKt0zFAUyCQ==
X-Received: by 2002:a05:6000:4009:b0:39c:1258:17d5 with SMTP id ffacd0b85a97d-39cba940fbemr3160203f8f.14.1743972056151;
        Sun, 06 Apr 2025 13:40:56 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0dbesm113167335e9.33.2025.04.06.13.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:40:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] usb: typec: tipd: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:40:51 +0200
Message-ID: <20250406204051.63446-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406204051.63446-1-krzysztof.kozlowski@linaro.org>
References: <20250406204051.63446-1-krzysztof.kozlowski@linaro.org>
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
 drivers/usb/typec/tipd/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 7ee721a877c1..dcf141ada078 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1431,7 +1431,7 @@ static int tps6598x_probe(struct i2c_client *client)
 
 	tps->wakeup = device_property_read_bool(tps->dev, "wakeup-source");
 	if (tps->wakeup && client->irq) {
-		device_init_wakeup(&client->dev, true);
+		devm_device_init_wakeup(&client->dev);
 		enable_irq_wake(client->irq);
 	}
 
-- 
2.45.2

