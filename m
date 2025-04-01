Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5469926AF3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511620; cv=none; b=IHf1b81V4y0gSOkAe1X0Nzc6bFi99RKwEroD/yYSwMgePS6sgh/CszvZ7ru7Kw9acB99A27MfogDW4a4AuDT6WAOETKFyW9lR8/P7Ne87WSyPCK4lBzvh7rxRO4ta6mamHuXC5cK610wnPaNmwnsIdkSt7guzwcIKuM3vV1ntnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511620; c=relaxed/simple;
	bh=y0KyE/mzSHT2YZl2aE20dg8G8KswIQGIUuGNjvfOkuM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i/K6S8LUdV3iAMWTYcmpAjGCjbCoqNgTRvHY4e5Xduq/C9oCfhCm7HKiAW1dT8H/zooEUndS7gkB8FK9LywWSxgjYOBhYeBbQVwLhiW9V1urUx4nSqW9X42H1nM4hZe4CjmTI9j1pXnO6riC5INH+z672Nc42WEZy1jq8fskyEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0mpDEv3t; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0mpDEv3t"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so31273125e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743511616; x=1744116416; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJUEJOvTfXgA4uD6cCmuNpuHsNFU7rS14fRYk2qFALg=;
        b=0mpDEv3tBoYZTea7a9p4Rr04B6lPc2cEwqlk0VLJF66IkbhS0UH1x0wVt2NdAWXB2z
         VidO0c7dBdVvVuVg/VyTOr1wj0/px5JclIJPVC/K/9XWBUG0iCcaAx37R1ij7dsefRUe
         LXKJGlum/vIarxvf2J/7LQHAibCkpX5U/TqSsxPiCPM0J7Pf1VS9rNe4yyyCwV/jWYbB
         5G1P4QM6sIfZh3OaoMvlNPeqpdNECBaMWt1sS7hwZfFmcjzYuyn/Vz1sjz+GsFfcLlV7
         GKa4z0H7ZFyhxd+b8alLQ4nm7vi5FB/Az/TB69E7EZ1d//IRxd5TIJycA/VBXVs6+Oai
         /CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511616; x=1744116416;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJUEJOvTfXgA4uD6cCmuNpuHsNFU7rS14fRYk2qFALg=;
        b=YBQaIT6hs7rJdtW6VCstw9sF9CZMa7yQe2TxArNgqDZ0+s4dW6v+cEc18bP2GyT0tA
         SV1lcsCJ9w3x8Qw7QJCjPSprfM4X4ZTXf/7VyBZ1+V/5YNzBBDEY16KHUvulIZXsa/FZ
         4pdcIxX7TEDINJzg3Oi6mA4Vb3ZAsPNKYvWGNsFdlLWTolmn7m6SVqR6WWmHJ3Mum7hU
         F0X3zxPl1ioqch9vlOvxIIXeDQefwn0IWRyh9A7o11EH8qL4OHuOwIZ2NTPyqMqE3flc
         2hYqZEkRLwznZZut95s5l66jca2ec6yM6vZIZvBvncMMKQwpcFeSiTEdOFE8EPGKgThm
         mrng==
X-Forwarded-Encrypted: i=1; AJvYcCXx85+uk0OU3L4dYK+NuJamC5MAbb5YtrGlmACF6mZX8CjWe2Fh3g01F26lRAUYaKdV9u5aJC2DpGJj/9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8F25Zj/CBZtasjXEArDcFVz2SWWsyzZHwat4jLTEbOSomFFuA
	ohZNnq/ciYkhfhCyGCGr4W9pBalHD6v84HntS3/tspX9c/KEAxt02xHY8wVSGU6IaKr0mJgN5mE
	5
X-Gm-Gg: ASbGncvjz6mo7gn+jMegwdrHLO6CBMErK/rqCjDHls7XEh/IQn7I+w4PEmBkVx+caoJ
	rcTgvmWMw9qeA9WfKY1bGb7rkwZZ5gs0fvLxlI+kttib5TGzMia7tLlkMSHHlXBYUN3WkYLPuyT
	QTODMGfr0YCFKnB+ny37INp+RANeB57lycGEXyroLlkGnHaQtY/zfuKCGTWIBltVaNW9j5RPqVX
	O2iYebdGKEJiFg4lvjH8STK2uj3dWo31w36wC/Hr5GakDJ+cQvVSr1HKUWXPF07CA2IBodxYk3n
	5iVKOJLSy3Vvc9LmVktJZ/ebuNHH8CJu5sJZ
