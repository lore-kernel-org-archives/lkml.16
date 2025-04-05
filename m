Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BFD1CAA95
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743844049; cv=none; b=JhJJ8bc9AOSCYNF3yigJ8l4FcnuW85aHSzxWkDm2QTN1orw6sFLW3bFKrm2u1F4lgYIzgKJEqreO45zifDqA9s6fyHGLnUepod3mMMGj2Xjv1kilp/nQrfc8y6hJuaBuYmWjeA5wMJ9H0+VQww4gwBTGspA42ut2G8M5uwTrdz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743844049; c=relaxed/simple;
	bh=wwrAlHje0rKotGRKlzMY7JtifDyNieixwMFkmGtZ/WY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=AFw93h3gtiBZTuwP2iiRkN7qzgBQ0TvNvfQytXmhS16K6Oy2GaRKIticb6/aAZKxqKzWsR+vnSRCb2fgKU9HQq4o823rS2hRn+lhooccAzp0FAzztaarLdRFJ1/uOGrPoPt6U9wMiM3YJg8/qjvjr93fR34MB53MWT/mp7OtsYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=yPsByj2+; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="yPsByj2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743843731; bh=KKFlAe1j4RzCkFSf96l5RSY4ididJUtIe/eaMXCShoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yPsByj2+YrPx9NP/5eNuFk5J5DmMRrpDWQAgFfoaDUld84jqsmyITCna34BMD9hG+
	 QqSKek5lFojEeKUdlMhem7HO2Uk2QZQt+bbp81D6a6a5sy1IJH+mYFFrbgv71h9dpq
	 ItNvGapXbTeQn6PflFqi5RHwNkGBBrLfxD2qynDM=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 89324E0; Sat, 05 Apr 2025 17:02:09 +0800
X-QQ-mid: xmsmtpt1743843729t9vqfyrgf
Message-ID: <tencent_7B7B46D79363637D4967A3BDE448F772D705@qq.com>
X-QQ-XMAILINFO: NDAhN78L72+TSkgFZK690s4kofen6fH2LpNseRxNR3n/omBdTcFSX0jDvZAzHa
	 99QcVZsQKE46ujw+NpNHj48chwJiy28q8onIxRPq0gjxDonWtgbjQyaGl3xCphjsV3Bw19MQkSFG
	 OMKxeWtKhZ5xlgAKnBQE8bBI4xHMxXzYWtm9gGOdhuFySt+fGzgIJrfu57lbnLhTzNA/OK4exR8e
	 svzOo/f9ke5hgxuiTn0P3h3hoSH/1+5SEPk2wVSk36Y35jFil0kgP5n2qZMdMJ+iG568Npi2n4kJ
	 2RVMsAHWP1j/v3PcA5FpsmUVwZ7f/g/5hHxnKBOvXhW/Cd6u0VD6gXCya/sCd72A41XyP6xwTG46
	 xChlDvjG/rwbDmfE6SkZpefy2w4kQAh7gz8eoWcpsjFxDW5AYmJVH5tp7EeuQEUD6mcyCIdrDXhv
	 +aXxPO64TnvaGG8h++MdxrY1GCfn0BcvkFdmDT33AWYHOYJ4q/xNxVFV0KuXzO04768Em6+U6PYc
	 G53FsJvRVPzmnUes3LjmcBODbk8Ni1F23J6AtiyOQPZo1MGPcDU8zxcxpjaYv5S3eBoqJIVlYDIK
	 +qDzp7JlsG3Kyn45Uh+PxkwkvlQ2ZWq/oQ+dBJZv9MAtdabocv/m3RI3P5rfdWzihBVSuHmspIi3
	 JcMUAtzq6JZpe6zoshwhY8e9vdclojj1NfJuZdaja3jisFvzJQsFbaVUysACf01TILhDHu5m3YE5
	 69grGFuLG7WmlGCfCIAywohltrSePvISwZobYO3YTIojSb2ju6e32DAk0hTlHTXKMBTL9FYzWJNj
	 gwhljmVcft7SmpqjAcoESus7on5PXO0VlFedpanNVGAiApVXskDmN20ss2a6tkEM8RHg51CKvdW1
	 O7+8VOtNjD30AS4VO70tL5w4/bY8/V09YcXnOB3esm
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] KMSAN: uninit-value in cxusb_i2c_xfer
Date: Sat,  5 Apr 2025 17:02:09 +0800
X-OQ-MSGID: <20250405090208.3719887-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67f092b5.050a0220.0a13.0229.GAE@google.com>
References: <67f092b5.050a0220.0a13.0229.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index f44529b40989..d0501c1e81d6 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -119,9 +119,8 @@ static void cxusb_gpio_tuner(struct dvb_usb_device *d, int onoff)
 
 	o[0] = GPIO_TUNER;
 	o[1] = onoff;
-	cxusb_ctrl_msg(d, CMD_GPIO_WRITE, o, 2, &i, 1);
 
-	if (i != 0x01)
+	if (!cxusb_ctrl_msg(d, CMD_GPIO_WRITE, o, 2, &i, 1) && i != 0x01)
 		dev_info(&d->udev->dev, "gpio_write failed.\n");
 
 	st->gpio_write_state[GPIO_TUNER] = onoff;
-- 
2.43.0

