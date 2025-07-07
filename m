Received: from smtp118.ord1d.emailsrvr.com (smtp118.ord1d.emailsrvr.com [184.106.54.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E4202965
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751890911; cv=none; b=LnUTj4MMbic2XxuDCAmaR2T7gMek51uhxVEV7Fdqlf34lzLEsrbCpbH5COuFoEIGx4baVNNzDXPb5Oyh1dt1IPCsypTf1ZHH67MX08H+qLD/29hPWBLE5IVmcLKRJ8VS3HjuIWzShS956DndjvEa1BcoZvqEZU84zR127GRuGTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751890911; c=relaxed/simple;
	bh=3iScXbxYofXSm0B2ulbFEyNLXMiq9RavLL9F//9h/bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iOV8C9ugXKz+ueCdglV/FQWJh7ogimPya80mqKxikQX/VZGdjEPiq65O4a0N2hyBwTEPZJH3ymUvA3XH/1Awo8bb7Na5jLuyQbK4PtVlp1q9zNt1oDwMTI/jkpH1Xhwkm3anD2frQZa2E1UdrhRWuT9MCkubaYJSSIDeII1TIuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=k2MUdrXk; arc=none smtp.client-ip=184.106.54.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="k2MUdrXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1751890570;
	bh=3iScXbxYofXSm0B2ulbFEyNLXMiq9RavLL9F//9h/bM=;
	h=From:To:Subject:Date:From;
	b=k2MUdrXkaTgLxx0mqUI3GP5k+/3rVhjUPNi8xpchxqYqGtVLeBqAog2d0kqcdWcBm
	 YnJaBdvv/LGpduub8W8gYKiaU8+o4Yk9T84hbj2/VEdCdMYcQBYb0qq8ww5jqU4O13
	 aMkI8GlZm4ARHb73X3CA6cjw2Ixui1nHE0juGBRA=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp7.relay.ord1d.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id C54DF201B3;
	Mon,  7 Jul 2025 08:16:09 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	stable@vger.kernel.org
Subject: [PATCH] comedi: Fix some signed shift left operations
Date: Mon,  7 Jul 2025 13:15:55 +0100
Message-ID: <20250707121555.65424-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: cf8e6bf8-4b84-4e0a-a6ee-31907b6702d4-1-1

Correct some left shifts of the signed integer constant 1 by some
unsigned number less than 32.  Change the constant to 1U to avoid
shifting a 1 into the sign bit.

The corrected functions are comedi_dio_insn_config(),
comedi_dio_update_state(), and __comedi_device_postconfig().

Fixes: e523c6c86232 ("staging: comedi: drivers: introduce comedi_dio_insn_config()")
Fixes: 05e60b13a36b ("staging: comedi: drivers: introduce comedi_dio_update_state()")
Fixes: 09567cb4373e ("staging: comedi: initialize subdevice s->io_bits in postconfig")
Cc: <stable@vger.kernel.org> # 5.13+
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/comedi/drivers.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/comedi/drivers.c b/drivers/comedi/drivers.c
index 376130bfba8a..922fe20738ef 100644
--- a/drivers/comedi/drivers.c
+++ b/drivers/comedi/drivers.c
@@ -339,10 +339,10 @@ int comedi_dio_insn_config(struct comedi_device *dev,
 			   unsigned int *data,
 			   unsigned int mask)
 {
-	unsigned int chan_mask = 1 << CR_CHAN(insn->chanspec);
+	unsigned int chan = CR_CHAN(insn->chanspec);
 
-	if (!mask)
-		mask = chan_mask;
+	if (!mask && chan < 32)
+		mask = 1U << chan;
 
 	switch (data[0]) {
 	case INSN_CONFIG_DIO_INPUT:
@@ -382,7 +382,7 @@ EXPORT_SYMBOL_GPL(comedi_dio_insn_config);
 unsigned int comedi_dio_update_state(struct comedi_subdevice *s,
 				     unsigned int *data)
 {
-	unsigned int chanmask = (s->n_chan < 32) ? ((1 << s->n_chan) - 1)
+	unsigned int chanmask = (s->n_chan < 32) ? ((1U << s->n_chan) - 1)
 						 : 0xffffffff;
 	unsigned int mask = data[0] & chanmask;
 	unsigned int bits = data[1];
@@ -625,8 +625,8 @@ static int insn_rw_emulate_bits(struct comedi_device *dev,
 	if (insn->insn == INSN_WRITE) {
 		if (!(s->subdev_flags & SDF_WRITABLE))
 			return -EINVAL;
-		_data[0] = 1 << (chan - base_chan);		    /* mask */
-		_data[1] = data[0] ? (1 << (chan - base_chan)) : 0; /* bits */
+		_data[0] = 1U << (chan - base_chan);		     /* mask */
+		_data[1] = data[0] ? (1U << (chan - base_chan)) : 0; /* bits */
 	}
 
 	ret = s->insn_bits(dev, s, &_insn, _data);
@@ -709,7 +709,7 @@ static int __comedi_device_postconfig(struct comedi_device *dev)
 
 		if (s->type == COMEDI_SUBD_DO) {
 			if (s->n_chan < 32)
-				s->io_bits = (1 << s->n_chan) - 1;
+				s->io_bits = (1U << s->n_chan) - 1;
 			else
 				s->io_bits = 0xffffffff;
 		}
-- 
2.47.2

