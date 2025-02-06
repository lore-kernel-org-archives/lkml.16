Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED041CD205
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871230; cv=none; b=kS7BGsFaZZmztw3+odjES9P9bidpxWJRVlZJoO6+xy/4BWdG7LrYHaazurizTBCib5xrP5YUn1UpkzpNbNUixmMkN3xhyDx3Q7q4zYq+daolhEl/Irt2lh9tPApPp3dVdgCKC1MbWTulO/ci1USD5r5gl3TIUFosp9APXqN+aHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871230; c=relaxed/simple;
	bh=b6os191LBubYA+XTSlaDJR6i3p2+873ZDu4lZh/isJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZp56hbaGrNgT664Lc+IDs+tcL7ACZJPb/8xMgWl6QE+izC9hSkTHVPqRPg3asuBUpcn3Nov19FU8ll4KK1rF8pbOnG0Jdg8GCC5bZp8uzwW45kyIcn69yKwM6YLRbLUs3sg/Y1KB2JlU2/RX05Ahse+5I6hjtaa5F91orRaWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SvwUzSVi; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SvwUzSVi"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e436c59113so11811736d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871227; x=1739476027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IX4faMlfOGXjEO5q+yF1g5VR45MAApZ98krsq1hjZdk=;
        b=SvwUzSVi9OOrFD8ASezwtJxWcRkkTjeSfQeqJNJdLUjGTuNpVAN6qGB2jbV8Dna0Ce
         hpS0ZYnFmVzVbObgPfIikr/T5Ljk/YcW3gZG/j8IHGMIW0gmrYgh7Rm6pyP+Tzp5HEvv
         LOVypmADi/oqYuF8AOzPewxHbgKeuEDEw+21k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871227; x=1739476027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IX4faMlfOGXjEO5q+yF1g5VR45MAApZ98krsq1hjZdk=;
        b=U0P0lS9khxuDY4vsqn7z/zkcz17GCI830wr8cPthmn6sLHUbU23Ljfe1LHbKGhpYYC
         UKTc0re+30IrBzHVniVakSxC+N65PRadOd1mbKPBJLGU4U90IouUPtfWZ9pJmEdm+n+z
         A/FlNpscrXVN9L+PFV1aHgZeBLBoEEqdJjLyCF4QQa19RfGXMaIxbzlrlkPHa5gMucOX
         E8F8QzZCqBLq/XiGS07FQgv3sceOfhPuveegjRwtyIKe+5UlZWi7WtlAat8jYXqZuS4v
         ErcEVWHi/w9pZYrwfSCL/ZXM7i43MVY77o/Z2U4vORgbNPE4f+0+rB0HWXn2hF/mkqoD
         ynCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2sm3UmVwCGN1Fbw493y9W9SnFeeeaFNfIglCDMGihUjp8cHpcyGqChUMJO4+8wQXvnuMnzyVOOjBlDi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuhw8rayM53HiNNEm5MQBxc4+rZ6mKmC6P1PMlYTXsrSl/Cl27
	Jnai17PtqfIxHSTF92rOt3YwIWtgUDEgevrskf0bPBe+uWK+LHgQaxuBjFV9Ow==
X-Gm-Gg: ASbGncsyCiV6ZikG8K/8r9FtI2hvJoSHKk7FQPmz6FNCVWTLOE889WsEX8ITsFr97QS
	3/g3BtOrNo5Z5Hq/qN/g5EGqaEYIYBMKn/zIcC2dgN2GhZ0K0q61b1ozgQZu0/dfhkeH7xZIsr2
	G2jAtiRlwusGx51c3HlWYsuOeDkiuPanN3tZFqMXmSkvxaQOhYkAtJB1WGgwwM3xm57TC4Z84xJ
	Rj0iY/o3QwMUTSS13y8PdOiGcW3okDtucpPPAtuslHhtLdsIDuhTjbTBLJ4E/b6EMVDZVtGX055
	TE9mV5fGsOzsu/ZjZfsea6fuVhpjevmxEii4yHLBgYVXmPdm3zXEOMRsWGhRbKq2fg==
X-Google-Smtp-Source: AGHT+IGy2/g0qdhkiz8O8OjgTmImN4zombJKSC4UxkJ6rl2bvNoupS5Zcrv6gbGUmsK4Jw1vqNhKhg==
X-Received: by 2002:a05:6214:2423:b0:6e2:481b:7cd9 with SMTP id 6a1803df08f44-6e44569bdb9mr4703916d6.25.1738871226492;
        Thu, 06 Feb 2025 11:47:06 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Feb 2025 19:47:04 +0000
Subject: [PATCH v3 5/6] media: uvcvideo: Make power management granular
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-uvc-granpower-ng-v3-5-32d0d7b0c5d8@chromium.org>
References: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
In-Reply-To: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Now that every ioctl takes care of their power management we can remove
the "global" power management.

Despite its size, this is a relatively big change. We hope that there
are no size effects of it. If there are some specific devices that
miss-behave, we can add a small quirk for them.

This patch introduces a behavioral change for the uvc "trigger" button.
It will not work unless the camera is streaming. We consider that this
the most common (if not the only) usecase and therefore we do not consider
it a regression.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 63d1d06d3ff6..7fddea100ace 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -631,7 +631,6 @@ static int uvc_v4l2_open(struct file *file)
 {
 	struct uvc_streaming *stream;
 	struct uvc_fh *handle;
-	int ret = 0;
 
 	stream = video_drvdata(file);
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
@@ -641,12 +640,6 @@ static int uvc_v4l2_open(struct file *file)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = uvc_status_get(stream->dev);
-	if (ret) {
-		kfree(handle);
-		return ret;
-	}
-
 	v4l2_fh_init(&handle->vfh, &stream->vdev);
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
@@ -680,7 +673,6 @@ static int uvc_v4l2_release(struct file *file)
 	kfree(handle);
 	file->private_data = NULL;
 
-	uvc_status_put(stream->dev);
 	return 0;
 }
 

-- 
2.48.1.502.g6dc24dfdaf-goog

