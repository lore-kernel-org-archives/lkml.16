Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646D206F2A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583776; cv=none; b=iHzQ1DfVOUGcWnTngzIQ+s/Ph/4dixHrnvzt3QxKrJ6eJ4SMITpQU0lq7oALFDB6JG4c7SG5rR/s6hZLPVLcJKQ87mC7Ngh9mwPQ4b2yTTi1lTefHv2qHRrTktHuyOOT7VKLnkXGQXfqqmLJ+NF8WB7tp5qvdOKCipIVU959s+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583776; c=relaxed/simple;
	bh=KB4ZUGflb08SBeygnOriQPhddguTjGuBK5bS60Mly+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ICPGj4zUZb4DnoB9NWWpC1I/yCZzoKAv0b9PEAlbkk2PnU1ocf7/6taAFREkiclPaUs5+nim8YL+kcVMF4KqhI6v/91g/qenT3llx817gotmQOpzlVCR0ZVvLDqb9uYM9f5T2n1leTeWzjdG14h0k9RRseQo1QuP5lvc+kIDBmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BuHiA6+t; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BuHiA6+t"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85bad9e0214so1929586241.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583774; x=1739188574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVo9C3QqUMMv3jC7pdvKHUdadHQxzjv5Xy2z0Ro/wJ8=;
        b=BuHiA6+tCAkTp5VWxnnrfZk6zYzFhBEdAAmmjlesZr+wjiGXlHybfttiHIol3jXSFx
         43FL+n/fqZ8BgkzMdWB5ciKZtoec8MjcXpMY3EiR4KsHL/xnEh34MqPq19ZY083W4s3R
         GOcET6Bv5OCsqZNExw72bcO8VrCa0KnUGTSaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583774; x=1739188574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVo9C3QqUMMv3jC7pdvKHUdadHQxzjv5Xy2z0Ro/wJ8=;
        b=b4N9KwUxQqvvs77xiYrH3hSEpWHfGOFCi9Xzy1s3DFVL8F53dUwkCG8ciUwOVDHIR6
         yuLVoWKvbjKHV2ArfBSmZUOd5Ck5Ih64CR4k4A2PHxUcp2We94yEx5ZJIZGDSt22FOeV
         fLIi16SwszwKaHNr3DDRUYGdWYyLnDac18+1ca8G1JxBj+/He3XFlVq/lEoYUaWi74bn
         5jGcaUOqXeMFf+zetZWMr7+NILFvqFMb1BChjFLsEa4wwV8CjIgqS3J5U1zwmVi1TAVP
         ztnoPRHHj7xAwMWYL2CQZKniORz6G+dqJihSU55XJx92Vx8QMGHIvHHFJuuqs68EYE5P
         7G3g==
X-Forwarded-Encrypted: i=1; AJvYcCVDWHFkgXpoNb+tsyMxlU7rGGAZboBPI+DUHZCVU79yuvMnK7Nvyd/0DlKXlYgBrDDlijvCbBdAxkeAIcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykq4g4YBm8X65jUEm7RWzezs2gd3TSWEA2qsnqbKZZq8xB+yw1
	tATzXzK/DB2zMJZSlAS2pk3LNqp7Uvm1LFNg/fMUQlc33uxrIw6ApjUGnnCi+w==
X-Gm-Gg: ASbGncuFZupjbI6KTX/h0ROwAxxsiadVfftX6HzBk42FbF+wFweccS5h5xaaY2yLLWO
	ZIr88/EdLlPrnAl4DSPirbO0AlHk2t6ZxPJ3Rx/u6xoNUjZl4L04NpeGM6t/qQ7E9Nv5ZiTdNsl
	H6CQkC8xnHE9sSiF21SPPlP91eClrCFJYYYNOQ1ZEotI2l5YxCbrkLy4Z7ap10fYtR/Qyn8YAGZ
	9Lr6T43Gem9xX6+dL7dnd7YCBcbaorIqThHakbd2APKD3oRoj+bL4RcMqbXL9rFtN4WyvAfUvFH
	5EDN7ZblcepkAU49QNtK1JjO+fe+9gPXyTA+n0+uBrKbuo/6NU/JECMcEwwaCfKavg==
X-Google-Smtp-Source: AGHT+IHjiL4llIOfHY0i/Ml1ATfZuAes12e1J4qhFMEy3cP2BZEcsCtof6ekuCPTEJTO80oewTtWfw==
X-Received: by 2002:a05:6102:1041:b0:4ba:b6:647c with SMTP id ada2fe7eead31-4ba00b68182mr209477137.10.1738583774051;
        Mon, 03 Feb 2025 03:56:14 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:12 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:51 +0000
Subject: [PATCH v17 15/17] media: uvcvideo: Add sanity check to
 uvc_ioctl_xu_ctrl_map
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-15-5900a9fed613@chromium.org>
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

Do not process unknown data types.

Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 41430720ed47..d56f482723d3 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -108,6 +108,12 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *map;
 	int ret;
 
+	if (xmap->data_type > UVC_CTRL_DATA_TYPE_BITMASK) {
+		uvc_dbg(chain->dev, CONTROL,
+			"Unsupported UVC data type %u\n", xmap->data_type);
+		return -EINVAL;
+	}
+
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
 	if (map == NULL)
 		return -ENOMEM;

-- 
2.48.1.362.g079036d154-goog

