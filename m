Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C655D1DE4DD
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109538; cv=none; b=MTafcDzenLNGHPdYbpJUIvrRSSzOlRRgzWAoPO8e9oFXwt3008NtDwjr1EOpbPZ6VVSn50mxVp+asbls07CEPF8ZFsEfHJ58/tipKN4BNPk59tGkXhJO2x/9QV+IR5SWWemcvTe+NHBwGjKtwE/x/cIu1K+M8HYfOGUyRpzZBVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109538; c=relaxed/simple;
	bh=u4IW1YMngcRYBzzFD/tv5aieQQ3z97khfAc/wS3zzUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gacMsdRMFrVHBtxC7H7R5KFnQ5+HaV5nfxDcNeEnyn9bH9oc3ePFQYqY6S1wOnvJ+dU+w5gn6X6+C1gIThJd9S9U2pt1KH0orlMJFQF8zMWTMJGvjNwsUDhb0Jf4wgNFe/y96AHFhAQ5quPYhjfOxXNEZlGAgTYRO4zpjOVc5O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cv8Qi2qn; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cv8Qi2qn"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-476a304a8edso14541271cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109535; x=1743714335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KwjlyKhAU+wYuskPmvHPeSJQYXWx/0fJXM8H3E5Qeg=;
        b=Cv8Qi2qnhzE3haful29TGG0L2yPqkNpR0DQg5KHrGCJF/L0YyryKSG8LSep9LcVbJv
         eWdoelib5UfKTmMurcRn4xjnfQLPS7WMeBeNi5x+QVmdAT/PIOSyqwpOmFPoY1WRqCmY
         jrL03262tlf0Bh4K0Dcc2ZVOW7+/2BV02q/Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109535; x=1743714335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KwjlyKhAU+wYuskPmvHPeSJQYXWx/0fJXM8H3E5Qeg=;
        b=UuEj6OafIV3xJoomqrp2Y54aEDkb9dLm0q5t//ZSISc8BareTGAR+xBBvFs0JBpHbR
         Fs0Q/L/3gTeUjQsSd6UovXYxvof+DlCgNs0FqqcY+UgBjftJqRI/Zl9wmXyYA4KII2th
         sn2b3p1cJ39ju66UcC99ih4h+yJ10oeOR8HV8G9JGL2yolGpDeoy5SIIek8CR+WnIbrO
         dn/QYzPK4wv9I+2c5b4Xyz7RbVCw7cmp4xife5cnQGNqH1zludihLJcaEZhXGRB+mEVO
         tjmQymDWHBPM+QrVKwqDXGlvnq4rwP4CQZYat0qQlxau7ZOocWYWNxOuikUdcoByrUBX
         aYug==
X-Forwarded-Encrypted: i=1; AJvYcCX5IYm2DCdvOdOPAzU2Bl1L1ZWsEnwUXq6Ws/PkTPtCs+WYYE3kSNAGiNKKZ6TBEWBG1aNG70grOMpH5Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBgFmlOnw4Ra9zlhPMZHVTd6QwqDu7rStTwl1+JDhWDMifhOYR
	U7z5wsFwRvRPCyOAFh4R/lvTdKrxf73+HlbkNxfUmPpsxQrKpvd1axu+vktznTyp+Pjy29VVyGZ
	wS514
X-Gm-Gg: ASbGncvdEG8204/YrbY1o/bGvqtWnxo8c9/t35LEwXOfs9vy2LJgr9jPZhePGp7Ny0d
	I+ZAeapWhQvb2rwjzbrEbzUu25BU0ixQ/mXh8hr77XwvlEr57V6SSX04nfufIfi/TmpdUS0Czto
	0ZT+ETj8NOknTvi9Q/DTwIBkutlutj/iUqMNtFR6lWBVq4lxOdfB0ytN4TeOP8IBjR0y1dNShdL
	X7yqdai7Ygcp0Gw3kVPLu1iO5fT73vwHVZMXwLvISdI/HJxsUEDxfg4cm6cboVjPOHS7+5t99U+
	akSFUIhOOudrg7rZcT/L7LdTH4wBv2w3yvlNr47G8ftwIBoZhq/ZMiwkNY9MhD39B/5nfN2KPvj
	/C5VQitOnRioSm7gbDyiaag==
X-Google-Smtp-Source: AGHT+IEvWoj2opXBtmG7qnr+4ehjapoZ9QQ/ziUB6/R9e5qxlbmj76KkfS1jRPZ9mv2liy+lqer4fQ==
X-Received: by 2002:a05:622a:552:b0:477:6e8e:138e with SMTP id d75a77b69052e-4776e8e1408mr72968861cf.2.1743109535478;
        Thu, 27 Mar 2025 14:05:35 -0700 (PDT)
Received: from denia.c.googlers.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm2275421cf.9.2025.03.27.14.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:05:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 21:05:31 +0000
Subject: [PATCH v6 5/5] media: uvcvideo: Do not turn on the camera for some
 ioctls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-uvc-granpower-ng-v6-5-35a2357ff348@chromium.org>
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

There are some ioctls that do not need to turn on the camera. Do not
call uvc_pm_get in those cases.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0f1ed0387b2611c8d21e211afe21a35101071d93..668a4e9d772c6d91f045ca75e2744b3a6c69da6b 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1440,6 +1440,26 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 	struct uvc_fh *handle = file->private_data;
 	int ret;
 
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
 	ret = uvc_pm_get(handle->stream->dev);
 	if (ret)
 		return ret;

-- 
2.49.0.472.ge94155a9ec-goog

