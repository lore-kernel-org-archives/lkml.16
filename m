Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124A823D2A3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815059; cv=none; b=LLDlBKXnLx+yJTcGRaRha5yv7Gdwcu+kc+FXZkJ9CWYMxyKhvwixNBTX08wX+LXbjLgNGG/xhRA8UHE96J6s1qF2Aps7aEgmQw30Uqa7iebJDBuyR2zL1gePyWCBV+EO1LKheEC7jWYizYFZs3AjSKQ3rFv6evl3C3FlbBNvTGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815059; c=relaxed/simple;
	bh=ejqJ/gJ8wJ7SrRsxrwHX2ivbzatZEKONS8zjnjdr7Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8HRM1ZWkFYgm1c5w8jO4Nr/h95oHjaom4M0RXKG6TXluoa4mQslZF4I6O38C0lARZtZJF++R98yoDCcYHt86qIfp8gAwS1MAeCC+SiZ2V8wYFGx1+YKZ0A1ykQNfZlOTnjA0ZtpCC4NL3S47mEmKMJS0sygtCFMNV3MK8Ffkvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZybcUMqd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZybcUMqd"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54fc9e3564cso878204e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746815056; x=1747419856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSG2c/BzhlxE+34h/Hi5JjSdjHGQxrAR1NJF6hxkTe4=;
        b=ZybcUMqd7iC0yTCtFQkcC/kiG1bJtzfLbHYbDEoiS13St8idSB5fuGB1rm52qlsnqZ
         7Rgftleong3+lvy26MkUgr/wsLrutP5lNie0Zfq49EsMGZnDJz/B1GyI9IYb+5b9IddP
         aYwEp9e+9Pr5no5gzTiKJr2eWS0Np2PLOrui8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815056; x=1747419856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSG2c/BzhlxE+34h/Hi5JjSdjHGQxrAR1NJF6hxkTe4=;
        b=J8rjx7A5g45W2Pb2aUNyMSjrrXYdwV2xPHTlag7bGgj4mVAwHrCGjYSL/9Bf1yaz8X
         XPBFnzhiywOBD1bMgB9YTTou02RQGb7PvtqXagIt6QA/Z4QI/Rr0p2pIXcVtRaRYSIKQ
         ByL9dcR1GXNNLx5bNiWsuPkJHhikCO/neEDP18d9LNzBPs+wWyaYq0P02PPYG2vFMpen
         liWE1nY4kvxpdr+uqZfNa49b2zx8J6GDcCmzhwQnLSYlcwChVupVYwiLXPOtvY06ysea
         6U8tAG69NgO0wVFLfA35YZDNw/XHl+vGBjI1UDGgdyQIaHcWwuS9pOc4Q/DfAiix0qNp
         tp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPcWJO02S4G+qQunJDVbiKYVtHNzdcnaa+yx5Lnv/ynYjbgo+Uk679Gbdg3wtjl1NJejU73qjM4oA7BX4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpq6fOwsAPbjEn+4JiQr1k0wBYmbtFYiYvisJRYgPFSA+a0nzb
	L+2izGfx1QKWulkmCGXP6rkwVBd5NcBPKgUq050K9Ih7YqoHFtkq2vTLSNOfdA==
X-Gm-Gg: ASbGnculVlw6Z3zIhuZWnYQYU57DHpL2cyR2DuGkeGVFUXamoMhdBJmvAOqhO7gcEXR
	zmaru/HrxWPK/x1XqndpimQlFMGcm/D8ztelPWJ5YyxZdOIOlTYMCHduGH+KSzEOzUXup6u34M2
	Zii7Gn2c0HBKmmD3hrtidKrxp+7kGJL6kEg0X9ItoEk/GgG5SAHfaVqIXhsurRoJNGqBLr2daFR
	XvPyC/eDL9bDKqSeJqzQu8KX5xuLtyBDr1qQ8KNbnJMMQtImYYqdZ5J7TN17txHyxMcgwNlqR02
	s3NtYIu+gRNVLt7QjZ7tAg71Bo1XWhbR4uYP0iAbheGHJFIyO5IzU+wlqLfoc/dkn+AmogmCXw7
	aTW7jxnqMxw/ftjW+Qq/uc2WxOi5FpixGpMNBH7hViQ==
X-Google-Smtp-Source: AGHT+IFB3hsuHxjg/fmHgXyAyLViUq48ySyQRa/Fx0lUJgNT2+8kLZlrQ1DZIwrh7vFS3Kz9c4FIAw==
X-Received: by 2002:a05:6512:3996:b0:545:1049:eb44 with SMTP id 2adb3069b0e04-54fc67d6211mr1584325e87.36.1746815056100;
        Fri, 09 May 2025 11:24:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bc9sm349410e87.147.2025.05.09.11.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:24:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 09 May 2025 18:24:15 +0000
Subject: [PATCH 3/4] media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-uvc-followup-v1-3-73bcde30d2b5@chromium.org>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
In-Reply-To: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Declaring a variable for doing automatic cleanup is not a very common
pattern. Replace the cleanup macro with manual cleanup to make the code
simpler.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 862b4e34e5b629cf324479a9bb59ebe8784ccd5d..fe3db03d7458eeb4b9a846ae4ed141bb60ea46eb 100644
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
@@ -1399,38 +1397,37 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
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
 	}
 
+	uvc_pm_put(handle->stream->dev);
+
 	return ret;
 }
 #endif

-- 
2.49.0.1015.ga840276032-goog

