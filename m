Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372927C875
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145995; cv=none; b=Mralw1IzksJ8P1XVyrm3O1SoDQV4pSNT4pJhvgSe1bMvEM8ekgVjz1QJ0nT2Wt6CGHo79XDHrrDrm+roqapMPMZecFjMRnnDKEiqQpMgpnRvmN10OoaAqI9R4P1bw4hQhFmv6KmeX3suutaT+xrRI59CPW0Gb4hv9pdnFklftE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145995; c=relaxed/simple;
	bh=R4NuKjk4LUn+NcJI1dWp1KbkF6gjPs2+DtnjDwx4z/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hiVlqEWzmfUsdABi4uypzBosWFzayBMybQpDay0BoMGitkMrsysxQwKHCSdUun9j0W75kxdwJ4uofL9nxbcG1e1ltvwBnml0+1kjdiRdhw+x7IcxdVGedCWDGvyGq8L+N068AElZRMGmu3epwaHrUgo6c6z9eQax/LqeG8220KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V+0C9v+d; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V+0C9v+d"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5535e35b059so1205524e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145988; x=1749750788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKykJ86GJEjKAZ51EtUiBvhJS0VRnpbfEH3e5dzBR4w=;
        b=V+0C9v+d+sPzo+NIIu+xX4SgvhbNXZT1rIU/lO+otk7ArMDYMkCKVfP/HyVr7Gv7g2
         XgyTjdgtyNzyK8o98HyCCx7QsCFysvih4WgTvrcoVgdg2gXBC6HxPmrIL7x35V4oByyB
         Zw5erXMKN13T3/kcFHyctTALxIvFQWaJtsGdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145988; x=1749750788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKykJ86GJEjKAZ51EtUiBvhJS0VRnpbfEH3e5dzBR4w=;
        b=wz5HVMNBKF6cPub/9KkJVDU1bWblm1QlH3S0EDWNL8AMLEyrmd3X70o/FRdmhj0acl
         xexn/of2/zB6A5qvIzgI0XEKgETeFmGCz8qw+b7y3ZMJgLS3+ijK7lOJooLzlgvR7eSm
         NVB2f5+lih52vuk3GysuBnAIAmGWg30yOFII7fLTdE262NJJyM0iodmn0YXr9Q19X4Ce
         wG80JaQUaqwoQ5NoySHVXEovvGluD2rP4BdhxaEJHupIf0/kx8fDzVHve5j2GFtMemXO
         yJ7VLTXfaPxxPtr8E+2wPsWaLxhTA2DdGAbQNTFWVbm+MWJc/35GbeOWt4OO/iwOqYQU
         nmaw==
X-Forwarded-Encrypted: i=1; AJvYcCXcLGbvSUD4sLtPHTEQUVfV1toCeOvZMnOT7azbeu3Xdd/ZBbAdBUulSX1fY9SvOrgF89Osfi+czet1xIM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl/sk5FJbgbOKDnf6IB8ly1AbT8ByR7SpaUsrXyItKv1KZwC9I
	cLQKDTStyqvKIht8xYAjVgd71Oy95N9P/Em/r1PSzu1mLU2vBT8hlfWgxl++iefUr7AYAbPTA35
	+nLw=
X-Gm-Gg: ASbGnctlb5c8UEw2KJ6bCugpwHshFCNAcC4h4bm4JWn2Sor58LmK35wFL1gTP+9gFFu
	Xje3LciG0VF3H3gF/FU6ffzq8cKcxqNE4IiIkHaMM9PNfJoOY9b4IXd4y/AkVNtw9iBDf/frJD1
	duiBZ7sxOHh4hfABqE+djWgfcYVu+FLwzJy92R3ecxc6QcskUN0F2gjvJhnAxpSA0uqxM7jIbqQ
	j7oVC7gxdvYn0WUCvIeww6BG4QX7vu5R1bi/6LaAxAEchh68Bf5wSgeYezQjgpiOJGlvnw+HTTq
	2IgHujWveRp1tKxhLvHYqt9iSNjk3cOrSRULUyEaQQ0DrZ+wXkC495WQEFbCCegE6KpRslk4LC4
	I2vVeUdov83qpxXKgBpZ+yDxuCQ==
X-Google-Smtp-Source: AGHT+IHp+xpg2FO63nkT7Lh5wy4seP/EyKn6xsYU+/2Jg59TJvy9YvZlmgC6AlIASMeTxBqC41J75A==
X-Received: by 2002:a05:6512:239d:b0:553:35bb:f7ba with SMTP id 2adb3069b0e04-55366bf08b7mr21355e87.11.1749145988208;
        Thu, 05 Jun 2025 10:53:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:53:03 +0000
Subject: [PATCH v2 10/12] media: uvcvideo: Add get_* functions to
 uvc_entity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Virtual entities need to provide more values than get_cur and get_cur
for their controls. Add support for get_def, get_min, get_max and
get_res.

This is a preparation patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
 drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
 	if (query == UVC_GET_CUR && ctrl->entity->get_cur)
 		return ctrl->entity->get_cur(dev, ctrl->entity,
 					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_DEF && ctrl->entity->get_def)
+		return ctrl->entity->get_def(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_MIN && ctrl->entity->get_min)
+		return ctrl->entity->get_min(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_MAX && ctrl->entity->get_max)
+		return ctrl->entity->get_max(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_RES && ctrl->entity->get_res)
+		return ctrl->entity->get_res(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
 	if (query == UVC_GET_INFO && ctrl->entity->get_info)
 		return ctrl->entity->get_info(dev, ctrl->entity,
 					      ctrl->info.selector, data);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -261,6 +261,14 @@ struct uvc_entity {
 			u8 cs, u8 *caps);
 	int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
 		       u8 cs, void *data, u16 size);
+	int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
+	int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
+	int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
+	int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
 
 	unsigned int ncontrols;
 	struct uvc_control *controls;

-- 
2.50.0.rc0.642.g800a2b2222-goog

