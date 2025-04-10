Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CFC8BEA;
	Thu, 10 Apr 2025 02:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744253709; cv=none; b=glrkLVvwLMG4J4HC7jaV476bbtKRXIAb4KQejb733QdsVYCMlDs1YjH7nQy2lAlPv8EDeT9wSxQzEloe+OHvTIqWsXW5c0sbHxG9eiNpYigqF4NNkH1lfzradCRmVYmfb0riLkpLt+3Gw62aHkD/kZC/Twwk/g4PqviRO4fJk0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744253709; c=relaxed/simple;
	bh=ntJDYlFgj9fz/wJJAGnGgdBadWpsnZOLS8ysbhL8i3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kk6abV9civcKe2rkLJTyu6aP7X+hGF2zPu5QMlB1yzBDsPck43DIz2Gm4GG3Vhv4rIl8K8r0q/knNRcqVSHMb2XdhQ2Z7AmnuEMoGK5rU6oBv3xoiTLg2xagjNSRaL3EUSHAoza4kC75TmNpzEnzR7dg2YkZVMQBqoZ0l7e8gHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LNeURRFM; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LNeURRFM"
Received: from canonical.com (118-163-61-247.hinet-ip.hinet.net [118.163.61.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 38FDA3F10A;
	Thu, 10 Apr 2025 02:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744253190;
	bh=Tn+OooYTtNSV3ykkQzsFSQ8UTaiB3yu7GZAh112kkm0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=LNeURRFMFkUfySNzGo257C6TakvvNYZqKVASj1swinz6sC5cz1AC08KWWjMa3+3E1
	 +yM2463DZG4ZoGwVWbzCA1I+iL0DCJBW8In9/UP7+VjZrKhm5eOjYu+xrfPl39GjDa
	 GcOPb1+AxGZLw1qayfPT7WkKQCFSa+MMeiMNFkCTAzFjvvqCAYi3H4eBx35Y/DhmTv
	 HYB+X2G8FSftvgkI4hCdrG5UYvSD7pfvUp7x2Kr7GZU9lG9yPhIQhZ7Ba9LH3XIL4t
	 e0jAc+gxWPuBRcOo2j+XiatLzG4OKLh1P/TG73DSF26IlKX+5uvoV6QvJd8dH68y6Y
	 9xVt8+9UuyKNQ==
From: Ivan Hu <ivan.hu@canonical.com>
To: gregkh@linuxfoundation.org,
	krzysztof.kozlowski@linaro.org,
	limiao@kylinos.cn,
	wangyuli@uniontech.com,
	jinxiaobo@uniontech.com,
	huanglei@kylinos.cn,
	mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: quirks: Add quirk to prefer vendor-specific configuration
Date: Thu, 10 Apr 2025 10:46:26 +0800
Message-Id: <20250410024626.981215-1-ivan.hu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some USB devices with multiple configurations expose a vendor-specific
interface class that should be preferred by default. However, the generic
usb_choose_configuration() logic selects the first configuration whose
first interface uses a non-vendor-specific class, which can lead to
incomplete or limited functionality.

Introduce a new quirk, USB_QUIRK_CHOOSE_VENDOR_SPEC_CFG, which
instructs the USB core to prefer a configuration that contains a
vendor-specific interface class when multiple configurations are present.

Apply this quirk to the ASIX AX88179 USB Ethernet adapter
(0x0b95:0x1790), which requires selecting its vendor-specific
configuration for full functionality, instead of falling back to
cdc_ncm.

Signed-off-by: Ivan Hu <ivan.hu@canonical.com>
---
 drivers/usb/core/generic.c | 15 +++++++++++++++
 drivers/usb/core/quirks.c  |  3 +++
 include/linux/usb/quirks.h |  3 +++
 3 files changed, 21 insertions(+)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index 9c6ae5e1198b..19bf35ede5a0 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -23,6 +23,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/string_choices.h>
 #include <uapi/linux/usb/audio.h>
+#include <linux/usb/quirks.h>
 #include "usb.h"
 
 static int is_rndis(struct usb_interface_descriptor *desc)
@@ -155,6 +156,20 @@ int usb_choose_configuration(struct usb_device *udev)
 			continue;
 		}
 
+		/* This quirk forces the selection of a vendor-specific
+		 * interface class configuration when multiple configurations
+		 * are present.
+		 */
+		if (num_configs > 1 &&
+			udev->descriptor.bDeviceClass ==
+						USB_CLASS_PER_INTERFACE &&
+				udev->quirks & USB_QUIRK_CHOOSE_VENDOR_SPEC_CFG
+				&& (desc && desc->bInterfaceClass ==
+						USB_CLASS_VENDOR_SPEC)) {
+			best = c;
+			break;
+		}
+
 		/* When the first config's first interface is one of Microsoft's
 		 * pet nonstandard Ethernet-over-USB protocols, ignore it unless
 		 * this kernel has enabled the necessary host side driver.
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 8efbacc5bc34..1e0e05cb29df 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -565,6 +565,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* INTEL VALUE SSD */
 	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
 
+	/* ASIX AS88179 */
+	{ USB_DEVICE(0x0b95, 0x1790), .driver_info = USB_QUIRK_CHOOSE_VENDOR_SPEC_CFG },
+
 	{ }  /* terminating entry must be last */
 };
 
diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
index 59409c1fc3de..1f73bfc191f0 100644
--- a/include/linux/usb/quirks.h
+++ b/include/linux/usb/quirks.h
@@ -75,4 +75,7 @@
 /* short SET_ADDRESS request timeout */
 #define USB_QUIRK_SHORT_SET_ADDRESS_REQ_TIMEOUT	BIT(16)
 
+/* force selection of vendor-specific configuration*/
+#define USB_QUIRK_CHOOSE_VENDOR_SPEC_CFG	BIT(17)
+
 #endif /* __LINUX_USB_QUIRKS_H */
-- 
2.34.1

