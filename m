Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD071A3175
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936733; cv=none; b=MHqIVZ+c/MNJ/bOhTYM9WKyTjs/9Fx9MmjwQyA0depJwyxwUAPN5l8Z5izAxt76fhZhomBCwQHMv8vgO4C/PHEX6Xh09/3I0XnCj1TOPRF6/TZq7yeNCt2nZ8w4bCyA+adptqQ5cAZ03RZVUkWbJ1VXSu7MB7feC6LHQlukPn4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936733; c=relaxed/simple;
	bh=bydw5Ui1Tm31HV00k8hjsx9u+m7wpL+0gQpn2hpNiaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rtgcof5Ac73KrcX9MtVZIWc0UXAzLEMxi9khGLWW25wSFOFmLAub7a/VV/+mbnmyS6Xh9tbJhN84ET8Ya+Xi4KboxV3OEhlZnciBq3WW9bKtpzf0A4sbk2jCrV5IQXczo55DlOO2Xcsn7pjsfaNike4jhramDToi110p5F5fYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m7Zo6JR5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m7Zo6JR5"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-551eb58b707so7351433e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747936729; x=1748541529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2ietCEWaMSFLfYqQUoQI2jJOy0qZzPyzPT/ShmHYYA=;
        b=m7Zo6JR5wnDeVYbQYBslCHS/SZ/rlaHxWQ4Irk04m5KnDD1nRRasEMQVUN0C70A8o2
         rdp8bFLlCnI907fjAX+zUP6RLskaSp9SARmEZlwO5tyDggOIbWzVTsBUWi261AO2NB7z
         rYfKP3uAqMgykqrBVPDkuhkOQ8+MFd+TC4Tlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936729; x=1748541529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2ietCEWaMSFLfYqQUoQI2jJOy0qZzPyzPT/ShmHYYA=;
        b=Z/LZPROS5iU8wQxhdIwEYkAI/tzakaRACyv+Bm2ewIfub/v49rkduimTmPb/wXeQbz
         0X8QyGt+ZQNteMeBlaMItnsdK67smYp7EJPcaNZEls9QDq7Ed+5HQybpAue3xNs4Hr1Y
         ZFZF6e4jopmGiOMWMgEZh3jTUcJvHpywD2UCXyDO6B6T5uG6YVTLAA3J8kKyEqJuchIT
         j13okMx8GR97ERDrHyDgFFfPqFymNftLhcaNe6ZykKLd7oXymWBJ3g9GtTxCtINr9EJ3
         h3/nxC2OCMVGL3cB1Ua1TjyX0z1if3nG3u7kP4iVFG28BHKFLygagiUVbs8zykrFlGON
         9J9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYXLDCo01JwJ+z3tP7d6qdq3PAA3f+sGD3zXewigTEnsoTJ1nOAgeR2SPrX+PpKgcI+FxgMXkHeK7tya8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf718h+/3ayF4eVTI7V8G0T7zz8SSF9WxBaX3jP33iIK6lmpCx
	Hx1jnMt5RD9/LuCzfvYHNlYm1BsMAYnqRCkLN0vbzqRI6j1aSk/wG7MMwN0Kz15jCw==
X-Gm-Gg: ASbGnctKsKo2yRHsuzvavtiLgSq5q1QuYD9eHNIoNfPI6kMDNe3nPMkCT5fBpImtgrg
	f35+xS+Z/vCllpv4YzHpvOVjYn25RkcnVfEunjPH14Fj1fbtBZ9SJLm5btLT69GEbGPDDvAxBL0
	BMik6j8nNJnN0zgS1OB2zvaM5eDMKyjo0h1ke8YzV+D/VfSrhNyUoGK1sWhX3Ml/a603AC2eq1p
	PcFDP0B8leJ7F2/GKQkX23DTlSfVCQJDC+Vr8U/Cmw8GhjM4duFie+v1gRCI45EU7GPCKcwKZLW
	mr51UdyJRhwz6K3PAp6MihuGRpC3PSiolrZ7CYoR4tjowedBGWqIx1G02KGXYEqqgsIXjxZRMy2
	NK19EVWBZNWGlra2qc06tB8kXGPIsipUd2P75
X-Google-Smtp-Source: AGHT+IFQHiACQws5UAdZS7de+bdyVNoxTk6zhZQaW3UjcwLI08Kw75LBltk94ixJi/18ILaVsZ5dGw==
X-Received: by 2002:a05:6512:3f27:b0:551:f76c:59fb with SMTP id 2adb3069b0e04-551f76c5c68mr5405231e87.40.1747936729292;
        Thu, 22 May 2025 10:58:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e858sm3483992e87.227.2025.05.22.10.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:58:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 22 May 2025 17:58:48 +0000
Subject: [PATCH 3/3] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-uvc-fop-v1-3-3bfe7a00f31d@chromium.org>
References: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
In-Reply-To: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The is_streaming field is used by modular PM to know if the device is
currently streaming or not.

With the transition to vb2 and fop helpers, we can use vb2 functions for
the same functionality.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 12 +++++-------
 drivers/media/usb/uvc/uvcvideo.h |  1 -
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7a5ecbefa32c0a6b74c85d7f77a25b433598471e..51419f443f2c43dfd17a9782352bd2cde1094732 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -617,7 +617,8 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_ctrl_cleanup_fh(handle);
 
-	if (handle->is_streaming)
+	if (stream->queue.queue.owner == file->private_data &&
+	    uvc_queue_streaming(&stream->queue))
 		uvc_pm_put(stream->dev);
 
 	/* Release the file handle. */
@@ -684,7 +685,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	struct uvc_streaming *stream = handle->stream;
 	int ret;
 
-	if (handle->is_streaming)
+	if (uvc_queue_streaming(&stream->queue))
 		return 0;
 
 	ret = uvc_pm_get(stream->dev);
@@ -697,8 +698,6 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 		return ret;
 	}
 
-	handle->is_streaming = true;
-
 	return 0;
 }
 
@@ -707,16 +706,15 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
+	bool was_streaming = uvc_queue_streaming(&stream->queue);
 	int ret;
 
 	ret = vb2_ioctl_streamoff(file, fh, type);
 	if (ret)
 		return ret;
 
-	if (handle->is_streaming) {
-		handle->is_streaming = false;
+	if (was_streaming)
 		uvc_pm_put(stream->dev);
-	}
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3ddbf065a2cbae40ee48cb06f84ca8f0052990c4..f895f690f7cdc1af942d5f3a5f10e9dd1c956a35 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -626,7 +626,6 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	unsigned int pending_async_ctrls;
-	bool is_streaming;
 };
 
 /* ------------------------------------------------------------------------

-- 
2.49.0.1151.ga128411c76-goog

