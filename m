Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFA924BBF0;
	Thu,  3 Jul 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543157; cv=none; b=CZzv/1rt5bCCez6R6bXj/YYprk4pR6Z4bAjQfY2BvXv8/QUsxsbl5L5Nrd1vmyr/Va6gr64p8kR3Y9NR/1H/M3UpQGqCXnjcDeREiQU+rlS4nX+/3/NPq2wrmihuWD9png2ZyPy8+lOSZSfVn8V6uumxiZfDuheKnnDtEdV9PGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543157; c=relaxed/simple;
	bh=lwXnV0Dls981nC3awFV3EN6ST4p2FmmmeT+dvm3TjM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o3Rpa8gYF6uikepctvEjybWFqHs8TaMUvt5SAIs4OwY4s2E+ROViUyX4itpqLmcfbchbqjlxdkiJ7fa00cVVjm/i//pzZGcMT5zUBqFBsuEB6NILMX0dIUaucwqJJYOUQ7E9uxucy0vsE4v9vKuHPCZZBg2ddCrDfwUpQgK4qK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bvtA0vFk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bvtA0vFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751543153;
	bh=lwXnV0Dls981nC3awFV3EN6ST4p2FmmmeT+dvm3TjM8=;
	h=From:To:Cc:Subject:Date:From;
	b=bvtA0vFkRLDelS8s1Bd6clYxb9AKPZER8aKMMHVPqVe9ekguTjgeBtga2TSPxUnIf
	 iysyoRhek8oSr9rDPAmpo/436ahNBPuK/dbvBFRKLAnpzqrqXCMYjXd0K68DmeOwiO
	 bvUrpu7UvmyTkXZdRlk1LvPbuJZoo0rsTCV2L2GWor69Uxm2bdEI7mxvQircdBqmec
	 IQ0b0pfcKm+9wBrNQ8Ko3N/lRbPZn/irXveBHdEXaK37kMJUB2QNrGBHP/j/HzGEo+
	 iEa5IE41YM6LAcuUTEoVDKtKXR5UzJLN4QhVupHI06vnTMxExRNE+pHNJ1v0TR2+Nu
	 9hhhgFZnvIzkA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A818817E0456;
	Thu,  3 Jul 2025 13:45:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] mailbox: Add MediaTek TinySYS Mailbox
Date: Thu,  3 Jul 2025 13:45:47 +0200
Message-ID: <20250703114549.114313-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Changed IRQ_TRIGGER_NONE to IRQF_NO_AUTOEN and removed the
   useless irq_set_flags() call to set the same.

This series adds support for the MediaTek TinySYS Mailbox, used for
message passing on ARM SCMI and for both the standard 0x10 SCMI and
the MediaTek TinySYS SCMI protocol.

This mailbox is similar to the standard MHU Mailbox, but with some
critical differences that are MediaTek-specific; for more information,
check the description for the commits in this series.

This mailbox is found in the new MT8196 Chromebook SoC and in the
MT6991 Dimensity 9400 SoC, other than slightly older chips like
MT6898 Dimensity 9300, the MT6985 Dimensity 9200 and similar.

Support for all of the mentioned SoCs is present in this series.

AngeloGioacchino Del Regno (2):
  dt-bindings: mailbox: Add MediaTek TinySYS MHU mailbox
  mailbox: Add MediaTek TinySYS MHU-like Mailbox

 .../mediatek,mt6985-tinysys-mhu-mbox.yaml     |  52 +++++
 drivers/mailbox/Kconfig                       |   9 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mtk-tinysys-mailbox.c         | 195 ++++++++++++++++++
 4 files changed, 258 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml
 create mode 100644 drivers/mailbox/mtk-tinysys-mailbox.c

-- 
2.49.0

