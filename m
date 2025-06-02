Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52621221D94
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869593; cv=none; b=d1eYRYF10+KgrQ/rw+zNEm2ZyIkOVBgC9uZe70m6EL39wb78QDUr3vzw4ZN8WdLHm0nPImNPp3Z0lE1I66PASnhMn6ui/de49EptzfcQwq9n6t/BZmD7AMNoITUwMtp0FcNUNqIFuEehtdGbYsAnCNw3SfKo8ulkopJsFejh6E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869593; c=relaxed/simple;
	bh=FjNRXZX0ch6DPRErORNEU7CPhqxiHvHorfrQXODtlgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WS3/SuC4A+vJR7KMHEWjH1fLSxCF7FwIw4NqBdbDzMXb8b4o1jDiTYJuWy9YA5Q4/qgJ6stzZzJJu53dkqjm31R74mZYOXvINXnU0ZN3Ke5+7NlKGiOOBjogTtlCaHYTdwLTSEAu46SD8tC35xBUh7e9fpZJP/LzU4dF3ibRE20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aBnLktsR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aBnLktsR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54e7967cf67so5195353e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869590; x=1749474390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AArFLpvrTviSLo6TTlnlRwmgDV8UtwktXMRNEndWCQw=;
        b=aBnLktsR/8DwioPPDAksrGeFzmkC6WnG+zJd7pmWe8tdi76ayan5jtW7sA8D2bsc2V
         pA8rc+By0Thce8+HGpwuPlDCm1alfY9pupaWxoCRoOnmqx9tBYWfROFbyVTmqtWdhstx
         /jCduwXKa0hd9X6au89HHHWURn8T41taDRigI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869590; x=1749474390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AArFLpvrTviSLo6TTlnlRwmgDV8UtwktXMRNEndWCQw=;
        b=gk3iHO/IJUOYInmkciCogXzeuYPJBzEX0KaegFncIaIp1MDyQvMgvkx6mXj6imLbXB
         yg/raLKg36nxniHWFyl8te3gP/zlY7aPoquOYwy3/G5pZCp2lk0Ks68bMJUu4zomKyWe
         u96ard8PfzXsBsBxCmiIuucSEmnppNj7pbbzfgY8i7Wk/9TT0P+B3nd96rQBiilSsE9J
         j7ZjgJKYDebYYKxSiRL9fVuwyFXNchFlpAPBYFtT36VnSKCnO7UiIKainqO2QGFlKMLY
         oZ0gvb0z5Ip4fBk4i3pas4wTsC+I6Tcw//vu+IJ5NxOvC5c3EeHq5kVsYGoPyufHrg5j
         4Fyg==
X-Forwarded-Encrypted: i=1; AJvYcCXL8BMHdJS9W3HnCHkfUTYIdWG/oPmnZVYOGX1p6AaaH5qoh6x0o4Kb8/SQjPbIxjx9ghwvgnaHdB/ZcnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzvDG6tMB2p1TVCPHypfpgLRb3XTGu93ALiTbJsiowVppO/pft
	/wRvTMh63buoHTCvZyNt8Pkbjfhm8nY37g73K8kh6x1Z3BHs2cu2utR9YP52cLP99w==
X-Gm-Gg: ASbGncsJQxAQQuHoh2hL/6ndUo5Hpl3wsv30mX/FjSIketsRU399VTXaBI/GK33F8D3
	jnVeovtkJyD0S0p8ktKW3Za3ma5n5L3iPBvH57dvdQez+hciIKW0i0Vnf5OaD8J5zz5mmyGY/qZ
	GopwoWDz2RWlvnzXKnngQjvrMgCS9QH5krRRHFiZ7CsEzU8Tb/13efB0hu694UP5w2qU/+wxWxQ
	vgMrACtPJOAAb8xH0PUsedlsUFtv2uy5aXL9Yz28+qTLWGcliX5uFvnGgw7v+x4WuYmcLAx/QjO
	4lMOVtY8o0EfbdxY1f3LnQSihuHnMt6RV/FKx/8hJTzCsp7n/N64SmrqwEXMbTrJxPncH4YTHej
	W5gCV1DKWeewKE75t+a18FNj5oQ==
X-Google-Smtp-Source: AGHT+IFMjaqEZeZt24KEPp77Itzt3bDSNiwjg8uVRVbtSDFC8vVrvZ0qTxTGge30XlC9CZeXykZGdg==
X-Received: by 2002:a05:6512:1387:b0:553:2927:985f with SMTP id 2adb3069b0e04-55342f5464cmr2297117e87.5.1748869590293;
        Mon, 02 Jun 2025 06:06:30 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:18 +0000
Subject: [PATCH v2 6/9] media: uvcvideo: Do not enable camera during
 UVCIOC_CTRL_MAP*
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-6-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

The device does not need to be enabled to do this, it is merely an
internal data operation.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 100cff47ecc5ffd9941e22fec24756abda1f015e..020def11b60e00ca2875dd96f23ef9591fed11d9 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1179,10 +1179,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	void __user *up = compat_ptr(arg);
 	long ret;
 
-	ret = uvc_pm_get(handle->stream->dev);
-	if (ret)
-		return ret;
-
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
@@ -1198,9 +1194,15 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 
 	case UVCIOC_CTRL_QUERY32:
 		ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
+		if (ret)
+			break;
+
+		ret = uvc_pm_get(handle->stream->dev);
 		if (ret)
 			break;
 		ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
+		uvc_pm_put(handle->stream->dev);
+
 		if (ret)
 			break;
 		ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
@@ -1213,8 +1215,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 		break;
 	}
 
-	uvc_pm_put(handle->stream->dev);
-
 	return ret;
 }
 #endif
@@ -1227,6 +1227,7 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 
 	/* The following IOCTLs do not need to turn on the camera. */
 	switch (cmd) {
+	case UVCIOC_CTRL_MAP:
 	case VIDIOC_CREATE_BUFS:
 	case VIDIOC_DQBUF:
 	case VIDIOC_ENUM_FMT:

-- 
2.49.0.1266.g31b7d2e469-goog

