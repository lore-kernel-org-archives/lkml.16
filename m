Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583927AC5C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145992; cv=none; b=E7potGKmvGUNsDp5Q+eUaeHcOEmhZnBq0q7d1KyijrU0RjtjXQKHwcsttScQokMklvlbMDBoJppVz5Fse+pJtOlkAHCxuP2942RuvJciQ+kgZVq6gFTmORMvwcxgoIOCPzwKZLIADmhPnHsZiCV0XEmvQ8TuEriqWF2aNyJTHPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145992; c=relaxed/simple;
	bh=1ZgSjQTaGaaFH/a8mMoBM5PvRpGKxv9Y52j0p6HXpHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyTc9vTV407MId8knaTC495ePRuP3zHoDQteWufeWi6y4jBfL+TNOiiiQTSQZjm6nCW7btD3xG2+lRnaP+SDIQT5O0Ouza11ghcXmlJsH74L96qbASqTQ/aSJoWPIWL0qSEWT9eqNeVL/jYnq/IRNllJ8mv81c1g4ADOCsDhDFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aCh43tO+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aCh43tO+"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5533302b49bso1384825e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145986; x=1749750786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITiETVL4DPlwiitJN8fQTR1CuO5aBFmT5UfjWJScKqs=;
        b=aCh43tO+ZuTamS1hd+2y1nDBrpy0Zw3gcRNZy0qbqIUkvLlXaM5nfyQiodfAYNqr22
         ALAg9iirpfeN+hRSB8RsY0joZc6hYDKzTp7kCqVEDJyAihjnnLhY0WJX/3v4VOPVdnfp
         gqoxtNoQqZ04fbfzYd5uWUCiyXGM1IQGS1n0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145986; x=1749750786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITiETVL4DPlwiitJN8fQTR1CuO5aBFmT5UfjWJScKqs=;
        b=YEJzvq7RzfQSMXNFE9sxDCm37q5oAKk5H9TGekBe0JZpvL83rDPyrnTfl4YFidlGCL
         ejGzcJ2dmNDSSuiOb4jGYlmUQ8z+QxB17f4u7GTF173cfTsx54ZA7TSyxY04wJZN0xsI
         N1crsg5mw+x3nZwHubtWTq/IykhMEv2m8u6Sair7SsBdBRru7l4NkQtmp5JdrWkDx8Fa
         N6c+nigQbpjjWFBeTf7UvqUr7CxyV2O4f1ufht+M7tqrzkNuAkMS8dKlQvRBlo/DCWRj
         eWgnt87mCLJJ9YLhWc/mslvJ4KQK3EzD49A7kQ1SnEJcLks8mghNa494R1tLSiz/iIEj
         u59Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2q4u2iSzFXwGNwiyRNwJ7jAWQ2yw6YQ44uo8Q5uKDCOiI0WsDFycE/59k2xV9DXIw0g3jxZNkc14otAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMN6MiTag2IOuudFyxNiw7a5x+pChLIvg7Jz/wSgBlRcJ23ob6
	3alq/14QRi3ES9OnCBkDCiFUtoDhJCVgn9H8aWlRW03nHPN0xjiAa661ih0DcgnlMM7QFbo7CQx
	IXsI=
X-Gm-Gg: ASbGncuDwX1UQsmDS7jGFND3d4VqUf/ZOTZBQeft8CFU3xftTC4aSXxH5JDdN6yAEo6
	heC5x0Qpt/N0WJ4F/14zMn9JzmnZJvfVGGUgtP911vJIu0z+RIwxmnTXXeUvLcxf+CBHnL0hhVR
	P6moyeiIXlaXOSDaRwn6geyRnGPlDtR27Pnl8AN498v0soXee0yTgGNmUjyF0Wgb1KML5JGBjGm
	mogmxpSmuT7hxiKXtWOut/W9nMut/NMjZTDioyD4fed9nwUxGb6wAJGIyiuKVw48vx9M0b265IH
	4oldjhUWC4HGZAjqecvvdDdEeHIsW7VfkdqD71YxA2UhCo+Pbg7CNAjPGyaPVkdX/ug1hvFADVF
	xIephjaRXqdge6s9TuGdlj0B+og==
X-Google-Smtp-Source: AGHT+IF1UcMtPah0m8jT6Ln6JdgWvGYN1lsGuqlL6zma9QAAKsKScIhOqpWLrtFSd+pn1Q20FL2yNg==
X-Received: by 2002:a05:6512:10d4:b0:553:2e4a:bb58 with SMTP id 2adb3069b0e04-55366bdcb99mr25796e87.9.1749145986344;
        Thu, 05 Jun 2025 10:53:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:53:00 +0000
Subject: [PATCH v2 07/12] media: uvcvideo: Make uvc_alloc_entity non static
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-7-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The function is useful for other compilation units.

This is just a refactor patch, no new functionality is added.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 4 ++--
 drivers/media/usb/uvc/uvcvideo.h   | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68cc0957762f2b67387677c22224d1..bcc97f71fa1703aea1119469fb32659c17d9409a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -792,8 +792,8 @@ static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
 
-static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
-		unsigned int num_pads, unsigned int extra_size)
+struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
+				    unsigned int extra_size)
 {
 	struct uvc_entity *entity;
 	unsigned int num_inputs;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b9f8eb62ba1d82ea7788cf6c10cc838a429dbc9e..dc23d8a97340dc4615d4182232d395106e6d9ed5 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -684,6 +684,8 @@ do {									\
  */
 
 struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
+struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
+				    unsigned int extra_size);
 
 /* Video buffers queue management. */
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);

-- 
2.50.0.rc0.642.g800a2b2222-goog

