Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4215D1D61AA;
	Mon, 19 May 2025 02:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622055; cv=none; b=Zwe70cPjG0P9crwCx8ELg2TCdpYdkPgk36RAxjMnabdEqMjxTDVtPD/C5cyEGIT5zryQ9XpubjtrOtJdmpRsZaI/XAw5TTHN/q7pvO/uQtVR/RdUhHy6uk/LcwskcFz45llUkmxId2h/OVY4J1iOXYxo/2EvuenaDSgc8zWl6j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622055; c=relaxed/simple;
	bh=vrWV6CdUjkdMudY/6D9yjaVRVSi84iL045dU7vGgs4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Va7ncdorRpaNkei5BtCVCuDw1XNcwaCynsnxj61PTWmOojOnSplak06Fil6nzHYG+U00mOve3xq1ahV/U5dr/iC+2kRoyBUyBFKFMRFH30n3EyoL1KK4nohJQ7g4zPE0WI/lIEEjS1IHoPO6TUKXqPSZd6cvSZN+OcBF2KLSMd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso3876890b3a.2;
        Sun, 18 May 2025 19:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747622050; x=1748226850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iegr4EZ/f05pfjGH9FJD0MeaTXrr47iqo7rRy4qL9t0=;
        b=l9zTKuOqS9lptpBtqTl5MIq89DAvzzAqt7na/iDGtA/His08gLA/ijlHq9/kD403lI
         5DzwXfPyeP1CYYlgImM98TGl05sOqY2dyeoEiUkNaNeXpe8uLpb7nsHr/vTgF9WOgsTr
         gMzdxgfUy6Ij3PXuPcAHmBzlqFJPzHnqcMBJ4c5UBc5PmlRBta5ooGKPxZzN1+NpuHPC
         0UeJCAFciUQ8lk09n6PlCLeppxo06GWwxrpgdS7bDEUtCNBZvA0Uis7sbEnBhs9Afz4A
         Te3EC1E9g2GZ/H3pYoWYbeyjV2msPMObhB5njO+gciIYa0mIxF7lWLtcURraQ0EhYDTz
         D8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXmY3DkgMNarFOVDa5euvpRDnwhzT40LII7qzP8Xw4JFYDIGZKfCgm48A/rV4Vo417+zTVlPoGGaNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVqreZ6L1CSf52aLaXQjk9X9Z73kuAmzGcaFB8yoxc2e93tiL2
	SYViIYxBriqciwK4n7QtqNYKKYd661nb0FTby2UR6E2IrjaLhD/rnnnB
X-Gm-Gg: ASbGncvhsi4YPEtQd6OqdSAElbYvQwsO8AEtoXfnbniGEnN0Fkde+CvbtbWYpwaadah
	Q3QxjFtO76tvG7UPai2o/QZ+Qj/4qZ930yVOe72F3Ijr3ipHF8WV/b+rVUUMV/FwyPO6bmP+52l
	cTG/8+jMr0UuJX3NBeUxR0S+gmFNZ4m88dCYCc+nUiwAe/IMqxB73vD2M04JnKa5QBJ329OlSan
	ZstNeGlWQ9AK5ttfplx7gyX1eANqgTzNLJCdSNjUlbjZBDUIXhMuNLTAFi1TlOj5FszFM10QZcY
	Jddz/ZQQ91+yl0OUkfJLb0XorNMPztc5CUt/eXDisOhsyv60caQXwPalKIkR0L65WyxXxd/VCDt
	CSLQ=
X-Google-Smtp-Source: AGHT+IGG6Vuf9DbN6OKREIqR1aQomQx1V5H4A2HHUgKbG4iE6BXxz/5J+n5d8GNjZfqfN1AZuVs1eA==
X-Received: by 2002:a05:6a00:2401:b0:736:532b:7c10 with SMTP id d2e1a72fcca58-742a98b4b2cmr16549983b3a.21.1747622050229;
        Sun, 18 May 2025 19:34:10 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876dcdsm5296595b3a.138.2025.05.18.19.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 19:34:09 -0700 (PDT)
From: xiehongyu1@kylinos.cn
To: stern@rowland.harvard.edu
Cc: linux-kernel@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH v1] usb: storage: Ignore UAS driver for SanDisk 3.2 Gen2 storage device
Date: Mon, 19 May 2025 10:33:28 +0800
Message-Id: <20250519023328.1498856-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

