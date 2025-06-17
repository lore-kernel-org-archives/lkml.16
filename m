Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E12DBF63
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171361; cv=none; b=odhnsg3e+j9gkVXRK8oK9HoR35qjYK3HZBMy/3TrSUGjb4H8bkEPCvmMNekbdWpV5sasjL9IguSTN0OsUGqkGr0l5Aa7Hdfxq5Cac+9tPuGJ9zZnXrq16onxEDNVlkjfldqzQpkGUf/SkIty32/X4Rpw4aRn94moHFIsPwU6D6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171361; c=relaxed/simple;
	bh=VUOlaRTP4eV8iVL8FnrRm8GJrgvq6sOIU/fSE8Vhe4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O36gn/K1EBKl/HlkmZAlCZKz+M17ioX6EOWHGkG71gox8RtjTjrT2mnYt28AMx5EjSGaWBBxESBN01bJSYZiWhjahsHj8/ZSU/weSMM5YMXdavRZQxIvaBih9pvwgcWiNxzKRyS/75QamD03O4xCna/pysgjJqr6+lPRjcDdGDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nMkrDL9b; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nMkrDL9b"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5535652f42cso5780793e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171354; x=1750776154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XZ3dPW1w4QCfr6i2hU3GgbqSe/1fko3hczMWWZK2cI=;
        b=nMkrDL9b9Aj7W8cXp2+ZfjIEl5ySuRlEw4JPa/03Y/hMzsdGfFCB/w8B8LbzxOM950
         7qs9YofkJX+euJXtcvSirPTjpQMa03Qd5cXJA9zP+XvJ4htR27F7lsSHiwxcxD6JGu0Y
         MDdQYZgjeIsINT/VlnShBn/WM6YfJbzYMtiaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171354; x=1750776154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XZ3dPW1w4QCfr6i2hU3GgbqSe/1fko3hczMWWZK2cI=;
        b=OKF1wuMMqEhnvYAnwlXyuj7enXUMSDaa61dyj760M9lvX3lPffs9Ke3NWXPOFFRmEf
         KbNhMvOtPDZREssKupjB5m/OnOiJ3SuxablR48Wpr/eAsdPcdr+kyvGMEndaak3JUCHd
         I2Y+jofEoELucDvmsiGTSe6lpNLCm45EB9fabs689QAb46Eiaw3Ese1YUKePuOH6xofS
         30EVjZ6Ypaz+6gCb9TIj6Ah3QRhpf8afjdoeZFamts7H1pyU5RK/wnwUPKJ9rBkrM8yw
         pK5ckt/9T3obho9TH6sWa8HjqweoNCQyOdLuYnQL3kd1DiLjN3xgRSPAUnZrsDNgrSFA
         3jHg==
X-Forwarded-Encrypted: i=1; AJvYcCVxWPuo0P994ATcv2JXuqIb2OZVQJJPUjt8FsBwjbJyHhjpwpGmBx1Jn0Y4MWAyWMvbpx5H4SZL5lvLibM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzhIIWC/utMPwk9zuVaSQG75sd4Tpa/7HCvQ2N1tKyYPbcmLw
	0MkvZa5HXv7Yksv+C9jP19tnUsR0l0qFcIPDMs4IxyATUfVE2SKRJkylLjPbz4srJYnCJUUFdo6
	sLz0=
X-Gm-Gg: ASbGncvHxXSTtjbrjp4VCikTztEqrNubhRurwzyJ2B664fvcmkmKYtq361luTXq38sn
	VKb6oZqrSI/qVblKyRRlXdQea96rlat6EZBFH9JKYBvOIB+T3pDWEYhKpi1NibrgpZRkMkOlCKo
	KfMbVE8EeFe34oybJwEhsVnkL9L2vyuvI7DKvgsdMMlxbYLa55Z+7wvDL2gqjrTrFLiW/EvbeRq
	FCIYuxv8Ss/pdS68GAx/UROdNH53u8gmkmqooCvWlfo5M9hBuJwPPowVpMhTc88OrdNpsRz3+Xb
	pzmsOlPoX6SGLgEMiOngNcPM78xaT/pk/yQpdu2aZ/6g5d6dhme8xZWzlmAUhm+ayIjh32kxanZ
	N8tZ9fTyHQmjdVRsWWOrJ10e0GOGOHC3XSyxH+pitTQ==
X-Google-Smtp-Source: AGHT+IG1sZuE/Nfhe9B34FOf/eWJmAMXL0Jv1BzWgBFgKFKiF4bV662uimtyRZWQUXOB9gPR6hlDog==
X-Received: by 2002:a05:6512:3b9d:b0:553:37e7:867a with SMTP id 2adb3069b0e04-553b6f4d01bmr3097555e87.49.1750171354119;
        Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 14:42:24 +0000
