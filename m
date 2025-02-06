Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E309A1ACED7
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871225; cv=none; b=SUsn5Xzd9mdL6ncv8vUWYJzwTYbrCzRvV4nAoaao3aQNxqPigpPhOLC4y81Avog15tNGAokgmgE9ixk7ydSe1YXDPa0OsLfFMi7Wz9b9MYqS8OaNgYiY4IipanTAeEtUxoMMXX/e6lOAdRLeLm7DTcqiqadXMlj+B5hnUYitvuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871225; c=relaxed/simple;
	bh=XTNSgJrJEclgdePfJNToDJor8F5x8uBa0UDEkcTlIIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QeEOJ420Zr61zpvDbz8QDUsnAVd3KS+nSAOpMzyCzEMa3vIPtDtlserDzPtgXg7W7I4EP+mZcFD6YN4lwCC7SWdetH9NDWc2mXtiX/ghe70Z9+tYZ05+zoG59XjibUS6/5Hj8ZTzimJQBlPRyYCXvKBB3AM3mofj3dADqKRXGD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h9SeFq1g; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h9SeFq1g"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e43c9c8d08so9326106d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871223; x=1739476023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igtmC9jgV1/HQ1d7Wdm7uxza0ZAAjdzHDVgS49iXFC4=;
        b=h9SeFq1gVmoO0GQdADjV/pVVlR1fiaJUvsL4/RZb8t0sZTgHkzc6e2/54x0I0HOXDu
         eEDu2oaM453ih79M1zQnoqDJNUJ0ZFbRqpGps7yhm4XucNL5U6qyguH1a8dN133swp/m
         0dm7xyseg0gjMBCcuaJ4kqYeXAMXFZVtXuFnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871223; x=1739476023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igtmC9jgV1/HQ1d7Wdm7uxza0ZAAjdzHDVgS49iXFC4=;
        b=T75JiMLeeA+Nmaz3GmHD/NrCig/oAhOULib9u49Tmq8xvwRpkgFtw21GJWofvxP81J
         +EewJsMPmPhOBsuDNvRp+u0lVutdxm352B1ABjFOH9Jw2S9o6zQdEO2wx2ZOfd6E6hdL
         LWL7s9NaWikj7mxf5d52uROQQqfcq7hZxdWwwntex9zfuDLb1133BDSFJUJ2VxYdev2o
         yUgiEq43658R7TN/E16AqgLzWx297i+3PaHDEruaiQa1RbDvhdYFsBDbk0hZGWcIl3go
         iY5IA4HeN0QenNl4/hoEVzxXAmTLvMcG6H9hZb5cxW74FzSxjvS5dCAZfmRkYrZiw421
         DMdg==
X-Forwarded-Encrypted: i=1; AJvYcCWXK4F6Qk7f7vuHWvp6o8Rg5kQvT0ubds+CZS0FbOrjOKI0BnDm7oVBalR4a/JgGg9f63IfEva9SVzh2FE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5eeHKMII4nojI8TCxQ5ngcqntdDi2NU+F8Ibo6ush3wuI52Zj
	uY5tpeaYwJWxQognivOE0Lz89ktJP4pwdf4LwPruZ04sH7qvfVtAZVf06txt9Q==
X-Gm-Gg: ASbGnctM4YGgO9eQBmKf4fMvPbZaQ7fNiNKoSLsc8X3iquKxUVEldTZ1ov6QNWWmA5E
	VMe3renZTSs+TePQratJqoGvRXWVoxTwWL0qrMEyNDhOX3k5A3tBlDOPhCAbgPpWrvYKI723SOf
	79qo7z4hxoSTftasRscr+hSgFS+jWlqNilCPqmWPwXpMB6e0PrfR1EpB85u6jHAZDqqCBCZFrvS
	nLS/suqxCX65TNtzizmBS1nFUH08VOfCZYOkJpLAwWf8G0kpHqlYpcpqilPZuhYou1vIq/890hM
	btwefh1iGyOCZNDLVBguOhxZyK2uyJgfpV0ST2M+NDVldZfuS7ZpDW4CPKyiO6O02A==
X-Google-Smtp-Source: AGHT+IF6vyM30lmo4rLzFxc67TuSAmLMTXYr8s3jpkk4a0HE4QMK03rygp5IAu9Su7eRIqG5HefLFQ==
X-Received: by 2002:a05:6214:f61:b0:6dd:84b7:dd86 with SMTP id 6a1803df08f44-6e4456eb684mr4186876d6.36.1738871222740;
        Thu, 06 Feb 2025 11:47:02 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:02 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Feb 2025 19:47:00 +0000
Subject: [PATCH v3 1/6] media: uvcvideo: Keep streaming state in the file
 handle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-uvc-granpower-ng-v3-1-32d0d7b0c5d8@chromium.org>
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
2.48.1.502.g6dc24dfdaf-goog

