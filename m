Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4409F28E601
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455100; cv=none; b=CkMAOltuaNP/lE2eW8aAxlg3fPBYIhwiUjOZoht4n7QT0iRj3ie9Y0R3izEe2q1RCVyY63vyZp9rdEceymzAfyo2IPNcEj8f47XZ1yINB5A3rXnvdquLKwDz8Ehc/L9bZbePfQyNLZBTwrXE9hyzHQvWvJGHJV1/cRknwylaUkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455100; c=relaxed/simple;
	bh=UEBuYkRXWdWQnJ0xRRALcILURlb3/sc/+uI8fqdHllI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrvomhq1w6dOvoSbpK8byp/LhrmuPVC8O3G81phmLrCNQ9GZ4RGIfP7Uq7GgmabI6rwpP6nHpCWdLeRtkP39hpeQeDze/HtZ/y3E1iFPrW8AhsDOYrUngku+ln/lI2EU0wgYBK+URqDKyXU7i+rvesZ3gI0eYDzg3QcrIBzQdUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ych1TWEw; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ych1TWEw"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b0d638e86so10207e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455096; x=1749059896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqqzc4JWCwHMyJVbZCLvTBytETKRAUUhg+vp/MQs9Og=;
        b=Ych1TWEwiLuwVrBaMS/kWZWEgAvBDX7MI5Ofe0wGT7Ffrvxyl7GGO9XSFQI6C1gHWU
         Q4DboNV94Tw9qoEfgbHQXN+/jULJ4OGEbo6fl8adoEU5DtWRbJIxV3u569c1JhG7Y7v/
         nzbKh+IZ/ZHTmhfSgUOqN5iAei1lH+BUyeiCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455096; x=1749059896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqqzc4JWCwHMyJVbZCLvTBytETKRAUUhg+vp/MQs9Og=;
        b=nsaznWmWCZgcz8EBQ9OzcXA3k3xSxJ9ABKOeBmC7gsjkj+UkE9GI+ZU6Q+e/9bnJxd
         yfSj6jfMZMBgZUL7L5sUbPqQbPHD028UfOhBB+p1xYdFZyYsQQJsVdOlUr2sNjetIO9k
         qqwcCuM0zfLhgMi5pvCKUWGdxHppk4YurGGrsofFt8TQgGumR0gke2kuLMzooJ7HqoBk
         TQV5ITEK268jq6ShoHIwmIAdqHvxDjs6qxSw+I/RSkUrVL7KBFt9ooy5fReLz1D2ILy8
         2mG9hZb5ZXOxyquGDYYKTI4ihKFMOVKL6DMz3VkI+A9afnK3vwFHPUZdpwrCjikwSAOK
         0upA==
X-Forwarded-Encrypted: i=1; AJvYcCXuNdp6X/7c9H8t7spdsCzCUUxQdgG0Tq3u0VRJrd+jgZ4g75knLYznVqWy35XXi0SQrciMDpzQF9t8nQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6yk8ySq/s3aZyDaoCA9SVaPB9P0eVQ7K2bry6zislAatfWxep
	D7gbaUsGNKOxtpnX+wma2s45lTSTKNIQCzCMy6DbyfgoTGx50b7Y5VMPrImenAEvug==
X-Gm-Gg: ASbGnctUUqIiLGIZYxpKgWtU+t1pFtWw4mXbNtuzT+yRU4HYi79xM9PZEW55IleYAXD
	HYMxyJVgTAKPsfB3dihgozgUQAzPGnB9FpwgJiUH8iB95oif59dLS/lxekbQ+fOxPZuwYu1u/5N
	tsY7+6ks/caAHEw++zixmZZMveqbzdsp3pdU6DHP3VqRY3a/6yvpARRuOKzvIN2/0/uvrl3w6CZ
	aJozYNUXAY8i5wV+f4g2yHcqY/xQJhKBQ/ISGhR2O1bb0DJbnnfiWCLolZ4bz+ISf4RlPAuMkct
	t4KffzNokzLj/mb26D6bEo1IhollSRu1f7VJ5Ie34Y8xK+tA1QUWLmq+pvHD97IfCfIVZ7V3w4Z
	SoI3cw8nrr8eN8i+4y7G4asPUfQ==
X-Google-Smtp-Source: AGHT+IHJoSbZmVCM0+OaR+drNPKZH3L2vkLptaYk24BZYjh1TfGUyjz9xyXLOq0xMcSeyU9sLHySbQ==
X-Received: by 2002:a05:6512:2c0a:b0:553:2bdc:e36a with SMTP id 2adb3069b0e04-5532bdce59dmr2042225e87.34.1748455096305;
        Wed, 28 May 2025 10:58:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:58:01 +0000
Subject: [PATCH 6/9] media: uvcvideo: Do not enable camera during
 UVCIOC_CTRL_MAP32
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-6-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The device does not need to be enabled to do this, it is merely an
internal data operation.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 65c708b3fb1066bf2e8f12ab7cdf119452ad40f9..2c6f3cf6bcc3f116bbdb3383d9af7d5be9832537 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1224,10 +1224,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	void __user *up = compat_ptr(arg);
 	long ret;
 
-	ret = uvc_pm_get(handle->stream->dev);
-	if (ret)
-		return ret;
-
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
@@ -1245,7 +1241,13 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 		ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
 		if (ret)
 			break;
+
+		ret = uvc_pm_get(handle->stream->dev);
+		if (ret)
+			return ret;
 		ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
+		uvc_pm_put(handle->stream->dev);
+
 		if (ret)
 			break;
 		ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
@@ -1258,8 +1260,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 		break;
 	}
 
-	uvc_pm_put(handle->stream->dev);
-
 	return ret;
 }
 #endif

-- 
2.49.0.1266.g31b7d2e469-goog

