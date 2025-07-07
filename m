Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940A427A133;
	Mon,  7 Jul 2025 06:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869527; cv=none; b=hwiWuod//o/kDGdMimDljHOEd6ZTtjrYXjdflXGtxaxOzEHcMbe1l8Otd1kysVEcH8tAaowD2wub49g3dbXSZafRnuGbr6MHGHrziEM9V4EF4T7ADjoFCHQQ4Ik12d+EOke9s7uwVe6Z8WfctrKvwCchGlRCc/qawBm9TSFCHFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869527; c=relaxed/simple;
	bh=lM2DuIe34CkuCqHJfBwgWH9QOXhXCNxY+VK24HKHdyM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L8Euua4iiL0hA52nazUfMGeTFbJ3+MB0TBxhoArT0Yw4FGFwM1s1js5lj2kf3O0gJaBTy9UC7xkt0Gu2irtye7VTa6ZpLpsLiCjTUapXQE2LRpPrVE7p+n1B5t/YI2OfJlRw7rJjqf88X9kC09fodfHh67MP77loJPlG352rk8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 23ac22025afb11f0b29709d653e92f7d-20250707
X-CID-CACHE: Type:Local,Time:202507071421+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:fe940fa5-7c5a-4393-883e-f952b1e2ed44,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:a89bb9339ef263cf28470a568dae0229,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 23ac22025afb11f0b29709d653e92f7d-20250707
X-User: dengjie03@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1156005567; Mon, 07 Jul 2025 14:25:13 +0800
From: Jie Deng <dengjie03@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	Jie Deng <dengjie03@kylinos.cn>
Subject: [PATCH v2] usb: storage: Ignore UAS driver for SanDisk Extreme Pro 55AF storage device
Date: Mon,  7 Jul 2025 14:25:07 +0800
Message-Id: <20250707062507.39531-1-dengjie03@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2025070422-punctured-opal-f51e@gregkh>
References: <2025070422-punctured-opal-f51e@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SanDisk Extreme Pro 55AF storage device(0781:55af) has poor compatibility with UAS drivers.
The logs:
[    1.359859][ 0] [  T163] usb 2-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[    1.385708][ 0] [  T163] usb 2-1: New USB device found, idVendor=0781, idProduct=55af, bcdDevice=10.85
[    1.385709][ 0] [  T163] usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
[    1.385710][ 0] [  T163] usb 2-1: Product: Extreme Pro 55AF
[    1.385711][ 0] [  T163] usb 2-1: Manufacturer: SanDisk
[    1.385711][ 0] [  T163] usb 2-1: SerialNumber: 323234323935343030343636
[    1.927603][ 0] [  T306] usbcore: registered new interface driver usb-storage
[    1.940511][ 0] [  T306] scsi host3: uas
[    1.940584][ 0] [  T306] usbcore: registered new interface driver uas
[    1.940843][ 0] [  T188] scsi 3:0:0:0: Direct-Access     SanDisk  Extreme Pro 55AF 1085 PQ: 0 ANSI: 6
[    1.941363][ 0] [  T188] scsi 3:0:0:1: Enclosure         SanDisk  SES Device       1085 PQ: 0 ANSI: 6
[    1.941697][ 0] [  T188] sd 3:0:0:0: Attached scsi generic sg0 type 0
[    1.941783][ 0] [  T188] scsi 3:0:0:1: Attached scsi generic sg1 type 13
[    1.942296][ 0] [  T189] sd 3:0:0:0: [sda] 1953459617 512-byte logical blocks: (1.00 TB/931 GiB)
[    1.942373][ 0] [  T189] sd 3:0:0:0: [sda] Write Protect is off
[    1.942374][ 0] [  T189] sd 3:0:0:0: [sda] Mode Sense: 37 00 10 00
[    1.942534][ 0] [  T189] sd 3:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
[    1.943586][ 0] [  T189] sd 3:0:0:0: [sda] Optimal transfer size 2097152 bytes
[    1.976797][ 0] [  T189]  sda: sda1
[    1.977898][ 0] [  T189] sd 3:0:0:0: [sda] Attached SCSI disk
[    1.980406][ 0] [  T267] scsi 3:0:0:1: Failed to get diagnostic page 0x1
[    1.980408][ 0] [  T267] scsi 3:0:0:1: Failed to bind enclosure -19
[    1.980414][ 0] [  T267] ses 3:0:0:1: Attached Enclosure device
[    1.981068][ 0] [    C0] sd 3:0:0:0: [sda] tag#10 data cmplt err -75 uas-tag 1 inflight: CMD
[    1.981071][ 0] [    C0] sd 3:0:0:0: [sda] tag#10 CDB: Read(10) 28 00 74 6f 6d 00 00 00 08 00
[   33.819186][ 0] [  T188] sd 3:0:0:0: [sda] tag#10 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD
[   33.819188][ 0] [  T188] sd 3:0:0:0: [sda] tag#10 CDB: Read(10) 28 00 74 6f 6d 00 00 00 08 00
[   33.843186][ 0] [  T309] scsi host3: uas_eh_device_reset_handler start

Device decriptor is below:
Bus 002 Device 003: ID 0781:55af SanDisk Corp. Extreme Pro 55AF
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x0781 SanDisk Corp.
  idProduct          0x55af
  bcdDevice           10.85
  iManufacturer           2 SanDisk
  iProduct                3 Extreme Pro 55AF
  iSerial                 1 323234323935343030343636
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              896mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)

So ignore UAS driver for this device.

Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
---
v2:
	* According to the file modification rules (sort by VendorID 
	  first, then by ProductID.) Add the newly added "UNUSUAL_DEV" 
	  in the correct position.
v1:
	* The newly added "UNUSUAL_DEV" was directly added to the end 
	  without modifying the format according to the file.

---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 1477e31d7763..6b1a08e2e724 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -52,6 +52,13 @@ UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
 
+/* Reported-by: Jie Deng <dengjie03@kylinos.cn> */
+UNUSUAL_DEV(0x0781, 0x55af, 0x0000, 0x9999,
+		"SanDisk",
+		"Extreme Pro 55AF",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: Zhihong Zhou <zhouzhihong@greatwall.com.cn> */
 UNUSUAL_DEV(0x0781, 0x55e8, 0x0000, 0x9999,
 		"SanDisk",
-- 
2.25.1

