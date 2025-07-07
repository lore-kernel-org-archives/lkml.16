Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028F029B782
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897602; cv=none; b=XBODALj7V2DHHByZu0VNq8sCYNeiMSFRl+R4STaAUhN/PpR0k8aVVt4AOx5hd5vQHbJwflOpLLT3adlvWhlJsSZJ8fYq7aKdmKtVM2hYtjIHCkYOiRdp8Iy4TgHwvQS9UHVTWepr5BK8tSuBEoeb0p8MdhwyfQYmPRcRrD/MK0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897602; c=relaxed/simple;
	bh=6QVie9epf7DQUA+KY0cAKJiPyJXVBSPrBDVruRHiee8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mpS0DN0qM0TV/04hTffLhmjVjaiwaTmf+6Y8v1WTeJNzK5GdOr0g5KOdG6n/A4pq6YlZ594dsAG1HS18tThmmR6w0A6/rhYbnfRs/cAH0Ejl85I2MkV+A2z01ZBBPf9/XFURRIdv7Xr+Q8HWUt6XHw7lsipOGFVdzooJFSVJT4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=noqxNW+9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="noqxNW+9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453608ed113so35268315e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751897599; x=1752502399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUQUb0cdytPcEYjL71jupPDYAPz94y/HVGU9AuIPXok=;
        b=noqxNW+9V7iFfWt+Uvva8a232/ODI6fHvKhjn1yT/Tye+ZenR4s3CZCnXVOLOi/0VS
         E6Ok9va4M3bYJcY5PexfJerf366fq7Q5mehzKwG1nropt7Wn44/4s21n4hzBiHB7S+6I
         vN0aDC4Fi4lbL2N1NCN8OX+xPBDdc5R4ntNUzACCoBpEMEsxRBM9qYf99Cnjzujjkx8o
         EF+TN1LI4Ktw0d1VceERvYjAu20nOiDkruAF+uZxfGVASboyh97a05Bsx6bqeXlqFbxh
         pndAGgyHC//8pgLh/VM69TRgZClNal/u/RHVSbq9vCLkKcJCH49R6Xk5vt0dH6yN+7Je
         BuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897599; x=1752502399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUQUb0cdytPcEYjL71jupPDYAPz94y/HVGU9AuIPXok=;
        b=Tr3Wk53DC7katZp8a57wiSG0hxOuhBSjN9xdxgPdkB2fVnwt0OQcprIdqJQHwyixcE
         mfrgcUwzl6/7yVDssZdhr5Nlqb9vxWVgnny46zZgNxpIJZwKeSk7kZxmOQjkkEpPuTz2
         rJESMApBrVi/qfuQ09UhsW6XuVTuviC6J+LfDSN9WWsgOwTqXkYWSwNWlQiMGwMALMet
         +1MS1HSA/VtcjBeYX4glFFpZRjrqpbo/aw1xv/iCT1uOzGnF5FUOdXtc1HWwWTo2zfxB
         eZ17hBMk2Hf+BnHvnXpmqtrQZopuZF0r83VN3N/JohONH/FU6Iocb1+bFTf+vQX29PY1
         Lu6g==
X-Forwarded-Encrypted: i=1; AJvYcCUm6IpUKMbLFE93K1I3gcsj53EpQQ9NGoNhQpws2vYruhZEnUT80B+GS50x+ahNOFxHqtxaNA/OrcXCDGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YydVxLJkKRuhPVm909J36Yz4xSYPLUoGfumvsfMMVS+1xoZQ5hv
	MqRv89jmdjnMXtwSTPS6Yrylcc7VfTJpYPNsOPakPTi5B2ZKtM1cDNBY6Fv2BpL1NxI=
X-Gm-Gg: ASbGncvddB6BguTCIfb2p5mlUILqvoTImDPEI/+5+It/1xONNdVpOwwh+NjssnGwhaS
	mD1szMnWW3L+XPWOb5W5ncyhLuO46SE0QCJCVkDmAYqz0aAhvJzWS5guxtXLHt88H8bYZmfnTVF
	iECDio/my4EQBu6T5dGgjsK+a0Yo4iFVKGPmJtVypp+1YuvVgBknqvywkfYNMjlCY9ONuEM1n2E
	M5wz8sKTJmhOV77abSEXNTU9SjCrUj/gZyk1j0VQBw2dh7AmOPNxjKENb2F5+PswEQ8OF3qQDtz
	YWsLpPjQFHm7hYc0IWPP52oP0YcQBExd3Q7irMHbN1IWqQSR86ygXVVwFpAQWuY=
X-Google-Smtp-Source: AGHT+IHCBHtw21niIsxOw8o5fZDzoZwsU6HTQSFKd59x1lgdKTm6Vg2cYVrpiS4hyCnwCJl2y8x3PQ==
X-Received: by 2002:a05:600c:64ca:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-454b306a15fmr133174785e9.3.1751897599170;
        Mon, 07 Jul 2025 07:13:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454adc71aadsm131670845e9.25.2025.07.07.07.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:13:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: don't use GPIO global numbers in debugfs output
Date: Mon,  7 Jul 2025 16:13:13 +0200
Message-ID: <20250707141313.73169-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

One of the users of global GPIO numbers in the kernel are the debugfs
callbacks in GPIO drivers. Before converting any custom .dbg_show()
callbacks in individual modules, let's first make GPIO core stop using
GPIO base in debugfs output. Use hardware offsets instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7b2174b10219..62694ec12a0c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5234,8 +5234,8 @@ core_initcall(gpiolib_dev_init);
 static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 {
 	bool active_low, is_irq, is_out;
-	unsigned int gpio = gdev->base;
 	struct gpio_desc *desc;
+	unsigned int gpio = 0;
 	struct gpio_chip *gc;
 	unsigned long flags;
 	int value;
@@ -5339,8 +5339,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 		return 0;
 	}
 
-	seq_printf(s, "%s: GPIOs %u-%u", dev_name(&gdev->dev), gdev->base,
-		   gdev->base + gdev->ngpio - 1);
+	seq_printf(s, "%s: %u GPIOs", dev_name(&gdev->dev), gdev->ngpio);
 	parent = gc->parent;
 	if (parent)
 		seq_printf(s, ", parent: %s/%s",
-- 
2.48.1

