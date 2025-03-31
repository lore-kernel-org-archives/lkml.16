Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7F1D54C2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413431; cv=none; b=j0witOuUC3iQFxoDakiK29lJ5J8eaANP4vYknRa/K89yvdh0qpWzDm81tchIXM8WQhOnbhh+grRH7LqL7TUDY1qEuGbu6gom2lxj1hpWEaoLq8M7Ux6OSrH52DgXODp6NPKnbxg8AQrqHFb689sQbuVRlpQ58Nm7QpNto71lHEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413431; c=relaxed/simple;
	bh=7lU+AXgFrvbyfLTSbBLPpY3PfGayQimbtRFh9sx3cWE=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=XpG4OnOeFvkBdFcFtUR4Fp/M23Rw7jrWnro5oryGCopFoHF5ZP6nyyScwYZA8XNAeMKsP0+4dI5uIHC2vy2HkE9leGdlaIVqESxcvzcgmhGhayp/04hODrymTQAwAS9RaOFsKnDGEBEmRySWjpLtpVzgebjeAPUCqNzA0ps1OlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZR5TD2Vcvz51SYB;
	Mon, 31 Mar 2025 17:30:24 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 52V9UFYJ012636;
	Mon, 31 Mar 2025 17:30:15 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 17:30:18 +0800 (CST)
Date: Mon, 31 Mar 2025 17:30:18 +0800 (CST)
X-Zmail-TransId: 2afa67ea60aaffffffffe28-414f0
X-Mailer: Zmail v1.0
Message-ID: <20250331173018043nQB6z_xgZxuYx0AkGeixh@zte.com.cn>
In-Reply-To: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
References: 20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <j@jannau.net>, <liviu.dudau@arm.com>, <chunkuang.hu@kernel.org>
Cc: <fnkl.kernel@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
        <asahi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDIvNF0gZHJtOiBhcm06IGhkbGNkOiBSZXBsYWNlIGN1c3RvbSBjb21wYXJlX2RldiB3aXRowqBjb21wb25lbnRfY29tcGFyZV9vZg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52V9UFYJ012636
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA60B0.001/4ZR5TD2Vcvz51SYB

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Remove the custom device comparison function compare_dev and replace it
with the existing kernel helper component_compare_of

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index c3179d74f3f5..45b1dc5613bf 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -346,11 +346,6 @@ static const struct component_master_ops hdlcd_master_ops = {
 	.unbind		= hdlcd_drm_unbind,
 };

-static int compare_dev(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int hdlcd_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -361,7 +356,7 @@ static int hdlcd_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;

-	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
+	drm_of_component_match_add(&pdev->dev, &match, component_compare_of, port);
 	of_node_put(port);

 	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
-- 
2.25.1
