Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD77C1A254E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685150; cv=none; b=JIM2z6iga3h84dd5yUNGgNpB4RlXKwBHD//zDy8FWnHak0Xtheu6HM7w0VwS6vqiFoTRnVQHtxyKedJYNMGUrR2fOk17tROEFvONZAd85pbYlHBGkMNryaavuX+hajLYxPXHcC9pvTjorNaAPu8sKtMrgnT+iB421HNn3xrDL5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685150; c=relaxed/simple;
	bh=E8cD2LqBEwH80LYlUEP5hJnICxHO/0q+CzBvyHB7G2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qfKuqd0mLxQCIN2Ia5eHm3MzL/2rZ2UIwc0oQxdcagMo0zwv/5kIjccdjjZCkg9KYHljpqvW3Tor4jmSjvSMB9fABO8PxmrhDJpk0hnoaXYh6AwOsew8sp0gvT2o5sYpk6s2GQTlTCm/BjpU+BhTIntuaICgb85QDdJgnvRLIOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l2nvZxwQ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l2nvZxwQ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54954fa61c9so1034283e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743685147; x=1744289947; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=easAOJR60mQO+32dXUcDA5ZSVcUQN6ctW/HM++zF4Bc=;
        b=l2nvZxwQyjpydWl+FUDtP/tKTxfOE2eSagVydaMdlzbbEAQlP4joaZVXGmflSaAY0x
         +DA+T3w6wkg4xP/SpiXFnFDZEjNSxiNRzMjeGssnQSNzd0MXAZQqzQODymyl40ANdVCs
         ZO70pu+pAUfbebU1XLkTnbGM7RizwsH7Bj4BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743685147; x=1744289947;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=easAOJR60mQO+32dXUcDA5ZSVcUQN6ctW/HM++zF4Bc=;
        b=GMqal5eM5X31tSIckRu3N2xjNdtlblwyQ2AXKiQLDiqajI2ND7SNc907FhO8rUyyXP
         loGTEYaBx9mSqjaF9hLDKAhzu4qHJBKgobpGVehNYIWyFVc25sx3I3lP1jJ0cqoB8vSG
         XT1xbjoe0y3t25hXlQ78701l3PuaoXzkhOyeP5AyuSzwpG8uGKK+0AN3cB0vP6p3DRGA
         wfKMPI5L20YSW7PLPwDjM3cSKImuaVmKBHN7nNeiBYQkCzNVDrhHqe8Bg3gtr22W2/UZ
         wkd7A4cCnspVr2AJ836M2RqqNwJ58PFZWZ/6UpTtYuv0jp6FLDpvdIoB7fBrVXG7yObZ
         lY0A==
X-Forwarded-Encrypted: i=1; AJvYcCXtllFyk05fDr2CHBfYudoyIBm/DCtiM0SJvOQrLT8HQHaAr9TgR+/HHMz+HKn+FZ327e2X2nw3IQspTc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YziOWtGVtnpZ8U1fFvJp81jOUCVg9GyqnMAXHomoRo3pfy9Ev1k
	qGuNXP/HZ9HJEs61AqzOTOyuRYtb02lsokyRmdlFWoW4Z+AtcB07LnUZCnwhOt3K+GJ7/PkZUq4
	=
X-Gm-Gg: ASbGnctLOg9xBcHsjkP0HtKoezMJ46f4NzX2IpjtMRLMilTOZvqp8pGNVkzfAr6Z5tP
	Cn0j/Z0mqQ21rCe4QXOBOIl1zN9YWo1jsZ3xdohgDwV6kTeb48TDXa+yP6ZllNrzP0rwo7T1dyE
	Drv9AZjAMddSO8dULON5O5Eiuy3KPDumx+m33MXhHY0q1kZPnA2BI4jvwcIhTBWamVE5x3sw8Jg
	MRDK1peNHUSU06QAWd8B5vKCFOe2trxabpbf1C9TKYUGP6m/D0CXUWD13oV8peMk00ZxFi/5ujo
	0NkXQyxgfxbeQ9j/q5Pct7OdMrrofOx0lIqqrH4H2vwLlQVQLacIDLoJQz4Mk3RPrvpexOqhKj9
	5ZGTpLwC3jKkVDODkLZuzTynH
