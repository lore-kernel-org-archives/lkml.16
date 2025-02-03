Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AA220468C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585652; cv=none; b=LJdkSjpYJRcCA0coNFZXrV85wtXqGmjtUqkxd1njWJyHfYqF1TarOKRKL9n42tQW301ptUeKR/i2Sa1LUwgAbFgYkXnwYxty0QvUOo0qu6v19NBaeyZQixS5NKtZy4Fs5T4vewhpUFzDXBj+GzRyb96aqXQcUtdf10/gjzopHmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585652; c=relaxed/simple;
	bh=D3PDTa5bBZ189h6S7+Avdx11GulyjmVpJFiCtm2ywk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9/9LQqKcSqzT21pwBdsZN8uBE7761wfdEt3Sb9MkitD1jh9ywowdfoq7qzTAMokR/4rfQJwSUCEOWWp5AaFWWqW/eQQddRQmG5A7VIGMUwzyoWD1O5QnF+3hSsucjUFWab7+PBOWPExn7NGkfy9C1VyA9E2je8JWrHidNVuvNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QfGp2Vxa; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QfGp2Vxa"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-46c7855df10so76559591cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585649; x=1739190449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJfWVER0A/MWtXZIU7OrSpWdFioEJlVatupUrNIrYbg=;
        b=QfGp2VxauptWGNvUpPrB9rrQ7Q5UfaVrF9zXK+KsGm6hUeHbxglZ77W1CGUy+YC6G2
         2HMytE0rAhUOMzJ5/B054IDE8NCCoQmOZXGTCE60GFSNvIqT9wn6GKqadhsURAEknLQH
         4UXy8U68ZZx5ln2Ggq3svr6hN6c01GOqpaJr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585649; x=1739190449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJfWVER0A/MWtXZIU7OrSpWdFioEJlVatupUrNIrYbg=;
        b=EvoIguQ4Dus8CoJDbhjN8AijapYvAbwEHYuF010JbaCUAYW8ebhHKn55OpipjiBRyd
         jRlhtnTSHxszI7pQnup+AsOCFOR4d4HAdEbRkRMkjzPSlR8doxBhCri1jiCFI791/JUY
         7B7zMDqC1fkB9f5AvgrOLLMLuR8y5Kg1A4olpd6h8JyqyzKXVeRfOVH2XRJPhyT9hwrp
         fa/6fD41kZ2Hu9p63sqX9Yleyc4p3rD4EhAsl+xHlGqAa7gdxY4Q2NiIoRqzjwhRYR+i
         e3hRb6yqJwqKCEMC4d4iIt7Y2zHrF3qYCqEdxcazjzWVjlBkd97mIXDsw2QOm7UfH46R
         QU3w==
X-Forwarded-Encrypted: i=1; AJvYcCWCjfCbfUCrX+NAM6kirRwd7TF/NPZhIhu76Ia5mLbRC+jDHL9D95wVo05yKklBNygVlGtb4tX9np1Oh24=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGABvosWQqvzaHhcJuWVOiQLs4MkSUVFrn3aGVBVTKvuQuCitX
	9QePF4Pvx8pOWF2CMM2VJBpgEzZnQRwoT9gfSk9hSAxtOw6d2jCV43F/NwAyMg==
X-Gm-Gg: ASbGnct6c9O+s/kl6FepIE/LHRPD3NCS5Iha/2VOx82pVai8is7qmCino0pU0Z0HjT1
	m+9rOm7nmlAlB1yJcOnB59MWa0vTqxk55kmgp+iqx1ym66n0hIoPl9LeVJ3ZuDBu9wVmAvu5XYX
	Ugkils7+zbY7D4uYROibdOo13BSJ6aQnPqJS+UryNVZSC8e/fXlosD7DTxKJvu3noVSO+BlozbQ
	lJVhVYGLVkdJ/M4b/ZpvZvGVulgSyL6FE/LdfDeW0+YFGanESiNYVjiUKvAC0uG52vYeoOAF1g9
	4XaEwLmdTwjf59Vwxj8Sq7H42bvr2ILKAneMIK79cSE396u0Pzdr1uWV6H4m9P311g==
X-Google-Smtp-Source: AGHT+IHM6vEIGrDaO5hgfLv3qjHe2qX5n9BWjAr3CI6mqTozb4ZJwT7hQqwUFOPt2P2TyvnmMxBXdA==
X-Received: by 2002:ac8:6f17:0:b0:467:6c5f:95c0 with SMTP id d75a77b69052e-46fd0a1d1fdmr263931451cf.7.1738585649574;
        Mon, 03 Feb 2025 04:27:29 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:28 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:21 +0000
Subject: [PATCH v2 2/6] media: uvcvideo: Move
 usb_autopm_(get|put)_interface to status_get
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-2-bef4b55e7b67@chromium.org>
References: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
In-Reply-To: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Right now PM operations are always called at the same locations as
uvc_status_(get|put).

Combine them into uvc_status_(get|put). This simplifies the current
code and future PM changes in the driver.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 38 +++++++++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c   | 11 +----------
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index ee01dce4b783..caa673b0279d 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -382,7 +382,7 @@ void uvc_status_suspend(struct uvc_device *dev)
 		uvc_status_stop(dev);
 }
 
-int uvc_status_get(struct uvc_device *dev)
+static int _uvc_status_get(struct uvc_device *dev)
 {
 	int ret;
 
@@ -399,13 +399,41 @@ int uvc_status_get(struct uvc_device *dev)
 	return 0;
 }
 
-void uvc_status_put(struct uvc_device *dev)
+int uvc_status_get(struct uvc_device *dev)
+{
+	int ret;
+
+	ret = usb_autopm_get_interface(dev->intf);
+	if (ret)
+		return ret;
+
+	ret = _uvc_status_get(dev);
+
+	if (ret)
+		usb_autopm_put_interface(dev->intf);
+
+	return ret;
+}
+
+static int _uvc_status_put(struct uvc_device *dev)
 {
 	guard(mutex)(&dev->status_lock);
 
 	if (dev->status_users == 1)
 		uvc_status_stop(dev);
-	WARN_ON(!dev->status_users);
-	if (dev->status_users)
-		dev->status_users--;
+
+	if (WARN_ON(!dev->status_users))
+		return -EIO;
+
+	dev->status_users--;
+	return 0;
+}
+
+void uvc_status_put(struct uvc_device *dev)
+{
+	int ret;
+
+	ret = _uvc_status_put(dev);
+	if (!ret)
+		usb_autopm_put_interface(dev->intf);
 }
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 856eaa23e703..5d4e967938af 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -636,20 +636,13 @@ static int uvc_v4l2_open(struct file *file)
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
 
 	ret = uvc_status_get(stream->dev);
 	if (ret) {
-		usb_autopm_put_interface(stream->dev->intf);
 		kfree(handle);
 		return ret;
 	}
@@ -685,8 +678,6 @@ static int uvc_v4l2_release(struct file *file)
 	file->private_data = NULL;
 
 	uvc_status_put(stream->dev);
-
-	usb_autopm_put_interface(stream->dev->intf);
 	return 0;
 }
 

-- 
2.48.1.362.g079036d154-goog

