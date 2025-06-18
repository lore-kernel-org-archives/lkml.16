Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C442F20D509
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234889; cv=none; b=M2hhhYsVetS/3mGWSBjoTax8prAOHwB6S5qTw423DHaYP42fVh0A3IJ1MVhw1sx8HYBxf8z9VWGzn+fOUwcXEln0leata9wdImsDjpuFiPQ6dnrED614dn8w8JsUU1rML6YMmN4Kfxjt48UTjDr8X8JyM1in+KroS2mSZSL9mMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234889; c=relaxed/simple;
	bh=BoIWg++c+gaXFI+EoWnKgSHte0WWbA8yMuwRuOldCbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKNI032n3c4hNf8PP4zfdVFxrjKtAhcyW7mJiOStpQmofha2PtQaniRUHb6nZ//VjkKltC4bQ8Hj6jSqneUXiZVtNKxZn+YqfOmen8sVoRumh/H2AyVmPD1VGqMEjzpEZ7qvt5Ckv6HF2xjt/790etlelkdY/yNDoG4nSk78zKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Mtolg+jX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Mtolg+jX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a54700a46eso4191496f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750234886; x=1750839686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZ5scaCVp5KEqpX+ht0jMpyjJqTR7FlxiD0v3xWbRwM=;
        b=Mtolg+jXhPFYgGGvBFrpw3pPt9ZLAdbVofjFJNql8ADmuzwH0cQQe4/MNe7bM3VMHk
         im/GEZgPGrbCu2BPFLvniP/Q7D3aGFdL1ChXzNtOjfcXyUnSKh7Scm2ZhvWDpeGagyHt
         acLW42tsDpQBV24/WiriHPRUCyD1xQJm83qFSlccssjUa+KN3DIwMPINqnV9u927X+Ff
         AA79pvZPmuO7CVERKQ6fAEGSvNWJg7qAGxfTzemn59NIJ684QyAatqYs/NRoL84jYmpQ
         4Yhrp3LjE7T13mTu8Yf/o8eFBxLCdMpUkoYmfLuJThCEqGAmWFJ8egVKxa0jnssDtkIz
         L/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234886; x=1750839686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZ5scaCVp5KEqpX+ht0jMpyjJqTR7FlxiD0v3xWbRwM=;
        b=MjSTj7Fi0Q7boo+uvd1b3bKiFV6TtK5utWbC2kFrT3yG/DvnGOZQ6SzXkPqy2p6HaA
         ZmRoMLmc6JRM+6DyuYAPn+t33s00DL8+Qsd7andHO45A7piV/kdbFXA0WzRaMFDAAv6H
         J++Nh9G19pTXZES8qUbCNUmAHowbxYx/EAehrhhYyMkhKYi0srBsGropThQn+ue0dxnS
         YikQe8N310kA4t+uC5uqIp4jAk8SwuacV5HyWcHFMAQvQ8/v4+MK0b5fODr8npw3QDFs
         /B8rIdggsazJkDOROwNfRdAviM6N4MAH1op7+TwJR75EdQ1hXGnZ/ES8aiwFTXV9wJuO
         aTpw==
X-Forwarded-Encrypted: i=1; AJvYcCUXxIipy8xt9t/J9gkeFY8lc/FtA8Qjd74/707ZFDp9QgWPKC8ea9+HpAC6ffS3NUvJ/pL8ubD+9ivHVwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkhv+oLKHqulMO+Nkg07lVU5arY3ehkX80fzG6jle6CT82sA0j
	mK7VmLMEg6qXMdnbWRTOqy2xHWDIUDyNFVJQ+H+2cUfojuQgKstcCZS+zW7k7M5sYkk=
X-Gm-Gg: ASbGncstDu9z3pXPMKYt1leIKZp1f4Zg2iNPG9tQBBT1crCVIa91ThsWHQKIH7/0sQg
	4Kthj23Kmv6AtVFohonFDBq7vc28u9pK/L3PhK1Cp12BNx8D4mg4y+ycDdeEOezqH76ZkO56Y2J
	ubicQSbdJJweF0k274oAeUlYCynrxQpInpeisEG3MflqhCRF+xA4A06KtJi/7REsY0cZHPwa9Qv
	gSBCWHlp6hKfqKFA+TopdoJZUbHxfXPL0payBCpV/jvJcTTlvsh8s7o66EYBs+dWQUs/S4S2eoA
	mt2RB47s1VXj1DWdOqs9e4KHOJOJYff70Qum4Pw20CVPzvuYuN1lJmvIM/2vkg==
X-Google-Smtp-Source: AGHT+IFPk9BFd/vAWuocXcPkSq7/gvcXxQNi7IAayr4dvxQB0rDp+2lbpNZPuSLuXz9prs46BK1xLg==
X-Received: by 2002:a05:6000:4025:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a572e6a1e9mr12817093f8f.56.1750234886010;
        Wed, 18 Jun 2025 01:21:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c7csm16437260f8f.50.2025.06.18.01.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:21:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ayush Singh <ayushdevel1325@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] greybus: gb-beagleplay: remove unneeded calls to devm_gpiod_put()
Date: Wed, 18 Jun 2025 10:20:00 +0200
Message-ID: <20250618082000.36039-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gb_fw_init() is only called in this driver's probe() and we abort the
probing if it fails. This means that calling devm_gpiod_put() in error
path is not required as devres will already manage the releasing of the
resources when the device is detached.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/greybus/gb-beagleplay.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index da31f1131afc..1ea48b71a030 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -1041,7 +1041,6 @@ static const struct fw_upload_ops cc1352_bootloader_ops = {
 
 static int gb_fw_init(struct gb_beagleplay *bg)
 {
-	int ret;
 	struct fw_upload *fwl;
 	struct gpio_desc *desc;
 
@@ -1060,29 +1059,17 @@ static int gb_fw_init(struct gb_beagleplay *bg)
 	bg->bootloader_backdoor_gpio = desc;
 
 	desc = devm_gpiod_get(&bg->sd->dev, "reset", GPIOD_IN);
-	if (IS_ERR(desc)) {
-		ret = PTR_ERR(desc);
-		goto free_boot;
-	}
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
 	bg->rst_gpio = desc;
 
 	fwl = firmware_upload_register(THIS_MODULE, &bg->sd->dev, "cc1352p7",
 				       &cc1352_bootloader_ops, bg);
-	if (IS_ERR(fwl)) {
-		ret = PTR_ERR(fwl);
-		goto free_reset;
-	}
+	if (IS_ERR(fwl))
+		return PTR_ERR(fwl);
 	bg->fwl = fwl;
 
 	return 0;
-
-free_reset:
-	devm_gpiod_put(&bg->sd->dev, bg->rst_gpio);
-	bg->rst_gpio = NULL;
-free_boot:
-	devm_gpiod_put(&bg->sd->dev, bg->bootloader_backdoor_gpio);
-	bg->bootloader_backdoor_gpio = NULL;
-	return ret;
 }
 
 static void gb_fw_deinit(struct gb_beagleplay *bg)
-- 
2.48.1