X-Google-Smtp-Source: AGHT+IH6yktCrWOi+5Cwvwc4g3sOE/Ra9/trQ9/qaVk01UzJ/4ZE4d15vH6NuU3GPOugpNMAm3bWsQ==
X-Received: by 2002:a05:6512:1088:b0:545:8c5:44cb with SMTP id 2adb3069b0e04-54c1d8ab9c3mr780443e87.31.1743685146593;
        Thu, 03 Apr 2025 05:59:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5c1a93sm151689e87.68.2025.04.03.05.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:59:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 12:59:02 +0000
Subject: [PATCH v7] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-eaccess-v7-1-033d0c3d6368@chromium.org>
X-B4-Tracking: v=1; b=H4sIABWG7mcC/1XMTQ6CMBBA4auQWTumP7QQV9zDuChlSmcBmFYaE
 8LdbdwYl9/ivQMyJaYMt+aARIUzb2tFd2nAR7fOhDxVgxLKiFZo3ItHct5TztgHba2VRvZaQC2
 eiQK/v7f7ozqkbcFXTOR+Dy3F36NYlDiG1lgVOu/GafCxZrwv1y3NcJ4f1e+M/KMAAAA=
X-Change-ID: 20250403-uvc-eaccess-8f3666151830
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
step and flags of the control. For some of the controls, this involves
querying the actual hardware.

Some non-compliant cameras produce errors when we query them. These
error can be triggered every time, sometimes, or when other controls do
not have the "right value". Right now, we populate that error to userspace.
When an error happens, the v4l2 framework does not copy the v4l2_queryctrl
struct to userspace. Also, userspace apps are not ready to handle any
other error than -EINVAL.

One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
that usecase, a non-compliant control will make it almost impossible to
enumerate all controls of the device.

A control with an invalid max/min/step/flags is better than non being
able to enumerate the rest of the controls.

This patch:
- Retries for an extra attempt to read the control, to avoid spurious
  errors. More attempts do not seem to produce better results in the
  tested hardware.
- Makes VIDIOC_QUERYCTRL return 0 in all the error cases different than
  -EINVAL.
- Introduces a warning in dmesg so we can have a trace of what has happened
  and sets the V4L2_CTRL_FLAG_DISABLED.
- Makes sure we keep returning V4L2_CTRL_FLAG_DISABLED for all the next
  attempts to query that control (other operations have the same
  functionality as now).

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hi 2*Hans and Laurent!

I came around a device that was listing just a couple of controls when
it should be listing much more.

Some debugging later I found that the device was returning -EIO when
all the focal controls were read.

Lots of good arguments in favor/against this patch in the v1. Please
check!

Without this patch:
$ v4l2-ctl --list-ctrls
User Controls

                     brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
                       contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
                     saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
                            hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
        white_balance_automatic 0x0098090c (bool)   : default=1 value=1
                          gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
           power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
      white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive

With this patch:
$ v4l2-ctl --list-ctrls

User Controls

                     brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
                       contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
                     saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
                            hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
        white_balance_automatic 0x0098090c (bool)   : default=1 value=1
                          gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
           power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
      white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive
                      sharpness 0x0098091b (int)    : min=0 max=7 step=1 default=3 value=3
         backlight_compensation 0x0098091c (int)    : min=0 max=2 step=1 default=1 value=1
[   32.777643] usb 3-6: UVC non compliance: permanently disabling control 98091b (Sharpness), due to error -5

Camera Controls

                  auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
         exposure_time_absolute 0x009a0902 (int)    : min=2 max=1250 step=1 default=156 value=156 flags=inactive
     exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
                        privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only
   region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
  region_of_interest_auto_ctrls 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1

Emulating error with:
+       if (cs == UVC_PU_SHARPNESS_CONTROL && query == UVC_GET_MAX) {
+               printk(KERN_ERR "%s:%d %s\n", __FILE__, __LINE__, __func__);
+               return -EIO;
+       }
In uvc_query_ctrl()
---
Changes in v7:
- Only retry on -EIO (Thanks Hans).
- Add comment for retry (Thanks Hans).
- Rebase patch
- Check master_map->disabled before reading the master control.
- Link to v6: https://lore.kernel.org/r/20250310-uvc-eaccess-v6-1-bf4562f7cabd@chromium.org

