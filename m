Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1481E0E0B;
	Fri, 20 Jun 2025 03:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750391882; cv=none; b=FL1WHdhHOcrvlCGJ2H15bP66N7q6Oz5u+AWtU/Blwq/O6CSJ0VAFJlkHJVRo1PWVr1HiRNMX9ZEIsqS+vZ61sHFvJZ8fKVISS9hG3Y3BrPAQ7vAM+/qp0CGlq+c4yOSkl7TrEPAIGFGUqlFFmz2dP+HhjomHu/upKAPFSaAIhWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750391882; c=relaxed/simple;
	bh=mGGH4+LX20Lz7gjk338dFdf0YY/zBMdmlsAb6Bg5GUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R/f19KnUOVSlp8tg+GKgT1kyowCcXh9nMjpJ/3oKmbLX+v+sre+D/n2o7UDOcLzrsiRUkav2Pi4N9mr2q9VYVGI1SJrSc3o1lbiqTM+wIyZUn7Yo9OV9BzOLUfOuy319Bbg3WtAmU/7bpHE0/yV6eWaEVoyFYSMNjythgQx79pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kbYkHeQF; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kbYkHeQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=v1
	MY5svTzooeYXZdwoxm/E1bt38bsGX5VCg90q6L8DA=; b=kbYkHeQFzyirDC/h4P
	O0QzhmnGUEfpaPqH2zEdqnEqM4ZhPGO/SrwBIqzZb1Uo5cOcrLcpTKLZWk3iewSm
	/BRuskOFEhCiqHL+onFQphMiuMnQrpA9kSqQ29hq6E3xnUnN+LjVio25O/3g/Hc0
	/N11HMhQ+X/Cu9IUhR9Eph/70=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnz7so3FRoiipkAg--.27513S2;
	Fri, 20 Jun 2025 11:57:29 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] USB: serial: option: add Foxconn T99W640
Date: Fri, 20 Jun 2025 11:57:21 +0800
Message-Id: <20250620035721.6450-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnz7so3FRoiipkAg--.27513S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur4kJFWUurWDZr47CF4Durg_yoW8Kr1xpF
	4UJFWavFZ5Xa4YgF9Ikrn7ZayFgan3Wry2gasrXw4SqFWSyws7J34UArWSgrnF9r4Syr4q
	vr4qk3y8GF97JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRfcT9UUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiMBxyZGhUvGMQoAABso

T99W640 is designed based on Qualconn SDX72 chip. There are 3
serial ports to be enumerated: Diag, NMEA and AT.

Test evidence as below:
T:  Bus=04 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=ef(misc ) Sub=02 Prot=01 MxPS= 9 #Cfgs=  1
P:  Vendor=0489 ProdID=e167 Rev=05.15
S:  Manufacturer=QCOM
S:  Product=SDXPINNL USB WWAN Adapter
S:  SerialNumber=cc1f1d92
C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=896mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=85(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=88(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms

0&1: MBIM, 2:Modem, 3:GNSS(non-serial port), 4: NMEA, 5:Diag

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 27879cc57536..c0c44e594d36 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2343,6 +2343,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe145, 0xff),			/* Foxconn T99W651 RNDIS */
 	  .driver_info = RSVD(5) | RSVD(6) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe167, 0xff),                     /* Foxconn T99W640 MBIM */
+	  .driver_info = RSVD(3) },
 	{ USB_DEVICE(0x1508, 0x1001),						/* Fibocom NL668 (IOT version) */
 	  .driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
 	{ USB_DEVICE(0x1782, 0x4d10) },						/* Fibocom L610 (AT mode) */
-- 
2.25.1

