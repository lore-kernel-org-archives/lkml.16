Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0304E277803;
	Wed, 18 Jun 2025 07:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230220; cv=none; b=WjCpXEbNgK0OW7qe8oaEZ4iSTufQLNoXaXgB5vRWFns08dmzAbPeaI7mI2Q7oybXTYTILBI/rzeJnSPOeTReCEiw7+MnLjqsUlQuaJQmb1eotvo3O6JPTFcM72Vz2oFHAs61j9FY9p8oY5gj0Ie8rRCb6Rl0u/Q7VkTk1x3NoQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230220; c=relaxed/simple;
	bh=KNDgQL4OEcceUOdBcfDQoy1vs+03Obnc4MluUhbAT4s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M1LK6W8RwQCfKrWH5hSMrcbSgqKztmfRoTyG8zD4diT8EEU8atXewF8duWRAk0LVQh4oENwfc6P/YGpl972Z9rtrD6VBB9CxJoJjRhqdt6KhXleZH+Vqrx0Tq97G4emaSoAda2DowXb1PgmQkTGpZq1Aj0Ww4KbdMzm9sAMS0WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAB3x0+_ZFJomzNPBw--.9452S2;
	Wed, 18 Jun 2025 15:03:27 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	tudor.ambarus@linaro.org,
	viro@zeniv.linux.org.uk,
	m.grzeschik@pengutronix.de,
	david.sands@biamp.com,
	snovitoll@gmail.com,
	peterz@infradead.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: f_fs: Use USB API functions rather than constants
Date: Wed, 18 Jun 2025 15:02:16 +0800
Message-Id: <20250618070216.817034-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3x0+_ZFJomzNPBw--.9452S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWfur1UJr4ktr4fCFy7GFg_yoWDXwb_Ga
	1Ygr4xXr9rW34qkw1UG39Ivr429asxWF4I9F1F9r9Iya4jga9rWr18JrWkAr17Zr1akFn8
	CryaqFn8u3WfujkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_XcC_AcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNVyxDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_num() rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
+ usb_endpoint_num(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 2dea9e42a0f8..67fea7da4652 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -3295,7 +3295,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 	if (ffs_ep->descs[ep_desc_id]) {
 		pr_err("two %sspeed descriptors for EP %d\n",
 			  speed_names[ep_desc_id],
-			  ds->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
+			  usb_endpoint_num(ds));
 		return -EINVAL;
 	}
 	ffs_ep->descs[ep_desc_id] = ds;
-- 
2.25.1

