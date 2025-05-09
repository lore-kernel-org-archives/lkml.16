Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEABB23C8A4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815058; cv=none; b=dgCJiAJBAYBwuI1YmZ21v598+dlu6go2S/un5NoTTVi/P4qGnq16oJA+Z3XYRWkJN1RPTdH2vTozgUsQ/rrVuVRGf9pTX2D5n4p3VUTBM4BXJJUUYYdHMkGLecst/TcyMyNIPKp737MhfKLPQ+7xnsaTXadae2x5wLn360QaGh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815058; c=relaxed/simple;
	bh=WlqhFERSYY876eu6fXODc3hMDt3fXzrYrhbCeMIHbl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6yESAJcVWwbvxamLaUVSpEX9H4DsUhApN9lT/CtjamL3Qt0a1d7YVeOvmpdjVAyrmZJfXUFZHfgZ/HZF0T4e+YG7OnhFJWpaBQm5ClNwwn+HXemQaRS3QrIxVNJ1nF3TFa0uG9jXt3+I96pIj+zpSpzOoofk2sXf7oqs/hpEj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VNa/KW0w; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VNa/KW0w"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so2763601e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746815055; x=1747419855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5MuBF0fz+s4ovvaXx6dw9lnVXB5+San6yqV1OmsO2s=;
        b=VNa/KW0w9vE2OLZY34beiVM3U04EL47LF2lhGqkuoAJS/lLcAQTcCWts95I0cLpmDq
         jX6qkcchxgXlCyPDvtlyxKoTndssNKttlCTbIIAGcLwsp6Qgi4kBb3aUp+J77hF44ATG
         1b6kg1OfhUBeyRGAksw2IEyNrAowW80hfs9WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815055; x=1747419855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5MuBF0fz+s4ovvaXx6dw9lnVXB5+San6yqV1OmsO2s=;
        b=GUFLn3iSO+YAEM6kPugedbAUYpH4muNxW9ZFkvMz8nJ1Vw1fpheAenlIxMxgQw8bhN
         sHBjK69qUJqBFdnIC1uONUdAOBLJFkygVU9wM6/kk+1WAa6PSVUv11+e2CCERTCiQcG5
         pyd+kiFlRnQtNDjxE4jNijXgaLKTQNIYs0VZoqX/c6geSVXxZs047HJ+zm6FtxJ6lemG
         dn/bOhAxYqrL7ox9rB+epKnShuaKVNEG082kEE/1Dx2/Bh5MmH1+xiT39FEWi0Ylc/Vx
         G5BheS/h/0tkziKPhXkIcgQv01opqwsEQ5rOfbpfIUX4jxl64O48Hg0IgcYXlS81ScNk
         XFlA==
X-Forwarded-Encrypted: i=1; AJvYcCWqqd8NMBCpqI/heKN4F4DZpbiTKiivMJ0RLcJFZzKk3x4sDDnZ2pYWpmfpE0TAK+U4myHaDJ0PZ8OXnoM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2XelGBiANMUfdlkSbMAk6T+QD6JvJ3HcRJ7G2ToK5ekP4cywb
	qEErwdImIFI7+UtjxJOt80kwLmu19/e6M1g96kKFk+kadGJOkCbd4N9ABMzNzg==
X-Gm-Gg: ASbGncvLRWd1VPXEQSdTb6pceipMjjzllFDt1bNCUCwASM9yTZx+vdd5dEy7HmJLlys
	Zyh4orjz3R/QgstdfbW2i4OpWrTilVMl4wyH9c39J2qdvTqM2gZIrVogw4ij3VHBA055HO/VkKj
	qWjtloDAdIOzZnL5etzpvnxKjS56fEEbR/DNSpgRYjnV9lNNAd2thyJ9ILXqWxGQ2MqB1eyB6Se
	jnkP+iGGaXScSvEMSTDFfFEmORb4YXv3X9Kk8h+AAhWaqpq4wWSO24Tlz/NPq2cv7TuS3JZeN+4
	JreYFPzK1FiNiyOdUsEK1TYG08oPOn7HAFOu39+K0MP5sfwQWA7IhiZTG2DJDpaTv2tQrwWPb9R
	jxK7F+JjwAUN4DsonFrr+BuPABYjN1jPYC+GEWxDzgA==
X-Google-Smtp-Source: AGHT+IFNM+/aVwpNnZix2AaOhc8ZTeC4nexkneFN7uiQtkM/9+QW6ZoYqnTUOzndZ0VZRK/TUjRmwQ==
X-Received: by 2002:a05:6512:608b:b0:545:2cb6:af31 with SMTP id 2adb3069b0e04-54fc67b8e2emr1787962e87.15.1746815054930;
        Fri, 09 May 2025 11:24:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bc9sm349410e87.147.2025.05.09.11.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:24:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 09 May 2025 18:24:14 +0000
Subject: [PATCH 2/4] media: uvcvideo: Refactor uvc_queue_streamon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-uvc-followup-v1-2-73bcde30d2b5@chromium.org>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
In-Reply-To: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Do uvc_pm_get before we call uvc_queue_streamon. Although the current
code is correct, uvc_ioctl_streamon is allways called after uvc_pm_get,
this change makes the code more resiliant to future changes.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 668a4e9d772c6d91f045ca75e2744b3a6c69da6b..862b4e34e5b629cf324479a9bb59ebe8784ccd5d 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -853,15 +853,16 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (handle->is_streaming)
 		return 0;
 
-	ret = uvc_queue_streamon(&stream->queue, type);
+	ret = uvc_pm_get(stream->dev);
 	if (ret)
 		return ret;
 
-	ret = uvc_pm_get(stream->dev);
+	ret = uvc_queue_streamon(&stream->queue, type);
 	if (ret) {
-		uvc_queue_streamoff(&stream->queue, type);
+		uvc_pm_put(stream->dev);
 		return ret;
 	}
+
 	handle->is_streaming = true;
 
 	return 0;

-- 
2.49.0.1015.ga840276032-goog

