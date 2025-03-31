Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E6519938D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413553; cv=none; b=dZtcxgs8ZVenTm1tXHEJ6/kwvJiAFf3oE7EPWXjrxKZw71Ky+lPXFz+MFoXMxlGvdoQVNZ5Ld0eAwzoVNk9dr+vZCF2JXvQ1EVs/vPmg0RvoqC9qBXFw38eWopP6JuvMqzRyInq4MAZwn8HwqDTMdRxvsaZU24ty2hzwTVpEkdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413553; c=relaxed/simple;
	bh=1JcVTtiE2uNogmA1+RWUa4kQHorhjdGQfQUNoEk9eow=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=SAadFdIjq7r00go+daC4t1f0LGFIrm9GxAmFENAwSX2gnUT2RcfYbypD6iDADXQP5CwFpTgEPpgu3WpP0uzgFa1XQcxyjy6tjYA3Dm4+aKhjygEfePfUmPHxEU9auT7gpPAfKZjjjCz7yAvY3CADWFlTIEz5z+n/dTBVLqY9ZSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZR5Wd0yMcz5B1J4;
	Mon, 31 Mar 2025 17:32:29 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 52V9WGgO015083;
	Mon, 31 Mar 2025 17:32:16 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 17:32:19 +0800 (CST)
Date: Mon, 31 Mar 2025 17:32:19 +0800 (CST)
X-Zmail-TransId: 2afc67ea61234f6-46bb8
X-Mailer: Zmail v1.0
Message-ID: <20250331173219124r-M-68bU1iEuljZXmBeS8@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIDQvNF0gZHJtOiBtZWRpYXRlazogUmVwbGFjZSBjdXN0b20gY29tcGFyZV9kZXYgd2l0aMKgY29tcG9uZW50X2NvbXBhcmVfb2Y=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52V9WGgO015083
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA612D.001/4ZR5Wd0yMcz5B1J4

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Remove the custom device comparison function compare_dev and replace it
with the existing kernel helper component_compare_of

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74158b9d6503..e1fbb0fe0597 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -627,11 +627,6 @@ static const struct drm_driver mtk_drm_driver = {
 	.minor = DRIVER_MINOR,
 };

-static int compare_dev(struct device *dev, void *data)
-{
-	return dev == (struct device *)data;
-}
-
 static int mtk_drm_bind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -1119,7 +1114,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev = &ovl_adaptor->dev;
 		mtk_ddp_comp_init(NULL, &private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR],
 				  DDP_COMPONENT_DRM_OVL_ADAPTOR);
-		component_match_add(dev, &match, compare_dev, &ovl_adaptor->dev);
+		component_match_add(dev, &match, component_compare_of, &ovl_adaptor->dev);
 	}

 	/* Iterate over sibling DISP function blocks */
-- 
2.25.1
