Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686FA252295
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039371; cv=none; b=My5oXUjySOsMiX1WMiX4z+xd3Kj+R4unmsZreRPUKT3YNJie2OEs42CcMVbTleN4F/zLSf1IuqXEVUtBpUV+z/baPz7Cnyi9VuHoCRFZTcWCn0J3vPkHYlVwhsKGWRz46oWpE4kH7SrBq+ALTEhcaI0O/OriZw9GottoWEIIbcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039371; c=relaxed/simple;
	bh=qb2IsYSQmLLLKdcyr0dhshT0CIs3hy85Pfrju2/okvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bgPAwLTm4PFWRR9gu9W5/n97FFZWaOjMxot0E1czq2pKCdLo2D5a9hjbdJXuAljl1sSWc/pzmEMcGXyHGw4gMQzOs1vTfuKCTIGQXH9l34Je39l6WQRFKkDPKHIqiIblVGi8UPzIWBGzqKERREreTzgzAaa7nQaNIAi5HJONFXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M0eFwaAZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M0eFwaAZ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54acc0cd458so8317418e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749039366; x=1749644166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMJRjZ4qL/tvILSJe2gN3C50PVnnmdOg1JfvMI0lfRc=;
        b=M0eFwaAZLuM95X8w4hQhyn1gMgbzNw8Rf95rHy4MkRlc7sN1u3duvIuINzCBnx6u5a
         lL0J6pL6nl3ZbLdWitKgruGjhONp0cidWIV5v/tQqSOmfrWChgjH3KOrUYHCZzUrQfKH
         A0ZNcWHcgplpLYkvowgtDrirwpkNDpdpAqBMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039366; x=1749644166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMJRjZ4qL/tvILSJe2gN3C50PVnnmdOg1JfvMI0lfRc=;
        b=AGd4o+jNMT0f7A1PU4XVL61FeYduVJXUBVjsRZgE4lS8cnpWUy6UYVfUBvDMo63oHn
         hcraR4G/+VE5XQqJT5r2XmJKXBqEThpuSZC7uHmUN24Vw8pAqp9o3BnoW2VysBJ6QT8/
         cINm2Xu+QsrCvrekmQbfHfN2uXaCCeP4vmOTpM/lGSXD+vVY/K+2M1qClrYIYGm/adc9
         6m+xunVE20+8jw50YZoX/3vZ+MHMfBfLIBqsr3HVePxp+oyYVNn1vt3F5bBgSDjq84eM
         Y8PRHrIPXx5IVTMWfB3ldUYR9jKJBdWHhH8kVgqshqCtNzCrgB8C4qfQhm/MGhTUqHX7
         st7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXw4pCb44UTrvkC9zsDvpFG4bSUqaMPK2RHR2wWwdSgOFNI7t3yRt0OzoMr851SO6a3kpIsPDlZNx5ewGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXkUDOHJmE9HjjAUHVpwHI2dCy3I8HJg1FO3J4Cqm71ElGMNCZ
	8ry5btGfCoK5icKNvbjPbWTjjHipYTMAU/5TGx3/oHNVVpUfA8mS/w77pAtQXNiK8au3vHu2kYI
	UWFw=
X-Gm-Gg: ASbGncvHgvSUFdXkQSLpmje6wgP08HhFHR4T+OlRFUZzGaGCXYP+AXMTumsmEI3niaL
	d64o5QhXGvh6WxACBqGYXAYFPHHnhc6e+p2fDh3ohASq+a/NPRF3VkEC43gZ59O42vkNlWiMZnp
	Zfnp0a1slK9TJ+jZuIFIyDFSOImSED0rsOphlFDeyZsFtSv/un0kDKqJKNslhaoWoz/9biliG9L
	6oWpGbB3kvH7IvcnY/pbtd+VLua6bG+WHV8rP8yJsxXybC0R+1ERI2Jlz/Ky2xqO/xZ5UgTDvx1
	bRcP2jRkD3w5x2hgfsFN3wdxu2P/OnyL/bEZ1Fzk0w8nk6cNxkdjDYgWxsFZvA6Cy8KI+CfRKnT
	aRwXrjxIwFscnGnAPjmD/SbhAvCmtIx9PfT+p
X-Google-Smtp-Source: AGHT+IE+7NzqkeD+ZSyHu/dQA5YK9mbS7I0/oekl8u6s5H7/C/PTVU979D4mgOjItWdWoshdoyZQ+g==
X-Received: by 2002:a05:6512:39c4:b0:553:2480:230b with SMTP id 2adb3069b0e04-55356aea00cmr772720e87.22.1749039366427;
        Wed, 04 Jun 2025 05:16:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a12ecsm2289134e87.90.2025.06.04.05.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:16:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 04 Jun 2025 12:16:05 +0000
Subject: [PATCH v6 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-uvc-meta-v6-4-7141d48c322c@chromium.org>
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
In-Reply-To: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

If the camera supports the MSXU_CONTROL_METADATA control, auto set the
MSXU_META quirk.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 72 ++++++++++++++++++++++++++++++++++++
 include/linux/usb/uvc.h              |  3 ++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index df3f259271c675feb590c4534dad95b3b786f082..cd58427578ff413591b60abe0a210b90802dddc7 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/usb.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 
 #include <media/v4l2-ioctl.h>
@@ -188,11 +189,82 @@ static const struct v4l2_file_operations uvc_meta_fops = {
 	.mmap = vb2_fop_mmap,
 };
 
+static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
+
+static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
+{
+	struct uvc_entity *entity;
+
+	list_for_each_entry(entity, &dev->entities, list) {
+		if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
+			return entity;
+	}
+
+	return NULL;
+}
+
+#define MSXU_CONTROL_METADATA 0x9
+static int uvc_meta_detect_msxu(struct uvc_device *dev)
+{
+	u32 *data __free(kfree) = NULL;
+	struct uvc_entity *entity;
+	int ret;
+
+	entity = uvc_meta_find_msxu(dev);
+	if (!entity)
+		return 0;
+
+	/*
+	 * USB requires buffers aligned in a special way, simplest way is to
+	 * make sure that query_ctrl will work is to kmalloc() them.
+	 */
+	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	/* Check if the metadata is already enabled. */
+	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
+			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+	if (ret)
+		return 0;
+
+	if (*data) {
+		dev->quirks |= UVC_QUIRK_MSXU_META;
+		return 0;
+	}
+
+	/*
+	 * We have seen devices that require 1 to enable the metadata, others
+	 * requiring a value != 1 and others requiring a value >1. Luckily for
+	 * us, the value from GET_MAX seems to work all the time.
+	 */
+	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
+			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+	if (ret || !*data)
+		return 0;
+
+	/*
+	 * If we can set MSXU_CONTROL_METADATA, the device will report
+	 * metadata.
+	 */
+	ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
+			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+	if (!ret)
+		dev->quirks |= UVC_QUIRK_MSXU_META;
+
+	return 0;
+}
+
 int uvc_meta_register(struct uvc_streaming *stream)
 {
 	struct uvc_device *dev = stream->dev;
 	struct video_device *vdev = &stream->meta.vdev;
 	struct uvc_video_queue *queue = &stream->meta.queue;
+	int ret;
+
+	ret = uvc_meta_detect_msxu(dev);
+	if (ret)
+		return ret;
 
 	stream->meta.format = V4L2_META_FMT_UVC;
 
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -29,6 +29,9 @@
 #define UVC_GUID_EXT_GPIO_CONTROLLER \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+#define UVC_GUID_MSXU_1_5 \
+	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
+	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
 
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

