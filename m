Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277FF1AAA1D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871227; cv=none; b=JqNr2iV1ojyhimVnq2qldtEZ+XSei5NW74Hg3HDzrpoy6+5G8EmjS/uA+tkyTUoCIh5IQRefDkzocr2wblSIakdhjppu1Y4IBsz9MfgqwPPOt6O892T011t+EDReRTe9IRSuMd6b7DOlVKnAaqMgEowadcXzDjTZvTmcLvges2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871227; c=relaxed/simple;
	bh=jJOOAqwCsQWSNDiDPF3S2JW8j13hrUZylnSpIecS95c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYkZO9iI3rBgAOyqe+ohBW/jzHqj1xofVr7Lm9o9KntJ4WlmN0Y3rpVkZfO379zA/IVOWAzYZrtIA0puQM7pGjd4gd9elv9fFRDQVgkdvG8L4rsBn//dSQNppfitoH8Z7SNUVmYZg0t+4CzvrNEbTius4VC1rTmThOSk/aq7+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aoMDqbYr; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aoMDqbYr"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e442b79de4so4321756d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871225; x=1739476025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJ2UjanTBYGPlNg/34ayATbdI98nJQKJ+7M5AzyqOzs=;
        b=aoMDqbYrxISZtXgIwZND+pzZNBmFFxTU6yUXLxCFs5l/2EDOF0r5qM8zUATyqWk/Zm
         atgIU3kVB5d9SF3vrasT5d5bhFKmv1V7NaitFVcndw63KUI7ps/VT9RwYq66ijEUtrrg
         LPrKhfSjKHxcgP1BEAIssxCNPa9B4PurteuME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871225; x=1739476025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJ2UjanTBYGPlNg/34ayATbdI98nJQKJ+7M5AzyqOzs=;
        b=thB0fU8aTKHhezH1J79jh1VvHgN0RjGlixuZniyWVgxzy+SFjESZm68QyxI7gJ4lnG
         QUn/QKfH0CHsFFLQb/+9NGnnQUsK85VReySdUVzB4NJwhnffVscAgB+++xKp9ONVPeQd
         25wfoOX02kmE9xMR3l+TAl1/ppRpRC6T+8XIqAluy2cRCGGiQc+8Is203BlLJ9R+s0Te
         ebRGxqyhMHsZkUHB0U3K7hd/yJpAgA2yYW6fmwinHSAjLDqyzIyZ7kEJswokt7v3wtU4
         oGX8YTPMRuTcRAbQVw8ywlcbFi3eEw4lx5+s/td4hB0Pt0VXZPJURrvrjMzklzyTQI+k
         emKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD5YJvG5pDsIbMIMCrMIbvvhhBQUH3PPDeBEt5gRqWeHTw5lc00PhXHnceEzaIywLmEU0GMsmz+Xrh0xo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw72QA94VbeJ4p2IvXu8RsyRLHP1yTLd9pVKW+ypV5Fob4w6EOx
	G3dAw6XtSq7h4z0UwSfPu+700PnZCe9Hl2d+XxOpWFx8Mrce+6Vbk3kxwKldMA==
X-Gm-Gg: ASbGnct4DjYutDAwKvClx1/ngj/f7wt0JCMCDtzVyXbGax2Yqz5Nj5fEj6iqValGURr
	Erid1x1UEi3342e42s3AlswTLAZu6JzmWMFHzJFbLpxUzQIz94gCMcivzlg3BjG6sem3DJFMdAf
	38E110qWrxAOZd8KjZQK5oHn+1v8Vl25g1LaoPusoeZOIdCKbWn6VbEu2rNhEdzMQWxuV7w5zJQ
	JoOYZ76Y8NaXZnlXBFmYc/7fEr8FprtzkXAsKgisSrSE164jxmwFc5sOaakP2BWs1cexLz4eX1q
	EdH/1Wverd10dO+7GlZLxoekV1waamkld4+rqMA7p3JECcyqbIjmKHVuUQOos28RtA==
X-Google-Smtp-Source: AGHT+IFrT6xp6LSUuyg83VdMkSCUqUcLFurxtgJTgy1C4tSJldA04ZFL4Re8s9woc36U2BXKqvrHng==
X-Received: by 2002:ad4:576b:0:b0:6e1:afcf:8710 with SMTP id 6a1803df08f44-6e4455c2033mr4894416d6.8.1738871224972;
        Thu, 06 Feb 2025 11:47:04 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:03 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Feb 2025 19:47:02 +0000
Subject: [PATCH v3 3/6] media: uvcvideo: Add a uvc_status guard
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-uvc-granpower-ng-v3-3-32d0d7b0c5d8@chromium.org>
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

It helps will help will the error handling of PM functions.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index bc87e1f2c669..be0817da538c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -763,6 +763,8 @@ void uvc_status_suspend(struct uvc_device *dev);
 int uvc_status_get(struct uvc_device *dev);
 void uvc_status_put(struct uvc_device *dev);
 
+DEFINE_GUARD(uvc_status, struct uvc_device *, uvc_status_get(_T), uvc_status_put(_T))
+
 /* Controls */
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
 

-- 
2.48.1.502.g6dc24dfdaf-goog