Changes in v6:
- Keep returning V4L2_CTRL_FLAG_DISABLED in future control queries.
- Link to v5: https://lore.kernel.org/r/20250224-uvc-eaccess-v5-1-690d73bcef28@chromium.org

Changes in v5:
- Explain the retry in the commit message (Thanks Laurent).
- Link to v4: https://lore.kernel.org/r/20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org

Changes in v4:
- Display control name (Thanks Hans)
- Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org

Changes in v3:
- Add a retry mechanism during error.
- Set V4L2_CTRL_FLAG_DISABLED flag.
- Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org

Changes in v2:
- Never return error, even if we are not enumerating the controls
- Improve commit message.
- Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
---
 drivers/media/usb/uvc/uvc_ctrl.c | 53 ++++++++++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h |  2 ++
 2 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index cbf19aa1d82374a08cf79b6a6787fa348b83523a..b41fed364d54aefd7da72c47197cf9d9e3c1b176 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1483,14 +1483,28 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 	return ~0;
 }
 
+/*
+ * Maximum retry count to avoid spurious errors with controls. Increase this
+ * value does no seem to produce better results in the tested hardware.
+ */
+#define MAX_QUERY_RETRIES 2
+
 static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 				      struct uvc_control *ctrl,
 				      struct uvc_control_mapping *mapping,
 				      struct v4l2_query_ext_ctrl *v4l2_ctrl)
 {
 	if (!ctrl->cached) {
-		int ret = uvc_ctrl_populate_cache(chain, ctrl);
-		if (ret < 0)
+		unsigned int retries;
+		int ret;
+
+		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
+			ret = uvc_ctrl_populate_cache(chain, ctrl);
+			if (ret != -EIO)
+				break;
+		}
+
+		if (ret)
 			return ret;
 	}
 
@@ -1567,6 +1581,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 {
 	struct uvc_control_mapping *master_map = NULL;
 	struct uvc_control *master_ctrl = NULL;
+	int ret;
 
 	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
 	v4l2_ctrl->id = mapping->id;
@@ -1587,18 +1602,29 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		__uvc_find_control(ctrl->entity, mapping->master_id,
 				   &master_map, &master_ctrl, 0, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
+		unsigned int retries;
 		s32 val;
 		int ret;
 
 		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
 			return -EIO;
 
-		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
-		if (ret < 0)
-			return ret;
+		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
+			ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
+					     &val);
+			if (ret != -EIO)
+				break;
+		}
 
-		if (val != mapping->master_manual)
-			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+		if (ret < 0) {
+			dev_warn_ratelimited(&chain->dev->udev->dev,
+					     "UVC non compliance: Error %d querying master control %x (%s)\n",
+					     ret, master_map->id,
+					     uvc_map_get_name(master_map));
+		} else {
+			if (val != mapping->master_manual)
+				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+		}
 	}
 
 	v4l2_ctrl->elem_size = uvc_mapping_v4l2_size(mapping);
@@ -1613,7 +1639,18 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		return 0;
 	}
 
-	return __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
+	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
+	if (ret && !mapping->disabled) {
+		dev_warn(&chain->dev->udev->dev,
+			 "UVC non compliance: permanently disabling control %x (%s), due to error %d\n",
+			 mapping->id, uvc_map_get_name(mapping), ret);
+		mapping->disabled = true;
+	}
+
+	if (mapping->disabled)
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
+
+	return 0;
 }
 
 int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..8e3753896d42baddcc2192057e8c5786ddd79fa8 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -134,6 +134,8 @@ struct uvc_control_mapping {
 	s32 master_manual;
 	u32 slave_ids[2];
 
+	bool disabled;
+
 	const struct uvc_control_mapping *(*filter_mapping)
 				(struct uvc_video_chain *chain,
 				struct uvc_control *ctrl);

---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250403-uvc-eaccess-8f3666151830

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

