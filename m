Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442B92980AF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171357; cv=none; b=AxV0jGw5NrtAOpHXl/AKBBXfPjAKfkVWxb7eKNVutn5nldGdA/rnIeV5CT1LNp1OnRAMaMjmxmPujgKFP5CsA964jbIYA+ITv/G3eFUXCfWgjdz5BSxIg2FSF+YoYfAdJIN8uTAcbXr6uv466Kdjut1CFuHnpLHSUOih5aasB7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171357; c=relaxed/simple;
	bh=aktg2opJq0+dY4a+/MNIzTnrkdP0Ocg7NaKfj2bHfhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5J9QFDhrDCF8ylbNASRyWYT1Vvo7xE10bqqOyslrMA2MdOARH/6PCMdJM38FKuxxTAx8/QUJ4/OAIIXCjRvhA9P/hAC1jNCbL4sbptnj2XSGz9X+to+4MEKjrkO181RWZb+swIwmJUZZtlKxBmeo+I5tNsHZDbEc/6GAqreWnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lkqYUoYC; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lkqYUoYC"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5533a86a134so5123395e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171353; x=1750776153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzIXP1ycrxCwpqJ0rvCcPdawBbbWpEqHaCxqb+yy90M=;
        b=lkqYUoYCEgGbtLQssHjEDMlNVUOkMZSLMhZcW54QsjOKP37nb3j3DILDimDNfCDFun
         VUCplA7lZ30DdaR39W+RC5ZpHqTDa32JKP1ca1bT6ktwDAPh5fDfhtYgv5E/kMoPvdkJ
         XfwN36BoSQCuHpYI/bxxrFYo3HzcdSA3XZ6Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171353; x=1750776153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzIXP1ycrxCwpqJ0rvCcPdawBbbWpEqHaCxqb+yy90M=;
        b=Qnjc3jT/wW/ffVErgWiJpp2vGj/Gvl5z5DXxP0ntUhWNZ7Vt7H0dtfbg8B6MZC26FU
         tpO6zfxJ8taXJD2UT4UrT4hsDnqB/4sHEGoepMsVjOSKgT3niKQUyOG1mV4Ut9Ao3JZg
         3pSY6386Y2xaDX++gbrEbEVln+Bhju+8orJVjfAaQfUJhdbsQYMAEp9lQ4qKB7YOk/u6
         gz0dRN6HH1f+z8yukEA0i5lWY+cFRJC3DaKuXOFhsF3qmWAxaFR8lV+CzD4lhzhFdAA+
         kfPkUHT0eVWCJF05/Hx8wNA2d7A6AHn8EulPFsrpnAmOtlU4ZMkzissjvSf0qjgaUITW
         NEbw==
X-Forwarded-Encrypted: i=1; AJvYcCU6jD3YENIhngIRsjQIUa3/IcBwVt9Bv6yqDjYAdA4Kd0CmCuIS6mnxzNWs+9jxh2aPIoest8uMEYE5Kv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRU02PBT5PY2KuR1PcWmphdqQ5xRcMU94iv/pS02XCb4n9cnBJ
	4bdehSgXOeyrB8FDy4MQTegiXXhH2HjbvAMQncwkTsXgGZCgdqoxXLGyIG8K1pEe/w==
X-Gm-Gg: ASbGncugFDLqdA3WrN2p8hT76ISs+ErkapRNyY/Jcb4usqWIzggI0wR0Zeo8uA08+22
	FHUhT55av7AjCbK88NHJWkSeEnWL0ioujYK9eWw7F7HVodqGSeOv8UYHQ6SRLjxNVmd9dWQLRK6
	g3Oa59pmn/S3pGRxv4XvqsBWmbjZNdulcJ67vywWmNXWXFWlRjVk0DZ19ILAVMNB6VXCl8BXGKw
	zkOjXTgtiGGHGELCDE7tO+aEVxMirvB4RfTmLdrGIRcD01nl3dwqqjotbmPo/+U8V/jTgyv21ZF
	wGtbpEulCAJq9oBt9IBeRXxFnOwlBKH68T7+UGxw8L2euWl2bVcbKJg1saimDpIqmG057D8Cp7v
	ztWqaAZFsqhUPN3KVQfyvcZ45ntEWJQh4RfdxGeZ3YQ==
X-Google-Smtp-Source: AGHT+IGDdZamuUtegaqRzq6f6YTXv/XwbBpEBszibH6S83g9q8LYSRxOGewlvA2AvUElv4QXpy7yqQ==
X-Received: by 2002:a05:6512:159d:b0:553:3665:366d with SMTP id 2adb3069b0e04-553b6ee2b81mr3316711e87.21.1750171353230;
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 14:42:22 +0000
Subject: [PATCH v7 1/5] media: uvcvideo: Do not mark valid metadata as
 invalid
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-uvc-meta-v7-1-9c50623e2286@chromium.org>
References: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
In-Reply-To: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

Currently, the driver performs a length check of the metadata buffer
before the actual metadata size is known and before the metadata is
decided to be copied. This results in valid metadata buffers being
incorrectly marked as invalid.

Move the length check to occur after the metadata size is determined and
is decided to be copied.

Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 11769a1832d2ba9b3f9a50bcb10b0c4cdff71f09..2e377e7b9e81599aca19b800a171cc16a09c1e8a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1442,12 +1442,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
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
 
@@ -1468,6 +1462,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
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
2.50.0.rc2.692.g299adb8693-goog

