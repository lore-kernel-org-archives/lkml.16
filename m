Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B5D27AC45
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145993; cv=none; b=VkDBWtEteRax+rjXV8+/e0cuLGzzFdisFlrtbK0aa/irF3HwbqPLn+SMvDK9QEDtLLEmEkOA4w/R5ix0rm+FcraLlBF/aPXJOgIwuW1TAx1hPn5e8D3g4o2IIqhmUTpuLFz2KW0t0q/pGYxFkOUw4xeiK+eVRl6S8bkY2FRV9x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145993; c=relaxed/simple;
	bh=PckKnFSxOg9GYZ2RgDdQ7TbT8exqy29AY7cJP+o5vh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSsjep6y7Fyy4z96jUsmlk4IsErgiC30VY+FTVVws5+nB184ZFKuIMx2MZmkmQpneFtA327Kl7X6iMphpwsiIDbuK86ooTpe+VhS+a5zAS/P202xwvO+7T3iLXm0zOMQVuvN/5EXUDPB8i1BgFQZf8qZUS6nJp8q512g3hF/4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AXZKedNF; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AXZKedNF"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55324e35f49so1352527e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145987; x=1749750787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6tUr6JaXE+CWPBqDdD3JjkYCAuszK1ZF5ibIukQa9c=;
        b=AXZKedNF/G3j/7ahIQ3xMkuJHynm3huVck4ebXW2msBXnWHZ4y6l5Z4Q6jX5MBCD5w
         JMhm0d1C2F3mOOY5JC7R7OklPZY/zSa/oRO7AudWwFW5pDBZDGucJIk8c+V+Lxtc/itz
         iX4Qftq/xbpEErzOlFl3CllZsBCuL1DN1Hacw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145987; x=1749750787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6tUr6JaXE+CWPBqDdD3JjkYCAuszK1ZF5ibIukQa9c=;
        b=efRVFX7uKv4INv7dAaHDB7hBVhMe25/E2Da7wlB/Mk8NLjY0e0oMqbNhWtwWAD4dDe
         ZdegvE/IXjkQaWIFCvZ+sxj7hS82qVN1MePG264o6HMHN0H/mUgebdehePkxoL/Kv0wX
         5/JytdsuCpb63bxTqxQ+mWgOm8enf7kn0b1WtF0o01q2WLkoRtgvk6VqOSwobXtrKsgg
         WfAW5GRcQKLNaHKn3tRuTt/YHYkZvIu+pxpYjMIMDlWAEvs6IR072eXY1h0DnEKQ+Qdc
         2Qm1fqeCeXhhi9X/Zt2ZZY0NBibAq32ftoHBwmP8Tp1gldNPDlsh0G5MpJU+W/z5j27V
         L77w==
X-Forwarded-Encrypted: i=1; AJvYcCXSr0aZuI58aBAyFPnmRjTzF18MiAP8lsbI0LW9gPzFm5e6MlS00OM5K+3jotzAisr1rIiVsZXyFAY7o/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz//o1+3gpijPGoYZLzk/dfSJsODWEHzSauvU3rqagT4ba1I12W
	7M9mXdP11uYMmhvSTAJa3SLoQLgYueDLkZu/mxiSB0VPpmkX5PyY2gm/YstD5ATyaVBwgygRGjv
	Mzgs=
X-Gm-Gg: ASbGncsQrl0oUn6ycx+sgUtzUM18FBMKgSz0NgzkrQoJs67ZSNYOIb6aCfn7tav1Svp
	r/Nmy1gv4i0H0IO+2FOpatG7mlLprF3e3sP5xg7Nc6OlnO+JZknsXKmeuWvQqDlEjRT7sGZy52u
	p5cuHa30TyP783Bm+KgJfHZzPPkKgVyZXjeOfPcI0/UXyA325m/3UOg4hQyaLrHg0PePLvTzjp+
	ITTaifCpJGkRGM36MEbH0CvzTV5UUnB9QbaNUFLsZV0tbmWjNxNDjEROHfad1yrX6UFlg00eTLS
	FTVuOWyI79VPsh6Zpua7nWYJ4BUeIX6AXctNYf5pZlmIc2aXhuRwiz5IUOoZ4Hn6J5PnPymaEvh
	hhVc9TKWIZeThTQibgQ7pmzS9Ew==
