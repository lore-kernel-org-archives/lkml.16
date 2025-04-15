Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4270528F527;
	Tue, 15 Apr 2025 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713849; cv=none; b=fhzQaCsDQPzTPwbiqDnUspEi2l0dEyWemohFnAcLRjm2A564M/nSnEo7GhCBpU9rb5YijlqA7+Gd+zRqfYQlhlvokM59fvFsvTBaCgl1pwQ7MeTd+uQYvv6hnMyJOVIduwS65JYKfUH+3FEihgOiXjwKqcuzR7dyLLfU+OZecz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713849; c=relaxed/simple;
	bh=a91+q+20hy0NODEIDCf468pEbhhoKhEbHoR3+M0KwbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRm14aDMoH7ziteMHVgBtVFLQcE4pIbmtA3bmqOWg+h85+aH9qcaXIBK/1TvaZvLjp+m0ZtOp4Q3Tq3yGkppKgoEMeh3ctVB9myfZZAOpqVM2rk4KsAhHpWXnB99RPN0YZnut8cNUhmkwHyxE2+fP0ASZXA8gmraVAx/5dYAJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B8IBB8PS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B8IBB8PS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713845;
	bh=a91+q+20hy0NODEIDCf468pEbhhoKhEbHoR3+M0KwbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8IBB8PSD6tv37+sGw2GaVj06lmR8S7OdnHoLX7wrGawQz31qaIAgrFAaOl0waVvP
	 Snyodm8roOGQjm80u+fsFx5XPndAPIJ15WUEvwh1wyIzLQHEM+03iFO445edwj+KcU
	 ZYVxbmg/x7dXh3NehVoYSS1jV7qMrZqS8URlMJn4Lp4fv9TPSVcnn0fnv9uHfIs346
	 3OZAfkyRKpDBMva7XKowBk2wn13wZVnmDo7rcWIRTUB43nWCAWCTGTdjQ2mUE0qZwJ
	 Rp+vxGuqz+Y5K/qBx4/U8HpO5rYuLUV0jFtmdGkqLG9bGIU98ce+kPzJ+Hg16EbAiW
	 hj+pyohmM9F0A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E2C7B17E09B5;
	Tue, 15 Apr 2025 12:44:03 +0200 (CEST)
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
Subject: [PATCH v9 21/23] drm/mediatek: mtk_hdmi_common: Add var to enable interlaced modes
Date: Tue, 15 Apr 2025 12:43:19 +0200
Message-ID: <20250415104321.51149-22-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an interlace_allowed bool member to struct mtk_hdmi_ver_conf
which will be used to signal whether interlaced modes are supported
by the bridge (in our case, the HDMI IP), and enable it for HDMIv2.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index b6043d99be7e..dc59f46b790c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -415,6 +415,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
 	hdmi->bridge.product = "On-Chip HDMI";
+	hdmi->bridge.interlace_allowed = ver_conf->interlace_allowed;
 
 	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
 	if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index d3de8afff40f..38d1bdf4c77e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -131,6 +131,7 @@ struct mtk_hdmi_ver_conf {
 	const struct hdmi_codec_ops *codec_ops;
 	const char * const *mtk_hdmi_clock_names;
 	int num_clocks;
+	bool interlace_allowed;
 };
 
 struct mtk_hdmi_conf {
-- 
2.49.0

