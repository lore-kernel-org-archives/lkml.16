Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F491991C9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970974; cv=none; b=CYGUYLuNdUspyrfx7+4Tb3SIak6Qj5UTvEjI4SyTq07NliEM3yd38/UL4HJU3nQWumu597XSf/kRYQvEEgPlKeQnO2+8wg7tTtgTKGVVBOvFiFvSJXdJryAKTbwuyeikTC04WlNrCNrV9UzuLUDJhocf4ol9wWuCQd/g9gROeHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970974; c=relaxed/simple;
	bh=glJmHiiiisPltSWPE6uKZxk27f/zOlEOf+QIvg7TROg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lc0ChdffK3km/so70RWgoPbJ6QZLHL82frbvVwFXkkLR/qISQaLUXzVLNY+L406CHrfJij3mZ54EfMWdoq8Z5P/i7eE1V03DL2dDrWGsY3O5bzDRMs4Ei6e69HKtRPR1lD6iGBGjQKPVmIvk+HOjHcWH1yweZ1yLXZzfDldbiz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3pFV633; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3pFV633"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso471932f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970970; x=1744575770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vp7a3HYfxPKluhq3571/K1pXx9tBAgWDjXrdUAjk+fw=;
        b=d3pFV633MPbx5cnK9OZG40YGkyvXB42T6nW/aUao9wDDfp6loCNBSvsZuzW9cN9APf
         pqEDpB2zPTAU/1IzaQSKTaShOhg/mKtPYsPIHcEpnIf2SrWQs3l0028gnOZBiusDKjv9
         S55tAAsadOu6qxF99AMdvgkstUAk2N03e31L+O7vx/KCT6z+KkRdcoGEcIEZgefWPgZq
         G+KnMkJtmE4WXMfr1ndzT3lrj5KRmqilp1C6THFb3fM/6Tos0sS6r2pOjq/wPEcs3qD/
         GNbXcQ2JvGWX8jCR3uwThUyhVoWHBaUw2jvBAg2EQxwBHOBD++A0gw+pUjj0qF2wpSmS
         D1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970970; x=1744575770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vp7a3HYfxPKluhq3571/K1pXx9tBAgWDjXrdUAjk+fw=;
        b=SlzctJqd++oztzOkQo+t0uGpUliAfJduzIpcGj+XDcP6H5jTNTVtsw/uvHL/TFeu11
         3tvKF2J5UbcDWovf0dqCslE8/I0x+mgaNuSXXdAxcoNgyKHZ8CocSzwkoQJyHTD1R0Qq
         6LkF0WhzGTWJMkTsym9NSIaljHLCCtI0fA+qi11b6vsQRyHMAVsaskesSeNJPyz1XqoR
         dAfUFTSN4iqi3JBpnPs52txSW0Q+eIJUyx9Z0AvxE4+U32hPF7AcD4RIWx/+FeKJQeUS
         nf/e9fWq9fvY/JOUD+8Ptz+ht3bayP0lQaWdAR3/zLqsQga7sAAIf94pzVdQRofxfo01
         wrsw==
X-Forwarded-Encrypted: i=1; AJvYcCVD87oCi0RF5gqoacRqnm9VWDlY9/ROECyXjXDDgtDeF2nZeRCQvuW9qIXrXOqvRrIupzC4eLOFEjbsf00=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCgqCEyaiFsF/XAoneTZPgwSuARVEHbfRGsZeQuJ0IYVg0WoX
	KRUpfCYk5LH7FGwd0RAuCziJCR1i2qDO0sId3ynyk81B/fE/mWcD8RIGWTX0YyA=
X-Gm-Gg: ASbGncu4y33crIEupBbhAHg5gUlNlgy45OMYsCEE+MMPEAApyYB9ygYFGODEzf96SOR
	pdqECJKLnab4+igJFTk+VFMkEk31Gew9m6/BGA0W0b4TZBkdjepR5GpPuuRj10wQG9SFbraKjq4
	/UdpqzZ/kwFSrIvuQD8F1MYvq5qhalNX3we9NV8CNSXlfFxP3C+FHKtcecIlCaV9ubmQmtINMFO
	aSf9ZvZAsSVcAi6NloGo9Ye8Ou0lLBU6LPLZYDwqaV+QxQAU0XveZl7KlHoHDMZSTSXv+MWE4+n
	zdmG/4ggWJYHd+7iKLwSRnlkVdz01hxumV4JLeSMocsAsc1Xs71abQ==
X-Google-Smtp-Source: AGHT+IE78MK18Cq/sIizJFaorgjRFVFZScT4NJKlc4SDdKfjlcTRgo/XX7XC4hoG4wqkNLZZYxJyuQ==
X-Received: by 2002:a05:6000:2285:b0:394:d0c3:da7a with SMTP id ffacd0b85a97d-39cb35766ddmr2963602f8f.3.1743970969681;
        Sun, 06 Apr 2025 13:22:49 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec147c9dbsm115304655e9.0.2025.04.06.13.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:22:48 -0700 (PDT)
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
Subject: [PATCH 1/2] gpio: mpc8xxx: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:22:44 +0200
Message-ID: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
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
 drivers/gpio/gpio-mpc8xxx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 0cd4c36ae8aa..541517536489 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -410,7 +410,9 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	device_init_wakeup(dev, true);
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init wakeup\n");
 
 	return 0;
 err:
-- 
2.45.2

