Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BA817BA3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152915; cv=none; b=mBm89eW1SA8ECq5uq6ZDweqdKQd6nGuj8zYJFk5aPyfoysHWfxwS7yiMPDQ/8/Y6fs9/cscBXOdWkSetUevNJZL5NAhfk45eT2e9lmgXlwVhSWuYPeP5KfzBmePIjTPFEncaagqaijEG9BmbSkyzkQLexkYM7TPwplNGP5h621Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152915; c=relaxed/simple;
	bh=imUnHAJW4kUasaKegLLGq5GuHaDnpGiDg1JTl4jIMYU=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=rkDSuNoeVfstA5wqXHsNHRpzX0x2w37w1GIWVOH+RldEAiDbkY6fkfGJePddspB74LLIDjAkyTGr02IRgWnQvSZrrg93LruAENL4rtFF5dgNPk3K+K9Bk+b+fA7QSpLUzcfhS8XgR0v54IgIks0+/UUJcD8bNymRFcba2cjF5d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZPF7M0y4tz501bg;
	Fri, 28 Mar 2025 17:08:31 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 52S98Jn1085156;
	Fri, 28 Mar 2025 17:08:19 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 28 Mar 2025 17:08:22 +0800 (CST)
Date: Fri, 28 Mar 2025 17:08:22 +0800 (CST)
X-Zmail-TransId: 2afa67e6670605c-c9cb3
X-Mailer: Zmail v1.0
Message-ID: <20250328170822125BzIvZeYNIQbV1oqrHVKxG@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <p.zabel@pengutronix.de>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <ye.xingchen@zte.com.cn>, <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vaW14OiBVc2UgZGV2aWNlX21hdGNoX29mX25vZGUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52S98Jn1085156
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E6670F.001/4ZPF7M0y4tz501bg

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Replace the open-code with device_match_of_node().

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index ec5fd9a01f1e..099605137343 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -185,7 +185,7 @@ static int compare_of(struct device *dev, void *data)
 		of_node_put(np);
 	}

-	return dev->of_node == np;
+	return device_match_of_node(dev, np);
 }

 static int imx_drm_bind(struct device *dev)
-- 
2.25.1
