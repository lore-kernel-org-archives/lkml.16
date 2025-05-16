Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCDB233127
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390351; cv=none; b=bmmzn4LgRFPMmNJ/N+YnDUKcaY/48aVM7TrKk8h0/UyGxei9XoWvso33gqvVnNIMot/SaiVrb22Lo7n1TCyfjcmThmZg1KC90VQETXNkfqhbnBI1JV/CMhscvBFLFLT/S5LOpjr1wp5R8nTgYNz0d3P7GieAL2e6EXYXkacpmeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390351; c=relaxed/simple;
	bh=WKbPTQZBPp47OtTMaeJRnZhprrR+QWUIIiMdvhk6O+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLo+OwKwd3oSyaqV7a6F+z4W/kofNA8WMB+JchZHBr6Dfy9kU02dL1Aj6qG9EPfkSfyuVAjmwCFBaCDPtwZluOLMXS43LdhDqhKxXpiFmqVlMoQKGhvnz87gA3G6j+WfqjhAtPLHefQEZgXVwy+G81tsvhssP/b7ashsdHaoLek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m5hUg6hk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m5hUg6hk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso14176955e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747390347; x=1747995147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jdh/6Db9vqcLBveWLXLf8Yh1TWM9Tit87sYsSf0o3I=;
        b=m5hUg6hkeLZjk3n9iEKWJYcDbkx1FtRNAAXucQ5yGnetGFAWb7N4XyJSkaHx7ppHBd
         dpekFXGczQg0Wesn+zan1HYInIOTOP4/DCZ47z81BazdSuk9JBYrH3sP4RSCSOO0AQkY
         BTC2mKmkc8Ht7Pjobc/iXSXPOmr9+LP0Sgd1VOns/Mj/t0zRpVNOIB/XKB4qwrJEe7Pz
         wn6q8EN0ZfFgRIwtkMXcoId06/NSXsZfxCFtkD/TGu0/KsSumk9CgIAZYDG/EQyoP3Yx
         DtQ535fd5mhJYhZfL79dxUxoRUrtWYf+77mU61NlMA7CdfVO9PaXOiRQQgMi6yC/REgg
         VONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747390347; x=1747995147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Jdh/6Db9vqcLBveWLXLf8Yh1TWM9Tit87sYsSf0o3I=;
        b=lRnm2zyFl/uVdHyKf6R9sPo75kf38IpCJf4UNsGd5xrS0U5btvZBhnoXxyRQVSL1TT
         Ei4ZXIaWVdvYRwCGK4txVa0yomo1xwdD6TR/GNBJPtZKI/G57KMhwpuON+J1OfYK8qm8
         PLyJnC05d/l0K+jgFeN8zY6rJUdu2n2adNicIDdF3li5iNg12fn2Kn/Ubo3fOnC8RsJ9
         XeuUYa9umUJIk/a+wLBfgsJocZSYY/koR+/BxGH6lBR06gilRUdSXbki8NNvX2fK3Y3F
         Dk0bTCOmy1rsMMKsZ8iakuFAkKdVTGedEoj+CswYInzScfBlc7sgEAiBuOZpwzcYKcWI
         sfLg==
X-Forwarded-Encrypted: i=1; AJvYcCX7PwpLwp4Ifp8f8G6+ZEjckw4Aw9Z85SneXX+lJtNgpXSHf4X8wC0Ibdy81MgaO0UnbcsuNedZiOmcIqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmrSWuQfA0lMD1YQs13Cb6pnJ5/3iO3NFOrMfP66yhPHTAV0Bt
	bcGgOyzbPxFOnofQyfy8QlJkaoanGHAAUmFhBBqvxLtk4iL6HfbJf3ECthzXc9JcHbQ=
X-Gm-Gg: ASbGncu2EaysJ8uSbegrFGVKLLhXD9qkiBmvejahJrfAvx1GsjuTtWAtrxPVLBs+H45
	GJ+rGYKZSko1E997W0nt0TcIzOpGQhn1XsCwn0zUTfq345gy0+LLGPZFvOJLW4KnTcTxFZSP+5c
	1LhxuW8Ss/q0s5cfK3k/RsHkBtZBrBZ/wFnZu0kVJ3Gyq/0MJRjFZi+aPRZ8mqeseMa8Fm22qLH
	sRcrhL3HTqBaCwpl1eCkCmvfArjibpuBM2HyKJAcpq9ZC/8xn4SnvYbvlfx8J/DI5uHZdKvxEmD
	pE1AnU+HVQ/HPAM0IL1B0tzPazYdxUiQYFFpDYvnIG5m372syWfSyn6PNHhrmlaUGBtxccjueST
	cQ2CjwasSBTUqWV8B++lG4AKE
X-Google-Smtp-Source: AGHT+IFY05grmJG5DGrrM8YVQcuoQDtg1Q4hmlnX23ww3Y30lFYb2wKVFkildRKC0v7s0IYcCizWww==
X-Received: by 2002:a05:6000:1862:b0:391:2e6a:30fe with SMTP id ffacd0b85a97d-3a35ffd2829mr1719553f8f.39.1747390346542;
        Fri, 16 May 2025 03:12:26 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b57sm103875685e9.21.2025.05.16.03.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:12:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.15-rc7
Date: Fri, 16 May 2025 12:12:15 +0200
Message-ID: <20250516101215.5822-1-brgl@bgdev.pl>
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

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.15-rc7

for you to fetch changes up to 7118be7c6072f40391923543fdd1563b8d56377c:

  gpio: virtuser: fix potential out-of-bound write (2025-05-13 12:59:30 +0200)

----------------------------------------------------------------
gpio fixes for v6.15-rc7

- fix an interrupt storm on system wake-up in gpio-pca953x
- fix an out-of-bounds write in gpio-virtuser
- update MAINTAINERS with an entry for the sloppy logic analyzer

----------------------------------------------------------------
Emanuele Ghidoli (1):
      gpio: pca953x: fix IRQ storm on system wake up

Markus Burri (1):
      gpio: virtuser: fix potential out-of-bound write

Wolfram Sang (1):
      MAINTAINERS: add me as maintainer for the gpio sloppy logic analyzer

 MAINTAINERS                  |  7 +++++++
 drivers/gpio/gpio-pca953x.c  |  6 ++++++
 drivers/gpio/gpio-virtuser.c | 12 ++++++++++--
 3 files changed, 23 insertions(+), 2 deletions(-)
