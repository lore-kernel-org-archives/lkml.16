Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14654258CEA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054071; cv=none; b=Pob16keXN0LLf/Rf2+pCqOlesUf3q0Lej/IhdO3eUnX5WhkEl+l7n8P7pP+P9CxFSPaRpZT3naaNN0o4YbcEthgnLDTnB2Czyf2JdygulEesE+WvtE3wkIgwZ21U9/84X3hsYa6n9bqm711xiya8NYuepRtCBNhndaoRdnOyJc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054071; c=relaxed/simple;
	bh=V1keSoVKR33dBQrRuFhe/vQPYp82UwEAETDkAyvChFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fs2BddES1t77z4NJBiZQIekFGnXbkssUp+Tz1bOa6MJcUwf5W3qsTdviy/bAhhGIRK1yJ6Cd2JIgtFxNj/KALc63UzN7bFCo5C/7DCOqZedwuYj7xotaTiww+GRtJxcWhwfdQKPIz5dpx5BmjVGv7E8HWiw95CU5P2tNQuZ+yd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dYEgk0mr; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dYEgk0mr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dB
	S7SAsAp5FhUlU/3iHX21eFkYpu2uCNBgSKCpFIXoc=; b=dYEgk0mr8SQrs9C3Yb
	mU0uQ95jeLLh/2SUuUKGtv75BEX7AbJnbBkDRE/oPkQv7kzOro8QdBRuEwi7ZRDV
	MK0WAaFt3v94mYzWD9cHkgMgEyNW7ozuZYXnvGuevseJkpE5jSS+VO7kZ1i9PIxV
	R0OE50jCrxiXCI7EeDADEoQvA=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S10;
	Mon, 12 May 2025 20:46:29 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	hjc@rock-chips.com,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 08/10] drm/rockchip: inno_hdmi: Simpify clk get/enable by devm_clk_get_enabled api
Date: Mon, 12 May 2025 20:46:09 +0800
Message-ID: <20250512124615.2848731-9-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgC3chWY7SFoQ+_OAQ--.62400S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1fJr1UGF4fWr43Cry3Jwb_yoW5uw4kpr
	y7AFWYqryxJF4jg34UZF4UJr1FyF4UGa47GrWxWan3AwnxXr15KFW0vryS9FWFyr95Za13
	trWkXFy5Z3WUWF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8nYwUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g9LXmgh5MDHDwAAst

From: Andy Yan <andy.yan@rock-chips.com>

Make use of devm_clk_get_enabled() to replace devm_clk_get() and
clk_prepare_enable(), which will make the cleanup of clk code simpler.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from PATCH 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 50 +++++++---------------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 776a2aa74e49c..1ab3ad4bde9ea 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -1269,53 +1269,34 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
 
-	hdmi->pclk = devm_clk_get(hdmi->dev, "pclk");
+	hdmi->pclk = devm_clk_get_enabled(hdmi->dev, "pclk");
 	if (IS_ERR(hdmi->pclk))
 		return dev_err_probe(dev, PTR_ERR(hdmi->pclk), "Unable to get HDMI pclk\n");
 
-	ret = clk_prepare_enable(hdmi->pclk);
-	if (ret)
-		return dev_err_probe(dev, ret, "Cannot enable HDMI pclk: %d\n", ret);
-
-	hdmi->refclk = devm_clk_get_optional(hdmi->dev, "ref");
-	if (IS_ERR(hdmi->refclk)) {
-		ret = dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
-		goto err_disable_pclk;
-	}
-
-	ret = clk_prepare_enable(hdmi->refclk);
-	if (ret) {
-		ret = dev_err_probe(dev, ret, "Cannot enable HDMI refclk: %d\n", ret);
-		goto err_disable_pclk;
-	}
+	hdmi->refclk = devm_clk_get_optional_enabled(hdmi->dev, "ref");
+	if (IS_ERR(hdmi->refclk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
 
 	if (hdmi->variant->dev_type == RK3036_HDMI) {
 		hdmi->grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
-		if (IS_ERR(hdmi->grf)) {
-			ret = dev_err_probe(dev, PTR_ERR(hdmi->grf),
-					    "Unable to get rockchip,grf\n");
-			goto err_disable_clk;
-		}
+		if (IS_ERR(hdmi->grf))
+			return dev_err_probe(dev,
+					     PTR_ERR(hdmi->grf), "Unable to get rockchip,grf\n");
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_disable_clk;
-	}
+	if (irq < 0)
+		return irq;
 
 	inno_hdmi_init_hw(hdmi);
 
 	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
-	if (IS_ERR(hdmi->ddc)) {
-		ret = PTR_ERR(hdmi->ddc);
-		hdmi->ddc = NULL;
-		goto err_disable_clk;
-	}
+	if (IS_ERR(hdmi->ddc))
+		return PTR_ERR(hdmi->ddc);
 
 	ret = inno_hdmi_register(drm, hdmi);
 	if (ret)
-		goto err_disable_clk;
+		return ret;
 
 	dev_set_drvdata(dev, hdmi);
 
@@ -1329,10 +1310,6 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 err_cleanup_hdmi:
 	hdmi->connector.funcs->destroy(&hdmi->connector);
 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-err_disable_clk:
-	clk_disable_unprepare(hdmi->refclk);
-err_disable_pclk:
-	clk_disable_unprepare(hdmi->pclk);
 	return ret;
 }
 
@@ -1343,9 +1320,6 @@ static void inno_hdmi_unbind(struct device *dev, struct device *master,
 
 	hdmi->connector.funcs->destroy(&hdmi->connector);
 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-
-	clk_disable_unprepare(hdmi->refclk);
-	clk_disable_unprepare(hdmi->pclk);
 }
 
 static const struct component_ops inno_hdmi_ops = {
-- 
2.43.0

