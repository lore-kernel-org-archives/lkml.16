Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F78628F5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 02:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751768159; cv=none; b=NYJUn88PMAHnJ2gerkLChLmARwZSw27X/HtPfGuePRtspfTsQFLI55Y8S/ydlj2aUTvrkf9Ma4b7wMAAy12Ta/Ou/ljI7YIK0B7Y+dg3FiGWuZe/U474V6BpVRU7uX0/brskNXO6gAnTyC8Z6i3rVYjH7z4eB2AklBYSRDcIeTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751768159; c=relaxed/simple;
	bh=0hOd5w6qUU/xWgPPo7blf3Vdr6C+GYp1WvB2Mif01Ng=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=f4EBXi+ClcvN85Nh584xNKAEOUofLitVPezLxCtalp2rYkSx5SRNxdzZQBy3mz6PDHEnVawsn0TbcvTquBOehrxWvXGVN4afdHgQrPlR1cygXWepMVYm/qno8bHNHaFh2hsAWnYInkkogoTc3SIAkTAnh9A72LDzOu+c7X2XzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=oh7QSgh5; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="oh7QSgh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1751767837; bh=dGbmNL/NX0SCUbLxNQkJPjpd3jiYOrIue8mSZNgCADU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oh7QSgh5rmvsY1t1v9BWfF/1G+C4WwSreQw+5hPPcoT0C7RXxFAgMqUkvNk9mnU9P
	 RIe9FpDYLeR7ywaLNwbw9F7cDC9mLZifTLjAhJRdKUKfjsEJWBIY+VF1nDu2zMCKTY
	 9p+aBjsNThEdEfwsg8nQI1FtXgi8SQKrRvBvNruI=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 2A3B9498; Sun, 06 Jul 2025 10:10:35 +0800
X-QQ-mid: xmsmtpt1751767835ta572bduy
Message-ID: <tencent_AAF2ED2ACD1879CE6C5C2C296C349724EA0A@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznxXceUNw71hA/4zH0a7tmTh+Id3P67R/cVAsa7sC62TbF03/5Sa
	 HwEJ/icgi7yYH3y+K5EwHsn5Lew00/fzmGqqLKtz3gbdoKBFeaoremIvsl14J750Ccrbw1qVstqw
	 h4eCeEc74u90i7iBm8oKPx0Oc1Ae2IxSXu9qipK2uTqHW0MMexn65O1DHrRk4VzqZgYgf61r+4A8
	 Nh1MbCcrcx/s6l5VqRB0LSr6Y6DqbgejNUgGWlMe5P8iVfqpKFTgqJDnu9IZHI6yBsX4BAWv0+uP
	 AyBmPphQV0ypr3wOXf3VnLPWQ2W+zdYyIyetalE4AE0I46CLa6YN7CSUxloQNlRk/3L6RhGPJBF6
	 AIV+3aTH1TN2oRp8rJYg9Bn5vMmp0qfG7uQEB/VTFVUpqncQaEv1caFiRf6SVXYIHBTnwn4WG3Hw
	 UcDYiAqc04ejztHz9rxejWIX962lbq5qPpcnTH46KKBDInbOfVy6dusZHUUM6+wVmAGdt+H75UIX
	 /TAwa3ABmZciy15Yju+MDVJE1Nw7Q0oIggEk6J3tTiFQ5902aaukCmrccajgv2KSqrYS22MDR5zC
	 dGURdkzrXyum72P/mBduB6YetE0cB3PS7NpqCXU+CUAjrwJvxxkZEunS4ahfUqCii+mrPgrvIhbo
	 58DZusIMcyNCzVlQ/SwQ2QGN6NbzuZKBakqaZHK8heibrdYJ66K/kUBDBz6451blfDsfUTI+/IyI
	 AfropGGnteD9eY+73qq1fFX+95wwK/3HesYqr8PNw4Hhe9yPPKhA4psNatC1enzG7xSX6zwFKP7s
	 yS4GmQYu7+poLHvUBQJHFx8f2bnEYrypnH8K+Y/B5BCjg7YuyI8kFoa0e2qvoaOfOfZvzQ6jswDh
	 KLpq0lL675KqKIUIarG/HcukCnGki4NKgR7RBFjuzCxlY3O6dbNJaZd1LRydkE9oK/jl6pbdm4WV
	 Ob4+Knh0edwnek87E39oaPR+iPtLnuyVDWbJwn/r1r03FBfxsW57upgmyY+Lds
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Cc: abbotti@mev.co.uk,
	hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] commdi: pcl726: Prevent invalid irq number
Date: Sun,  6 Jul 2025 10:10:35 +0800
X-OQ-MSGID: <20250706021034.2900953-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <68690648.a00a0220.c7b3.0037.GAE@google.com>
References: <68690648.a00a0220.c7b3.0037.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reproducer passed in an irq number(0x80008000) that was too large,
which triggered the oob.

Added an interrupt number check to prevent users from passing in an irq
number that was too large.

Fixes: fff46207245c ("staging: comedi: pcl726: enable the interrupt support code")
Reported-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5cd373521edd68bebcb3
Tested-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/comedi/drivers/pcl726.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/comedi/drivers/pcl726.c b/drivers/comedi/drivers/pcl726.c
index 0430630e6ebb..8802f33f1954 100644
--- a/drivers/comedi/drivers/pcl726.c
+++ b/drivers/comedi/drivers/pcl726.c
@@ -328,6 +328,9 @@ static int pcl726_attach(struct comedi_device *dev,
 	 * Hook up the external trigger source interrupt only if the
 	 * user config option is valid and the board supports interrupts.
 	 */
+	if (it->options[1] < 0 || it->options[1] > 31)
+		return -EINVAL;
+
 	if (it->options[1] && (board->irq_mask & (1 << it->options[1]))) {
 		ret = request_irq(it->options[1], pcl726_interrupt, 0,
 				  dev->board_name, dev);
-- 
2.43.0

