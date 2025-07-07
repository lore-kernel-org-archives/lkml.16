Received: from smtp112.iad3b.emailsrvr.com (smtp112.iad3b.emailsrvr.com [146.20.161.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1562951D0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751896319; cv=none; b=ADgbiSUy+F7pTFdV87saViTYXDCR5b6astB5rKlXwgtdCfRpfcQ2nxzFedagewKLOu6DLaRQIQff4SpihVgzG2GI7dTNT8WJJBmizK7yen6pBvLio9zTEvwFPrdZCJZeCf4tbzH+HSyN3cZDiOjdP6s4IOfQzez9b8swXHDQLBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751896319; c=relaxed/simple;
	bh=kQUEkoO0e3HKWclSzP5sW8URv+gkDAlxxdhOQOzAwYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIVSEtS7SReB/0KazA2QQkQapcDCZZWccxVsnZHe1U2eABmxXoWAefd/QtyMrhu7IKgXlNhrdaJpSqqhu+KiLLwnwJaCP6nUmHBbzVg56Lyyp1lyxOGBuJgBprWELVM2sAWzmyyzljtJNUovNlkjWGdrQg0yl6uk/VvQZhC8Sho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=yxvvacCK; arc=none smtp.client-ip=146.20.161.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="yxvvacCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1751895996;
	bh=kQUEkoO0e3HKWclSzP5sW8URv+gkDAlxxdhOQOzAwYM=;
	h=From:To:Subject:Date:From;
	b=yxvvacCKNbKEA8pH0T8wtpaQTGv9iSUhUU4QYh3s2FosU4h/Qo6G8AY76dbiCugK/
	 bhQxPFkLngexJhEp4DbDWrb4edGhutM1uSCpg9sz51KmgzWSUcFcdP7NbbSH/Z1K44
	 0LOOb4MqknzTImh/FSDLZlu/r2vHa2V/Vl04I3So=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp23.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 70136A01EF;
	Mon,  7 Jul 2025 09:46:35 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	stable@vger.kernel.org
Subject: [PATCH] comedi: aio_iiro_16: Fix bit shift out of bounds
Date: Mon,  7 Jul 2025 14:46:22 +0100
Message-ID: <20250707134622.75403-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 70b25bd4-aed2-4281-9999-a00560739e81-1-1

When checking for a supported IRQ number, the following test is used:

	if ((1 << it->options[1]) & 0xdcfc) {

However, `it->options[i]` is an unchecked `int` value from userspace, so
the shift amount could be negative or out of bounds.  Fix the test by
requiring `it->options[1]` to be within bounds before proceeding with
the original test.  Valid `it->options[1]` values that select the IRQ
will be in the range [1,15]. The value 0 explicitly disables the use of
interrupts.

Fixes: ad7a370c8be4 ("staging: comedi: aio_iiro_16: add command support for change of state detection")
Cc: <stable@vger.kernel.org> # 5.13+
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
Patch does not apply cleanly to longterm kernels 5.4.x and 5.10.x.
---
 drivers/comedi/drivers/aio_iiro_16.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/aio_iiro_16.c b/drivers/comedi/drivers/aio_iiro_16.c
index b00fab0b89d4..739cc4db52ac 100644
--- a/drivers/comedi/drivers/aio_iiro_16.c
+++ b/drivers/comedi/drivers/aio_iiro_16.c
@@ -177,7 +177,8 @@ static int aio_iiro_16_attach(struct comedi_device *dev,
 	 * Digital input change of state interrupts are optionally supported
 	 * using IRQ 2-7, 10-12, 14, or 15.
 	 */
-	if ((1 << it->options[1]) & 0xdcfc) {
+	if (it->options[1] > 0 && it->options[1] < 16 &&
+	    (1 << it->options[1]) & 0xdcfc) {
 		ret = request_irq(it->options[1], aio_iiro_16_cos, 0,
 				  dev->board_name, dev);
 		if (ret == 0)
-- 
2.47.2

