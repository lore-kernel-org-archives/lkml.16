Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E05B1DA60F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638899; cv=none; b=KzDggj7fekOgbcAlFgR+C7xkmjE2EnCBhx++mSxwvzisJStEmbvjmpYB7XHCK61bmEYcEdqq4MgPeIOWTzdwkO0NfYDS/4EDoLzkx6LDwd39zoMXsQVDATb3SXpuEYmzJCX2YMzyk4uFHnQiMHv6xz9fXi0JcOiNySpYGtAj65s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638899; c=relaxed/simple;
	bh=LUbZ2ZVksxFfFOy/YMs2XJTER9hG3sAfvocQkpgZo5c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SOD1yjvNBUztu4W9VDcehu02NWB/+ERn1kwqp6iDOWcvXbRPQJr+eijOEUKW6DXay2ggN1Xd/prw1VgEvZWdSLpTtDxnt1PMUKhPF5j9dz305iTf4vGi3fPVNGclweYIW6x/Z+YZDOCHnsvyc8tJ41Mh5OSefA3yVg216OsWLPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-0001Ex-DO; Wed, 07 May 2025 19:28:09 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYy-001axS-1u;
	Wed, 07 May 2025 19:28:08 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYy-000ING-3D;
	Wed, 07 May 2025 19:28:08 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 0/2] gpio: TODO: add item about GPIO drivers reading struct
 gpio_chip::base
Date: Wed, 07 May 2025 19:28:00 +0200
Message-Id: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACCYG2gC/x3MQQqAIBBA0avErBuwIrKuEi10nHIIVBQiiO6et
 HyL/x8onIULLM0DmS8pEkNF1zZA3oSDUVw19Kof1agmPJJEJC8JrSmMmY2zhk6kyWm22g7kZqh
 1yrzL/Z/X7X0/GKFvzmkAAAA=
X-Change-ID: 20250507-gpio-chip-base-readback-c7d8eb8b3cd9
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Bartosz requested that I add this to the TODO, so here goes.
While at it, I also added a FIXME into the driver.

I'll be away most of the month, so feel free to squash changes as
appropriate.

---
Ahmad Fatoum (2):
      gpio: TODO: add item about GPIO drivers reading struct gpio_chip::base
      pinctrl: at91: add FIXME about read back of struct gpio_chip::base

 drivers/gpio/TODO              | 7 +++++++
 drivers/pinctrl/pinctrl-at91.c | 5 +++++
 2 files changed, 12 insertions(+)
---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250507-gpio-chip-base-readback-c7d8eb8b3cd9

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>

