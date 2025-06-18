Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3981EB182;
	Wed, 18 Jun 2025 04:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219991; cv=none; b=eZ/pQGcOqB7k3hiSCCZm6SJbQLl4Rjp62BWqcFwJTNwdv87/6wcfeFZpaDs6Ie0qpEJ8PbSlQB/U54Tuovi4kv3uT+qvR/u/DqEXCAnguI79agjHc/CJMupDwrFrQsUHqdU6y82twT99AWER9Z/EYhIsVp+hum8h2U8LCMcXiuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219991; c=relaxed/simple;
	bh=wLvjh3pCu9KQGwBHwTutcFY0aeOTXXdLuEBCPSdOpTc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dRR0TKfr0Vm5ViRlgltiZcGx9Su4NYNr4y6gnDaV1b4zgNR5d9Iq/9NIEjVQylNe1e67fA/dKOCh4/NKaZyYX+c33y0FB4js1hFtZyF196UdUXq7WcDXbNkr1xq5H2PkwKOs4yBFNbxu+aS5xF8TR2AxgCJ/dNB0J9Ohd+Kw4Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACH2FDLPFJooa5HBw--.34075S2;
	Wed, 18 Jun 2025 12:12:59 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	michal.simek@amd.com,
	u.kleine-koenig@baylibre.com,
	liqiong@nfschina.com,
	colin.i.king@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: udc-xilinx: Use USB API functions rather than constants
Date: Wed, 18 Jun 2025 12:12:22 +0800
Message-Id: <20250618041222.408372-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACH2FDLPFJooa5HBw--.34075S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF43KFyxJw47Cw13Kr4Uurg_yoW8Jw48pF
	n7Gay8GrWvy3yUX3W5AF1DZFyrGa9F934qyFy2g3yavF1Sqws3tFWrJr1fKrnrCFW3Aa13
	trs8t3ZFqFW7CrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_GcC_XcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjTRiOz3UUUUU
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
 drivers/usb/gadget/udc/udc-xilinx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index fa94cc065274..8d803a612bb1 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -813,10 +813,10 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
 
 	ep->is_in = ((desc->bEndpointAddress & USB_DIR_IN) != 0);
 	/* Bit 3...0:endpoint number */
-	ep->epnumber = (desc->bEndpointAddress & 0x0f);
+	ep->epnumber = usb_endpoint_num(desc);
 	ep->desc = desc;
 	ep->ep_usb.desc = desc;
-	tmp = desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK;
+	tmp = usb_endpoint_type(desc);
 	ep->ep_usb.maxpacket = maxpacket = le16_to_cpu(desc->wMaxPacketSize);
 
 	switch (tmp) {
-- 
2.25.1

