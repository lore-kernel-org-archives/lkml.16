Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBE5191F6A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748667; cv=none; b=TUsN18Tao/zr8JNnwcyyPEsvkWb+rGsihBC8N9Mdi/aM2RIe8gC62JkA5/SGabDso3rQtrah3qhkE8PM56e5ABZXXPatdYSayMhd1cFooD1AZtTrK9KkPMHXeCZXiPTI398Z5R/Diq/29m76QLYMPhOp1afjgXShMtkvTIkF/ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748667; c=relaxed/simple;
	bh=+KkdZxdqvHIlFaUxnw0T/2vUmNZjxcvggpVmgCAVYT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLBGPynJ85fPRY4ehtk4YOjFoBW8EMjAS4NgSrg7JOiVpmTEhz5Wpfq1jmovfqsJq8favCBMvcOXenphQbCbT/mFebyrLUbvJJNv9393mww9jgul1dDs5wnrynBqIfqA1w+FbGYXfSpfXec5HWgz7uD8JfuZpj6FcUodZeowxJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ivw09rEs; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ivw09rEs"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b0d638e86so1920185e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743748664; x=1744353464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfKei41NeiW8d42lUMUhoCILXY12OhST2R+tJl7Txyg=;
        b=Ivw09rEsNhTPbGfMN+6Geejw3Q802OsZA1khp0IBkRAmpKdoAmk2HFu3eldwrvCX/R
         dCoUrZDs/g/Rz7lIvc8N9w/CxUqgNlmyJCZfNnVBkvRX6fqIZm/OYHQqm/PGtEZwyynF
         0cWFp36qnWUrTFHtBv14OdYQOaak+BKZUA59Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748664; x=1744353464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfKei41NeiW8d42lUMUhoCILXY12OhST2R+tJl7Txyg=;
        b=oYNO5fm1gt1OlsB+DqUyapkeSOPJyszP6a6Y0Yt6y3Gb/qjg/8ODsjAvM6UPQ4CPNm
         vVrDGIVy0GhEfB677EDvFfHRhHjwFF65dQkR/g17RPr+JAxfQ3nMjl4QZBBD6p/bJ4oz
         AXJavTp1/6aUsdFHalMR5M38mStNRoDItMJz8o6SYQRrPvdePDP83/2JWGKjgqCMQXXf
         HQkdsCaGP4mh3P0Z+YZejlvloQw1kJTM9nFskn2lSIcrSHd636NHgpz5YLlSq22T/GhX
         lUnImUrSx3QBxjR/6R+w7N/7VsaATe7n2jUp9vKLqFSPYOf1oKLlClf2oseaEUqlO27W
         vggw==
X-Forwarded-Encrypted: i=1; AJvYcCUJfhZLjdPpDcU/J4U+wfDB0LJwvNgKSTfRXaMT+GaI6Tuw3vgAF3erPBwTeDMU/8rFwGjbfjGA1rTh6qw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+kdTqD9xe/4NFlGgCp360oHxumUScPuVAfyryJpPA1LXQ7Taz
	hO0J+F0+/2yT97m6nMYHnclZWNoTOjajd5ckNxAaSBrg4/bId/afeKZ9PBZgLQ==
X-Gm-Gg: ASbGncuJ+hverge5FX45Zk6avVmJCkiiZnblPg+7BbGvQfAqrxeQeby2gDgU59vhHuM
	JJ6uWUIhUCwU1E45QSKjtjuJjRZB2BSpzB/h+vOYM/AbjgbsRXZ9az7msbE2EqBJRuccQcvSscQ
	d+m+sjPjO1CmHh53aZiWp1d2qLxhddmoprCJxXth4eiCg6ZOyz9nIuFd+Wl+gHev1dlgiR60o0/
	1WdOeDgUm0xPF01WSOBRbahyDCkyVMF2x2Wkq8O5C75G0+MtSq4NHtzLh6HnE+7RYd6Df2cyaw6
	CFCyNendZHcLMtaf6kJ5aiYYS6HSSFPluUaSlTmkRD1+xBaQd6NqYX1aR/jSLvKlfSqcKgG/dRq
	/ntNfiWMqfKOTwUsL1DTYAdXm8NdVqKYkUm4=
X-Google-Smtp-Source: AGHT+IGiEq5HAfK9gznqpOik3UfipLmtacM6oeNSqlOetaI/lji+MiW2P1IKEgszzXgZO7Lyb2+qvQ==
X-Received: by 2002:a05:6512:3da1:b0:545:2871:7cd5 with SMTP id 2adb3069b0e04-54c22776fc6mr564255e87.15.1743748663628;
        Thu, 03 Apr 2025 23:37:43 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672444sm338275e87.251.2025.04.03.23.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:37:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 04 Apr 2025 06:37:37 +0000
Subject: [PATCH v5 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-uvc-meta-v5-4-f79974fc2d20@chromium.org>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
In-Reply-To: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

If the camera supports the MSXU_CONTROL_METADATA control, auto set the
MSXU_META quirk.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 54 ++++++++++++++++++++++++++++++++++++
 include/linux/usb/uvc.h              |  3 ++
 2 files changed, 57 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index fe2678fc795d7fd5a64e8113199012f34c419176..776d280f34afad515594a873acf075acf0438304 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/usb.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 
 #include <media/v4l2-ioctl.h>
@@ -187,11 +188,64 @@ static const struct v4l2_file_operations uvc_meta_fops = {
 	.mmap = vb2_fop_mmap,
 };
 
+static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
+
+#define MSXU_CONTROL_METADATA 0x9
+static int uvc_enable_msxu(struct uvc_device *dev)
+{
+	u32 *data __free(kfree) = NULL;
+	struct uvc_entity *entity;
+
+	list_for_each_entry(entity, &dev->entities, list) {
+		int ret;
+
+		if (memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
+			continue;
+
+		if (!data)
+			data = kmalloc(sizeof(*data), GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+
+		ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id,
+				     dev->intfnum, MSXU_CONTROL_METADATA,
+				     data, sizeof(*data));
+		if (ret)
+			continue;
+
+		if (*data) {
+			dev->quirks |= UVC_QUIRK_MSXU_META;
+			return 0;
+		}
+
+		ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id,
+				     dev->intfnum, MSXU_CONTROL_METADATA,
+				     data, sizeof(*data));
+		if (ret || !*data)
+			continue;
+
+		ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id,
+				     dev->intfnum, MSXU_CONTROL_METADATA,
+				     data, sizeof(*data));
+		if (!ret) {
+			dev->quirks |= UVC_QUIRK_MSXU_META;
+			return 0;
+		}
+	}
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
+	ret = uvc_enable_msxu(dev);
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
2.49.0.504.g3bcea36a83-goog

