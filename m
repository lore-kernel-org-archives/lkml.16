Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EDD70838;
	Mon, 14 Apr 2025 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612204; cv=none; b=RR/Ynq4F8XKjAUrSy6dMGQApirrFoMX5oUK13FS+sISEIf8bnh1fK9V/jebF/+nQ78ngTpTX60MOYVRnFWHEIJtcGjAS/aSI88F+3SC2KNzBacy8UygiYSEyN975EHIb3h4KlaV3SIXYVOtSxmcOlcC3aaM022dXC26N+aO+exk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612204; c=relaxed/simple;
	bh=DFIwrdxtLKx4d33+KRQJQh9AxFdgjtzMyl2NjQQj2Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uMMyyIhgd6/Swk7By3NZ0uzvMaDk2vGCrvpwJoF5km6atjysFylwMJYLPKQfkw5cTo/qMrZCAomehMDcG7lnIK6/5gNEgD63XPja9gXxvVyBfSXAmQjbZQeURo8q18unqabU5MRg4TMFLnAhg1AmsHlOGOENXD6iZjcqZecFZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Jmah9m2N; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Jmah9m2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=jTcPX
	X46sVenqUwadaO0gCghMg1N4d43cIuGonkEWRA=; b=Jmah9m2NAMUROtFvA4uYi
	KCm0kHGylQLXITlOkhP7v+3arUMhUP6gXTxxA4a/88X/7I0OObtiP1U2KyGeTM4o
	xC2pqq+8ID4c0IeEq+SuxKyEtuGrvwFBFb338YrUKSiK4HUO5icT2q75RJqFNYs4
	r50O5z8Z9GRjv/W2P5aDWA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBn0CBUq_xn8qBvAQ--.9320S2;
	Mon, 14 Apr 2025 14:29:41 +0800 (CST)
From: Miao Li <limiao870622@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	limiao870622@163.com,
	huanglei@kylinos.cn,
	Miao Li <limiao@kylinos.cn>
Subject: [PATCH] usb: quirks: Add delay init quirk for SanDisk 3.2Gen1 Flash Drive
Date: Mon, 14 Apr 2025 14:29:35 +0800
Message-Id: <20250414062935.159024-1-limiao870622@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBn0CBUq_xn8qBvAQ--.9320S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7XF4UAFyDJry3Zr1DWw18AFb_yoW8Jr4DpF
	WUtrZ3Ca9rGF12yr1jka97ua4kWa1DJa45Kayft343Zrn7AF4kWF97Ar15Ga47Jr4jg34I
	vws29F4DtFy7K3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pirOzxUUUUU=
X-CM-SenderInfo: 5olpxtbryxiliss6il2tof0z/1tbiEQEvzWf8pX3RqQAAsJ

From: Miao Li <limiao@kylinos.cn> 

The SanDisk 3.2Gen1 Flash Drive, which VID:PID is in 0781:55a3,
just like Silicon Motion Flash Drive:
https://lore.kernel.org/r/20250401023027.44894-1-limiao870622@163.com
also needs the DELAY_INIT quirk, or it will randomly work incorrectly
(e.g.: lsusb and can't list this device info) when connecting Huawei
hisi platforms and doing thousand of reboot test circles.

Signed-off-by: Miao Li <limiao@kylinos.cn>
Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 8efbacc5bc34..b00832cf626c 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -369,6 +369,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x0781, 0x5583), .driver_info = USB_QUIRK_NO_LPM },
 	{ USB_DEVICE(0x0781, 0x5591), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* SanDisk Corp. SanDisk 3.2Gen1 */
+	{ USB_DEVICE(0x0781, 0x55a3), .driver_info = USB_QUIRK_DELAY_INIT },
+
 	/* Realforce 87U Keyboard */
 	{ USB_DEVICE(0x0853, 0x011b), .driver_info = USB_QUIRK_NO_LPM },
 
-- 
2.25.1

