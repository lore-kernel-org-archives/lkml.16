Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6452293B42;
	Thu, 10 Apr 2025 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296078; cv=none; b=Wxe54UT8H2ZZknxsMN5DjcMMweL8fUb89/89PCCgC/FjVSpivY5UzwdY9Y+wSpBSIs5D7M5q0EQleIRYeyX4cSGRQ5QJc1gWm/f/7jilyZa6vNw2i02w6d/vCCrIFtbzJI6f01FKc1URNa0Er/f57N0+kMmxq95NNndp3079VVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296078; c=relaxed/simple;
	bh=Hp3v8LN4A5+QVMzwAdZ4iPfXStPLVBeC7NDy7+rOdy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4W8iLnWpj3TqanDQaC1k3F4ukNkW/Zxz1DX5roEGVSMOAoPWfmAJDCMCMeXDmG43iqtrIf1fgvY/TLTlWpP24jQldp7joEe617sL+LKVR2cwoTdE7of79bF7ti1PxeYUAAupNkppQIIkIoaXx/g4F9u2E0EkEoKiM4iNe1Av9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Tykq51qn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Tykq51qn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296075;
	bh=Hp3v8LN4A5+QVMzwAdZ4iPfXStPLVBeC7NDy7+rOdy8=;
	h=From:To:Cc:Subject:Date:From;
	b=Tykq51qn6woO5tWehK6YJwnrJ7yny3aNaCh3wchpjk8++P8e4+Ae72oCH/bircXrI
	 1SxggmfocrEVLsr3nXAnKmuNkhq/qwHS9VHzmzKghcb9RZhOHjKn784gVBIrrjQ1Ig
	 EeXVqUomQUWgrqMXycqQCO7msASIrskD+z8BdbY7S6vJEnlG8nOzWl2nTQxRrF15ux
	 orKJBIQD201NiTVOGN/HpwZVpfhel34F583/A7KvMbGFjQbZgHs1w874+9Z0qkZpNG
	 4nlC5u3lL2/+g/nyBRYKBOeG/2MDg/jRotodtnDiOXbdVXEHv56ZD0cCOsuqRZlTW+
	 oZttIeNoshJ7A==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B4F817E0CA7;
	Thu, 10 Apr 2025 16:41:13 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	y.oudjana@protonmail.com,
	lukas.bulwahn@redhat.com,
	u.kleine-koenig@baylibre.com,
	geert+renesas@glider.be,
	amergnat@baylibre.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Clocks support
Date: Thu, 10 Apr 2025 16:41:07 +0200
Message-ID: <20250410144110.476197-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding basic support for the OnePlus Nord 2 5G
DN2103 smartphone, this series adds support for main, multimedia,
and MFG clocks of the MediaTek Dimensity 1200 (MT6893) SoC.

Main blocks are required for console boot, while multimedia clocks
are required for display support, and MediaTek Flexible Graphics
(MFG) clocks are required for bringing up the Mali-G77 MC9 GPU.

AngeloGioacchino Del Regno (3):
  dt-bindings: clock: mediatek: Describe MT6893 Clock Controllers
  clk: mediatek: Add main clocks drivers for Dimensity 1200 MT6893
  clk: mediatek: mt6893: Add peripheral and multimedia clock drivers

 .../bindings/clock/mediatek,mt6893-clock.yaml |  56 ++
 .../clock/mediatek,mt6893-sys-clock.yaml      |  68 ++
 drivers/clk/mediatek/Kconfig                  |  58 ++
 drivers/clk/mediatek/Makefile                 |  10 +
 drivers/clk/mediatek/clk-mt6893-apmixedsys.c  | 137 +++
 .../clk/mediatek/clk-mt6893-imp_iic_wrap.c    |  94 ++
 drivers/clk/mediatek/clk-mt6893-infra_ao.c    | 185 ++++
 drivers/clk/mediatek/clk-mt6893-mdp.c         | 116 +++
 drivers/clk/mediatek/clk-mt6893-mfg.c         |  51 +
 drivers/clk/mediatek/clk-mt6893-mm.c          | 129 +++
 drivers/clk/mediatek/clk-mt6893-scp_adsp.c    |  52 ++
 drivers/clk/mediatek/clk-mt6893-topckgen.c    | 880 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt6893-vdec.c        |  98 ++
 drivers/clk/mediatek/clk-mt6893-venc.c        |  72 ++
 .../dt-bindings/clock/mediatek,mt6893-clk.h   | 449 +++++++++
 15 files changed, 2455 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6893-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6893-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt6893-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-infra_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-mdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-scp_adsp.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-venc.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt6893-clk.h

-- 
2.49.0

