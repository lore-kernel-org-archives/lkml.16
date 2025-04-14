Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526842628C;
	Mon, 14 Apr 2025 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619365; cv=none; b=odEIanPo75/C/r1dXHqUS2KGV09AS0c26ePSL87SGCLa8RN4/9OPzDw4Z8x9GPMRuXmoFqrdwyN/9EacYmtkEkQPsu+3SlUWu/5CiD/YzClTZXqpZPKia8brC46SSjveVYXQcPCseBaIMr0xhJYcrHieHKXU6KyyvToDNqnoO5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619365; c=relaxed/simple;
	bh=S5wV+W43ugdWydPF1EvXFidYinbfXUappDW9VKOD42w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dTuYQtN8EIaARSwEX3tnHmob9krWUzYqsZT3xk5HmYw6qXYyCtpbEdL7nkJlmJZ4+/aIbN60UcT2PJE6yJIXoKU6MnbFA0I1lO6NwRCgbp9tjt5+4f7mekrLGbTVYitFAsD2ihzZlk7EI+2JMWX90CbX/6Qu1z7EmTtrDIaHJiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jDO971mz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jDO971mz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744619361;
	bh=S5wV+W43ugdWydPF1EvXFidYinbfXUappDW9VKOD42w=;
	h=From:To:Cc:Subject:Date:From;
	b=jDO971mzpq6u3qUOTN6v+rWg9OEaLwjoQlHOH1Se9sXJWhyD6ABOgzY0zPS/zKfC9
	 HuEBaVvuq/YQC1WXCWt9i2FWy2gZoP9nanc3uOjWYquryFp7I0eGmulXlH/5PCNkK1
	 MFTl8Jzk96CRZObwMRyj2p78m8vY17TrvDsg3G+g5YuMgaN6PhmgNEJNO7F/S8iAgu
	 M93uAVnR7U/9M5k1lsp7UM3Lv6iN54eDfB3esZ1VaStwhAca9OBJO/sdasQx8Y/IdS
	 Bveuz6wXtkfXcpDgzJf+IWcvf5pBZchUtHHa5eId+VxrAH/eK3SB3MtTFiVCbo3lH/
	 YfZy/Xo3v5Fww==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B1EB17E0FA7;
	Mon, 14 Apr 2025 10:29:20 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com,
	christophe.jaillet@wanadoo.fr
Subject: [PATCH v4 0/3] Add driver for Himax HX8279 DriverIC panels
Date: Mon, 14 Apr 2025 10:29:15 +0200
Message-ID: <20250414082918.30298-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
 - Changed hx8279_set_page() and all other utilities to void (Neil)
 - Changed hx8279_{on,prepare,unprepare}() to return dsi_ctx.accum_err (Neil)
 - Switched to devm_drm_panel_alloc() as suggested (Neil)

Changes in v3:
 - Added support for setting digital gamma parameters and validity check
 - Added support for setting analog gamma parameters
 - Changed gout_{l,r} to a structure and added a description
 - Fixed DSI LPM/HS setting in prepare/unprepare callbacks
 - Remove forced panel off in probe function as that was simply
   useless
 - Renamed function hx8279_check_config to hx8279_check_params
   as that is actually checking multiple parameters and not just
   basic DDIC configuration
 - Moved the GMUX and GOA validation to their own functions to
   improve readability

Changes in v2:
 - Removed unneeded mipi_dsi_device_unregister() call for secondary
   DSI: as the driver is using devm, that's not necessary (CJ)
 - Removed superfluous if branch as pointed out by CJ

This series adds a driver for DSI panels using the Himax HX8279 and
HX8279-D DriverICs, and introduces two panels using such a configuration,
the Startek KX070FHFID078, found on some MediaTek Genio Evaluation Kits,
and the Aoly SL101PM1794FOG-v15 usually found on some I.MX8MM boards.

This panel is found on the latest hardware revisions of some MediaTek
Genio Evaluation Kits, and specifically, at least:
 - Genio 510 EVK
 - Genio 700 EVK
 - Genio 1200 EVK

This driver was tested on all of the aforementioned boards.

AngeloGioacchino Del Regno (3):
  dt-bindings: vendor-prefixes: Add Shenzhen Aoly Technology Co., Ltd.
  dt-bindings: display: panel: Add Himax HX8279/HX8279-D DDIC panels
  drm: panel: Add driver for Himax HX8279 DDIC panels

 .../bindings/display/panel/himax,hx8279.yaml  |   75 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 drivers/gpu/drm/panel/Kconfig                 |   11 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-himax-hx8279.c    | 1298 +++++++++++++++++
 5 files changed, 1387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8279.c

-- 
2.49.0

