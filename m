Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4EF1A704B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392521; cv=none; b=PaIZchRQdX260sS79d1Y2nN14jfczlsp8nj21PwIiS3JkFodVa7iK7r1hW+aKS0CTaUTT5DSDNQm8toTAlDbk1DdfRwdtpDXH3EcgrvkWRQ6H+48p4m8fm+0XBWDpS9HdZ2M2xAxOiZao3YmzuC8r4L89glKDMVNocb1pHEj2wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392521; c=relaxed/simple;
	bh=P8T6A2RfhQi9cs8jlDhrwJia7IeYiHPIj6iHNUhHRRs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r34qtX0xFqiXkNOpVMsO4OZBmm7ScrpjBa3P/aqrAf1n6FkzDU9ZekOiUEp5W0vnqaytpMEPmiEtFCqV30XJZjBYxn9mRodkFM3j9+iPnPlKQHy+OV/fzJUMeaOyXV+4GQFYKN/PHaF1j7K1GzpfMzQLaP6pMnV+jECRkWyuiZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DvYU/P5b; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DvYU/P5b"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so42678305e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392516; x=1745997316; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kfQbp+syyXkO/RHw4GNJukoFm6a9w8JqJKtPVgxdN5o=;
        b=DvYU/P5b2BI1gSao6BNYuea7FrQZ8ZUrFejJsRnXByxIVMs2CNzx0tdLfK//Dzewjo
         NO7pDUSmQGvRf40zYv86hvfdMZkwa3u+VL39iqdcMGzBOMtQbcfUdXaZY971ReECFur9
         JKF69M7UtxnLRYt4l0+nk+HJmGccrNcpnWCKhqZ3AkKP7gGM6UY+arJUDzPRa9rJXT+p
         blX5LX7Sr+NPNGavWigN5Cf/h8UI0Ve+ijeAQFGa2S+TpfYa94tOgiX0UKdRAOJBcpil
         kehBN8pUoTLxY9YinY2FeB2Lyz1PAHDp8KH+vlewCutVIym0g/qszwAkvxrQuhCXwCDI
         o7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392516; x=1745997316;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfQbp+syyXkO/RHw4GNJukoFm6a9w8JqJKtPVgxdN5o=;
        b=Er6bx42dKddmM9rbFnMTc9UJvQcJiKSaYG36MnTBkZE5YFlf4oleqHXzCtdgqpaoiP
         BBFrKEYq2mAhq76ZkSYLzAxH0M/xw8oGv2K8gcHbodLnkMgLDEqN648YlSgBnnE5V7HK
         8JpQS9pPjFsbi2dvR6KL3rMHlM+coGKG/Ta+7tw2gKL+BSWgBuGI1oXhKZPadj7GKb4s
         kvX/EwZ4n5wQCj4wUZzsCaf6ttwL1rNiDjBkPEcLs6UoP1XxAWsEKnVg8jFEnVtY4JUA
         2ueHVWMMZprFV0dQVKJ4ExuXZlmADgeeXl70s/Lb/WIrvfeygOHiGvjLqFfR6Y8Kv4/B
         58EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXACRUcsV924bQEbRwgKbRJ2ODOA+kJhy0INJRbboRsgOkjgsiLI1wr17KuE9gditvFrPCrwuNoDIZlEWY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xhOQSuqNKCLm5m0ByCzym3OJ46IW7UL0G6mU4hV47dLarkbj
	D8zUmRpilcsUjlHk9OBtHi4nnJsxRHikEZo4DxQ37vf2cRL1oZfQGbBMKFAxz78=
X-Gm-Gg: ASbGncsQpMbu6MDrDnbeHeZ77Cqlofq7ndWt3SVJbEml7O2ke5jHkEhRJU4c30wPmPn
	zSPljfkxBrLr/cN0i+w+EgfIUHDJRxMUUkiLgR0vVLW3YpGVLGan9OAOgi/PFvPxZistnXUOiw7
	r1U2gduj/nsGVZZjKGXbe2yslNDTiB1lrPnU3fOgms4g/yahWxdEN8R1bzcyQTTWNDyNOvPA8Yi
	sF74hnUkAprp63+HGPyvqHkNmQUTyRcd/f9Jou1dbVRsSDj4NL3LwCObc6cXH0TfiRfXVc/ygGi
	TUe0NIFPiK9zuyHw7Ymzucoo+GEyZcx2W2BjFM5IpDCa
