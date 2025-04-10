Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B86F28C5DA;
	Thu, 10 Apr 2025 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296006; cv=none; b=KzKVJLylZjKHaAQ2MnY+rnVPlLLRG1Nqj+UfMw/271C1FX3Dw6F4QiFPlDqqC6LbUzV3I7G2uw/Shft40aU9+wCM11ipVGYmMD49pFPoaAerBYz/rEAE+gVbanLiM5HKv39ztZyp9Zw2PJUYf49s63gCVxLlLx7V7HD7rwy54Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296006; c=relaxed/simple;
	bh=88N8hc6MaDmCB2E+c9BN0cKVbLYbqOereIkJ5ciR0Mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UuNyp/4kaeF1oabtbqm1UVp8gfYBeFBciIpJcKptK1olr1HyThQjeAgSvA4UZHYuS+PenBwjtcIcaAmBBv1Zl/T1muNj4e4uemVSJQoLAgzHTmcWob2B/PL/5sqDDuGFi9FC8qEFEhNjri9yu6tklB49OPmu5L8km3hQah3q8EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KbHfDuCR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KbHfDuCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296002;
	bh=88N8hc6MaDmCB2E+c9BN0cKVbLYbqOereIkJ5ciR0Mk=;
	h=From:To:Cc:Subject:Date:From;
	b=KbHfDuCRZIADQ6itxCf6zf34AonLoaUiKxevLMmuXUe2Pyun+fAyAXXSIEmcg7x8l
	 de/BwQ6iL+l1wSRr+7IVbGgq7jjW9Xhap2YgI5+HfOdygI8XM1x2ydbgB+GvGNsRQD
	 0zxR3cEPUFwDXxixueqXBYhUOSi1jEiC7PPeStVVpzSBBn4VwipcXewmP5LtESsmdw
	 DbNr1uwSRO6e66BN6IyTh5cwMJvQZU2t0noSBwzCJ2P8C2oZeStnRiQCZXvYC+f4sq
	 XxF0k7ywOOwCVBh6eyg7i1d1CUU+j5PfaytBSMtvRTZZMNJrHxIfP/lef8FdNGQd+K
	 v8vuWpEcD0C3g==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 491C217E10F7;
	Thu, 10 Apr 2025 16:40:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add SMI support
Date: Thu, 10 Apr 2025 16:39:56 +0200
Message-ID: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding basic support for the OnePlus Nord 2 5G
DN2103 smartphone, this series adds support for the Smart Multimedia
Interface and Local Arbiters of the MediaTek Dimensity 1200 (MT6893) SoC.

AngeloGioacchino Del Regno (2):
  dt-bindings: memory: mtk-smi: Add support for MT6893
  memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI

 .../mediatek,smi-common.yaml                  |  1 +
 .../memory-controllers/mediatek,smi-larb.yaml |  1 +
 drivers/memory/mtk-smi.c                      | 52 +++++++++++++++++++
 3 files changed, 54 insertions(+)

-- 
2.49.0

