Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539A61A0BF1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874626; cv=none; b=js1E6kPpFYwyWftzeKRrzwp0mrn8i+PzRC3DmAZZpxUwg7kSlBCayu09JoZqeDB89AJqPHSeAkt7ywGTRenpt+jinGa0Z9IhdGLx7yBwgF65emctNYjAF2hsaMfmgUX847jRm/FSMjtb4SCeTrGpDSFH5upVb7lMTdaa9R4aRo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874626; c=relaxed/simple;
	bh=N5jkOm+E42/3325sIdUmS+wpBK7ER15rMc5rHE+VhBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VBQmE+Tcs6c0bS5XaKvdut24z3Ot+8Na4Eg7klysqNr+BcbUYhkuj0ekC6CWAsrBZ+4O3PLfhpW+jtlhWAG28cga8oq0mLHiHmbqKZm6e6tL2VfVoP4BC7jYx0JJBPVUuvQY+dw4Cv8LJOKiifM0gDCXt/JkZe7jA/ycFnraZcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U8fbKBiL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U8fbKBiL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so19313115e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874622; x=1752479422; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wrJ6zrF6vaCOu99tOK97ZMO7NSzykhtEKi8+veNvYb0=;
        b=U8fbKBiLF+l6qOXXQF3pOs6u4f2Rsvy6O/71A73iHmGilelri8toCMBZ46G1Zv7jo+
         YPxbDmxIC2lwqCg3D6VzUpdtb5eRq7iYQzFhdaIypHjfdWP7hyXvagtx1h1fdkcH85HQ
         5A3Ivw4WpPY6FWyVfevZAZhAaJK7ZZW2ZmXOQE8coqVEOd6HGbAu5ASoep9g3Pf/GHuJ
         3mZJtcwFxi1mbwC0WqRWhRHpoF+CnjfWqZqxqJ3YOYxvJewVqwZct84f1JbGnoO1DxhD
         HgQLydO+80XzLemKTY6zf+OZi8RzCrdskgsry96j+a672W6lW8KyPRTQAie6Rhex5DkG
         LxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874622; x=1752479422;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrJ6zrF6vaCOu99tOK97ZMO7NSzykhtEKi8+veNvYb0=;
        b=G+RoMGrhqgiIFc9TH9xXn3inFXhMAgg3V5MMvS5rsaMw4YtL+GmfSTXRpGyJNZZhIv
         hwg6i8CaAjO9bSzkde30884wALnLe+0JScE6YqsPELPRbPpD5tzvWUIWZjSIKMdMuSvp
         RauE4nbDsnPJPHny97t2mn73TglLIqLkcti7jxnCsNK8guWSRiTQymSgrHVujVFh9T7O
         jubVBBazgehowbd6TgD4c90jQ5Fs58aLw7sNuo35Nf6j3mtAQBjP57icbuBleIEp2UaZ
         t312uKAdYbn1CnyTHu8ABiMpPyXFQjGT5YEuOXVaS25E3VbyNiA/jPVQnemlRncNbWa7
         1MPA==
X-Forwarded-Encrypted: i=1; AJvYcCVp+H2uQBUDQ6s3cErDYCn70mQ4zi2cP/a7AgVevWMAIr76P5HGvgJLuw6Z3LmOcnI4v/Ne4vknUY2B0c8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZXNIhO9f0LzSyaWb9cqi2Glt8Ny9oexFgn07FPYLsTLCD+gT
	CRKRQA5b1iIHPDpkdQ6/87OinKCqAK2WzwlQLCKNN2XBTapsYIGlvPc17OG52Njw1qg=
X-Gm-Gg: ASbGnctBvY2CXlakOKOL/Z/NF+0cfeVem5dG8xUa17LicfkyD2TiWU+Nx3N6eIWE7JW
	/EW31nx0IurNmXMSYKzaeAIUau0un7HLSFVyzS14FcU1Prqw9VCf7uOmQwL6leLXlqkeiuIGrCb
	UliK52TRcpGciJE5oZahoTULGz1d0pRnl+al/w8dCidbhIOcFgrGAgwq6xexLJw+Yv1du8dShYE
	JvRhskRDak7BO9X9dRerFRrikeJUxcJtjBDsVz4LP93DIEJLUH8WIRye8pAswXRHFzlmG4FHy/m
	IuWEfEQIgPDGr1J6S1LCUJYjXsKy9lExPTqjSAJpHc9VqqvRJyhm3Gc6
