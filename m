Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3951328EA44
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455101; cv=none; b=WgHodVHJ+EPkFEshXwykrkfgZAsC8gS6vBvdN+3hSQALVyZoolN/Pq0SqBPHC+u472HWxOczdRW1+m7xiiQyFq7i+/RM+xwYW410jUz3/BrRQZvLxGz4KRCHyKfbItrJgOhyWidmRf03RcvQdU8Zcse4x4EBFUlR1QmUGk6/HgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455101; c=relaxed/simple;
	bh=HA5ZQn5fQPLOOloa5F6rQaFQ9FTy8GVrXJ6ypXARzQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjNgl76thxEr6MQqypogdnASW0sSb5D8H/oTVZOyPit7lwfNt/aNeczi+sHiMNuBJOmMdfVXq22GbOvTLaUUPl2tsaz8l9vmAdvy0JLp8EeAuELshdD+qlvRX5kWmnj6Zh7BAGVabQc94Q36O/JNPR551LgmBOefMv4ejfrq88M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fVxEhKAY; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fVxEhKAY"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553246e975fso25106e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455097; x=1749059897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCuIJR/iChkHw0yEIzz8Ln6RB6qmCdhlawG29rZoR8U=;
        b=fVxEhKAYkteC/GmhLOQRS9CdyTGTW7VFyGZ5pGSaPKQBvO83pUc3JAhf6erkAJxYKq
         pApgD6o10uMLuJ3EJuZiwIqhRcyri0moiUsULKc7waR6VaYzseDI0eV6mA1Iwlcy2iGX
         UPc+mOZVOz60NuwcvXgtXcipml+gc6442gtCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455097; x=1749059897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCuIJR/iChkHw0yEIzz8Ln6RB6qmCdhlawG29rZoR8U=;
        b=ioUA1FIQx1tZQwc32OCTR2pDiAa/3d8PvA1yVUiEFan/rCvQvglGDViPPDRX7cuppY
         P3q3GMTG+aCXnktnxJS4HDD8IwT1aoLXje42i1roUEoBrvRmENS+RFME0ywdhhXbKTcD
         BTZtgkFzZ7J2UNAgQrXvKq5oNWvdrLU3IwKW0B5RkCL70rG/z5sc1kCfSoZ2ukEN27U9
         OZO68w1MN03USeul82UIQCFytPP2DQk9he8i1bAO/Za58L49bq0nFioPqKpARwnytSxK
         60f2PARsOv89UMz6y+G5EzsmuzQtiWJOsIXNWKg2PHsBK9yI7ub2SdXFljZQOJ64meqn
         YhcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjnU2bBTVjXtQqC1cT0l9MvdvLW36vnZ0EHG5LUwXZpFYPOLmSSWLOKnhXGKDM5wrdu0at5haGkuVGZAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhkDZDHVtaq0B/5vVqMVZY+79ga1BkdZaf4OqFRytA1j22hA/Z
	aLKIH6QNzKuBPLjRhLcWPgO8czhdUOG67l2OojGna9IGJz/6yAPHbj/AYiArBKcaDw==
X-Gm-Gg: ASbGncu1PookgISDNOPA4xQzeSYLj8YwwVg5Pv5LvCsTsmZifnHbWlJEWetXA+OsrhN
	bz1tQWAEXqvWXtcRxMBPim1O1tGXPhlT17fnxqWRXP4B7ViyVhaxtATUbE3mRNFk7MBspcPBTL0
	6EP6btR4fkTffU84OCy5FIZtWu1u6nmqmI64lBPsaRE9JQFgzTmABRxsHmGMeeqpcD9vu1Fua/L
	2T6b4esrgl/7sJip8VzZlqVYk6x8k63vhh3FxWGo3MqMAOCYBYXGUSXZW27gaYIdjwXCULVXbHj
	XKVhlKSsiaQz2nZ1ga62Euk7B7gewIbZrOdfUcL5ioQPjrg8efUbiw48IhenOX3dMg1+BucX629
	piS/dX7/Xx2oES8Q/myZURXMwEQ==
X-Google-Smtp-Source: AGHT+IEfb/5c0hVCUbJITUofOqtObUG+Si5mZBkEHtSmk+GA/XRbpdGOGTWRjSo++W26qr16iDNv9w==
X-Received: by 2002:a05:6512:23aa:b0:553:2480:2309 with SMTP id 2adb3069b0e04-553248024ffmr3984960e87.3.1748455097320;
        Wed, 28 May 2025 10:58:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:58:03 +0000