Subject: [PATCH v7 3/5] media: uvcvideo: Introduce dev->meta_formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-uvc-meta-v7-3-9c50623e2286@chromium.org>
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

Right now, there driver supports devices with one or two metadata
formats. Prepare it to support more than two metadata formats.

This is achieved with the introduction of a new field `meta_formats`,
that contains the array of metadata formats supported by the device, in
the order expected by userspace.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c   |  7 ++++++
 drivers/media/usb/uvc/uvc_metadata.c | 46 ++++++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h     |  2 ++
 3 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 62eb45435d8bec5c955720ecb46fb8936871e6cc..9de5abb43e19d9e876cddc5d7124592953db89ac 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2315,6 +2315,13 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 	}
 
+	ret = uvc_meta_init(dev);
+	if (ret < 0) {
+		dev_err(&dev->udev->dev,
+			"Error initializing the metadata formats (%d)\n", ret);
+		goto error;
+	}
+
 	if (dev->quirks & UVC_QUIRK_NO_RESET_RESUME)
 		udev->quirks &= ~USB_QUIRK_RESET_RESUME;
 
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 82de7781f5b6b70c5ba16bcba9e0741231231904..bc84e849174397f41d1e20bf890a876eeb5a9c67 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -64,14 +64,20 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 	struct uvc_device *dev = stream->dev;
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
 	u32 fmeta = fmt->dataformat;
+	u32 i;
 
 	if (format->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
+	for (i = 0; (fmeta != dev->meta_formats[i]) && dev->meta_formats[i];
+	     i++)
+		;
+	if (!dev->meta_formats[i])
+		fmeta = V4L2_META_FMT_UVC;
+
 	memset(fmt, 0, sizeof(*fmt));
 
-	fmt->dataformat = fmeta == dev->info->meta_format
-			? fmeta : V4L2_META_FMT_UVC;
+	fmt->dataformat = fmeta;
 	fmt->buffersize = UVC_METADATA_BUF_SIZE;
 
 	return 0;
@@ -112,17 +118,21 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 	struct v4l2_fh *vfh = file->private_data;
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
-	u32 index = fdesc->index;
+	u32 i;
+
+	if (fdesc->type != vfh->vdev->queue->type)
+		return -EINVAL;
 
-	if (fdesc->type != vfh->vdev->queue->type ||
-	    index > 1U || (index && !dev->info->meta_format))
+	for (i = 0; (i < fdesc->index) && dev->meta_formats[i]; i++)
+		;
+	if (!dev->meta_formats[i])
 		return -EINVAL;
 
 	memset(fdesc, 0, sizeof(*fdesc));
 
 	fdesc->type = vfh->vdev->queue->type;
-	fdesc->index = index;
-	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
+	fdesc->index = i;
+	fdesc->pixelformat = dev->meta_formats[i];
 
 	return 0;
 }
@@ -174,3 +184,25 @@ int uvc_meta_register(struct uvc_streaming *stream)
 					 V4L2_BUF_TYPE_META_CAPTURE,
 					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
 }
+
+int uvc_meta_init(struct uvc_device *dev)
+{
+	static const u32 uvch_only[] = {V4L2_META_FMT_UVC, 0};
+	static const u32 d4xx_format[] = {V4L2_META_FMT_UVC, V4L2_META_FMT_D4XX,
+					  0};
+
+	switch (dev->info->meta_format) {
+	case V4L2_META_FMT_D4XX:
+		dev->meta_formats = d4xx_format;
+		break;
+	case 0:
+		dev->meta_formats = uvch_only;
+		break;
+	default:
+		dev_err(&dev->udev->dev, "Unknown metadata format 0x%x\n",
+			dev->info->meta_format);
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 11d6e3c2ebdfbabd7bbe5722f88ff85f406d9bb6..502f1d5608637cd28ce6f01aee31c4f5df160081 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -581,6 +581,7 @@ struct uvc_device {
 	char name[32];
 
 	const struct uvc_device_info *info;
+	const u32 *meta_formats; /* Zero-ended list of meta formats */
 
 	atomic_t nmappings;
 
@@ -751,6 +752,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 void uvc_video_clock_update(struct uvc_streaming *stream,
 			    struct vb2_v4l2_buffer *vbuf,
 			    struct uvc_buffer *buf);
+int uvc_meta_init(struct uvc_device *dev);
 int uvc_meta_register(struct uvc_streaming *stream);
 
 int uvc_register_video_device(struct uvc_device *dev,

-- 
2.50.0.rc2.692.g299adb8693-goog

