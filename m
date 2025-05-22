Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CBD28150D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747953528; cv=none; b=ETCb8o4cyxUs6hdB0soHdI5RKRftt6dtAmxY4mDCFKBTZkncPxYyHuU1sqdK7mjgahtSoY5XLmc1aRrktLlxqUdRfHnzeLzDPzF5SvevzIiU0Lpzh00XqtV/UvcU6jbBPr/OBa3UJXVSl2qrUFMUPSodN4hghT0Df5ntJw/jjpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747953528; c=relaxed/simple;
	bh=a3PRYd3Cjo/rv/itdwXNTrt3wKQ+asO4RWYKiV1N2rE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FF7nIaoJeRXYm9aUDf43X/62tVbncZQjUZdAoF45NAxr09Tvo2MpUBixFhj6qusyLyHD66oKxXMthc6qbBt9x7HJwJ/Qp23/gReIGVt7s2MHOYxnuTFj0LBcUFtMaaYGlw9EL7cjm04wxNpk+oBesmr+xHQ3uxoAk4yTwWRP6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fueoYtN9; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fueoYtN9"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54e816aeca6so11837367e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747953525; x=1748558325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=162PHkNGgQO3PjVXfDykPBsa+evqNxguX1rebBysG+k=;
        b=fueoYtN99VdT8GS7lnPa/Y0Rff8e47AURXcWXbGA+sMzcHNjjnpgdUUdYbsgLgpYpv
         w1i543W6bAvN4nMKtZ+UAisGNAWd1Ztx4Aap5yCHVy6Saa/LC34W+KzfP+DDKjX4y96O
         wT19r/qc7sfr3gxqJhj6axitATH9uUPpdb2EyCmPCStIz9OD2XIkEDwYbb/pmTgZo11c
         5YQdEnqejgcSrn7WHpeQQcpytGy1vUdSB43nEnNY7tBpEoVfQuONEbWDJVLzOplpjpz0
         vIwUnDzmLa/2lMfSd6oytD/kmRE8I9UGwHMeYLDiKmDCJYuY38szAThfm7Ix9Cj+qmgk
         uRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747953525; x=1748558325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=162PHkNGgQO3PjVXfDykPBsa+evqNxguX1rebBysG+k=;
        b=CV0SGRJ2IM9U1FRdY5EdkW8DDej6s7bOeI2hfvytSqtz2UpY8Z1+/9stZo8ayWhNC7
         DYKLdzxj81vqSGvTUIcIKwJKBgk3uCUato2g10CSXJGzJgeg8O7i7BHtANN7OIjWZFlU
         9raGKMptQz3cHEcpuYAs5E9dyw3bJTJMb6pwwB3cveKaWHg6EUZkpJAg80Q5seRcX1vw
         t+79oiGjUSv5X+HlMVw39sp+dlc10QneZusLqIdV/8PJCsbR5b4Jh8i0Q7hyKKFVNZvT
         A3zVifsOhKzBGPFl4J06Pt4mv8RyZ/1LobzCTZaMWoT+jH8NwIEQsXtvJITPLCPpynE+
         GUZA==
X-Forwarded-Encrypted: i=1; AJvYcCX1VshjQpQQ2CmUSQG49UkNlz+vbPo+RtGPjXmMex2XQaL5ujhby4wwyNHGbJBDtMo7kcwvEhaSIEIEOSE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo8IEScFRIRyiCa86vofKAR8eldR5G1HBEFmTVIrqfHk2B0Sct
	tI0oaoKZCfYpbv4X0/YDyamAmheFUKW2gJnbGhxU1R3dgrC/Nhhs529tGRMlT2anZpI=
X-Gm-Gg: ASbGncsrb3j5XbIJl/j8gbh6Hofe3Odl6Hhid+3NJcuMxbM4jF5M0ymFZgH0atMaEEj
	c4kPr3hSgjdGLmbXTmNuS3iMhLg3FoSkI5/fXwzgWNUVCjWHdg3id/UxUC/OtSMbKwM7Y7tb64B
	5q1TJQhqfsSRkEG4vPCV1BCkk/KEyIb+lCZ4Rfaad3NvWjImsq0CbtVGcMwMBVwkTv6/WntuOY/
	geVsdIj7ahkbWkuDGfJJUcB4Atzym7xxREQR3B3xaJ4OGzk/NY2TzYFLHKSjgZ/SFkceq3Byflf
	t3BZK2Zhh7xMjKnYGw/35PRYwmYmJp3QkVrMd69Efp1pkmISYlZUjWZ8Tn150CO2jL4pshJ87T9
	hitkmMoAy/TyB1elqzbk7yYjCAg==
X-Google-Smtp-Source: AGHT+IHpKvG7QTF5JMFQRfjxHS1e4Hh60oqpoUmBhfN3NuDv06qvqDXaNXWN+vdIaPYvt1ahDgUnfA==
X-Received: by 2002:a05:6512:22d4:b0:550:f012:966 with SMTP id 2adb3069b0e04-550f0120ce6mr5060108e87.39.1747953524641;
        Thu, 22 May 2025 15:38:44 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8c78sm33932571fa.36.2025.05.22.15.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:38:44 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.15-rc8
Date: Fri, 23 May 2025 00:38:43 +0200
Message-ID: <20250522223843.171621-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Here's a PR with a couple of pmdomain fixes intended for v6.15-rc8. Details
about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.15-rc3

for you to fetch changes up to 0f5757667ec0aaf2456c3b76fcf0c6c3ea3591fe:

  pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id() (2025-05-08 13:29:30 +0200)

----------------------------------------------------------------
pmdomain core:
 - Fix error checking in genpd_dev_pm_attach_by_id()

pmdomain providers:
 - renesas: Remove obsolete nullify checks for rcar domains

----------------------------------------------------------------
Dan Carpenter (1):
      pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id()

Geert Uytterhoeven (1):
      pmdomain: renesas: rcar: Remove obsolete nullify checks

 drivers/pmdomain/core.c                   | 2 +-
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 5 -----
 drivers/pmdomain/renesas/rcar-sysc.c      | 5 -----
 3 files changed, 1 insertion(+), 11 deletions(-)
