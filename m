Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C7C254AE7;
	Tue, 24 Jun 2025 07:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750555; cv=none; b=XqOAaVc4cL7Tpt4qZVfVX8eRhJyRvHiZ6U5rMpkTTaSH0CQHlFGSWzzzMnceTQ8MQAI/ljoTQ0I9LtFq+heQaEIebvmawv6yyt/Bnn5hJQoCFV+nKmkcM/o4j3Pl+PbODGGNMHIydtozFvX8xYlhYZGORMXlbJHh1buwYJZGdWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750555; c=relaxed/simple;
	bh=AJm7iN7QM5LvHEOPH4aFZbCKjCzl3v2qwVkGz4aFbsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q9M7QX3rz1Jvq5qs84JVhZtZES/L9M6qgUJemkA3naviFnYdl/XcCdF9rjfYHdcbpvDisRadUAaOlkMaEAyW/hu5YBZpDz5Pg57uITsfNfufcoPdeetK4tY53kwSA3d2NOQtV4U4n1rlV7fMaha6l4N4MhRxvrP+xEuLjAqQvow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Gvf3bEjO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Gvf3bEjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750750551;
	bh=AJm7iN7QM5LvHEOPH4aFZbCKjCzl3v2qwVkGz4aFbsw=;
	h=From:To:Cc:Subject:Date:From;
	b=Gvf3bEjO3ynv6r+xT0eRc20GzgYMJyCxYzXLVC+Gc2TCJR/EqO8v4ubL67OXLwnlz
	 hgcHSEV8Uh/T8uqDqZJyjrWeVZeHLp8PPSMr2C25tYgXknxsdIanICe4iNnH4x40Tu
	 wMvJOF/Du9wkcG6jHT6RKDg5GWIBDzeqmQ/uKPyWsFQZmWyNUlmK/WaNiJ/f0HSPnC
	 pQ0H03wDlWgpDk0WEHMv2j2hYubcEeMnjcHbNJN3OQZ86jq3wOVGNphyGFivgAi1Q9
	 KBEglAiZyXvrgsV9XkdAvAaZsFDLcccvX0ArJKZEteySF+S4QHBo/nicP1pfbdzTZC
	 d+AmjDmwfXOHw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 800DD17E0FDB;
	Tue, 24 Jun 2025 09:35:50 +0200 (CEST)
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
Subject: [PATCH v2 0/6] regulator: Add support for MediaTek MT6316/6363/6373 PMICs
Date: Tue, 24 Jun 2025 09:35:42 +0200
Message-ID: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Fixed issues in mt6316-regulator.c and tested again

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
 drivers/regulator/mt6316-regulator.c          |  345 ++++++
 drivers/regulator/mt6363-regulator.c          | 1060 +++++++++++++++++
 drivers/regulator/mt6373-regulator.c          |  729 ++++++++++++
 include/linux/regulator/mt6363-regulator.h    |  326 +++++
 include/linux/regulator/mt6373-regulator.h    |  154 +++
 10 files changed, 2967 insertions(+)
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

