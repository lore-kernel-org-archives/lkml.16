Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2313255F24;
	Mon, 23 Jun 2025 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680054; cv=none; b=GIduYAhmO9wzrEK0y7PSa39ls8m7gj4okrvfZ4EWVOOFvj2UHJV28ddkblKqCU21fFiSC22JZ6UeB1++cjDSSXi1cS0G6iGoSIR3DpIHVLHL8FqNSOwU2mg5IBZqgR/kcTjLHcXkHnIdTT8euVI+/mbw9JLy777cVYni3z9eXUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680054; c=relaxed/simple;
	bh=Zk9xYZpWQLdUXkxj9vbQMVErShBW8LRJhPSHcADb0LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gA7FU9OMA7XpqPKxcD/w6zxX1YaQT0BcPgdLUz/d5D2pO1HtUhiQA9mJhQPqvXuUJYd8pM4qMN3c+SwPAxTdwxK0kOlZEZd2hcQdo5odLNDnDrjsruFGez1a9FNitwtoi9CUoV3d/A3FSrBzRu3NvULRWC0d8PhCUxdPCQ8zNG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bER2egYA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bER2egYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680051;
	bh=Zk9xYZpWQLdUXkxj9vbQMVErShBW8LRJhPSHcADb0LQ=;
	h=From:To:Cc:Subject:Date:From;
	b=bER2egYAge1eYYGZ9MfPjjms01ofZwbFUQseO5nUfIFHPnIzLf4iBnSD7jtoh3472
	 bVJ1hTkpCT1/WWGFmTfg+OqXI7t4V5OC+yZ3gueH3Sou6tww+UN5gyg3+ptai84ocR
	 v4UX2IhHYckxY76Z05p7Jq/6L6uBF8bdts0zWEmdRzeysDMQfgpB8UCx/P/Q13wtXG
	 UzEiKY5Nq2qzFqsm72wZdTpQXVxco77mEzrkGQSjSSeFxqq/fJ4OYqhFp2R757Mg0u
	 YgOAu0JNKWv1NeiC8kHTp0ux9UDgBCMc0yoqVREDGOpkcAjnMNyupS4KvfigDPe2Ii
	 12ARPBKTDxdnw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ABBF717E090E;
	Mon, 23 Jun 2025 14:00:50 +0200 (CEST)
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
Subject: [PATCH v1 0/5] SPMI: MediaTek: Add support for multi-bus
Date: Mon, 23 Jun 2025 14:00:42 +0200
Message-ID: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

