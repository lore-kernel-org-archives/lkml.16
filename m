Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1F1EFF91
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747119334; cv=none; b=oE1hEZNzjFEDW0ROyFzPT+NNqFNUGg8pJ4R2Zsc/Rdt2zGYWeIeU6x2WEwEU9d8SdQsbYiHO22Xi3CTzboo8LLWu/RnGEO1a5HSw3lygo65fV7YsTwDjTWeqk/ZV4pTfMK5WnJ/HSDizTIE6mYGllUHsWE0vMnh3/gYlSVQtj+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747119334; c=relaxed/simple;
	bh=RFRKORYw+oBsVVymOsfYwDTVsOy6s2BlD0OXLsv0IlU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ZRdFyLqh94AT/Effm10BXwCTkI4OblElk3iiZUVsaeGUX35h6rFgYdaxLEgoC25vhvIO3OC5P7tRFns3ygvfEQSMe5+pdd8TTCVoJ771geMgn7kZ5XM+llClfzX0ZhZC4E5BNZpYb1D/9HVMPfBymqLNPCXosF1HCVja1sf9Jak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Zv2w8mFE; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Zv2w8mFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1747119024; bh=wCXqL/mfMeFmKnM3cRRks03v3ecnOZNlY8v1chne8gI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Zv2w8mFEK5lDljIv+SCXV7NmOUDrpCdFrTzqnv7xEnXdLmflfRP20wkNUs4MwL1x6
	 ihWXbQ2U7qNigh0HZlUMnj0x7H9EO4GPPXg8imPcCvSWVW0icEoH3/CS4dO6//7r11
	 y/U45P2MXQkwemSSIeQ5646O8VbrikDJTew4bsSs=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszgpua8-0.qq.com (NewEsmtp) with SMTP
	id C9700865; Tue, 13 May 2025 14:50:23 +0800
X-QQ-mid: xmsmtpt1747119023tv6naac0z
Message-ID: <tencent_B0F292D9064049B26EFC6ECACC8227E4C606@qq.com>
X-QQ-XMAILINFO: Mdc3TkmnJyI/l9IJaLYVELDIqTfX+UbiciBeXb9zsaQEVPasQLn1L1vWEjLKPW
	 MzblroRe/3/54Lc/p5Msw74W5tiiucCAanaJI2gRE9rlWykw/f55u5cmFursHjLmfOH9m3Ntgc7g
	 naBbPFCDpajr5wJ0ijcdEvQQ5rgSk67y0w1jKkjTf43i0tuvSbTyBKt4eTnZNgpDS0lz2wNfgWNC
	 J6vAUvanhHtYAD/OCRLQf991CYuNhRBgY5v6l3ki5Q4l+e9x4j6WCXIrGoaFyT7BBnu9yHZLxQxH
	 mCVyqlRjTJqG4G9jdGwJopNho/hrUDkAFp3rUGXQycUUgM0Nfqz4boTtXxaytQQAb4hMz6puAOaN
	 YhMUwXqhFtpBzbE4EP5dtwP9WB9FwRBDr9gCaXbU02Okgab6O2JnQ5W1ikhR3CFPD9v56EQZPOKP
	 WYU/SQVK6fJqGp+Cq/ju7S/JG7JQcVSJh0PYcMHHeVHy4l/Oums5C+v2tCf+QjoOHMI8UwtsFoGt
	 kgFLRz4qHjbV51/jAsUBwRcRQvNUaIYYr4aOVL+DA7FlzTbHd05IaZ277BHPDFglcwoEeE8P/LkJ
	 LMzY1C+0xOlo4Cc0ngYks/LSGEFZ00AIcTivWsDSzNEOcr12KO4gjBMlFYMDTvxlmw0U6Bby+2oK
	 EjjEktlW/Y00AiqE7mHslIWyDsC/p0OugrK6ynBjM2yhjyObWuw3fw2cf6DwD3etNKhLK0PLeOuj
	 a/JjS0ZZ2ZfIVTLJ1F+YyEdgovWws9nmpH3KcPP6WRsD4TA9YFu1WJOTQkS7xvRxiW3edmnD6H2/
	 Rxrqbuhd//Mpj0HEIhvtMNX1Rg7QJ5tbKj+7kaRWCvQu/q7Rz49s8n6WJ9Q4P0iJ9il/S9sndXqA
	 H52ZFBnp6yPvgR+Vhz0/ABGy2/8b/QYQ5NeMyK+k/ru0js14uKTh8qF4HRLtB/Zw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in dvb_usb_i2c_exit
Date: Tue, 13 May 2025 14:50:23 +0800
X-OQ-MSGID: <20250513065022.2004159-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <681688da.050a0220.11da1b.001c.GAE@google.com>
References: <681688da.050a0220.11da1b.001c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index f44529b40989..855d66043b85 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -1600,13 +1600,12 @@ static int cxusb_probe(struct usb_interface *intf,
 	struct dvb_usb_device *dvbdev;
 	int ret;
 
+	if (!cxusb_medion_check_intf(intf)) {
+		return -ENODEV;
+
 	/* Medion 95700 */
 	if (!dvb_usb_device_init(intf, &cxusb_medion_properties,
 				 THIS_MODULE, &dvbdev, adapter_nr)) {
-		if (!cxusb_medion_check_intf(intf)) {
-			ret = -ENODEV;
-			goto ret_uninit;
-		}
 
 		_cxusb_power_ctrl(dvbdev, 1);
 		ret = cxusb_medion_set_mode(dvbdev, false);

