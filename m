Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E30223DC4;
	Mon, 19 May 2025 06:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635507; cv=none; b=Dn+pAgMe6tpOga2gok8+yP3nce9IYqgSPlQRazrIqChBdyiyJB7M9fAmVNeRQn6T30noUaUbvsdb1LM4zDR83PPbBH3QH4fFWtpwV2oMjVd6OqkzVGoy0dVIjgk50TawwkNoaQfytQim8BfKhixmvWqNoSallFsBZr8e7QacWcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635507; c=relaxed/simple;
	bh=WdK/IunRAu6EOkZjU4kmntcNy4q62UNAiPE7MDyl/SQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T2FEmDcW+0Nd9Z777hnCD+t2JWgKhSaOtbWSpCnjAGGdYwHMek6F6Fu10lU43Rw+GLgPFojG+qTbCw+B2wwGKc2g2f0pZqaZ0egCoNuLTnqIPZHrOiniRes+R07OymzIbZSF8ipxaFGb2qXsdPFjOPvrz4/0o7aAqAioI1A3eJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABHlvEozSpovL9OAQ--.12640S2;
	Mon, 19 May 2025 14:18:16 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	krzysztof.kozlowski@linaro.org,
	snovitoll@gmail.com,
	amardeep.rai@intel.com,
	r.kannappan@intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: core: config: Use USB API functions rather than constants
Date: Mon, 19 May 2025 14:13:17 +0800
Message-Id: <20250519061317.724602-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHlvEozSpovL9OAQ--.12640S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWfur1UJr4ktr4fCFy7GFg_yoWfKrb_Ga
	yj9r4DuF9ruFyIkr1jvw4S9rW0k3WavFn7ZF1Fq3sxAFyjq39rZFWxJFW8J3WxZa4jyFyD
	GFy2krn8u3WxWjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r1q6r43MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUSFAJUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_num() rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
+ usb_endpoint_num(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/core/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 13bd4ec4ea5f..fc0cfd94cbab 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -307,7 +307,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 		goto skip_to_next_endpoint_or_interface_descriptor;
 	}
 
-	i = d->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
+	i = usb_endpoint_num(d);
 	if (i == 0) {
 		dev_notice(ddev, "config %d interface %d altsetting %d has an "
 		    "invalid descriptor for endpoint zero, skipping\n",
-- 
2.25.1

