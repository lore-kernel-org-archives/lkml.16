Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAB728E570
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455099; cv=none; b=e7qefdsgeZvhNBBxIvf6fW1OZRyd2Gh6axHT4CoD8Ou2srKNTwSJoA6iLgPdyc8xmFScFpPBHAHL0fGIeCxeexIJdvXDq0Em4SZxOy0mOxz9IA69c+rGVyeyVU/E3Xa/OaOtPv9tDWqLyQUy9hzxoPb/mXQ6Vx7TksURWxrMuGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455099; c=relaxed/simple;
	bh=jqykq6B/kJzsStcArhfP2exmz11fn7LB6mdjY5eqB4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FqlP1+GZqkXaIg3h34dS15O8czQ5kFK3DUtkwua1iYEJvFxyCprVVRCmSWlQOIu2aobV5FoH4ZLccTdHJoAxQsoYMoF8rdMLR+7c1ViqEMJZVl+GLJkqnyTrFdaWSkruwbNG3pZ7iTGPzN/ToL1aiyV8uPeF021ulq07r6iDO4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OpB4pEm8; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OpB4pEm8"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-551fe46934eso152214e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455095; x=1749059895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TMQfG/b+RrG3RPI5Hk1oXSiQtb/gQB19d4Z/Tsqyas=;
        b=OpB4pEm8hK6RclpuKqliAbMPbxpm5fWV9gw92ejeV8ZqNPMp5pG6PEU/DJMCrY5xJu
         V6JQ66cFtGbpeQ6LI7pK2S1QnyC/wv4REc8b72v9dT+K+hkfuMfvZb589TkCFlBVPO62
         QS8Jfy4xmxXwkCwUTKWqhImHZOlTwL5JmfE84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455095; x=1749059895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TMQfG/b+RrG3RPI5Hk1oXSiQtb/gQB19d4Z/Tsqyas=;
        b=kbj1p2hw6jzycHO77Wys8pDVp8N4PEdtWuaTSnSx7b/Qc9d0j0gRaWVn337806U4Cu
         WyrIN4AgBgV0TsaY06x1rUoQqgaMSXr9qxlVmCe1Oi/4k4Q8XXH6dVkSZyagssfckcsp
         UKmTJRYxSPDcWfVy+Qmq4NjENzypfeLj+f9N9ww7erS4ZksAhdye12zSrLHBZJQWWTpI
         TZhluRPPD2Q3QjQf4p0MWMJwemfqA1LxxS0FOpY4VoN8Z4TLBP30o7X0Pe8qNUrF06hc
         A9FH1ewyLPdEu0GtiiJLhpHUB/wsmXkncdFz1MC+0Sc9jABu2wiU2ZnxXZu6mRSgJ5yq
         YNSA==
X-Forwarded-Encrypted: i=1; AJvYcCUX7mFuuanYp4BOv0oEIVWsLWiflGz2XSqw3HQNtk7bawkwgIiR8+AgBJ7j4uJSW+sckPvHxu1gv29Dt30=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxtPAhvaRO/9HA2GmcJnKlmaW0RucaMoGpi14dE6katDTisvJ
	Tym06gMY7Jt2taqy3jjeZpYmtc05C0bFR8EIQzwZTLOFUcsLEEaeLqRpaaWMqOdYGg==
X-Gm-Gg: ASbGnctIiZVkSE+i+D+BsqrpyZ/R2SQA4WhtVN51WZLas755TtRmYRC3CaPzZjsRd6+
	CE5Vza69nmEBTm2okmdSB3uV/VpNr4ulL7XMRYWX6201qhRodmr8/jz0UODNwgxeFpWHhgQb0ve
	L90SROz7zfrUuCF5jkd5O4PZmsU6YLKBLRF7BSW/+FAu7ERFjXgyZmHoLNea8m3eie0Tmjd0Xxp
	aDoEQe8VhxTDM70ZJwX0/0cwf9NzQuvP0z09gLNEHMIxfEkzvwwllid3H8cwb0YSc/+MhYfHRTk
	dd5OOIEXQJ9fvb859TT4j4UZZeoqUVWFmP1XuBr1pc/GD8MQUClmnnxVXGPhHh6MLLoLQjloEe+
	2ZXSXC/H12fUqeqL6NvdGlVj50Q==
X-Google-Smtp-Source: AGHT+IHHwo3xql0dM/NDDGD2B5GCCQgwSRpZcvv2I4srv82vxwYj8aiHY3T6f0CcxKjZR6ZAHHBXAg==
X-Received: by 2002:a05:6512:1314:b0:552:21db:8f5b with SMTP id 2adb3069b0e04-55335b3239emr194102e87.27.1748455094821;
        Wed, 28 May 2025 10:58:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:57:59 +0000
Subject: [PATCH 4/9] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-4-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
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
index 49cc64dd7e2e737f431b9df9df68921d9c543751..65c708b3fb1066bf2e8f12ab7cdf119452ad40f9 100644
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
2.49.0.1266.g31b7d2e469-goog

