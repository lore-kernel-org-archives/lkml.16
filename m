Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A1519DF60
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011694; cv=none; b=G1Ac2lR6l38o19tLnuCFUNN3q1W7e6aAMpYzoPaexGj4JLP3zpj7fNsZJdWzj/EXqAkKqrZ4k5VMx3c/WWlxjhKWRneO9M8PF4ZAxlHLStoBuqE1ywVoD7ITNISZT/D+e5zACr/ub3pIa+3XxOtSw//DMrJP3YozY8aqpyZBDuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011694; c=relaxed/simple;
	bh=wUxnoVJrOkhN8ol+6ufOgx0J5Xy6IYNdh22iPwhPO0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aux+bja0z/xYLgVwQe3UpgSyRsdLLv5RYVTmMWWBCm/LGyxN6JzRi1RqtVNvKmGnOdlULkzokq+u664De06IZbQgQb+qtH9uKsYis8c4O6zk/hq7Pq+a6WJperU50DhtJdlUbqHE/YLbUUaORD9LnpkCm6PzT43t6fFSwJ54NmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RxdWrJGi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RxdWrJGi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso43313585e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744011691; x=1744616491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz22H0sKHi0P6ChA8f8l89RVIB0HG3tTa0TbQ2D4N4E=;
        b=RxdWrJGiH2w8Wlfhk1ImgZ4sTnRqHYSa/norO4NdFlG6iIhWXeX8T7TrYP+Qsqc72i
         dnpQ08vDVGWt/hQvcT5vYLE0RNNLcJKHK0XPGdY7NbW5DpmSNxALhiKVCqnkiitnjgwc
         hoNTi7GpkYP7x/BGmP/EvFEFwx84Y865pEGEXr995F/Ekg9xwcT7vUcQ9rhHRRTZij3b
         QGLUFAuwA74I7EhNrCYLGNXcuTUigOqIXG7fczNr+gPCr8xw1HTdkUomJ2TDpQ4A9+dm
         sKzqfnodOyIyU6ZzyvQtmHUSAkgJOD5UXGtHtYpY9wGiw5dMWWs7+KZMrg2SeBtHmV2m
         bPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011691; x=1744616491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uz22H0sKHi0P6ChA8f8l89RVIB0HG3tTa0TbQ2D4N4E=;
        b=T5Rmr9OYhpwluRS9DtRERemfukJvm0cDJOYFdk1W2cmVlcnX7AHYGEmXQYmkMs3MKt
         grArKycOpGpT7qsEMoyDmYNEqWwgG2XcjtQdcavVWqMG1a342YIKvn4ySW8qNchlDmZ4
         GteOCkF3EgyNPZQHtUa9fLfwEIJhc3lZ23QmTwfvfCxWE8POUhkK7MJo0DgjN55MyuCM
         /WIRC6dOIHzzUhP9prb6fu0ERRG6Jmikcj7ESYz4LVphprWMuEsXCPJbl4GEW13eCNZo
         mIj7hjpRg/vWQV6vg3Z1rdAgW2oyVZJ6NHwq+UVr6DeZpznTlJdioVxYT7IaVz+F3LPm
         pWHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxffu4s17KAUv9zQJqLNuxNsT96PZAxQqqlwFSHp329vrfPlvkQ64veAFB7Dlp88j1FgfGgHRvhDXoLPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc5LwuzWPBBfSvscemTivyrT/VPO54rInSdRh/q1BJsxIthNWZ
	cISpYTz6csS+8ZFuEWDedQCUIsW38/6+kljt4nli+/dL+JZrHPT3BiVAYShFbUc=
X-Gm-Gg: ASbGncv50ExtS6oTC7qWrjhWQgvh7aj4MkP5a8qK4AWdNxStSBrmuwoK4ocdReHWlxv
	RKaFyKzQ5JrP3H3K2CwmHq+zkFWuE4KFbaL17Nrm9PSgNAdpjEbcgcROMdpS6bLW5Au4gGqeFOz
	0ZeamJ+Z0JmyQmqlX0tW5nlQb1MikcGNr5W/DAeF0y48KTU4uPfapcrBYUb+laMCDaKLfzQkA3E
	68WEOX1TSGqeBvloiMv7P4gtKUzK+5/PYm/1HSuNKtdOGSzP9yLntBsvjT9b4akW5RCp/AfKHva
	ef4Vg2KiateFxHBlU6IiJwTY7e5o217G5UwCnzNsieqY
X-Google-Smtp-Source: AGHT+IFHFUB/LjMCMRZ1FmL1ZohnhrBOQtU3VyuHCtAN6Bq4uju9hGTT9QfacVvXg7wSnqGBuluI6w==
X-Received: by 2002:a05:600c:4754:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43ee0640054mr73289405e9.11.1744011691047;
        Mon, 07 Apr 2025 00:41:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6a60sm11029472f8f.29.2025.04.07.00.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:41:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: immutable tag between the GPIO and regulator tree for the s5m8767 polarity quirk
Date: Mon,  7 Apr 2025 09:41:22 +0200
Message-ID: <20250407074122.23773-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Mark,

Please pull the following GPIO change allowing you to apply the patch[1]
converting the s5m8767 regulator driver to using GPIO descriptors.

Bartosz

[1] https://lore.kernel.org/all/20250327004945.563765-2-peng.fan@oss.nxp.com/

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-s5m8767-polarity-quirk-for-v6.16-rc1

for you to fetch changes up to 4e310626eb4df52a31a142c1360fead0fcbd3793:

  gpiolib: of: Add polarity quirk for s5m8767 (2025-04-07 09:33:29 +0200)

----------------------------------------------------------------
gpiolib: of: Add polarity quirk for s5m8767

----------------------------------------------------------------
Peng Fan (1):
      gpiolib: of: Add polarity quirk for s5m8767

 drivers/gpio/gpiolib-of.c | 9 +++++++++
 1 file changed, 9 insertions(+)
