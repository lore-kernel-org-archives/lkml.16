Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D60257AC3;
	Tue, 11 Feb 2025 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273709; cv=none; b=lyRVveVl+aF6H5TWFAevOLwjzGSM8i7PyLMweHLkHKV8FegnrGgEWhKvKqReKkQJKYUpfD6r4i5Cdzh8bYMuyX4/SMuStOq56sIKSO+PJemzRLrE1KSnRUGI8xwQLnlKdX2Ta0V71ZQwD1Er7TjUWVPrWpjjU8wx/JK7MOJvZ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273709; c=relaxed/simple;
	bh=bNAeqzzfsdSSsErdVI+oe8ZaTzRPLejXIIaCMLxt6N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMlyFvAWm2YUYC8fUVD2YtG1lRH5lJMDYlUMzgD6Situ7yejh3tphmYyo2wJPvPlJ7OOFZtWNYV4WosgEpwGDpyH7v87YwVKMEIm8YlvV+GDePYaDdSuXMayRIp1fMLxOgjsONS1S64ZNZYxs6jtaMV4LONQy7rSIbypRqwH+cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PWZs4SLh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PWZs4SLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273706;
	bh=bNAeqzzfsdSSsErdVI+oe8ZaTzRPLejXIIaCMLxt6N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWZs4SLhBxXwbVEJpp1BjCjUZ5J1IiZEDNQpSzc7Y/DysHnELRejuY+uYN2AoE31C
	 BvOH7eRHOpKSExGzCPPokmebBsb1F8KIr0AUIyYbsWKQs7tOOUAlnM1N2Gy/i5a2WO
	 mYYLairrGSQxCRAL3JnT3mfHLOfy5RdQkkVsxnCGcjGkLk4bsZJEuCIDU8Dt9yzPtD
	 5k7DGV79OfaWfiIIt7pMCz9/nov3ftFF+ZszUy92MMyB9SMIgbXnga8PH2CpMjGssH
	 efszg1Zm0BpW2en9XvQg9aYpSeeAOkw8Xv/tx86IkJSh9Q20OT7CAgx9xr5BhFn82v
	 jCH8q+PtwoyyQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 24F9317E14D5;
	Tue, 11 Feb 2025 12:35:05 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v6 31/42] drm/mediatek: mtk_hdmi: Remove driver bound to HDMI print
Date: Tue, 11 Feb 2025 12:33:58 +0100
Message-ID: <20250211113409.1517534-32-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the "driver bound to HDMI" print to avoid useless spam in
the kernel log, as registered and bound drivers can be debugged
through debugfs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 9c929092a9a9..53c28737ac2a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1632,7 +1632,6 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	if (ret)
 		return ret;
 
-	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
 	return 0;
 }
 
-- 
2.48.1

