Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26D14375D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152091; cv=none; b=gXoLDrg1k16KpyKu9uZWJxXFN0WW/h9dpFfDy7Ci+JA5zg0Y5S2zHD7rOz4gmHNhSNpD0JkTNxWth91eKPSfNpuQPAULVrvjXRY0Q2caLNTG6rbw9MSVS6fUy1y3YAbxwWCr38FX17ks5XeyyTgau7jm2EFvVAPfo8rfn4euT78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152091; c=relaxed/simple;
	bh=JebWOiMUTSKPMjERSVLm9ceMZPo81CbiCPdA9uYvbAw=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=iWNSQDzS8kDlFibn30IupgGg6J9GbzekN4GOz7xQkyNVuoDBx9BtDHSj9y0AJPOb2X2IV4b7H4Xoh/dh6+LhisKBV6Q+HuTnJDTuU7IrlwgPrK1q2b3H3j5iMsyF8iKam8mB++ykDHn4wtabrxh7PEjfGyVcclomyOXeoJzhdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZPDqM61vZz51SY1;
	Fri, 28 Mar 2025 16:54:39 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 52S8sGQZ091550;
	Fri, 28 Mar 2025 16:54:16 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 28 Mar 2025 16:54:18 +0800 (CST)
Date: Fri, 28 Mar 2025 16:54:18 +0800 (CST)
X-Zmail-TransId: 2afa67e663baffffffff8ae-ad522
X-Mailer: Zmail v1.0
Message-ID: <202503281654187495nHLsjr7StdB4BpF27qtC@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <maarten.lankhorst@linux.intel.com>
Cc: <mripard@kernel.org>, <tzimmermann@suse.de>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vdGVncmE6IGRwYXV4OiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52S8sGQZ091550
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E663CF.004/4ZPDqM61vZz51SY1

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/tegra/dpaux.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 2cd8dcb959c0..e5297ac5c0fc 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -501,14 +501,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)

 	dpaux->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
 	if (IS_ERR(dpaux->vdd)) {
-		if (PTR_ERR(dpaux->vdd) != -ENODEV) {
-			if (PTR_ERR(dpaux->vdd) != -EPROBE_DEFER)
-				dev_err(&pdev->dev,
-					"failed to get VDD supply: %ld\n",
-					PTR_ERR(dpaux->vdd));
-
-			return PTR_ERR(dpaux->vdd);
-		}
+		if (PTR_ERR(dpaux->vdd) != -ENODEV)
+			return dev_err_probe(&pdev->dev, PTR_ERR(dpaux->vdd),
+					     "failed to get VDD supply\n");

 		dpaux->vdd = NULL;
 	}
-- 
2.25.1
