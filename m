Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3B1FFC77
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747392033; cv=none; b=AgBqKIeVLo1H2uJOBET1FJxQ3KCA1pwTIxO/EKJvKWqhrRvZfjcWHZ4whmyUVyJR2qOAz71Not74KO8/c0xTZJecd0Q1jiklCtv5VqgM0dRNDt+wV2QXYiSxtrJ4w0T+C2BlBv9C6+0DwTHSntSLpYQ+OIUJfI32/lKMQgTAlGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747392033; c=relaxed/simple;
	bh=fAilwiO7dEF17O9fXmgvqXjSp0ceiL5RFE6YjkH+XWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exmvDJRvAzsBMTIWH6qM9FXgVAsxJN4WBAfbjBHYJY0qVIM6TFSmi/WfrhDm7ptwVPQ71iE/IpmYe+QzHcQmLkoz1VIV0e+ZMZ2fN1QD5ofnVczl9DLF8Pk0TIIAsYEKc/e01d6m5n+y7vSXQqHjRa8mWcC+hnDK5wQxZaHgwLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sGl/Y0g3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sGl/Y0g3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so19309115e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747392029; x=1747996829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/D6lYZls2BWjWpZt2g/sTx/5BxVlF4dtuEMmn0jBB0=;
        b=sGl/Y0g3SBdzgomtqh7aAIhIM9+2524vqHynVRriIf0dYgjq/bqsQyuPrc9y/Jn0A5
         PNOIiweLwX588EVl26TrVCGxcim47UqtICay3p7BcMvZmNfqSLCeU8EQI4leqdt01q2V
         xs7cHNb26jpnWTEbZaXXNaST4hlX9cQ6GPgpPZ1WUSItxllS4h1k90H8mBsqnYXKB5qG
         TnjVt2zoslckNDnj9XPd4a/RUbZzow0Yz9ICfvoqlfB7cIT1Y8rWluI0eoBslKDYrKZL
         gg40PMI+njZQ95jQcDepjpA2AgveCzBN8VTDZf90iQsnlgB12ZVYSFeOqatpfnUj7Eji
         pCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747392029; x=1747996829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/D6lYZls2BWjWpZt2g/sTx/5BxVlF4dtuEMmn0jBB0=;
        b=fV8IahvQatuO3Ug5K9Ed1D0TCisv2nmB3rdwmrAavQwjXy5cRcbT/ZaG/Y8rD5qcch
         U9okWjQ2yqlF+MlydUM2GU/8CP9WKKnqsjghy30NXiic4zvEFTcmpmJW0lvAebiN4ZFa
         6fD8U97g2WkACbucXvpz1L2PzsYJspLiZ4kso0vXi3xQEKsxYBtE6/WX3E1IV6DVTfgA
         BcC9WgXZWHqAxTy9a1JCHyYG3GkgYK+kIOtCVybpIRbUU7qCzKQf4O7u6MiTQ6sWxYYs
         VA0020lzoo97vsMwxOrlvCEIZ7UlMoOScyK+vZLEodQl0k6OGf5idfjLHyrFdXAA+ei+
         UE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcL6bmXDzyIw8Bjx2FJrFm84t1gGeW7niiEZwkqzgSq75sMzs9NeTrS9kqFWByvRf9+w9n7RGNA7z4nTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUrmJctC1tdZRzo1ci7iFXMlbh1ZQoEI7IFdz56XlqUFjnqHj4
	3lCD9Y8sQ/yArWBaY2B2FaBjX5KolXcdDQd02SkaTS70+X2b5Lpg2AyrHdR6r9i5V6I=
X-Gm-Gg: ASbGncvOjyGSFAiT83Rm/x6GLagO4LVCwHCWwxFxaDP4ZqoeHnP2fS+xJSCOEBS0ybm
	1rgC45yOK+smpWIrIrdn6IQ1GCfNYriYOK4A7SfN0K+maa2MEopuyopQJd4p2ovhkCgSA+MQDo9
	MELYQrHN1FEZ35et4E1rYgO/bpDLEZDe7OqHd+wvssEcRQ1XdxfVHmHNqOVsSCAcutwG2Qnw7EH
	2/ZutCGNT3R1UFjNpU1ZbccmOn/TbFqoRWJP6gc7LtD2yXoiYHwpw3r6041HtGbrAy9X6gvDJ2a
	d3j40LF/xCNWL5LDd4kK6RX/8UpM4Ls4AApspoPkXOAvO0HFTY1TNCZ7PcLYBkFadBgAyLripzq
	8Bi36QB04TRisMOSoZBnQW6+u
X-Google-Smtp-Source: AGHT+IEkveirfZoVjmBNTeL1wlQxfdi/+yuj3FFTnYkHDey8ix0A99YrVgeOzmWXo2/MPNYmRSeKCg==
X-Received: by 2002:a05:600c:4ec6:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-442fd950bd4mr25855615e9.11.1747392029382;
        Fri, 16 May 2025 03:40:29 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3369293sm104607025e9.6.2025.05.16.03.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:40:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Johan Hovold <johan@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: sysfs: add missing mutex_destroy()
Date: Fri, 16 May 2025 12:40:23 +0200
Message-ID: <20250516104023.20561-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We initialize the data->mutex in gpiod_export() but lack the
corresponding mutex_destroy() in gpiod_unexport() causing a resource
leak with mutex debugging enabled. Add the call right before kfreeing
the GPIO data.

Fixes: 6ffcb7971486 ("gpio: sysfs: use per-gpio locking")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 4a3aa09dad9d..cd3381a4bc93 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -713,6 +713,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 	}
 
 	put_device(dev);
+	mutex_destroy(&data->mutex);
 	kfree(data);
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
-- 
2.45.2

