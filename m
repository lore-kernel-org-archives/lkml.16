Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966F3207A0F
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583781; cv=none; b=XaQkIHdnDoAycxWNzClbDJrA1MYEyzgJp2TZASqChXy5pxfudRx1L+OzkgQIiB4JUQIW2va50i7TZAhipUbJl2m335ERvj+PX0YqmADKtgD8zU2H1NtxoiiRknZnh9M5lsYYBBJfvwo1mkNBy/MkCbcM6T7s+TPCOP/FsWhjbrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583781; c=relaxed/simple;
	bh=OJubSk7TBSyNMMe1bnRy1n45CoTOzWlCunlZISOCiKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDTH6KOg2blMsAIC18MaCv0ilO1jcGxHCWhwn4Tab/N1ROsrUQAzq5uznUTHFTXOBQTjV4dRwR/S2kDQAtRGEO+dr/nGmTygAfl9tiQFzVXZZrC+Grha7wH+kOrA47KZ8m01NVH/Wz3EkE4T/ZDCG7Vnomvl4eNbVt/6RoUeK2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UNm8DJSv; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UNm8DJSv"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-860f0e91121so2969707241.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583778; x=1739188578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuXYgfblqPgsOSSTy3xM8LEdA1bnZ/Knt94pd6Qxl2k=;
        b=UNm8DJSvAwV1YZLso4/BO616WQkSne5DMISts/AO24AhBMSwore6uPW16miXgBUEl1
         uzOgqOHHbPE/u8qiIwbNJUBPzd+/eUOxrOGPUkdHJI0IekrL7GlZ5RIsq3GFAEN/S0DL
         ATWDJBDc378o/bPk6g0j/hhs9T69KVhgxGvm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583778; x=1739188578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuXYgfblqPgsOSSTy3xM8LEdA1bnZ/Knt94pd6Qxl2k=;
        b=OFz2vfMVgwkfAGa4BE5wUqdThbnFOUNQTWTFnnGxJmvAbCZQg28WZr1NAq44je3KWa
         RrYLTPzodhkS928XMONBFTaoJSjzb2W+KPrkMxz78195IF8Ei14wMObUZw8EaQIALUlZ
         7+4XbjKiICzGQVHUo7k6/zH6HCAswFNrfy5gyezx7ugKuV/PmeRR6G5KI5R+o3KV+eX6
         Giyat/lmu63j2W2KpDqqY0wGYwnSQKpTvXq1HolkPx0zJ+Phys3KExbuzHF4Oe39vkA8
         pBeCxkYfIhZkyBN77f7JFFvue9ZfEzio4wjvANgzXQZFnMno3LgFFoiPFLL4Xa6pv1Za
         r7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcL1skabmm9ckioKLzlCNjb07QdyejWOlMQptBh/+PNeqmJnF6t64bRKNSdZLNlse14BKbvYSeQ1/RrpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpG0/NarT3qH3Tn5oFdIfci5qliQJhOwUjrMFFElF7eQM+aSlj
	e+p17ixFq5uCIV8XY97cC909QLwXsZcgsZ61x5N8USw+GrJjqR5HuhmaFz8ZmQ==
X-Gm-Gg: ASbGnctpo0ZcA33q/NboYOwKOloCN3IoPZC2p54ypWmBOfYbYEfwJohjNY5T5BW87Sz
	WYLvMpWc7pjypkqHqYDOsY+1A2XKNU5Uqe9NwUbPkbCk396s/9EKjv/PSsXNQp6jcG30OkevbwJ
	CXQqsfneHmGVJYgqVFKtgrgQ0S2gYVfdyP2oqM91FjINiIaBcn0vhWl3omtoHj8iv2byJm2Ah0c
	JcCMw++I3P/CUA0QJiPxZ1Shbp+WKykZ2ju3saO2HKRWnif0oC2NEZ/310qI7dlAP3YLmNh3e0m
	OCTC6GssHOFnBkuhfC6hS1CUkeWVfaYo9UyaRA/eJuj+7C55UmrVGv2l5IVXpA9lmg==
X-Google-Smtp-Source: AGHT+IGpzZPl81uNUrVjlXMRe1t+IJbzIPHk0rcvr85sHFnl0EOk+nPEyG6ptHV5XQsP7wfiiVAiUg==
X-Received: by 2002:a05:6102:1609:b0:4b2:9e5d:baf with SMTP id ada2fe7eead31-4b9b7225816mr9583015137.11.1738583778456;
        Mon, 03 Feb 2025 03:56:18 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:53 +0000
Subject: [PATCH v17 17/17] media: uvcvideo: document UVC v1.5 ROI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-17-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.13.0

From: Yunke Cao <yunkec@google.com>

Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

An example of a userspace implementing this feature can be found at:
https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../userspace-api/media/drivers/uvcvideo.rst       | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index a290f9fadae9..dbb30ad389ae 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
 	UVC_CTRL_DATA_TYPE_BOOLEAN	Boolean
 	UVC_CTRL_DATA_TYPE_ENUM		Enumeration
 	UVC_CTRL_DATA_TYPE_BITMASK	Bitmask
+	UVC_CTRL_DATA_TYPE_RECT		Rectangular area
 
 
 UVCIOC_CTRL_QUERY - Query a UVC XU control
@@ -255,3 +256,66 @@ Argument: struct uvc_xu_control_query
 	__u8	query		Request code to send to the device
 	__u16	size		Control data size (in bytes)
 	__u8	*data		Control value
+
+
+Driver-specific V4L2 controls
+-----------------------------
+
+The uvcvideo driver implements the following UVC-specific controls:
+
+``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
+	This control determines the region of interest (ROI). ROI is a
+	rectangular area represented by a struct :c:type:`v4l2_rect`. The
+	rectangle is in global sensor coordinates using pixel units. It is
+	independent of the field of view, not impacted by any cropping or
+	scaling.
+
+	Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query
+	the range of rectangle sizes.
+
+	Setting a ROI allows the camera to optimize the capture for the region.
+	The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control determines
+	the detailed behavior.
+
+	An example of use of this control, can be found in the:
+	`Chrome OS USB camera HAL.
+	<https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/>`
+
+
+``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
+	This determines which, if any, on-board features should track to the
+	Region of Interest specified by the current value of
+	``V4L2_CID_UVD__REGION_OF_INTEREST_RECT``.
+
+	Max value is a mask indicating all supported Auto Controls.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE``
+      - Setting this bit causes automatic exposure to track the region of
+	interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS``
+      - Setting this bit causes automatic iris to track the region of interest
+        instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
+      - Setting this bit causes automatic white balance to track the region
+	of interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS``
+      - Setting this bit causes automatic focus adjustment to track the region
+        of interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT``
+      - Setting this bit causes automatic face detection to track the region of
+        interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
+      - Setting this bit enables automatic face detection and tracking. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the driver.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
+      - Setting this bit enables automatic image stabilization. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the driver.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
+      - Setting this bit enables automatically capture the specified region
+        with higher quality if possible.

-- 
2.48.1.362.g079036d154-goog

