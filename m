Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05BE1D8E1A;
	Mon, 19 May 2025 06:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635773; cv=none; b=s6iZ6GgLP/bQ0vYK93sJrHEm1CPrrfPQfeeqb0iraYVa06oh4yUMkbyyzfPvmkMlJpRaRwIH0YwqZ/Xtloigzgzln/AY0w+3AfL4EZK4klbmwVVybSX1h7gB4fpqkL3Nnk0ReY7Vuk9T3pmOT8jYJrrIZq3jTQQ/o14xuRZPD/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635773; c=relaxed/simple;
	bh=/tzdqWLhTWdQbSoRsSokYrGnFYp8tWEj7wAb09H5lzo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DPEiAobeGNBZvF8zUR9/JzK4Qjo+Qd74gkO5czN8kzGUs/U73E0f+RRfmMKTVRQsGK/YsaRKogc//IH787WqgFAmbXmf25U2gfTJ8wpgH5JQtZtxRGEILayXiC7JrD2yE7Q8+QbkRtyVFROqLpJDj8/yfzQyBW4CR3+/7w6vgug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACXq_Y3zipo9_pOAQ--.13441S2;
	Mon, 19 May 2025 14:22:47 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: hminas@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: dwc2: gadget: Use USB API functions rather than constants
Date: Mon, 19 May 2025 14:22:29 +0800
Message-Id: <20250519062229.724664-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXq_Y3zipo9_pOAQ--.13441S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWkKry8XFy3AF17uF1Dtrb_yoWfGrg_Ca
	y0vr47Wr1DWa4qkry5t343JrW0k345Xwn7ZFnYqFnxAFWjyw4UXFy8JrWkJrykZFy2kryq
	kay2kFn8Cr4xXjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JU3fHbUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_type() rather than constants.
The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\))
+ usb_endpoint_type(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/dwc2/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index f323fb5597b3..d5b622f78cf3 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4049,7 +4049,7 @@ static int dwc2_hsotg_ep_enable(struct usb_ep *ep,
 		return -EINVAL;
 	}
 
-	ep_type = desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK;
+	ep_type = usb_endpoint_type(desc);
 	mps = usb_endpoint_maxp(desc);
 	mc = usb_endpoint_maxp_mult(desc);
 
-- 
2.25.1

