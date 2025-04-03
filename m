Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB39C1FAC33
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715893; cv=none; b=qFfZuRsnN6fBf3gNtKcxpp8SQyyhX+ISK5bsxZV2JFD5Fx5VyNBx39xe7HBW3YKOHGqEiHSBOiIo4fPwfucKl+uUuhDpUJvDswr6+de57EgrlImdYYtbUUPdmckLhKB8kvV+wdBw3U09AViBfrn90dmIYouhIWC28Pm9B7JO7Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715893; c=relaxed/simple;
	bh=L7y5JgtHlBuaCQXRqFHbuJtPei3FDRhe9+sz6StA404=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hvWqsGyxmVqzhexy3IkCecrM/BnQcKIHpeK/PGFKW+w9kF9SRkkvs/20mqkmqt/8Nw+PUFhPEVITxUuylqR+kdph69GrmzNFQuUgApH6C0s21T17e+UcpqzY29wC7nFASne3+YEO16j5F5/B9/pt4B+8LIp5/9XuOF/YVetn5+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eYcKEZG2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eYcKEZG2"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so1508839e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743715889; x=1744320689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+thbh0+TpU/cLXc8EBGcJ8aUoG9xyAqyDChZ9I91Sg4=;
        b=eYcKEZG2aAYliPPMzUe5zzWQtCi5qvwmwO+cDqFc7PhYnMhWMUqteJ4TukbeR/9cwr
         ecVLNF3FVbw6pej+u7P17kEoVBV5G004gFyNYPTFkedLVE5VhxXdrkzKsER5Ifs21izs
         K+jjjNHmleyooShEnH/a6HpLnUJjIgRWl0VsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743715889; x=1744320689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+thbh0+TpU/cLXc8EBGcJ8aUoG9xyAqyDChZ9I91Sg4=;
        b=QtO4fWp56Vk6+ZS3/VKzZoy6BUPmBcI5GLIaq/ef1CyDqZhGr9Kakm6caWLGaSq4sO
         J6tJzg4wyA80+7dQXnEHuVEux3TOFqur5mo292JFAo1/W2S2pCeF5LBa0eXsDpuk9B3u
         xOYr5yKtouVJKWwUvJ6pTBXF94I5su+znxp0yNNUm0aYT5KJ1RNPpb/UqSFKKXqLPgy/
         O0JH5cZlGXZrQtgdkcyroZwPO/2FDH2i5ndwKM9A7ewXNayFOR9hPq33yN8/H9NHioBq
         5/Nr4ZzkmSmWpfK89Z7rbHcVOx86H02XJiZsA+/KmQ0KvnaKUJVqFu6CypUcxFG454Xa
         dTWg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4mGq0JxlWpgZAR4rQXKYjwTWijWYnoXqHX2xZZhBqWHRd+MAml8YNqf1JJbgwWNbF/hb+BXznjKUZpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpC3dYkvpq1osyiN11KOQDUACpJ+WQsrMYqudO/dbSP2iSNe6O
	gGpRXuailzqFKqZEzP51+mDfcEmJIoh18YQAnmbsnF0mgQroiRLOqTxDXT6mgDDg9Bs2QFey+wY
	=
X-Gm-Gg: ASbGncsXcuUsKlrJGPwnOfLpj34eFCh/rR9kQ00f3VXWulhTCgsyH4nSp7UabZ61VNE
	60W2yavfymwEzxI+kRNkbT0wjUtIc7/uaXcWhHycq0TZDfIShX4QiwARs2/i7q4roN2P4wOsGZ6
	e8d2C/aoVd+31kt01+nCiFUjPbg3/CsniaeUNn2cKHTCIZV3Y3BZHS1ptuRYUliCCOaY5XCjRjs
	A/NLzx7XCpfynMRaGLPz7HKUXW0dze4RiiPi2+Ujwt6bKn0A2V+4VoClVJcoiUCY/8fjKk0df6T
	zdDbZ5JwjFIgQX2sOrooXaJXK1SsNMsx1eCpKrSEiMjU26CAtdLlHQ2Y5Yx+3w3qPMBd1rrRE3M
	SfVi45TlqhtsB9ulUvgWDr+C8
X-Google-Smtp-Source: AGHT+IGlY97KwhiEi7m172O5iTRFLg+XYA3D62E4/JwTE+9ktBo0wZMO1HJ2NvIZm1Pz9Y/79OdyMA==
X-Received: by 2002:a05:6512:10d1:b0:54a:cbfb:b62e with SMTP id 2adb3069b0e04-54c227dc7c9mr177515e87.35.1743715889253;
        Thu, 03 Apr 2025 14:31:29 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6d5sm252938e87.181.2025.04.03.14.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:31:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 21:31:26 +0000
Subject: [PATCH v4 3/4] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-meta-v4-3-877aa6475975@chromium.org>
References: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
In-Reply-To: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
V4L2_META_FMT_D4XX. The only difference between the two of them is that
V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
V4L2_META_FMT_D4XX copies the whole metadata section.

Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
devices, but it is useful to have the whole metadata section for any
device where vendors include other metadata, such as the one described by
Microsoft:
https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata

This patch introduces a new format V4L2_META_FMT_UVC_MSXU_1_5, that is
identical to V4L2_META_FMT_D4XX.