X-Google-Smtp-Source: AGHT+IH4gLV5Mgn3MdroclkxvUxTKeVkvmHDseW8EX75VnEa6h1K/vjvfvOwjdwNRHlp/4uzbFHh5w==
X-Received: by 2002:a05:600c:3ba5:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-454bda7bdccmr48978165e9.21.1751874621306;
        Mon, 07 Jul 2025 00:50:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Mon, 07 Jul 2025 09:50:13 +0200
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADV8a2gC/x3MOwqAMAwA0KtIZgP1UxWvIg7appqlLamKIN7d4
 viW90AiYUowFg8IXZw4+IyqLMDsi98I2WZDrWqtetXgFjmYnSMmOlCu3yjh9LZFalbdDc4uemg
 hD1HI8f3v0/y+H+Fd+LttAAAA
X-Change-ID: 20250703-gpiochip-set-rv-gpio-round4-e3b568fda584
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N5jkOm+E42/3325sIdUmS+wpBK7ER15rMc5rHE+VhBg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w5tKVICFJEhXCxLZ7KQX21D4C2OCbBqjj7g
 LfSHShz25+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OQAKCRARpy6gFHHX
 cph4D/9XkrbmY6i6HDt0Q6nX+na/hkp23/znnKQcMJJi5zuQ/t0WnggIIqdXKmBwqf6H0GAav2w
 irFg4zybDpxT38A5klx8m+9f1RQ5RxP0J+mWyeXv6DpzPsR1ibP5S8QEJiqilS47WrkKm4vufW0
 +20euvBZ2i4yvFrSPGAoaQ66oCatMYAzN/Bg8Xcn9bO/KKXgFo2yn/ukjlDlib61WqBqTxp77Ds
 G3wPgAYY6Ae+7/uBSFJh/jGJctTJypXFX/NUS8waHsqZps7fGN6JHHlNUCOXpzQXj+zYPjkNn9x
 6A2vcYBY22Qy8H7v8FAfDPnvkb+1NvN7eLkbtOnsLKUZ5z+LdF2o1xeyJCjshxnxex3ndPUIc8j
 6S+cpIaP/p64S2fj2MqnMKNQS6VzfeJ0qNn0GcYvIfH9UG+ZC4KIlGUgRZ37WTGJrf9uN7Eb44a
 zz+zagYRrWB3Dbr5cZtJBZsUtJnoTdznhgfL20NiK29AIlL3okae268KjdXnx54v5DREc2Om5bu
 lcgT7VJvcpH9Lqw5EhYAQbvTfhEH3gnwhJRF5bY1dRu2N6QBcljYZKBBYoDnlLuyvpKAHpABdB5
 EjN+HpurtDmAMYFVlEYV5no1rLlIHLnQMB27gi4qr+zaammaLIiFVO5NQA+j7K5/zZSyANkYvs+
 ddLuVD9NJscVD8A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

To: 

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: tps65910: use new GPIO line value setter callbacks
      gpio: tps65912: check the return value of regmap_update_bits()
      gpio: tps65912: use new GPIO line value setter callbacks
      gpio: tps68470: use new GPIO line value setter callbacks
      gpio: tqmx86: use new GPIO line value setter callbacks
      gpio: ts4900: use new GPIO line value setter callbacks
      gpio: twl4030: use new GPIO line value setter callbacks
      gpio: twl6040: use new GPIO line value setter callbacks
      gpio: twl6040: set line value in .direction_out()
      gpio: uniphier: use new GPIO line value setter callbacks
      gpio: viperboard: use new GPIO line value setter callbacks
      gpio: virtio: use new GPIO line value setter callbacks

 drivers/gpio/gpio-tps65910.c   |  21 ++++----
 drivers/gpio/gpio-tps65912.c   |  17 +++---
 drivers/gpio/gpio-tps68470.c   |  14 +++--
 drivers/gpio/gpio-tqmx86.c     |   8 +--
 drivers/gpio/gpio-ts4900.c     |  14 ++---
 drivers/gpio/gpio-twl4030.c    |  23 ++++----
 drivers/gpio/gpio-twl6040.c    |  23 ++++----
 drivers/gpio/gpio-uniphier.c   |  16 +++---
 drivers/gpio/gpio-viperboard.c | 116 ++++++++++++++++++++++-------------------
 drivers/gpio/gpio-virtio.c     |   7 +--
 10 files changed, 144 insertions(+), 115 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250703-gpiochip-set-rv-gpio-round4-e3b568fda584

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

