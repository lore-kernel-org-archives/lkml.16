Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470F23535B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002296; cv=none; b=JO/GgV1SD+9TAsz2QXNCt3NT7TMLpBPiB6hfZsDIwzBXJVb/oFyLARmLpsLYNQpDsNWqU//WfKUl3HEBf+XMp6tbglYr1XeO0l2OYX+eOloEoy2nqjcRk92vYkmn9mEDgUyl0lluTZn6HAwXY+RgbOTCWx+xnuiyp55F0Ux1hbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002296; c=relaxed/simple;
	bh=upco2MjGTbWcx0KwuxZ81lYk46ygbIZH+HnuS8wNgxo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XYBUSBdrDsF7lsQ+O9C9aLLsc4p0PiN7QR9KIBxt1wxl1wPUUEbWd77MQwdW04xJmVlj0EsKwXJz0AlQdayUhUu+rRmwPrBFMD1IMIlJfYTOKqn3zqy1V3GC9J0WTysviqcHP3JY8xZC8/CG3GotIt31wAfoXMQbKL+dzoYL7Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OupbYX3k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OupbYX3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8A7C4CEE9;
	Fri, 23 May 2025 12:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748002295;
	bh=upco2MjGTbWcx0KwuxZ81lYk46ygbIZH+HnuS8wNgxo=;
	h=From:To:Cc:Subject:Date:From;
	b=OupbYX3kvgUN5ZcYD32xfiJB1IP34v8cFI6HZ63OTGL06nftDHqgdgeJwjgcKdB7Y
	 uHORnoBVWYm8uKS+icARRKuOI3sqeIeedn9bjO4kEvWJGCSZKtMFwB6GOu44LfuGU0
	 x5Oj2cVosNsIZHsU836ijZvg+edAy1rwX5wRWXrcrN4pSItHfwlzNeUNSvaWQV5Xye
	 LLjDlDM9Is3M6T8k7HL2g+4jnDN+BHELnQ/W8dIbit/a8cjtYpCjDn25sJqivDP/OB
	 rYq8gLI8f5weXKbkw3T3k6ljilE4nOUgyo1vYO+H2hpHR78SJbUblgsqQxZUeJU+n4
	 4gTbcExFQGtCg==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Jakob Hauser <jahau@rocketmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER
Date: Fri, 23 May 2025 14:11:22 +0200
Message-Id: <20250523121127.2269693-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver uses the DSC helper module, but does not
select its Kconfig symbol, so configurations are possible that
cause a link failure:

ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-novatek-nt37801.ko] undefined!

Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 721581d425b4..cfebb08e8a62 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -522,6 +522,8 @@ config DRM_PANEL_NOVATEK_NT37801
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Novatek NT37801 (or
 	  NT37810) AMOLED DSI Video Mode LCD panel module with 1440x3200
-- 
2.39.5

