Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C335617A316
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152650; cv=none; b=XZ/sXrXFwAAHy7ZUwNp9bJH+t3dcpTMiugT1+lW/ijP94E/gxTWgVL82BDEW49700rX292zzOxxJRnRLJMlVCc3NS6vJcWhaRpnIOrTf2ohfBh2BcDHxE4bSJWwPLnDL/P9vy8sTMKHyrNgEE0EYZ4ZJ2MGGJxOon7cT9z8Mkq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152650; c=relaxed/simple;
	bh=Wgqp5CEb0vSe5kauJHqhAOn3abMfSbPpqSVemJyahHk=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=Gm+6hQ2cX25+PuHWPmJ/Lgel5EWfGjYZNsX4lEKbqAG4FS/1jWeChPActkfb628/AHjV7jH/MDu9UTopoSFxE7LtG9/HRk59Lk+dsieZJ2C50UeVO2Bj0lAseLIOYs67f/988Zt+xRdUEhAobkk3NV8tDKSWR+a9+rclwgMpzlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZPF2C57y8z8RV7M;
	Fri, 28 Mar 2025 17:04:03 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 52S93oNj005838;
	Fri, 28 Mar 2025 17:03:50 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 28 Mar 2025 17:03:52 +0800 (CST)
Date: Fri, 28 Mar 2025 17:03:52 +0800 (CST)
X-Zmail-TransId: 2afa67e665f8ffffffffd47-c09a8
X-Mailer: Zmail v1.0
Message-ID: <20250328170352642YrhVMCjGoyA6Y4yYNH-jg@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <vkoul@kernel.org>
Cc: <kishon@kernel.org>, <zhang.enpei@zte.com.cn>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBwaHkvYnJvYWRjb206IHBoeS1iY202M3h4LXVzYmg6IFVzZSBkZXZfZXJyX3Byb2JlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52S93oNj005838
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E66603.004/4ZPF2C57y8z8RV7M

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/phy/broadcom/phy-bcm63xx-usbh.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/broadcom/phy-bcm63xx-usbh.c b/drivers/phy/broadcom/phy-bcm63xx-usbh.c
index 647644de041b..b9e7f750567c 100644
--- a/drivers/phy/broadcom/phy-bcm63xx-usbh.c
+++ b/drivers/phy/broadcom/phy-bcm63xx-usbh.c
@@ -397,11 +397,9 @@ static int __init bcm63xx_usbh_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(usbh->base);

 	usbh->reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(usbh->reset)) {
-		if (PTR_ERR(usbh->reset) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get reset\n");
-		return PTR_ERR(usbh->reset);
-	}
+	if (IS_ERR(usbh->reset))
+		return dev_err_probe(dev, PTR_ERR(usbh->reset),
+				     "failed to get reset\n");

 	usbh->usbh_clk = devm_clk_get_optional(dev, "usbh");
 	if (IS_ERR(usbh->usbh_clk))
-- 
2.25.1
