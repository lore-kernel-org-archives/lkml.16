Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82494189F39
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871231; cv=none; b=lhFMkVbnf85J04K2OCDbzSVEfNCgARQKWBCvIAeLuW8gGhHSYGgKiWkoox6kaZXlno/iRgALFdTidVujJWuI3YR81K5laBxPrMB/1tVAJvzLyXYsnStNnyvbtZISbb2JbskAgjkUpkhhfY6rQMONRo2HFgWfxjn6wL7F59h8U3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871231; c=relaxed/simple;
	bh=iF5q/M5JUZkyZmzqjR47MB5aqmBHiwCKShDjJbC8DL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ox7lYD50yIuX9zwNLRoubqtgei1calaifGtVcjjQUkbxsCGfvKOwYchohjTr7sP+026inn5HdFPmy+D9pkgDg/jIjS2gYmMz+i2Xx79PeaVc/NzJV7f9q3G354jGOwt9AZ32ClGPYHZcWKA27SRkKVn1NNtw0WTFvAMutTDE2Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VhZv9bUN; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VhZv9bUN"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7be8efa231aso116032485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871227; x=1739476027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yu46zuMM625k6HW9HpCZiLKg/8n7v8FUFBtCTL5Qq8w=;
        b=VhZv9bUNa/uQokOXosfn4S3LgqQHNPJZQlF1us8UxmKplCTWhtwFb2snkSD9wq62vK
         Ch1UewSrKcBOgd2FTpYou7UTMbSilyo8VsVeMuZb0TMLwZg4Gwo0ko2Mfx7g7V+vTZYx
         l3gLZQvkQZUklJin3Zjkqs7j2wOUswGjVn2S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871227; x=1739476027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu46zuMM625k6HW9HpCZiLKg/8n7v8FUFBtCTL5Qq8w=;
        b=JLVQFC6eFy7GBbuw7YqBJd0CMghd6+mhl7+1v0BTkxEatAnECfmyZCXLd2nvqXOCCv
         htTxyAuRZQGC3jalB/7aqnZlgVyGbRrs1kKUYJUEeuH5XF/w10USa5z+szHzn2nUBPN4
         Qfi4XX4r/+jB5dke13w5zGBB+vZBTBkUpgykNGAyHMTdfVsGAvQnuyv17I0/Mb4/iJgd
         xemxA58UX9yIJkVuClqpI7g+1ol50v4i60OUp69EXZvB6Aq6LD1BxiTKMgDA3PLEv54q
         IDCyThNH+/fRJXaOH8IbPgoP0+bb4zipVtlsdCOi/l+0I/DVkeeSb6oEX8vbZMhzV4SE
         65uA==
X-Forwarded-Encrypted: i=1; AJvYcCWJi+lIcP0hyn3wN1dCMir7v9qNMR1RPOnU9p7v960yjmnDAo1I/itzyfL/VDVOgsNvuzf5VNI3l4GvCJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6fulj756Oq/g87nxflerlQxVa4qd7jiHQ3Nhel9DlZli1TJRP
	KiASFosDfgHhGV9GoYx+KdUPuj20qgPe99avuHiG6laaQG6my3G6QD2cWJJ57w==
X-Gm-Gg: ASbGnctJMboNKpW7hySzilPmWbpvTyYH/pBLlk5L2b3ffTS6SP2ldAzni+7AQODDXPG
	5IybopmtEjw6hWYQa45Bk2ys65y4FUWOOLbz/bhJttCy7x6tw4TAZcAZARiK5F+Ny5tFwPQmdQk
	aYxZN1GBx5pvlClxw6vXHMNMSAZK1xn4g/5CyqI1YYMu3wrymXdjNjbCXocCro9AeoTyHLluKo5
	x+p0Ra35Uwnls29RZwowqt/cv1NFHT6QMRMZC9YTudwhXGjB7+tiAw5Q1LpRXrSz1t/Rp0xnB3X
	ZI9q6iT78pl7q4K7SR6S4KiOJiwCFpQs/tH1bOodoAuXGTniThVnauQBVmjbqKybOQ==
X-Google-Smtp-Source: AGHT+IGvm2bH+u7v39h8LKqAEVBrazNHy8zb1bEygHBPKRdizqbmdeVljeK2PG8o11QOevB7emfwlQ==
X-Received: by 2002:a05:6214:230c:b0:6e4:2b7e:3992 with SMTP id 6a1803df08f44-6e44561daeemr4277856d6.16.1738871227268;
        Thu, 06 Feb 2025 11:47:07 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Feb 2025 19:47:05 +0000
Subject: [PATCH v3 6/6] media: uvcvideo: Do not turn on the camera for some
 ioctls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-uvc-granpower-ng-v3-6-32d0d7b0c5d8@chromium.org>
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

There are some ioctls that do not need to turn on the camera. Do not
call uvc_status_get in those cases.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7fddea100ace..0f022174285f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1429,6 +1429,26 @@ static long uvc_v4l2_video_ioctl2(struct file *file,
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
2.48.1.502.g6dc24dfdaf-goog

