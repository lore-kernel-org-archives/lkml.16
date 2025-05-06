Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413372641EA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522116; cv=none; b=tax/nrBAgR3gkgWr5dFoD7EYyX7PzMzeSHg0lDAo8LQkfX4kLKfTu+hdhmaQyvS2RhUmYSk0TtuYv23GiB69CiZHVlFY5CLHucz+t1wF4SNsntVTu7RLOloeiIrs7RNVMjTnnrzrwsep9lOqX15SUayjw+cvKwLFKKEww90DzTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522116; c=relaxed/simple;
	bh=zzyfhEwAK0od7u7qQvaEU1irR1bKl9oLt0gopkvJps8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bv37ASoJHNfxPRQrI3keP0JOa12SomLQDwCiUqJLvmBGjuie5KYGMfZEOHlCv2EYNE1zV2ESbWp+YkJGTC3KUM0+4ucGCzbr9YG+FFYw95+uqb6UXdusloEuGIASf0Jig5rttxoymOQiX/0UbF0ekuRRch4LchUPUZGGKVmLgQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RGd0UEv/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RGd0UEv/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so34455325e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522113; x=1747126913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkSckdGbet2iMO3lK9JiFkiMA12riXIjt+egFZP9xhw=;
        b=RGd0UEv/a/LG4BHUNtxIVCW5vNPWSKUb4rpdeHjRUJEWAmcRkF0DKmBK/3xQI87k99
         HvQgd/l/KSp6nL6y8sq9b4ELzSFbqjoOk+DJJx6MXKXYFvdBwtOzyEBr6Gt+SABDM7hl
         NeoG6guYMXm1hOXujFXkTN35LsxzTs8uoFYQj5f2IY0cK6j0PL3VeXqVIJH06agyOtqx
         AlGvkjHAE0xkY6AGgqf7Vgbgol5yW0XUhvRfCYwHGTsjOmaK5jeHAVJy2+YBrix0lFgQ
         /zdhPCFpYZ8jvrDASYnORawJ1j6EzipETxYC4H7R5vW/qeaVMzHBRRwtkMzFPH9HRGmr
         CScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522113; x=1747126913;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkSckdGbet2iMO3lK9JiFkiMA12riXIjt+egFZP9xhw=;
        b=g0WYekJ974cWvCdYZHoHnFTQxm74WbaqEtEs/0/HplXTU7d5bukAiN+4F/skLDBnUv
         FXfNW2L2fTzjHqUnz5kvnmYK2B4djYR85Xcx3QiadHNGoxGwmD2fEmZgJYGyuvIkvKeH
         fJva6uDhED5osnvQ+7JijI+1vqEWOwZKafj9OeN1DT0dEBm/l1HQQWHbxPN+XsGVt9Yl
         UnrXsPXYukpmzb6C3tSSQzZAVzFXXRP0C36lS6+JoEqU/A8AO7GB5h/vgGqnpvb89xZx
         D1Kei6w3V19qDS+mgKHtq/y3t8tqQRRvxkfVMB0lZMzNplm2XlVDdhfNwczYQHhKfLRs
         vHnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcUe8bcdNwy6d566ZqCeizzoat8mPfp1IzQBnARflrsIUj+VO6WmbL1XLEKbztYKAbHAim/a8Z8zAOQvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YybMPUERRc6mi3XMZIlP+7X0e1UxPq7Q9I42uQX8xuu31rjCF9a
	2tyL3NbQZGKSZCvY2AqxDY43mtjotVQiC6HBvZwIfo/8zBYGYvbt+rh3Jhx9cne3otX8MkVOEDz
	4
X-Gm-Gg: ASbGncuZ7ESw8HUJot1o/cROPBNfXV8/T6c0TkFTZkGbeDqNxLWBqhjCV9VC+wbpweO
	AOJ4/o+ivMLpSaLkB3I1UwWvaa/2bDKsX38MAocVSk96d1Ij++56VdRx3/QiIWPF5zT3WAFUvQB
	hU7RJn7pFbxJazI7xKFSWcy9PNXBz7KJtsrGJ3IRinQHA7zKpNnPPHFyLQde8lAyd2054SwRG1s
	9gAyiFvdXk8rzzO+V1QJXSaAKikjshTIMe1Ke5XIV0mHXbVi3LNtQ72sVkSAwSSJsFq47M0WuUm
	z3vQPQfLooxs5U4P5zR5ajWZWjROJM+HJz2vqT1g3khxag==
