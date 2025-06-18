Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F95277CB8;
	Wed, 18 Jun 2025 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230499; cv=none; b=SwW9ZOa3eQsh8z5Ag8I5CgLFQTtwnEpUTRecRYNd5SEpvSIrnNpEleqk/tiX6UUixrfbqdLDz9ys5RA/Duy9f7tuad96lnVKApGuOsfdlFwNluCrx56bMW26ko2ZV7WT5NWxzyNt9KgGMJH0JWxrL2jX4aPbmHTTACmc2+HTDfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230499; c=relaxed/simple;
	bh=o5QQSAfAdXW8i8puQ8G/ITt2bMNgriuyCE0HZH+Rqlg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aX3B186r+aQJAfbx6Zud2a6XPDj65oJpY4lk+g7NFdgez12vxQD23F3sJVpDn1EV+G/kk6pEd0u2TSWifHM7LJCiKI26Ibu9ygJ8xZd6E1amPrSz7oM59HUCXLJ5r/34/8n1uDxxWRjuXK7YQnwJffkw0Ia7JcYj81v+bDy4osA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAB3x0_ZZVJoQ1lPBw--.9486S2;
	Wed, 18 Jun 2025 15:08:09 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	u.kleine-koenig@baylibre.com,
	mingo@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: m66592-udc: Use USB API functions rather than constants
Date: Wed, 18 Jun 2025 15:07:14 +0800
Message-Id: <20250618070714.817146-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3x0_ZZVJoQ1lPBw--.9486S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF43KFyxJw47Cr17Ar4fXwb_yoW8CFWxpa
	n5JaykXrWjyrWUCa98JFn8ZFy5Ca90vryUCa4aga4a9F13tw4SqF1UAw1rKrWDCFWfZan0
	qw1Yyan2qanxGrUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26rkl6F8dMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7sREEfO5UUUUU==
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
 drivers/usb/gadget/udc/m66592-udc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index 715791737499..54885175b8a4 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -359,7 +359,7 @@ static void m66592_ep_setting(struct m66592 *m66592, struct m66592_ep *ep,
 	ep->pipenum = pipenum;
 	ep->ep.maxpacket = usb_endpoint_maxp(desc);
 	m66592->pipenum2ep[pipenum] = ep;
-	m66592->epaddr2ep[desc->bEndpointAddress&USB_ENDPOINT_NUMBER_MASK] = ep;
+	m66592->epaddr2ep[usb_endpoint_num(desc)] = ep;
 	INIT_LIST_HEAD(&ep->queue);
 }
 
@@ -391,7 +391,7 @@ static int alloc_pipe_config(struct m66592_ep *ep,
 
 	BUG_ON(ep->pipenum);
 
-	switch (desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) {
+	switch (usb_endpoint_type(desc)) {
 	case USB_ENDPOINT_XFER_BULK:
 		if (m66592->bulk >= M66592_MAX_NUM_BULK) {
 			if (m66592->isochronous >= M66592_MAX_NUM_ISOC) {
@@ -433,7 +433,7 @@ static int alloc_pipe_config(struct m66592_ep *ep,
 	}
 	ep->type = info.type;
 
-	info.epnum = desc->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
+	info.epnum = usb_endpoint_num(desc);
 	info.maxpacket = usb_endpoint_maxp(desc);
 	info.interval = desc->bInterval;
 	if (desc->bEndpointAddress & USB_ENDPOINT_DIR_MASK)
-- 
2.25.1

