Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD1521CC59
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869597; cv=none; b=YZ4/jlbKRpFjdfV9gPQQ2blEfL3za/mxop5DA5c9wJ7kPLlEZhiUi8SfBD3jzRE4M11TX9lrXMaFRbCKsONhoaz4j0zye3Bm603r5l5zw1aqG2dZ4wMh2LIH7g5Vo61I2cPdFWjPMlxK+sHOiSbLdjRMWsjhXvm7auET0ouCBYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869597; c=relaxed/simple;
	bh=fc23CTNTD/5dwFWW51Oa6nQRUyLg8YME2F5fGjT2y/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sR4o10s102k4lF21XN0ksC7FKakW9KpI1Y7NDMVGZt/SfUmCs//iqUGHxjUQz8feESVBVidlwDuUNERpao8TDyBr/daQ4pG3uXzM9bFta2YPz2ylSf6voLdkgDsL2jyDPWaRp8Wz3q5Nwrm6iv03DnYziYCx6HqgD5bLamJyHdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bIBX7PlQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bIBX7PlQ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553245cad29so4524953e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869593; x=1749474393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTh0byM1hk1JW8FszCVsWx6/0+6cP5UpipLznYZuSMk=;
        b=bIBX7PlQvGdfuLHZvs8esiWiquIP24ZG8EhGW7SSkD4OqAwURyPh/EqMKqxHf08apn
         YDqRvpVBhFcpYot0HleCreXWyap1SUMAseUFBK6N/PSpjuT3hI9nfT8MwvhXDWmTiJTg
         g3MYvVF/8EX1zp4XJiRuD17CT4M+wUWmMig94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869593; x=1749474393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTh0byM1hk1JW8FszCVsWx6/0+6cP5UpipLznYZuSMk=;
        b=luQuQJO4lhxMN1pjYSfDp/neWxY+RFh68GLSD7hjqN+iueWYZvtq5Kw/oUAIWuZtkl
         qlOh+q0y+e6rNq52rU0cwL2KfJIVGwv3z9HAAh4eStzhnEcCmQTlrGT18BFKjqVtQR2I
         TjNgJ+XlVFUdjmzWj15IengqP+ZnzyI2cNiRpwxbhpiWji0KlsxvKNyv8lbdBwRr3QsL
         mNvT3mIvTtw4S7Mcc9+whd41GN6Zs7ssCRHoIBKx+l6Bg6cm+8IXhKq3PjJbZwjqRuJ9
         xjRaxRzaOI9p0Ske6QzXnruYgmYHUszY6ZGTa2xqyjDSU8rStYGeGWKHCT9SXIs9zqgL
         jqog==
X-Forwarded-Encrypted: i=1; AJvYcCX94X1ZknlnHA+NfUVdm6BcVKI5mCtWjgej+ckfZ4kpOG/7CBu7sAgCuHxqNv88Ws6vD9MoYWloIN29jV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyW8Jyu289gVlH/r3Y6HjRElZc0UBP4v7yyknIdH0JMppH+zry
	lowzNRdaxMyMfuANHRcuhI7p4hhTL5WdQt8klMKf+Kn2CGKq9UYvYN1gREJsDBii2A==
X-Gm-Gg: ASbGncuwKcof0zcguO8Sy+fXeYW1aPFAlf5x8DCQ8965L4W1c1tWsAWTToMt/Xh8lNk
	aRPM2u4UCIqXhnqotXar6yZKtYRUiehha6CpjcMmc8OEPEdS7TMv9HBJymnswU3T+49Knx0/CVm
	rQvkaG+v+e4UrcdwgfUzyozn5N0gSs2/NP8IcUwuWx1RAgQuavKJMW6v5HpEleNxZciy4Y2zTSF
	YyQJaxba9ab3RD+IEQwRYL/DRoW+Y8X5glkq2LDIQpRSKKbb+YvbGo8ojX4PVl/3v7xrLHRbWXH
	y97RoV1tE4yJQOWprfutPqZbxTgnLm52ePly13vOU8dMWylZjY/ZtqSNZDd1mGfqikKGAZ1o3J5
	to0o9BHvVhLJx1R16w/sHXDQfww==
