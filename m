Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4B828C5B9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916697; cv=none; b=ieRuJ9lb1ciodB1claTgRtWf6eund9/ij4dWLPDIY03ReGT9ZterxTVhnZZDklSUDd6qIWNUNWLTVCyfYmEJvskAOPNLTbrKaAFzn4FWvi0FiLaUwZ7ke9JEC9ttnbhVN3JIF2MN7I7t2Bz54I21HnRMt3rQl4ZvpRTKdHiZ+U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916697; c=relaxed/simple;
	bh=ZLqnNRXBAVw2yotWdLMWiDrIuKC3zLz8bFoRIWISSAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFIHtgC4DhoK25Xr1E9FHc0cUb+jP0Zg/z55T4q3BZUd2hJ67qzFatCubWlSuXboFw+/ZutBbQGzr5+vqhp4iGkNtgcXjRZzSGle7EhMbXeFV7Lf3P1GkojasqA++P7lBt+0rbGjiFVFnn1VQuE+tq4LcBCAwy7w0foZp+yAODk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FVgfckb3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FVgfckb3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c336fcdaaso67471945ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916695; x=1746521495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf1MyA5jv2WhmjchTZbgQeXneBCKmWDUyNLFyQlB0MY=;
        b=FVgfckb3G4qRocEXzpi9VY9rR44o4E6MDwkZS0FuKU68mKed9zDU5TCGT88EHyacpM
         mMz1EjDMimL6S2+/YBfllzipMX/YYp/wIcReav4D5kdFlE33D3x6hJzsyG+8r6rlzGKE
         YyrPmR1JTLR5P4pogZ5FAgsMZiAe/X1NjKgIdB2UYX3fpJvZWq5lb/thQKfHLVeZ35zB
         RM7ZMlOsjX/DQjgaFiwzuBCBObICU9IOLnr03SY+JRPNEGmWlCDzWTo1xZmnVwiDqirG
         YpmADvZyq7v7x3F351NzMJbd51cS+l6o7mn6bQUJ1cL6DpnHXB8FKVCIW5QvqwkoaEnq
         8AUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916695; x=1746521495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jf1MyA5jv2WhmjchTZbgQeXneBCKmWDUyNLFyQlB0MY=;
        b=Y22FVmxWoPAO1a0bBigMUB+WPF9sPKnVuWKbMjEmuOHYYrRYkdeW9ro8C3iFUgCoKw
         KPlqGlCWJAiXZN3tqV25KIEXUcB0OvqY9CL8bsraih+VMflDpMcpCIjyaEeMucNvRZCy
         r96ymFjcpRB6iSXJzQmspmURiUsdgEfdJe/QrnpDwGW+MdJzxtnKSIZx9yJn6qCH7XAJ
         2URdwqFI/LD60/Gmmcz2bxt/4fKGdJPr55b80P0VeZi0q3uAXa/KzLfwumn6LsnQmdWr
         WNPmWfllrz3p1OHDvrc+lDh3GYKwPGwDHaXel/FOYnb6WbIDZaHIxRfLGRnHKrtjs9mR
         R2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMmABOIZ/A+MgkObF0bN2hIwQkdCiyj2zLPoUNloXkkohdWJgkzK0++3QwIkd+ZyoRZl1SE1GzzHbhf9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyfPJVcBkMH6bkaG6LqzNfUzfUH4t1HaMzLxl4gQjgp7EZH5ji
	oVlayWPZTpmLRBHl3tFuCEKor9tGTpKQzlWeNtBMGGJ0J27JywiyvPeQaujN1iE=
X-Gm-Gg: ASbGncuj9jaR0hKIX5Q7BBLhvObsxvEfcTq5oodY4fyfjLczjV2eoJncDQ/Zo1A8Mo7
	SIP1EhHR11v8/NQHQBW5hQcg3u/ylcy8HzZjZ3rUUOHciS6UVmVvW9lnv+xJGtTCByzFZ/M9ag9
	xdbL20Yw3fGsdWKF0dz+NlX4t26wSqus1NFnZ2V9d+bkJtgq+Yly+MqRoPW+FhRhMusGaEi1pd3
	pPJxeXdHl4c0Uj0hqpb/aq+Tvr23t1mgw7N/MxDLPmV5/MswaDR9Igz6BZtlzgaFcaKDXV9FS9D
	GQFfweyr08r6DZStFBCC3FGAxk9qayaFFYlpcZaWhtZ1Do7lOPSRnXOE9eOleHh3qHH0ZcOItSW
	/Blul87PtXFJeptc=
X-Google-Smtp-Source: AGHT+IF/YTb11QJo7KHbzLovwGKhpZslh/Bu4+pqk61lazM/ExJSKXK7osXi8PFQQCc7TGaXhCoayw==
X-Received: by 2002:a17:902:cf07:b0:224:23ab:b88b with SMTP id d9443c01a7336-22de5eca712mr35763465ad.8.1745916695179;
        Tue, 29 Apr 2025 01:51:35 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:34 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 2/6] pwm: pxa: add optional reset control
Date: Tue, 29 Apr 2025 16:50:44 +0800
Message-ID: <20250429085048.1310409-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support optional reset control for the PWM PXA driver.

During the probe, it acquires the reset controller using
devm_reset_control_get_optional_exclusive_deasserted() to get and deassert
the reset controller to enable the PWM channel.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Dropped the addition of a reset_control field to the struct pxa_pwm_chip
    Using a local variable for reset in pwm_probe() instead
v2: No change

 drivers/pwm/pwm-pxa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 430bd6a709e9..f6a862531601 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -25,6 +25,7 @@
 #include <linux/io.h>
 #include <linux/pwm.h>
 #include <linux/of.h>
+#include <linux/reset.h>
 
 #include <asm/div64.h>
 
@@ -160,6 +161,7 @@ static int pwm_probe(struct platform_device *pdev)
 	const struct platform_device_id *id = platform_get_device_id(pdev);
 	struct pwm_chip *chip;
 	struct pxa_pwm_chip *pc;
+	struct reset_control *rst;
 	int ret = 0;
 
 	if (IS_ENABLED(CONFIG_OF) && id == NULL)
@@ -179,6 +181,11 @@ static int pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->clk))
 		return PTR_ERR(pc->clk);
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
+								   NULL);
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
 	chip->ops = &pxa_pwm_ops;
 
 	if (IS_ENABLED(CONFIG_OF))
-- 
2.43.0