X-Google-Smtp-Source: AGHT+IGb6pbzxnvoGzoDd9m3yG96NFGewZN/3m3P+C7hCU1HFdSRDNHFyI4h6xuxt+qVeIiOqLyGSw==
X-Received: by 2002:a05:600c:1f8b:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43db85250famr132223545e9.30.1743511616057;
        Tue, 01 Apr 2025 05:46:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a1d1:bbb:e2a6:2a9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc1889sm154711095e9.16.2025.04.01.05.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:46:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
Date: Tue, 01 Apr 2025 14:46:41 +0200
Message-Id: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADHg62cC/43NQQ6CMBCF4auQrh1TCqXGFfcwLBAGmAQ7ZIoNh
 nB3Kydw+b3F/3YVUAiDume7EowUiH2CuWSqm1o/IlCfrIw2VhdFDuNCDCv3DIIvjgiePW7d/A6
 UgP3N2bJy+LSVSo1FcKDt7D+a5InCyvI572L+W/8txxw0GDs4Uzk7FLqsZ/Kt8JVlVM1xHF81x
 0ViywAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=y0KyE/mzSHT2YZl2aE20dg8G8KswIQGIUuGNjvfOkuM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn6+A+YZHfEqRXZ3oZTBFYjfwJVAIRgLSTVGQD9
 U9vvXh0tTuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ+vgPgAKCRARpy6gFHHX
 cvZkD/45xITkzjYfW8b20WXXTvMsJFj+g1LlFtAIL3y05xGx9AzIWq/bbAiA5vBObBZZVZkfEMd
 xG8E4l50cJwn7Eh0mUtBO8Dg4B+hJo2swcN5oxTAf3gadkNEnP8VZYM0QFGE0M1LyKzDJ7tbo+v
 2xSVODyHZ45f62yMywim/ChK7h1N6yIeq2MWmL9ZG074ucN8+u0hsapswDgbT/IK9mifJBxP9nS
 ZVpx9e6VKju6K5EOzfVvrpVK0I+bNYpDOBDfCfB+X7A5tafVsW/GfV3FXSYZYjaMT+v99E4n54r
 8U+2Sdx1tEY20hoXwqGhUHEd9bJAV9sf6TwL1+E4mFgTb+Hr6Vbtm38fcXa1n4Euy6G4rYwtqWX
 +GLZlicDqmjjWj6SIDDoMnvNDd+384fMp2EAb1oHYofuKbREDQWyZ00dttkYFI3rtmy1bgmXSSI
 Agnh3WmweQKqiXxHU0o3pEyJ9ri5PFKpxhdVp2korLw8ArXMD1OWMVwWxLawHKvDDu581YlBWtm
 5W2I4yP37r46lwxEtngMmbs6Wjw5NDHEsg/cLd6DHFDsClVEJKY6k9E3uAzpgWk+eS74qnMQ2sj
 qGW+zLzIUmDE+hubJiv9uVxQaVc9p6iddpKkjK1rbkePvaYWrh/6t5wjsrLhkbT7HvSJK7N/bT+
 28QuutLY031cBiA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag and devm_gpiod_unhinge() helpers
were introduced as hacky workarounds for resource ownership issues in the
regulator subsystem. Unfortunately, people started using the former in
other places too and now it's in all kinds of drivers.

Let's deprecate both symbols officially, add them to the MAINTAINERS
keywords so that it pops up on our radars when used again, add a task to
track it and I plan to use the power sequencing subsystem to handle the
cases where non-exclusive access to GPIOs is required.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- reword the task description to focus more on the solution than the
  problem description
- add a task for removing devm_gpiod_unhinge() as well
- Link to v1: https://lore.kernel.org/r/20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org

---
Bartosz Golaszewski (4):
      gpio: deprecate the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
      gpio: deprecate devm_gpiod_unhinge()
      MAINTAINERS: add more keywords for the GPIO subsystem entry
      gpio: TODO: track the removal of regulator-related workarounds

 MAINTAINERS                   |  2 ++
 drivers/gpio/TODO             | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-devres.c |  6 +++++-
 include/linux/gpio/consumer.h |  1 +
 4 files changed, 42 insertions(+), 1 deletion(-)
---
base-commit: 405e2241def89c88f008dcb899eb5b6d4be8b43c
change-id: 20250331-gpio-todo-remove-nonexclusive-ed875467eb56

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

