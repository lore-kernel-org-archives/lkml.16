Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C128F5;
	Wed, 18 Jun 2025 03:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219023; cv=none; b=Zy3K2bSy9Bm/oOkCdZaiQ0lOpGKHms/81d42dadZmdAlQRB2d0OmVUkvayWYagPBm8QOyN9m4VWMiR99sykgx1Guli1+prtR3SCkT9KyazyqFNFlkQBobQVnx8QKHUExHEcvkRZNtBV6jGoxoit7BytKvpC807ugykSPLcAZkwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219023; c=relaxed/simple;
	bh=SztlRYvEq9KkoTnU3UqT175UKB4nWXSpAYJEifPKT8g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NrhjoQ6Im187z+7wLkWZ/hzOzYPZTVa6KD0C27SIkWxdQIxHkeMIQyGs8q6pxRT6yHJxLYXSEMZrX7vtPglV6YPgAdqSjwl38X5Zsbyw0rB5dpNu9BMjmRMqqO4hgJc1Cf61aDHY2GiU3KTVQGI7CH0+W9mXfDj1hHaAaHbG784=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADXJ1D9OFJoNPVGBw--.7843S2;
	Wed, 18 Jun 2025 11:56:45 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	prashanth.k@oss.qualcomm.com,
	jeff.johnson@oss.qualcomm.com,
	Thinh.Nguyen@synopsys.com,
	peter@korsgaard.com,
	snovitoll@gmail.com,
	michal.vrastil@hidglobal.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: composite: Use USB API functions rather than constants
Date: Wed, 18 Jun 2025 11:55:40 +0800
Message-Id: <20250618035540.290411-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADXJ1D9OFJoNPVGBw--.7843S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWfur1UJr4ktr4fCFy7GFg_yoWfAFg_CF
	WjkwsrWrnrWFy5Cw13Aw13Gr4qkwsFq3W0vFnYgF9xAas8XayUXrykXrWkJF12vr10grn8
	C34Iqrn8GF4xJjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26rxl6rkdMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRRID7JUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_num() rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
+ usb_endpoint_num(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/gadget/composite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 8dbc132a505e..12634f0b45a8 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1011,7 +1011,7 @@ static int set_config(struct usb_composite_dev *cdev,
 
 			ep = (struct usb_endpoint_descriptor *)*descriptors;
 			addr = ((ep->bEndpointAddress & 0x80) >> 3)
-			     |  (ep->bEndpointAddress & 0x0f);
+			     |  usb_endpoint_num(ep);
 			set_bit(addr, f->endpoints);
 		}
 
-- 
2.25.1

