Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEC226A090
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959569; cv=none; b=AAO/O5dAafWK+o04J6WODwcCFODBokXFzOy5n499nfw+gOnL03QMqqDODSUGvjB96zxsWcKU85QH4A3BVzytZ1TLW7srh46YMyDqV7gEu49H6I0qsZY/YzSzNl0Ul6Aj/HZSrjIktlAv8bx+TGKh3HXu5XQVZs2i08awcWD7Xgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959569; c=relaxed/simple;
	bh=b1i7Oiq8VFHbbF3djLlZfHnEoM/NeUuDRhdh117Z1bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZB2Uv2+1grk7w93OqDX7zwwzfCHkTRGdYrN+sZ3jObkd4QhCI94k1SBjU3wfrM8mAq/oRINwarbEWr15Cvg6T0Ny3QiC5V0r5sBfGDx5fOUx/ePaMjX6IZ1bs29SdWjsAbxtB/uwQf8jt8jYf5GsBSZZ9tMJnSqVO72AUXYRc7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j8WkTGHC; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j8WkTGHC"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54af20849bbso7435196e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745959562; x=1746564362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/4zHTkk4RA8Bdrk3b8sTr8Stn91NAdSB8LOZDVLuso=;
        b=j8WkTGHCBgK/wxLfbrIW9qzgP4bhY+KMLnppVla0k9JRyQXGe4HXj+rwblwMXFuJFt
         QwWgmVSrw754SK8MYE/QtC8u6tC2S2CHSfERpY6tO1dUUWOF05bf1HudiiCwwGvE7eL9
         gxsqDaWPXigg3bkrZxP7Y+B9AzdN78F3W9PqGiT0kC/h7/lDGfDjEpOIny3lqz8U+nmC
         DkBpKToeqkyndSwyzMzxZq62G/LpXFNmHpj0g4dwihI2RcoVKYAQ2Yiz8EW98KaUmxNP
         ngJYdErVZ6NP0tRXu6C+HWFCZ45yz2j5T4sbDeJKsDRdpiUXYNuOcxtvQC4CRlcHiEFL
         5PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745959562; x=1746564362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/4zHTkk4RA8Bdrk3b8sTr8Stn91NAdSB8LOZDVLuso=;
        b=TYA8lkMLxvWfLB1SjWv5oEAE9kpf1T96JAhKjjQgp+OV+Cqv54TiBqnbPl8iBK7jAJ
         YEDRCYfp5zPopDB3hRYr6GgX68rAxh/Jw5WRHMAfWNNCpthNzHC5TxKDMZeODFQsMX5a
         L5/8EzrzlBBcrL++1HEwAAgF5XcKf2SNI2BQUJRVVc6YHamjs1LpiNVyaFXSKRn+42Lh
         SqdVhHIRGW0tTHpb4eIamnRdJfxKgzIvZjTqr3+0aSFnLS3197wQZ+Bt15/emcx5Hj8V
         BwihxtOygt2/a8QqMmcmZfdAg+0v38QXkhQ9NbZe831FCOW8SW2p1XN/cXPl2np795bk
         epag==
X-Forwarded-Encrypted: i=1; AJvYcCXg4ztEGxIIS29daptW9G0kkoEuP9HuPHr1Dm0scGRFddJ9dKtL6pvLg5CPfIuz1R7UfcEUlBhVnKiIn30=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIiQPkkDS4DRiHQviESEZI3kKvzjEjQxS0q0sHl4kRQ6Oba07c
	4XdniT1D+Rkhqg4xd+TFDJBiHyzrqZFtd5IGGoKJtIIow3UP449pOdBAH0ET8e6V81pf2snicng
	9
X-Gm-Gg: ASbGncuwRaUGSKboL2b0G4Aknq0GiH8LX6njbBmX43DEPJn7tZI9g2knv/2uOJCHyQS
	ekJ9VmywSTbCSTmkiBmZ+uKn/aFoVnm4XWBNduLdRUs1S8nVOeA8FzzIgjIm/74vi8A8OjWJiPc
	ozi3G+4UL+BaYtKFbFZAOgKjxdbBHnUdMZfSDROsFLCeHRV1TowXUnaZu34xRwaCBRyL+Ww/fgo
	LVvt1cAn3FI5wJ+GOb64NCjHc2IwceZUqxEdxaAcX9d3XTEe/EGIYd4QpIerOVqykFY6C9wSckL
	FgIGeKh6mWuHkNMgyVhtPNCnrwrTTHSrw/tpLXnfshBq2V/KLM/21DoT8QHbxDdqVCeIxCQaY4q
	KYkLPbGC9nnv6tHM=
X-Google-Smtp-Source: AGHT+IHPYjzimBIFPkgeGK9SX48JxJc5HDD75O9G5aYZLS5ww1nZYuM142Ib3m8L89hZ9aqiC7cKNA==
X-Received: by 2002:a05:6512:401a:b0:545:4d1:64c0 with SMTP id 2adb3069b0e04-54ea3ac85admr25479e87.27.1745959561913;
        Tue, 29 Apr 2025 13:46:01 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb262b5sm2006777e87.36.2025.04.29.13.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 13:46:01 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [GIT PULL] MMC fixes for v6.15-rc5
Date: Tue, 29 Apr 2025 22:46:00 +0200
Message-ID: <20250429204600.176542-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Here's a PR with a couple of MMC fixes intended for v6.15-rc5. Details about the
highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git tags/mmc-v6.15-rc1

for you to fetch changes up to 77183db6b8dbd8c352816030b328dd55993dc330:

  mmc: renesas_sdhi: disable clocks if registering regulator failed (2025-04-07 17:58:41 +0200)

----------------------------------------------------------------
MMC host:
 - renesas_sdhi: Fix error-paths in probe
 - renesas_sdhi: Fix build-error when CONFIG_REGULATOR is unset

----------------------------------------------------------------
Arnd Bergmann (1):
      mmc: renesas_sdhi: add regulator dependency

Ruslan Piasetskyi (1):
      mmc: renesas_sdhi: Fix error handling in renesas_sdhi_probe

Wolfram Sang (1):
      mmc: renesas_sdhi: disable clocks if registering regulator failed

 drivers/mmc/host/Kconfig             |  2 +-
 drivers/mmc/host/renesas_sdhi_core.c | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)
