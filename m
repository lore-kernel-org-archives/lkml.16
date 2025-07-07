Received: from smtp105.iad3a.emailsrvr.com (smtp105.iad3a.emailsrvr.com [173.203.187.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB62BD588
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897210; cv=none; b=YqN2jt+rwLZR9XKmqHfPtSoqGZF2s6UKF9YRcrUFVIc01UdeXo/57wrM1+5R4Z903dW71BstV3zTW2pnibhMAtsSJoS9XqSXzPD7JDxLa8fQdcHXzVyGonvKUyegSejFDxkgUCrpVX/3IpcSYfoS5I95FVn//U3QpGCczGenns0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897210; c=relaxed/simple;
	bh=JHkCVKeT8xiLSJmkc3nLiDElL7x78P/9DwQm8Z2ai3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dglv/O5Lm9N0HR0gFRQBVoRqf8mYnDtcll6TAlWXCKOfzHmsw+hUsq0OsogR7uhyYEQ9ExMfEXEp1U2l0kCyXS5pCYm+5qeLf5zJuhqDPJVrX1dhvbCfDmIM1PIMDo8cgS7UGOh9odPYrFwTFn3WAoUUKHtv+vrlw0XLJFHHlbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=kGmV4Niz; arc=none smtp.client-ip=173.203.187.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="kGmV4Niz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1751896667;
	bh=JHkCVKeT8xiLSJmkc3nLiDElL7x78P/9DwQm8Z2ai3c=;
	h=From:To:Subject:Date:From;
	b=kGmV4NizXKuRVCb7ts8mbJmDjhkQtwxz67EayJB1ML9bSzh9LsSDbqgrcYSry+gQQ
	 sbkLe5/yrlWYq74S0B9/s9ZIHJ+sJL9qOQ49GYJGC3dP9FxXGhuUqWHZHbSF1FSx+t
	 dtstMO/kNEqvru+W7sbgcCvn6ULejuQaRLQ+p4QU=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp22.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 70B0D1982;
	Mon,  7 Jul 2025 09:57:46 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	stable@vger.kernel.org
Subject: [PATCH] comedi: das6402: Fix bit shift out of bounds
Date: Mon,  7 Jul 2025 14:57:37 +0100
Message-ID: <20250707135737.77448-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 5066d715-a91c-4619-9ca4-c855c2d9a7dc-1-1

When checking for a supported IRQ number, the following test is used:

	/* IRQs 2,3,5,6,7, 10,11,15 are valid for "enhanced" mode */
	if ((1 << it->options[1]) & 0x8cec) {

However, `it->options[i]` is an unchecked `int` value from userspace, so
the shift amount could be negative or out of bounds.  Fix the test by
requiring `it->options[1]` to be within bounds before proceeding with
the original test.  Valid `it->options[1]` values that select the IRQ
will be in the range [1,15]. The value 0 explicitly disables the use of
interrupts.

Fixes: 79e5e6addbb1 ("staging: comedi: das6402: rewrite broken driver")
Cc: <stable@vger.kernel.org> # 5.13+
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
Patch does not apply cleanly to longterm kernels 5.4.x and 5.10.x.
---
 drivers/comedi/drivers/das6402.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/das6402.c b/drivers/comedi/drivers/das6402.c
index 68f95330de45..7660487e563c 100644
--- a/drivers/comedi/drivers/das6402.c
+++ b/drivers/comedi/drivers/das6402.c
@@ -567,7 +567,8 @@ static int das6402_attach(struct comedi_device *dev,
 	das6402_reset(dev);
 
 	/* IRQs 2,3,5,6,7, 10,11,15 are valid for "enhanced" mode */
-	if ((1 << it->options[1]) & 0x8cec) {
+	if (it->options[1] > 0 && it->options[1] < 16 &&
+	    (1 << it->options[1]) & 0x8cec) {
 		ret = request_irq(it->options[1], das6402_interrupt, 0,
 				  dev->board_name, dev);
 		if (ret == 0) {
-- 
2.47.2

