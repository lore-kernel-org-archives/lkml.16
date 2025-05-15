Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F7D17993
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 23:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747352888; cv=none; b=IMh2Y0YMyYhJi80zTIl8UdZVTLk4v8snN9OwhlHAAiwH5RyGHHwavfB0d/VJqnkbWZmsoVorFFQWcefD2BY4F+VpMYtPu0P8eJI536Ww7E20K6Kc4FfKUIdirQnjuJmmmVTG0/4syWjKcFVyv7ljTXy02Skw4t1QqKRUfDPMeF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747352888; c=relaxed/simple;
	bh=scwxy58srVKgYnslgTPuU/GNVKaaD36w9V7BJC/jNlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jvD3zbP3YxqxCJyf6Dt8AC95EU+PqFeefRyALQ7DV7hYSkjMML3d3C09GFy4LmTX2tm+fmjfU7BRwaj6RLmG8SqCD9iqYFmYjGRa6DdAInSWQwJ1Va4w4X/y3Bz2TPmC3fvrUG0GCdPfyS32HxXnQkO4OWH11/Y47TI8SjJH1Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DJxa5/dt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DJxa5/dt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Zaaj1e0262u/Lgrcz1ndMQoFb3t9QQjKPCvSYq6OngQ=; b=DJxa5/dtmBgGuTQDWxGTzh8iQw
	Z0FHflXEJm3SNWJaI+dZwo08hTQsJrfpKQCJSeVdYP23MKLEphYE8Aripfd/5qROSb5IJLBaEPiEb
	TXbhjdzKAOFoHEpC22M4QyhuYi9cr+nEVsLeCSYCNVFo/+up0FlvN7LWA3MhOEgmnKAngGGVGK7oi
	fy6GxiaII/q44yyqj+jW4hCBzUUiiAWJu6M68a7XQiH2OmCjxxuGAoBSKIC8av+qO8jXC9XkZv9fE
	U2cCHcCXxkPcZj9UHb2aOC5rB3lzaRyuWi6GM9fd+4gdVsjpB5zn7oL10Dr/nobvyYLqSmYNN9DAp
	Ywl2xlcg==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFiJ3-000000025g1-1NoG;
	Thu, 15 May 2025 23:48:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH] extcon: max14526: depends on I2C to prevent build warning/errors
Date: Thu, 15 May 2025 16:48:03 -0700
Message-ID: <20250515234803.1385375-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make EXTCON_MAX14526 depend on I2C to address a kconfig warning and
subsequent build errors:

WARNING: unmet direct dependencies detected for REGMAP_I2C
  Depends on [m]: I2C [=m]
  Selected by [y]:
  - EXTCON_MAX14526 [=y] && EXTCON [=y]

ld: vmlinux.o: in function `max14526_driver_init':
extcon-max14526.c:(.init.text+0x77b0e): undefined reference to `i2c_register_driver'
ld: vmlinux.o: in function `max14526_driver_exit':
extcon-max14526.c:(.exit.text+0x467c): undefined reference to `i2c_del_driver'

Fixes: c2aeb8647e53 ("extcon: Add basic support for Maxim MAX14526 MUIC")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
---
 drivers/extcon/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20250515.orig/drivers/extcon/Kconfig
+++ linux-next-20250515/drivers/extcon/Kconfig
@@ -136,6 +136,7 @@ config EXTCON_MAX8997
 
 config EXTCON_MAX14526
 	tristate "Maxim MAX14526 EXTCON Support"
+	depends on I2C
 	select IRQ_DOMAIN
 	select REGMAP_I2C
 	help