For now, flag this format with a new quirk.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++++++++
 MAINTAINERS                                        |  1 +
 drivers/media/usb/uvc/uvc_metadata.c               | 43 +++++++++++++++++++---
 drivers/media/usb/uvc/uvcvideo.h                   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 7 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 86ffb3bc8ade2e0c563dd84441572ecea1a571a6..4de0d094e0702068be0c59154458c9dfecbfe28d 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -19,6 +19,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-pisp-fe
     metafmt-rkisp1
     metafmt-uvc
+    metafmt-uvc-msxu-1-5
     metafmt-vivid
     metafmt-vsp1-hgo
     metafmt-vsp1-hgt
diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
new file mode 100644
index 0000000000000000000000000000000000000000..f211d33ac6d89e1a6684fbafc43bab6287b6a4a4
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _metafmt-uvc-msxu-1-5:
+
+*********************************
+V4L2_META_FMT_UVC_MSXU_1_5 ('UVCM')
+*********************************
+
+Microsoft(R)'s UVC Payload Metadata.
+
+
+Description
+===========
+
+V4L2_META_FMT_UVC_MSXU_1_5 buffers follow the metadata buffer layout of
+V4L2_META_FMT_UVC with the only difference that it includes all the UVC
+metadata, not just the first 2-12 bytes.
+
+For more details check the documentation from Microsoft(R) [1].
+
+.. _1:
+
+[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
diff --git a/MAINTAINERS b/MAINTAINERS
index 306b1384eb6d4cb7a310ada44605eaeb88cc732f..a07ed31ab057b98cf801d919b5bbec5ee334c9ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25059,6 +25059,7 @@ S:	Maintained
 W:	http://www.ideasonboard.org/uvc/
 T:	git git://linuxtv.org/media.git
 F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
 F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst
 F:	drivers/media/common/uvc.c
 F:	drivers/media/usb/uvc/
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 82de7781f5b6b70c5ba16bcba9e0741231231904..fe2678fc795d7fd5a64e8113199012f34c419176 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -63,15 +63,21 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
-	u32 fmeta = fmt->dataformat;
+	u32 fmeta;
+
+	if (fmt->dataformat == dev->info->meta_format)
+		fmeta = dev->info->meta_format;
+	else if (fmt->dataformat == V4L2_META_FMT_UVC_MSXU_1_5)
+		fmeta = V4L2_META_FMT_UVC_MSXU_1_5;
+	else
+		fmeta = V4L2_META_FMT_UVC;
 
 	if (format->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
 	memset(fmt, 0, sizeof(*fmt));
 
-	fmt->dataformat = fmeta == dev->info->meta_format
-			? fmeta : V4L2_META_FMT_UVC;
+	fmt->dataformat = fmeta;
 	fmt->buffersize = UVC_METADATA_BUF_SIZE;
 
 	return 0;
@@ -106,6 +112,27 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
 	return ret;
 }
 
+static u32 uvc_meta_idx_to_fmeta(struct uvc_device *dev, u32 index)
+{
+	switch (index) {
+	case 0:
+		return V4L2_META_FMT_UVC;
+	case 1:
+		if (dev->info->meta_format)
+			return dev->info->meta_format;
+		if (dev->quirks & UVC_QUIRK_MSXU_META)
+			return V4L2_META_FMT_UVC_MSXU_1_5;
+		return 0;
+	case 2:
+		if (dev->info->meta_format &&
+		    dev->quirks & UVC_QUIRK_MSXU_META)
+			return V4L2_META_FMT_UVC_MSXU_1_5;
+		return 0;
+	}
+
+	return 0;
+}
+
 static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 				      struct v4l2_fmtdesc *fdesc)
 {
@@ -113,16 +140,20 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
 	u32 index = fdesc->index;
+	u32 fmeta;
+
+	if (fdesc->type != vfh->vdev->queue->type)
+		return -EINVAL;
 
-	if (fdesc->type != vfh->vdev->queue->type ||
-	    index > 1U || (index && !dev->info->meta_format))
+	fmeta = uvc_meta_idx_to_fmeta(dev, fdesc->index);
+	if (!fmeta)
 		return -EINVAL;
 
 	memset(fdesc, 0, sizeof(*fdesc));
 
 	fdesc->type = vfh->vdev->queue->type;
 	fdesc->index = index;
-	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
+	fdesc->pixelformat = fmeta;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..123446683e22589f23b5228a00240e54f00ae6f1 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -77,6 +77,7 @@
 #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
+#define UVC_QUIRK_MSXU_META		0x00040000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a16fb44c7246e35f3710306fde5dfc15329b4d95..12f1232e5ca3acdefede8f9751f9e7191eeae58b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1457,6 +1457,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
 	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
+	case V4L2_META_FMT_UVC_MSXU_1_5:	descr = "UVC MSXU Metadata"; break;
 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c8cb2796130f8d1b864d669267d2b31f73b839aa..0cf6885a5dc8752326bd10a893d5d09d47993c21 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -851,6 +851,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
 #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
+#define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
 #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
 
 /* Vendor specific - used for RK_ISP1 camera sub-system */

-- 
2.49.0.504.g3bcea36a83-goog

