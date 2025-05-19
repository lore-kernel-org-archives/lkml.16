Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622F124503F;
	Mon, 19 May 2025 06:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636070; cv=none; b=mnl9zNSvn1cXLTyRGJ0YwlJQVQZ0bW3AIjZH3tm1GekPgTeANx51Tx7w5cvLcTa9UWm2IjhpRu1f1Tliw6di5mSzZsS5c5YoydwWQDdBYZNdgxYnL89JbyIoQbxrOppbJL6dCV2p6Vc5gD+2uUBYZfNpw2bgVW+9/VzhZUE8l50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636070; c=relaxed/simple;
	bh=6flp1UUXguSYzp/SnYPLP9qX9DtOoSw+aELD6OUR8bE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oWIB2P9cUMll1MuR+02EZclxAUd0JbygHwLh/IcndvOi/oTebu+T6FdNC9ghE0MSj5aY2dowwVq6GKp0DT7gMyct1qZpPKaopL4+nh55tF2fyuplEfqupVzpW3dxbzZPnxmkHiG302Xly3J6zesYtl6Ws+65tODPbWpQjbeofGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAAnO_ZfzypoXUhPAQ--.10629S2;
	Mon, 19 May 2025 14:27:43 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: epautoconf: Use USB API functions rather than constants
Date: Mon, 19 May 2025 14:25:44 +0800
Message-Id: <20250519062545.724727-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAnO_ZfzypoXUhPAQ--.10629S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWkKry8XFy3AF17uF1Dtrb_yoWfWFX_ua
	yUZ347WwsrWa4qyr4UG3ySkrWI9asaq3WvvF9YgFn8AFW5Ka1UXr18JrWkGFn7uFnF9r9x
	u3sxKa90k3yxZjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfU83kuDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_type() rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\))
+ usb_endpoint_type(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/gadget/epautoconf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
index ed5a92c474e5..30016b805bfd 100644
--- a/drivers/usb/gadget/epautoconf.c
+++ b/drivers/usb/gadget/epautoconf.c
@@ -158,7 +158,7 @@ struct usb_ep *usb_ep_autoconfig(
 	if (!ep)
 		return NULL;
 
-	type = desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK;
+	type = usb_endpoint_type(desc);
 
 	/* report (variable) full speed bulk maxpacket */
 	if (type == USB_ENDPOINT_XFER_BULK) {
-- 
2.25.1

