Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8A22472AC;
	Mon, 19 May 2025 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636380; cv=none; b=jkynJEsqyHkUtZ0T6AmHptU7QvAPrQ6lCdXp4gLAmPYzOVU1nb3lMRzIJhkDgkoHmu8FRvD1OGRqnOy3xI0W5EbneQRuPPl2j+bHpE6ReqDsu18qml9bE3dJi5sWvrwNfBCSRKAgG/TpaBhZyWDaCNouppaxUxmKH9msiZj4PMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636380; c=relaxed/simple;
	bh=qKnTI+8ooBcc0qEgjndBra4NDNbSRuwpwtL+t3T29pw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CDd/pnB8a52hyiAPzttPRLbRT2KogqNhYeuTJm9SDRwmbdACbU2ipbeODxRi6vzkdVXc8YRgwaO8IOSH6o+UxDxjlinH/4kdKRzzcr9gk1/z+OuCDwTWDKAXbFU4jcwHavq9K91OyQSaogOcQO6jAx/776Xt/eezPMQSy7WFCSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABXavWO0Cpo9YxPAQ--.11520S2;
	Mon, 19 May 2025 14:32:46 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	liyuesong@vivo.com,
	u.kleine-koenig@baylibre.com
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: lpc32xx_udc: Use USB API functions rather than constants
Date: Mon, 19 May 2025 14:31:20 +0800
Message-Id: <20250519063120.724793-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXavWO0Cpo9YxPAQ--.11520S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWkKry8XFy3AF17uF1Dtrb_yoWfCFgEkw
	48ur13Ww17Xay5Cr1xG343JrWI9an5X3WDuFn5K3s0yFW3KF4UXrWUJrZ5JF47ZrW2gF9r
	C3yqy3yYyF4SqjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUtVW8ZwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfU5UDGDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_type() rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\))
+ usb_endpoint_type(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 89d6daf2bda7..1a7d3c4f652f 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -1629,7 +1629,7 @@ static int lpc32xx_ep_enable(struct usb_ep *_ep,
 		return -ESHUTDOWN;
 	}
 
-	tmp = desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK;
+	tmp = usb_endpoint_type(desc);
 	switch (tmp) {
 	case USB_ENDPOINT_XFER_CONTROL:
 		return -EINVAL;
-- 
2.25.1

