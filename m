Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB49025A646
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185465; cv=none; b=bGSunqBtwgQdOl6njl+uUzjubvVAzESBzB6Wo4qmyaB3M73jUuqsoqT8C0SzIxXRSQ7RKfjoSMz7XhpSJ1fkSRD5HKu40IafSWyck7BHSlqeRopF0edezUWicH6Gz+bSlefKF+3Ga2SKt43nBcLuWIXThf7Qdh13n5Z7dm/mbEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185465; c=relaxed/simple;
	bh=EUimRn0GQUHWJwQMLzq8kpEhkDARwbjxXagfaCn67bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D2qccO7faa1ATQbni68pM8ehOkTn8JkDYAbg9LwmteL1gr7+TlMrYjN2MDi2iZufL8QLeXlfsQGNHYWPKuEbeHY0GNnnl/5h+xh9rC3jPYsU7vxX0c/lvMYzcYCXiuE+1KLv6H+7nN2P7s+p3Flyz5LFRdPvZOs0mL/qs2A/oYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gyb4YbtI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gyb4YbtI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ac9aea656so5425000f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744185461; x=1744790261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXDxRCjCfZuXXrdnfOdDIFh1kl7XI8kOcfsAbWkZgo4=;
        b=Gyb4YbtIj9M5R10DfBKlBnQN5LueIJ53QzWC46M9IhwXVdlLdg+C/afLCd4Pp1pcJh
         t7ps6xp7eBK56NnHJgLpFePY6qXiK7MeGy/NouxFaeJuRfnS9Srz7iTestVLUItEHRCD
         l5yjPAoR/oCdU3pyKPUOYb4/0eR736IB+JS1epr79ZmdfHC59DRu5GEhMQeci0dyDYMC
         FSTKD12/Yh5XuPIiSIh9j5CkKkm+26H9Zh4FQCwjyWG8KzIvtKncxd/8EzZ6rPsyGTxI
         b5/NzklHP//05jdMQISEaEgf3ECOoyo/E88353UYf3Yy3LZ+Np//hdMbePN9hbCSydt4
         PTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744185461; x=1744790261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXDxRCjCfZuXXrdnfOdDIFh1kl7XI8kOcfsAbWkZgo4=;
        b=b1dnXY8DMRxjQiVKs/c4v6g6Bjala89qVfPD+UqqXaVxVe8pEZREnZkC4ch2NisQQc
         bLDHAvuZy/EC7VcCsQL/CalYDOGAqeMIzampHxP/NdugqpIho/liHYkQDt4JdbMUmssm
         OjZ722hLnMTWN5Yyw6zDLxn0iiwMcYGuQugG+PvDpV+a8YHDh5OFr/3lTHH2mTIgMBiP
         7+Tfh/8FbIaMfEtn3zhsOxHDvj8iIlhl6+BxZQyPygBGh5L3KXEFPpcicsThY1416Rxa
         q9hAsNw6Fc+G06UIceaH8Wa/4WkNEE6K+20P6/eXfSTsvuORPkN8BXxWfHXZ8cq+F+zu
         DunA==
X-Forwarded-Encrypted: i=1; AJvYcCVbFUgW2Lbx831c1fuOJIJl6JkZSaLUZBX+OrLSogGXzaphVo6UV4KnbDuHll3cWxXYYBA+aLynJA+ocWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqnkwBCj5+EeKZ9M13BGSpo1+3zbh3KojAlWMjvBL9p0HNA6lO
	eopi1xQIxCeutxImwMlKT087m/mErSt+tsv0BT/vDou0BG319NVeI6keuWuGtX8=
X-Gm-Gg: ASbGnctiEY1mvdxM/57LYfEkii4KlScTZsMYmXEafSLSLyCeT1q/szjnbpu8I3tgmGD
	e/NZkw/Vcd7RXOD2UQTehaDhnTigtxbHREXH0Wj3el1y8CQPLS5PtVkVRmdpbq2ijYnSdVaKPWw
	sqMcP2VEMiJwVPThRmKUMdVBn+t/yYjAqqyd7O9JKfXV2crnXfFhh+VJ2LuLpjNiXUt8EuMrgwX
	f16EsRE2bDZyombYAU2QEyHJvhqtB8zN2fSURR9+/mYf2b8pHQQW3sxEc1cDmKF/UsTud4mXrgd
	pJIXnOG/jicVAk1VYPU3zmHbgRtyknft1KKoovCI
X-Google-Smtp-Source: AGHT+IHk+usthCOyo0rT6xLnc06ABawNMxokSw5jSpmTwWPZ24n6QoqFvQfjomHiByEDjNqdLAzbIw==
X-Received: by 2002:a05:6000:290a:b0:391:456b:6ab7 with SMTP id ffacd0b85a97d-39d87ab60camr1783660f8f.34.1744185460716;
        Wed, 09 Apr 2025 00:57:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938a30bsm837918f8f.43.2025.04.09.00.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:57:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable tag between the GPIO and regulator trees for v6.16-rc1
Date: Wed,  9 Apr 2025 09:57:31 +0200
Message-ID: <20250409075731.16802-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Mark,

Please pull the following change from the GPIO tree that will allow you to
apply the second patch[1] in the series using gpiod_is_equal() in regulator
core.

Bartosz

[1] https://lore.kernel.org/all/20250407-gpiod-is-equal-v1-2-7d85f568ae6e@linaro.org/

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpiod-is-equal-for-v6.16-rc1

for you to fetch changes up to 265daffe788aa1cc5925d0afcde4fe6e99c66638:

  gpio: provide gpiod_is_equal() (2025-04-09 09:32:06 +0200)

----------------------------------------------------------------
Immutable tag for the regulator tree to pull from

gpio: provide gpiod_is_equal()

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: provide gpiod_is_equal()

 drivers/gpio/gpiolib.c        | 14 ++++++++++++++
 include/linux/gpio/consumer.h |  9 +++++++++
 2 files changed, 23 insertions(+)
