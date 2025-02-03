Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3766E205E15
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583767; cv=none; b=QTqi2nrmuQ9ClRMAX8lYHsDQNKsfW/vTPzWKjrvkK3FgH3MVaTLe73/1XrFLugQknVGcB57Z6zmu46eXW7l+W0kjIf1VsPfmT8umDrCFKAuabpOZaItQtoBjppajagcE3cvRKZzjTKENhlquxUNKvsnmmdZmxCmkAUyASCNZwz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583767; c=relaxed/simple;
	bh=jr+PsfqAe1DMqBhomm2T99WaHj0J+agxbYUDnZWYmVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0nLnvG+iaw53KOiJ30SGsMLZmuBa8KPDgUGfIaZJRrerrbZlazNMW/tZiqBRqEq0/y+F0YHVkLn8OInh+ci7rTrYxwvIPfwUltyoqmicop9Z5NMR5tXVe4pRR/5Faw/slADhT/8VDx+8sCLfvO6Vi6VEd3ohGTsreKNQNUxJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i0Gmb3Pb; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i0Gmb3Pb"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85bc7d126b2so2203489241.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583765; x=1739188565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmRIEuGB9w+y+UYSlcNFeXKIfbL+PvnOnrm5AaSkwZM=;
        b=i0Gmb3PbE6//JW6+QrWIoPueO+VT/dSK/YH1XG6IvIVjYrMsXKNDjvpP0hhueydejj
         uNgX7YA4xAn28FOVb1KNtrJ5WkAgKT10epxFZEAYDcs4r4Xmf5pkizZc3X3sTwiVlLHV
         heDNYnYg2/GBT+TrAU+8NDxdH6uSWXyeuImJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583765; x=1739188565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmRIEuGB9w+y+UYSlcNFeXKIfbL+PvnOnrm5AaSkwZM=;
        b=sCQhgHGYw7CLwXCD7U8HnD+Qy2DIug3WEdlMLiolmoLZejUksILEmEH9qtmtkYv9+a
         Nlp4aVsxwrKmmdpUaass4ayZt098NhPCpBe4OtVcNrArAHfV8rSLQnprGlxtMz+gMKRU
         EKA9Ap9qTeODmDDIfiGzyrSKsIThZi+6hBU22WA4Gjzk1wqN47divGdTLNs3B3j1M7Er
         oRTf3SxZYTSk1VNFgzoSK1JNCEQgif0gagBWoazw7qqOJMpiCngP+hdEATo4i9rJB9HJ
         QDbNhH0oZ98YSCSxODsT5V+wUykHleOu8RFEbhEMV01GFXFRbEbkIJsuRJE7u8Vrt3zL
         a4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWvTZjf+i7vyBcP59siJvsuFfY/lgYzOBRvNOAHD3P4zyv9Qpvb6s/kVOZxfg6jSvgkjF3Xx4Tfp1jtJWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmohaQDSkl+3MdvItj4bOCn43Yy3ROYVg1Nbdqk+IhW+Kp8ZHo
	p03jPESdkLHMDbKBcwqSSHreusSLOgkML0q3gX3xmgja/TZiBbMtHUf03jZmDw==
X-Gm-Gg: ASbGncsrr1IZZA0Z5e/n1OFh5thQ3I0Fv7G/rER4Rd3IpMOH97EMLHAS71ifBNT4PyM
	DybKTj6NvU0NYPGVagW8LzHrXk6rY0nqS2L/nYx8B+qKoOw8TfO4G9buaQL6XFCSW745peAkGUW
	jeS3J/IoIlO9VG73MKJ1sHb9mwdpo0iJVBTPKIfeKSfqzwszOjSOexbLYX90kCq+TV01o1eWAUI
	5648nV5OBSeaC506qhmswm3au32o3DNAZtdBI8bUgEt/dlJWtQX2OYqdrNJCZR6GQYILNHeaioa
	AH1wtQ1AfgLwjnGCr0W6RSVv4B8bf/p3SmLIojFf+Qgopunz5I8KLEAaLBuvTx/5TA==
