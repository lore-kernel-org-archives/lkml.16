Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5392C2AB2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934451; cv=none; b=Ja5cch/U93DpFJlp42La5H1fnjvCMCCjMfBrEdY+v0B6nfwV3DmA/1BS8DLOb95PDlcSOiKvkMtlYWOonM7RPKxL2/tJpmuxMevfeqHqfV/4pqX4JNYVBDN8IAFcZPUAxIX4eyvPiYvjq/fquPz5mQRx3drjpGOw3eGBSVnaapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934451; c=relaxed/simple;
	bh=pof8yP94mdDttGxh38mnBzB+VgpR9Ua691PVjYsd7vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IOv8PGVId+ZE5Y+Zdt26/5o+w/O/a9AdaLYBYlDLHJsj7gL8esZszlCYKFlkvZsOr5n/rI9g6aw+F6xypkhw4dmTt2BhG1m7UP/cIzPpn1Fw7D3gaq1jagwiodN5nO7YytWko6txBSz20kBiV328QiafPs2/giaymFs6ZhtQjSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MqJP1k2d; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MqJP1k2d"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54996d30bfbso5748327e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745934447; x=1746539247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XSmQ7kUSeus5/Dn9M1UsGJBVKzSt+OwJlM1ExhsSwA=;
        b=MqJP1k2dMmpljq7hfyaRaNSzl2+sfX2/O59VG5ZLEYflC4gw2yrzflUxfLxXiR/aN0
         ogQOdasG9l769F8wRRausRiOjuxDdFUyae8tsZKdajzMDXaeyi/FYFQjTppRh53rjgnn
         3gO5swvnIteCJRi+oDrQG9enuq8BoJalAXG5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934447; x=1746539247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XSmQ7kUSeus5/Dn9M1UsGJBVKzSt+OwJlM1ExhsSwA=;
        b=UnTUwZ2HNM9BHBZODT9Gjzkz2koFUlGpjpAKimr6r8r8wR5GqO5yeBgOoXHX/+Szvf
         IbWjCenqfGJdwnFgu9BqMAOmJy1cHIkPvhUbpmq+GrmzkcaWJAxmf3xtpT9dBLLFk7BW
         x6ixhgGPISzfvcfv9gA2+GW/d1UlOEB9gq+N2ao/KfoC58Rk8RynEgLAc6K39BY+FGyy
         kAJiCXd11HMxX1cMqcCYCRczser3RtwfExdV58WbUKyG56pfEXbdUaNJHpxtyzTCk0QL
         d9tOkZEZckMYuLm4OLckSsVywmMqDjkCCOoWPtor/opwRO7Vbx4dpPtyss/wS+o6hDkJ
         u5Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVsvGCQdtCdIe1QqE1hk3Z7nDAsFRewrAnUzh/oibJhLMTrNoxoXsui8029+GONGLCMkp8W3X1J14WK95c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvGXyjzxcLYcQDTDCbXo4Gj8cj6xQgdn849Iy0iBJhzVZP3eNs
	5rYdwY59TVMtgJRjzF3BrWmg4nv79PNllzrxJGGe5YWQmDCATAS1d9+JG8t0Rw==
X-Gm-Gg: ASbGnct/r7LIMUYvGew5zoLR4OAEQx8hr/gm3uqm6LE+zfB7wVTUVHzikf1FJMJe/AH
	Wy9APQF79Nha9PXQoTLoa42FgM7uR9IIqbJf/1Os6C/nHHr/xPjuUtMpxIXhduRoMmEHUfag8fb
	8gdefH0JA0opIgFqJl7cdVy5DnMDks8vcgQobS6IMyF2wtnBEHBsH5nSOhPQMaFeGqnWg0cBNdQ
	+bZI1Nd0Ie/J/FgOmkhE4dNm3fj5PsBaqKYZL/u/Bpqd7Y++rIVeXIKXOmkMQ1TyW/2Z50AQ7eJ
	K1aBzHFCvJBIhdWhAbfOZr+OG7jefEX2xiitxNESFhozPby8qEQEl00WmOMdtAmiCdmXNBxYuGQ
	quhIuqFH+51CYUXsU12D7
X-Google-Smtp-Source: AGHT+IFYLnU/7fMeN0Gg9PDxITl1rxZMa5y1OVRvGbZ9W4xGotKJbK9Iqb9KCh2ZoNTNWOCeuSZIIA==
X-Received: by 2002:ac2:5d47:0:b0:545:8a1:5379 with SMTP id 2adb3069b0e04-54e90001400mr3315662e87.43.1745934447538;
        Tue, 29 Apr 2025 06:47:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2626fsm1902375e87.46.2025.04.29.06.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:47:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 29 Apr 2025 13:47:26 +0000
Subject: [PATCH 2/2] media: uvcvideo: Add keep-sorted statement and sort
 uvc_ids
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-keep-sorted-v1-2-2fa3538c0315@chromium.org>
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
In-Reply-To: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

We had some quirks that were out of order.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 70 ++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7ced8980543af5a207938d12a5eb833ee8a34c38..5f93a586c55936b0b41276b85df4456b64662fb0 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2500,6 +2500,8 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  * Sort these by vendor/product ID.
  */
 static const struct usb_device_id uvc_ids[] = {
+	/* keep-sorted start block=yes */
+
 	/* Quanta ACER HD User Facing */
 	{
 	  .idVendor		= 0x0408,
@@ -2603,108 +2605,108 @@ static const struct usb_device_id uvc_ids[] = {
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam Fusion */
+	/* Logitech HD Pro Webcam C920 */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c1,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
+	  .idProduct		= 0x082d,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
+					       | UVC_QUIRK_INVALID_DEVICE_SOF),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam Orbit MP */
+	/* Logitech HD Pro Webcam C922 */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c2,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
+	  .idProduct		= 0x085c,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam Pro for Notebook */
+	/* Logitech Rally Bar Huddle */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c3,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
+	  .idProduct		= 0x087c,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam Pro 5000 */
+	/* Logitech Rally Bar */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c5,
-	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
+	  .idProduct		= 0x089b,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam OEM Dell Notebook */
+	/* Logitech Quickcam Fusion */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c6,
+	  .idProduct		= 0x08c1,
 	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Quickcam OEM Cisco VT Camera II */
+	/* Logitech Quickcam Orbit MP */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x08c7,
+	  .idProduct		= 0x08c2,
 	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech HD Pro Webcam C920 */
+	/* Logitech Quickcam Pro for Notebook */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x082d,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .idProduct		= 0x08c3,
+	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
-					       | UVC_QUIRK_INVALID_DEVICE_SOF),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech HD Pro Webcam C922 */
+	/* Logitech Quickcam Pro 5000 */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x085c,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .idProduct		= 0x08c5,
+	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Rally Bar Huddle */
+	/* Logitech Quickcam OEM Dell Notebook */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x087c,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .idProduct		= 0x08c6,
+	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
-	/* Logitech Rally Bar */
+	/* Logitech Quickcam OEM Cisco VT Camera II */
 	{
 	  .idVendor		= 0x046d,
-	  .idProduct		= 0x089b,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .idProduct		= 0x08c7,
+	  .bInterfaceClass	= USB_CLASS_VENDOR_SPEC,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME),
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
@@ -3352,6 +3354,8 @@ static const struct usb_device_id uvc_ids[] = {
 	  .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	},
+
+	/* keep-sorted end */
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },

-- 
2.49.0.901.g37484f566f-goog

