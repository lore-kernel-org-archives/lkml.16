Received: from forward201d.mail.yandex.net (forward201d.mail.yandex.net [178.154.239.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915EE2C10AF;
	Tue, 22 Apr 2025 20:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745355170; cv=none; b=cmtuOfIv2p4TMNbAarrinjXkJSmeAD7YNNZSCwaPdvbFPceFYnfQ+TC5rl5AcATfprqKkDxSf1b/orHEDCh4hCGa/O1GQs5fN7uHtX01ythosi4rWniZsHNNDskUDNFVJZyt9aAG6AbOaFS15iA2rTsQCtWXCOu+cSk4RmgntKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745355170; c=relaxed/simple;
	bh=HWsZTcwxqqDlwq/66l/GkMINTR/nteTpcLUUZS5iM0w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WqG9PDmL594AyS1BjLk4Lg7URaOvkyuG/zV9t1ZpMdprg0VUD+g/2FRIyVfpZ2M5+UWdmN4sklPskAWSHfIz1MJ0e3uJnA/31FbAQrVeG7TR6/BEztlV9oOS+OQUkheKQQISL07bvt9135N8dMFYfkalgGjpLyn/3IA77hcDcGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=jtdQFCd7; arc=none smtp.client-ip=178.154.239.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="jtdQFCd7"
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d102])
	by forward201d.mail.yandex.net (Yandex) with ESMTPS id 324E8667B1;
	Tue, 22 Apr 2025 23:52:35 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:3d4b:0:640:d84f:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 2AA7960035;
	Tue, 22 Apr 2025 23:52:27 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id PqVjTR8La4Y0-lk2hJklO;
	Tue, 22 Apr 2025 23:52:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1745355146; bh=DGiHvaIlUoIhikO2AgEKKS1I5QhkcWFVrp32VIFJTfk=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=jtdQFCd7UUYm//OYTyRCuLQ6ZBnA85Btb5zBrkiTdlKlNd+lKK28adYULe5L93yMK
	 mMDbgNm2Gad2ozBNXuxY3PEx3GkvVV5yZNKub+gnNo6Kre4V+EuAshIBo+oQ3+B60a
	 nRlnqUny083Y+9GzZxZwqWUCIwpc0pc47VA8Cr5o=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Alexei Safin <a.safin@rosa.ru>
To: Johan Hovold <johan@kernel.org>
Cc: Alexei Safin <a.safin@rosa.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] usb: serial: ti_usb_3410_5052: Add NULL check for read_urb in ti_open()
Date: Tue, 22 Apr 2025 23:51:40 +0300
Message-Id: <20250422205140.7857-1-a.safin@rosa.ru>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid dereferencing port->read_urb when it is NULL, which may happen if
usb_alloc_urb() fails or initialization of usb_serial_port is incomplete.

Dereferencing a NULL pointer in ti_open() leads to a kernel crash.
This condition was detected by a static analyzer, but can also occur
in practice if memory allocation fails in probe path or if the driver
is incorrectly initialized by a faulty device descriptor.

Check port->read_urb for NULL before calling usb_clear_halt() to
prevent the crash.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Alexei Safin <a.safin@rosa.ru>
---
 drivers/usb/serial/ti_usb_3410_5052.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index b99f78224846..8466336714e8 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -710,6 +710,13 @@ static int ti_open(struct tty_struct *tty, struct usb_serial_port *port)
 	/* reset the data toggle on the bulk endpoints to work around bug in
 	 * host controllers where things get out of sync some times */
 	usb_clear_halt(dev, port->write_urb->pipe);
+
+	if (!port->read_urb) {
+		dev_err(&port->dev, "%s - no read urb\n", __func__);
+		status = -EINVAL;
+		goto unlink_int_urb;
+	}
+
 	usb_clear_halt(dev, port->read_urb->pipe);
 
 	if (tty)
-- 
2.39.5 (Apple Git-154)

