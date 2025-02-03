Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BF52054EB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585657; cv=none; b=D/Q5txmFudpe1gdHzgD0o0H8hYSedb3xMDJsW+iOMWDbyJLvrron8keRDH9tibere4fsfQW9i84S39SX/HyO0/E03s6eQbmNoRJswIMoBEWCXI3tLCR4KfDhe8JrqgA18FYbwm2y96Matq9Aah6BKxU3NPZ2z2+V4SGr7hyMeRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585657; c=relaxed/simple;
	bh=yM86SLF/6jAKbL4AMHEe3in6d4WcCvkufzZCjMCgLeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KudfwtSOjnzLjf7wH72pdsBYiFMXkedvTzS7PExvwoYTcOiTsTp/MTPeKzIUX4fUNP8nMwZQBJhGwEq4MSO+mUpLHF0+mJwE7VryQjb3uuq4NoqLRHjRApR4qCAc37wltF3oCbGSMcBUUSOL8syCH3ZlPP4sB0LurwXYfF5lbOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CrXroWyz; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CrXroWyz"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467a3f1e667so27605151cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585654; x=1739190454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hiuieGhjR7AOoPsrkH+6ULiRM3jI6DLF1E4FTTyWNk=;
        b=CrXroWyz5/rIBgI3iizA0mxANf/TufkLET+gWRNG29JzzLdH77e8ppvkhmIxWVaxq+
         1SCp2PMIPJCc+9Fn8VrC5umDDhhR8E+H/d8WFZ2EuL3zLnqezOVetgDRREvgamk5NLkn
         82jMCyTnXQB3Z7gXS8Un/uEk4t8SBrIavXE14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585654; x=1739190454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hiuieGhjR7AOoPsrkH+6ULiRM3jI6DLF1E4FTTyWNk=;
        b=GiLe5Bk4uKqAZkg6eAejUMmtES3gG+L05GrH2lPEM5bc75mxmYo6qGdIR2P1DOspfK
         lX+7ex2pzJ7cesJm7101x8COcA7UR15/2SWclws/LMFfrgXKBE/5L5CiAXktUXwrIrKA
         9SZDl5AhCg1JmTjuzwQyeu2u7T+Wk9At3Lgni6ebpH0W6X7ROTKjlD/RsZbwMOTua+SG
         q/UGo+kFH20Ba89jgjy6Y6bItcBqcLSxbcec1SrNbheQbMtWBQysss28FMZcW/8wFfDQ
         kZVdCTZagfx0aLZ7tVsCS0ml79T6WhKzivygzYYE7BCt9ZcVfb6JYDGSchytccFR/wBP
         CQcw==
X-Forwarded-Encrypted: i=1; AJvYcCVvzMPNk1kjN+FmWf3m0J6rnj3l5EXnXex8ZtPCFGDPFFauRTAfgapgdWdof2XMySIEgodbtVPqDGBFDsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKrqJBHTfW4ON6VF24f5yxw5MUa8YmPoXAiDOMMMvW74AYWDf
	6zDiYh7Xv9E1smzu9Va7uV5GaDib/0sjjuvuWz8FMXma+ya71sabBAEMPNbPBcwGqy5b5uptHYa
	+Gg==
X-Gm-Gg: ASbGncvTV03okBiFAU/p56ztQHPO2PtK54MaZdE6XcwIUY4OLIFlMPmpXu5310IG6TS
	SBcX7qvHnelvMOcIa+8HNwg/JG2Bu4N06r8UE5e2FdinBnq4tVpctllL9i7RNx6oWJhtdkgChIs
	zp7j7K/zjDS16TXzX/cbwsMjWKgoJd/ouVQGkZGhYDKKRqvko5X9nhhqhsTWgqzGjuiKWMmZW2E
	lb1KcGPzWJ2QPmHc+PizgntIgoDyhYMI+5z55S6bHxYOh1P246ml3eVu2jOvIodbFkEP5fui+Q4
	ckGCNuHUrrK2kt/XdHTKl7eQv5yDKywARw26LhE9uGq05X+uy7HNXe48XtXSH7cIjw==
X-Google-Smtp-Source: AGHT+IFIwj70LhWN6hLpuq3VFcv+Apm216xu+A8hJyiHZuuHCWjbdAE/0GZTA+6rZasVQKTSwB6rlQ==
X-Received: by 2002:a05:622a:1451:b0:467:73bf:e2ca with SMTP id d75a77b69052e-46fd0b916f6mr246510691cf.46.1738585654488;
        Mon, 03 Feb 2025 04:27:34 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:34 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:25 +0000
Subject: [PATCH v2 6/6] media: uvcvideo: Do not turn on the camera for some
 ioctls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-6-bef4b55e7b67@chromium.org>
References: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
In-Reply-To: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

There are some ioctls that do not need to turn on the camera. Do not
call uvc_status_get in those cases.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 90ec6f0015ca..121a582c7945 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1379,6 +1379,26 @@ static long uvc_v4l2_video_ioctl2(struct file *file,
 {
 	struct uvc_fh *handle = file->private_data;
 
+	/* The following IOCTLs do not need to turn on the camera. */
+	switch (cmd) {
+	case VIDIOC_CREATE_BUFS:
+	case VIDIOC_DQBUF:
+	case VIDIOC_ENUM_FMT:
+	case VIDIOC_ENUM_FRAMEINTERVALS:
+	case VIDIOC_ENUM_FRAMESIZES:
+	case VIDIOC_ENUMINPUT:
+	case VIDIOC_EXPBUF:
+	case VIDIOC_G_FMT:
+	case VIDIOC_G_PARM:
+	case VIDIOC_G_SELECTION:
+	case VIDIOC_QBUF:
+	case VIDIOC_QUERYCAP:
+	case VIDIOC_REQBUFS:
+	case VIDIOC_SUBSCRIBE_EVENT:
+	case VIDIOC_UNSUBSCRIBE_EVENT:
+		return video_ioctl2(file, cmd, arg);
+	}
+
 	guard(uvc_status)(handle->stream->dev);
 
 	return video_ioctl2(file, cmd, arg);

-- 
2.48.1.362.g079036d154-goog

