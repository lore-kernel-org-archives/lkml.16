Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D350267B88;
	Wed,  9 Apr 2025 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204421; cv=none; b=sZMX9cozBwT9DMfYinoV1SBv02NyvjMmrNuEZy4XTBKgdOeUEnXZoKUUSpKHMa0W8cgHais85dr5XpI2Rsj/i/JE4VDv2r3eiRiPtN5D+/G8N6vMRVgkQhlhVjLVCaNFVX0Q8GTISgybh8TuXzwP3n94ti5zDz5uHARsh743ypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204421; c=relaxed/simple;
	bh=0ZnyNYBunZVKrfVBzEg9Tb9rO3d2s/FodrkAnZmDM8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1KgLWwR2I25MhE3N6gFFYurbOGPzzltzWiSPxW2ThiACWsf9HBL32+OSrMXgnNEQWnpkBSyDgbtWGQNDhr1KeoBFkDPveymIOEzxSjAMUMg7oUPqR3bFwS9S6wi1/tMLtsfLcnTb7aWsIB7WivS857OZJ11YDgtLs35bRE8rd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nw05zIMO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Nw05zIMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204418;
	bh=0ZnyNYBunZVKrfVBzEg9Tb9rO3d2s/FodrkAnZmDM8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nw05zIMOfCfBk6dAHUb1kH3bef413GVK0/DBmfXTSI4P+us5nwZE/kQUGwt9UU+Tf
	 OVhg6f4cRdYwkOX/dHCngMWaqoQXZCNHORuW9/DSs3EVmN2B2gkyNS/rVyVit4GRai
	 4Z3f282PtpKfrtymYppJvRIfyfAKyOe8O+M8TrEM0x33jLGJlqBqj4wtUauveGPf46
	 iEO6xSOKRd6usgScpcK/jS32pYdKWqwYOID6QAPz+LH7P1on8cDgdgVZeKU4fVIIWz
	 bMB0n3IlliR9jSD5fg9aWJg3y2eKLsE1Q3u43SuFQGCDp5P33JWdGmV1LxDwnu0pc0
	 0hfUGn33BqYUw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1003117E0FC1;
	Wed,  9 Apr 2025 15:13:37 +0200 (CEST)
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
Subject: [PATCH v8 10/23] drm/mediatek: mtk_hdmi: Move N/CTS setting to new function
Date: Wed,  9 Apr 2025 15:13:05 +0200
Message-ID: <20250409131318.108690-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for splitting common bits of this driver, moving
the hdmi_rec_n_table struct array, and the hdmi_recommended_n(),
hdmi_mode_clock_to_hz(), hdmi_expected_cts() functions, add one
function called mtk_hdmi_get_ncts() that sets both N and CTS in
a single call.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 87cf97136fb7..e7acf392b8f4 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -675,6 +675,13 @@ static unsigned int hdmi_expected_cts(unsigned int audio_sample_rate,
 				     128 * audio_sample_rate);
 }
 
+static void mtk_hdmi_get_ncts(unsigned int sample_rate, unsigned int clock,
+			      unsigned int *n, unsigned int *cts)
+{
+	*n = hdmi_recommended_n(sample_rate, clock);
+	*cts = hdmi_expected_cts(sample_rate, clock, *n);
+}
+
 static void do_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi, unsigned int n,
 				    unsigned int cts)
 {
@@ -705,8 +712,7 @@ static void mtk_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
 {
 	unsigned int n, cts;
 
-	n = hdmi_recommended_n(sample_rate, clock);
-	cts = hdmi_expected_cts(sample_rate, clock, n);
+	mtk_hdmi_get_ncts(sample_rate, clock, &n, &cts);
 
 	dev_dbg(hdmi->dev, "%s: sample_rate=%u, clock=%d, cts=%u, n=%u\n",
 		__func__, sample_rate, clock, n, cts);
-- 
2.49.0