X-Google-Smtp-Source: AGHT+IG+tJxvr2pB5uojdqPwlJlUoCOQYCF7lDXIVNF2nVM1sZvKoDsybtSZIIss18Pryk/S0Ef3fA==
X-Received: by 2002:a5d:588b:0:b0:391:45e9:face with SMTP id ffacd0b85a97d-39efbb0252emr14722584f8f.54.1745392516313;
        Wed, 23 Apr 2025 00:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 2 for v6.16
Date: Wed, 23 Apr 2025 09:15:02 +0200
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHaTCGgC/x3MPQqAMAwG0KtIZgM1+H8VcRD7qVm0pCKCeHeL4
 1veQxGmiNRnDxkujXrsCUWe0bxN+wpWn0zipHKlCK9Bj3nTwBEn2/Wbw2SncAPxtUNX+xaUgmB
 Y9P7zYXzfDxJIbI9sAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=P8T6A2RfhQi9cs8jlDhrwJia7IeYiHPIj6iHNUhHRRs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJN9PtDzo6pQhpJrIbuv3TgdhcsxmnoGxcbPW
 lRtYYU14zeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTfQAKCRARpy6gFHHX
 creZD/4wB84rig0XgfTyX7mc6x1ZYJw3YX7GCsmp8eACazubUCcNQBQO4dD9X2QWoeyiZr9sNj0
 kG9snhzeXa0Tvzh5T2gedGUErStlmEEtNkjAjWsaq9hswKDrmsuc/mKcA5qWrkhvkLhcc/Pbj12
 cpxHdFxDAASelR4triAIaQu18P1ZQp2Vj8paAhxBlPEaCPy8hUL0e4FYVMB1Fv6j4lrnLuw73xB
 Mokir5p0P2mOSlg7jZ1KDABtZMRJ3CPkcRtQNnaeOTtbw+iMAeR5G1DDptYOQFchClFJcz/xL3c
 GPMzwOimJLewFHGUaLNPOD++aD3pgcAdTPjwEFrbnawGcOeo9aVVaHTLh6A6y/5IzUup2dND530
 zgLyZAtdQ1aYqwT43bhc5q8GGZbwkhi44RrPiO6wbxV+nySlux9Qeik/KNe/sCId8qpryzVd1ZS
 eWLn8FftriS0QGv8+xltz/TLVnEDjrxdGBl/xTpUgFPtY9cEsdvhi/cOJu+CgO1aX6HcCbfRbOo
 DMzzTyiMPndixsvtLUQBW71OgMqChX+LF/Ti24nk6z4tzcBW1oeIArw4ew5oJv7DacVyy+DdDTi
 z2Oe6DeVscjg4pu7aChY2RpA1zzxwUS7QhJ3BDJZGw7UjNPoDfYoRHSX/kMd+8zwZFidXAVhwUI
 bR7t8EKz9jVunow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
another round of GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: imx-scu: don't check the GPIO range
      gpio: imx-scu: use lock guards
      gpio: imx-scu: destroy the mutex in detach path
      gpio: imx-scu: use new line value setter callbacks
      gpio: it87: use new line value setter callbacks
      gpio: janz-ttl: use new line value setter callbacks
      gpio: kempld: use new line value setter callbacks
      gpio: ljca: use new line value setter callbacks
      gpio: logicvc: use new line value setter callbacks
      gpio: loongson-64bit: use new line value setter callbacks
      gpio: loongson: use new line value setter callbacks
      gpio: lp3943: use new line value setter callbacks

 drivers/gpio/gpio-imx-scu.c        | 47 +++++++++++++++++---------------------
 drivers/gpio/gpio-it87.c           | 11 +++++----
 drivers/gpio/gpio-janz-ttl.c       |  6 +++--
 drivers/gpio/gpio-kempld.c         |  7 ++++--
 drivers/gpio/gpio-ljca.c           | 13 +++++++----
 drivers/gpio/gpio-logicvc.c        | 11 ++++-----
 drivers/gpio/gpio-loongson-64bit.c |  6 +++--
 drivers/gpio/gpio-loongson.c       |  8 ++++---
 drivers/gpio/gpio-lp3943.c         | 13 +++++++----
 9 files changed, 69 insertions(+), 53 deletions(-)
---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250422-gpiochip-set-rv-gpio-part2-7e2d60e96d8e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

