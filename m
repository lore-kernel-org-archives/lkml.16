Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EA9156236
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743047582; cv=none; b=eeJRyyQyAZjNrdJHlgkckiej+W4isyNM5wgDB7adw2oMq2+DnKndKqrXl2GQ7F4BDG1FKNF/AQrknwFDWN9TzwImBrK9E3xa64M1Fy8BBetNB8/80JIppKcND3SLkCwiWdx7CIBNJXRcnBfBWW3WC0p++zoSa1nb+76dZJVzzns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743047582; c=relaxed/simple;
	bh=LYypvfF7D397wb3i8Q4RY46I0a3eMvUOY6tCjPz+7l8=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=EeOnLdIzFG8joUBJI3gsyn6oIhyCDyzfZqaG9UAt9C5obbzF8nq8+LJqMNy1SUKBRkDDQyHlXlJ2Y/C4igaXVFd8YgvSX63cMSyZO/XqrooL7XaDdUDKVHWqSkP/Vdba0kPMyxA+rxeD1dV/OEGooodZH8vUl9+45NHNQ4DImCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZNV9g1bjGz8R039;
	Thu, 27 Mar 2025 11:52:55 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 52R3qlTU062070;
	Thu, 27 Mar 2025 11:52:47 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 27 Mar 2025 11:52:49 +0800 (CST)
Date: Thu, 27 Mar 2025 11:52:49 +0800 (CST)
X-Zmail-TransId: 2af967e4cb912ab-3778d
X-Mailer: Zmail v1.0
Message-ID: <20250327115249185_vgGyzfhDZjf43eXFwKqX@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <laurent.pinchart@ideasonboard.com>
Cc: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <linux-kernel@vger.kernel.org>, <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBkcm0vYnJpZGdlOiB0aGM2M2x2ZDEwMjQ6IFVzZSBkZXZfZXJyX3Byb2JlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52R3qlTU062070
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E4CB97.000/4ZNV9g1bjGz8R039

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
v2:
	- reduce a PTR_ERR call since dev_err_probe() will add
	  the error value to the message
 drivers/gpu/drm/bridge/thc63lvd1024.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index bba10cf9b4f9..8f3096fa3dd7 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -188,14 +188,9 @@ static int thc63_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, thc63);

 	thc63->vcc = devm_regulator_get(thc63->dev, "vcc");
-	if (IS_ERR(thc63->vcc)) {
-		if (PTR_ERR(thc63->vcc) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		dev_err(thc63->dev, "Unable to get \"vcc\" supply: %ld\n",
-			PTR_ERR(thc63->vcc));
-		return PTR_ERR(thc63->vcc);
-	}
+	if (IS_ERR(thc63->vcc))
+		return dev_err_probe(thc63->dev, PTR_ERR(thc63->vcc),
+				     "Unable to get \"vcc\" supply\n");

 	ret = thc63_gpio_init(thc63);
 	if (ret)
-- 
2.25.1
