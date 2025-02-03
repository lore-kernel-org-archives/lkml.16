Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85338204592
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585651; cv=none; b=Z1lkmqwUE3fYEpLWof0D48rWx1ijVj5hW7eFlD9EAAl/vChabugK9RZA+TUNjqrLUXFZ6xTpYz5g2GQDMVf8mLBmbeCtIAu5gP9bg8ygwUHywe2692X5sCM9d2qA/DZqlkc5TZD1ckPIQm0VuSFYuGMaEns2MQmI7vAap/vWU28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585651; c=relaxed/simple;
	bh=ypQ841cNTOVvJkNiivh2SjrxeSrzyKc9iA8RYDsQiLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=almyH2VvW1ZtLihCIUPQphWIN5s8yxscJv1JqOeYeryFDytsRUthdddiWokLsSm0IzBWhSjMTn7fyBEz/S8e2fWvVJRf4RoRBAIuARiSYIu8HYm0Plf6yvuu6y9VvuTwRN1E5XuLCumPlFXQ7AZW0q8Kpsw6CAnsSfu15ibf2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SjC5UTPN; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SjC5UTPN"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4678afeb133so45540181cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585648; x=1739190448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QY4+u53g0URNX41P38AQG24x1RBlbj7sJlUgGqsa0as=;
        b=SjC5UTPN8QDW8j4cyqJVdCNDbR5GZ7WB2BC0SZ7wuwKZtaOT8v33tM8Tl3GGhmZZbd
         KVFQ2B2ZYk0IU3tEdik8Dhgu3FwAB67vUaeBPgLj+mHNfPyco9u6jsMuuse/2wQs4/Ey
         bLetNiHpIm0etou/kP3i0u/Rl0QgsE9G07wOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585648; x=1739190448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QY4+u53g0URNX41P38AQG24x1RBlbj7sJlUgGqsa0as=;
        b=FPZmatjbGV8x21GwbLuqBBLQTOL6dLqH/TXt39oBbak+rAtphaB101b+/Xt6ARjhvX
         K3SV1O7Mzs3WVwAy6GxjTCnzoAQm2JUzg+uEeDb3YsDTZGuRb1ubVvaBPQvTCVEQzrym
         dYKY6F87IRtfZF6ONHQ2paPitPfV31/GE4gR8ktvNAdUIOVETbgIp0lH2G2L2HI+VT1v
         EAkCIgSD5BWZElbwE4hnORiEL1QHwksab+gpjnlz0y/8tXAAt2yK1QCeD513t9sCDs6N
         7+zQfiA62tdnFRYkoa9pJQeLg6kkVxHTk2pFcoI1s3J9UUZJhAI2iXPaqgXsLWzftgbE
         Labw==
X-Forwarded-Encrypted: i=1; AJvYcCWxg6Cm8DyfIfJTCy6WbYHv1YBzaYV5oqSv5C4gbkSY1BrpSxcJZyrE4zzTr4axg8PPBF+rqebVuGtIVV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs2OjWwF6sWflA2bg4EMrtBMtJN4HWKFePjm2OF+6Ft797EKX9
	Qmo9uX/bsT87deKClxYHyA83TADL/6BtNNqG6UgzetqmziwbwZPfgxV1nsuz2A==
X-Gm-Gg: ASbGncsE/Pfka3X9HMhFbiXvJaeYOyKqYAtKkPxjUbxMqyRNB/AB51NWL/7eW4VEZ9G
	cs1Q2cQmUZm6DqMZIzwsBVHaveM6gAQJbMFA3jJjpabFRBzwLLclQq5zj+NCDst30IGMfAp/ctT
	OvjbmkTXOhzF8pZ8misSeBhXyzMaG7hwxYH1+fSFAtoChzwuRuDPnFLS1H28/yPeuIGc4XL7q4y
	Mv30vryz4X/gkdSK5epb/GKQgvud3Y/ct+ZMZcVRdSroRa1RjH7ewyWPqKyUpOxNqVTibbnoyOF
	kWYLBIS0h1GsJLpauiJXhjfYMLzplgcVjOOAA8DbsibWlsnHmgominITbQTaQHvmIg==
X-Google-Smtp-Source: AGHT+IGGsYptsXXuay5PF9kPj0wjLs/hfqUXeqbalcq/KJFm9kJo02Lp+ffYXVKIq92dEFobt5ZlKg==
X-Received: by 2002:a05:622a:550:b0:467:5f2f:4a9f with SMTP id d75a77b69052e-46fdd328316mr210294281cf.3.1738585648410;
        Mon, 03 Feb 2025 04:27:28 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:28 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:20 +0000
Subject: [PATCH v2 1/6] media: uvcvideo: Keep streaming state in the file
 handle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-1-bef4b55e7b67@chromium.org>
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

Add a variable in the file handle state to figure out if a camera is in
the streaming state or not.
This variable will be used in the future for power management policies.

Now that we are at it, make use of guards to simplify the code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 15 +++++++++++----
 drivers/media/usb/uvc/uvcvideo.h |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 93c6cdb23881..856eaa23e703 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -835,11 +835,17 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
+	if (handle->is_streaming)
+		return 0;
+
 	ret = uvc_queue_streamon(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	if (!ret)
+		handle->is_streaming = true;
 
 	return ret;
+
 }
 
 static int uvc_ioctl_streamoff(struct file *file, void *fh,
@@ -851,9 +857,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
 	uvc_queue_streamoff(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	handle->is_streaming = false;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5e388f05f3fc..bc87e1f2c669 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -618,6 +618,7 @@ struct uvc_fh {
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;
 	unsigned int pending_async_ctrls;
+	bool is_streaming;
 };
 
 struct uvc_driver {

-- 
2.48.1.362.g079036d154-goog

