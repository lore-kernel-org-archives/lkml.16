Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253B25C813
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352332; cv=none; b=VDflzdr0scuaQ6UZmye0IYvzuSjdqgKqbotModgM64LvAM8GlFVydOKt95KTcO1eAp3M8OaHfujp6gx11S5G/qhJG4fQIVyqgmvSTFMzMqkf/NlNQ+Cx3KeQtR36HCUmFzsi0iygXahohG8LLEjy0FOu6ggyQ4xcij/OBQw6hZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352332; c=relaxed/simple;
	bh=QmZpnmLlh6tX4XaANLS4O9Y/vCKXZvopPBJCBX6jXB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSv0nPVSHzQd6zJD+Y0pA1DAgaUJG6B3wIOrGtoWv0rQUwf7FYuovW8BkDKigRlz3HjRPETYrzmYnLT1OuNEeR5H/jmoXHlInyu60edcSdCbzyKMi+/jZ1bnodr1vj5PrbaaloeUrVftqb7Ahm1NY13JGkBxe2oRfBYE8zPjEjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R3TSDtgQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R3TSDtgQ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-555163cd09aso2188286e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352327; x=1751957127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mD/ZZfdswixudH8eqV8nMYQf/9eq1jLBXUnC6Jy/I1E=;
        b=R3TSDtgQZ+7xQlc6edqU2udtstZq4sCOUKPPxSwmA49CKSkkEkg/vE40ks3HEmDlHf
         E7Dp32fowhMpNZkEnZYVX6IoVEtp8h+9F0znPmxrPZGvSVd7ebe5HlPh7NkrNnydXYsM
         cdeNUE8/Wh+rtoGK8uludInZtWaSwZFBVAgSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352327; x=1751957127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD/ZZfdswixudH8eqV8nMYQf/9eq1jLBXUnC6Jy/I1E=;
        b=bDBnBNOf9F5SG7nUpxbv67Sv82VNA/zUjkjZcUz8FkoSSId1WqOgZ5IsIVE5PyHJlN
         vDGo38qqWVDBxk/g3MRJpky+Iz/jnfeAUmHc4HGh1TiljFw+Zo4eVWLo/q/q6NP2hUt8
         HSjVyDRqhmtEQMk7QCLF+AHExwX7YlkEBfL+u75ASIQKxztdvR682mscE3zu02qpCOVC
         bftbllbKLmkVpYOLD/VtlPRfhU0yGAcUHAE1XMlfBHP4Pz6YpopM4NofXdFab4hY/MT2
         ourUCeJc1RlIwtXaLoYdcQx3CdttEFLYq6cVLrJqc4KBw1iZighbjeewjRVPgetNexbh
         KRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxBeomUzZvTIr0ER4G9i7/qcr2fdYyikTKtNxOwa9pUZYLk2PE/zyKzwviN4ywanx4yGL7iukekJbYWFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2jixkcqZ3+Yz7EB9x2lNjngvFgFx+pNlwLNYtYPuEEpcOq20y
	XV4Dqz1onjx4kWgGOo0XVXXezKnBNLExwZnOhj2Geu93XW41MvGtvqySAs+pf1ScAQ==
X-Gm-Gg: ASbGncu/sbuuFmuTARmW8P2Xmhv9LGw+F3FKY0FhOwecU1/f8lC8JxOjChtOuu5bMK3
	nPRa4HmAXrNXOqKEWYH0XtsQGV4JZu0ZAqVaSI2S/KOG9SBDHngXeqllzDv9VlMoIGKyJZaFGm/
	qIZXx2knpzCZgGq1Hr73xhZ/TrFnjBUWccRGxjVi7l9XjFwlYK7oEazd96/ksE6CGEIjzFLzI7s
	Yw8js7Fh/6AjW+giE9hG4mWnhOwl4uBlaWc6AQEHglZXNnVxftiXE5msd5X/IHNLtuWpVE379gx
	IPHm0ZYMoYmBfkNZhbLAIy/oK2Ox3gl315jbcpx7jYLQQzk/E9PSHMzf9woNtE1lVkm4/qYGiew
	dIst7SgtKZKf2Oa2Pjr5xHw9T1h5a3+sPiU768RncEA==
