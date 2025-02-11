Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5945D257AF1;
	Tue, 11 Feb 2025 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273711; cv=none; b=jSC67O5aRmqj0J6ruioA5DNV9n+ytwOQhWgOUal9JGQh5obno6z+PftA5GRN3SMpWjX+OTjVkVqV7rp4xOCspXDd2DPZx4AgzK6nsBwYrs+4RV7fORTzc7CKVqISmK5/59SgNDS7jxE9TcIRucNYo/s4Zu1AyexHv9QQuTVp71E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273711; c=relaxed/simple;
	bh=zsvtpwR8ZbYLRu4Z9EpZnoP0yLsKeHqoWYykVxwC1Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFqv5xea51zHtp8o+jVLisYGy0LK0kAhitxVQmwKZT1TgB35HDzRg2BmTyIP/qOW5g7/pZoWfedsEUISW1dUscpc6mwoakYt/gZmCff99tXrjssbQ2PbuE0PZ9bd+OfRHWb6OKgAIMUCCK5tqlnu0Nq9Dzi+AD5ZD9BCHU/NKMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CWpAR6u0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CWpAR6u0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273707;
	bh=zsvtpwR8ZbYLRu4Z9EpZnoP0yLsKeHqoWYykVxwC1Xo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWpAR6u0lR1kGILXzovPs19wFZzcdynhJ7+YYnCv8f5FErvPGQ8DcZDYdcLBLxO/J
	 2D3k6rE57WN07Io0pEU/8O5uJ20XSyKddK04M1HRnl8O8vcafAyUXuwqe5RZAQSprf
	 Qz+b856rCXMXmdBxeHFWYHwd63FRuP4bMYtBNMfRVdIJ1ocTlkYKK1BoFxk3sIqDyP
	 WgscO4buqxxnFWlkRUGv+rpd0XGPmImNx6j0FrEIZnzYCkgUmjD34msdwoKe+fvzOc
	 gSatQDq7ZeliIg0Gcgxt7ffY1r1XEih4EIQUfLb58uR1a8xU7slJQhDJOy7eZ9GvL3
	 f2A4D5Z+T+woA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A219E17E1545;
	Tue, 11 Feb 2025 12:35:06 +0100 (CET)
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
Subject: [PATCH v6 32/42] drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
Date: Tue, 11 Feb 2025 12:33:59 +0100
Message-ID: <20250211113409.1517534-33-angelogioacchino.delregno@collabora.com>
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

Remove the error print in case of mtk_hdmi_clk_enable_audio()
failures: since the APIs will already print on their own, having
one in there is redundant.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 53c28737ac2a..8f31363c5522 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1704,15 +1704,8 @@ static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
 static __maybe_unused int mtk_hdmi_resume(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-	int ret = 0;
 
-	ret = mtk_hdmi_clk_enable_audio(hdmi);
-	if (ret) {
-		dev_err(dev, "hdmi resume failed!\n");
-		return ret;
-	}
-
-	return 0;
+	return mtk_hdmi_clk_enable_audio(hdmi);
 }
 
 static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
-- 
2.48.1

