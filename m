Received: from smtp72.iad3b.emailsrvr.com (smtp72.iad3b.emailsrvr.com [146.20.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8D329C346
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895702; cv=none; b=VacjoCkTnmd5fRjXA+C7joIMQIX3d1VS2BQz4w9dlH2qti+XZqxq3XpbUC9sUjnyiURMrCgcAjFUXdmIXuiTzEY+ekP0uVoaBV1izhaA8cKMWymJTiq7N7nHWaBW/ngZqLFkEb6IdKgi1t5nmY13xB826ZmezlYQ0u0g6u7f2b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895702; c=relaxed/simple;
	bh=F6TLP7RxSLc86v4OJcnDbSakXy8hmn4QJph5g43BHPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qZbB3NBU7khZU/Cul0aMHEBnr/gsrfo0OmO/Xw13IobWYZiaueDtJOA6cTjBOSdyWsUxSxrFcYRLT/xFS9RFCcFevP7K3HoqxfFU1Otg1xGUUW+3roFDOVL/MTVMSZiMHeFF+zZo5ObjEW661dn23MEGB5duEd+MIyF0MAyFzVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=HeYnO4Dm; arc=none smtp.client-ip=146.20.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="HeYnO4Dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1751895279;
	bh=F6TLP7RxSLc86v4OJcnDbSakXy8hmn4QJph5g43BHPY=;
	h=From:To:Subject:Date:From;
	b=HeYnO4Dm8Xhd+Bbh2iV34+oBhCqFY7iPzGPb0/ucHQoNVAAaXyxYYOJVmeAzXS/ih
	 vTT4TX2T5gElT0fbOouzTBgKv2xCMEcSkSv2e289FFQh6PiqtlTE/nRumK+WX/nNu2
	 xcwusHP1gmY1YCAoYvE3vvtHU9cxeNnvyb1kL75I=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp18.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 11B5AE021F;
	Mon,  7 Jul 2025 09:34:38 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	syzbot+32de323b0addb9e114ff@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] comedi: pcl812: Fix bit shift out of bounds
Date: Mon,  7 Jul 2025 14:34:29 +0100
Message-ID: <20250707133429.73202-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 1e8ffcc9-0a2f-41b8-877b-4512870c96d1-1-1

When checking for a supported IRQ number, the following test is used:

	if ((1 << it->options[1]) & board->irq_bits) {

However, `it->options[i]` is an unchecked `int` value from userspace, so
the shift amount could be negative or out of bounds.  Fix the test by
requiring `it->options[1]` to be within bounds before proceeding with
the original test.  Valid `it->options[1]` values that select the IRQ
will be in the range [1,15]. The value 0 explicitly disables the use of
interrupts.

Reported-by: syzbot+32de323b0addb9e114ff@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=32de323b0addb9e114ff
Fixes: fcdb427bc7cf ("Staging: comedi: add pcl821 driver")
Cc: <stable@vger.kernel.org> # 5.13+
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
Patch does not apply cleanly to longterm kernels 5.4.x and 5.10.x.
---
 drivers/comedi/drivers/pcl812.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/pcl812.c b/drivers/comedi/drivers/pcl812.c
index 0df639c6a595..abca61a72cf7 100644
--- a/drivers/comedi/drivers/pcl812.c
+++ b/drivers/comedi/drivers/pcl812.c
@@ -1149,7 +1149,8 @@ static int pcl812_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 		if (IS_ERR(dev->pacer))
 			return PTR_ERR(dev->pacer);
 
-		if ((1 << it->options[1]) & board->irq_bits) {
+		if (it->options[1] > 0 && it->options[1] < 16 &&
+		    (1 << it->options[1]) & board->irq_bits) {
 			ret = request_irq(it->options[1], pcl812_interrupt, 0,
 					  dev->board_name, dev);
 			if (ret == 0)
-- 
2.47.2