X-Google-Smtp-Source: AGHT+IEWbBLDqt8daDt8XTdjdKHl7zjnPV3tGAcQZ8yqpswx+3L0zw81Fua6kDJHw31NjGMFcULexg==
X-Received: by 2002:a05:6102:e11:b0:4b2:7534:f26e with SMTP id ada2fe7eead31-4b9a525cda5mr13324873137.16.1738583765161;
        Mon, 03 Feb 2025 03:56:05 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:04 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:47 +0000
Subject: [PATCH v17 11/17] media: uvcvideo: Factor out query_boundaries
 from query_ctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-11-5900a9fed613@chromium.org>
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

Split the function in two parts. queryctrl_boundaries will be used in
future patches.

No functional change expected from this patch.

Reviewed-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 106 ++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 46 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b8bf8ca95747..6e27075939ac 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1374,53 +1374,11 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 	return ~0;
 }
 
-static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
-	struct uvc_control *ctrl,
-	struct uvc_control_mapping *mapping,
-	struct v4l2_queryctrl *v4l2_ctrl)
+static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
+				      struct uvc_control *ctrl,
+				      struct uvc_control_mapping *mapping,
+				      struct v4l2_queryctrl *v4l2_ctrl)
 {
-	struct uvc_control_mapping *master_map = NULL;
-	struct uvc_control *master_ctrl = NULL;
-
-	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
-	v4l2_ctrl->id = mapping->id;
-	v4l2_ctrl->type = mapping->v4l2_type;
-	strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
-		sizeof(v4l2_ctrl->name));
-	v4l2_ctrl->flags = 0;
-
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
-		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
-		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
-	if (mapping->master_id)
-		__uvc_find_control(ctrl->entity, mapping->master_id,
-				   &master_map, &master_ctrl, 0, 0);
-	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
-		s32 val;
-		int ret;
-
-		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
-			return -EIO;
-
-		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
-		if (ret < 0)
-			return ret;
-
-		if (val != mapping->master_manual)
-				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
-	}
-
-	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
-		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
-		v4l2_ctrl->default_value = 0;
-		v4l2_ctrl->minimum = 0;
-		v4l2_ctrl->maximum = 0;
-		v4l2_ctrl->step = 0;
-		return 0;
-	}
-
 	if (!ctrl->cached) {
 		int ret = uvc_ctrl_populate_cache(chain, ctrl);
 		if (ret < 0)
@@ -1464,18 +1422,74 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
 		v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+	else
+		v4l2_ctrl->minimum = 0;
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
 		v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+	else
+		v4l2_ctrl->maximum = 0;
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
 		v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
+	else
+		v4l2_ctrl->step = 0;
 
 	return 0;
 }
 
+static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
+				 struct uvc_control *ctrl,
+				 struct uvc_control_mapping *mapping,
+				 struct v4l2_queryctrl *v4l2_ctrl)
+{
+	struct uvc_control_mapping *master_map = NULL;
+	struct uvc_control *master_ctrl = NULL;
+
+	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
+	v4l2_ctrl->id = mapping->id;
+	v4l2_ctrl->type = mapping->v4l2_type;
+	strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
+		sizeof(v4l2_ctrl->name));
+	v4l2_ctrl->flags = 0;
+
+	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
+	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	if (mapping->master_id)
+		__uvc_find_control(ctrl->entity, mapping->master_id,
+				   &master_map, &master_ctrl, 0, 0);
+	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
+		s32 val;
+		int ret;
+
+		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
+			return -EIO;
+
+		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+		if (ret < 0)
+			return ret;
+
+		if (val != mapping->master_manual)
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+	}
+
+	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
+		v4l2_ctrl->default_value = 0;
+		v4l2_ctrl->minimum = 0;
+		v4l2_ctrl->maximum = 0;
+		v4l2_ctrl->step = 0;
+		return 0;
+	}
+
+	return __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
+}
+
 int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	struct v4l2_queryctrl *v4l2_ctrl)
 {

-- 
2.48.1.362.g079036d154-goog

