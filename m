Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD12296147
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774224; cv=none; b=RNVlYqYtZY5f3vHNE0pzKLGiNb7Z1nXk9Hp2CvmZ+n0hX42Z6skDiWQtrNvYa/60Bs0ccGemJsGEsT+Oh2xJLKxXbR004lRtw2ZX2uMBwE/aA9PKbZMSZlsBDkV7+AHfKx6pSw8gHTho27OfqUPTk3b25571/QHUOwfUUjhRBQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774224; c=relaxed/simple;
	bh=NuJWCvNMDvp7A01JcwhLK1F4wGD5m4AribrwpLbZ6eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMxNdMbi7ZgH8MxqN037M0CL8h0xrAjSwE7TJC2hImFiPV6VQ1buoBNa/A28W9kHZH/yLjNlUdC7bqcq9v8a/AFYhxYIV6Km2qYE0USsJTvqQibbrpdpBHPIc1S8SPdWrrtmpSoIZir6/3QG/cPZDvC5LpfFw/AigCNMCeCziuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rr915wTN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rr915wTN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4531e146a24so3423445e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750774221; x=1751379021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSOei/bzMdbbI2Pm7lA3f9YENYRJXjnioWA5X0R4sEo=;
        b=rr915wTNTiK3831GdkgGT6zufwkctsTFkJ8xVX+c9kXqwqTZbKVKD+btPgOHdRXhoS
         kfwBQDFhWQoV8Tn5lBtJVQ0wNTy1+c9orNMPsANQC9tpILxhQB038HUEqOy9mO2YS2HT
         0O12hNNDoYM+WljEd9CS1mOkcgxXsaXnUqP6AZsUpVOnJfY8q2YCkOX+PdE/7nxABAd1
         GYeLip4LWQTJp7FSgSZ1Ujp/IQt9SCctn4zsUuVv43RgoqoZ+5BQVENhFUDgsc1LAh5B
         iWBPB0494QHUZpQowBdI/z2n6uzBOgYGmqKEJKkF7jF5mjLTO/IrJtEPIQdkMz6CbSjy
         yKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774221; x=1751379021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSOei/bzMdbbI2Pm7lA3f9YENYRJXjnioWA5X0R4sEo=;
        b=cY8M6JpTmlF9A9JxxLxpUhdOouBEq/UAWSjk5kRMyMaVll1aVGVGgJ7iWjvjCwFSiJ
         szqsfafe7C04K8NN+ps5IrSZbuL+k90JoCitcgux8MqU3upntiPT/swxYqDT9MMMJF5s
         2MIuh5TN82E/XKudEuevu7ZnTjnxSatbvihUoIWsTQ+Miv1RiEIcZbbZO6uh3DmQKK93
         5kN59lCGiIqIe3jPCpBTv3vNqGSF/f2P25cI46RE4m0MORr0f/qNn8rvxun21gCjh0bO
         ihYrMcDHnjhSf01SLDPHrtke2kJySLK7xOWs04a26NgzYNH1vRs+NcLUOhTWSWulAKUB
         +Bsg==
X-Forwarded-Encrypted: i=1; AJvYcCXHuNNGMWCZOTFIzer6lc72zl97EP/esQ2m0shvl5lINSWfsilQSB9EP2A9t+OrrHixZPGr1yyJFFDzr+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN8BiGsWQIb0EptbHb1b99FoWbkqbe1pbEDeVkRbzkFt2FdXxk
	IT6njnu/qJuXxE22K+uxpWx9XdGNxZliEhWixCJx1uShpdyNIQEcYXH7dRmmTh/mXT4=
X-Gm-Gg: ASbGncuCChCeslgaQck6bbE1DpufrM767yh2FwVUCmDE8J9GuPPLhiTYJWWMw8zWCBA
	OnzPvkbLqC41stqTYWdsL+j/52cLT/vskPV1i9OjLjKplQ31wXf8MsxYW4ei4/JAV+5FYfBvLmx
	vnQZO+PDjp0CaiW3sbFv+6SbOHmecNhjA19kRtQr5A6+eWc4YulpLO6aCzDjbVGPmgvBYedD54/
	hYS5yBTS6f6O1fEm7YfEvhKSB4S2uEvyCYCnUELmT2aal0sAsQK616CKMXtHpoXwHB1LuLx00Ph
	9pZ0GIw8KSBHF1XkAMOE+FUEfG0uM05pePlB2eDWOVUP7F4ox5yLbDuM8gJHoSI=
X-Google-Smtp-Source: AGHT+IHAFIyNFoPHfcJpS9uG7ODV4IPOWAcQwwmdmU2AsHKw3IL8dxcp/xxloNOH3Z3z2+I3czNdHw==
X-Received: by 2002:a05:600c:4452:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-453716b567bmr78480325e9.7.1750774221073;
        Tue, 24 Jun 2025 07:10:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805175asm2004223f8f.20.2025.06.24.07.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:10:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable tag between the pwrseq, drm and pmdomain trees for v6.17-rc1
Date: Tue, 24 Jun 2025 16:10:13 +0200
Message-ID: <20250624141013.81358-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here's an immutable tag containing the thead 1520 power sequencing driver
for the drm and pmdomain trees to pull from.

Best Regards,
Bartosz Golaszewski

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pwrseq-th1520-driver-for-v6.17

for you to fetch changes up to d4c2d9b5b7ceed14a3a835fd969bb0699b9608d3:

  power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver (2025-06-24 15:55:05 +0200)

----------------------------------------------------------------
Immutable tag between the pwrseq, drm and pmdomain trees

Add the T-HEAD TH1520 GPU power sequencer driver

----------------------------------------------------------------
Michal Wilczynski (1):
      power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver

 MAINTAINERS                                 |   1 +
 drivers/power/sequencing/Kconfig            |   8 +
 drivers/power/sequencing/Makefile           |   1 +
 drivers/power/sequencing/pwrseq-thead-gpu.c | 247 ++++++++++++++++++++++++++++
 4 files changed, 257 insertions(+)
 create mode 100644 drivers/power/sequencing/pwrseq-thead-gpu.c
