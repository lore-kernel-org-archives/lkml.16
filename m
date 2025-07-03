Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263502D4B69
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542068; cv=none; b=JFnQDvjZ/HOD9DskKeLit1XI6Akwedu0MR9SsRnyRS7cVlr6MYepln0a2Tj9CQL+5ex4TzELZxg3KjcfulpWrIqzDmYLsh0Vfd7GOBysTlCK3OrbiyKNHUkiEfhOQFBnWpZZniJafABNA4O6tELk5CkXtZG0eMX9Zi4HtgJT7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542068; c=relaxed/simple;
	bh=UlZ75WOORNs4rZE+VlImTZa7mmm9FlJ031wXRJuG6f8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LIv6mvcJ6WIA0C2jg1LvbQ96XRzLue3QAZGyuw8aO/Y3m1mUIGY/2rDwyREoN6eEDKTbqZszbVm5SD5+lb3C2qam1e2PT175h8HZsSZw7pRxEH+Eg0S6cTFM7XK99OdbjQtu8Pe3Qtkggsun+u4GaqzhQ2QU2nKob5zhv7ebbUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l5K7sn4a; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l5K7sn4a"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo9718462a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751542064; x=1752146864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6PMMz69qo04D/YT8nX2dE04S7ELr0QnXwz/uN4j+eI=;
        b=l5K7sn4an49hXSu3he2pRlapXvTrBiKvj+FIVPQKXU0QKgqq1ZePud52ttkBScRteZ
         KXf07vm94x6m/BCztn7+b1NfXByAPNtaOF4WgW5PRybd5ZcHmex4Qgt9l4IwyUsdlDQp
         fwrS0yw5nXaNTPLpAayTRgR3ARnJxCT3ug7Jtj3/o1ygmMbAMt1cub+cJjOjfZtVFKLA
         AeQxIDhtiB6JitMDJmtj8b24mgQ6rHhLiyCKZtE4/9ZRKv4yIc9UK9zd2d3MgYY4WYIH
         RANXc/agfr78NopjZLE6iJZab7To9BS5wWfsMRK/k66/NLaCdnY4/rrqvUrIfU8JHFHV
         odJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542064; x=1752146864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6PMMz69qo04D/YT8nX2dE04S7ELr0QnXwz/uN4j+eI=;
        b=MV4YkaqohbNUHX7ZtYNQE4xQnoMzOcnJzBfefJlgziHoOnrQL+puyoFZ0q5XFcCIV4
         xbbAWOKbkNSu/s65jg6tkSwPCd8c8mqSWEwF5j0NP2CQrtNSlgt9zEGIRcBLZ5P9+hbq
         bnEOvZ111ZjngLlQCQTeLqVfTrekzm8VBoNr7Bgs4Zyff4MIn/O8IOzfaAQOVDY58rW6
         8+or9CkfWVblgm/NKsH19duZ2XjCoHeVXqFQGFBinjreIUsP4K7jP4q8PFPoJhIwOnZr
         w8BWgHGUKfywftfAbmT4aTczozOCMxsbp73Fktno3ljDgXWWYTLdm7TCSGW/FA28rpE2
         8OPw==
X-Forwarded-Encrypted: i=1; AJvYcCUWo+zWXJpQ01qaTwcP5QKgr3nvikjaFw4GrKoc02+Dltn2hSgtz+fRMCOYr6peUou+IKdh6BfhZzoth1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFRL1Bm6UxgQYodB9s4IleAEV+CkXn+eFA3w1ipz5rHKgKRJd/
	zXVGlt+Nw1EoamsmCTANyUQRg+0ubgKdxz8Xv3XwHWbbD53pD0171Vtd7+caES/oMmY=
X-Gm-Gg: ASbGncuudhsFnLv15XEH91XSLx9mSNUxvvLHRT3pfn4ttlCg4pbmL3g+EvxGotg+Jj8
	VjofLuxCTskXk4lOq0UqgbIgEeRYU72xwoR37FcuKEOr/cCaCnfK4KktwnKKilkzJjvafFcMwjm
	aLXzG14GL/XuXQ3h4ki2j5am8rl6k5wQtolrafPa3V585GM5gSnACTQoTwysw92W95sPDWRC203
	mKSjITmwP3Gyu6cDCGEkvFiCxEsdjBVEH/WKl8B+jffEXaq3zWCE3I2X7FHjU6TBwNB/gjfrdxN
	T9IdD7oHHwzHPCrfzE8NQNsazDV0udtlPAqHcSuciuBjlFfosVxKkPQ5ruRHGFUhrMI+gAZaN3a
	kTKuJwP1CHS3gVek=
X-Google-Smtp-Source: AGHT+IGodommfjTvSu9SmK2+f27lr5klD7Mc1oDRjQm+BoxfNtWb86krYFjqI4yPBXvjQSq606lSUA==
X-Received: by 2002:a17:907:2d94:b0:ae3:6744:3661 with SMTP id a640c23a62f3a-ae3c2da6359mr600970466b.44.1751542064239;
        Thu, 03 Jul 2025 04:27:44 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a75fsm1247016966b.67.2025.07.03.04.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:27:43 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: linux@armlinux.org.uk,
	gregkh@linuxfoundation.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	mathieu.poirier@linaro.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	robh@kernel.org,
	jirislaby@kernel.org,
	saravanak@google.com,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 0/3] PM: domains: Detach on device_unbind_cleanup()
Date: Thu,  3 Jul 2025 14:27:05 +0300
Message-ID: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series drops the dev_pm_domain_detach() from platform bus remove and
adds it in device_unbind_cleanup() to avoid runtime resumming the device
after it was detached from its PM domain.

Please provide your feedback.

Thank you,
Claudiu

Changes in v5:
- added PD_FLAG_ATTACH_POWER_ON, PD_FLAG_DETACH_POWER_OFF;
  due to this a new patch was introduced
  "PM: domains: Add flags to specify power on attach/detach"

Changes in v4:
- added a flag in dev_pm_info that is saved in dev_pm_domain_attach()
  and used in device_unbind_cleanup()

Changes in v3:
- add devm_pm_domain_attach()

Changes in v2:
- dropped the devres group open/close approach and use
  devm_pm_domain_attach()
- adjusted patch description to reflect the new approach


Claudiu Beznea (3):
  PM: domains: Add flags to specify power on attach/detach
  PM: domains: Detach on device_unbind_cleanup()
  driver core: platform: Drop dev_pm_domain_detach() call

 drivers/amba/bus.c                       |  4 ++--
 drivers/base/auxiliary.c                 |  2 +-
 drivers/base/dd.c                        |  2 ++
 drivers/base/platform.c                  |  9 +++------
 drivers/base/power/common.c              |  9 ++++++---
 drivers/clk/qcom/apcs-sdx55.c            |  2 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c |  2 +-
 drivers/i2c/i2c-core-base.c              |  2 +-
 drivers/mmc/core/sdio_bus.c              |  2 +-
 drivers/rpmsg/rpmsg_core.c               |  2 +-
 drivers/soundwire/bus_type.c             |  2 +-
 drivers/spi/spi.c                        |  2 +-
 drivers/tty/serdev/core.c                |  2 +-
 include/linux/pm.h                       |  1 +
 include/linux/pm_domain.h                | 10 ++++++++--
 15 files changed, 31 insertions(+), 22 deletions(-)

-- 
2.43.0

