Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69DC1DDC15
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109537; cv=none; b=IAHn5jSQmcXgDUA1vW5zP8gAnlmzCvpc1a2nxCBn3+Q5QteSAIBGzCKa+/6vzuUnj3Soj0kn5kROdDutay3NUwYDaDwkk4nnZGw9H9WTzNSx+UlTgUw2ptlRYQjYhj4DTlRvBARW9nr6P8Yqb7JxP2vwBtqgO73Xw7sFg5+OuSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109537; c=relaxed/simple;
	bh=L2k5FR77Tv3dGgxM6ZctNp7m5GtwwnmXlQlqknO9PRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugy6Xadp7k9LL4YR43VUjRxaAa1PyNFz8uJmBUPcQG4bzPm6Ue9XcteysYK992tLvUsEyK948mtgF+FJqAatKVjkbXHNgQmfFpP4Y5Hnc4b4jIMoriQ//eHHvf3l/SFRkR0Jctd3qfoi1CxLUKYgATJQOtbEWDhcip4oAkP25hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PNbOqpLw; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PNbOqpLw"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47698757053so17748651cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109535; x=1743714335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVmLiRlNaL4IhVq1RzG+BkUyav74o5P1Qd0pmx4xmZM=;
        b=PNbOqpLwsL7DDS66Nn5zOmQhwDPb/UKgDR647HHIC8H3x24vngjCh8e2jBtMQqQWq7
         8PfzPvKgzrJfpgEe6Sg2Ok5B33oY7Ns1RJfn2Kyonw9A/mA5bnlIeE3yUy98uJtjWKAu
         C4fdNF1STp0vg9TEoyWiGukOIhtl66WDoot2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109535; x=1743714335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVmLiRlNaL4IhVq1RzG+BkUyav74o5P1Qd0pmx4xmZM=;
        b=ErwSB1daa7y+pOAhGMeZbsXAmbC0pFdgx2fdHeBDfQA1+EbSjqFF5avdvvV+a1ZZAu
         B24CxIHrAAFK1l5EFChSACIc8O6h7sOWZo4/5DaGqVwWVo65qWJL2ohyPIgaOaCGa7NI
         IY3SgtQd7BjcuVYZANeD8Nuu6Skl8YqRLzTH5vC0jeP6XWnFpP9MUNlLh2Ln95H7I+MV
         X9taUkz5OzUIc6t9pf+4pDrRIshxav3qIjPrvoIhF/nFzpcTeKOu1uyhAQThHKi+yw/n
         2DgDCmFj4PY2fBRHYlGf/ZynPxFVtafhtoJHO0rawv5X7GJW0Wfjm0Hr0YzWv17mkM3O
         5cUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWryC5G/9/Sw2HB63UhHKrl2nIM06FbZ9nShRopncgvy6zroeSGC3cWeN8FfLOyHTVWZXj0TOtvN3g7JiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWsdEi8K0l43CAWZsCwBsmo07y57YOmEetU0ShXkW/6oaWVuwl
	EkGpJobghXmroBDCw2oXSt8D6x82SttYaLpUkLhZ15D4O+TYTsWEReTz1tcbPQ==
X-Gm-Gg: ASbGncvIjTItEfnB1kma3pry8E/FvlA5eTEkuq8itO2dZHTNz/6aG4/0FZv1yNftu6h
	viCyL+bpn/w4kPPkAk4KwwBDgPa3DSGGzTWZqMnnyC04t3PlUWZtyft+gpo8faF33uEbuYQRtBK
	6JsneJv4YXUdWQtK0UAnGXRUc97qSDC7n48XDI6n6RNxViAb/xMNoWaF0EX9SsS1uzgWmjvPVNv
	0M/QUSK2kLvCdPU4jn7YU2OcQY4ySGrWKXRxgTqDc5HjBPB1NN+MruGX7w7D69+U5x+TJQc90oZ
	G1J/TkLuyxVjX4VtDXoMdkfIva05AmTOtU/FLbM/Sh8i71uVCvvws/FGAFP+HSqn5FxSVKd/2e0
	OaTPFyh4thvK8jdnpsfRDspL/oJg9rA4d
X-Google-Smtp-Source: AGHT+IH4s+CzPmYUo81SjpBSF5aDALJnJGHTfmsABh7gIk5ZQT5giT5nYJXZvzSrxP/zvH19nGs8EA==
X-Received: by 2002:a05:622a:17cf:b0:477:e78:5a14 with SMTP id d75a77b69052e-4776e07a71amr88643681cf.3.1743109534634;
        Thu, 27 Mar 2025 14:05:34 -0700 (PDT)
Received: from denia.c.googlers.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm2275421cf.9.2025.03.27.14.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:05:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 21:05:30 +0000
Subject: [PATCH v6 4/5] media: uvcvideo: Make power management granular
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-uvc-granpower-ng-v6-4-35a2357ff348@chromium.org>
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

Now that every ioctl takes care of their power management we can remove
the "global" power management.

Despite its size, this is a relatively big change. We hope that there
are no size effects of it. If there are some specific devices that
miss-behave, we can add a small quirk for them.

This patch introduces a behavioral change for the uvc "trigger" button.
Before the "trigger" button would work as long as userspace has opened
/dev/videoX. Now it only works when the camera is actually streaming. We
consider that this the most common (if not the only) usecase and
therefore we do not think of this as a regression.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 8bccf7e17528b62f2594c0dad99405034532973d..0f1ed0387b2611c8d21e211afe21a35101071d93 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -658,7 +658,6 @@ static int uvc_v4l2_open(struct file *file)
 {
 	struct uvc_streaming *stream;
 	struct uvc_fh *handle;
-	int ret = 0;
 
 	stream = video_drvdata(file);
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
@@ -668,12 +667,6 @@ static int uvc_v4l2_open(struct file *file)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = uvc_pm_get(stream->dev);
-	if (ret) {
-		kfree(handle);
-		return ret;
-	}
-
 	v4l2_fh_init(&handle->vfh, &stream->vdev);
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
@@ -707,7 +700,6 @@ static int uvc_v4l2_release(struct file *file)
 	kfree(handle);
 	file->private_data = NULL;
 
-	uvc_pm_put(stream->dev);
 	return 0;
 }
 

-- 
2.49.0.472.ge94155a9ec-goog

