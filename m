Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CE32797A3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145987; cv=none; b=ArP2Cx6HwOTxnt4aQ2IIUZA3qavB5xtCbAyy/gF1clCeBRE4RQLC350gHWVlofRZykThHESwMaTUMt8+tLFbvjyPnyZxfxvQlVZQtqBNNTCLLIZacq7zkaa5yZ2O0y/PMUIaDXmtr54HGsnYGWMZBlT/E5E9IAflFJJLpXvz1/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145987; c=relaxed/simple;
	bh=tewb45+dzAe3tLBQsQaB+O4zKZphuKqtE9IM4Y6OX9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukBX1//XAVUy3Y6fgUdHtAyJ2HCYtgAd/mgpvXhvCiAvzU9ijfYr92E1A/jJ3NIfK0sujwcpnPCO45u8dtIrOPtXPLD5O4BpcYZsNg4g0ehhKLTLCJ0xiBBkc9KZqTMDjoCGq7rbYv74dn8cXiPdYaswBiR7Vrp4SuWUf6JTxu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZVkCRHEm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZVkCRHEm"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-551ed563740so1575902e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145983; x=1749750783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2bzjHeaOe4XJQH7wCz0q9lsz5fFHI+NR6J/UEFEZdQ=;
        b=ZVkCRHEmBSMwAVs2r4H6mCqw7kB5h/HMviCkeWJwBrW4ZC8SnUK2Ug2FJB9zOV/PRa
         3yprm3m92Yf3jKNQHX2hv+vxVW36LQN/Qx2gkIo6Xf8evy9FIF6EVPgBXSp+IZObtOSz
         OWYhDVEBzWScLF1rid461YU5MTRNttPiSBucI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145983; x=1749750783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2bzjHeaOe4XJQH7wCz0q9lsz5fFHI+NR6J/UEFEZdQ=;
        b=rnlq8t21T7qP1CsBc95lfOFhsSAWd9xRdOMfSDbqq+ZFFb1ickDNKxHbEgTpVehD9i
         VhJi1S8BYu8E/5cbLv4rr1vVi8GCrW6C6GX68X8RWvaRv0TSF0/L6hUKvPvG8DOQJAFW
         0W7i9p0Lq3ThCkRhNrUYjmQcuTer0yrhC22DrT6Ki/VDpVuOmkQJrK0Bfdtah9/6nZZi
         8w4mGUB0zY1p2Sxg2cy31RTDqTNJL5vd8n+Vhbcvrf0282oYLHyLPp3lihYhrUoC7u4T
         BKX+r6lGDcjgEtCbcYRwqlMnsKRfI5+59mKqOZnY2Ghi+ByPL19MbCeB+9JXVl1ZjEkC
         5iVg==
X-Forwarded-Encrypted: i=1; AJvYcCVFjzL9jm3bPE/uDCuVgKguyUuoSqIxwrCClxVciPOqYZRUP9UiEqLOlPredR8L/7tYTNGBsdwVmdg3ArA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkykGa6lsuIo8CZ9v0eYBS5ql6b/NPoDU/dTE3o4Bmgbuhl5EH
	TvMarRjRJilRZWooS/nhS2S4RoJT1pN3rLcYbyDpyA3GLDhD7ixS68X5e4XIo06ltSiVnw/KZq2
	DoM8=
X-Gm-Gg: ASbGncsbYddLVmRzyhIxVwVrT4KwPd1gHsFPPd8vqvncPddBBzfsyoQCjh9HUWARpiR
	cnLjAdtGRQPUmxdczQe1dG7onxW6SWImdnDJWU9dPE9laTXWDCW2+0luTfc/wwnBeP65qlGLwu7
	CvguEOSEB5c/9qM3yBzgsZJuATqK9GhqvqfvUR0YOcUflJ1yXhhjsFfX9o75ojYsDdlhpKO4HQQ
	3V+9nXFut/HmW9Fc1IPjW95cMkm9enYfEOTno2XiH12mL6A4BQ+2ElHFxT/NI/4kWu9d6Nokjk/
	kEvv+K90dWRNPBx9ZIsk7K+NRyfM455jJsv0P2Xktbx5mOPwzbTbQmoFuAHg7PbU65ZRiW2ZPFx
	BIJwl2EXXXqkgXaj21NVuWIJB4Q==
X-Google-Smtp-Source: AGHT+IGl548xQa/vsHY27xBCLqMA/WtFSSEsFfeQt2Dzb0VNl43ck1yHu+ccC0nfMKcjxfgnvusB5Q==
X-Received: by 2002:a05:6512:1248:b0:553:2cc1:2bb4 with SMTP id 2adb3069b0e04-55366bd49dcmr18752e87.12.1749145983043;
        Thu, 05 Jun 2025 10:53:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:54 +0000
Subject: [PATCH v2 01/12] media: uvcvideo: Always set default_value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-1-5710f9d030aa@chromium.org>
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

If the control does not support GET_DEF, the field default_value will be
left uninitialized during queryctrl.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c526421943bb9841fb53dc5f8e9f93f02..47e8ccc39234d1769384b55539a21df07f3d57c7 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1497,6 +1497,8 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
 		v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
 				UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
+	} else {
+		v4l2_ctrl->default_value = 0;
 	}
 
 	switch (mapping->v4l2_type) {

-- 
2.50.0.rc0.642.g800a2b2222-goog

