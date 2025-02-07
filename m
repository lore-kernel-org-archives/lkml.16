Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EF61662EF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917037; cv=none; b=cqrObJh87QLWyEyRbb7L09JmJG5TtT+ofGIjprtgZt/FZduZGJ2z245gB4mBsKE38YaWOaQZETQp3H3fAE5ilGqudYscXG8EBQm8r2llxNyEW3xsBLccZvwN6ajElLra/aULqHr/gGQImx18gjb1yG6aLjQk5ZQfHO4jqZH5Nzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917037; c=relaxed/simple;
	bh=3d5+Y4uR8zcFm5IfpgDo9porvzDL1xbawGz9puR1NZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ld3LnNee5p5MwAOhThrEbZ5SKJNsQX/3Pm+MP22OHEQGNwXtKrO+MZ4fWfTSExl1kKwD/I1jSuymF1+NQ7PMN1HEULsulgciW5ifoLlHnPl4Wd68+XjFE8wtSNva1ZEBpMw4aySPkddqbfSX8bfM/FQzLJRCBSSWPL1XVSEvVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eeoIgaWp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eeoIgaWp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so17616845e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738917033; x=1739521833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=73Bx6sMUjpDwcY4TcpO+hq8L+ySz1RxtLedlR3Xlx8I=;
        b=eeoIgaWpZvTPdLQfMP+e6O5X0hbRVt2/c/exgY75+7V2g2FbABfTD1QrYa5hIv+rBo
         Bnszcjtow+wQKMGdwv/8Ptr+M0oN7mjjq/8Rgh9pWmAp74Qdskvdy80HAXYSj3bvQk7L
         Gemsk++aSJiGt6o3kOLaGQRL+UWCvAHaCETphwjDcwKYzK8cDgwB8saogIN+jLaia004
         vTfoc+BlWm2kChfbFP0m2MoJtZwnhxb2P15BTrzaDlW70Q1uSCA1V8/8/kJiL3ZgubDQ
         40F7rETv2OLhHx9z+5k3porlCniTdMHez04Kq0nJDgzFXBud/lp+CqMp6GebEOTWB8z8
         M5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917033; x=1739521833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73Bx6sMUjpDwcY4TcpO+hq8L+ySz1RxtLedlR3Xlx8I=;
        b=La8Ho7fdLlaQj9r44Pv/YEus7paqVi38QkiUSYKtLyhUt+Ce3B5Kbv0m5WgxcAk0aL
         li2ZshGkjft2Rdd4f+Ij1YyEcZ6tgban/PvgaOX0Dv9E4HvH3+IsfSec/2tE9RrA8JLR
         s2tX0XfyXrBJgEkW3OBD1RCEuTK5CJbKU00hwBxRyD08msIDr85TBdaZ7MNVKqD7SdHR
         fTw/ZP45Hb3Y3pnRmCVqHQqlddQ1eGRL5LJ310gV/vMz4MpKIWY09bv679LjkzvuZhb7
         stW89CFPdNGgOFEvq80CcOviQiwmE8qpjvVYWWyeRfYAZVO8lMeGjRvZHczfJDjHt3ca
         YcAw==
X-Forwarded-Encrypted: i=1; AJvYcCXvwWk+K6DFrcbBsJVchkAwenO5yzQ/8Mbx735op/Yz2siPgBXn/7+zTZm3MGY2UmazWrNl2jYBnREE13s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp3+A7Q7xD+dKsEiJUPZsl72sAqDzxPHpnv0DxNoD9kYDc4wyT
	b+vPaxpwk6QOVdP9QYbIceJ7bFczNdN6jydNJHHfXShwW+KYagnro8/3NkBdyY0=
X-Gm-Gg: ASbGnctbPp1ATLIqu3GeurGgZPtqEkXIhogxtd/JxPGBZDKgmzmO4GR+h029XZwJ5yS
	j+cHELFIVdsPwF+0Ai1XasyswOLRsnLye0D3MqmYnnBShqPedFiqxrwSeUfdVv+yF8BtP2GLsaO
	dQXcsljxSNv7/FfU9o5Dut1VRiU+LQaOsD7f8eBT0RwLjg7l28tQpZdumu7YEPtHnMaO5597lIL
	pgNOFy04WNwcesnQ6ZNmR7WycIUEJSvRJbhpn/ACEw1obW/quP7YVdA8YV7Fs+uwHSxEcUBjrPb
	cchiXJgKfjLiOQ==
X-Google-Smtp-Source: AGHT+IEokqIBuLTvDSKYe/t0RdgRU4F+oz32fcFnrb8Lmu+kXbvW+w42zMkOLpDsbFOK/Apc5zfIJg==
X-Received: by 2002:a05:600c:1547:b0:438:e256:a77d with SMTP id 5b1f17b1804b1-439249921f0mr21475505e9.15.1738917033411;
        Fri, 07 Feb 2025 00:30:33 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ae69:c28e:8e23:dca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc888csm45566155e9.27.2025.02.07.00.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:30:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: add missing include
Date: Fri,  7 Feb 2025 09:30:30 +0100
Message-ID: <20250207083030.17698-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With some randconfigs I'm seeing the following error:

In file included from drivers/gpio/gpiolib-swnode.c:19:
./include/linux/gpio/consumer.h: In function ‘gpiod_enable_hw_timestamp_ns’:
./include/linux/gpio/consumer.h:557:17: error: implicit declaration of function ‘WARN_ON’ [-Wimplicit-function-declaration]
  557 |                 WARN_ON(desc);
      |                 ^~~~~~~

Pull in bug.h to fix it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/consumer.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edb..0b1acd014186 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,6 +3,7 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
+#include <linux/bug.h>
 #include <linux/types.h>
 
 struct acpi_device;
-- 
2.45.2

