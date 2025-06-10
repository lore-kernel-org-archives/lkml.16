Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D85422A80E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556637; cv=none; b=Z2Hh5RCo0Rf9nD0ZDxOaaN+ZNXo2quhUvA5VRzb1H9CPv5HIQjqGC5fG7L/VDjBqa095ZRcmffsoikfaw9LsVDpupQhN9/t4hkF6WxvKBUVrG0HwOpXUk+sHUHkg04ac5ehP0U9udXbQq0/G5saFlcFWQ6jUmfjxTAM3S8xaK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556637; c=relaxed/simple;
	bh=R5hMVUdxv7mmadRyb20lK91NAt+iped7miHemtSgS4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxXubF5Thx9lNaCp4V6XDnihYpszX5gEZf84XqwCdA0e5UpDdGo3FzQ6uzDf1Gw+JPrdcw7G3vyqBumj8fl3xuMuXTQJHD8EmjUSTezUa13PEY6OIA4mvCMF20ghhe58wTfiyCVDZV9YJTC5rB7SMbGNWZPaGdIYmlU2fsrk/2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TGMtTuvn; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TGMtTuvn"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553331c3dc7so5260686e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749556633; x=1750161433; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K11hm5KsEhFuzQMV0vnk5vTeN00HudABkfMVc/rVIOw=;
        b=TGMtTuvnIK8pb9zk6AubvhvwPFtM7cNt4HDCJiqt4+1B431FydYIAqmGtZCr+qQQJm
         rr3sxuekS2drelRZ69sXdQ+t6B1/3Z/P8WQZwrR6XH4wLNzy/zPhxa21CLPW/exfOAmH
         QO2dyxHl9aS0wQIRWmyC2udBUXOTvnhjx/Qew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749556633; x=1750161433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K11hm5KsEhFuzQMV0vnk5vTeN00HudABkfMVc/rVIOw=;
        b=vbxSzks+4EIjc8vnq8TpZL49jRo/FzCFqfjJk1sTZwc3bXeIMIBhE2PCoTldI9U158
         Bm5tjHcTaLIafmps8puxnFBlFz1n0gdRKX8kMiNSGmkgi1u7Dmhnj9aCv6RthtXIlnfm
         FKj9FBYMPdrBa80MHjZBq71iwi3QkoJxuizhWHW2wkIT0H0px1+lrlMe6jCMuC8bEig4
         XeGVu1UxY2a9rJ08gvdqsg4w21bmvSyuNeopzGeOjBIxSKT9NUpK77+1bWykAzK2k58Y
         jLlL7wRtClfeR7TLangvsQ1KemqGd5XTVKQrYctI6T18trt1SBhY6pOSiVUFSJ6RvXH3
         Zafw==
X-Forwarded-Encrypted: i=1; AJvYcCUBHzs2xg0sYN3vhjEBAsco+AzJtBwBlaY5GAvq+YUSAKlB0bWIQp1QQDwljPaZ3elhu4jsUboYhRSdbmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwitVEyTv7d4s4q4yvnq6iQWr8tI5tULZwM0ArQTCuAc3rFbTHu
	NFX2ZHoQkwtwmCHYqBQAm6u0S6ZK6k8PTSTbuHvXxAAKED/4uwYoha9WfG+veTAAXdbv/DtSwFI
	wROU=
X-Gm-Gg: ASbGncs9VN8KU4iE4fEwExbZZwGE00A/jcnIEg4l/cKGkF/XWrYeyRbvpKx4sfsQgN/
	M0Wx6q5+IJtn33/lFy0p0c9cAR3nECIfkyffxfu2lKIo0PQGfUGCde51PJ4pzZUAviAv7vSNxUq
	F5/oDtK8jxz6VM7ltbHpVX+TgWyMtUWgaxKKY/zeTG21p50+a/OtqcLu6VMK2uFrZxDkVEIf+eB
	f+/9Vs49++kLJnX74ayb4thcrqhe5HWYH14NkIC9jtWO4B19YaFQQs+f/8Mql5JCB3vTsscTmgQ
	x7NpCFkb0f5u34gwGyicIhmPT46Hwsv6csvNW1yYUorV9QShwm7RaSrMdhGCT5hR1yAhA6A5Ht8
	TEnmiLEz/6rBNvNoKEXkGAEsg