SanDisk 3.2 Gen2 storage device(0781:55e8) doesn't work well with UAS.
Log says,
[    6.507865][ 3] [  T159] usb 2-1.4: new SuperSpeed Gen 1 USB device number 4 using xhci_hcd
[    6.540314][ 3] [  T159] usb 2-1.4: New USB device found, idVendor=0781, idProduct=55e8, bcdDevice= 0.01
[    6.576304][ 3] [  T159] usb 2-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    6.584727][ 3] [  T159] usb 2-1.4: Product: SanDisk 3.2 Gen2
[    6.590459][ 3] [  T159] usb 2-1.4: Manufacturer: SanDisk
[    6.595845][ 3] [  T159] usb 2-1.4: SerialNumber: 03021707022525140940
[    7.230852][ 0] [  T265] usbcore: registered new interface driver usb-storage
[    7.251247][ 0] [  T265] scsi host3: uas
[    7.255280][ 0] [  T265] usbcore: registered new interface driver uas
[    7.270498][ 1] [  T192] scsi 3:0:0:0: Direct-Access     SanDisk  Extreme Pro DDE1 0110 PQ: 0 ANSI: 6
[    7.299588][ 3] [  T192] scsi 3:0:0:1: Enclosure         SanDisk  SES Device       0110 PQ: 0 ANSI: 6
[    7.321681][ 3] [  T192] sd 3:0:0:0: Attached scsi generic sg1 type 0
[    7.328185][ 3] [  T192] scsi 3:0:0:1: Attached scsi generic sg2 type 13
[    7.328804][ 0] [  T191] sd 3:0:0:0: [sda] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    7.343486][ 0] [  T191] sd 3:0:0:0: [sda] 4096-byte physical blocks
[    7.364611][ 0] [  T191] sd 3:0:0:0: [sda] Write Protect is off
[    7.370524][ 0] [  T191] sd 3:0:0:0: [sda] Mode Sense: 3d 00 10 00
[    7.390655][ 0] [  T191] sd 3:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
[    7.401363][ 0] [  T191] sd 3:0:0:0: [sda] Optimal transfer size 1048576 bytes
[    7.436010][ 0] [  T191]  sda: sda1
[    7.450850][ 0] [  T191] sd 3:0:0:0: [sda] Attached SCSI disk
[    7.470218][ 4] [  T262] scsi 3:0:0:1: Failed to get diagnostic page 0x1
[    7.474869][ 0] [    C0] sd 3:0:0:0: [sda] tag#0 data cmplt err -75 uas-tag 2 inflight: CMD
[    7.476911][ 4] [  T262] scsi 3:0:0:1: Failed to bind enclosure -19
[    7.485330][ 0] [    C0] sd 3:0:0:0: [sda] tag#0 CDB: Read(10) 28 00 00 00 00 28 00 00 10 00
[    7.491593][ 4] [  T262] ses 3:0:0:1: Attached Enclosure device
[   38.066980][ 4] [  T192] sd 3:0:0:0: [sda] tag#4 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD IN
[   38.076012][ 4] [  T192] sd 3:0:0:0: [sda] tag#4 CDB: Read(10) 28 00 00 00 01 08 00 00 f8 00
[   38.086485][ 4] [  T192] sd 3:0:0:0: [sda] tag#3 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
[   38.095515][ 4] [  T192] sd 3:0:0:0: [sda] tag#3 CDB: Read(10) 28 00 00 00 00 10 00 00 08 00
[   38.104122][ 4] [  T192] sd 3:0:0:0: [sda] tag#2 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD IN
[   38.113152][ 4] [  T192] sd 3:0:0:0: [sda] tag#2 CDB: Read(10) 28 00 00 00 00 88 00 00 78 00
[   38.121761][ 4] [  T192] sd 3:0:0:0: [sda] tag#1 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD IN
[   38.130791][ 4] [  T192] sd 3:0:0:0: [sda] tag#1 CDB: Read(10) 28 00 00 00 00 48 00 00 30 00
[   38.139401][ 4] [  T192] sd 3:0:0:0: [sda] tag#0 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD
[   38.148170][ 4] [  T192] sd 3:0:0:0: [sda] tag#0 CDB: Read(10) 28 00 00 00 00 28 00 00 10 00
[   38.178980][ 2] [  T304] scsi host3: uas_eh_device_reset_handler start
[   38.901540][ 2] [  T304] usb 2-1.4: reset SuperSpeed Gen 1 USB device number 4 using xhci_hcd
[   38.936791][ 2] [  T304] scsi host3: uas_eh_device_reset_handler success

Device decriptor is below,
Bus 002 Device 006: ID 0781:55e8 SanDisk Corp. SanDisk 3.2 Gen2
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x0781 SanDisk Corp.
  idProduct          0x55e8
  bcdDevice            0.01
  iManufacturer           1 SanDisk
  iProduct                2 SanDisk 3.2 Gen2
  iSerial                 3 03021707022525140940
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
        bEndpointAddress     0x82  EP 2 IN
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
        bEndpointAddress     0x01  EP 1 OUT
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
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
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
        bEndpointAddress     0x82  EP 2 IN
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
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x002a
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x0000f41e
      BESL Link Power Management (LPM) Supported
    BESL value     1024 us
    Deep BESL value    61440 us
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000001
      Sublink Speed Attribute count 1
      Sublink Speed ID count 0
    wFunctionalitySupport   0x1100
    bmSublinkSpeedAttr[0]   0x000a4030
      Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[1]   0x000a40b0
      Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0000
  (Bus Powered)

So ignore UAS driver for this device.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index d460d71b42578..1477e31d77632 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -52,6 +52,13 @@ UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
 
+/* Reported-by: Zhihong Zhou <zhouzhihong@greatwall.com.cn> */
+UNUSUAL_DEV(0x0781, 0x55e8, 0x0000, 0x9999,
+		"SanDisk",
+		"",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: Hongling Zeng <zenghongling@kylinos.cn> */
 UNUSUAL_DEV(0x090c, 0x2000, 0x0000, 0x9999,
 		"Hiksemi",
-- 
2.25.1

