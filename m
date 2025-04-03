Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE1DDA9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666875; cv=none; b=EUuLxQQpISIcQibcfBmXhghZZCmHZ2JuB2d/lVenassHAfd7GjlxpIPcsl8r0E5nj7993XRxRDoJ/c2pXxdCpBbgJDeQah+sOGIjSx4QV75v7iIqTyhNFEbnMa01NYeDddPCG2kxz6nakFX/lTjKR2HJDIYaCPZwEmnhwtp2EFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666875; c=relaxed/simple;
	bh=5fB4PD+EOOxiWPTKKoSksR40DD8ONfafenBx+sWk9zI=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=fhL4Y6V+kjnihuZZQK7MOtu5sJzzypHpyW9OCX45BUaKtrUXmo2lGL0NdTmbQnS4ZVduOSD8lzxKGMieWd8rJz1qG6Oq6gDsCTNeN40OfgZVtuyWiSJxXTX0nG6T1/HWzzDf66pwu/B9aQZlE1dCjA7gsRhPZehZ+3KVF+iUBFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSvC91R8Lz8R046;
	Thu,  3 Apr 2025 15:54:29 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 5337sHdV081334;
	Thu, 3 Apr 2025 15:54:17 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 3 Apr 2025 15:54:19 +0800 (CST)
Date: Thu, 3 Apr 2025 15:54:19 +0800 (CST)
X-Zmail-TransId: 2afc67ee3eabffffffffbda-4dfa7
X-Mailer: Zmail v1.0
Message-ID: <20250403155419406T5YhIJKId1FWor70EWWHG@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <chunkuang.hu@kernel.org>
Cc: <p.zabel@pengutronix.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vbWVkaWF0ZWs6IFJlcGxhY2UgY3VzdG9tIGNvbXBhcmVfZGV2IHdpdGggY29tcG9uZW50X2NvbXBhcmVfb2Y=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 5337sHdV081334
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EE3EB4.002/4ZSvC91R8Lz8R046

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Remove the custom device comparison function compare_dev and replace it
with the existing kernel helper component_compare_of

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index fa0e95dd29a0..fe97bb97e004 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -492,11 +492,6 @@ static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
 	{ /* sentinel */ }
 };

-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int ovl_adaptor_of_get_ddp_comp_type(struct device_node *node,
 					    enum mtk_ovl_adaptor_comp_type *ctype)
 {
@@ -567,7 +562,7 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma

 		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;

-		drm_of_component_match_add(dev, match, compare_of, node);
+		drm_of_component_match_add(dev, match, component_compare_of, node);
 		dev_dbg(dev, "Adding component match for %pOF\n", node);
 	}

-- 
2.25.1