X-Google-Smtp-Source: AGHT+IHavwF7Ca4DjdyVufLDHRoTBv+MIALnxUNCFHbW+LG0/Mca0msWjlut0bt7cnldFMgpsHBUbA==
X-Received: by 2002:a05:6512:3da3:b0:553:2375:c6d9 with SMTP id 2adb3069b0e04-55366c327e4mr4617734e87.55.1749556633241;
        Tue, 10 Jun 2025 04:57:13 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d04e9sm1514897e87.5.2025.06.10.04.57.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 04:57:12 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553331c3dc7so5260633e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:57:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPOSPDyxa9UxRxWp9n112JPD71MH14IZtYI9B/zW322D6y6ENpw3I3/kvrlxd/ZWHlKj3433v9tA+jSAo=@vger.kernel.org
X-Received: by 2002:a05:6512:23c9:b0:553:3544:2b31 with SMTP id
 2adb3069b0e04-55366c0b031mr2995986e87.40.1749556631288; Tue, 10 Jun 2025
 04:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9@epcas1p4.samsung.com>
 <20250610113722.36820-1-yjjuny.lee@samsung.com>
In-Reply-To: <20250610113722.36820-1-yjjuny.lee@samsung.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Jun 2025 13:56:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCtQiiutnqGWwL1u=K4kFavhw0-z=m_Kztr2xRpDUZ+iLA@mail.gmail.com>
X-Gm-Features: AX0GCFsIB_jsO93Cd7Dtr7hPY8vm9UREfUiDERDqDZvvclpZmkTx5CnwHSKPkMg
Message-ID: <CANiDSCtQiiutnqGWwL1u=K4kFavhw0-z=m_Kztr2xRpDUZ+iLA@mail.gmail.com>
Subject: Re: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in uvc_parse_format()
To: Youngjun Lee <yjjuny.lee@samsung.com>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngjun

On Tue, 10 Jun 2025 at 13:37, Youngjun Lee <yjjuny.lee@samsung.com> wrote:
>
> The buffer length check before calling uvc_parse_format() only ensured
> that the buffer has at least 3 bytes (buflen > 2), buf the function
> accesses buffer[3], requiring at least 4 bytes.
>
> This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.
>
> Fix it by checking that the buffer has at least 4 bytes before passing it
> to uvc_parse_format().
>

You probably want to add:
Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Cc: stable@vger.kernel.org

> Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index da24a655ab68..60367d9e1c05 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -729,7 +729,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         streaming->nformats = 0;
>
>         /* Parse the format descriptors. */
> -       while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
> +       while (buflen > 3 && buffer[1] == USB_DT_CS_INTERFACE) {
>                 switch (buffer[2]) {
>                 case UVC_VS_FORMAT_UNCOMPRESSED:
>                 case UVC_VS_FORMAT_MJPEG:
> --
> 2.43.0
>
>

I would have fixed it slightly different:

diff --git a/drivers/media/usb/uvc/uvc_driver.c
b/drivers/media/usb/uvc/uvc_driver.c
index 96eeb3aee546..1371a73e67e3 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -344,6 +344,9 @@ static int uvc_parse_format(struct uvc_device *dev,
        u8 ftype;
        int ret;

+       if (buflen < 4)
+               return -EINVAL;
+
        format->type = buffer[2];
        format->index = buffer[3];
        format->frames = frames;


I think it makes more sense to add the length check where it is going
to be used not on a caller function. If we every change
uvc_parse_format to read byte #5 we will probably miss the check on
uvc_parse_streaming()

-- 
Ricardo Ribalda
