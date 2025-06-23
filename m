Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0D24A07F;
	Mon, 23 Jun 2025 12:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680104; cv=none; b=oAYv6YiJDkF8vAmzeamndw2rKg4lOk+60Q6SfC5mYV3npNRGF2qnsSrGTif8nb0W36am/BqjiZ1HxrtLVxhEkVl2N5eWOyisBYZiGziP1cqU0Z21f2OUd+Xj22K6Bm2Js3o9owHlVS6fl+eWLH1lWk5xMepsZjZ12iIUvbP9TiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680104; c=relaxed/simple;
	bh=TuuRJJOjVAMtrQ8x6GoCVUnFQqeVYjXrluDun4jAFyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kXdF4IolMYyfRHID9YMnsB9NN0O6HAKhhpg093000kTia/EW9h6hVkIvq/zcH6tiZGDcqnkPoymeGdkd8hNSNT+94A8JGaxdb7kcQBlDC54yDckxhAlAZHVxv7DzpMTcvGS62jOFGeTz7TyjNytxXTuUbLsgWLFUh0P2PKQML0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M8sQQpH0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M8sQQpH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680101;
	bh=TuuRJJOjVAMtrQ8x6GoCVUnFQqeVYjXrluDun4jAFyo=;
	h=From:To:Cc:Subject:Date:From;
	b=M8sQQpH0vNNWDlN39Wt4Sw+b1spNqYJhM6c42ylTEvRGKUXN23xyGauMzzNBFyvwg
	 /2WMZLRElF1ByNPuunVK0YP55eDxJs/5Oq5ibRqtFid1jPsf/9DwmQl8ZDiUGmgiyQ
	 3Du31xQumhSsRti7HzptTUCoMGFmhFL1RQpl8QKGbNje+TsqlceQnTlwXoaYLdaMDo
	 MwqkRlNNoUUtIkzI4LCP24xINhUoT5gL3/uM7psNXQLscOeBblJRsMlhJ6dsrU1bYq
	 OLWorQdGCMH4CrkKJEnGIkot6/B2KmX2lzgAuV/EqX7gLQx8nIjsfNoAe7O1B3vEs5
	 SGCNbSnKWNW3Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71B1517E090E;
	Mon, 23 Jun 2025 14:01:40 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] firmware: Add MediaTek TinySYS SCMI Protocol
Date: Mon, 23 Jun 2025 14:01:34 +0200
Message-ID: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds basic support for the MediaTek TinySYS SCMI Protocol,
found on the MediaTek Dimensity 9200, 9300 and 9400, other than on the
MT8196 Chromebook SoC.

This is used to communicate with the CM_MGR and other MCUs for power
management purposes.

AngeloGioacchino Del Regno (2):
  dt-bindings: firmware: Add MediaTek TinySYS SCMI Extension protocol
  firmware: arm_scmi: Add MediaTek TinySYS SCMI Protocol support

 .../firmware/mediatek,mt6895-scmi.yaml        |  22 ++
 drivers/firmware/arm_scmi/Kconfig             |   1 +
 drivers/firmware/arm_scmi/Makefile            |   1 +
 .../arm_scmi/vendors/mediatek/Kconfig         |  16 +
 .../arm_scmi/vendors/mediatek/Makefile        |   2 +
 .../arm_scmi/vendors/mediatek/mtk-tinysys.c   | 344 ++++++++++++++++++
 include/linux/scmi_mtk_protocol.h             |  62 ++++
 7 files changed, 448 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
 create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/Makefile
 create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
 create mode 100644 include/linux/scmi_mtk_protocol.h

-- 
2.49.0