X-Google-Smtp-Source: AGHT+IFj7sycuby5+Xisi67I6ctjifRj/oOl9WSXmMnv0sxBewhRFv1zbclSFWHzUaj8JwTL8LEU3A==
X-Received: by 2002:a05:600c:4f54:b0:441:b076:fcdf with SMTP id 5b1f17b1804b1-441c48b3c97mr66535245e9.8.1746522113070;
        Tue, 06 May 2025 02:01:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 3 for v6.16
Date: Tue, 06 May 2025 11:01:43 +0200
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfPGWgC/x3MQQqAIBAAwK/Inlswrai+Eh3C1tqLyioRRH9PO
 s5lHsgkTBlm9YDQxZljqGgbBe7cwkHIezUYbXrd6wGPxNGdnDBTQbl+Y9qkWJz8aIbOWWeshxo
 kIc/3ny/r+364QdFSbAAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zzyfhEwAK0od7u7qQvaEU1irR1bKl9oLt0gopkvJps8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/5slEzhsD4QV82YbNGPsWnFf/VHMCf8ipQG
 d21roh9ByyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP+QAKCRARpy6gFHHX
 csZxD/4p08GnOddD9OWGTSyOB4+3HZn3pFgEl5zIiWCeDBSBuwfSNxTEfLgdhQhMV4SWPcuMgz7
 zztx5NWLVVaBwFAhh45V+ILUKvXpMTIsNgCEXmDYu7/opEgQuH6qEKzTIRBbTiFQmov7SdGC8bD
 4l2vyF69wBGWNC5gL+5ZsIm36sgpJsAFAJN4GOV/Y+QLZ6tC5z2RTD5bEX9gz5q+peiAEEKgm/9
 3xsK7obO2K9DiFYUjMDcsKCEVPyNV53I67w9YcZYBjCDBgvbPPt0keoMJpHfeXPxDKeD4auTRJl
 sLHwIRGdoX8cOmOQTm1sYsD5ISGRd6IYV0RdZ82D4gKBKft+gSgA9+rzZ2+Vz5Df73nTGCnrlA3
 zaYVp8j3EcNKsUfT9fjdAe/zE2zn5OEcroiZo1iBJDTOzR9gleq6RBTf8Vnht+IoUhWwt5Dy5ee
 W0QZQ5x6shgBpFdgGbdNXHfSfNcmON/yayuAzZoKud3EQ/Pdo0qaJW0hbE+ljm5KPBA0NemlL7/
 m5mcq9EaHsXMtcLGVmaHTwCQA9LMiw4YIKOS2CRlI5wOljOBcoDPGnyRWWx8hBLBzaK+Wt/w2Hf
 63/qwQuNNoogtfd6p4JxCxYiqaroOH3mBmEhlIqJsPBK5NW5SEPu4bc0c9WiACtIiJhLM7RCJok
 1eVp+i8HvwPoY0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: lp873x: use new GPIO line value setter callbacks
      gpio: lp87565: use new GPIO line value setter callbacks
      gpio: lpc18xx: use new GPIO line value setter callbacks
      gpio: lpc32xx: use new GPIO line value setter callbacks
      gpio: madera: use new GPIO line value setter callbacks
      gpio: max3191x: remove unused callbacks
      gpio: max730x: use new GPIO line value setter callbacks
      gpio: max732x: use new GPIO line value setter callbacks
      gpio: max77620: use new GPIO line value setter callbacks
      gpio: mb86s7x: use new GPIO line value setter callbacks
      gpio: mc33880: use new GPIO line value setter callbacks
      gpio: ml-ioh: use new GPIO line value setter callbacks

 drivers/gpio/gpio-lp873x.c   | 12 ++++++------
 drivers/gpio/gpio-lp87565.c  | 15 +++++++++------
 drivers/gpio/gpio-lpc18xx.c  |  8 ++++++--
 drivers/gpio/gpio-lpc32xx.c  | 28 +++++++++++++++++-----------
 drivers/gpio/gpio-madera.c   | 18 ++++++------------
 drivers/gpio/gpio-max3191x.c | 16 ----------------
 drivers/gpio/gpio-max730x.c  |  9 ++++++---
 drivers/gpio/gpio-max732x.c  | 15 ++++++++++-----
 drivers/gpio/gpio-max77620.c | 13 +++++--------
 drivers/gpio/gpio-mb86s7x.c  |  6 ++++--
 drivers/gpio/gpio-mc33880.c  |  9 ++++++---
 drivers/gpio/gpio-ml-ioh.c   |  6 ++++--
 12 files changed, 79 insertions(+), 76 deletions(-)
---
base-commit: 407f60a151df3c44397e5afc0111eb9b026c38d3
change-id: 20250506-gpiochip-set-rv-gpio-part3-9f8264c3c23f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

