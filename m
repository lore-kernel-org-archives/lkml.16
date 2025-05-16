Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768CC21C9ED;
	Fri, 16 May 2025 07:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747379223; cv=none; b=WOmqYRjyf7MUrakGmca13Pr/izUDPQitB3A9pRro0ONRP5PrZ3YxAFVMT4okE+KTGmXfRtF3sSGbrjGuHa0PttJhjxK9DnomVgURPM0Sy7HHfmFFW/3YHkj8CQotW01p1YYwFBA3+Zul7uPPh3FiaZ7nnUyclp/MichDbfEdOwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747379223; c=relaxed/simple;
	bh=gi4OINKpVpBeeEdHJ6OG1fFkBMzpHsys3YXOaC0Jbkg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SanjFdiIDZcCrRVeelLISI8HAtF7qCd6f7b9bLWffTie3wCuoZWBq3VpIpEFi+GyYe7FAIeyp4k/IemAGvsn2vzz8q4vbjeM5LD2z3eLbHjwnwsFLfPlkCsixerNSsIMaf1go9ApJVh8mDPkgK7/VfWBEIYFF3+veuUculDcQXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAC3YT4L5CZoUPZUFg--.3762S2;
	Fri, 16 May 2025 15:06:51 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ALSA: scarlett2: Use USB API functions rather than constants
Date: Fri, 16 May 2025 15:04:16 +0800
Message-Id: <20250516070416.12458-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3YT4L5CZoUPZUFg--.3762S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWfur1UJr4ktr4fGr1Utrb_yoWDtFc_Xa
	yI9w4Dur4qgr1qk345Aw4fJF40kwnrX3WFvF4fK39IyFyjqa95Aw42qr4kCrn7uF40yryD
	GryDtr98KFyIkjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUhqXdUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_num() rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
+ usb_endpoint_num(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/usb/mixer_scarlett2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 288d22e6a0b2..93589e86828a 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -8574,8 +8574,7 @@ static int scarlett2_find_fc_interface(struct usb_device *dev,
 
 		epd = get_endpoint(intf->altsetting, 0);
 		private->bInterfaceNumber = desc->bInterfaceNumber;
-		private->bEndpointAddress = epd->bEndpointAddress &
-			USB_ENDPOINT_NUMBER_MASK;
+		private->bEndpointAddress = usb_endpoint_num(epd);
 		private->wMaxPacketSize = le16_to_cpu(epd->wMaxPacketSize);
 		private->bInterval = epd->bInterval;
 		return 0;
-- 
2.25.1

