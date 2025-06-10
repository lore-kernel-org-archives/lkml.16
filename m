Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA252165F3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566981; cv=none; b=JIz5NuEoH/F4IjMetwnYFlPfK7LUrTJaDteagFb633Lkh6mfeue0M7aUX02Ytcv3Mbi9cHtmLhpDWiTE/He1OWqpa4wtMn7blh1iuuMRLdOmP83hEKzt+h+SG7TFS0s5oYXS0JVHSdovRaS7edVSmgIXADyPZ3T2X5YjL4tGsFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566981; c=relaxed/simple;
	bh=vgj42bQ635nNSbuuBwByTTCGh+6Hp50dmu3sPfcDtjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Js/M63llByqGE8jWXIsF9GXz1WafwscgE5pH0lfvsSYfjrUR12EYUlh8xoSIcbb3kLC2UiqHRWi2oSKeQE94GaOQ1Qohq0Oq54wcBScKiSot+PjGI0mluYXLynROiIC1yFlISrES7goWNKz1E4oOHawhx7CL+f8psgowOG3X/Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JgbjQiHc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JgbjQiHc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a375e72473so2844174f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566978; x=1750171778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/iEEeefANeHi9vXHghJ7cwdYmeCqzXT54wm2S05hec=;
        b=JgbjQiHcKzEJUL2f2f0zpBe8Y0hiEb+xIXYk9B5V4iDZNymVv1TBd81G8Ei+91PPfq
         92EfH3s6AH9zUErgMu51H2OvMghrH+P1HlZ/ZBu5gd9IIgV28FLvBxUEbfcknzhbj+GK
         yqCQsxjvuqPF4Z3Ubhbj8eiE5VB8uZc3lDJOUFop+LpqdjJKcG2omQMPZhmfhqyjGqUJ
         18Dk868m9EJX5b9aMteszVd0KC175BbccLkRsz2WtALlJhoptBOD9kKG/33QWi3yoKMY
         wDnq+6PdvnC3w28XJig3BpDL4DYPZ4ZsLX77lHrHIBhIeBIY4JpUy0SZK3Jsm8/MSLFl
         riOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566978; x=1750171778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/iEEeefANeHi9vXHghJ7cwdYmeCqzXT54wm2S05hec=;
        b=t9reMwuAnCDUyOUyS8TkIX3qTjThIovrdcHvzKImpY5w7R5e53W5/IDkJ2bRY+3jTT
         kRnNxNeR66lkkEjCpAT04l0FGLwbPde52kPhN8GsrTgtIZmuNAdm/ygnx5FurJw6bDqC
         doas/OnNg9WOnkLGkmJYV8eovTUHI1lhetoBVUST6jncOdqYXlvNY2Q1iJevh69xyrjI
         vou0bo/wjJJ5WmE28IdgalinhHic9znGMyq1+cXFJMG7Y6Un8Huk190LZFOMCwLLCWVp
         8+/rdqLZ1FxlZ1PqFfWtBlYMIl33hQ1a/CANn9d5UXEGlSmn6UNmaoeTKyZ4DWMYNJbP
         fIfA==
X-Forwarded-Encrypted: i=1; AJvYcCUkqFw+zLGiJuSLSHh23AJqZuyI8t34siaxY7BC+5r9TU1hJyI0v3Zs2TzeIxJfFq+wmURUUYrfqS0We04=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM6BJ2LYFfWtuUk7WMweFE/GVTnYZDXpIIRJs98x3/nC3log8a
	y15XhU6z2oUj9uT09Vq9w/bADy7ggQnbpboSsc1EZ1o5TVRRLCFLkePDdw9OxXzvg6s=
X-Gm-Gg: ASbGncukNNFOzQdmY9+W+oklThimrNcEh/5nDYWSVAn0YxPmnkLPndSOjxJwwscTfKH
	wIaWzRx90vWzkXm3QayM3uJCXb/RmBu2DRhc/QGpK162iRV5gYYVFJvlGjxLjKxsYugM3Ua/ZIp
	Kcs7oMWBbXffLAR3XGJhxKpmPGExMr+b6ZdIWmBNIi8JlsjeLvgo4Vq4BrQGkbKcw0UWdg1WOAg
	xOJxanhTYFHBSYO//HyOMaXm/x+8CoUNA40Rxlp03ccP/TWEIiVeu+fkvZZrOkSuAslczNoT7CN
	tYyVFgGSVAXMnp5C5WOT1V6KAOFSa+M7iyXlrVTWldmwNHLijYLaneyWobuH
X-Google-Smtp-Source: AGHT+IFkuuvXSAGznKXq5aZyc3XgYqvZ1NbhCK94yQk5I2xSZTlpXtUojsO7fQIOC22DYcqFw6Q0nw==
X-Received: by 2002:a05:6000:2504:b0:3a5:2653:7322 with SMTP id ffacd0b85a97d-3a53188a710mr14986384f8f.3.1749566978284;
        Tue, 10 Jun 2025 07:49:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm139850235e9.23.2025.06.10.07.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:49:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] platform/x86: silicom: remove unnecessary GPIO line direction check
Date: Tue, 10 Jun 2025 16:49:35 +0200
Message-ID: <20250610144935.84375-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
lines"), the GPIO core makes sure values cannot be set on input lines.
Remove the unnecessary check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/platform/x86/silicom-platform.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
index 021f3fed197a6..4d2c2d4a66e5e 100644
--- a/drivers/platform/x86/silicom-platform.c
+++ b/drivers/platform/x86/silicom-platform.c
@@ -252,9 +252,6 @@ static int silicom_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	u8 *channels = gpiochip_get_data(gc);
 	int channel = channels[offset];
 
-	if (direction == GPIO_LINE_DIRECTION_IN)
-		return -EPERM;
-
 	silicom_mec_port_set(channel, !value);
 
 	return 0;
-- 
2.48.1

