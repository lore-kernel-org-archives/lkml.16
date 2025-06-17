Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367312CCDE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171360; cv=none; b=rGUWheyh1+bCbwBuuItst04nmuTd1zOvbS82zx1nb+lZoPCZcGKJwUSgQef23BYkqWjXL13mbCH8pPCsTmYI7EcwLkuOpgtHj7PLLtolGPeq1oqb19UuV9EJkdF6LPTrd4UbyORN1wXfMzauy3WpIIim3NeqP4fZ33On/G5xl9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171360; c=relaxed/simple;
	bh=J3RMIWij4olJIZvhHBis/MZpmxz342SGDI+rntvCR3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KnJfXHKRxgk2kZo3jFQyxR10NqpJmRoctRrD2/qhyPjr1FfoEUgJtwyo0vNkgugU1anusvwzoS1t5QGafVTEZnhWhEyQkFvoPI9kwHbn8bNf33Jz2I30G4tfLgf7m28PCPh1Ef1Fhnhx1W2UilsYvEYE+rNdi3CloyGY8WovYmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a4jBjP9f; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a4jBjP9f"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553644b8f56so5987647e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171355; x=1750776155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwBKWLCDONZ1Mqgm0XmcqesVTqC7UAS+k/XRYW3pzKs=;
        b=a4jBjP9fsRF6nntaJwVgxMNYnAEKt2tgnqf+Y9opzaYtMNqL3Fd73zMctIdkzoae05
         GUfrm6hER7ybG3bH2RfaCkAyr4j48tMHpKXcwSDJxlCK2acH7NNXMxAK0Zg/QGYB9DK+
         y5hwHAof0BMgHD3AV/LxcXfX5V9vGfbChLXxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171355; x=1750776155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwBKWLCDONZ1Mqgm0XmcqesVTqC7UAS+k/XRYW3pzKs=;
        b=qXsZmLQocYJ5BFxIT08Dm1fmiA2BEZkfH8ehs57/ei53lYFtdrml+hQCgrOFq7T8Wg
         J/g3V4yyCNUADXe4uCM1n+JySr3cvP580DrU8i6PFLFPvnwkglrlya+X2fTVegHTxp0u
         gLLkXuG8uWKWdAiQraagOQh5v5FQeBsXn+UsaA7LUlhc78BlDs5ZDbfMUniJayr/lx4D
         Tql137uQndl02YSuBVJWa3EuttdTH6Kc9N1Sx+hjY8baMg8Tpqgjz6lZ5oXdcVLGjie8
         4LtGUsgASH5AfZNJ/6A5VDwfuLRYgAN16JyYMy2f9pqE1Sv4g0ciKy+ovlGupKgcQQxB
         35ww==
X-Forwarded-Encrypted: i=1; AJvYcCX3Y0+Vwea/k2/PsldR1jByc7gY9ojHB18kAR7IHxjVBqr7E6E9y3yPWDHrfrDguKme0et5x8C6uuK/+oU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/9MdWnDeoCnucPR9AG/VIngTxfTk7QtamcVmxhZif6pmY4D9
	5DHXSnv3YfSTw0XKQyHSB013KAuX7RbZvQ4oerJTse3ZpZjsfssBRfVi0i/7hpYfJw==
X-Gm-Gg: ASbGncsO4knjJ2S9kEPM9SOK+DpKWKF2/6ivNXEXGgKbNQRuIJc14k7ghFwnXkCbMvD
	8zA6dPanR20f1mcZvAEZknHCcp/8WgRpBI/rcf0igU0zuA42SLxFXcIsn7VuoOZ/hE/nMu4+2Bj
	hQG1euK4lpZHEoCry3a+SoP5TtqhVdH7CIb+qxMVsUULlcYGIItp918zEYQPOrQNrJJ/jL4WgEa
	Ju5plsqCArrSrL+9SrJkJ4WtsYYdVa28xyR/jG6AwwIobaNpT/SBnfa8FCExoq9pTz/Ru8KvQc6
	A1cviXym8n9J8ht9qyz7anIKPMJbI0IDsw3IUv7xm0SMceMgq6lvKE5RZBj0kjvRthzCuRU+M38
	0Uwbcu12FJEpRnw/Pii1UMyeYj25ISkRWjXcUx4D3Tw==
X-Google-Smtp-Source: AGHT+IHTAtFnky+kYSniVlDKGuaCPlXNADAnSZ6a7R69ZvRqK5HmhgT/JD2sTazuhQ0dI0Lbnlp1+w==
X-Received: by 2002:a05:6512:39c3:b0:553:23f9:bb3b with SMTP id 2adb3069b0e04-553b6f43089mr3171505e87.49.1750171354955;
        Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 14:42:26 +0000
Subject: [PATCH v7 5/5] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-uvc-meta-v7-5-9c50623e2286@chromium.org>
References: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
In-Reply-To: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

If the camera supports the MSXU_CONTROL_METADATA control, auto set the
MSXU_META quirk.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 71 ++++++++++++++++++++++++++++++++++++
 include/linux/usb/uvc.h              |  3 ++
 2 files changed, 74 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index b09f81d907d64f7d7a3b0dc52de319879b7e68be..5c3e0f8c5b720a2b962ae82470b836f870dc64b6 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/usb.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 
 #include <media/v4l2-ioctl.h>
@@ -166,6 +167,71 @@ static const struct v4l2_file_operations uvc_meta_fops = {
 	.mmap = vb2_fop_mmap,
 };
 
+static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
+{
+	static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
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
@@ -195,6 +261,11 @@ int uvc_meta_init(struct uvc_device *dev)
 	static const u32 ms_format[] = {V4L2_META_FMT_UVC,
 					V4L2_META_FMT_UVC_MSXU_1_5, 0};
 	bool support_msxu;
+	int ret;
+
+	ret = uvc_meta_detect_msxu(dev);
+	if (ret)
+		return ret;
 
 	support_msxu = dev->quirks & UVC_QUIRK_MSXU_META;
 
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
2.50.0.rc2.692.g299adb8693-goog

