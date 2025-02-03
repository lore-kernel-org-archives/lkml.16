Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B43204C1C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583757; cv=none; b=tCPOcu5gy3wzEi4D5Ix5TgE+BQTdb4bF6tnRXM6J2BPKreM29xzbzWra3RcnThTxnHyB6jgGWbrgIepsppgTxgwbVJn2zkiDQTkzXD1BLqQy3yYxpVwDo0vdo0MATuIoRG0W4XKvluGS6spMg9yonhTJ02TETyCU/Bg5yn/tqYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583757; c=relaxed/simple;
	bh=Zg6xg2bjGKHfug5JTUUnCYes/lbTc768bBgzHu0UN68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oa7qzvxFlAFZSahlMnf7GOgeHaqBTKpbFI/ZT2jwYXQyXf26DCIgisxS+7v916tRAe5ZRoTo15aZdLlXeGuoM+5gV2FXXn8IIwSbpdDpikpVuvUfPDB0LzukdHagl2WPLXwP8f2Zn8HdqrEVM+Dj8C75/ltAWgbmdufV87S2ZHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bcvGPA+X; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bcvGPA+X"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85c5a91374cso2104376241.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583754; x=1739188554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHejU0nDb/GLEs+vRJP6CGozmb1EDd02Hmy/lAClMSU=;
        b=bcvGPA+Xp4+EWfNyxbPJbJA6w2Z2r7L9pN5ahvdS0Jd2wGUKuZbFjrtKrweros6A3l
         C4wpUfycc9BFMYirXRzX5JLpS2mxGOhuWCm/tf5HKt/TjJDksuQmzMpvqL/m6eOkvJdJ
         1BcGhPBRvAPz63Bue9PDkFCauRd+AZ93OFefo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583754; x=1739188554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHejU0nDb/GLEs+vRJP6CGozmb1EDd02Hmy/lAClMSU=;
        b=dzF8a9/eA7hVmNvZ6G7EKVcDgg+bm8tOMMGOpxooQ06fay3gfC12GkJ8OufJ2uQwOG
         5ePkFtQQnkoTdB3hL079FJJFRwJi6f/2yqYqk5CKsgSVp68Cp+8vCc828gfW66rVtgPe
         o0WhNkoq/23L4xHmCTd6As9ZudJt1+IEK0/HwAMB2iqhHJJKZMDis45KscnHrI28tkEj
         0dmQmWN2gPPrdv1k668FjIpFhfO5HuxtszujqGgzpM7JO5KYvWRKFx8z3mMCx1WPXzl1
         6N4v8hY5CqvP0JfPkmZIbbQcxnVuLwPICcvo5Y5Hly46E2orQC1raQX4y09y3ihaB3v/
         yQWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeQiuxJpnmd/0Gc2VZo+H7hfQgZebkircYHcDDLo5YJkf71L1I7yZOLIqHrd/quzLL8DgvFK0UGP1LnmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGdpIvwqJ1Yu8naveQxX55qcDLchBmLOabFUKuSLY+EkjwBo2A
	awDpNujfK7NXKRtNBl6tCgvfemKHrb1Mx82CTWZzKI+3R8PbgxHCHBiW2Aw/kw==
X-Gm-Gg: ASbGncu2H7Q+gP0pHoalx7ZBYxpxYA4B5wXfvdE+XSM59Q4gq+JlZ6cuuGzONN8u7KT
	k3hdasDFFcNP2lvmqLDZDvz8YNvXHQzgvgquv5kyIB4UZBrCVCHBMmXO7alR4xyXway9Vj2MQ4o
	bNlyDYXsIaqaHBnE7nggsuU5JVIDph4igD1wxg5XSSm1gV0xT3GPharpAqetj5QekKiyOYyQrqz
	uldichCXuKhYHZA57UjKtQaWoaXcTYxQQlTEVmh+KmPa3VycRhXHMr1v5XezTkBgxpySOK5DalP
	VbfEW8xx5igONHEaDRjJwbGZLXn2xLw35HYpVBd2KpNNeYUSENpfgl6wMax0EWvbmQ==
X-Google-Smtp-Source: AGHT+IG+24DLU3b+8tkuvBtbAP1+MMssTqSH/odUoY59YmfIxTIjogQMq0/8sDPBm59TgOJsYIQkTQ==
X-Received: by 2002:a05:6102:6d5:b0:4b4:27dc:ffe3 with SMTP id ada2fe7eead31-4b9a4d23a59mr14862086137.0.1738583754406;
        Mon, 03 Feb 2025 03:55:54 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:53 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:42 +0000
Subject: [PATCH v17 06/17] media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-6-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

We want to support fetching the min and max values with g_ext_ctrls,
this patch is a preparation for that.

Instead of abusing uvc_query_v4l2_ctrl(), add an extra parameter to
uvc_ctrl_get, so it can support fetching the default value.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 21 ++++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c | 28 +++++++++++-----------------
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3108d2fa1ff9..201af66a874d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1951,8 +1951,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 	return ret;
 }
 
-int uvc_ctrl_get(struct uvc_video_chain *chain,
-	struct v4l2_ext_control *xctrl)
+int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
+		 struct v4l2_ext_control *xctrl)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
@@ -1964,7 +1964,22 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	switch (which) {
+	case V4L2_CTRL_WHICH_CUR_VAL:
+		return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		if (!ctrl->cached) {
+			int ret = uvc_ctrl_populate_cache(chain, ctrl);
+
+			if (ret < 0)
+				return ret;
+		}
+		xctrl->value = mapping->get(mapping, UVC_GET_DEF,
+					    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
+		return 0;
+	}
+
+	return -EINVAL;
 }
 
 int uvc_ctrl_set(struct uvc_fh *handle,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 93c6cdb23881..9493ab375f07 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1027,34 +1027,28 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	struct uvc_video_chain *chain = handle->chain;
 	struct v4l2_ext_control *ctrl = ctrls->controls;
 	unsigned int i;
+	u32 which;
 	int ret;
 
+	switch (ctrls->which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+	case V4L2_CTRL_WHICH_CUR_VAL:
+		which = ctrls->which;
+		break;
+	default:
+		which = V4L2_CTRL_WHICH_CUR_VAL;
+	}
+
 	ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
 	if (ret < 0)
 		return ret;
 
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
-		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			struct v4l2_queryctrl qc = { .id = ctrl->id };
-
-			ret = uvc_query_v4l2_ctrl(chain, &qc);
-			if (ret < 0) {
-				ctrls->error_idx = i;
-				return ret;
-			}
-
-			ctrl->value = qc.default_value;
-		}
-
-		return 0;
-	}
-
 	ret = uvc_ctrl_begin(chain);
 	if (ret < 0)
 		return ret;
 
 	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-		ret = uvc_ctrl_get(chain, ctrl);
+		ret = uvc_ctrl_get(chain, which, ctrl);
 		if (ret < 0) {
 			uvc_ctrl_rollback(handle);
 			ctrls->error_idx = i;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5e388f05f3fc..018613f98f48 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -793,7 +793,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 	return __uvc_ctrl_commit(handle, 1, NULL);
 }
 
-int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
+		 struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   const struct v4l2_ext_controls *ctrls,

-- 
2.48.1.362.g079036d154-goog

