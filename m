Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDB818DB37
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748666; cv=none; b=NESPIuJjHaO3Lr/GeNJi71oku64M4dKQhATxvu+NRHfo/w6k8MRS8QKZnL8LQ/eXLrOaI0QiZBr8O8djNcfDP1Il1UI6t137EunQQ+/EbkLUYUEXVLC/bq6NB+5KItfVzu/v7Mndljt45c/prHXZKr3nxj3KWFskOf4G5eLRM7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748666; c=relaxed/simple;
	bh=b7Zu7FXe5Yk8VGSP7zeuJTUbCpv87TetJKqJT0JTgig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9naMOc9t2I9YZh4w7HzvdDHlbrPrr1eg0eNGiKz8ho+FaQqdUAvkB4MsE4l8e+Wk2SJ16rFwrxgaKwvHWTHCJQO/+vrEWmEPpNlQ7FZYk8i4g9NQLB/uie08ZhhFlNFuHOIo9l9DcWdylfEU0ZT6s/CUxSzjA7QeiDDMZ8GLng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aN/WiZmE; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aN/WiZmE"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b159c84cso2042038e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 23:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743748662; x=1744353462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yet+7EChC7n/+00JGsTh9/MSwH5sjxZLzKQLC8/d9K0=;
        b=aN/WiZmEVo6lxXUGqzzyylI5g+hYTIvUE+dg47VWflEizIzvNT3gtDXUOTGdMUe5gd
         vz3tdi7ygi5s3yroc9E4rScgYDhjaq43uXW74ulW1RSmpQybLUl7yAKxtQkyE17h1qTT
         QfpviigFrMCTqszWrd6pdjpt+uD1OVcwIdVjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748662; x=1744353462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yet+7EChC7n/+00JGsTh9/MSwH5sjxZLzKQLC8/d9K0=;
        b=U8iyutiRh0tp7xJKdVP4GCuPMrhzuToFDLJAfZNfk2waD3n8JPAYfH/n7Ye7xKSrMU
         4J+mpw+fW7OCLXuJHdUpjpjvHd9OwpEtupGy5zVUiHNuoW251tmJOh0ZkHByOXnfq6ib
         8xjfHNUlDpgpF+NpQth2G4jMxhiQGe7HOOTbNQrjo5I9A+eHaHsjsm/skBuoTBZbfSbm
         g5t+XxEnp+LwaxSiQ59+b3k/XDSNP9SRI9iTRcsWTQ4Txqvv61ZwIG3dVBBlfmlnuaw/
         zz7rEMGJEmUXybrEqva4hIzJYPjzOUurBzXHUMliwJuFbdC5sl/lOgcMEKJgNTP1n0Y1
         J1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXooqQjR/SwOj3Wm7UrxxV/+1aH7Cmt3nPWrnx94F3lnRp8bnLkbQOHOCbahYk5F7HTeIJT5hzSeRedZ4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxgibMXNjmcIUQxJg58yXwNafCMbZlH7wvWSJ8vFNF79zzallT
	ZPP8/BSlR239BUkeFS24+K/flnZKTiqdSZSjCEzvRXS7F0yUI5ipL0Ws2OOFzw==
X-Gm-Gg: ASbGncsnCWMC8w2ZUt15s8nF1xhQJbqfwlCH/RQkix8bxaputnjwvx+HO2shX3QjtS1
	6R8dEqYmd80i0zEpwdirpiHq0dxqwNJO4s7Ai4ET0ueYuFs3tlmiueHiFQ258Gqpm2tQOXKIr0w
	Nog5iQjESjGeh5Gxj86vBVsTV2FldKCHPzSNvhLwkur4D1cwmscYYIF2hAt8dGGGJ9AMP7reyMU
	CctH23NDaOT5AYd2b8zM0CQpULGPTAwTapWadzcpIhpaKjpktgyXNFIEE+ybdshirQf9B3o+quX
	i2GN8o2+kUXqmcMS/ChtI6qjDwyW4b6ZZdsvkFSnMrAbXFOrQqUba/asEqJdaLnzcFr/+7OZ0RD
	IXyl12C1HzRc5rKw2BbyvPMzM
X-Google-Smtp-Source: AGHT+IEaIXZCTW3rwp+tjJpUHC5vgWNe4ojs3y5woCDSlLDDC7F6zt9didrHAHJIBVs7/ngkZEewng==
X-Received: by 2002:a05:6512:3e03:b0:54b:117c:1354 with SMTP id 2adb3069b0e04-54c22808e8bmr472555e87.54.1743748662450;
        Thu, 03 Apr 2025 23:37:42 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672444sm338275e87.251.2025.04.03.23.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:37:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 04 Apr 2025 06:37:36 +0000
Subject: [PATCH v5 3/4] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-uvc-meta-v5-3-f79974fc2d20@chromium.org>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
In-Reply-To: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
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
index 0000000000000000000000000000000000000000..e6f95a88c0ff061df0b066b12cefc30f946b60aa
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _v4l2-meta-fmt-uvc-msxu-1-5:
+
+***********************************
+V4L2_META_FMT_UVC_MSXU_1_5 ('UVCM')
+***********************************
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

