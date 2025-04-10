Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732D126AA9C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278373; cv=none; b=Ryp8QyUe64MgO652sb+NBrfDZMpKO50ljxn/jrqr43ryVlBcvuX5MoCBrQGGx9dKzvLI/aKVptXuWM4/eFX4rAgxu3zhbnvtJK5wY0uQMchALWWmuzR6BjX8FaTz1edMCTIu2ginmwW4yttf8n4eWcwfem4bUdWx4XUwfyrI3kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278373; c=relaxed/simple;
	bh=pI3vfIbLqPbWsDOQuTX/utAtCX0Ma5Hr4cLa843LCc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8+w0xgnZcepz8+ilcQDQ/puUA0kSOl8+pK+zp9+mLPx2BRl3W3Z30B+d4KD3illGX9yKFVO4eN9uA3nwTHCPkuIww/d0D/xvIY7WuQv/8Rzps7naP/N/rfYNTsq+mZKHcVj6vxejkj+TNV/Qa+EUNM93RWRXyGi1t3cBd3c5Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oQLls0Yh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oQLls0Yh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so6808465e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744278368; x=1744883168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AyPa6ldlaK56MEPUp6to8FxZZbTIhKB6rIkU4vhMvLs=;
        b=oQLls0YhBKowCzaJDD9qfB3e6ic3+QdPpO2U8z+RfRjnG6CtR/LOfEVc4tYT6TR67I
         qdl8I73vhCLlI6hR0vS+x9zN4co5XKwFgn08IBinhQs8JVaKEQzzzqHiTNOW7sB69EvS
         +Z3UycOc4c8oMCVkzlMwxZMsN8d9bwjKgoYYCE5IMyQDaWfP8DIqxTXV4ujPKiahYpLV
         sz0TyRwr3p9WbBN5pW2x3HyiM9EPwh+NTrsqhGYx6Q45qR6am3vieYdAXjQuU24N2VDO
         Q62rp+r9r+aNeMYCGd0qoWUA2fgsmslCPZ7tqkVw6uoS0/0E79TvIU7BArgu+YrVQq8a
         QSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744278368; x=1744883168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyPa6ldlaK56MEPUp6to8FxZZbTIhKB6rIkU4vhMvLs=;
        b=w2NA8NdZ+snemIqx9FKDRB14AGhYAF/kLZpYGABzCxpFnL9FkhWaMSFV92ion2X+xr
         iEDwYu0IqxdhetF9fjdJPW9pyWbejpk2xfFIsTNkMhG9f9rQN7oXniw0Th7OWXqN/5X4
         8huMJy60FZccshHAYJPJxugRtk76bqZCeQC2b1Flv1MPdPES3DJ++eQSzYE7drjK7KW8
         G0cFxfkQocNx7a/LQF3QCqxuln2PspkdGaybWkiX+1IlV42tYJq8ofWyrihKiaAD+bwU
         NXLrN5Y2ujh1S0WNKYUS5jD2ls0sWzzv6RRm/DUslLtDkGC9yhy0M2RzqNIOBTkjFYLT
         5+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWzAmng/wAP+68GbwDntDL8MPEEvr57D/Puj13Ebgpt95G9B/kUEDnqa7TvapBaR7E5X0mJrRyIyoWIgd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHxL5fSZCJKmDCRict/oX/4um7KLc0ZV3Et4iNAVlFu5hbZC72
	yUFla03JlAQSTyKyTLqWgghqLcKhyzKvRiVHJcMILRQY41+xTIdk9grRMQTGXPnileJeJUXJC/o
	2NI8=
X-Gm-Gg: ASbGncvopOovYEBbLFZEj40OS0phCVoqDyX92xcCykjsTmAwQd0sVZQU+7sem+4L0pD
	76caiFKo2zZmgU+8VukQ/xTpewehxdsjPesU179QkoJ0diGe/T4tY/yOPb/eV+JkEoapk50P0pV
	KCe/fNhBIW/Y3kc5SMGZ0RzVLflReCIcXRbniEVI5RfD0AsuU+vko72YDr+GoucCumZvkxNY2qu
	wUZC2AwO6UFKdiHLVN+p/7GTrSimEnBSbBl9nuwUK2Md3dbMd1i4+c3AcL/PFM7faencrqn5qXb
	XVwvMOvdnLpvv0888xQnh2vq4/ALHfevx+sRnC/l
X-Google-Smtp-Source: AGHT+IHVdnD6pkQJ1mtCB+lyukhVO9gye/40iBh+MDKdPiJJHPaca88NCEFrQ3Hp/AwTWVnFHC9fGA==
X-Received: by 2002:a05:600c:3ac4:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43f2fdcd138mr16185205e9.4.1744278368045;
        Thu, 10 Apr 2025 02:46:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2a13sm44847075e9.10.2025.04.10.02.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:46:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.15-rc2
Date: Thu, 10 Apr 2025 11:46:05 +0200
Message-ID: <20250410094605.38665-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of fixes from the GPIO tree for the next RC.

Thanks,
Bartosz

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.15-rc2

for you to fetch changes up to b8c7a1ac884cc267d1031f8de07f1a689a69fbab:

  gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment (2025-04-08 11:06:45 +0200)

----------------------------------------------------------------
gpio fixes for v6.15-rc2

- fix resource handling in gpio-tegra186
- fix wakeup source leaks in gpio-mpc8xxx and gpio-zynq
- fix minor issues with some GPIO OF quirks
- deprecate GPIOD_FLAGS_BIT_NONEXCLUSIVE and devm_gpiod_unhinge()
  symbols and add a TODO task to track replacing them with a better
  solution

----------------------------------------------------------------
Andy Shevchenko (2):
      gpiolib: of: Fix the choice for Ingenic NAND quirk
      gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment

Bartosz Golaszewski (4):
      gpio: deprecate the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
      gpio: deprecate devm_gpiod_unhinge()
      MAINTAINERS: add more keywords for the GPIO subsystem entry
      gpio: TODO: track the removal of regulator-related workarounds

Guixin Liu (1):
      gpio: tegra186: fix resource handling in ACPI probe path

Krzysztof Kozlowski (2):
      gpio: mpc8xxx: Fix wakeup source leaks on device unbind
      gpio: zynq: Fix wakeup source leaks on device unbind

 MAINTAINERS                   |  2 ++
 drivers/gpio/TODO             | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-mpc8xxx.c   |  4 +++-
 drivers/gpio/gpio-tegra186.c  | 25 +++++++++++++------------
 drivers/gpio/gpio-zynq.c      |  1 +
 drivers/gpio/gpiolib-devres.c |  6 +++++-
 drivers/gpio/gpiolib-of.c     |  8 +++++---
 include/linux/gpio/consumer.h |  1 +
 8 files changed, 64 insertions(+), 17 deletions(-)
