Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E23B1CAA80
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413335; cv=none; b=QlCydXRm1Q6c2lL4Zj6Xj9Kvdk5Y6aYv8D3erOGUM0cmvO4c/0yY2fdYFrv+pa6dTzlneBdAztSpFOH6TLm6P/X5tr0U7jXsXyoAQbt6eogaw1sW0Fetcyu7rznnnJvtlOPc6Bii2ALBROsXG06VCuxdBW8B504umzaIbDOYsQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413335; c=relaxed/simple;
	bh=ZE02ltsi/dKXqT8C8XiFp0809jPdUF/it0TskvCr9B8=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=ME/RGZz+SeZjeL8AzmszIUwpT35WARfyPWnI4hhqGcZ5D1Kn7wZU9gEJS8FS0NmlqTfOfnUiW41NoJ+A6vcOpyEfBwsTclt3DZ/Ed3sHOTD5ea3/Zi8d+zsvBcEGljZvXIN5IVT0YXljcSMJAY4dV3EXxgRmRIzwo2lmECHc+Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZR5RM6VpRz8RV7S;
	Mon, 31 Mar 2025 17:28:47 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 52V9SgnN078747;
	Mon, 31 Mar 2025 17:28:42 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 17:28:45 +0800 (CST)
Date: Mon, 31 Mar 2025 17:28:45 +0800 (CST)
X-Zmail-TransId: 2af967ea604d2f7-429bd
X-Mailer: Zmail v1.0
Message-ID: <202503311728456105AyS6yPwkx8Ccwv6GviVL@zte.com.cn>
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
        <mripard@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <asahi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <tang.dongxing@zte.com.cn>, <tzimmermann@suse.de>
Subject: =?UTF-8?B?W1BBVENIIDEvNF0gZHJtOiBhZHA6IFJlcGxhY2UgY3VzdG9tIGNvbXBhcmVfZGV2IHdpdGjCoGNvbXBvbmVudF9jb21wYXJlX29m?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52V9SgnN078747
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA604F.002/4ZR5RM6VpRz8RV7S

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Remove the custom device comparison function compare_dev and replace it
with the existing kernel helper component_compare_of

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/adp/adp_drv.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index c98c647f981d..32350c1a5c1f 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -551,11 +551,6 @@ static const struct component_master_ops adp_master_ops = {
 	.unbind = adp_drm_unbind,
 };

-static int compare_dev(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int adp_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -579,7 +574,7 @@ static int adp_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;

-	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
+	drm_of_component_match_add(&pdev->dev, &match, component_compare_of, port);
 	of_node_put(port);

 	return component_master_add_with_match(&pdev->dev, &adp_master_ops, match);
-- 
2.25.1
