Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D692045BC
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583753; cv=none; b=adrDv4CQyBpBKoEQde9s02jvyxoxtQYVTbu/oxQoYtIwPBravWtxSkrOihiAIizS0MeRvSGFdkKT16tCh8cfF4poaqrQaeiagiODIRytJc/Wk3CAy24+hnzdk3osKKQdDpAFfQOZB5O0GN34uF9FKu7XWOwh2Rbabna5KYQ2TJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583753; c=relaxed/simple;
	bh=Ildx3KkSONLWLTB6UMs2mXOT6GNaL5EUqHnIiYn9Ecc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQGYj7khi8FtbmKuyZOQ7Fx6jWtaS0JykqYjAdqxuqnvE4ta/3c8ayMHxidCliTddEVqVqxGhaQcs/K7zeNInUPO6iiMw7K+ivaRj2XVmCJH/IYpZOPvYdhf4jDutY9VrUq0vWrFodzqjkp+cZHGALigqrb9oAzfc6iw09Mu/ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hGgf67z1; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hGgf67z1"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4aff31b77e8so1694399137.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583750; x=1739188550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ptj+WXBBaeCFw/qOAiMyPpprCB8Gn1wdtebwngGkHqk=;
        b=hGgf67z1tcImMkj6CNvJqm2i34EAJR/icrFPaowSZW9B4W+Y+NtH/xKlit4P4G4IQI
         2PBpDoZOzhKgCxxEVGkLzmKDSp68pNPsFTv6zt4AMq30lGAbLI7AEAiv1iZriq2E16R+
         NJ1fDfylhG5csweIAp+t/ixlcU6wgTgVpRSMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583750; x=1739188550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ptj+WXBBaeCFw/qOAiMyPpprCB8Gn1wdtebwngGkHqk=;
        b=hq403r16MtW6s1pZb+jvtKlrY30K7iJnefKpfhJWeMlz+LYgo5aUjqiAvgNy/6wY61
         1wUgExB2uYt6ZBuqkx8ofizuqApRNAc81tiX7kI2DaQqAkC1v+38U9xuT/CEtp248Wzo
         ZYSU1mgqeEm/VmU16FHkpCTlJtxSfeO1FZyse9jOeHQ2YzWk4TEFFK5SbjJsltEVuTw9
         Cfh3b2I3z5oDFcqI1TUwCgBLy64+GZ7Y162IG+sQZj9TLOs6xCm7awS8etabiLqDbm9l
         1Xt6symyBbGVzzpWpkObQE/4kYEZzcqqbeRziKgY6loZyFVLnny2QmCIkqA5emuUFJ/B
         9QSg==
X-Forwarded-Encrypted: i=1; AJvYcCWPWz20C9/G5nJ9bZsx9kabFJa9TY3LwGsQe7bHhKgHiu7JH92sRh5EweGRexP1wHStCFwhCEeDhzJGEko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww05o9FCeHZs4sB2ezqlcDLAHxQgoEoHvsYTrevzErPtVa40Cw
	LCUWnZ9whqBIGRyVyGRfjSFFyOh6kvj8++xrhCl+p0zjcDatcD/gic8mMlGivQ==
X-Gm-Gg: ASbGncuwiH7yxCvMURqkRuj8H9Q6QKJGK7aGBrlxWhmgxzZgH6/Cr3yqVV2KAXDH9dp
	ZfN7bQw+xyfZ0jaNQtE2dYtqiQdDzDz5Lb85GtgJiHHNRXsXLqGLVGJ0qBFnnA8FUgO7spi4kz6
	Zz9Sn0HTup49w0AroxXQr5jIsEZE5H20lGFOmGvQ2jSvTf/ZShndNma/U1qZ9KORufypRVjjy3S
	QcVTn3MzYHz3dhfzwYLh1vCdHj85f6hLmCbw8Du/7OfoazGlY9xxnv+Yz6mya0CP37TVTqR/2tF
	0FT7hvBVXb5Vxu93uIZ55plNwXRqZipKRHI+WUMkUsEtsH2h8tRNU+7NvLC9KdlPSg==
X-Google-Smtp-Source: AGHT+IE0oR19UI2fh0jS+KCqQj/7FevOYUabIUBz5ZuDo6iKNX0yQhxcUpph4fxitp3pua3X6v/6wg==
X-Received: by 2002:a05:6102:5e8b:b0:4af:f740:c1b8 with SMTP id ada2fe7eead31-4b9a5270cf3mr17240868137.24.1738583750154;
        Mon, 03 Feb 2025 03:55:50 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:49 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:40 +0000