X-Google-Smtp-Source: AGHT+IGLsHBEoVmtd5NKV7jtspYoybyPtSFNaIEksBmBsZO+upEkAy6ZGHoutD0TgtPmWaeUDGX0Dg==
X-Received: by 2002:a05:6512:3da6:b0:553:2e92:2c98 with SMTP id 2adb3069b0e04-5533d1bb8d6mr3488304e87.42.1748869593135;
        Mon, 02 Jun 2025 06:06:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:19 +0000
Subject: [PATCH v2 7/9] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM
 logic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-7-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>
X-Mailer: b4 0.14.2

Instead of listing the IOCTLs that do not need to turn on the camera,
list the IOCTLs that need to turn it on. This makes the code more
maintainable.

This patch changes the behaviour for unsupported IOCTLs. Those IOCTLs
will not turn on the camera.

Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 61 ++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 020def11b60e00ca2875dd96f23ef9591fed11d9..13388879091c46ff74582226146521b5b5eb3d10 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1219,43 +1219,54 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 }
 #endif
 
-static long uvc_v4l2_unlocked_ioctl(struct file *file,
-				    unsigned int cmd, unsigned long arg)
+static long uvc_v4l2_pm_ioctl(struct file *file,
+			      unsigned int cmd, unsigned long arg)
 {
 	struct uvc_fh *handle = file->private_data;
 	int ret;
 
-	/* The following IOCTLs do not need to turn on the camera. */
-	switch (cmd) {
-	case UVCIOC_CTRL_MAP:
-	case VIDIOC_CREATE_BUFS:
-	case VIDIOC_DQBUF:
-	case VIDIOC_ENUM_FMT:
-	case VIDIOC_ENUM_FRAMEINTERVALS:
-	case VIDIOC_ENUM_FRAMESIZES:
-	case VIDIOC_ENUMINPUT:
-	case VIDIOC_EXPBUF:
-	case VIDIOC_G_FMT:
-	case VIDIOC_G_PARM:
-	case VIDIOC_G_SELECTION:
-	case VIDIOC_QBUF:
-	case VIDIOC_QUERYCAP:
-	case VIDIOC_REQBUFS:
-	case VIDIOC_SUBSCRIBE_EVENT:
-	case VIDIOC_UNSUBSCRIBE_EVENT:
-		return video_ioctl2(file, cmd, arg);
-	}
-
 	ret = uvc_pm_get(handle->stream->dev);
 	if (ret)
 		return ret;
-
 	ret = video_ioctl2(file, cmd, arg);
-
 	uvc_pm_put(handle->stream->dev);
+
 	return ret;
 }
 
+static long uvc_v4l2_unlocked_ioctl(struct file *file,
+				    unsigned int cmd, unsigned long arg)
+{
+	/*
+	 * For now, we do not support granular power saving for compat
+	 * syscalls.
+	 */
+	if (in_compat_syscall())
+		return uvc_v4l2_pm_ioctl(file, cmd, arg);
+
+	/* The following IOCTLs do need to turn on the camera. */
+	switch (cmd) {
+	case UVCIOC_CTRL_QUERY:
+	case VIDIOC_G_CTRL:
+	case VIDIOC_G_EXT_CTRLS:
+	case VIDIOC_G_INPUT:
+	case VIDIOC_QUERYCTRL:
+	case VIDIOC_QUERYMENU:
+	case VIDIOC_QUERY_EXT_CTRL:
+	case VIDIOC_S_CTRL:
+	case VIDIOC_S_EXT_CTRLS:
+	case VIDIOC_S_FMT:
+	case VIDIOC_S_INPUT:
+	case VIDIOC_S_PARM:
+	case VIDIOC_TRY_EXT_CTRLS:
+	case VIDIOC_TRY_FMT:
+		return uvc_v4l2_pm_ioctl(file, cmd, arg);
+	}
+
+	/* The other IOCTLs can run with the camera off. */
+	return video_ioctl2(file, cmd, arg);
+}
+
 const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
 	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,

-- 
2.49.0.1266.g31b7d2e469-goog

