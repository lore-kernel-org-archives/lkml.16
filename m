Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1731E0DFE;
	Wed, 18 Jun 2025 04:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219771; cv=none; b=H3Bj556levA+ajcuUkpXTDdb42y2KohYbI/OOGl7wH1K78QECoW22jcC3UJA+gIqojrxembChVGQKmSRMS3VRla1TBt/dUsDSW5ydPDapUcJ3ZT0RYkUFXw2JjteDx4QWvb46+rV8qwM/n2UavFa1CU/fsJvWIpyrOZuh0S8vk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219771; c=relaxed/simple;
	bh=XGXyQipLSI3HWelm0GjXm8r9d5GScQ/BlKqOzWAR8I4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LnOFepqI4mWom2NCzE5XYneMsZj5eRu3ONKf3pSshd9Bhc9l/+Q0JD3fnoDUyPnduFGNZyOci7RmEytdSNzhwRRuYnyEoHh37Ka0deY/2w/MCYwt2w+bAEOB07DzNmxJFQYw8mainK2vdMTC0xb7Qw5edH3nPqrWzLvfH1vn2Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADn_FT2O1JoYYdHBw--.8219S2;
	Wed, 18 Jun 2025 12:09:26 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: pch_udc: Use USB API functions rather than constants
Date: Wed, 18 Jun 2025 12:09:08 +0800
Message-Id: <20250618040908.408309-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADn_FT2O1JoYYdHBw--.8219S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWkKry8XFy3AF17uF1Dtrb_yoWDtrc_C3
	yUWrW3Kw17XayUGr4xC3yfJrW29asYqwna9F1vqasxAa45KayUXr1UJr4DAa1xZrW7ZFnr
	CwsrtF98tF4IvjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_GcC_XcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjTRZNVkUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_type() rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\))
+ usb_endpoint_type(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/gadget/udc/pch_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 169f72665739..0b20ecbe64f9 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -988,7 +988,7 @@ static void pch_udc_ep_enable(struct pch_udc_ep *ep,
 	pch_udc_ep_fifo_flush(ep, ep->in);
 	/* Configure the endpoint */
 	val = ep->num << UDC_CSR_NE_NUM_SHIFT | ep->in << UDC_CSR_NE_DIR_SHIFT |
-	      ((desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) <<
+	      (usb_endpoint_type(desc) <<
 		UDC_CSR_NE_TYPE_SHIFT) |
 	      (cfg->cur_cfg << UDC_CSR_NE_CFG_SHIFT) |
 	      (cfg->cur_intf << UDC_CSR_NE_INTF_SHIFT) |
-- 
2.25.1

