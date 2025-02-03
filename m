Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81CC17BD3;
	Mon,  3 Feb 2025 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572519; cv=none; b=gib+su9awpBsEi+9Cp4fQhivdr328Nz+zN+AowIx8Zeg6aS2mMi7rJHwLmR7vQLtEmOXf1eL1xrw/j0Dyi5goCmWsMuY+K4U7BpftzL0dCGnny5ckUxJCG3MV8itibnQHfqjXSIwuoQ0tkY7XbvHea8Nmx3DY+fMlBJeSqqmirw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572519; c=relaxed/simple;
	bh=kudHkmXRsDkWGztqg0iWjZgX6lkgeJyEjsCOY6NMUyE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lw4klVpAPOTd4WwAJD+py9e2YXf2+bpsaiJ6Z0G4j/9hnWq6Og/8/tlHk1qhUVx/TNg04iPld4jWNr7p6c32l7SpXWa6VCpVZHrMLD9tsPbm3XP7hP5hcrC5+o/bCUtYMD48Ttywn6dOeCa8KwdhX5u56SqaWqcaFfl/fzxch5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7SwE50u; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7SwE50u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738572518; x=1770108518;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kudHkmXRsDkWGztqg0iWjZgX6lkgeJyEjsCOY6NMUyE=;
  b=C7SwE50u8RpkFarxI4YwksKLm5EcXDrEhqRmQkUSy9JUfnWiaGaLOHHC
   6NQW8qA7DYisW2MUTz5J+z0mDWxVxtvBackTSabT7cqo0JkxDf+bUmCfk
   kXfel0kI9V6sDzzv8mUVQPoqoomp7Qxktnbg3S2eIOViUVZoiAU3WH+0f
   Ce/OHJKRusmJ7F5Z58ueJTg3cOBxg3jbri+PSDto/AiGqcU326lyjjYEk
   8ddzLCqvtwEM7V2c71ZCV4LTE9oaPnCBiT6FplTIk/xnwVz3EsyreSm8N
   KCXiaf1PDXG1DZOmQue6ee3BQHv1YyIEjVcixYfu/sqbWe/aenruy8Cdl
   Q==;
X-CSE-ConnectionGUID: dCF2maFRS8e0kCTqSnG4Kw==
X-CSE-MsgGUID: Eb0ZdyRNQ/WkQEq8lZiqnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38960733"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38960733"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:48:37 -0800
X-CSE-ConnectionGUID: 1UD1+lJTSZOK70nrOqOuog==
X-CSE-MsgGUID: LcDJRP8AQoCqOO+BwNdhUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110675830"
Received: from apgcp0h572501.png.altera.com ([10.244.73.227])
  by orviesa007.jf.intel.com with ESMTP; 03 Feb 2025 00:48:34 -0800
From: Boon Khai Ng <boon.khai.ng@intel.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tien Sung Ang <tien.sung.ang@intel.com>
Cc: Tien Sung Ang <tien.sung.ang@altera.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Boon Khai Ng <boon.khai.ng@intel.com>
Subject: [PATCH v1] USB: serial: ftdi_sio: add support for Altera USB Blaster 3
Date: Mon,  3 Feb 2025 16:48:22 +0800
Message-Id: <20250203084822.18356-1-boon.khai.ng@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Altera on board USB Blaster 3 utilizes a FT2232 and FT4232
chip.

Add VID/PID for the on board USB Blaster 3 so it can be used
as a serial device via ftdi_sio.

Signed-off-by: Boon Khai Ng <boon.khai.ng@intel.com>
---
 drivers/usb/serial/ftdi_sio.c     | 14 ++++++++++++++
 drivers/usb/serial/ftdi_sio_ids.h | 13 +++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index e07c5e3eb18c..3edce9c62213 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1079,6 +1079,20 @@ static const struct usb_device_id id_table_combined[] = {
 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
 	/* GMC devices */
 	{ USB_DEVICE(GMC_VID, GMC_Z216C_PID) },
+	/* Altera USB Blaster 3 */
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_6022_PID, 1) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_6025_PID, 2) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_6026_PID, 2) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_6026_PID, 3) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_6029_PID, 2) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_602A_PID, 2) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_602A_PID, 3) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_602C_PID, 1) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_602D_PID, 1) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_602D_PID, 2) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_602E_PID, 1) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_602E_PID, 2) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ALTR_UB3_VID, ALTR_UB3_602E_PID, 3) },
 	{ }					/* Terminating entry */
 };
 
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index 5ee60ba2a73c..673e0cf84bdc 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -1612,3 +1612,16 @@
  */
 #define GMC_VID				0x1cd7
 #define GMC_Z216C_PID			0x0217 /* GMC Z216C Adapter IR-USB */
+
+/*
+ *  Altera USB Blaster 3 (http://www.altera.com).
+ */
+#define ALTR_UB3_VID			0x09fb
+#define ALTR_UB3_6022_PID		0x6022
+#define ALTR_UB3_6025_PID		0x6025
+#define ALTR_UB3_6026_PID		0x6026
+#define ALTR_UB3_6029_PID		0x6029
+#define ALTR_UB3_602A_PID		0x602A
+#define ALTR_UB3_602C_PID		0x602C
+#define ALTR_UB3_602D_PID		0x602D
+#define ALTR_UB3_602E_PID		0x602E
-- 
2.25.1

