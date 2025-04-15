Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195D228F503;
	Tue, 15 Apr 2025 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713817; cv=none; b=Uca7a8+w6YEF9LYJeCZCxTRCJMhKJglPU1ObFMNoWjqnmiV9fmkgfXomvp5KVFAHW4/7rt90bgTtt6JkJptbuBCGJrCj99Jt7FEGls531oJzsNcJOaPLEucmhvxSJ6qd8LUN3E5Oaa7SUlbLJSUgjuAJ7z7mB71/kM2YnBtW/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713817; c=relaxed/simple;
	bh=Sq9KcR3RDrb3KAj97zK8VaCYoywPdOSiQnimWw65Ta4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a02XGCxBpEnFXKrG6rGTCD2zv6qxz5yF+iG1c3sdrf2dgfDbdCfuxQoEOTZTK2NS6zMjmJTBdSY71Ck5qwfdIbQ+ARFwvEWJm2F2yb6SGDBe/ouhs9qqhfpoXsZBEB26QUdzHOSOyvipYvC6mCNobL8mHG3xdEokUsRKP4cOPKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jZ4b9NXO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jZ4b9NXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713814;
	bh=Sq9KcR3RDrb3KAj97zK8VaCYoywPdOSiQnimWw65Ta4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jZ4b9NXOkZatwk9TjGN0IOMEnQ9l0Re4e5iTEB9idgxb2n53aE6aujxwbujlTeWol
	 ePHm0im9IiUz5CGIzuUBpFPO48/Vy5DJh/KIQjG7RnGdL0ksL3gsOWjuU+5V65Ua/V
	 8ULFhKVfntMQ7kWuMnCFdRx8M0bSGLC/GK03sCt8+mrW9KzsjYyJTnYR1Sydvve9hK
	 +4LL+GTZr06AGjMjlfLbgoYnMquQZoer6ikeaMoDA7U32HYZRHqDOOJLw9aZOQFaZX
	 bss11ak6eT+K/XC1J1QQebqIo5KNM+BX7q93YxPxDNXQu5l0SitqtCVkHZKkxZESuL
	 VxeuWmMvBL9jQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE1FB17E35E5;
	Tue, 15 Apr 2025 12:43:32 +0200 (CEST)
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
	jason-jh.lin@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 03/23] drm/mediatek/hdmi: Use syscon_regmap_lookup_by_phandle_args
Date: Tue, 15 Apr 2025 12:43:01 +0200
Message-ID: <20250415104321.51149-4-angelogioacchino.delregno@collabora.com>
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 06e4fac152b7..1358a5095fde 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1447,15 +1447,11 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
 	 * registers it contains.
 	 */
-	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
-					 &hdmi->sys_offset);
-	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
-	if (ret) {
-		dev_err(dev,
-			"Failed to get system configuration registers: %d\n",
-			ret);
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
+						      1, &hdmi->sys_offset);
+	if (IS_ERR(regmap)) {
+		ret = dev_err_probe(dev, PTR_ERR(regmap),
+				    "Failed to get system configuration registers\n");
 		goto put_device;
 	}
 	hdmi->sys_regmap = regmap;
-- 
2.49.0