Subject: [PATCH 8/9] media: uvcvideo: Do not turn on the camera unless is
 needed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-8-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

There are a lot of IOCTLs that do not need to turn on the camera. Eg:
- They only operate to internal data, like UVCIOC_CTRL_MAP.
- They are not applicable to the uvc driver, like VIDIOC_G_AUDIO.
- They are handled by the uvc framework, like VIDIOC_STREAMON.

Remove them from the turn-on list.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 57 ----------------------------------------
 1 file changed, 57 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index e7373a2ae3c37ca02f9076773154901a603820ac..fcb1b79c214849ce4da96a86a688d777b32cc688 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1291,75 +1291,18 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 
 	/* The following IOCTLs do need to turn on the camera. */
 	switch (cmd) {
-	case UVCIOC_CTRL_MAP:
 	case UVCIOC_CTRL_QUERY:
-	case VIDIOC_CROPCAP:
-	case VIDIOC_DBG_G_CHIP_INFO:
-	case VIDIOC_DBG_G_REGISTER:
-	case VIDIOC_DBG_S_REGISTER:
-	case VIDIOC_DECODER_CMD:
-	case VIDIOC_DQEVENT:
-	case VIDIOC_DV_TIMINGS_CAP:
-	case VIDIOC_ENCODER_CMD:
-	case VIDIOC_ENUMAUDIO:
-	case VIDIOC_ENUMAUDOUT:
-	case VIDIOC_ENUMOUTPUT:
-	case VIDIOC_ENUMSTD:
-	case VIDIOC_ENUM_DV_TIMINGS:
-	case VIDIOC_ENUM_FREQ_BANDS:
-	case VIDIOC_G_AUDIO:
-	case VIDIOC_G_AUDOUT:
-	case VIDIOC_G_CROP:
 	case VIDIOC_G_CTRL:
-	case VIDIOC_G_DV_TIMINGS:
-	case VIDIOC_G_EDID:
-	case VIDIOC_G_ENC_INDEX:
 	case VIDIOC_G_EXT_CTRLS:
-	case VIDIOC_G_FBUF:
-	case VIDIOC_G_FREQUENCY:
 	case VIDIOC_G_INPUT:
-	case VIDIOC_G_JPEGCOMP:
-	case VIDIOC_G_MODULATOR:
-	case VIDIOC_G_OUTPUT:
-	case VIDIOC_G_PRIORITY:
-	case VIDIOC_G_SLICED_VBI_CAP:
-	case VIDIOC_G_STD:
-	case VIDIOC_G_TUNER:
-	case VIDIOC_LOG_STATUS:
-	case VIDIOC_OVERLAY:
-	case VIDIOC_PREPARE_BUF:
-	case VIDIOC_QUERYBUF:
-	case VIDIOC_QUERYCAP:
 	case VIDIOC_QUERYCTRL:
 	case VIDIOC_QUERYMENU:
-	case VIDIOC_QUERYSTD:
-	case VIDIOC_QUERY_DV_TIMINGS:
 	case VIDIOC_QUERY_EXT_CTRL:
-	case VIDIOC_REMOVE_BUFS:
-	case VIDIOC_STREAMOFF:
-	case VIDIOC_STREAMON:
-	case VIDIOC_S_AUDIO:
-	case VIDIOC_S_AUDOUT:
-	case VIDIOC_S_CROP:
 	case VIDIOC_S_CTRL:
-	case VIDIOC_S_DV_TIMINGS:
-	case VIDIOC_S_EDID:
 	case VIDIOC_S_EXT_CTRLS:
-	case VIDIOC_S_FBUF:
 	case VIDIOC_S_FMT:
-	case VIDIOC_S_FREQUENCY:
-	case VIDIOC_S_HW_FREQ_SEEK:
 	case VIDIOC_S_INPUT:
-	case VIDIOC_S_JPEGCOMP:
-	case VIDIOC_S_MODULATOR:
-	case VIDIOC_S_OUTPUT:
 	case VIDIOC_S_PARM:
-	case VIDIOC_S_PRIORITY:
-	case VIDIOC_S_SELECTION:
-	case VIDIOC_S_STD:
-	case VIDIOC_S_TUNER:
-	case VIDIOC_TRY_DECODER_CMD:
-	case VIDIOC_TRY_ENCODER_CMD:
 	case VIDIOC_TRY_EXT_CTRLS:
 	case VIDIOC_TRY_FMT:
 		return uvc_v4l2_pm_ioctl(file, cmd, arg);

-- 
2.49.0.1266.g31b7d2e469-goog

