Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9619C55E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882043; cv=none; b=VosaB3K7SxnTAKedGWrogCIu/bkau5dp7calhWcsDp6XBFKNC3ug6OO4nO5r9r2c5zkV2LxBU/YPn+qdAniAmt5KIc4xrZ7VFOp4BMtuY/0S2W3jZjLNl8Qo04/dZzn1bVtfxli259idQw52Esn1rqbZlxEy0CypY2juBohUTZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882043; c=relaxed/simple;
	bh=cKvEJg/NR6Vzc5ifX66Y8af1qoE9/1oLpW0tirx20vc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n3TuRtcbh2DHKhBv5fKPuyNvT7w7ESspa/G1SvcU2LRmb3ftc311g3H7TODEDtP9AoWOGGGDVRP3lHOODPPLn5dp2Ho8Icc8ni6mlfUb5ifAbOiPcrtDkFNk33H2iq1ba14x+SyZv06W9Vb9INJpHqPOwpKdDMHhmYurRXNqBpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=Xr4cWiRh; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="Xr4cWiRh"
Received: (wp-smtpd smtp.wp.pl 15612 invoked from network); 6 Feb 2025 23:40:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1738881636; bh=/dxcutMpXbREWxlgUU/VpF3517cOAAEJq3LxSyYzdIE=;
          h=From:To:Cc:Subject;
          b=Xr4cWiRheAZg5JdrJGjhXYoC+eMr7Utq1SMheuCvEHW0H8j8Ihp504rcwdztWSi8Q
           LQiswyd3EZPIXgwSJ1Vx6v5g4KrxypWwQzDrwjbEMr+EIHreXWo7VZd9iAyoe1wrlq
           ELPyfftNWaa8CTlLovl4nv1NkalFYjLCDMlsyCbrmpjQXUMjzQEe1yqMpxZgR8q73X
           U04BamSqVbNH8y6zWSLrHqUu2c9wQ2PkqY+ke6KuI2R/tHxncDAcS/PR+xbNm9axxu
           9xikN1ufsHm31Qw/WOT5rPaGdUgV7ZLNX4r0Cc6VDoB0+/NOVrgVBrYr8XQV8YxS7c
           KXY0F2krJbf0w==
Received: from 83.24.144.222.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.144.222])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <andrew+netdev@lunn.ch>; 6 Feb 2025 23:40:36 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	hayeswang@realtek.com,
	horms@kernel.org,
	dianders@chromium.org,
	gmazyland@gmail.com,
	ste3ls@gmail.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH net-next] r8152: add vendor/device ID pair for Dell Alienware AW1022z
Date: Thu,  6 Feb 2025 23:40:33 +0100
Message-Id: <20250206224033.980115-1-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: cc4d85941aa823555ff2ff16ba445377
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000B [cdME]                               

The Dell AW1022z is an RTL8156B based 2.5G Ethernet controller.

Add the vendor and product ID values to the driver. This makes Ethernet
work with the adapter.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 drivers/net/usb/r8152.c   | 1 +
 include/linux/usb/r8152.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 468c73974046..e1021148d3a6 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -10079,6 +10079,7 @@ static const struct usb_device_id rtl8152_table[] = {
 	{ USB_DEVICE(VENDOR_ID_NVIDIA,  0x09ff) },
 	{ USB_DEVICE(VENDOR_ID_TPLINK,  0x0601) },
 	{ USB_DEVICE(VENDOR_ID_DLINK,   0xb301) },
+	{ USB_DEVICE(VENDOR_ID_DELL,    0xb097) },
 	{ USB_DEVICE(VENDOR_ID_ASUS,    0x1976) },
 	{}
 };
diff --git a/include/linux/usb/r8152.h b/include/linux/usb/r8152.h
index 33a4c146dc19..2ca60828f28b 100644
--- a/include/linux/usb/r8152.h
+++ b/include/linux/usb/r8152.h
@@ -30,6 +30,7 @@
 #define VENDOR_ID_NVIDIA		0x0955
 #define VENDOR_ID_TPLINK		0x2357
 #define VENDOR_ID_DLINK			0x2001
+#define VENDOR_ID_DELL			0x413c
 #define VENDOR_ID_ASUS			0x0b05
 
 #if IS_REACHABLE(CONFIG_USB_RTL8152)
-- 
2.39.5

