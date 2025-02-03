Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BFA2040AD
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583748; cv=none; b=hIWFFk3sbVwyyPjRfng2g/VIP5UL6iip3juUAngYW/ZR7zop1EKUN3gCGLeAwu7Tu3Q/PnXzBkSRw31BfZvqPohluvlYUSdxeQM679T3mv9UHxd1wjH6fDvSxRo/5Io3teaCvazNsU9g9/Zm74KbqIrxBHq6gx4AsIZsM1Uv3pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583748; c=relaxed/simple;
	bh=HMFu5YUjCzh+dfJLnCL0yvaXsO1GC5gImg50iw9aiFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQOb0pquLGFSdS8V7edNyXF6dm7jWHpU+HLk8qxeFYE7Gmp/4UKD0cvw1wpTlQ3ieIzmC7+EXQwHOCW3t6NTr+8XfsbSAussyakyh8gGogJllzZ9hmSVItuZlRuxABuiXDbrEKKakqNQA0Dz/7fih5Hzt1RQ8Uu+B/Aat+TPjDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KvyhCeUx; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KvyhCeUx"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4affd0fb6adso1344397137.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583745; x=1739188545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzX468yE+84ddkQd72Px4P8JN2INaFAkQMbrtGzcAY8=;
        b=KvyhCeUxHb0nxsdldskHbvIMm9UKOA+2FjQ01F9Bst3A4ouCPYqmrgvAHJRmRxRZqn
         v3sVOco1+l9xhxsUXHnLdHbsaXmDvvLePMjKVsbwikB0ud2MqHYAE6l/XIItskSionFk
         JVx15JFt1zegBpOcnjA3B89veyStGt+1kBWq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583745; x=1739188545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzX468yE+84ddkQd72Px4P8JN2INaFAkQMbrtGzcAY8=;
        b=PcZZUtWMG4wrHr/tFU16yPtWFaA+3f+NMlqCmAFeTNA8cH0Qe+eJ9UshQCqbaZTg3x
         jrqtVx+u8AYg8U8dZYnAPGAz14dLvWW869qymv3mWRnvRUMQTLKLevRFgjb/FPVG2wa/
         6g6RHNarh1zoCO4ZMSG11D8IcqGP+Hex05MdLxVqlLa5+Gu87Rff3jxkigmyy7THy1x+
         2DMVkn+ZknE38BMZNk6G4YmPOZDoffQhEno9RdAA5W6MPjwFwFWDoYrNISxwH/uREJnR
         zL2u5L82aTl6PYHhbYrSXItiaPrULFhTfL1nxQDn/eidavqyjcdW/gOv95qP6DtJIAyM
         /vPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWetXUpKzANBQ4uNrVkQiz8B1utdU7AKt9Wi2P4c2SCrMzhxaU1h5IeeucEglKmjQ97CuvTNH2JPiyD5QU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze7yTib6tfc+uSknF+blQCWConKHb9jWhN76pQX4kpqHGWRFb8
	17zju1fioYl2fQMEWGf7ABgalHFGfB9JlOarojhn6U4MRRVfKtFa/UU5cx5+0w==
X-Gm-Gg: ASbGnctiYjym0aWh6VwWRNL9mye6CV9CBv0GE0OIN8UwTqTgpDf+1rvaD7BPmMXRYBq
	McBm1/7Sf7etbpLzT87RjrU9Wp2QzDQc7XhbmF4/u5k1jL2JuOEUaYhOm3gDaXBLgMYjHXj8B2E
	79GwHiUmlvnYgJj2j9MR8f29YN8NDO1UGEyM3cvQkA7F948FXmdIeYlwDYemGbRT3QIq4GkkG+p
	Rv2HgSDVoiC8RJTqX9tmRcR2usvbk8mXg4DZsQkdsijJuSTf/JTG3sjeQc8apx4j68mmPuIqHW+
	pYxKnq+PY1PBFMUkfmG04dMUSa0d24E2G22UGFSYKQA94lGhRL46je+Rvt7ikc+LeA==
X-Google-Smtp-Source: AGHT+IHcoj9QHVjycMEiVN0thlw1pGaFylWGBWQLQblks8XzJtAgHPwQu9Yx3nWa+z6ZNShKZt9sRA==
X-Received: by 2002:a05:6102:6c8:b0:4b6:1ce1:30a4 with SMTP id ada2fe7eead31-4b9a5265787mr14373221137.21.1738583743450;
        Mon, 03 Feb 2025 03:55:43 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:37 +0000
Subject: [PATCH v17 01/17] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-1-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.13.0

From: Yunke Cao <yunkec@google.com>

Add p_rect to struct v4l2_ext_control with basic support in
v4l2-ctrls.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst       |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst         |  7 +++++++
 .../userspace-api/media/videodev2.h.rst.exceptions       |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                | 16 +++++++++++++++-
 include/media/v4l2-ctrls.h                               |  2 ++
 include/uapi/linux/videodev2.h                           |  2 ++
 6 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 4d56c0528ad7..b74a74ac06fc 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -199,6 +199,10 @@ still cause this situation.
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AREA``.
+    * - struct :c:type:`v4l2_rect` *
+      - ``p_rect``
+      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_RECT``.
     * - struct :c:type:`v4l2_ctrl_h264_sps` *
       - ``p_h264_sps``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..56d5c8b0b88b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -441,6 +441,13 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_area`, containing the width and the height
         of a rectangular area. Units depend on the use case.
+    * - ``V4L2_CTRL_TYPE_RECT``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_rect`, containing a rectangle described by
+	the position of its top-left corner, the width and the height. Units
+	depend on the use case.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 429b5cdf05c3..3cf1380b52b0 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -150,6 +150,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..4c8744c8cd96 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -370,7 +370,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
 		pr_cont("AV1_FILM_GRAIN");
 		break;
-
+	case V4L2_CTRL_TYPE_RECT:
+		pr_cont("%ux%u@%dx%d",
+			ptr.p_rect->width, ptr.p_rect->height,
+			ptr.p_rect->left, ptr.p_rect->top);
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -815,6 +819,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
+	struct v4l2_rect *rect;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -1172,6 +1177,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CTRL_TYPE_RECT:
+		rect = p;
+		if (!rect->width || !rect->height)
+			return -EINVAL;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1872,6 +1883,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		elem_size = sizeof(struct v4l2_rect);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..b0db167a3ac4 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -56,6 +56,7 @@ struct video_device;
  * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry structure.
  * @p_av1_frame:		Pointer to an AV1 frame structure.
  * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
+ * @p_rect:			Pointer to a rectangle.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
+	struct v4l2_rect *p_rect;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..c1c2ae150d30 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1859,6 +1859,7 @@ struct v4l2_ext_control {
 		__s32 __user *p_s32;
 		__s64 __user *p_s64;
 		struct v4l2_area __user *p_area;
+		struct v4l2_rect __user *p_rect;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps __user *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
@@ -1929,6 +1930,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,

-- 
2.48.1.362.g079036d154-goog