X-Google-Smtp-Source: AGHT+IE78QhzN066PWs7vNhzkflF4XTGNMukn6K/7Yeg2fkW1EQLVSK/ScBTu0hitshAPAesP+ysdA==
X-Received: by 2002:a05:6512:31d0:b0:553:23c4:6825 with SMTP id 2adb3069b0e04-55366bf07a4mr19063e87.19.1749145986843;
        Thu, 05 Jun 2025 10:53:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:53:01 +0000
Subject: [PATCH v2 08/12] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ORIENTATION
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-8-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Fetch the orientation from the fwnode and map it into a control.

The uvc driver does not use the media controller, so we need to create a
virtual entity, like we previously did with the external gpio.

We do not re-purpose the external gpio entity because its is planned to
remove it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/Makefile       |  3 +-
 drivers/media/usb/uvc/uvc_ctrl.c     | 21 +++++++++++
 drivers/media/usb/uvc/uvc_driver.c   | 14 +++++--
 drivers/media/usb/uvc/uvc_entity.c   |  1 +
 drivers/media/usb/uvc/uvc_swentity.c | 73 ++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h     | 14 +++++++
 include/linux/usb/uvc.h              |  3 ++
 7 files changed, 125 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..b4398177c4bb0a9bd49dfd4ca7f2e933b4a1d7df 100644
--- a/drivers/media/usb/uvc/Makefile
+++ b/drivers/media/usb/uvc/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
-		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
+		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
+		  uvc_swentity.o
 ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
 uvcvideo-objs  += uvc_entity.o
 endif
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 47e8ccc39234d1769384b55539a21df07f3d57c7..b2768080c08aafa85acb9b7f318672c043d84e55 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -376,6 +376,13 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_GET_DEF
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	{
+		.entity		= UVC_GUID_SWENTITY,
+		.selector	= 0,
+		.index		= 0,
+		.size		= 1,
+		.flags		= UVC_CTRL_FLAG_GET_CUR,
+	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -975,6 +982,17 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
 		.name		= "Region of Interest Auto Ctrls",
 	},
+	{
+		.id		= V4L2_CID_CAMERA_ORIENTATION,
+		.entity		= UVC_GUID_SWENTITY,
+		.selector	= 0,
+		.size		= 8,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+		.menu_mask	= GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
+					  V4L2_CAMERA_ORIENTATION_FRONT),
+	},
 };
 
 /* ------------------------------------------------------------------------
@@ -3210,6 +3228,9 @@ static int uvc_ctrl_init_chain(struct uvc_video_chain *chain)
 		} else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
 			bmControls = entity->gpio.bmControls;
 			bControlSize = entity->gpio.bControlSize;
+		} else if (UVC_ENTITY_TYPE(entity) == UVC_SWENTITY_UNIT) {
+			bmControls = entity->swentity.bmControls;
+			bControlSize = entity->swentity.bControlSize;
 		}
 
 		/* Remove bogus/blacklisted controls */
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index bcc97f71fa1703aea1119469fb32659c17d9409a..96eeb3aee546487d15f3c30dfe1775189ddf7e47 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1869,11 +1869,15 @@ static int uvc_scan_device(struct uvc_device *dev)
 		return -1;
 	}
 
