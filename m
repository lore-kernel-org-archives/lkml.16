Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21812E336E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743478792; cv=none; b=ujiugi6pw9fXugFsv4F2qBGYG3vfATi4h/uJ7LZDSE6tOGtjCvBlSUnWAYGyQlUZCoNOg5f2W4crK6Rf2e+TzJTWXvQ1u2yiddh9cIGRqQDy+Z+zFExhkOTjE/ScHbJ1ff4vRRnU0d5tonyAetx3ZY8kMSdkhJLkfUJORipHguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743478792; c=relaxed/simple;
	bh=EJl5HVzorqFKi6qYbHW2amcnsJEs1KJivvPaBr204wQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q7yDX0PKBZS6lU5raJjqYHdm7WoldJ+ImNTJNeLxUGjmVoJQZf2AyfflaKiC8jB2znnPfT07ALFTy4AoVVQS9wTDRHBsCNmBIQec8JeVFhGz1IzZk0kSOtSPsCXlcOjfLQZd0GLyrSydXySBlVzyVkXWYTp0nfvRRkZtnd51WY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyoLMdgJ; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyoLMdgJ"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-226185948ffso98718465ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743478790; x=1744083590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFYh5M0fsDdvGMhmL2V0U6mTiiJF12cIZfzIb8uL/7Y=;
        b=WyoLMdgJrRyk4p3XvTNsHmQSJPituV0S1m2TYZU4p44S6HwaYmzHBI1KM9R+Ks9u9w
         h/uySoZdf/MnR8vA/zrRCHjs35LfwyI1HsbEvOTC4DumzQNVnGHZGD/MyCE93XSrJoHd
         usdSQ4j2vjDPjudzX6aF3QFVmbFWFeNtFC/9wyhwzkDJUkv9RQ57nBHDgSQw1MFkYwM3
         nc0+hsVa4OLAcC2MS92angKhszNV1SBYj1zVQXdJr2fk+29IrV6RyFJ8F3xNy1dm1yzG
         mC6CypES3YzBnHouojk3EZEUW4NcYlN5gdRlxPGb5bjJf9gBniWZ97Kjo1hHNZEUV7Ba
         X7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743478790; x=1744083590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFYh5M0fsDdvGMhmL2V0U6mTiiJF12cIZfzIb8uL/7Y=;
        b=mwamPJ/ZrOH8Bv+5ZQG3eD+ARqblD6RFi5uNx1tgwvdeR+cYaQDaX8pxW/C6ZYe0Fw
         jRjfpYLVhhzOo4la4QBxypzyiHg2LC6DPizsk86V5uNiSyxSBxMfuZzhObgcvBIqi4Va
         wLSPuDLhX6eeiRg9PaiBTqif8Kq3kgZueoVu/DUNQFE+OXRp/4mExj6CrTAWiQTKTXeN
         Pq2u6+t8/2bKVAiXfXEe0ofNHIz7uCt3/AnvscwzFusyJPRI1vxJjjIqSPnNhC5AZcxG
         TNEAlBmGp7awQPWrQZIjBX7bJKTfhy2YeGfHavP66FDp2ielcvb8pWwY/1FBfA7AQqDs
         /oTg==
X-Forwarded-Encrypted: i=1; AJvYcCWkfdH3mzunkr25t1sS+Bx7emNyWplNNgEoeT/7RdJeitqrSRccWaFQmOoS1DgDfNW1uJCEBLpB3ZkC62k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyenX+VmpDyy3a5KuDP959Ti+b1nl1+9BkAw4DaGP1qWHaO1+4n
	odp8I8+WoESzxQGUHjZ4K9gQCjhQ/6jSn9DrdjgkXIWySpRZ5p7N
X-Gm-Gg: ASbGncuGG2D14vq90AL7qm3conCx1MHwt3YTnzwi4oj8a6C9yIcSNDe9X/ydLUVVJrI
	unHn92DyJj6TohdNmsodDzBMcIPFiDbUivbi2HrwthnYdm2mVL0AIv5yV9aVSOQqdj+EIeNNnEh
	ZwXq7hob07a8jZvtUXIQxEM9ThsPhLt41GAnMpILVUNs2YEyACCTdL7rxWPaEwJkPrvW/LsnmMm
	rNDPtWUNYVOtGAsdSZAWnKSP/e/A2DJFIjFy+gMY3aE2Jc7/KQYymPY7byA/2upb1zya2Tbx35t
	C0/zws7sVI92XsUuKb68N1AMJa13XTqyxtZ0F9R/MjYA5vlSzd8XqOYHF1moDPhTg7VTCEs=
X-Google-Smtp-Source: AGHT+IGT8jkNO5+IfXQCLnbfYUK9R0hC9L7cWhycJGTtXws06galosA23s3dNcxmybY3RaYeogb7zw==
X-Received: by 2002:a17:902:eb83:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-2292f8968e9mr195477775ad.0.1743478789870;
        Mon, 31 Mar 2025 20:39:49 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedcedesm77958805ad.67.2025.03.31.20.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 20:39:49 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	u.kleine-koenig@baylibre.com,
	andersson@kernel.org,
	arnd@arndb.de,
	herve.codina@bootlin.com,
	bsdhenrymartin@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drivers/misc: Add NULL check in aspeed_lpc_enable_snoop
Date: Tue,  1 Apr 2025 11:39:35 +0800
Message-Id: <20250401033935.17617-1-bsdhenrymartin@gmail.com>
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

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V2 -> V3: Simplify the arrary access and correct commit message.
V1 -> V2: Removed blank line between tags.

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 35 ++++++++++++++++++---------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..25ebecd14103 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -189,22 +189,28 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
 	const struct aspeed_lpc_snoop_model_data *model_data =
 		of_device_get_match_data(dev);
+	struct aspeed_lpc_snoop_channel *snoop_chan = &lpc_snoop->chan[channel];
+	struct miscdevice *mdev = &snoop_chan->miscdev;
+
+	init_waitqueue_head(&snoop_chan->wq);
 
-	init_waitqueue_head(&lpc_snoop->chan[channel].wq);
 	/* Create FIFO datastructure */
-	rc = kfifo_alloc(&lpc_snoop->chan[channel].fifo,
-			 SNOOP_FIFO_SIZE, GFP_KERNEL);
+	rc = kfifo_alloc(&snoop_chan->fifo, SNOOP_FIFO_SIZE, GFP_KERNEL);
 	if (rc)
 		return rc;
 
-	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
-	lpc_snoop->chan[channel].miscdev.name =
-		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
-	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
-	lpc_snoop->chan[channel].miscdev.parent = dev;
-	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
+	mdev->minor = MISC_DYNAMIC_MINOR;
+	mdev->name = devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!mdev->name) {
+		rc = -ENOMEM;
+		goto err_free_fifo;
+	}
+
+	mdev->fops = &snoop_fops;
+	mdev->parent = dev;
+	rc = misc_register(mdev);
 	if (rc)
-		return rc;
+		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
 	switch (channel) {
@@ -221,7 +227,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		hicrb_en = HICRB_ENSNP1D;
 		break;
 	default:
-		return -EINVAL;
+		rc = -EINVAL;
+		goto err_misc_deregister;
 	}
 
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
@@ -232,6 +239,12 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				hicrb_en, hicrb_en);
 
 	return rc;
+
+err_misc_deregister:
+	misc_deregister(mdev);
+err_free_fifo:
+	kfifo_free(&snoop_chan->fifo);
+	return rc;
 }
 
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
-- 
2.34.1