Subject: [PATCH v17 04/17] media: uvcvideo: Handle uvc menu translation
 inside uvc_get_le_value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-4-5900a9fed613@chromium.org>
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

map->get() gets a value from an uvc_control in "UVC format" and converts
it to a value that can be consumed by v4l2.

Instead of using a special get function for V4L2_CTRL_TYPE_MENU, we
were converting from uvc_get_le_value in two different places.

Move the conversion to uvc_get_le_value().

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 77 +++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 45 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4e58476d305e..4a55cf78ec52 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -862,6 +862,25 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 	data[bit >> 3] &= ~(1 << (bit & 7));
 }
 
+static s32 uvc_menu_to_v4l2_menu(struct uvc_control_mapping *mapping, s32 val)
+{
+	unsigned int i;
+
+	for (i = 0; BIT(i) <= mapping->menu_mask; ++i) {
+		u32 menu_value;
+
+		if (!test_bit(i, &mapping->menu_mask))
+			continue;
+
+		menu_value = uvc_mapping_get_menu_value(mapping, i);
+
+		if (menu_value == val)
+			return i;
+	}
+
+	return val;
+}
+
 /*
  * Extract the bit string specified by mapping->offset and mapping->size
  * from the little-endian data stored at 'data' and return the result as
@@ -896,6 +915,16 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)
 		value |= -(value & (1 << (mapping->size - 1)));
 
+	/* If it is a menu, convert from uvc to v4l2. */
+	if (mapping->v4l2_type != V4L2_CTRL_TYPE_MENU)
+		return value;
+
+	switch (query) {
+	case UVC_GET_CUR:
+	case UVC_GET_DEF:
+		return uvc_menu_to_v4l2_menu(mapping, value);
+	}
+
 	return value;
 }
 
@@ -1060,32 +1089,6 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
 	return 0;
 }
 
-static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
-				const u8 *data)
-{
-	s32 value = mapping->get(mapping, UVC_GET_CUR, data);
-
-	if (mapping->v4l2_type == V4L2_CTRL_TYPE_MENU) {
-		unsigned int i;
-
-		for (i = 0; BIT(i) <= mapping->menu_mask; ++i) {
-			u32 menu_value;
-
-			if (!test_bit(i, &mapping->menu_mask))
-				continue;
-
-			menu_value = uvc_mapping_get_menu_value(mapping, i);
-
-			if (menu_value == value) {
-				value = i;
-				break;
-			}
-		}
-	}
-
-	return value;
-}
-
 static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 			       struct uvc_control *ctrl)
 {
@@ -1136,8 +1139,8 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ret < 0)
 		return ret;
 
-	*value = __uvc_ctrl_get_value(mapping,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	*value = mapping->get(mapping, UVC_GET_CUR,
+			      uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	return 0;
 }
@@ -1287,7 +1290,6 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 {
 	struct uvc_control_mapping *master_map = NULL;
 	struct uvc_control *master_ctrl = NULL;
-	unsigned int i;
 
 	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
 	v4l2_ctrl->id = mapping->id;
@@ -1330,21 +1332,6 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		v4l2_ctrl->minimum = ffs(mapping->menu_mask) - 1;
 		v4l2_ctrl->maximum = fls(mapping->menu_mask) - 1;
 		v4l2_ctrl->step = 1;
-
-		for (i = 0; BIT(i) <= mapping->menu_mask; ++i) {
-			u32 menu_value;
-
-			if (!test_bit(i, &mapping->menu_mask))
-				continue;
-
-			menu_value = uvc_mapping_get_menu_value(mapping, i);
-
-			if (menu_value == v4l2_ctrl->default_value) {
-				v4l2_ctrl->default_value = i;
-				break;
-			}
-		}
-
 		return 0;
 
 	case V4L2_CTRL_TYPE_BOOLEAN:
@@ -1630,7 +1617,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 		uvc_ctrl_set_handle(handle, ctrl, NULL);
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
-		s32 value = __uvc_ctrl_get_value(mapping, data);
+		s32 value = mapping->get(mapping, UVC_GET_CUR, data);
 
 		/*
 		 * handle may be NULL here if the device sends auto-update

-- 
2.48.1.362.g079036d154-goog

