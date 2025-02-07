Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F9E165F01
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917737; cv=none; b=ZY7mqTIt2MBubnZruYRFxIcBG3BsTyEcRX+i/No4HRANSZLaVSPoORturHqIBRe5pOR+QM2jWHCWlFvMaq8JCAPdHgryR/kqRb5K6jbpO0HmbcC6IIZxasqtpne8sdXkTVYoU+Rq8u+2D8MNdLxpZJjqp2FNS5YefKVxHWAcw0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917737; c=relaxed/simple;
	bh=ZX8n7LuVn5k6x5twX1Hoq4Vhle7NZg+4Zf7HsTeEAWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LhzadcrwwvDQnynbN8Q5Q2xpa06kto79iHPapqQ1f0U6Lin6XtvhnQFvl8o9pktd0g+i8ZSx/wXbmTmG3iAgsnzECOusRV4WbfTJN1Ox37WdmDYloLItbMTJuE4pbFFGQY86Uux62Dnj/EYsrrx2Yn84BO9pL0wWHJYfnic1x3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HgR19E+l; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HgR19E+l"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43635796b48so10587705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738917734; x=1739522534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFwnqBFWgDM8SO4w0yhAcF1pXvEQEwNsk7HECA68mAc=;
        b=HgR19E+lzC0rSpLHWzj7OSsjS+GcabLpw0ZQv2+p8QkBSFkSGJa2XRvX2dCmWupioR
         nV4uC/GIdMvy8TunLGe6NTqNsugWZe7iFnc2AcbBPtet+XM73NytdPZabcF8dbubPtUc
         sE5DafUufrdvv3e4RomhT5RgcH+fdimzkZvXkAuX2mgRiTgWRlOfjOEAc4QznRA/8rb0
         H5EdyIHtM8qH2gqbHRE+VUeagYFMyeNngY9S/uMy5wb7ltL2atK9E2CQmMWBLh5Ink9+
         tHo5h7Jcb3EuZCLgzKSTLN8tRvYyC7LgQ0UwRVewfyFZbZDvIzqCl7qJe7BXP0u7GKeH
         RabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917734; x=1739522534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFwnqBFWgDM8SO4w0yhAcF1pXvEQEwNsk7HECA68mAc=;
        b=IYaZosCrQn8/ObVVrVEIRdTOHHuFjjh2eetP2NuFI3g0AlWHxVsA2WwBzcuVd8KfXe
         VphRR+gBWL5wJES0Tl64HalFJcwRT9Iou916NeyDAihGHEDLQ3UdCGSSlYx8wypmGnxD
         DPinOAeHaQhE3aN8+OZsACAz7CBbPpWqA9PH5fu05SkxXUfoYqUIgAGECVSa4LuyQNQR
         fiWByo01AheH05LpOwIj5ylq46QNUBBh/dkuIToYdDXoHydxt98nmRSzjAn+oSSSGqOC
         SIS/iwIegs99ZJtlzzTnKUxi5EokFDpX9l7iZPuVEvuV8+NcJaknLUoEfRptwNBogzrs
         LKNA==
X-Forwarded-Encrypted: i=1; AJvYcCXANB5CW+JlR0qJmyObK+dLt44+cn9mfSGnzzBXetpjW+1kwMdAcuY0K+n+qUAU9JuoeSNHreA38CNVMpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUwq/zebmBpkTv7/dIajn251xzzphFfn5oBbBwlkf7JBYCd+n3
	xHs0P9VNeqQ+swsnuhhbBZiHqwd70Jm3sTGmIGkP4G6b0urnjkBW/0b1/gsfEfk=
X-Gm-Gg: ASbGnctIWnLJC1AkUs6tQc838BFdFfTf6a8XmeepVrPHwz+efbpK34LL/+/Apu1gpPj
	KzCcLTZduCUNHUFP81yuvlewcXBGyGPpK3TtNs7eKsl5NRexPRu2yQcRWjObupntDp19qZYspoR
	5I8rxSb7UXjSSKmhdNL8UbprE0O/Zn+0iTVEskMGg0aHU8GwKD8UJhz+QGlzz4g4derykWEcB3r
	Kuyb+Bj4cRUNBixA11tdK+dQmjIUUJNSJ6zZ8noNJLW1fwRAExtGIK3+e/mv8jjgUmQg5lhFD07
	DUH3z2Vw896C+Q==
X-Google-Smtp-Source: AGHT+IGhVY3Tt3MMVCmyWfF7lOSCfftHwRPlkoWYLa4lhF+bK+VaxojI/dVskS55Z71J90dOQs1S0A==
X-Received: by 2002:a05:600c:c7:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-43912d0f1eemr48321615e9.3.1738917734389;
        Fri, 07 Feb 2025 00:42:14 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ae69:c28e:8e23:dca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf7dbcsm83964035e9.30.2025.02.07.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:42:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.14-rc2
Date: Fri,  7 Feb 2025 09:42:11 +0100
Message-ID: <20250207084211.35316-1-brgl@bgdev.pl>
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

Please pull the following set of driver and Kconfig changes for the next
RC.

Thanks,
Bartosz

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc2

for you to fetch changes up to 59ff2040f0a58923c787fdba5999100667338230:

  MAINTAINERS: Use my kernel.org address for ACPI GPIO work (2025-02-05 14:38:33 +0100)

----------------------------------------------------------------
gpio fixes for v6.14-rc2

- fix interrupt support in gpio-pca953x
- fix configfs attribute locking in gpio-sim
- limit the visibility of the GPIO_GRGPIO Kconfig symbol to OF systems
  only
- update MAINTAINERS

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: sim: lock hog configfs items if present

Geert Uytterhoeven (1):
      gpio: GPIO_GRGPIO should depend on OF

Mark Tomlinson (1):
      gpio: pca953x: Improve interrupt support

Mika Westerberg (1):
      MAINTAINERS: Use my kernel.org address for ACPI GPIO work

 MAINTAINERS                 |  2 +-
 drivers/gpio/Kconfig        |  1 +
 drivers/gpio/gpio-pca953x.c | 19 -------------------
 drivers/gpio/gpio-sim.c     | 13 ++++++++-----
 4 files changed, 10 insertions(+), 25 deletions(-)
