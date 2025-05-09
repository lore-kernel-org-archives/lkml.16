Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8145623E32D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815060; cv=none; b=MB1KYXeaZtVmGNzhQc2ZrCTvaXtNVEbYtUg3fTkTfZXd02CxYZZ4mgXiX0ozs6qq8vYRCiFf2yzKcrUPc+qcJIlYhnemE6BmdX/l6J6mUmh2r5kiCyK/SZyCckg0MLxQsY7o+QoUrVO/hJnRl5/Dy4SioMS4NDkGPxB/Ad534Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815060; c=relaxed/simple;
	bh=dmEDUd2MAksdGuyMaIYfV/evhD42SfWsITizphcH7IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S6h29G2nc3v8b5jHBarlr6qRTpzpuFLZBwYKRqnLugD4+olFUoYfWge8lbbFBiAFLj3JPt99iTNcW3jiq22m01I4A6cDz4HhmEOb1CUd8o9bRvT7a2tn+ewLBvlfwvK4wgko55ObwdmtqZV7wQn9V2YXoawuQnoyVgJXIcRvhcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A92b7SEp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A92b7SEp"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so3037913e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746815056; x=1747419856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXSgPFuFz+fNGABAM7JsWHcPwhMV/Um0ycmbxkQJ5u4=;
        b=A92b7SEp3f9UEn/ns0ATB5v6WT776x7JpWxO0uM7mD8v0I4kmikHIk9W/IAk979AEz
         ra88l0JKuMjg6WLgDEl7CL0vFypiPu+lHKLk4gAhznOJMnajNedFAIhdOw5jmQHnLdmL
         v9XLYkaFZybawLuh7X+BUG1dSxi+S7qz6GayM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815056; x=1747419856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXSgPFuFz+fNGABAM7JsWHcPwhMV/Um0ycmbxkQJ5u4=;
        b=AkDVGEoJ81Aj0Z0FpiuGaSDY/dIx1cG4NDoZf8gf1xJ1K92c0d8ggXI48BMDhm+zhy
         vG5Fx0Kei8AKeun1DoWG2m+W+IsfaIVywJCdiod4O/s5XqzCo3JFfQFnFPvgexHfQFsO
         +hdc6SoynsgJJkp2ZqzzOk1E/6b+/s3qoTTtwfRLQCeyZJORz0y9LH2EGvoKXlZB3cPD
         tSi6tCLsjf6yGKUWJnJBp550JY+v4DoOWm2MKv2Xvu9vxktjG8U8XTqoaXfnJx9BLfo4
         /OtlthcSAZXoG7QpfIbYggJ/SIyPPFNwbHXOvbTJKTFZfT4YzD2XmET/fq8h4Gb8aoIT
         lNZA==
X-Forwarded-Encrypted: i=1; AJvYcCUhzn/Kf2g5kETM3H0w6+awAO8baFtAJaXf+5xTIfh2Wcgpc1y04tR/rR0zSgHjxA3ycLJHVr1no6Wysy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxMG1dTVzkyVex0GqmnxdR5V5oICAGzdVSILuBx0tooehGN0Ao
	oGybcw/Am1gb1c8G/B20hQb39755SDOaby2CSSuP7lBHsOc+IVz6xkY7e3eXeA==
X-Gm-Gg: ASbGncvLBAPns+MFLrN6+KNl6cl6eIyJz7FJ5qT5+HfjnksTxKA+ZY7/kZZzPfN+ucN
	c1GPSUIH6woecTdVv+hhZwzoMwarsE3kuRYrPcsnSq23Dshlw9c7xoWY3ZKfdvJ6LaJ+NY6qACY
	Om7I5Cdu5lxalvCXVUsAmk1kxA93cx06kTGsXiciJYBRwu6wajgyJh++5jypRO4Mt5tvr3Xq5ya
	EpUL1bht+PGkXdVOHJAPZl4NIn2xXbsrkFn56I/xbP2FLRXCGw/wTG3OV3xURN59OO3II6MAStm
	u0El56AYg4R+y7FEem8ud4hhEpmPW6r4XLdVWJIczsv6tfAaDkUf+UMThJBMFVq8PmQhk5RRhfT
	08hZs+qzh1iHwpl7MicIrvhyO/FUGjDc=
X-Google-Smtp-Source: AGHT+IG1edMScKGbHzfRhfZyEuDSvbr+Wl5F6wdkbHLnOVyRsXgnr8JzOVlmPHkNqFi2Fch4VmkWaA==
X-Received: by 2002:a05:6512:3e01:b0:54e:85bc:d150 with SMTP id 2adb3069b0e04-54fc67ec33amr1483266e87.53.1746815056482;
        Fri, 09 May 2025 11:24:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bc9sm349410e87.147.2025.05.09.11.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:24:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 09 May 2025 18:24:16 +0000
Subject: [PATCH 4/4] media: uvcvideo: Populate all errors in uvc_probe()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-uvc-followup-v1-4-73bcde30d2b5@chromium.org>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
In-Reply-To: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Now we are replacing most of the error codes with -ENODEV.
Instead, Populate the error code from the functions called by
uvc_probe().

Take this opportunity to replace a generic error code from
uvc_scan_device() into something more meaningful.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68cc0957762f2b67387677c22224d1..cdf4bbe582272277a6a95267e9752010adc51b6b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1866,7 +1866,7 @@ static int uvc_scan_device(struct uvc_device *dev)
 
 	if (list_empty(&dev->chains)) {
 		dev_info(&dev->udev->dev, "No valid video chain found.\n");
-		return -1;
+		return -ENODEV;
 	}
 
 	/* Add GPIO entity to the first chain. */
@@ -2239,7 +2239,6 @@ static int uvc_probe(struct usb_interface *intf,
 	/* Parse the Video Class control descriptor. */
 	ret = uvc_parse_control(dev);
 	if (ret < 0) {
-		ret = -ENODEV;
 		uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
 		goto error;
 	}
@@ -2275,22 +2274,16 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 
 	/* Scan the device for video chains. */
-	if (uvc_scan_device(dev) < 0) {
-		ret = -ENODEV;
+	if (uvc_scan_device(dev) < 0)
 		goto error;
-	}
 
 	/* Initialize controls. */
-	if (uvc_ctrl_init_device(dev) < 0) {
-		ret = -ENODEV;
+	if (uvc_ctrl_init_device(dev) < 0)
 		goto error;
-	}
 
 	/* Register video device nodes. */
-	if (uvc_register_chains(dev) < 0) {
-		ret = -ENODEV;
+	if (uvc_register_chains(dev) < 0)
 		goto error;
-	}
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	/* Register the media device node */

-- 
2.49.0.1015.ga840276032-goog

