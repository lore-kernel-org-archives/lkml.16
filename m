Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888D31531C1;
	Mon, 23 Jun 2025 12:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680026; cv=none; b=sU5yF0krwV/vA274I8NLduRKTFSsoLdhJOBAVwQ6KIT0SwczLX8aUxjIb/B0wu6u+EcIlcOVVdYDRFQTEVw2pmq4N15AsDxgV39RTyosBUvKmNR0DuQAgMZ/Sy0qq5q1Qa0Lgi6CDr8eJVk6g20k23ixGr+INPEJIGBW1ZEdJxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680026; c=relaxed/simple;
	bh=tV8ORaIQbQLMSY8zkLMfrpms34GMlXjixrFwRo6YJy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZDGiyAGWNWLqVS5vVpHlFeYM7GzwMTDlrAWYL1mzBWjUEhgjvjAibtT3zW8kclPUnsBAmcQpN6byZTPRHwEC5C1OmO27KuHiyYhyRE9a0vyfZp3sgTZPWwTOFXiB1TcAWJbEAnhQGqKSgJsYSmdir56TQTLaYK911L/MfsDrUpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k3HVXr6+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k3HVXr6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680022;
	bh=tV8ORaIQbQLMSY8zkLMfrpms34GMlXjixrFwRo6YJy0=;
	h=From:To:Cc:Subject:Date:From;
	b=k3HVXr6+R+bc3cfY7iW8UOHT9TSS8Vlud6/ZIcCmlV6xnYcJHYeDFHI/V4ErPX5Qv
	 RkTbBul6wzC8wYZe/6z9tddgzYyfdzWMW9GO1RjJgfsrqQilqJwKFYpaZbtr01ZpIh
	 EhgKrh+5FGjVBdaevhaG+5phpNGK1Mmcnm5y7n2cW7J2WqlsFDEpRFqxdPhd2uZmk8
	 f0aS6ZrODg5OdK+hF9jgCpbY0Hn6jpy0nbk9sRN09U3lMKbVsORfK21Rm4BUslC+1E
	 QGhEji+CfdF8BD6KuMa1BLlWcP792Q63wu5UA1QNpNksTiaqoFpjpI4/IdWDLwGD8F
	 xu7xhY31NhxrA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3A0517E0202;
	Mon, 23 Jun 2025 14:00:21 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/6] regulator: Add support for MediaTek MT6316/6363/6373 PMICs
Date: Mon, 23 Jun 2025 14:00:10 +0200
Message-ID: <20250623120016.108732-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for three new MediaTek PMICs: MT6316, MT6363
and MT6373 and their variants - used in board designs featuring the
MediaTek MT8196 Chromebook SoC, or the MT6991 Dimensity 9400 Smartphone
SoC.

AngeloGioacchino Del Regno (6):
  dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
  regulator: Add support for MediaTek MT6316 SPMI PMIC Regulators
  dt-bindings: regulator: Document MediaTek MT6363 PMIC Regulators
  regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
  dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
  regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators

 .../regulator/mediatek,mt6316-regulator.yaml  |   81 ++
 .../regulator/mediatek,mt6363-regulator.yaml  |  123 ++
 .../regulator/mediatek,mt6373-regulator.yaml  |  119 ++
 drivers/regulator/Kconfig                     |   27 +
 drivers/regulator/Makefile                    |    3 +
 drivers/regulator/mt6316-regulator.c          |  343 ++++++
 drivers/regulator/mt6363-regulator.c          | 1060 +++++++++++++++++
 drivers/regulator/mt6373-regulator.c          |  729 ++++++++++++
 include/linux/regulator/mt6363-regulator.h    |  326 +++++
 include/linux/regulator/mt6373-regulator.h    |  154 +++
 10 files changed, 2965 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
 create mode 100644 drivers/regulator/mt6316-regulator.c
 create mode 100644 drivers/regulator/mt6363-regulator.c
 create mode 100644 drivers/regulator/mt6373-regulator.c
 create mode 100644 include/linux/regulator/mt6363-regulator.h
 create mode 100644 include/linux/regulator/mt6373-regulator.h

-- 
2.49.0

