Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB87D28C2C2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293237; cv=none; b=Mw09L2SEl8eL60qUX71HXqkwO6NxwQmlMR14JF7C+cgam5u7St+RyZL0jL0VVmehg+ITt2GhECqwah0W1MgZQkSxhMyh7+3+dyyKEng09WKWLUxat2ybmTSksA4xMT4U2Y8BUbxbC9kGIlv6dgD9k+iHipbW7bfLvYMKpo2bxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293237; c=relaxed/simple;
	bh=S0aFpFC4n3QawWa7V2OErQFJEBz53JWrHnAFsX28XUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jmqu/IGqCxN3ybKhF/19c8rmuf6f8QDJouT8unCYFWq9HbB5soNr1DWFvee6WZpr2ciA3Dw0rMXPVbGFc52xS351GdmpTDYu4SXWNICi4HfLr7XgWqA6jeXDiC5KO7k/tssFPmMQFxj/O8oZPGYhwul3WoQZAsqHjWhRgMowUTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HeGFkQRQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HeGFkQRQ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b165c80cso4577050e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293233; x=1751898033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV5zqtGaJFdq64Z/f4wEaBtjans6GYNhmk/s3Cxy0fg=;
        b=HeGFkQRQRPUUfuokoQk5ewNWY/83Csji91i1/neKLNM58RpoN54B1szNCjLEDi/PGl
         Cf3ugZ20+57Lr/ci1Z/M8R05HF9/CovJUoFXzWAN+U+lRhBJuu8R7a7OZnU0yppi1OxS
         N4OuOJAJ3f3KOaQRmFlTgjaw+4qboE5sqnXXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293233; x=1751898033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV5zqtGaJFdq64Z/f4wEaBtjans6GYNhmk/s3Cxy0fg=;
        b=TWYvoAL8y8FFjGwgubebt7JgQ86/t46vuU1ax1brvxIx2OW4MsRQKC/usXxaMd3FUo
         dCRs06MLYnnRMcIQLbmqeKccBdFUDYgQ7QpTbr3oqo8+cKZUPlFP/XkXz3MEMgtabpKE
         lB5G7XkAYzgSLHFDz/aAO2HMtcGtCRWN4L78g2epFlK0f0Z6oKdZZMoaCKxO60RIiDir
         X387+CsFprxgxgmolMFLU21kCwMG6wgE3dAeoRnyxq6siMl5UeN+XYhKz1U4LneA2/YG
         rRkhtJCWATFcbFVw4yNWimwEafkyVyxaLscRlyCokqGKosmy0MHXoPVkgIn/oAIbRq6G
         U4Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUbTCXZFjxRda/Jd2CCA48bl8tAPIeB7KxrzX4j7k1AoAh+smtQjl76tPFChOu78UGSRVbAm3jKSM09HWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLQJ8aULvWy5sT3HC+mm2ShmMp0vMywxbCdHC2+fsQAhYMcpoZ
	s2gn2DkDN1ImtpyrPhhYSfroMHvXOcTTwaD151+2wTcfIkF03a4uhbLJdmes7DhYR+Z6WZY6OBG
	447NO0A==
X-Gm-Gg: ASbGnctKUvZrDQ2g30+JCDjGiuADkTp71XZRFfkntro3sl1Xi/iEMYxjHqshoJgUsvo
	eTGE6UWImgREcIl4/1ZK7zAy53jLXKNNOSzQAlSLg3f+273puSSAsyDblXyQ1/+2KsV7lNCR1lP
	k3evmQEekQmJ198mm3uOyVf+Tp5gy4wXHCPXdHpj0sapw7Dxqt8jfGIl/0f9yowIOqEiEknRbeW
	PkB+WKlzHEWNIF3FODP4IHR3HmXoB+J68lOXOUob4fkl4PhXYR/Q33Ev88KDbnD8ZtJl5Al3Tzv
	jSUPSUhRznQSdolak6snEkSScJyh7BO4Josa15D1JL6aKQe/aPd/rDmj9F96NSC5oTyekDoGoQ5
	VtFs/BQ+Wgl2+J1wPAmNQd9gpST9Iv1LdhpFDFN1MJw==
X-Google-Smtp-Source: AGHT+IEHySu2ZYesyEoFEJ/oKpjAojmH1jxOLz5N72hVn7IAx/v2lionP8GlV1OsFKCtl8ojRqFamA==
X-Received: by 2002:a05:6512:33c7:b0:553:aa32:4106 with SMTP id 2adb3069b0e04-5550b892b93mr4365091e87.23.1751293232698;
        Mon, 30 Jun 2025 07:20:32 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 14:20:33 +0000
Subject: [PATCH v3 8/8] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM
 logic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-uvc-grannular-invert-v3-8-abd5cb5c45b7@chromium.org>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
In-Reply-To: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>
X-Mailer: b4 0.14.2

Instead of listing the IOCTLs that do not need to turn on the camera,
list the IOCTLs that need to turn it on. This makes the code more
maintainable.

This patch changes the behaviour for unsupported IOCTLs. Those IOCTLs
will not turn on the camera.

Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 52 +++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 350cd2cc88f872d2e8bd19e2b8fb067894916364..94dc97448446d36a85a1b36d16c29f22af89c640 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1222,37 +1222,35 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 				    unsigned int cmd, unsigned long arg)
 {
 	struct uvc_fh *handle = file->private_data;
+	unsigned int converted_cmd = v4l2_translate_cmd(cmd);
 	int ret;
 
-	/* The following IOCTLs do not need to turn on the camera. */
-	switch (cmd) {
-	case UVCIOC_CTRL_MAP:
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

