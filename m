Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEBC2550B7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154898; cv=none; b=J24wwo5/Dmbi2yOgBZCcMAoqHkT2GGvSST0j4L7hEUYg0M1urCVpyEMpb19tubm+X+hHGtoHdxIKEq73XiYySHJNQweDiFsXIQSJmvW14eYWPlDQcptOycxQkIgnMr+8c06JKFRUIPiVt5jLGvYvVDE4/70dzb6M55QCd1iNAAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154898; c=relaxed/simple;
	bh=FIXpaJ6I+Mj5XP0JpNbIDUHSehFYUEVKGCS8FJGfwvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DOxKqvbTrS0YNBuEzvUAPGSpqzZVI3lKHTEtQutETfWuHZwG414ZPSFW93MNN9paWSTC2QR/uj2aYZ1ffDKdT3vKQemsELQHSS2zp4oE++SBjq2ggWVYaYSMlkEr+iPSW5O4GoLL8UaiKGrCJZCI7ZPR9I899eByPE9Mt7HS3m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hesling.com; spf=pass smtp.mailfrom=hesling.com; dkim=pass (2048-bit key) header.d=hesling.com header.i=@hesling.com header.b=ayGtHOBO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hesling.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hesling.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hesling.com header.i=@hesling.com header.b="ayGtHOBO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so4739753a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hesling.com; s=google; t=1744154896; x=1744759696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cm4FPLMOh2GauL3WSiMT61Z/Hhcdt4AG8xN7ZzrRPu0=;
        b=ayGtHOBO39iXooGWmho9861ucbqob/fhYhD1K22SqS+qi0NKX10zQg5oamODiPS2Oo
         fjFowlkfky6N2hhb38VOQ/CP1RIByLrGg5K1sgdZT1cSauqzKJ1jp2XoCyNjGMJ6s7+y
         L+vLxgn/v2s5RUBvfEo/Lc6iBDtcxjgyvvXGvoNwOTV3I5lljreuEk+XGs4/hX8M6p/M
         2SDFUBbntK6BOrmOoKeGH4rbEhBhhJkyKgT02sCP9PjIAGPlnW7zfbCl79V8qC+8I1by
         L9++svHJxRo1a6vVy3k3NFSiOk8Y2etzGcBNuzXvWeoECQcoACJwSsZg9YYZMMJKKrpV
         90sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154896; x=1744759696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cm4FPLMOh2GauL3WSiMT61Z/Hhcdt4AG8xN7ZzrRPu0=;
        b=b2DOAQpAXrAcjLXHt7mFJGKpm5F+dRhrZed0P1n5bQ9p94lkW38DQzwhM2kO4WdHFt
         ujmqCZYbkhoZLMnmuavqiYmyNW6GlfqNaz7neLzrd71GuFWNoywJr03dUZ6e3heCN9HY
         LCqpcA5ObNSgFiVepnGca1J12Lcbb7ynoL5BK4+zYCDBCU/4t6289vtX7uFbLefTcCal
         a5znVsrF+KwXhGw9XofpF+ttdFU9qG5HvDNWZE+mCI3Q9JaStWthSxbdOhkoiI7YbgOq
         fw2UuTreMPCHiRjwVYT5qIywv64buvLgcVHtyvLjv61N+BVFbGEaRRMgVXpH6SVO/VmU
         MMRA==
X-Gm-Message-State: AOJu0Yyl43qCFuaaUT6xPtoJjY+qfZ/JkAbetD4c9ENcdkSHwNklj+eE
	jjMPuq68LfmknWBI1w/jVhejzye6mTSJkKKVJ3FuMT2NQtZrKXbiKTCWBgbpsr4=
X-Gm-Gg: ASbGncvsWAj2pbQlfUnrfYLlv2spQKl9gwUIIZkmwzUrLC4yd8fvejNGWq3WRChNTFv
	kGWkODrh+74ELeYhaMaLX6X6cb4c4AUnIL8h9r7SEKIRuWo3bmDF4J5+GKyL9mvR4g5Dr2PVqxd
	Pq3YNC8B354H5Q+paAmPvDRxOkDnQO6/rKYBIONxO9YBQLps873TDiFnzYPdwmkL25ZJSFvGMHZ
	VIBGdiP1xvQM9Q028GthpPHxo8OSGvm47Rupgi//hCI38ElEhhxwlj4MXtd3rk/uQl0zBa6v/D5
	/Fcg/1rqXeOMrrTsXuWDVLqItMNw7FgCWmvPC2xF53KjUL0wbf+Qdpv3rm3fhA5tG/ePv9+c
