Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A38231857
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812267; cv=none; b=IixuEcjy6blyHQN1uKzt195w1nRZdJqDPUtL5oPw2JmdW8TzyVLPR6QUQpOaPbnbSRTC2ggkRefpNyP1b6IPfEkjlYBKCbsElmncRsujpaKRYUtgs915RumaJYYGkt39CBpaO0pWVi3zWKKGZXPxccm3GeXWpgXDvLdi73e0IKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812267; c=relaxed/simple;
	bh=SSZC0mitB82FZFU2pushoizPNNrodpz4MhJe+R1PAp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCybA5tXkQRi4A5iVg/cfTDTsdMvFM1PaLtpwuQuqmfElVB7Iia2AxFv47gFjzPcFGBZoCaI42YG+kaD77f3mP8XIPKgmejZC4DUkq69Tuf2WKjR3yoOk7aX2+TR5hAHCSIJ692dYt337p9OlWRn97ICqe7iA/+o9eSRQNVYQUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2mr5M5je; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2mr5M5je"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a35c894313so4101229f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747812264; x=1748417064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tmry+gZIN6Abs3LRmBcQGrKF8Syxq0FRmSnVON+VdA=;
        b=2mr5M5jeCC8x4gYTmVkNGHebWKBBlPLUem4VJlkY97uwDKB4jKsK2JO2htT1qyCHQg
         7eWz3g10iz5D9H0nE1yQtwiyMMiNQkBDBmSLjKpi7gLwCDX5x7FkFg4ToegO3MZTrKTo
         uHJ7kRtLxNP4wPXszpCll77pb3DOQixPwnb3z3im74TjK/PrG3n/CeE64Op6+Jqp8WFi
         BFDT556y9UjTK5UxFIbKUd992Y8P+W/nfl90YUCv27wOwSi1eiR1ZIV+MOWH4aGv1tDj
         b59YxsC7kk2PtlKfNvZJtjs7DROK9r2qIUCeblETd/E9TPwYidPRnCSoPsD+9B6ASu/5
         WEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747812264; x=1748417064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tmry+gZIN6Abs3LRmBcQGrKF8Syxq0FRmSnVON+VdA=;
        b=Gtp1R5cKQ5krfK5SXBSylC4HVZ9WSJEx7Z62cEMSwJNazJpPldJemKuHSRThRkiOAQ
         UrqdudH9MQERieu1baVOW0m9s+dFaGJn9UVGBBj/SGGKLu+8Hy47uvQO7s94FxrT3jxE
         XTm56pNR5K4/A4yTObQ5yT/h9AH4oXjsw9kdDgh7qbKAoiu/Q9xV1T38cwt1+rWbdxab
         mtk/CiY/6UWZCQVldWttpse/mcLPbV+h0rXhU8QWecxj4zQYXSyd4ON2kUvTAw6lmcYQ
         nmpUFRvpoMdWEkf4vAmj2pys9zTj2fNqJGa+i34vljmAuSQDk45wlmF6zU3Xx7YJAHtR
         wObw==
X-Forwarded-Encrypted: i=1; AJvYcCU5J7HMJ8nzdhyv5Fg381s18zw0zSp2towqrwQGRYoNZgmpyNvfLYjuxpxw5fx5iJU6KiclQlQP18y2P4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbNQfo9Sz6gEEM7LvFL47iTW4fC2tEvlCfEKhiTs3A2ROj+oh
	OWwqa71vIrJMZY4EiKCjFob4tq+CeClldVgTcChlMOp59BCYcN06v7wsGuOGq901+UU=
X-Gm-Gg: ASbGncutMDcbbYitkTpXQRdSmrOO2trbAD8CaOZDakdjufO3zCN4QeD8tIyq60qDbUn
	rlnrUDwbULCIIlW5dx9LwMM5Zu3Aim4K5CR7HeS41QhlpV9j78bUoW9yyVWOWhNLeDgVwJ4CAjD
	lgKUwpBKPr0fPNmYp+ecuHKzRGVHLm8asH+kk/FP4zhjVujLq1RcVr+d0usH/qCWfp4uDW0JhXH
	y9QBWYmjWGGIOLTUmQhZpcbbCE0aBoaV0SaYsnYYGiAz/CasEKIAVfgE5eAr1zZQNYmZkEarge2
	t7oe2mRWdlUiF4ZdkWxvosL/Dy5sRA+QbTFu4OcgDrEu8Q/+rsFA
X-Google-Smtp-Source: AGHT+IGyYaRZvMP4i91OpL2d/MEyFpMwzmSlJEKLV5gVV0Yn2UjpOWp3lJXMaKAOj7C3UWJ1TLETDg==
X-Received: by 2002:a05:6000:1a88:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a3659592b3mr12867311f8f.41.1747812263764;
        Wed, 21 May 2025 00:24:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b545:3055:5b24:d6c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a364d2636bsm16188060f8f.99.2025.05.21.00.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 00:24:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Date: Wed, 21 May 2025 09:24:16 +0200
Message-ID: <20250521072416.57505-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.

Fixes: 3f50bb3124d7 ("gpio: davinci: Make irq_chip immutable")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505210606.PudPm5pC-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Another one signalled by the build bot. Peng: if you could go through
the other patches you sent and verify their dependencies are satisfied,
that would be awesome.

 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bbc71cdde9ed6..5bc31b56b5157 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -253,6 +253,7 @@ config GPIO_DAVINCI
 	tristate "TI Davinci/Keystone GPIO support"
 	default y if ARCH_DAVINCI
 	depends on ((ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || ARCH_K3)) || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to enable GPIO support for TI Davinci/Keystone SoCs.
 
-- 
2.48.1

