Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C6E2561CC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213999; cv=none; b=hyF9GL9Hwrkw5/EpGeKZ+yYRGxuoPBwrvdPwcUXcbBBBrd9m0eLB0mRPkKNd6cBC02if6myv5E9dAllAaTNCtfmJL1QBuHYfVZlLO18Wf0VYxy931z7shJCt0JEh36ckEewG0ycBPR9pcdlQ/CCCdxHdcVY6l1Sx3YVZDi9ixOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213999; c=relaxed/simple;
	bh=7/jOyi5d72baNyWEnQx8NoqSL2OrdDljJOPQqNI0rms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d50o0bC2smHLKoiEJJi+BZ16JHtvNkBRolSuoJ4ZUTszKlM/4U7p2VcasD/lKwh+7M8gcWsG52NS8v1W1wtGi1UvajDJziOH5aJbGqluaUub+jrdXOoEf6LHp39/HxqQwmfGdrw/NL42/a2PhVI+10mZecokMsvSB/oTL1TFJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+yZRM/G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+yZRM/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B434AC4CEE2;
	Wed,  9 Apr 2025 15:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744213998;
	bh=7/jOyi5d72baNyWEnQx8NoqSL2OrdDljJOPQqNI0rms=;
	h=From:To:Cc:Subject:Date:From;
	b=L+yZRM/GGy7TVkSvBpsSwKF1QqH1RM4eYuo5uYXv/QPXvy7+J09jMS5iWZ1nbOCRM
	 PoRuSfMgVf8BTf4vSaDyuu8fGhD9UpxP0GyNWsdXDgc76yF46y5Uj7p4sTgQvYoZvW
	 p0/MzOCCz74QHNJGGPgYZbFJ30gdVGJ/Q7OyoKzzXbX37XSvg7m+iIdYAlbv7hDlMG
	 ruKYOrSTtvJF+38kovC8V+uQIdHlLrIQRdDzEpFnwnPvaT4DO/cCcbwJiUUbuQhz7s
	 /cXlMKINNON9Eh0EmAyl6bJOWQsiCnAuWnEGywOwHQY0dRq2ugl+JOHLflM4qSjmyP
	 ZcMZe0b5kzIUg==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v3] clocksource: atmel_tcb: fix kconfig dependency
Date: Wed,  9 Apr 2025 17:53:08 +0200
Message-Id: <20250409155313.1096915-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Build-testing this driver on arm without CONFIG_OF produces a warning:

drivers/clocksource/timer-atmel-tcb.c:368:34: error: 'atmel_tcb_of_match' defined but not used [-Werror=unused-const-variable=]
  368 | static const struct of_device_id atmel_tcb_of_match[] = {
      |                                  ^~~~~~~~~~~~~~~~~~

Change the dependency to require CONFIG_OF for build testing to
avoid the warning. Testing remains possible on all architectures
as CONFIG_OF is user-selectable.

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v3: update changelog text
v2: fix build regression from dropped CONFIG_ARM dependency
---
 drivers/clocksource/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c85259967..a7d5a465100e 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -437,8 +437,8 @@ config ATMEL_ST
 
 config ATMEL_TCB_CLKSRC
 	bool "Atmel TC Block timer driver" if COMPILE_TEST
-	depends on ARM && HAS_IOMEM
-	select TIMER_OF if OF
+	depends on ARM && OF && HAS_IOMEM
+	select TIMER_OF
 	help
 	  Support for Timer Counter Blocks on Atmel SoCs.
 
-- 
2.39.5