-	/* Add GPIO entity to the first chain. */
-	if (dev->gpio_unit) {
+	/* Add virtual entities to the first chain. */
+	if (dev->gpio_unit || dev->swentity_unit) {
 		chain = list_first_entry(&dev->chains,
 					 struct uvc_video_chain, list);
-		list_add_tail(&dev->gpio_unit->chain, &chain->entities);
+		if (dev->gpio_unit)
+			list_add_tail(&dev->gpio_unit->chain, &chain->entities);
+		if (dev->swentity_unit)
+			list_add_tail(&dev->swentity_unit->chain,
+				      &chain->entities);
 	}
 
 	return 0;
@@ -2249,6 +2253,10 @@ static int uvc_probe(struct usb_interface *intf,
 	if (ret < 0)
 		goto error;
 
+	ret = uvc_swentity_init(dev);
+	if (ret < 0)
+		goto error;
+
 	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
 		 udev->product ? udev->product : "<unnamed>",
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index cc68dd24eb42dce5b2846ca52a8dfa499c8aed96..d1a652ef35ec34801bd39a5124b834edf838a79e 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -106,6 +106,7 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
 		case UVC_EXTERNAL_VENDOR_SPECIFIC:
 		case UVC_EXT_GPIO_UNIT:
+		case UVC_SWENTITY_UNIT:
 		default:
 			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
 			break;
diff --git a/drivers/media/usb/uvc/uvc_swentity.c b/drivers/media/usb/uvc/uvc_swentity.c
new file mode 100644
index 0000000000000000000000000000000000000000..702a2c26e029a0655dade177ed2a9b88d7a4136d
--- /dev/null
+++ b/drivers/media/usb/uvc/uvc_swentity.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *      uvc_swentity.c  --  USB Video Class driver
+ *
+ *      Copyright 2025 Google LLC
+ */
+
+#include <linux/kernel.h>
+#include <linux/usb/uvc.h>
+#include <media/v4l2-fwnode.h>
+#include "uvcvideo.h"
+
+static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
+				u8 cs, void *data, u16 size)
+{
+	if (size < 1)
+		return -EINVAL;
+
+	switch (entity->swentity.props.orientation) {
+	case V4L2_FWNODE_ORIENTATION_FRONT:
+		*(u8 *)data = V4L2_CAMERA_ORIENTATION_FRONT;
+		break;
+	case V4L2_FWNODE_ORIENTATION_BACK:
+		*(u8 *)data = V4L2_CAMERA_ORIENTATION_BACK;
+		break;
+	default:
+		*(u8 *)data = V4L2_CAMERA_ORIENTATION_EXTERNAL;
+	}
+
+	return 0;
+}
+
+static int uvc_swentity_get_info(struct uvc_device *dev,
+				 struct uvc_entity *entity, u8 cs, u8 *caps)
+{
+	*caps = UVC_CONTROL_CAP_GET;
+	return 0;
+}
+
+int uvc_swentity_init(struct uvc_device *dev)
+{
+	static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
+	struct v4l2_fwnode_device_properties props;
+	struct uvc_entity *unit;
+	int ret;
+
+	ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
+	if (ret)
+		return dev_err_probe(&dev->intf->dev, ret,
+				     "Can't parse fwnode\n");
+
+	if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
+		return 0;
+
+	unit = uvc_alloc_entity(UVC_SWENTITY_UNIT, UVC_SWENTITY_UNIT_ID, 0, 1);
+	if (!unit)
+		return -ENOMEM;
+
+	memcpy(unit->guid, uvc_swentity_guid, sizeof(unit->guid));
+	unit->swentity.props = props;
+	unit->swentity.bControlSize = 1;
+	unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
+	unit->swentity.bmControls[0] = 1;
+	unit->get_cur = uvc_swentity_get_cur;
+	unit->get_info = uvc_swentity_get_info;
+	strscpy(unit->name, "SWENTITY", sizeof(unit->name));
+
+	list_add_tail(&unit->list, &dev->entities);
+
+	dev->swentity_unit = unit;
+
+	return 0;
+}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index dc23d8a97340dc4615d4182232d395106e6d9ed5..a931750bdea25b9062dcc7644bf5f2ed89c1cb4c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -19,6 +19,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-fh.h>
 #include <media/videobuf2-v4l2.h>
+#include <media/v4l2-fwnode.h>
 
 /* --------------------------------------------------------------------------
  * UVC constants
@@ -41,6 +42,9 @@
 #define UVC_EXT_GPIO_UNIT		0x7ffe
 #define UVC_EXT_GPIO_UNIT_ID		0x100
 
+#define UVC_SWENTITY_UNIT		0x7ffd
+#define UVC_SWENTITY_UNIT_ID		0x101
+
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */
@@ -242,6 +246,12 @@ struct uvc_entity {
 			int irq;
 			bool initialized;
 		} gpio;
+
+		struct {
+			u8  bControlSize;
+			u8  *bmControls;
+			struct v4l2_fwnode_device_properties props;
+		} swentity;
 	};
 
 	u8 bNrInPins;
@@ -617,6 +627,7 @@ struct uvc_device {
 	} async_ctrl;
 
 	struct uvc_entity *gpio_unit;
+	struct uvc_entity *swentity_unit;
 };
 
 enum uvc_handle_state {
@@ -836,4 +847,7 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
 size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			    size_t size);
 
+/* swentity */
+int uvc_swentity_init(struct uvc_device *dev);
+
 #endif
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index bce95153e5a65613a710d7316fc17cf5462b5bce..88a23e8919d1294da4308e0e3ca0eccdc66a318f 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -29,6 +29,9 @@
 #define UVC_GUID_EXT_GPIO_CONTROLLER \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+#define UVC_GUID_SWENTITY \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04}
 
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \

-- 
2.50.0.rc0.642.g800a2b2222-goog

