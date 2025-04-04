Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1115618B47D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748663; cv=none; b=AFvWReAqSfrQMmS5mFzH6EQUL52Ip3PkJk/G+qqq2LtAW37ZoBV7kKICVJoBVrx7G8erZ1cgMch0p23NaL+ZR7dUrMcVbP6G1YBuoySoSdyCdFi95jCM/oP6h7L4aZsezEJ/pl5aDqkVTDXir81ZFH8VWdr0+mDzq2oLm47OB48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748663; c=relaxed/simple;
	bh=LA7uZ6q3Sc7Jg4Eh7U3qdrnVOUP1fZHPRdVwZ90iFbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCd7ofh7nt388v1FDyfKKWuld+5cyY1ZI4JTmXWpWDgieShSFD06QHhXadctwrQHCI7D/N7Yu4E0wVfqUDNbdbRRo0LtDv/HrBOlKqfwNxvSZj6xiIDtUkcZ7AxD0Bb6zedD6omFIorTGWmaHw4DoEKIMzSzdf6XFyvtLOLJa0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NIeRi6xn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NIeRi6xn"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54991d85f99so2784315e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 23:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743748660; x=1744353460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptSauccsQCiihyTIqD40ILfoZlJ+Jkp9zzyDCujSkmg=;
        b=NIeRi6xnq+ksJZM2R04NrkUlmhUOKrvMke3LG2wVHbsUy7RW1P7S2URym4/VeI967W
         hFggjUZAha+FoIgaLKYcslvI1bhVmxNEgDCsKO+CuXWuUWtp3IoOFEHMvtERWygE5W3g
         1S5OAF9h2C0IlhEZAVjM7M4KDnd2CsRsyaBVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748660; x=1744353460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptSauccsQCiihyTIqD40ILfoZlJ+Jkp9zzyDCujSkmg=;
        b=XLpRdkdGNtc66sAT777RoCD6R1DVS2bHjtfQymTsXQLONOvSFSXnhox1nESQ7P3sRO
         aH6W2KyjLnHnxECS/smJuZRAT3UxvDffbbY/oAZHhrGLls+IFdPtubq3SHt4HvJNd6WN
         7TXKbrOOW8iB8GYtHJKJa9DXVhELkLBSaP6JzI9HXgkWhC/v6VxG2oHtyyS2Z9rQJ1JM
         HdBahqW46LEksoaefwoLkEVb6k+I3WMCSoqppRhsGBK7ZKboPX105+KVTpZH9uqXLWcZ
         kHLkG7dQSjN1kGyHDlM7jQDLeYc0H7rcPyB4VW6LF7Xt6HO8zfKCdqcYP9SqEpAOWOrm
         gbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzuFrQcRq5AOWNk1O83Ug13ALJv1rT7q2mC6p+8YSLPdgi7zPx3wr0lpWFgiGgWMwzAl54nFuAMEFcNSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPraiRYBtHseL9QA/tIHuOU53DurOuQ7Af3ZaxuVUAQ3wDbG/g
	QxrMW4qMB4kTBLIC2xcfZBw6Z6gBlvQRw52v2H0MmqWNGzpj8CHbLTucca+0Dw==
X-Gm-Gg: ASbGncuXygpRCw56+C7wm94zgZxIq/WVgm+U5elhe8zn4CdGV0s+mcdrBm9dg1t8//D
	60WZI/H3tYZnam8KoSW5GrPMuvOKOscUiZ6bWzairMlCcH14rn6M20KprPhBJ0F80hLBa3B5Rm7
	UZQ1m+gcEW3Ti7giAKWYSU+chw1XxziX2udkLrzhbEdddLpE787cO0doYOdruuwAnbUdU2qVT9v
	WJ6iTTt2GdgaLECNGnfCrkp062wAgYok/Rpm9mrdm7DRXd8w3MdX4nBG6JIdf18vb/8cBxfndHF
	uNZrwVXEjeNKk8AYTWagOr56WrCQr81T3GMr+TPlO5XyHm8svwqIyYAI9m8EO1ADAha8QaxHP1j
	tAQnGZwI4pcWsODo7SESHbWXd
X-Google-Smtp-Source: AGHT+IFe0yc7cU3i1TuFDXhwgGxvVCCEnVSWjWSy8bq9xJ+B6v2LXYpgvddwkI0CUCf2TzgjhXvGGg==
X-Received: by 2002:a05:6512:1281:b0:545:a70:74c5 with SMTP id 2adb3069b0e04-54c225d560cmr612312e87.13.1743748658431;
        Thu, 03 Apr 2025 23:37:38 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672444sm338275e87.251.2025.04.03.23.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:37:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 04 Apr 2025 06:37:34 +0000
Subject: [PATCH v5 1/4] media: uvcvideo: Do not mark valid metadata as
 invalid
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-uvc-meta-v5-1-f79974fc2d20@chromium.org>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
In-Reply-To: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

Currently, the driver performs a length check of the metadata buffer
before the actual metadata size is known and before the metadata is
decided to be copied. This results in valid metadata buffers being
incorrectly marked as invalid.

Move the length check to occur after the metadata size is determined and
is decided to be copied.

Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007c1f0a766f331e4e744359e95a863..b113297dac61f1b2eecd72c36ea61ef2c1e7d28a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1433,12 +1433,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	if (!meta_buf || length == 2)
 		return;
 
-	if (meta_buf->length - meta_buf->bytesused <
-	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
-		meta_buf->error = 1;
-		return;
-	}
-
 	has_pts = mem[1] & UVC_STREAM_PTS;
 	has_scr = mem[1] & UVC_STREAM_SCR;
 
@@ -1459,6 +1453,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 				  !memcmp(scr, stream->clock.last_scr, 6)))
 		return;
 
+	if (meta_buf->length - meta_buf->bytesused <
+	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
+		meta_buf->error = 1;
+		return;
+	}
+
 	meta = (struct uvc_meta_buf *)((u8 *)meta_buf->mem + meta_buf->bytesused);
 	local_irq_save(flags);
 	time = uvc_video_get_time();

-- 
2.49.0.504.g3bcea36a83-goog