X-Google-Smtp-Source: AGHT+IHcvZzYcxMuIZSTWN1rrGh8R7B3bfUeWSAMkh500L9Xm26tRalN09L/Awjdk+uRi9ZggZqHFQ==
X-Received: by 2002:a05:6512:3b0b:b0:553:abd6:cd3 with SMTP id 2adb3069b0e04-5550b7e96bcmr4895630e87.6.1751352327508;
        Mon, 30 Jun 2025 23:45:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:19 +0000
Subject: [PATCH v4 7/7] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM
 logic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-7-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>, 
 Hans Verkuil <hans@hverkuil.nl>
X-Mailer: b4 0.14.2

Instead of listing the IOCTLs that do not need to turn on the camera,
list the IOCTLs that need to turn it on. This makes the code more
maintainable.

This patch changes the behaviour for unsupported IOCTLs. Those IOCTLs
will not turn on the camera.

Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans Verkuil <hans@hverkuil.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 52 ++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7ab1bdcfb493fe9f47dbdc86da23cba98d7d10ff..160f9cf6e6dbdbf39e3eff56a5d5ea1d977fbe22 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1222,36 +1222,36 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 				    unsigned int cmd, unsigned long arg)
 {
 	struct uvc_fh *handle = file->private_data;
+	unsigned int converted_cmd = v4l2_translate_cmd(cmd);
 	int ret;
 
-	/* The following IOCTLs do not need to turn on the camera. */
-	switch (cmd) {
-	case VIDIOC_CREATE_BUFS:
-	case VIDIOC_DQBUF:
-	case VIDIOC_ENUM_FMT:
-	case VIDIOC_ENUM_FRAMEINTERVALS:
-	case VIDIOC_ENUM_FRAMESIZES:
-	case VIDIOC_ENUMINPUT:
-	case VIDIOC_EXPBUF:
-	case VIDIOC_G_FMT:
-	case VIDIOC_G_PARM:
-	case VIDIOC_G_SELECTION:
-	case VIDIOC_QBUF:
-	case VIDIOC_QUERYCAP:
-	case VIDIOC_REQBUFS:
-	case VIDIOC_SUBSCRIBE_EVENT:
-	case VIDIOC_UNSUBSCRIBE_EVENT:
-		return video_ioctl2(file, cmd, arg);
-	}
-
-	ret = uvc_pm_get(handle->stream->dev);
-	if (ret)
+	/* The following IOCTLs need to turn on the camera. */
+	switch (converted_cmd) {
+	case UVCIOC_CTRL_MAP:
+	case UVCIOC_CTRL_QUERY:
+	case VIDIOC_G_CTRL:
+	case VIDIOC_G_EXT_CTRLS:
+	case VIDIOC_G_INPUT:
+	case VIDIOC_QUERYCTRL:
+	case VIDIOC_QUERYMENU:
+	case VIDIOC_QUERY_EXT_CTRL:
+	case VIDIOC_S_CTRL:
+	case VIDIOC_S_EXT_CTRLS:
+	case VIDIOC_S_FMT:
+	case VIDIOC_S_INPUT:
+	case VIDIOC_S_PARM:
+	case VIDIOC_TRY_EXT_CTRLS:
+	case VIDIOC_TRY_FMT:
+		ret = uvc_pm_get(handle->stream->dev);
+		if (ret)
+			return ret;
+		ret = video_ioctl2(file, cmd, arg);
+		uvc_pm_put(handle->stream->dev);
 		return ret;
+	}
 
-	ret = video_ioctl2(file, cmd, arg);
-
-	uvc_pm_put(handle->stream->dev);
-	return ret;
+	/* The other IOCTLs can run with the camera off. */
+	return video_ioctl2(file, cmd, arg);
 }
 
 const struct v4l2_ioctl_ops uvc_ioctl_ops = {

-- 
2.50.0.727.gbf7dc18ff4-goog

