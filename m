Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AED617BA3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152844; cv=none; b=gZ4dVliBLnbLhTw8WRPrWCxh73p4fSAXg8zKE+YFD0rHLdNgeQHEYs5dmw8ffdBWbGoqi7bmVgQ40pE6vhCLu84LrMa4kl58O8udtkiLXrQgyZhXf00DpI5Ry8v0Oj3q4lAkfrojS6kArTdN5eElpMkaNoBD5+VnRqCI2ZhEyds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152844; c=relaxed/simple;
	bh=c8ZgsyTb6U2OdVYTDjEyr+OpddFQF6vqVDDg/z1d2j0=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=E11dZw1Ryh3Q0OH2mKDXUDENeyfPUXD14CDvomVXtprxaJBGJ0rjh2xeucbEljLPWG1BnBh8GRBDY1eDSx7CiKf0OA0Xn6bki2KUEGSslPh7TbmcOMycoGBy87uzLUxDBcpw2JEBhAewKu9bi+3PztKiilKZUGv76jyXG5fNG1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZPF5z44Hsz5B1J4;
	Fri, 28 Mar 2025 17:07:19 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 52S972DG013128;
	Fri, 28 Mar 2025 17:07:03 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 28 Mar 2025 17:07:05 +0800 (CST)
Date: Fri, 28 Mar 2025 17:07:05 +0800 (CST)
X-Zmail-TransId: 2afc67e666b9ffffffffbd4-c782e
X-Mailer: Zmail v1.0
Message-ID: <20250328170705401AXCIsIhOYGoIu8LDn_lj6@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <fnkl.kernel@gmail.com>
Cc: <j@jannau.net>, <dri-devel@lists.freedesktop.org>, <asahi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm06IGFkcDogVXNlIGRldmljZV9tYXRjaF9vZl9ub2RlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52S972DG013128
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E666C7.00A/4ZPF5z44Hsz5B1J4

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Replace the open-code with device_match_of_node().

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/adp/adp_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index c98c647f981d..0abb56ce2c34 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -553,7 +553,7 @@ static const struct component_master_ops adp_master_ops = {

 static int compare_dev(struct device *dev, void *data)
 {
-	return dev->of_node == data;
+	return device_match_of_node(dev, data);
 }

 static int adp_probe(struct platform_device *pdev)
-- 
2.25.1
