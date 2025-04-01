Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778BA2F3B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493624; cv=none; b=pVCY243Nxa5i+XnDHmxm7bjxNNM3Z2QxeU6XWaFeKm+fRdeQOvuPFxrW+PTykHqrxIn7qp/jxxBUJ8AvYnvXnDWii/6oqJirm8TRJxzv+qRDVWPRlUfZcNGpkl0KA8AXPZ6xlEO7yXIBK6UpTHMBGUz15PPY0e4lF0pvR3nbWwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493624; c=relaxed/simple;
	bh=BNA6pnBT4GwDo7X7zysViZN7As2tgaZVzyz413BtaXA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PhBoRQA5ca1LmuaPETVhNGv8uLZqa7n6hJPsKd0U4KVezSKWBx1ZOGoVp4BFeyBHcP12sIFSqfB/wmH1fpkAEmqp4FMuR1CTnjLN59sLbIEtQoaZb4NT8bUXPSwO5Tuoj7VS9wUK+n1HGv9GLbMzvMc77nmc8/lQJO+ZLz0CUh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sx7X2gge; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sx7X2gge"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-22438c356c8so102426595ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 00:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743493623; x=1744098423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MOOc99waxVZabi2Ytb5QxIM6jcyNAh7G14JWyJa6TT4=;
        b=Sx7X2ggepYwwclatZGlYzwYyJCaL6WLjcQsWFUqdxXkebKZ5F41bQXd/zxJqjeqPl3
         COqHT0LAdLgHp5WE54QPFp2Pf8U8CY4zB0t5VuSwKobZYSdJjl1ZjrgWZpRPvMSuB9+3
         FFFNktiP29EWyNnkYky6KPdZY5u+oCNM5XeEiDW7hCEr9/4d2kJ1/NsLAOVtCgrpAA3m
         0qnxFOkJBJWkg8ZrabseyJd5pn1lxlyldyE3GeJDf1rrpsmxbkfcCgOJ+m6iWaO0Vl4Y
         kIpLv3e3YMyt0MpM4qM2MLN0+fuZekOGMuDkknSJzIr/D+7fWhLwINNu1MtlWHalwWbz
         aBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743493623; x=1744098423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOOc99waxVZabi2Ytb5QxIM6jcyNAh7G14JWyJa6TT4=;
        b=neXwTlbVLxhsHEBc3qIZWZTaTS8i1BCmr+mvr6RuCsfEVYgcf9Jm19mL6y4X5wtD7a
         Tt2KtOlWHjJXhylvG/lUbeoEzJ/vGyDm+kip9H/8X3uAmT1gJ5Bzo+vIBrbS0asPOUGw
         CceNBaJUl74pnH2gljsLMF1fCCkGoz1YIFIYLjcNC0IApAebbipL5P8yKhrdxDRBO62V
         56Z9NXwCiSbFGlTsAX0EOt9zEIa+6Q08xF+D9wgRQIXxjvM73a1b9f74JTiAhz+hofMz
         u/dIUaUVeGCCXKQuCjLPhK1t3CeMqIVNPBiAD1nVIQhxZcxaz06+7va45wHFQTUGwR+C
         zavA==
X-Forwarded-Encrypted: i=1; AJvYcCWwY4OcraIUjM8eFPCkMN4TYdwOqHSSakWpUMQ3/Un6XIw1U5aJASDK7LHloKqGPrj/ymvi2wrR+N++hyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGIrGei2KAkffQo6TvpclDcF9h9lRF7LWJuIf+A5NisiF5nNeA
	QFhcoICIsUkNFcPy8zn/ufwXGUpx8wOrm8AF8HYazwUeKzdavaAT
X-Gm-Gg: ASbGncv7QMbK4MC4LU3AXJJoG7M2seHO02glpUcygMQDmD57W3I9mypuQ2S7qVb/+ac
	C+SS8fKrzHKfw5chLHKRtkPTzbYN3i3X2PLQG3R0DVZdKUJEH0x7yw1jNZ4skeH9QLCh09dMw1S
	Pwy2PWuy14rFlSdoQRyMxv4d/5dCLbuCr042Xr7mqEkSa781pVVMEiORy4/XtOLYoMnvvbU21Rh
	n/Ij9Si9C8vSNijXPL80u6hds9i4ZoNwaOOgJdcCCF1XOXHzMiau4e4BbyVoJT3soVmoHX7RVmE
	Ni4t6xBDZACr5WnCif8FIO6Bth1HgPSR16kwspz2+UcpQLxq7bxXi8tAxdpfITo7AXnnbhs=
X-Google-Smtp-Source: AGHT+IFZy01sSWuQIVITMC/7GCZ0VOUQ9l5P25t3PEDAJzmDMq/S0RjaavN8GMJVclcwJerUhN7Uuw==
X-Received: by 2002:a05:6a00:a93:b0:730:95a6:375f with SMTP id d2e1a72fcca58-7398033f039mr19324112b3a.3.1743493622478;
        Tue, 01 Apr 2025 00:47:02 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e2a0e2sm8512745b3a.67.2025.04.01.00.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 00:47:02 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	gsomlo@gmail.com,
	heiko@sntech.de,
	arnd@arndb.de,
	herve.codina@bootlin.com,
	andersson@kernel.org,
	u.kleine-koenig@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v4] soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()
Date: Tue,  1 Apr 2025 15:46:47 +0800
Message-Id: <20250401074647.21300-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
aspeed_lpc_enable_snoop() does not check for this case, which results in a
NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 3772e5da4454 ("soc: aspeed: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V3 -> V4: 
- Add proper cleanup when devm_kasprintf() fails
- Ensure kfifo and miscdevice get released on error
V2 -> V3: 
- Simplify the array access and correct commit message.
V1 -> V2: 
- Remove blank line between tags.

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..3e3f178b1226 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,11 +200,15 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name) {
+		rc = -ENOMEM;
+		goto err_free_fifo;
+	}
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
 	if (rc)
-		return rc;
+		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
 	switch (channel) {
@@ -221,7 +225,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		hicrb_en = HICRB_ENSNP1D;
 		break;
 	default:
-		return -EINVAL;
+		rc = -EINVAL;
+		goto err_misc_deregister;
 	}
 
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
@@ -231,6 +236,12 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		regmap_update_bits(lpc_snoop->regmap, HICRB,
 				hicrb_en, hicrb_en);
 
+	return 0;
+
+err_misc_deregister:
+	misc_deregister(&lpc_snoop->chan[channel].miscdev);
+err_free_fifo:
+	kfifo_free(&lpc_snoop->chan[channel].fifo);
 	return rc;
 }
 
-- 
2.34.1

