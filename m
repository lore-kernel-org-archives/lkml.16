Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6AF289371
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874127; cv=none; b=r88PqfZ29UFZ8lz9mpHSS1KNlAZM37cmze2a1+l1/eQ1sBgewa+KPpSqEYEa82eWNBPcY99eqYLW6Kp/amL5Mhajv6ReKHqyZzCEaKeUySgWJVnuMUs4+EXtU12iQqlXXCUgyOw/RHEOJ07xjWDBvZr+EeD7v1esrK8NSY7iqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874127; c=relaxed/simple;
	bh=2oKgQpwQgsPL+7EXCiATOc+S0pR2sm/0S4sqSSqcejc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTNkgpSgdvTxDWtP1vnXyp4lb7kgxdpdfGZa0yu9jZrUygWq0AueQqkL5cA+j1k/2gIeV1QmiO4sfcNX7FHRNtEW6fwpIc/z87Nf3zueLQ0YkFETIhHP5tVYAPVcRM582WfTsh31M8FeyDahXHjhGr1mYgJnrihinD+exUTGDbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aiNFnkaw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aiNFnkaw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d7b50815so21765065e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874124; x=1752478924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDb2QDDbYI7e1da4zOCjqVkWLKFqFwWgy3CDKFih7gw=;
        b=aiNFnkaw0vNoS/Da3dzKI9kHaHzL9yx2Jwg9BguUOThYgoDU+tXR5H36aPt6TozXPd
         iaLtNjb3ArE0V/+cmOQHxTJOzqaaUdgmErsAT8BKmM5e+HKyf3X/ieWmG7n6HBbcyT3g
         yF7Cqf2Bo7bvS1NUs1JTWGwh1HoC32grNomSS473pgRrVBH5ANKHmoTfvU5T+ys91Kik
         1FwTqftf5bHf/6o0xeNR/J/fTjrUd9y9TQdGseGJhDn+1vE/d7AOZmwVtioA85q5qzRC
         jX6YSeeebndDo+nDMbcmQDFyd3UPvPsZM1jztt3c0/xdv+AqhywEuW9XELBeuKijMzua
         VVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874124; x=1752478924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDb2QDDbYI7e1da4zOCjqVkWLKFqFwWgy3CDKFih7gw=;
        b=Pm/dXX2DnKn7WdPBqI08twPZEB+Oz8/C2geJ4RNLFj5GFI+j32bdYVugts8aO3mmvp
         LvAtxLBYUENA/rju6jKnNWpg21aHIL6ptfElZ+l2Rs3KXABPYMUGRW5lDOkAbvnC1DSE
         LzZEGmUV8vi+7nR5hzszeSXyjMq7oELwNL37gkQNVLnIZtvd7ld3+FM3U/Db1hJ1zG21
         Zv6iVo3pYa8irjXRDWsKkHFmhLGwT8T1hDa2rQBVuGHY333jrRUEX6rucv8dbDNf3Hiq
         N6JyC9P9QTR+H5nsPOqoFj13EynG/dlUrvdBqje0ueY72yp9Ua/L/ehB3umeOs4HkVph
         79GQ==
X-Forwarded-Encrypted: i=1; AJvYcCViRnYiUJ1REAeYOuyCkSHNMaOVUjYZU3Rf+bBpgUkbFVx/SMOqBsaSZzVoMBoaHTA6sO2cO2Tq4I+TLWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBltOwBCO5s7hPVPtQhzdiQk9ARiwKOFiRdTzYHqKqA/npXVjN
	LnpqLmcnpTKFM0XYt6D6S8GUAe0A6fEWzXnxueBnPoBCP/d2Xi2nLqWHfPBPx8W8WAc=
X-Gm-Gg: ASbGncsYytwkGDWllZ3vzsG0JGot3VzxZ2Dl//yPH4PYtXElMmKszYlkAqnQUX46L2d
	vnSrOKNLXMmPQiD1lacuA7VR6WaMpvZCoffDmNYeAvunTkXPhmpw6k3P6C1wSUcsTsRzvSzI9DY
	y3jZRKysmEiaHAfkkILr0vVauk4QaeYeePRyoQbUNYtNBgMTvqi1OX/ocaU2HXuxTpZaq2EVJrp
	3llNjmMdhHSkomv+ZILNSkHPsrTQnEIdYpFOEd4+H9k61KqHkqxoeKgRbhuVWOZ/occQU59sdXd
	tsvc7GAjW1EszFOWRIGtn9qZ0RcxRtlI2jeWLxDtWbYKosqOfFFd7IUyTJEb1RA=
X-Google-Smtp-Source: AGHT+IEWekPleecTkqzHnxj/5d4ocJg6iJ2GS+S28dD/Gu1BHihs4HNC2F49+o22Hs0t3Y/zfvGdYQ==
X-Received: by 2002:a05:600c:4755:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-454b3116236mr125103245e9.10.1751874123696;
        Mon, 07 Jul 2025 00:42:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b10b8c89sm107026185e9.38.2025.07.07.00.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:42:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Lee Jones <lee@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable branch between GPIO, MFD and ARM-SoC for v6.17-rc1
Date: Mon,  7 Jul 2025 09:41:49 +0200
Message-ID: <20250707074149.11000-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi!

Please pull the following cross-tree changes for the next merge window.

Thanks,
Bartosz

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-mmio-remove-bgpio-pdata-for-v6.17-rc1

for you to fetch changes up to 9bad4bec5daddbb296481af759f9d56c849ba96f:

  gpio: mmio: remove struct bgpio_pdata (2025-07-07 09:31:08 +0200)

----------------------------------------------------------------
Immutable branch between GPIO, MFD and ARM-SoC for v6.17-rc1

Remove struct bgpio_pdata after converting its users to generic device
properties.

----------------------------------------------------------------
Bartosz Golaszewski (6):
      gpio: mmio: drop the big-endian platform device variant
      gpio: mmio: get chip label and GPIO base from device properties
      mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      ARM: s3c: crag6410: use generic device properties for gpio-mmio
      gpio: mmio: remove struct bgpio_pdata

 arch/arm/mach-omap1/board-ams-delta.c | 42 ++++++++++++------------
 arch/arm/mach-s3c/mach-crag6410.c     | 17 ++++++----
 drivers/gpio/gpio-mmio.c              | 61 +++++++++++------------------------
 drivers/mfd/vexpress-sysreg.c         | 46 +++++++++++++++-----------
 include/linux/gpio/driver.h           |  6 ----
 5 files changed, 77 insertions(+), 95 deletions(-)
