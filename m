Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F11D8DE1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109534; cv=none; b=OSAKRnreqGOsqEP6nTQQ8XFCkkhvvPKxHxzeXosvHKjLav5T8U8GmUY10PvMcXY4l36Oz1kelpTrPKVzJEKItBDd7vtEVCtfbtVcuvBHtQXfOYJEBP+g0lLDvhpH0ETAzxHrJitCkG8RhBQon4x3cLwXslsQCs5g5lOYnpWfDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109534; c=relaxed/simple;
	bh=Ban9ucLuyCpweFGuFMiE9HdQVNFofbA4U8+4eDa+l6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXLEzJOSDnLjmg56PmltaWx0s+nXC1TOopJpJMJ9euVGnn57jUa8PUU2l2Sz5wOWQPSzO/vCcbKNYVDi1fmHXVNdAiF2Hyf9Iy/9kNn78pZnijaC72mx1NDS5Unw7R1KuNLao63eFYSnAjGIzpW7xFsjy6Xc0CW99Hfw2MiYpU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nIC0hVxD; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nIC0hVxD"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47690a4ec97so15203001cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109532; x=1743714332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93OnqkciQ2LvdVqMgeQPBfq7/a3PEpY4NcvhZpMQ4n0=;
        b=nIC0hVxD3u+Dw5UNozgRsAUgngBZmq+DFkMHeAcbHEgc+AvYBI4QesrS9KdKBVzfvr
         aZeX17P87Lq3QBogxoLAM4ZT5enp9dVOuBO8WVEwwY+Bk3XFWJMuhNgBQ6qHXyG2Yb4n
         IVpzeh+yl+8FP+GTBVmgcGXp/K8wO58C4NUjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109532; x=1743714332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93OnqkciQ2LvdVqMgeQPBfq7/a3PEpY4NcvhZpMQ4n0=;
        b=ooK9HpC7FFp2qZoXsRblwBJVdvAcSvDInSab75ECXOEl03ogUC2HMk2kpcUTltIWh8
         bdP5DH7MlMliGYy8WHAl/XpIA2eS0jQOGYgMJxcavpj6KYOpFparHrL4jPA6mr/miBh3
         D8lzzwSmlZBWztApvGIRpMCq3oIctDczPjtObrbjowca4PQcMrZuTMHLyyZ5Sv9heXkN
         Z1Nb82ZOdyxMX3DvuY5wSOkU3Q83qjFlbXNv5kJEfCb5ctU1erZAYPbLSvCXbKhTd6BS
         p7MLkUQrbkgr4Uulc0GEaGTMvuPyOxzTIGj5CpwBMVvJdv5VtwPdHEUJtVD7yyxr+E6D
         f2xg==
X-Forwarded-Encrypted: i=1; AJvYcCXqBj1qeiMTrL9d2ZE38YrUBPpkUqZ9bY8eDmOWrVqs4Mmxo+0dHJM6Dpp3v1LrF3ONfrgeFOogYhyIQRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/uUJYVZbwEP3DewEwH7+b1knltH53dIHaI4XWKDaDaJHYiYJC
	/7v2BzC6OoTNWTjLu/eTsonFS2aBQ3ptMqXxWZ5HoCdKzo0OYEydZ3MgBM6y5A==
X-Gm-Gg: ASbGncvExzlFE1J6crSW8CqL0kS6Ien2Hh68VCN2+FSop0LOfvZ2nWYP5q0RyparFDq
	YAq1tywz5bV5qHB1mAwocz4W5WgwCu7Sal5NWQ9cqP6/7l4YxwyNKsMIKgZlwzX8mnoBNO4D9Jn
	zCFhtiZdbTVXRi2lLta5YyrocAV1v+ziz9gRKgClBtEaNiBYwrR7dgzpl+Cg3abdthmUyUffVJW
	HvQ+9UBkO3nZr1R0bERRE5Kp6eLMzL3ny2DshkZK9FfjIYtR7b5JQMBPTAR6gphHuU+S8TMQb+I
	QlsZT/n7UPR3ci6CZBoDuJb+gGGacptMQaOXmefhyj1plBs1TJ5Phyqr6MuMMe56TdapOMC9svy
	SchNrn9cK5LQyMwpLh8Q7lQ==
X-Google-Smtp-Source: AGHT+IFLl4a4+W+aZHMW6dq0F6sR8OwWQrPiaIYCVSTx17LDuLrqPR9p4njsirc2w/NtJeAt7tcWBA==
X-Received: by 2002:a05:622a:4a17:b0:472:1225:bd98 with SMTP id d75a77b69052e-4776e1e746amr114724211cf.50.1743109531874;
        Thu, 27 Mar 2025 14:05:31 -0700 (PDT)
Received: from denia.c.googlers.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm2275421cf.9.2025.03.27.14.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:05:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 21:05:28 +0000
Subject: [PATCH v6 2/5] media: uvcvideo: Create uvc_pm_(get|put) functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-uvc-granpower-ng-v6-2-35a2357ff348@chromium.org>
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

Most of the times that we have to call uvc_status_(get|put) we need to
call the usb_autopm_ functions.

Create a new pair of functions that automate this for us. This
simplifies the current code and future PM changes in the driver.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 36 ++++++++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h |  4 ++++
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 22886b47d81c2cfd0a744f34a50d296d606e54e8..1d5be045d04ecbf17e65e14b390e494a294b735f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -26,6 +26,27 @@
 
 #include "uvcvideo.h"
 
+int uvc_pm_get(struct uvc_device *dev)
+{
+	int ret;
+
+	ret = usb_autopm_get_interface(dev->intf);
+	if (ret)
+		return ret;
+
+	ret = uvc_status_get(dev);
+	if (ret)
+		usb_autopm_put_interface(dev->intf);
+
+	return ret;
+}
+
+void uvc_pm_put(struct uvc_device *dev)
+{
+	uvc_status_put(dev);
+	usb_autopm_put_interface(dev->intf);
+}
+
 static int uvc_acquire_privileges(struct uvc_fh *handle);
 
 static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
@@ -642,20 +663,13 @@ static int uvc_v4l2_open(struct file *file)
 	stream = video_drvdata(file);
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
 
-	ret = usb_autopm_get_interface(stream->dev->intf);
-	if (ret < 0)
-		return ret;
-
 	/* Create the device handle. */
 	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
-	if (handle == NULL) {
-		usb_autopm_put_interface(stream->dev->intf);
+	if (!handle)
 		return -ENOMEM;
-	}
 
-	ret = uvc_status_get(stream->dev);
+	ret = uvc_pm_get(stream->dev);
 	if (ret) {
-		usb_autopm_put_interface(stream->dev->intf);
 		kfree(handle);
 		return ret;
 	}
@@ -690,9 +704,7 @@ static int uvc_v4l2_release(struct file *file)
 	kfree(handle);
 	file->private_data = NULL;
 
-	uvc_status_put(stream->dev);
-
-	usb_autopm_put_interface(stream->dev->intf);
+	uvc_pm_put(stream->dev);
 	return 0;
 }
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5ceb01e7831a83507550e1d3313e63da7494b2e4..b9f8eb62ba1d82ea7788cf6c10cc838a429dbc9e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -768,6 +768,10 @@ void uvc_status_suspend(struct uvc_device *dev);
 int uvc_status_get(struct uvc_device *dev);
 void uvc_status_put(struct uvc_device *dev);
 
+/* PM */
+int uvc_pm_get(struct uvc_device *dev);
+void uvc_pm_put(struct uvc_device *dev);
+
 /* Controls */
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
 

-- 
2.49.0.472.ge94155a9ec-goog

