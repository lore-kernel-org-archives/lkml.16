Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68C11ACEC8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715891; cv=none; b=jn6uugEOUl9c6JLirFgCjxIdjahc818bJqKrP5LJKoH6yN6EnzTQWyOuwWoFr5KDm8OCLHx/YbnUSHSTT4SQcvnWmMY5zf6yAzo/sAl2HDEvdtYmUFH++LxjnzmeKNd1tMRPPPdf6FW/rwoNC7yIdwZ5rYvGEKkNXUnILnjn5Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715891; c=relaxed/simple;
	bh=LA7uZ6q3Sc7Jg4Eh7U3qdrnVOUP1fZHPRdVwZ90iFbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEBtMtQvV0kBHcP6RBdkUwaKy2tjHNwNBkH1kfcykpxTcObRIZ2CR0aqjpRamhMGVz7b9zhbQjUNKiBMkPGe0iYYWYdm9/AUj0SjSgS+XpoNw1tjHmikNu73uN1YVMciWfeJPmgCPfWzLGllDiQk75L5xhP0BsbvgYKAdorSg+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IY88jJEV; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IY88jJEV"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b10594812so1557043e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743715887; x=1744320687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptSauccsQCiihyTIqD40ILfoZlJ+Jkp9zzyDCujSkmg=;
        b=IY88jJEVVcMjS16BXc3JYSWqvTVkuMJ+eFVoAN4MqvNa+xgT2sgjUDRNTgK0xshgoU
         FfrvmPsg85f2/8n5co6bplEwQEwhecB42avY4tNTT8uDyv+U7+n6HFNWUj9iUEstvwUz
         Qa2ZelX3TlDAeYAkX3O2pFxyz78PDFY+lZHiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743715887; x=1744320687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptSauccsQCiihyTIqD40ILfoZlJ+Jkp9zzyDCujSkmg=;
        b=TMugKpuebhVK0sZs/wifxITyUeFYMYHtFsLc/oRc2MjjBXyace4XzljO5AJWUV3S/X
         IiGDT+wIm4CqCiZzeeRbgXcqJJBbspG0e+q6+kOIE6TueH0m39e4BsU67/yNUiIyCTf+
         pKP+1HVPvR0z2Wu6zDnNJEbKaoyTf1v006L+wGAQYdfZaD0hsKD3OlASavRNVvWGDa6+
         5yrrrvG+Bnr8bVH90r+6/BzMkkiDd2fHYSqEdryF45zONwxqYBNnjSfbOBkmp7vMCyoB
         4+yE9oKddkTxhI0YpeM63OcwrugMuycik72PfR84O6z08dZKBSOhv1HJDgVyI9tfiCLl
         rQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG6b8DFqVpVtajvh4pvqB7RCDkAMdqKzqoDHBTpy86l6jDZNHcje1pyEAfn3hwacUE3ZRu3PW6L2KCSTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YywpfT8KyAyWeXXSzHCCgt6mYabikDllWSxYd8UznUGOr+mCg8I
	sGGWAkebUGuJKKPFzBxPYDjT1/JLqZIYlSikrEvHNLECFyypLLThrW17cwt7ZrK0KYGkKusH1e8
	=
X-Gm-Gg: ASbGncutrxDxbZD4yffCjHoUpeTp3s6ghR1GntbHNYtzttUEOjPVDctqVyG2bPzrtR1
	STpiyKwrrBtr6k8mlZdK4+qTbG2z19078D8WMs3sP2+KH8XgnlukTAkCnZ8OThFjMnmegYUx+us
	sOkZrp4Fii/tsnoqoCej0+sfJumywalwG+zSZVcyMEUMy+cFH4fEmXPuqknmGIco24q8oyNxUYK
	Yhc4TqDBecr8vn2qgptUOa1NfjJJszojYm7fbkXSPg27Fh8uAFZipu5CSQzZxMUsJnyGKLrI+rE
	TWmNMfk2BZ788e2gOWUqtG4UqEmKSqgWU+sVk5m4an8EWIoT4lCFkqu86BMGAsr9C1NyDuH964a
	WqYQMCJThaqVqCp2lt7nUCv3r
X-Google-Smtp-Source: AGHT+IHIzqGAEc7RpQLkJ1WXd/DNbrh96pu+9FFacP/jNhgNPL2Z9Mg7lblGijukf30AT3j8gNlUNg==
X-Received: by 2002:a05:6512:1092:b0:540:2fd2:6c87 with SMTP id 2adb3069b0e04-54c232dc08emr59772e87.16.1743715887457;
        Thu, 03 Apr 2025 14:31:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6d5sm252938e87.181.2025.04.03.14.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:31:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 21:31:24 +0000
Subject: [PATCH v4 1/4] media: uvcvideo: Do not mark valid metadata as
 invalid
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-meta-v4-1-877aa6475975@chromium.org>
References: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
In-Reply-To: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

Currently, the driver performs a length check of the metadata buffer
before the actual metadata size is known and before the metadata is
decided to be copied. This results in valid metadata buffers being
incorrectly marked as invalid.

Move the length check to occur after the metadata size is determined and
is decided to be copied.

Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007c1f0a766f331e4e744359e95a863..b113297dac61f1b2eecd72c36ea61ef2c1e7d28a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1433,12 +1433,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	if (!meta_buf || length == 2)
 		return;
 
-	if (meta_buf->length - meta_buf->bytesused <
-	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
-		meta_buf->error = 1;
-		return;
-	}
-
 	has_pts = mem[1] & UVC_STREAM_PTS;
 	has_scr = mem[1] & UVC_STREAM_SCR;
 
@@ -1459,6 +1453,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 				  !memcmp(scr, stream->clock.last_scr, 6)))
 		return;
 
+	if (meta_buf->length - meta_buf->bytesused <
+	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
+		meta_buf->error = 1;
+		return;
+	}
+
 	meta = (struct uvc_meta_buf *)((u8 *)meta_buf->mem + meta_buf->bytesused);
 	local_irq_save(flags);
 	time = uvc_video_get_time();

-- 
2.49.0.504.g3bcea36a83-goog