X-Google-Smtp-Source: AGHT+IFnuCdRZgsYnenjFUjCSOcjgtIvg6cUe/e+MOCCQ/pJrUIV7Ecz0sNeENBlkdUngQcW73qsmg==
X-Received: by 2002:a17:90b:5344:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-306dbc3e090mr1134561a91.30.1744154895773;
        Tue, 08 Apr 2025 16:28:15 -0700 (PDT)
Received: from craigwork.rex-boga.ts.net ([2601:646:300:8200:7c1c:b43d:f21e:5a79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d980645asm11134521b3a.74.2025.04.08.16.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:28:15 -0700 (PDT)
From: Craig Hesling <craig@hesling.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	sboyd@kernel.org,
	craig@hesling.com
Subject: [PATCH] USB: serial: simple: add OWON HDS200 series oscilloscope support
Date: Tue,  8 Apr 2025 16:27:03 -0700
Message-ID: <20250408232703.954945-1-craig@hesling.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add serial support for OWON HDS200 series oscilloscopes and likely
many other pieces of OWON test equipment.

OWON HDS200 series devices host two USB endpoints, designed to
facilitate bidirectional SCPI. SCPI is a predominately ASCII text
protocol for test/measurement equipment. Having a serial/tty interface
for these devices lowers the barrier to entry for anyone trying to
write programs to communicate with them.

The following shows the USB descriptor for the OWON HDS272S running
firmware V5.7.1:

Bus 001 Device 068: ID 5345:1234 Owon PDS6062T Oscilloscope
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x5345 Owon
  idProduct          0x1234 PDS6062T Oscilloscope
  bcdDevice            1.00
  iManufacturer           1 oscilloscope
  iProduct                2 oscilloscope
  iSerial                 3 oscilloscope
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0029
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         5 Physical Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
      ** UNRECOGNIZED:  09 21 11 01 00 01 22 5f 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval              32
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval              32
Device Status:     0x0000
  (Bus Powered)

OWON appears to be using the same USB Vendor and Product ID for many
of their oscilloscopes. Looking at the discussion about the USB
vendor/product ID, in the link bellow, suggests that this VID/PID is
shared with VDS, SDS, PDS, and now the HDS series oscilloscopes.
Available documentation for these devices seems to indicate that all
use a similar SCPI protocol, some with RS232 options. It is likely that
this same simple serial setup would work correctly for them all.

Link: https://usb-ids.gowdy.us/read/UD/5345/1234
Signed-off-by: Craig Hesling <craig@hesling.com>
---
 drivers/usb/serial/usb-serial-simple.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/serial/usb-serial-simple.c b/drivers/usb/serial/usb-serial-simple.c
index 2c12449ff60c..a0afaf254d12 100644
--- a/drivers/usb/serial/usb-serial-simple.c
+++ b/drivers/usb/serial/usb-serial-simple.c
@@ -100,6 +100,11 @@ DEVICE(nokia, NOKIA_IDS);
 	{ USB_DEVICE(0x09d7, 0x0100) }	/* NovAtel FlexPack GPS */
 DEVICE_N(novatel_gps, NOVATEL_IDS, 3);
 
+/* OWON electronic test and measurement equipment driver */
+#define OWON_IDS()			\
+	{ USB_DEVICE(0x5345, 0x1234) } /* HDS200 oscilloscopes and others */
+DEVICE(owon, OWON_IDS);
+
 /* Siemens USB/MPI adapter */
 #define SIEMENS_IDS()			\
 	{ USB_DEVICE(0x908, 0x0004) }
@@ -134,6 +139,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
 	&motorola_tetra_device,
 	&nokia_device,
 	&novatel_gps_device,
+	&owon_device,
 	&siemens_mpi_device,
 	&suunto_device,
 	&vivopay_device,
@@ -153,6 +159,7 @@ static const struct usb_device_id id_table[] = {
 	MOTOROLA_TETRA_IDS(),
 	NOKIA_IDS(),
 	NOVATEL_IDS(),
+	OWON_IDS(),
 	SIEMENS_IDS(),
 	SUUNTO_IDS(),
 	VIVOPAY_IDS(),

base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
-- 
2.47.2

