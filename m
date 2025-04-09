Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5852638BF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201416; cv=none; b=Iy6m+CT+5+2k8cODz2TJfZGghFVO1x28B9fXLAH5MZzeCZ4yCqNahET9tv/K4MOAiso0ntm6YVQkMaAU8ZsJvOoCUbiYDYqnAMzJXRi/bEcs9hnfILH7YoOME0b2ucVmFnOnhMATtihfgxMJYSK8EaOjUkCQH50Va1r/TtyvgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201416; c=relaxed/simple;
	bh=sQRIW9/Mcz4WWypepfvC9IXPumM0UmWhaNt2XOzwpzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P/5liTvjjmuLg3iSqv1BL1zALpcmy1obofFnkWxVKMBjjSf/ZECuG5f/mggKbw8cNWVusZ168mRhs91xYD99lOilrer4Ox8DtNaHqK9MacvbC+hXPwJ0vAAEFrhnALWcUScM8GjoyDv0Nr1eCP18RfbU09bjE2/U02DUaKPa1SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5Q6K2GH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5Q6K2GH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88520C4CEE3;
	Wed,  9 Apr 2025 12:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201416;
	bh=sQRIW9/Mcz4WWypepfvC9IXPumM0UmWhaNt2XOzwpzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U5Q6K2GHVGY48V8GjMz7Muc/vifp4Sjn7yvD8+rrfC65gu45lv1xLJ1fFY+u6IAn/
	 LQBXxu/umemj2o5uj94faGur2kdLCHnTV9SGJJPc7n+bH7efBaFxwlk9Re8C230oKp
	 M5b1KkX62opgmi/3khYq3+CnjqbnFmupbci+yYRI2cleD26CECd1MeJS3FlAM8Gm03
	 wIZOTfnd9KYUBlQlOBfSgb5hKnmMujR+a4v0+X+BAitxSbt6MpK2JKCT+tmq/N6co+
	 X+nRfKssHlQgw9wAIJxYHhL04KYFn7pIybn0FnsLWT2L7TnSJqHpVLCGt57ZNyNOmm
	 VSe1FG2SLGZXg==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] [v2] clocksource: atmel_tcb: fix kconfig dependency
Date: Wed,  9 Apr 2025 14:22:54 +0200
Message-Id: <20250409122314.2848028-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
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

Change the dependency to allow build-testing on all architectures but
instead require CONFIG_OF to be present.

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
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

