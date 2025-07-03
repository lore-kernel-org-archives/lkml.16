Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C4EEA9;
	Thu,  3 Jul 2025 11:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543927; cv=none; b=lVx6RZTM0wo6E19+2N+LIPsBSh24RHb97xk0cAf68Rohj/6q2f6W8oIPGn42tZev5WktRdA5H/Y4tzUxSFGSlGNVMAFbknXWeSpZ6YX9a7aIBy5sWoV2NfBZOJPApEl/6MZPhmvBwRVG/q9edsjASzsX8E6V4Ea9ZgFuVH9mD5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543927; c=relaxed/simple;
	bh=Cb+Jkon26DDgxH0Srzbbx+G+MR1ZIz7hkXTs9ISJRxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qARLYzTLAw4rXgKcDt9rRWxIarC18qHtrxuUFnwoGisqc4l10H7uDDeNycsCGdpwXEBE9/Ak0RwinCxFvxYl4tnCaWDIk9pxfgFaq5SVAlKTvxVhndcd4fmNZ8PpbXqQgttwVxPrKa1MyIjvh6Mt1iYOAWW07fg3fGShh/GX9ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=K5i1ue2L; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="K5i1ue2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751543923;
	bh=Cb+Jkon26DDgxH0Srzbbx+G+MR1ZIz7hkXTs9ISJRxQ=;
	h=From:To:Cc:Subject:Date:From;
	b=K5i1ue2LdkZrKfkSYj5k/qzAqfkQzdGrxa5+VOXp5ui+yxoFUnzjCynxyXUJ98DSz
	 NV1JcO2t/QvjHTdOAxVdJ1y6bjv3E3VVg4jzrqSTck2cGq1frI5wnoG04tRQBVGXhR
	 pkUNIE408rYm/k3bvBSBRYkTJAzWsEd6eKpVVh3L6oItUvuKGJ72XgMj15vihAhIq5
	 oYrE32W75XGbsd5YKREBqVVy62tHfb8D9nWy42jjZKGLs6dpavhDrTq5rQbiV4FfGF
	 pBrzXBaLdQwK+ml/TiUEdDJo8hItfk9JmtEFZw0MfUf1U6SnrFlkCx3zt1kALgTUWw
	 0eQUsC1Po2LIg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDF7017E0071;
	Thu,  3 Jul 2025 13:58:42 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/5] SPMI: MediaTek: Add support for multi-bus
Date: Thu,  3 Jul 2025 13:58:23 +0200
Message-ID: <20250703115828.118425-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Fixed indentation error in dt-bindings

This series adds basic support for multi-bus (multi-master) SPMI
controllers, as found in the MediaTek MT8196 Chromebook SoC and
the MediaTek MT6991 Dimensity 9400 Smartphone SoC, including RCS
interrupt handling and per-bus registration.

AngeloGioacchino Del Regno (5):
  dt-bindings: spmi: Add MediaTek MT8196 SPMI 2 Arbiter/Controllers
  spmi: mtk-pmif: Add multi-bus support for SPMI 2.0
  spmi: mtk-pmif: Keep spinlock until read is fully done
  spmi: mtk-pmif: Implement Request Capable Slave (RCS) interrupt
  spmi: mtk-pmif: Add support for MT8196 SPMI Controller

 .../bindings/spmi/mediatek,mt8196-spmi.yaml   | 138 +++++
 drivers/spmi/spmi-mtk-pmif.c                  | 471 +++++++++++++++---
 2 files changed, 530 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml

-- 
2.49.0

