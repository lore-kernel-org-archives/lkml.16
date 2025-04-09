Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B499C29A0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204396; cv=none; b=LLBDurKerLqB4lOsJJIz0lMI8Nr8yezZp/ZvyjMrmu5b7i6sOXh00pm67tE9H6mbrO3eypD1ahoF/0i224s+F1S1UNkQrmLn9dULFJL/cpIzbdECdG9IK9FIm8kxwZ6BPcMN7BSXkpqpCEt6J3vkrxlPIh8qqEDIeUL3zpj0opM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204396; c=relaxed/simple;
	bh=os6fwx/KmcGx48eeTShCfonZ2h/wBxh0gQYferMBJH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nY/3Nc+OI12+V6sFe+ZcscMuMviJwTzO06ld4/rv3PWs1aRIroNjYdzIvbdRQx/3v6omHDfzqMGMXcHSd2nKkxh7xJTB4iHfZTmuQbdTTU/opSFYCwB8KjIvZdMUx/7VbyD4/7wA51O4xbCSvkMI5Ck/DJ1Cs3xjcdLsV2c7RWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pKLRkHXI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pKLRkHXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204392;
	bh=os6fwx/KmcGx48eeTShCfonZ2h/wBxh0gQYferMBJH4=;
	h=From:To:Cc:Subject:Date:From;
	b=pKLRkHXIRT0xA7HFsZp7jFX2hYyn8nVI/Rq44+AxaqOnEcaqH/LlPJVL9CLHXa2OP
	 +BAZsZ05lFd00wBuXehVrRL+Je/JKjglL8pvNafdrvjuvyBeSqlr742WhJPSam9NH9
	 cZrkbD8EXFDdPj48lOjWsCnRUuFcxkvsh/wV97F+U9eBISMrKLV9X/I2Lk2rWnVqgj
	 KxxNwcmVALF5DMPIsLyC9APpO3beWJNYlkbOz6o/hJ93Ps37PaXwZTwpy3xw/SFJTP
	 /Lal0LLdsCxoHgokw8z+jy1EBGLLFeqwDQfOOyvVvlvC81taR10sTnUiYFCjbTs91P
	 hCH0Cm03ZDcBg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D0B8E17E07F2;
	Wed,  9 Apr 2025 15:13:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v1 0/5] MediaTek DPI: Cleanups and add support for more formats
Date: Wed,  9 Apr 2025 15:13:01 +0200
Message-ID: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support to configure the MediaTek DPI IP to output
more formats, such as YUV422 8/10/12 bits, YUV444 8/10 bits, BGR 8bits,
and RGB 10 bits, and also performs some cleanups that improve the code
readability when those are added.

Even though some of those formats are also supported by MT8173, MT8183,
MT8186 and MT8192, I am enabling them only for MT8195/MT8188 as those
are the only two that I was able to test.

This was tested on:
 - MT8195 Tomato Chromebook
 - MT8395 Radxa NIO-12L
 - MT8390 MediaTek Genio 700 EVK

AngeloGioacchino Del Regno (5):
  drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
  drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
  drm/mediatek: mtk_dpi: Add support for additional output formats
  drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88
  drm/mediatek: mtk_dpi: Rename output fmts array for MT8195 DP_INTF

 drivers/gpu/drm/mediatek/mtk_dpi.c | 117 +++++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 15 deletions(-)

-- 
2.49.0

