Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E7513AD22
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871226; cv=none; b=FZvWd3GiSJT1dvBfkjQcExTmDQLPt/eNJ/oWV7zP0YTGkMLCLKRdQ0+zHY59lFRfLcUv+9G0QqN0yU3sY12QuoHOtPlk/SWnkP7avqBFbCzGhIp96M0Vq8DXmI5vGoP8c/LDrYtmNk3VKG0dtinK5UDfg8i5x0ZU0WST1aq+/Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871226; c=relaxed/simple;
	bh=mMNoow2UZDhENW+B9WaXhVHze9zEaW5TMByarH1pFXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMtzzlw1Whx+mIdkHjrj9VPkx8TZEG8E5SMNbDE/ce5MuFRSIOTBxeIePMoY+eGhM6L4Ao3xpp4wvbam7qLtjie/B9YJe1YuQTJJLTsnykZPKD4Ym0ApnzVPRjXwF4S23z1hBqJ3F8G2bK3AUe5YVjcqtl6D5uP+xAAIwr0VgSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Yl6iU8qZ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yl6iU8qZ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4679eacf2c5so12751261cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871223; x=1739476023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hyffxiv8kaCor5UQiEFydJ9JjxN4h7wLUxKN/7HED+8=;
        b=Yl6iU8qZjzQXRN0OaKPDn8fKTWN9nJLheQlLvQzK4uEdv/mi7W9KWCH/L/mOI6+Br7
         EiTK2t83mzyVfcbZhu8AqxHG66WnNV4desxBY1oXNx2rZ2qf+wOVKEFx5fX4yhfPrzko
         x8WpWO53+lYNhjC1aW0GI81hkBtHeuBmHxOzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871223; x=1739476023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hyffxiv8kaCor5UQiEFydJ9JjxN4h7wLUxKN/7HED+8=;
        b=NKbgTBUtPw9Zk7L1cCZ5IXjQEB74L4s6Kfqc3Ay5wqXbltKbiccd+uVCJ/FmGv1m3D
         Ku/HLYkVF7RZLrx9VPxYPX/tRGLSwIbO/C4+8DmTNCfmWcutB+En+VrslLz4lDB9Ejv4
         tsaIOzVdV4cOFhmgjrMr5laP2TKQSL4n1vJFKkuY2DcEF8zdYE7x9XZ91BwE7tmOBOmM
         YYrIySQm2riaZiM/Jihl+/qWeNV7UB1NRcWR2ZXNsS44jXqzkLDvcN9r2tjJDI3HzP6n
         2InHv1Nup3/Ov9YUYEWTREldwHNNvKK229+z4eFp1X4nuA11rEYBb7TtD/dVmcVafqqD
         DTWw==
X-Forwarded-Encrypted: i=1; AJvYcCVLVK49XR5KvX24zeiGoQtPnFzREyJLd3UbKeJ+8xsDRhk/XIjCFAafkRcj3yweibMN0x5oZhVQeZPKnTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNe5YL/3ApXYsxh6ttU14GYWfEHhNjeB40CPoLSu0PodFU0I6i
	C0S7tfINQCxLDnmnZ4HzF2fWhXn9WCmoZ/jEbpxowvOpDoHeS+EaYxb7O1MHuA==
X-Gm-Gg: ASbGnctwstTBzVIEv65XrCyIHs21cDXXXKLhZXa49bXMyMKV6hk+fwa8Y1lI6tLG7O+
	4w5gm3yyUgrFNVn4tle6a7/HjH6KXxipLCzwZr6w3kRkT4YRjDNSATqg5Pmh2GdiygqHGcbSSEZ
	Q/0u8oBu2dmbkEJ0c2o7xFv3BemW+lvUwwd1e12RKdC4XbJYSoVHCu//axdL+7diCZyZIA3WKdv
	d2EXTuHjEDUiKFZN+ZXdzkLj4X9UnXZw7YH1+Hn47+Hu7k37gVDZamZcEjWFTf9+q/UWKM+8wct
	8UruDCMB0ok8Z/xaooFVtaXHf1UUzBQxe3p6he3Rn/sEWj9ovRStS6k15NOQ8ER4lQ==
X-Google-Smtp-Source: AGHT+IEgE+n5v/MPwAYZl4Ef7ywjZ3quxd0ziOMmp4+4iq3xO+MT6vadnlGqhIKHStXrrBpnsY9zPQ==
X-Received: by 2002:ad4:5fca:0:b0:6d8:8fdd:9797 with SMTP id 6a1803df08f44-6e445720e48mr4110326d6.36.1738871223447;
        Thu, 06 Feb 2025 11:47:03 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:03 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Feb 2025 19:47:01 +0000
Subject: [PATCH v3 2/6] media: uvcvideo: Move
 usb_autopm_(get|put)_interface to status_get
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-uvc-granpower-ng-v3-2-32d0d7b0c5d8@chromium.org>
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
2.48.1.502.g6dc24dfdaf-goog

