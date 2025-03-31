Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95842144D5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435620; cv=none; b=TxwOL9T2obpNlTz4L42nJ/eKg3czn9w4tHY/u1s6NXPnfzcmE5hYpwnNpI9lIVAH+cA23QjpZBGWjwugn4vaPfKeJaie75JjBevIxdHDdVhtac0jjUr1+34A9VeOsXbcCtwKe5WjpmXyP3zq8dGqCyJXhua55yxL7Atkii0dKVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435620; c=relaxed/simple;
	bh=M+1g8ftEpQko4NMIJeTSF5w+eL9k8AXGG/D1BvAKllU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AFVBc35FELz2EPxQ8ecc1OD7RicXT2cZ2Yg7MqfXXZ5ZSqx/Gty9VqlKFfn1nwrtK2Q1/svRAKyR32CggfH2dE5SHJRNOvg9lVODhj004bUCqgSLpepp2wwFdwOx5xbAmu/AfyLqQgte2kpO16cYwjCKwfSYxrgwR+KhQnBUjdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyDPB3Gh; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyDPB3Gh"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-22409077c06so126384475ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435617; x=1744040417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XsAGRyWXlsCCSCYWQ6bHWQzVmNAffE9jxkExONXDaSk=;
        b=TyDPB3GhY8kVFsgpVeb1QyvbgjmwKsDdHmHrYstSlHc/3bjSwkJbdx76PXVIjjakn1
         KwGaXJn1/+K4vdko5uMb/OJgxE+tY658Cl3bkNXqAbMwfBKiTooQBTqwhpvYFfipUKly
         E/nO/P0ITOemdWtC8rfDAuTP2MWmWhlycucDvvJIA8EVB2oohhO7pBzd03Y40E85WLgT
         ErpCKKeSIdXgvDcslmkfm1MCGA5JkBnB5Klt4yLxosNpBVRDkvn9U+6HWBOgKX0Sx+ZI
         q6/LAfSs9CKb+xULXHjPYcwaiyxiKkszSWMFjutAjm5gP2adVNCOmiN40Z1AA+cKKimS
         hePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435617; x=1744040417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsAGRyWXlsCCSCYWQ6bHWQzVmNAffE9jxkExONXDaSk=;
        b=Lqy7atylBfNzkzaMPWhQQEiWdgEEJuRhSpdYKNLc4M97yLU2P9LhCbc53uD0Jw36xl
         BGketxN26OsvtQPQLvZhLuR3NLpVha0rLji7gs/A7ZNqRbN/9qMbDpImpP2oIAEgsiPB
         ImtnUPnYnkBEwBukUHJTglvFsQ2llE6JirS5nbKqVuunhXi94UocGW24LpEtairfnIW9
         acTEW4vFXxvEs04Of9xHdwEB0bT/tz5B28/h5BDoZFIo/xtbuYpiWlQTlg+rrP8qn+I/
         cM+3pheV5aDVfW4LFQsnc736WN8CFO86P3xHIFMX8fxP+imP2iHcnjngr/MF8xShcSIJ
         p3cw==
X-Forwarded-Encrypted: i=1; AJvYcCV3lZiylbQ9ANbNdq75dnXljgK2ivWOahITlez/93KKSMS1rg46oi4bi1odE61pV8rYyIsEu/7gWl/CDTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZpBX8XTBJwFMhv98hYNARvtSkmYfAWp/0XGrDbiM9t9cQEAn9
	Pq8yop60+0dzevLyUOKJoMW84rUBnpd4kjWOtIlSN56WrSXO3HHL
X-Gm-Gg: ASbGncvS1Z2wrAp27jUhyv49pLvRuHjwnAW6ydkp2vPanVurKuzSorGp0gaoYhfHnHJ
	1hY7bhsWrTnQZ8hPd7YC4es640Wg24foQUZodB1MEyYfq8BC7eWyrV+DY9/YR2u5rwe/T5b+PyE
	bRsvUg2S9LnP4iGx1VWEg/8giTGnDEWvcF1hi6po2Q6bjM4d7xAXvYFbMYp4bFs1NAR905uClX9
	ofpn1kPnFJb/t10HfM7xac83qHZ4izIjCPn3juFA3qWou8X8TAtgXDQIBYYqfNbgWFNsDjHRhzy
	2YDRz9EDAKsjocI5kCa/hykWR4/Zi7NePaR61inNlhtiW55lePy0aqwPZWaUV2YAGlIu7dA=
X-Google-Smtp-Source: AGHT+IHSO1Ey1kpUT8XPplPoBZfv20w+evu2v0hemvn7yrxYUmFkPgnracA41hSVN0cDgqnpaIbOJg==
X-Received: by 2002:a17:903:1a05:b0:223:619e:71da with SMTP id d9443c01a7336-2292fa1acb2mr167510495ad.49.1743435616821;
        Mon, 31 Mar 2025 08:40:16 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2293648e525sm44573135ad.32.2025.03.31.08.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:40:16 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	bsdhenrymartin@gmail.com,
	gsomlo@gmail.com,
	arnd@arndb.de,
	u.kleine-koenig@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drivers/misc: Add NULL check in aspeed_lpc_enable_snoop
Date: Mon, 31 Mar 2025 23:40:02 +0800
Message-Id: <20250331154002.14128-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL if memory allocation fails. Currently,
aspeed_lpc_enable_snoop() does not check for this case, leading to a NULL
pointer dereference.

The corrected code adds error checking and optimizes resource release logic
to ensure no memory or kernel resources are leaked in case of failure.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V2 -> V3: The enhanced code introduces proper error handling and
improves resource cleanup mechanisms to prevent memory or kernel
resource leaks during failure scenarios.
V1 -> V2: Removed blank line between tags.

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..b79365a34baa 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,11 +200,16 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name) {
+		rc = -ENOMEM;
+		goto err_free_fifo;
+	}
+
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
 	if (rc)
-		return rc;
+		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
 	switch (channel) {
@@ -221,7 +226,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		hicrb_en = HICRB_ENSNP1D;
 		break;
 	default:
-		return -EINVAL;
+		rc = -EINVAL;
+		goto err_misc_deregister;
 	}
 
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
@@ -232,6 +238,12 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				hicrb_en, hicrb_en);
 
 	return rc;
+
+err_misc_deregister:
+	misc_deregister(&lpc_snoop->chan[channel].miscdev);
+err_free_fifo:
+	kfifo_free(&lpc_snoop->chan[channel].fifo);
+	return rc;
 }
 
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
-- 
2.34.1

