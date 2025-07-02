Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43388307AF3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467264; cv=none; b=HKAEvFxgPSrbpH5PezXTGmD5e6GcNOJiakPha4kCIJLNOH2TVjTZuf+Kyy+ZseFlK38lO6ML7jdAigL088apL2Pk3uLxqPaA497dXiY4QERMhIRD6GdOrvQKBXHQmUP2MwdtEwqkW212peln8xxX82E7ucvXS1LaL/5djmaA/cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467264; c=relaxed/simple;
	bh=mZF2UqPVsiH2rz0Y3FEEnO3lQKIhugaLHTZFjtoPwUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eRsbJNZsgnGA2SKfC2o0xm1ZwSP8FQrYLCzi5asPZmHttxVBw52sj0zv27sATiubKKqO1sv2Er9OBNHNFihzkepUsT2lP3dBJBQY3eS9Yct2lQhlmJECZZ2w7W2K2f9aBYL89k97toXSjMWRE8y47SJ7HNmStpFObborckGVLQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKOKf0uL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKOKf0uL"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553dceb342aso4150288e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751467260; x=1752072060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=98PzJdityG0SlvleABMB/pGAMlOmwWmHSfdYpaRc+uw=;
        b=gKOKf0uLbp3VSylawENZ41zAqKqCorrUxfJjkhHYjceFMvLVryS8Y3e3lVsznus7VP
         g/AgpNP28aR2WTuRsyD+LIRUAKMUdfI/7yEr1a//ozTxMr6X+SFdvfJLz0uORpNZQXh9
         yBH0Uk0HQ+oWV5AIfSkZYkzUS9TncgwA6Ucjs4+BOYo2DR8dSj8H6+c5Aq7OzJmgE3Gs
         5xaHAzOamdTzyh+s1joXDBrbKR6hOZCFDXb88SZZfPsX2xiieEZNfwdHwZJNkO6t7u/3
         beZ3gt1mT4s6Gr+aLv0aZ8Zv5UfJwt+AxDqmksgU7w3YCK6G1f0pPdoOduELVfs7bKLo
         NRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467260; x=1752072060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98PzJdityG0SlvleABMB/pGAMlOmwWmHSfdYpaRc+uw=;
        b=uo6jZpNXPdfEPi/ueOXJjgnPexxAIjEs0DocqMOCZTxGeBqsLnhmGGGJuHbq7H/eUG
         M+OMbvi47oNyY4lL4sxMJEjFOVdAtG6sTn4JZAjvbT7qBE68crTy9zcsfY/5LstEi7vC
         t6S9vBjP+feUoJSDOYSQYsrBmplsNrxnnB+K1YTcJZ+6yFkEjWc8iC6tBQM+jWsIeGFB
         +wdvyLn0lAHo2Axi36BDKxVeebWTOGqj55InWuBsDKUycB7JVWkBhDUWyMNK8gxsvUuy
         q+ELfL9RkMtNouLotGNY08xdhuj7pt9z1NSRfeA7Lvadcv83dCtexAS7L59KSqfR9aEV
         HsPw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0B9pyV+/A6JqE3FThORn8u58iVh+n53jiSuRO7QGad1RbdLx9YyXIBURF1M18vd0mTt4XWoulL8wFVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0l+f0T0dsSFHiEcm7gcN14LKSdmhmg7g+63/ZJp9a+zA3Vuvi
	82MrpQ1VkqaFb12kZbP5YtCxiTmFD+fti35iNi1HKu36gz+6fnh1v7G/T1dGZTt7gW+9QcWe5dC
	O+Fwg
X-Gm-Gg: ASbGncsaTRH//W9lXg/E+hJcFYF70f8Q7Uz8IrzyfKT0eYJ8SwWgnxW+4rpRIRCChTd
	KzdnD86e8q0YYOpCNNSsgh6r7f60paH/hH2AWloU2GzSNW9MIyVV7CPyd5IG3ZbJbETub/LNO5K
	LpOhf5lA4tKhRowmN5ZWj8YHuf0KJLiOU+8c8hemHHhNr1GH0YIzTjcacpZy3AYaLFYlXidwLBz
	vGpZUnphKeMNLWHMdf7FQ1oSewc3G0Of9CyeRwl4/jmZi56JUQW/pvYOeFqQZB+ucWhOQ4puXfB
	uWKrk+HVsYD1X40DNQsUfLeCGkL4J7XW36v9pKU9eJk9OnncFg4RG5eSdGnxjsH1ZGRU8224f6b
	nerE0yBj8pjxVIsisFkEIR0451XS8G70jYFqR
X-Google-Smtp-Source: AGHT+IEQJk+3ZM5WHnNjbhQ/1w9G+7dhsU/8kGSvdH0GxP5RtDlizISYJdnkdwnZOlCw4iqiGgpsXw==
X-Received: by 2002:a05:6512:1290:b0:553:d122:f8e1 with SMTP id 2adb3069b0e04-556283556e9mr1116776e87.43.1751467260205;
        Wed, 02 Jul 2025 07:41:00 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55627987c8csm295213e87.253.2025.07.02.07.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:40:59 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [GIT PULL] MMC fixes for v6.16-rc5
Date: Wed,  2 Jul 2025 16:40:58 +0200
Message-ID: <20250702144058.29486-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Here's a PR with a couple of MMC fixes intended for v6.16-rc5. Details about the
highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git tags/mmc-v6.16-rc1

for you to fetch changes up to ec54c0a20709ed6e56f40a8d59eee725c31a916b:

  mtk-sd: reset host->mrq on prepare_data() error (2025-06-25 14:42:51 +0200)

----------------------------------------------------------------
MMC core:
 - Apply BROKEN_SD_DISCARD quirk earlier during init
 - Silence some confusing error messages for SD UHS-II cards

MMC host:
 - mtk-sd: Prevent memory corruption from DMA map failure
 - mtk-sd: Fix a pagefault in dma_unmap_sg() for not prepared data
 - sdhci: Revert "Disable SD card clock before changing parameters"
 - sdhci-of-k1: Fix error code in probe()
 - sdhci-uhs2: Silence some confusing error messages for SD UHS-II cards

----------------------------------------------------------------
Avri Altman (1):
      mmc: core: sd: Apply BROKEN_SD_DISCARD quirk earlier

Dan Carpenter (1):
      mmc: sdhci-of-k1: Fix error code in probe()

Masami Hiramatsu (Google) (2):
      mtk-sd: Fix a pagefault in dma_unmap_sg() for not prepared data
      mtk-sd: Prevent memory corruption from DMA map failure

Sergey Senozhatsky (1):
      mtk-sd: reset host->mrq on prepare_data() error

Ulf Hansson (1):
      Revert "mmc: sdhci: Disable SD card clock before changing parameters"

Victor Shih (3):
      mmc: core: Adjust some error messages for SD UHS-II cards
      mmc: sdhci: Add a helper function for dump register in dynamic debug mode
      mmc: sdhci-uhs2: Adjust some error messages and register dump for SD UHS-II card

 drivers/mmc/core/quirks.h      | 12 ++++++------
 drivers/mmc/core/sd_uhs2.c     |  4 ++--
 drivers/mmc/host/mtk-sd.c      | 21 +++++++++++++++++++--
 drivers/mmc/host/sdhci-of-k1.c |  3 ++-
 drivers/mmc/host/sdhci-uhs2.c  | 20 ++++++++++----------
 drivers/mmc/host/sdhci.c       |  9 ++-------
 drivers/mmc/host/sdhci.h       | 16 ++++++++++++++++
 7 files changed, 57 insertions(+), 28 deletions(-)
