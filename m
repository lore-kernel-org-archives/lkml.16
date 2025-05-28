Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C36128B4F0
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455097; cv=none; b=cYvKf0eMbJgKJFcI8XP1Co1XibhAgaiSEyOLDjf2ZF2tOM8RoRAeWzh5dJTh6dEPAot0oDzOkP1aV7x6vI/RmWe4X3IyJPwUivKEtCPdUOyz0RExTAGUtuV7nlqIvAP/mWefhp2NAzpIT+IEqBGef81Hh4lj933baegv+wRO7wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455097; c=relaxed/simple;
	bh=B0jNGSufNvPJuCam1LbtuPADRfe/FotYKW4NrWm/oXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFViTSBEEN7W32nQa7Fnb34EB9lFbG0f0gtqDUNoHiX94lZTITRyW6hu7AXdQ0OFQo89qH5q7UBxCX8pZCp5u4bUA7CdGqNk1M1HPc1F1ZWi36CEETr6Ajj4f5jKcSrPY1VSyBcirr/pBM3/kSbn9Q3pbTCMYr6HdMGGvI6t5A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R4bOeQyY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R4bOeQyY"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553280c345cso22523e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455093; x=1749059893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuqigEavLUIFRcdMGWtAXF6BHoROJfpc2OWkY3rCm9o=;
        b=R4bOeQyYUuNLTp0YCbwEKuNm5OnjTvnhLt1Ql4cgb6qEHX/Ylp4IXy1cnbIZHJg+BE
         MYz+KRHzxTCSi7bwgaux4QrwcQLw4nJ5S8wuaY4d4AYbPDhFVwhjBEWpBcDbwTiJsMIv
         F7s+euQi2VxiwIYzGp21+52LWugrbg31D4gDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455093; x=1749059893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuqigEavLUIFRcdMGWtAXF6BHoROJfpc2OWkY3rCm9o=;
        b=jVOGraIyKKWpWjG6bFZbf9dybnWxdSvjy3PwZAR3x/t3Z+uMwedMvh+CWcYyyB4T/x
         A8Ngsr8oIK7xHupsqqC6CHZx92hLlC36Ywc68wwP0eJVeLAcMDObJjaIHtoMwpOBxfZE
         cJnQYobSmoVwBfP6UD0Jhu3fkIGiA5uJe3ZKYIUi7fyj1yqm+DKpWETUsohet0v8rkD6
         MoPnZ7auTa8kbqh+FEykoxUM39u4LdcQs2PclF5Uz8mZC/FsDjep8n12dHAzAvt6duYT
         qDCfpiQGLHqYIK6yWR7/++w/u7L/kPWscaevu3m/gkNH8Z/ROZzsi2kkCi+grQ/jNhxj
         KcAg==
X-Forwarded-Encrypted: i=1; AJvYcCUac52iq4QsBuYEWN1qz7vB5xlggNHUJVsC3O2X6j3Qa4t51/k1lwELlhclsG3HBfciqGsXthF2d4++T2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKdXv1gPv5rZ2ftKSSKbooUpWVIK0sM6cN+rpWQIjB9o5w7zuP
	fMF3Gs6H22wHI5u479raEr4puVs/VdcZ6QwJfzZBDGkOQpenQvErAWXv3xG1HlDa9A==
X-Gm-Gg: ASbGnct1ek/hu8PNfCF5CxyKNAIdF4pWoI9SWsdFu2tBVUZpZKowwHfKg3yTHmCOXbS
	xRVJmAyL7UExIxporRAdzSSYm1DWYH9E1zRy4tIIMAddsPzkFt1X1Xy4dtQZOaocjEI1cKQOG7g
	CtSlGxfgMnbEQZQsI3Hrl6MBg6GWKczM2vJvspFu/hMyQPeByvn9evIWRfrxbASIwkiQ8sDhzW6
	bYRgSH9U9YGqWeDfrWoTv3wt5tdeLlWUlALlbIJPvxXIZ9PeDOts/1TeSYOShqy+bg8EyuXakrt
	K+au2WUJkuBrmWQ7/q3c+N3nec7jDTH2OJGFFp0AgoVuJDIsUfwYRBlYGEpiQ4o5aT2tSANxHYp
	7XwN1jTo44S7gXH7ddqAUqnD8oQ==
X-Google-Smtp-Source: AGHT+IGtfA2QUrrwfNGeJ51zXmyU21n4oPCCQEdOZj56bSgqq99gARUJkrRoMcxAFmVr9Wh8ebDDmg==
X-Received: by 2002:a05:6512:3da7:b0:553:2e10:a79e with SMTP id 2adb3069b0e04-5532e10a9ebmr1533023e87.14.1748455093493;
        Wed, 28 May 2025 10:58:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:57:57 +0000
Subject: [PATCH 2/9] media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-2-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Declaring a variable for doing automatic cleanup is not a very common
pattern. Replace the cleanup macro with manual cleanup to make the code
simpler.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/20250509-uvc-followup-v1-3-73bcde30d2b5@chromium.org
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 862b4e34e5b629cf324479a9bb59ebe8784ccd5d..1abdf1ea39956bbbadd3f166f37bdac518068648 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1382,11 +1382,9 @@ static int uvc_v4l2_put_xu_query(const struct uvc_xu_control_query *kp,
 #define UVCIOC_CTRL_MAP32	_IOWR('u', 0x20, struct uvc_xu_control_mapping32)
 #define UVCIOC_CTRL_QUERY32	_IOWR('u', 0x21, struct uvc_xu_control_query32)
 
-DEFINE_FREE(uvc_pm_put, struct uvc_device *, if (_T) uvc_pm_put(_T))
 static long uvc_v4l2_compat_ioctl32(struct file *file,
 		     unsigned int cmd, unsigned long arg)
 {
-	struct uvc_device *uvc_device __free(uvc_pm_put) = NULL;
 	struct uvc_fh *handle = file->private_data;
 	union {
 		struct uvc_xu_control_mapping xmap;
@@ -1399,38 +1397,38 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	if (ret)
 		return ret;
 
-	uvc_device = handle->stream->dev;
-
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
 		if (ret)
-			return ret;
+			break;
 		ret = uvc_ioctl_xu_ctrl_map(handle->chain, &karg.xmap);
 		if (ret)
-			return ret;
+			break;
 		ret = uvc_v4l2_put_xu_mapping(&karg.xmap, up);
 		if (ret)
-			return ret;
-
+			break;
 		break;
 
 	case UVCIOC_CTRL_QUERY32:
 		ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
 		if (ret)
-			return ret;
+			break;
 		ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
 		if (ret)
-			return ret;
+			break;
 		ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
 		if (ret)
-			return ret;
+			break;
 		break;
 
 	default:
-		return -ENOIOCTLCMD;
+		ret = -ENOIOCTLCMD;
+		break;
 	}
 
+	uvc_pm_put(handle->stream->dev);
+
 	return ret;
 }
 #endif

-- 
2.49.0.1266.g31b7d2e469-goog

