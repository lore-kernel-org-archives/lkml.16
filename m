Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C532B2066CB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583774; cv=none; b=h929cUpBZNH6jwqk+AjnvWHX/DqN1MtZdqvhT7IVi0L4YnJ8pm+jtj3CwyCK47xZCY3r40AzppLU/g/kgFOaWxvWyKs1ACul+vH7YUqjkYQ60JMZ/I9D2k25ZBGFo/3eZ/3dGen0yRoMwQG1drPDi5HY5LsQJLG2HaOUJZ0mLss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583774; c=relaxed/simple;
	bh=6OqJ4t4D9TpNI+/c8tdRJ8rTXZIpervnpprgIzahFh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zi6HORpJ1zy1BGrgV8N4aHNHxjZfiR00M0yXcPkOPRwwcnItRmUANw1ON0pqE2gXamzXPWMg1zrb82LkyNXQ+c6DhCZnNDmveQlO8NLb6/e3hBcVadxdq/7vkDLhXJIyOrwwxWX5K65DHzf1N3xygb8sRESep1nfABpGnshtQBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bUoD26cB; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bUoD26cB"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85c436db302so2302219241.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583772; x=1739188572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIX2uAxqRPBLuXs0GvusMBked4RKndtatnuu6L3lKtc=;
        b=bUoD26cBGAs0PdMdYSqs3E3s7TseZOvqBi57iK7klaZ63m6ZDOfgoog0EIM2oLmUmE
         +GKP7deWY3Yp6Gs+dmIaD/5jM8EsgpwPoyuPWX0yIgykMWxpaao1S7VaZiLgPUVcDszG
         tS+vhNV56/HG6aEOv0YrwSzfrauXXsLaHaP9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583772; x=1739188572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIX2uAxqRPBLuXs0GvusMBked4RKndtatnuu6L3lKtc=;
        b=uzb6mYHCPxsG//NI5ez8N57KVF9YfLizqMZkWF1OlTbVK/VLjTW5aLj9hyv8ndHlnt
         JDQkgtxKRoSmeM+1YHbY25vc0kUO/5WCv4UQY6uHOa5BqKhjvcWCjAtk5ddWJv4eoRMl
         rnPm8jE8LX4SYANkLIOU1MZuRGfAUcT5bIYLMwxAXw34v5O9aJe0vYR5ApSRARkgeK1i
         vpokpIzNLkQcyRM63AbUEdwqVmVdO2s8hCXVMowRXhXjmjgl1Kkr4Mx7WgILN7O1GCEi
         ip6PkNHzRDdvDM4zb4i4iG2o0+z/NrvvCWLNSMYc5x+a/67wxc/5fzjECyNlrIRUbSsB
         7TRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU60xn4sz0kbjs6qTFsaBvON1N0QYJn7Jyth8b/bzf2aMVOY/CqMurSF4SlaFoBVlqe2XOvJuSKoMQsHSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzLfiiGu6rydkY0qWqh1QcGA5k+4ENBhZweq7xFAkQ899kwRjp
	VMnLEbgqRR/N5yVbAjYQJalFHHHCYF/xdVtsCkA7NtqdxAZe8ulUJn7wI+8iag==
X-Gm-Gg: ASbGncuM/dg85GdXks+KH2PXX3eVUuBu5ROGxWCRbXILAbW1vCzhulmwD2FNc2W4PJG
	h5D6itknNO7R4c92ZMbp0iX6VSyfbAKjmH6H45rWbaOw8v1upPCv+x+N7WqbXi4/k93a1elaBqQ
	8AHn3aztjTyzSZ9kAfSpxoGher/6P0jJglOwNxLnJYoVzV7IRA4RMnmTeTQSgH11CwdE2sMJl8R
	mHkYYbDhmwX+iFfjXI4Rhnqm2OrqsuG44w47z2CegO6E6JxlUTHD/MbBCfLFShUkkd8/FaVG2gv
	yhSdnd0MNh87U/oqKsPnE2TQZBC8ia9+fzy48Gmy/K3JT1eOlemkMq6uPJpFzXfyEQ==
X-Google-Smtp-Source: AGHT+IH2ZsZ+lbBQnlfcNNHd5u82CT5JuG2EshCnjTuVYj98ALBGeh6RaE9Vvonn6P/Yd42u1O28Fg==
X-Received: by 2002:a05:6102:94f:b0:4af:f809:5162 with SMTP id ada2fe7eead31-4b9b7077f33mr9674340137.3.1738583771399;
        Mon, 03 Feb 2025 03:56:11 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:10 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:50 +0000
Subject: [PATCH v17 14/17] media: uvcvideo: Introduce uvc_mapping_v4l2_size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-14-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

Centralize the calculation for the v4l2_size of a mapping.

Reviewed-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d50137d19561..17a7ce525f71 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1471,6 +1471,14 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 	return 0;
 }
 
+static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mapping)
+{
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return DIV_ROUND_UP(mapping->size, 8);
+
+	return sizeof(s32);
+}
+
 static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 				 struct uvc_control *ctrl,
 				 struct uvc_control_mapping *mapping,
@@ -1512,7 +1520,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 	}
 
-	v4l2_ctrl->elem_size = sizeof(s32);
+	v4l2_ctrl->elem_size = uvc_mapping_v4l2_size(mapping);
 	v4l2_ctrl->elems = 1;
 
 	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
@@ -2144,7 +2152,7 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
-	size = DIV_ROUND_UP(mapping->size, 8);
+	size = uvc_mapping_v4l2_size(mapping);
 	if (xctrl->size < size) {
 		xctrl->size = size;
 		return -ENOSPC;
@@ -2327,9 +2335,8 @@ static int uvc_mapping_set_xctrl_compound(struct uvc_control *ctrl,
 					  struct v4l2_ext_control *xctrl)
 {
 	u8 *data __free(kfree) = NULL;
-	size_t size;
+	size_t size = uvc_mapping_v4l2_size(mapping);
 
-	size = DIV_ROUND_UP(mapping->size, 8);
 	if (xctrl->size != size)
 		return -EINVAL;
 

-- 
2.48.1.362.g079036d154-goog

