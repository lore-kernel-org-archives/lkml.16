Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396492580E2;
	Wed, 18 Jun 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750229941; cv=none; b=KS7pdj1TO49NwbkppDKymRuksu81Tlfv8BV3VUn96tKrMH1CRZp1zF+xExoMhRZN2iyWmLMOZRsXxVXu9WqDj28HzcWZcw8rSMU6YyTnf8sTMPn65CxQKqAMSSoATB0/zWRn0Vf68QFdxLsrN/UHl4hZbYwBBloJaBEQ2Hvea9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750229941; c=relaxed/simple;
	bh=IS3ru+vNwBgK+M8mK5PWXxjzJhZFwPdsPyIU69tQh0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A3dFkHO3UWIfqZBxPxVDa/grzGMX4pa5M9XuZMmbFd6kfgUJwNIuh0bstcur31UhxEuSDk/CACEw4p97e/ui0sQdegypi7ium+jKiEL26P98u9N6QnX7dUoTPCeuRaPLmuFPgXvah8eVJuZLYmm5EOgbA8NohBzR0j8EvUR/0YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAC3CFGkY1JoUgpPBw--.9351S2;
	Wed, 18 Jun 2025 14:58:44 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	stern@rowland.harvard.edu,
	andreyknvl@gmail.com,
	sylv@sylv.io,
	u.kleine-koenig@baylibre.com,
	yanzhen@vivo.com,
	namcao@linutronix.de,
	krzysztof.kozlowski@linaro.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: dummy_hcd: Use USB API functions rather than constants
Date: Wed, 18 Jun 2025 14:57:50 +0800
Message-Id: <20250618065750.816965-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3CFGkY1JoUgpPBw--.9351S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWfur1UJr4ktr4fCFy7GFg_yoWDAwb_ua
	1Y9rsxWrnrWw12kr1jyw13Zry09wnrXwn3ZFnYqF9xAFWjga95ZF47JrZ5Cw47ZF17KF98
	C3srKwn8G3WSqjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVWYoVW2owAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRz6wAUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_num() rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
+ usb_endpoint_num(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 27c9699365ab..21dbfb0b3bac 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -623,7 +623,7 @@ static int dummy_enable(struct usb_ep *_ep,
 
 	dev_dbg(udc_dev(dum), "enabled %s (ep%d%s-%s) maxpacket %d stream %s\n",
 		_ep->name,
-		desc->bEndpointAddress & 0x0f,
+		usb_endpoint_num(desc),
 		(desc->bEndpointAddress & USB_DIR_IN) ? "in" : "out",
 		usb_ep_type_string(usb_endpoint_type(desc)),
 		max, str_enabled_disabled(ep->stream_en));
-- 
2.25.1

