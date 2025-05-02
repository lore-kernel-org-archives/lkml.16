Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B391804A;
	Fri,  2 May 2025 00:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746144985; cv=none; b=fTZ/z1FB81Wu9u4hUaIxqH6nsT3WxvghWG4+kHeph2m6fHpkPojQIFtpjjwcvPROc8wTwCEXmFLv+Qhhw0K9nASL26K1SriJRLYObYeKQfcwnaiGkevKInS4bs+PHHuIzfcG+OefdDsnB2rbGklyhS/kq2S52njSumZuzmpc26o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746144985; c=relaxed/simple;
	bh=1RGpA0j2oX5ye/l/RFU4b5p1FYXf54QBn5FZrRlSVgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LW6VhnjAFNrdaE+t2FQGKQv6Vl+7wyp7CzEHjnjvdGxaRvDsleOZeRmxHyFwfylOMDqE8293p9j73hBgL8z4Kiu7fb4DiaKD0c3LGp0EoVc2doFZpVoGisWyoXRtNghkcVJ+OiAb//dCAYgto36d0z7DIo2BrRBCW6uprwUAGOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0VgkBdpP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0VgkBdpP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=JCvs5Qr4ScspEbBQWpbvqRy6Qod3tPj+N3ahGdJfo/k=; b=0VgkBdpPk9H3eyWhOd1UV9YQeS
	cwJ/WJMV8zkpAdYf3RdGQnSGBsojlQuIydSzFpdGTpSlpalWALFLuuucD24Zaq5dAigv+qZOlYi/p
	td4sGBhUT3r1SaFujpfBOl+TubNfAmcklAzzlZIwuSspEQ/fdZdBdbh2jVyjBbgsleHjmUDTARd9i
	oEqplpFvWGcDYwI44qs0VsPRi8rLXu6Zzzmpx+PrfsFmS+9A/8wi0ggpJzvOmLTLX33Mfy1b5T8u/
	un721sA7dO9df0ICxwiLTo8m3/drOjXjoNuLCpO3ZgnlifPm83K+h1ubu+jp8AgXlF+/MfFfDoeSO
	P11MsJvg==;
Received: from [50.39.124.201] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAe4l-00000000Moo-1IPM;
	Fri, 02 May 2025 00:16:23 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/mellanox: MLXREG_DPU depends on I2C
Date: Thu,  1 May 2025 17:16:20 -0700
Message-ID: <20250502001622.674263-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: unmet direct dependencies detected for REGMAP_I2C
  Depends on [m]: I2C [=m]
  Selected by [y]:
  - MLXREG_DPU [=y] && MELLANOX_PLATFORM [=y]

Without the dependency, REGMAP_I2C=y since MLXREG_DPU=y.
Since CONFIG_I2C=m, this causes many (> 230) unmet dependency warnings.
E.g.:
  Selected by [m]:
  - EEPROM_AT24 [=m] && I2C [=m] && SYSFS [=y]
  - SERIAL_MAX310X [=m] && TTY [=y] && HAS_IOMEM [=y] && SPI_MASTER [=y] && I2C [=m]
  - PINCTRL_AW9523 [=m] && PINCTRL [=y] && OF [=y] && I2C [=m]
  - PINCTRL_CY8C95X0 [=m] && PINCTRL [=y] && I2C [=m]
  - GPIO_FXL6408 [=m] && GPIOLIB [=y] && I2C [=m]
  - GPIO_DS4520 [=m] && GPIOLIB [=y] && I2C [=m]
  - GPIO_PCA953X [=m] && GPIOLIB [=y] && I2C [=m]
  - IP5XXX_POWER [=m] && POWER_SUPPLY [=y] && I2C [=m]
  - BATTERY_CW2015 [=m] && POWER_SUPPLY [=y] && I2C [=m]
  - CHARGER_SBS [=m] && POWER_SUPPLY [=y] && I2C [=m]

Fixes: 3e75f2954116 ("platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vadim Pasternak <vadimp@nvidia.com>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/mellanox/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20250501.orig/drivers/platform/mellanox/Kconfig
+++ linux-next-20250501/drivers/platform/mellanox/Kconfig
@@ -29,6 +29,7 @@ config MLX_PLATFORM
 
 config MLXREG_DPU
 	tristate "Nvidia Data Processor Unit platform driver support"
+	depends on I2C
 	select REGMAP_I2C
 	help
 	  This driver provides support for the Nvidia BF3 Data Processor Units,
