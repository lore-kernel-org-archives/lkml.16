Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9584D264A74
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243354; cv=none; b=NNQmgFJOijSP3cWmVy4dXHs+k1gnWf4klpBCYObv9Za5P2pAh0swI6kKxJt/9XjAHHURcBkMg1xR5iaat0P45XMe4UQ9wQJVKAGRmTlkaLfjF94zNYPH+Ycz7HakkqVQA0YuKITqmY8X6MPBZZIAocvHIKCc9i2oCKBqqbRrWUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243354; c=relaxed/simple;
	bh=OXe058tiRU3pWUUJMDLxQBibS02iMMq22FZ8g4QjM2c=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=fYVZzF81tV4d9Ql/Y7gT/7ZQ//zmJCLLSmDCx1NMlyWm3YPM8SLFoI9zuGCLnFOfWHYSeIgpdqtS0RzJ0a9AAEQGZuBYnz0RJWHSVuRn0XrMl/SnrgclxSYhT+3VwDpP0DjJ7OVmyYdo49BzzuPAVAsu1758Xo9bk0sVRD5igMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=neiRsLBk; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="neiRsLBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745243040; bh=ngDVsHiq/ThQX2r6qcF1vITVscrftwsrrth5/bi0Ek0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=neiRsLBkAgC78NTiUgncJd1ZlvPPm9fDQqrZagEjIu8wYpYvDwdH3ZKJyloelhc1p
	 ro+R0v46ZalJ8e73mpYD0iFmdm+cxxEQOSCuV14cpEOUIqgdavJyrCVvNZVrrnc558
	 XTkK2X088or0CJhpR87Ul2xwhQX+kli+Z5B5aUrk=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id AF89FA0A; Mon, 21 Apr 2025 21:43:56 +0800
X-QQ-mid: xmsmtpt1745243036tawwn6k7r
Message-ID: <tencent_D8747F769166163CDB36A697FE36984AB009@qq.com>
X-QQ-XMAILINFO: MQjKimNqHmeyP1Fuw5aVMDMqlX7c2cjsO1qUBgUCxcOQB58kdLkuxMjpwBtZ3J
	 mN+T/2a7lwItAW+GXsqw7V/QuS/6m62gv+KWdxqDzhTjjjf6eEQ+ktl/WTusT3m5z7tWFm7mQk9t
	 fYL0k+rRpNAggHTiMhhfEbgv55ljtexJCCQGeyGL7nFC3nGzUUy9tdemyriVeXN+pWxBQ4MV4TxS
	 rNh5F4cixBQjDvSErOU13nKiHr9qHRb3mf8uBVIOpEvIUueyFZaPQ6NxkQDWeh5/gYoUbMiPtB2c
	 tzwO0eVuimsHyIz/hIWVBHzsqudEcPHao6etDHKbsR/hCZaHVgOxJXUjpJGpM3K/1WrYJgwoetmw
	 KcQGbMp1VzbNy0mggYSVTsIOpYs2J5B/dMR/U/o1HPS/b3tcEBqItam5xUMbPb2bVZjI7r3ReKkp
	 tNemL9DFXdpAF+aP4S9E0jYvb2Q7qcXWpB8CEKPGK+yR+nhn2nXZkys/323TR6GVxMjDFeJ1Xf4/
	 UNMic9yXt/GdJql6pt6LHuccHjHnNUOouD61YrysGbkTkUwLUdmuOwbfYrvqlw9fwcYt9oYMpP0V
	 xqKw4b+oZfW9b4C6VOZNT6JgKgGdq+V0jWwyFww4yC0ZoCxnA/17Vq8V+eO7fUqQP3raDXdZwC4H
	 pVYNDhvhRRuioEO/lOguyqb9WTXdtD67oVhK9d/Jdp2Mlgi+MiFy96BbQFnqvgTtcXxjpRl4sbB+
	 la48UmiKvbVbv5EtLSZajM2mAKar8YZ8YEiHI7pUq/XmQekQiI/qmkEYMHiM91jqcBtWi8wNoWTw
	 OPppByvvi7szujtuuCgmS5Wy6Oe2AjUEtyyTWJfuXiJ401RQKnNkOlR1OLMDU4sPjhk9hhJPzEW+
	 IQ3g7OMVwsh9MrRt5M0U4YuJrXdMfRKKu4qdPplfb/
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] BUG: corrupted list in az6007_i2c_xfer
Date: Mon, 21 Apr 2025 21:43:57 +0800
X-OQ-MSGID: <20250421134356.970333-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6805a24c.050a0220.4e547.000b.GAE@google.com>
References: <6805a24c.050a0220.4e547.000b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..15d2fe477fcc 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -806,7 +806,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (az6007_xfer_debug)
 				printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
 				       addr, msgs[i].len);
-			if (msgs[i].len < 1) {
+			if (msgs[i].len < 1 || msgs[i].len > 4091) {
 				ret = -EIO;
 				goto err;
 			}

