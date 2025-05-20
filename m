Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45A425FA2E
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754782; cv=none; b=HxpMauN//cUBfzrPo//qXx40x3+jTVC7SABvzgtQr8fpizCHoAYteIxOCxj2NqgguYLOkBXkC/Ss7iSoPNWcvdg3fd5DpvAuhduXFcwV4f/YgKrNmFyQRNw5WE/vHF7GkCYU0tl+3LntkvJKP0uggmgvxjDiCtDAvusCLWJXsl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754782; c=relaxed/simple;
	bh=+lma360CGPW6DnpOwN3E1yi2V5jAJKH5552bAvo6/vA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oNtqX8he5znS+90XSx3PxruBR4tc07Mr/FLtuIZhE4OhSIA4r8Psh4JrwA/rBTZWl1EpMLm2/i4wgefgOCyUkjlY0ptBMyu5kP6khHeGTM4VTW30n8jfdzANk+skecrHQt/jsui3EmLhaxgpezf4+xSr3TIhKF/NYtEiJ6FB9Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZXOu+6N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZXOu+6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061FAC4CEE9;
	Tue, 20 May 2025 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747754782;
	bh=+lma360CGPW6DnpOwN3E1yi2V5jAJKH5552bAvo6/vA=;
	h=From:To:Cc:Subject:Date:From;
	b=PZXOu+6NIfRlzzUBH5gxw1N8HTuQg/e0IjdbVw56lj6LlYcPUkm+n9QS0RkEfvc5V
	 +aRrFNGwFXUf0fk/jniNVADecrAX7BMSNAUAYWUyuuHcR47gmK7XRvNmilzhM2Hdtt
	 93f/5h3WwaMURapsFB557gcSBgqJPr6K5SYNzYE7iPKrrTZWFztZ30yKj5kemME25x
	 CEiElTGcfq04BH18/STasNaqYS54se90qCJsStSU3bDfiT5iM/hhYZdA3Qp99+xbPL
	 MUFTCZypgVsOM1qUr8Tout98BvvznputHvj4ncKOZdDQb+8LrBuMgJIvfr8BEqhsfG
	 q9/0ttRMx3M4A==
From: Arnd Bergmann <arnd@kernel.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] extcon: max14526: add CONFIG_I2C dependency
Date: Tue, 20 May 2025 17:26:15 +0200
Message-Id: <20250520152618.1975840-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When I2C is in a loadable module, the newly added driver causes
a build failure. The problem is shown by Kconfig:

WARNING: unmet direct dependencies detected for REGMAP_I2C
  Depends on [m]: I2C [=m]
  Selected by [y]:
  - EXTCON_MAX14526 [=y] && EXTCON [=y]

Add the required dependency here.

Fixes: c2aeb8647e53 ("extcon: Add basic support for Maxim MAX14526 MUIC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/extcon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
index 1096afc0b5bb..aec46bf03302 100644
--- a/drivers/extcon/Kconfig
+++ b/drivers/extcon/Kconfig
@@ -136,6 +136,7 @@ config EXTCON_MAX8997
 
 config EXTCON_MAX14526
 	tristate "Maxim MAX14526 EXTCON Support"
+	depends on I2C
 	select IRQ_DOMAIN
 	select REGMAP_I2C
 	help
-- 
2.39.5

