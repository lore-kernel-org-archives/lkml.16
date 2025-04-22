Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A277DA6D;
	Tue, 22 Apr 2025 07:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307484; cv=none; b=T5oSN0y36ZgJheK4x2bKHkUMhHwHUNMXnq8f3B7DGAd+0xRlfbI6mxejZbG5XPGOkvsfLukGFcSFPNNmhkvoxhdLPpJAQR8jaSWWPgXDyccgZtE50Ypez7B+CrRDc1tlaNWi3tFv1yw2m3hMpyhV4II+uct2RqYJimFl+AQMxaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307484; c=relaxed/simple;
	bh=6sgOfaHquz9KChHYPaMICP9c8L4Jj9Z/lr5QEoP2C2g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gkc9dqrtGlfP6yuZ6nGTHtuz4VYAvLhqAkxg4xSlk72EZzuJ6i0JDifBHvzwPIbBca1HudRaNUsQmYHIJSuddN5Zp/0aEME9/Lfq6Os/TWxykJTxC3wwoEOUEhsFclKRJovhxov4I5O9OZX8eCtNYxHh4FmAf9vlF3GBxmg9Ghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADHcT5RRwdoHk4WCw--.50807S2;
	Tue, 22 Apr 2025 15:37:54 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	u.kleine-koenig@baylibre.com,
	guoren@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: remove unnecessary NULL check before phy_exit()
Date: Tue, 22 Apr 2025 15:37:14 +0800
Message-Id: <20250422073714.1334380-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHcT5RRwdoHk4WCw--.50807S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18ZF4DKw47JryUJw1UZFb_yoWDCFb_Cw
	1rWr1DGry2gas0gw17Xw4akrW2vayvq3WIvFs0k3ySqryIgr48XFn09F4kAw4DuFyDCFs8
	Aws2yFnFvr1xXjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUbxhL5UUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

phy_exit() checks for NULL pointers internally.
Remove unneeded NULL check here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 89b304cf6d03..3e4d56457597 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2397,8 +2397,7 @@ static int renesas_usb3_stop(struct usb_gadget *gadget)
 		rzv2m_usb3drd_reset(usb3_to_dev(usb3)->parent, false);
 
 	renesas_usb3_stop_controller(usb3);
-	if (usb3->phy)
-		phy_exit(usb3->phy);
+	phy_exit(usb3->phy);
 
 	pm_runtime_put(usb3_to_dev(usb3));
 
@@ -2984,8 +2983,7 @@ static int renesas_usb3_suspend(struct device *dev)
 		return 0;
 
 	renesas_usb3_stop_controller(usb3);
-	if (usb3->phy)
-		phy_exit(usb3->phy);
+	phy_exit(usb3->phy);
 	pm_runtime_put(dev);
 
 	return 0;
-- 
2.25.1

