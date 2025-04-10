Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294A28D83D;
	Thu, 10 Apr 2025 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296026; cv=none; b=NOmtHqdTE5YKnjlMTGBcmIUZSBkpHfxgoinxnyY0UWty2YLQ41wD9ams1lm2xzmYeYBzn0K7vqtZ6Aq5zhkXAXU2KwoVN0LSkYU4GYy/KuHqcMJVt9CP5zEEMLaTxiLiNr9ijOQY0zRx9rUbyr7PpJ0P0w6uZh4E5kYLizRe+9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296026; c=relaxed/simple;
	bh=zjLdve0wYngdIB6TlmLYleobJZB6mp1H4Ri9xgypsOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dh1Pfs19fzWfN2Yf8XWcnXs+QJUiro/pSU9ZRf8l3PkCTwv9Y1sWQ04SI4tFIGJWIh77pOW99iIynQSqmGVpXHo3816UXfYZ3L51h03DCQ1K/AJD/b18DCDrOEZtZ4RDniRwax2GBaUX8euhbykgzytwmaTIs7JPMVud2AjJcCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RJY4WSI7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RJY4WSI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296023;
	bh=zjLdve0wYngdIB6TlmLYleobJZB6mp1H4Ri9xgypsOU=;
	h=From:To:Cc:Subject:Date:From;
	b=RJY4WSI7XaFd+bkFE9JNc7FvrcJuPXSVOUP4dj9ot1AUdgW6NDiLEwrCsYe19Jdqg
	 bVbIfwWdFt8beUq0SPA93tVCtCLuF06iV0h2L+d0HZfMOL7d2PL5O4bxw8RbFfQLeL
	 KAjr28/qsBVi/u/L/PL2mLB3fUdhaOnqKtegN9IK5tReiJZZtXeDpvTzwUeaNTp1Fu
	 5AGDOuCZJJ6vGrgsak4/hyyfl6/Efx9ny/4XShI0vSqw2MAWRHEnrDUrFJg3brdwXQ
	 UGUOoZBonZ4Tt6ovFgvGkQ8dAB2IWD58TM23BIgCT50yzOE4ee02uGYXxVjBbKrul0
	 8PjMysNdnSwzQ==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 195E217E0CA7;
	Thu, 10 Apr 2025 16:40:22 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/5] MediaTek Dimensity 1200 - Add DVFSRC support
Date: Thu, 10 Apr 2025 16:40:14 +0200
Message-ID: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding basic support for the OnePlus Nord 2 5G
DN2103 smartphone, this series adds support for the DVFSRC regulators
and prepares the DVFSRC driver to also set bandwidth limits for the
DVFSRC EMI Interconnect found in the MediaTek Dimensity 1200 (MT6893)
SoC.

The interconnect driver wasn't touched at all because the intended
change here was to enable support for the DVFSRC regulators but, as
those anyway required new platform data, laying the groundwork for
the interconnect came natural and would've been unreasonable to just
skip that as it anyway consists in one small struct and nothing else.

AngeloGioacchino Del Regno (5):
  dt-bindings: soc: mediatek: dvfsrc: Add support for MT6893
  dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
  regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
  soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data
  soc: mediatek: mtk-dvfsrc: Add support for Dimensity 1200 MT6893

 .../mediatek,mt6873-dvfsrc-regulator.yaml     |  1 +
 .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  |  1 +
 drivers/regulator/mtk-dvfsrc-regulator.c      | 19 +++++++
 drivers/soc/mediatek/mtk-dvfsrc.c             | 53 +++++++++++++++++--
 4 files changed, 70 insertions(+), 4 deletions(-)

-- 
2.49.0

