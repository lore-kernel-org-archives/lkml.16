Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630471D6DB5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109534; cv=none; b=UA+OnjJd4F6DPadxry8Dcrp7DdsuCEUqcI5fkXTF5ccUFbEnbN2fN4kA8/E0S8tDVqZpJ3saUg1r7awWZoclVzJTZMtt4dpu11ngpV3Zr9g8qaxRZqynm0hajrbZDWYwI4FJGa8PN2lcKabyuUMVxSWNiF5Q8KOATQBFab5OW6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109534; c=relaxed/simple;
	bh=TxX5jUZSYUIVTn11fnkYp4dDoBz40yBHO0WykwsdOaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bd8L3EhPancf1MBgv5xSAoInils2R44EFc+ppSx73kltPiOLecDss0LAFaBanyybv2ZTUeeT7VsOPn4D5te/gKRvPwIMMlvQJiS241imKN7O1mYkUGYxrnONlM8ig3rafya42d7W9+ECk+iLVz66CCgGUrA4/kQxJSRbYaZM6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N6JZakIK; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N6JZakIK"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476af5479feso13390401cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109531; x=1743714331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPotFYDYSrv3M9XvSy4jMhSd2liyPs79sEtxtKTVJFk=;
        b=N6JZakIK+stxAfhaLSndx+8gRKWBqgtHsn+N9PTu4QpZ2RENkQKuumT1DJ5U4pJ7J6
         Cg2XM5fWIyJ28/I84dwKeTamk1AiHBL/fKodE32y/UNmtQX8i0fh9lySEd8bD1Nh8Hks
         DaSeHZTvy3oGV8ZrWk7DVDwfsmtWwV11QAnJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109531; x=1743714331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPotFYDYSrv3M9XvSy4jMhSd2liyPs79sEtxtKTVJFk=;
        b=BW8Ip6IJ/X2LlxEKxIFu674ks2CGUWOTo4lnR8roff66sLm2vi4KE3hFMtcLEzbXwl
         qaNFKHWKFP2jy5Mo1vpsuY5u/Sl0iSJkS2ikmLPTSlnRq2z4y1eGKjeyBJ6C6hBl4R9p
         RnwLlEFZDl6ZbQLAIPl/Gq38RjhRGLao8h5qWK48zHE9o8qg7G1e4D/1fU8O8MSx3dex
         1drmv2UmIox3T+QxY0SYVEiMb0tBV4Ns0gfaXmzpZh0IkcXyUCcc/tzmawvY3ohaoIW1
         r42lXU5s7QKgcsbpGCztMzhYYcAwcACfj9lVgaZY2nyaS3aWhRU8Z0hjixnMpRZRFkto
         xZEw==
X-Forwarded-Encrypted: i=1; AJvYcCWYX/258Ryhri3k1GTvclXNB+ibmyVisSrLxtzWThdvlh4dYqU9Q8q9cArbetU4SNuUubDGYoxHkIsYzbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKG4ZjsKWZITcEcKtcD+I4u7Bl0qrZfAyS/lhZJRQv3O0v2XP
	cMR3tX1lITcFuezwJ88STvoTHszkvRKczXAlrw/bPrXQFvfY2JdDz9MInk6eMA==
X-Gm-Gg: ASbGncvzGElzj11+oBv67gSDzK25AIfz+HVtLuHvoSetPQhsvsk0Fon7A8sbHBpi7so
	AKRhkMB4/X6ScrpiKNyDXCZeZywBExkg/mNnrzUn/2LlWw8Th0v9o1LkWI6PW0p7qNL2DIwTsUC
	ZY9J+RA/7xUoe8CzRZqjDRMk7SpwYv+c3G6HwSExZ/ucUp/TTeNcjfujchdJhqsxuSNLZNjMSps
	Vu5nFLqC7VDcn9Dl6VztD2inMtiYfWSXJbrVJlASTG0IgDr+TZbEdGbhqZrHZZv42FwQVi/teC4
	6+B1gCi6c/oceaswXtzaoxT3eAI77SZ149+b27t+WxtwRPjGiiEEmOv3ufbla3FZHrHkQO1t24b
	fAYW2XQE1MQTzTKPLrJdJUQ==
X-Google-Smtp-Source: AGHT+IHj7YZZ63MNCoigRdtgWCTUNBYNqwOaQ+66Py4TXbFhO9b7we5UrotYcuAestOWglqJsI/5kA==
X-Received: by 2002:a05:622a:1928:b0:476:701b:d7ff with SMTP id d75a77b69052e-4776e1ffc15mr72943421cf.41.1743109531048;
        Thu, 27 Mar 2025 14:05:31 -0700 (PDT)
Received: from denia.c.googlers.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm2275421cf.9.2025.03.27.14.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:05:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 21:05:27 +0000
Subject: [PATCH v6 1/5] media: uvcvideo: Keep streaming state in the file
 handle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-uvc-granpower-ng-v6-1-35a2357ff348@chromium.org>
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
In-Reply-To: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Add a variable in the file handle state to figure out if a camera is in
the streaming state or not. This variable will be used in the future for
power management policies.

Now that we are at it, make use of guards to simplify the code.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 18 +++++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 39065db44e864b8d107659197dac9ac33b01cf46..22886b47d81c2cfd0a744f34a50d296d606e54e8 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -841,11 +841,18 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
+	if (handle->is_streaming)
+		return 0;
+
 	ret = uvc_queue_streamon(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	if (ret)
+		return ret;
 
-	return ret;
+	handle->is_streaming = true;
+
+	return 0;
 }
 
 static int uvc_ioctl_streamoff(struct file *file, void *fh,
@@ -857,9 +864,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
 	uvc_queue_streamoff(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	handle->is_streaming = false;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..5ceb01e7831a83507550e1d3313e63da7494b2e4 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -630,6 +630,7 @@ struct uvc_fh {
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;
 	unsigned int pending_async_ctrls;
+	bool is_streaming;
 };
 
 /* ------------------------------------------------------------------------

-- 
2.49.0.472.ge94155a9ec-goog

