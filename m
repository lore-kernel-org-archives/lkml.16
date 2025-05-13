Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A1C2F50
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747121492; cv=none; b=EIuqEofl1jnnKEQJtyVHMC1uBEAF7J7Lc6t8PadIshkNUeu8tFqWmbjMQvjpoCBjlHVobURvXvFrqwjGpewDAhptfCY9KLf5h8kQlOcYQAXaqrTDR/05SiCVXxZbNoN133upQVqJqpJv9yTvQcLaPxz4NkKfCY12loiz92JNzMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747121492; c=relaxed/simple;
	bh=Uwds5U8CPB2uxg3bG0f643E5G9j9RDtJjojz5eZ5dUg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=E9ckQyZ7LbCDfujTN+3Zt1hxX3BSRGcOL/MVl21Upn2jf5y56LayZ0EACFN/kDzU+2vyb7oodnIYvr/rh0qhDOduXQK82bO6XKJNo+7W9S8WEs3XaM0LEkXErG0xna/cd4eH2ghNlNpxrFxpp8UFYDczfLquYskwGFddubV25Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=IQl3PONd; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="IQl3PONd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1747121479; bh=BQhs76KSA++hoJDE7uOgOkp//yaIfVhLWDFlmS1nA7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IQl3PONdjUZEHpMo9AwK3WlCk6ioMW8FSngbjnntzSmvWedPsor6IC91I72G/dLB2
	 bCytb5BN3a7BuVdcB9QNchhIuirDilOk4zQSHBNbBMmsGLoiVEV+8/dV6dVJi3ESID
	 8kNTNtD8VHk1+Ei0k92k7Y31yEmWJwJxFAGH0OWI=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszgpuc5-0.qq.com (NewEsmtp) with SMTP
	id 5C91CE51; Tue, 13 May 2025 15:23:09 +0800
X-QQ-mid: xmsmtpt1747120989t40vbqlba
Message-ID: <tencent_28E8E99AEDE2CD6079AA6C042DC96F34940A@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25G7ka8scU2/01GllFp2FS+VUlawPOcfvwAQ5gEytPbmzByM+W2jS
	 qUGRvWeG7DGlFqzIFlYNRrK8AZSdcp9uJByjsLeTMUfjzma2CpfCC/V0uAd04HfWYNXLkwPloDzf
	 W3S03LRVKDRM2ju2LjhSHa5N7XJ7fRzZSG5ipMJto0uBql36PkbiQuH0NUtjSr+gJUeSdUfCSUqd
	 PDlHm7s+oSt4XM+JPuN9f08loOh8UESi6zRevvUM5tgIjKtPN6M3AhAvU23V2I00GXQ8DW7h8vzx
	 Z5fveReLQGemIYSDIK2MmAXqfwJGBnXzHaA7ol4K2YJI3x0nDsDGsR+8fQscG7GOAFKdX3gyGh6b
	 4XZ16qwnwk6GgRSWkkQeStYPI7mxqVjlh4bhpyxH8IEbTHjc9hEx1fr3WVhVW5CETZoA6ilxdcOe
	 9HLXTwJPVpbr8IxJwl/9B3jlMueIE++I7EFd1w3GGGyxcN3PkpRqn0m2faME/MHnjYokvcGnwCyr
	 AU7qJEeddWW39m4uGqjtY08s4XHg8RYgLPIStfT1B7zW/Ku2w92IGZiMlhdZO+k7kYnQognm9vFM
	 PXU8WPvDczCwr8nrkICA6V00v3HFoLgd3LtoxgY2UTZTMrmh0VLj91NAaGu0LRnH8Q+8uQ98QBDW
	 WHkoBv87YbKn/0BxDw3fW39ja7h8hGPnDm+Sa6rprpe9axTaP3r0O1wd1RHYrchm8S4wvs7HOkpX
	 i5zwpoXVuS05roNzjo048egbMM377LG7k9hT1CnwnSagy55epNE+N3EtEE63zSSldG7AyfR5OnUX
	 A+GcFLxvoGSZqs+gieb/YEFgApqta5clyStj8AZGlTh5Q5whhX4LNB3FtdG76n1qeW4TFo34JqNb
	 w7LeKBVbcBVMJqDP4B7zytF1NqCV9H3A9Psa91M+OhgUw+fuyl0qhTa5yZ+P4mSl3m1A7o3EXxmR
	 th8U5Hoy/MW4yVpz49HE8vQrZeTGjKZ3eszYfXy2xM53CgDMIZfYDoh97SAncix+fe56j1+10=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in dvb_usb_i2c_exit
Date: Tue, 13 May 2025 15:23:10 +0800
X-OQ-MSGID: <20250513072309.2034679-2-eadavis@qq.com>
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
 
+	if (!cxusb_medion_check_intf(intf))
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

