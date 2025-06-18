Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A3F1E1A31;
	Wed, 18 Jun 2025 04:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219342; cv=none; b=kvnx+xz+nIr7AqgTncufwYFdTe3saFf8QN9D8sttygdHjuxYmBqX1gSH/9ePDcVoslrgQ9A2psk8ljDLitzy90aZw9t1CPL4cRXCRJo46OM6EVp/hGssG0W9nB5rYuy6yEmhGUy7L3eN4eTQFBNjmYC8SYFQT1bEqFktnNc59lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219342; c=relaxed/simple;
	bh=05EXcbFYLG2Wgp/JcD0NVN5E9nbDA0fGnkmCL20Wmig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c/bYxZmAy/mKFBQBA9HZcG8QxqnsFNKF1HryhMNF9N2vSTGZ6AT+7UdEFSjo6V5chqyIYIyQCdPbA3oOpeViQyTg6Bzp1eZK1vhQx04Dq3zjweSSQWfI1Cx0pfR2fcxHbY1vcYUOdbVaky3EVFzi/Ts5JsA83Sp1koDzWL8IIAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACH2FBJOlJoNTNHBw--.33992S2;
	Wed, 18 Jun 2025 12:02:18 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	viro@zeniv.linux.org.uk
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: net2280: Use USB API functions rather than constants
Date: Wed, 18 Jun 2025 12:02:04 +0800
Message-Id: <20250618040204.363383-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACH2FBJOlJoNTNHBw--.33992S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF43KFyxJw47CF45Ww17Jrb_yoW8Zr4fpF
	n3GayUtrZ8ArWfJF1rAw4DZryfGayqy34UtFy2934avF1fWwn3tryxGr1rtr4DCFy3Aay5
	tFsIywsFqF47CrDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26rxl6rkdMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7sRELvKUUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_num() and usb_endpoint_type()
rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
+ usb_endpoint_num(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\))
+ usb_endpoint_type(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/gadget/udc/net2280.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index b2903e4bbf54..8ea1adc7461d 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -203,13 +203,13 @@ net2280_enable(struct usb_ep *_ep, const struct usb_endpoint_descriptor *desc)
 	}
 
 	/* erratum 0119 workaround ties up an endpoint number */
-	if ((desc->bEndpointAddress & 0x0f) == EP_DONTUSE) {
+	if (usb_endpoint_num(desc) == EP_DONTUSE) {
 		ret = -EDOM;
 		goto print_err;
 	}
 
 	if (dev->quirks & PLX_PCIE) {
-		if ((desc->bEndpointAddress & 0x0f) >= 0x0c) {
+		if (usb_endpoint_num(desc) >= 0x0c) {
 			ret = -EDOM;
 			goto print_err;
 		}
@@ -255,7 +255,7 @@ net2280_enable(struct usb_ep *_ep, const struct usb_endpoint_descriptor *desc)
 		else
 			tmp &= ~USB3380_EP_CFG_MASK_OUT;
 	}
-	type = (desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK);
+	type = usb_endpoint_type(desc);
 	if (type == USB_ENDPOINT_XFER_INT) {
 		/* erratum 0105 workaround prevents hs NYET */
 		if (dev->chiprev == 0100 &&
@@ -1334,7 +1334,7 @@ net2280_set_halt_and_wedge(struct usb_ep *_ep, int value, int wedged)
 		retval = -ESHUTDOWN;
 		goto print_err;
 	}
-	if (ep->desc /* not ep0 */ && (ep->desc->bmAttributes & 0x03)
+	if (ep->desc /* not ep0 */ && usb_endpoint_type(ep->desc)
 						== USB_ENDPOINT_XFER_ISOC) {
 		retval = -EINVAL;
 		goto print_err;
-- 
2.25.1

