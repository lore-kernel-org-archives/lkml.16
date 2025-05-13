Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531371EFFBE;
	Tue, 13 May 2025 23:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177801; cv=none; b=uZF+5qgdXnByUd9expAp9rg2tDvnwjixoBU7AilNoPKWUmqttWq8A09q7IYC7S9sPAfX2rVs+ScZA+UnJRrn+CKXFp6FE5/MGxS9e9z/H6tff3Y/KtrWzdY7zNbPQgw4x29bmQkjecXVaAOnyALyR4r72FDT4o8Xb7N6d2cAD+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177801; c=relaxed/simple;
	bh=S6IFkDK9wWbIT48K5AkF79faJvzVr+hp/oQJgln5FrY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=BzPOKaa1OwFHi89HV8qv8wj+9uuVORuGBmVDi1ZhzOO424vhsRml4seUFzqYP5TrN827hEpsStp5Leutb5zNfXuyciKtQrbl2gmrmQ4bdWZmLoLnDq0OLQsO065dq1S3XzSRpGbKqXbH8tcstGDQX4SLtRg1SA0OJy3ClSQIhps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=PqoQm5V2; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="PqoQm5V2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1747177788; bh=Ozf43I1JSIyHBWszg7fIjcbmty5EorEQyDyL2fU2o7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PqoQm5V2Lt7RyIBiAAbATkjq7xEszKn6ULUt0vRkryXyy/H8nxzMmMmOrRdeZAeyK
	 +N5sgkd+pxRqMLmwVLgC97yz4szq8ov8sL9WxCzGDApCW4KXGR+4GbWSJIExfBKEX4
	 OIWUhIsGVu84a61/4btaGL9xJskUsRUTJZm34/Ls=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 490E644; Wed, 14 May 2025 07:01:09 +0800
X-QQ-mid: xmsmtpt1747177269tz2o0pgv3
Message-ID: <tencent_251BD325BCBA5EBB0533CD9EC71B1A4B9208@qq.com>
X-QQ-XMAILINFO: NHTNowOA4hJdOFjT5vYTmoFmA7ieEAZqhEBd5XV3pVwUcL5e8gRRGrcEjvMNAH
	 6d6NXurnO22Wz1mmEMIGRojiD2QRQCyzjf7hbet4X+rakPeOlrRmva3yJbIVJom7mW/OfBWG6y/V
	 R/tpGIuUOvMvgNrGnIXMzl/FTo6hyiaHF4Ns44Y52rt4E1m3/7qYsoux4wThJ2gmdtPGFbts53ke
	 RKNZXT2DUBb3/dqyT/5z8aja+esxhLpVkQIS7+7YxG0mYgjgzyesuFvjcHvbPKWv5teiHzItgmUc
	 SP9xBF0WQ0YAo1CKY4IqPJhypnTRG/oKbi5ZG+k3zMETVT7LcgIWHNSRPbv+8JO+ziBKzZD6UZO9
	 hU8vaP+3+O3Uhb7acRPoedADnmNKknUMnt7hgLbuzv0haKJhEmdzMwxJya86qPR08J2c+Ix+Kjy4
	 /SCKMiaWSXH+hh523XSKS6PBWSzfeqpCE+frv+igVhTBJQMPnLjYtb25DEB3bOZum11KbysmuTc5
	 s8iB1lRiKMeqpNVS1LUJwkwvSW4F927BQ5YVKFEz+NSBNWxqcpouiVR1NFrvLx+rPBlvTKW59OWE
	 zIbOwArydaiGShkSOUUQIaKScC5PDIqWW1FM9Y0d75afg1dZLQalFSzLRHSpMjLHN+hjIqlOL1ho
	 GZEzSjSNn1A/jhwaVl8Mf/Qwmr4e0tBG9OX8NPuoAVjEBxE029RRl2NU8LKVR6H11QgmWbKMzmS5
	 4wm2y7OkyB9YrnWtl1iqCj8pgLi0kZJ4dI7mow8h4gtUMwSuIjtzRLxWveVFV5vmVWtMlRT8llt3
	 W9tDjsx3BM+1F+Z5TKbN91SGWWisy5nlHsDh76OpJo75KP1SCyrgLcvgALBVXsH+Av7VaEkTJUI2
	 pwwqhzouXqqoVkEsP2wKzErsN8OGgr8xtjpUaTdSVfVW/ZL3buEaHEmZgBi/w+rvCf++SfZHQ9N3
	 ttbl3wQmcEefMaZWV9nEd+bJNHqNgC8bPows/JFxmXf/i71q3HWCBz7Z23P+rs
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: [PATCH] media: cxusb: Initialize medion after checking intf
Date: Wed, 14 May 2025 07:01:09 +0800
X-OQ-MSGID: <20250513230108.2456593-2-eadavis@qq.com>
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

dvb_usb_device_exit() is entered because the number of alternate setting
is less than 2. Check the USB interface in advance to avoid unnecessary
dvb device initialization and exit.

Reported-by: syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0dcc341ee61fc9e4032f
Tested-by: syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/usb/dvb-usb/cxusb.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index f44529b40989..df86ae7106c1 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -1601,13 +1601,9 @@ static int cxusb_probe(struct usb_interface *intf,
 	int ret;
 
 	/* Medion 95700 */
-	if (!dvb_usb_device_init(intf, &cxusb_medion_properties,
+	if (cxusb_medion_check_intf(intf) &&
+	    !dvb_usb_device_init(intf, &cxusb_medion_properties,
 				 THIS_MODULE, &dvbdev, adapter_nr)) {
-		if (!cxusb_medion_check_intf(intf)) {
-			ret = -ENODEV;
-			goto ret_uninit;
-		}
-
 		_cxusb_power_ctrl(dvbdev, 1);
 		ret = cxusb_medion_set_mode(dvbdev, false);
 		if (ret)
-- 
2.43.0

