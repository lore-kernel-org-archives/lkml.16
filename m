Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC520F062
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869152; cv=none; b=HZoeMLEl/e4D0G1ORfRJrcRsJekXwlczBBZBdR3hC8MpwyP2BZPJcIud4nLUpRu034m3pHmtXAIIe8eJeevhbUB/P+CVzYyBhbxkjq83yyveC95Hq3KD855QQFcHLa32QXlurjuHMpnDDir/e3M30yuqK6cwZHGEcBLWTR/2DEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869152; c=relaxed/simple;
	bh=pAwYR7oteo3vN3c/HkFqcbWJsyd0dKKMMaP2gKBrNyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GTpV0AkGxfYtFKYoCU9mXEr2m/ja7MTHJiERYF3tpF13HVWHtiTvugiqssHt+4HLhjU8eZbF1/SJATPm4lpLCF6wCIozPp5pY95F9n96OI+pfTumEftCwyhg/sqmGwjXQFYnuBZaZ+kq+/d8jjUbL60X5cb/PcArni7eoHNLThg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fqhGoqDF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fqhGoqDF"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55350d0eedeso312914e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 05:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869149; x=1749473949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YmjTdxkPOA1uf9GrAFrNIGDFJaY+dZi3frhM7shyiw=;
        b=fqhGoqDFhiA6lmteLazdFiNZ4vNoMm4aK0k4n5O8njS27lm5TVsyqCNaymkeXlg9cS
         SGuforgNkCC65tNJ7oPsT7KYSqCRMFA1WsLP6Rp+c2gxgMyFKwT+luu6QcVM/HLj/Qvo
         R2Ha7DE+8mO0lx9izTV0d74ILc/ppooSrbxuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869149; x=1749473949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YmjTdxkPOA1uf9GrAFrNIGDFJaY+dZi3frhM7shyiw=;
        b=a2IdUFxyY6rp7QUTCiScMIfwVEXuUdn5z2CDL55TfSyKiW+J0WLE5rRRuoe3aDuY/I
         IORXi0NLMiHv4njyO8tR8Kw12HvUKe+2vA5/boJi8Z9pvdxORM6J0UdiX0ydKYNuOtvd
         jlh/PtTRfen/vfWMWNVqtpYT658OxDkykRf6VxBoB64WlfbdtY9sCpaL1b0Oq1tOmEWc
         Hk5sx8NYp+9QOn4KcIzpd9/2dXKBHuYTUcjziENdr+j6gZkJKImekYRLL/kxS1glmjbX
         5y1ESBfSj4Ln2lhVA/953cLPAA9WsJji1cqnxWXOb7utbZ+/7H26VKnAezQ7aYQQ7ZTw
         24/g==
X-Forwarded-Encrypted: i=1; AJvYcCW5+Pn5IrPH8OVfxDDzliO1l+Ewvzd2a5wAkdQYC0DLeTGYGX2QXFNjY7XEeCLk/84cVlXzDKHYhi6Sv1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCYHynODB645/C7dkXJB0Pc9LLEJjly4mVY81D334nydFTgZq6
	EUf+oBYci+TKmBTFI8qm3SY7KKu/tU2/TYf+U+lfk3L7yVUtbCoKu+zaZZ/niUqIAQ==
X-Gm-Gg: ASbGnctFn9buSIU32hPNReFmsVHOBlUJf5e0SDrOmnOavdgALPalJFXhXgVjpe2rZq/
	Pr9oaG7EsEbI+T44uVrxw5Sk+qQS7Pc6wXTatMw5pXyYgp743VgmKltEC+x99J/DQDsKeAFLnj9
	DxGfnFIy+vttZkw2ECXm9TOQDeclCKkkVq9yhnEHwCj4kJHtaRw/pmK13J8avG3Am+V7vAsqH/o
	uOi27YhdntkwoOJFimNsCpPgASmDZvwoIy+FDImJO/xzNRdh7SpSpBM/aVRM42RSuRq7rN41w00
	Koq5u6vIA7KrYieyefDFVl9qx/wVJoXsRA7O3cTurVTjAxqbtNLdoJdirtNaE9s4wm3zSe6k78v
	gjUtCyQmUvOCDyq/mQT+EoWKJbQ==
X-Google-Smtp-Source: AGHT+IENDYsuYrVM/PI/1zsFe+YIqnGhU0k6On7h3XKKfr6W2ID3ogEuuMlqT9Xqt6MGTCUJahfdTw==
X-Received: by 2002:a05:6512:3d25:b0:553:3945:82a7 with SMTP id 2adb3069b0e04-5533d160fe8mr3828575e87.12.1748869148648;
        Mon, 02 Jun 2025 05:59:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379377a8sm1601140e87.239.2025.06.02.05.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:59:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 12:59:02 +0000
Subject: [PATCH v2 1/3] media: uvcvideo: Refactor uvc_queue_streamon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-fop-v2-1-508a293eae81@chromium.org>
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
In-Reply-To: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

Do uvc_pm_get before we call uvc_queue_streamon. Although the current
code is correct, uvc_ioctl_streamon is always called after uvc_pm_get,
this change makes the code more resiliant to future changes.

This change also avoids calling streamoff, which is a rather ugly thing
to do.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
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
2.49.0.1266.g31b7d2e469-goog

