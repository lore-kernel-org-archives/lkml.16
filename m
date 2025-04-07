Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91241204879
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040921; cv=none; b=pnSNC5caLZ2DvHr24E6eySlpeFo6GhtM6oYPFenKOTWfNBr+7p5rN7WFR3n755XdFGdkDpRv7Z3KpJMcWbeNZd6WJIm9ZLfEmgZTZp20hZkzn7AubH/NuTHocswml+H5KBC91C8vC8gisDwMN6k2uiXs7nNY+flQC3JELHPtxco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040921; c=relaxed/simple;
	bh=OhZ61zq/qAjqGLauXEolhorzbFURESUr9alCnlCjyMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiYU9qjqLpbqpBv/2F30uBRJDMG4LBDi83M5p4/iIrc4lk8doihqyB1XtebkO31osVpYhmOpWCQUL5rMRm56YpsIeDJbpbjb5LArWdK+RIMoohvPe/uRwvPXdXqppoRnzgNy6VuLgtBrgsnwDpn/oN8pRGIxCWwUR+/DMpDkA8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NS2ojMlA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NS2ojMlA"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so5489383e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744040917; x=1744645717; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KeMO2MoK/gmaMqqfz//pMM3Aa5UXDizNqUpcKkRXTeQ=;
        b=NS2ojMlAot8ZY3vyT76zxRY212XMN7V/R3U2WN1LJY5z98uW0TGFAtnWreTH7UZHpb
         T8ln/r9GxGTc7Apxfw6ZKHkszjvgk98gH31MtqXm8hhqanSdLtKFMzEhwXf6a8tPl7VH
         EFk9whHdYCyUl3AQboBvT/fHjI4PuZnD7gaVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040917; x=1744645717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KeMO2MoK/gmaMqqfz//pMM3Aa5UXDizNqUpcKkRXTeQ=;
        b=X0tMxg/UojaSY8Vzb8G0FaCInR9Jlfhnorf0SfOU/dCXgyBFYy4eJIhvLV5I7dbrFg
         lhj1tjK1YCHI8VEvdDVQbIDxNBhE+k7qZZL5eJ1WGVEVcnS4E3hBCYFGgtRHP9+ZipNO
         bVrvz+8XQuNZZ25p7P8i52/+j4JSU1P2k8gU1ERG+baR5IwlpihVMhI51Z2cMRq458+W
         C0RHNlr6Q9CUPl8NRNQvyS53p+lb2cE6l9uDdYUIaakymHBHkIN42qmZ7yR5qF2sqk6j
         Hcv115SDloWQmgtBRYuZx/7IbgA21pB6PUxQh9OaVF1COwbEtQFB0ev6DOQbXaJwRyjv
         tFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVmdul27GkUCSfKQVgREi8XZ/qAShWxasCYNs7hwYwbrFRn1scFArdHkV7G13pb+w+89ccc0ivHdoDxic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr3s4u6MMBLlTjCWMgESj/SJZkYFw/3wS0F66rQR6dGzwli5l4
	r4FiqllUCM3Vujh9LKvhp8IoIaSzH0xHXKsm9SfFEiHvh3R9lrX5TmhfsNr9a9eTcj5Ctmg2Hcc
	=
X-Gm-Gg: ASbGncumJgBdkUQQcpTSIvYIJaEXVTjmHt0Ig+M9cWxfOU+q5BAw9LCu8p1gqTizpcK
	Di3euKOa5t8Y6KjPEBRGmIt+oIKsOy6tOg96wk8h3g7JilaUVIBmqaj0FzWSvT1C5z/prMPFp72
	NqGBPQcw65jAbRlYQFDuPrLwd/kvqsSH3jkJTYZ1uioAWGlTLmAgknHMIOi5C82pr2djOfamIkR
	ktdNcr5EQFmZ7cOgspfG05yKXBTueb2tWWaNNkqRs8fcGV+PZFyN9nxNazOHrwyb7dS2CMzL4wm
	uWlxFtAGW3Y089lvt7EJPDRrPS6YUVAtR6E+Qw2sCw/33Sj34UUPPmYmSge1+Oa+Bu3eJdXCzPX
	15huKAyQ=
X-Google-Smtp-Source: AGHT+IEyJFoPEbLPaA708NeyqdDxtoSCU710OF5NGrJwVvXoUK5CYCoQLj6YnOrvi6De08d7t2YUZQ==
X-Received: by 2002:a05:6512:1282:b0:549:5b54:2c68 with SMTP id 2adb3069b0e04-54c227868f6mr3314761e87.22.1744040916082;
        Mon, 07 Apr 2025 08:48:36 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672379sm1289785e87.231.2025.04.07.08.48.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 08:48:35 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54993c68ba0so5067221e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:48:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQqRtldGJtlm2mmWBJCjl6yBzjJN1jzw+oOtCBDfymfQ7PmsDpBWyHfxjc5wr1pSRyPE6Rc0tk8rolpB8=@vger.kernel.org
X-Received: by 2002:a05:6512:6c7:b0:548:794f:f9dd with SMTP id
 2adb3069b0e04-54c227708e1mr3603624e87.10.1744040911431; Mon, 07 Apr 2025
 08:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324022120.216923-1-ccc194101@163.com> <3d85d4eb-15b6-431f-9244-23583a26166f@redhat.com>
In-Reply-To: <3d85d4eb-15b6-431f-9244-23583a26166f@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Apr 2025 17:48:18 +0200
X-Gmail-Original-Message-ID: <CANiDSCsDrDQty1T6DM6Au-bptOrJT9x49a=pGOawph1v6iisJw@mail.gmail.com>
X-Gm-Features: ATxdqUGYOA3uZ-NBLaU7O8bkH19C64j25clGNy-r5EYRAODKZipVQEIO6M61QrE
Message-ID: <CANiDSCsDrDQty1T6DM6Au-bptOrJT9x49a=pGOawph1v6iisJw@mail.gmail.com>
Subject: Re: [PATCH v6] media: uvcvideo: Fix bandwidth issue for Alcor camera
To: Hans de Goede <hdegoede@redhat.com>
Cc: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chenchangcheng <chenchangcheng@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

Hi

On Mon, 7 Apr 2025 at 15:39, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 24-Mar-25 03:21, chenchangcheng wrote:
> > From: chenchangcheng <chenchangcheng@kylinos.cn>
> >
> > Some broken device return wrong dwMaxPayloadTransferSize fields,
> > as follows:
> > [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
> > [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
> >
> > The maximum packet size of the device is 3 * 1024, according to the
> > logs above, the device needs to apply for a bandwidth of 0x2a0000.
> >
> > Bus 001 Device 008: ID 1b17:6684 Alcor Corp. Slave camera
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               2.00
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0        64
> >   idVendor           0x1b17
> >   idProduct          0x6684
> >   bcdDevice            1.05
> >   iManufacturer           1 Alcor Corp.
> >   iProduct                2 Slave camera
> >   iSerial                 0
> >   bNumConfigurations      1
> >   Configuration Descriptor:
> >     bLength                 9
> >     bDescriptorType         2
> >     wTotalLength       0x02ad
> >     bNumInterfaces          2
> >     bConfigurationValue     1
> >     iConfiguration          0
> >     bmAttributes         0x80
> >       (Bus Powered)
> >     MaxPower              200mA
> >     Interface Association:
> >       bLength                 8
> >       bDescriptorType        11
> >       bFirstInterface         0
> >       bInterfaceCount         2
> >       bFunctionClass         14 Video
> >       bFunctionSubClass       3 Video Interface Collection
> >       bFunctionProtocol       0
> >       iFunction               4 Slave camera
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        0
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      1 Video Control
> >       bInterfaceProtocol      0
> >       iInterface              4 Slave camera
> >       VideoControl Interface Descriptor:
> >
> >       ....
> >
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x81  EP 1 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0010  1x 16 bytes
> >         bInterval               7
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       0
> >       bNumEndpoints           0
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            14
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  1 (INPUT_HEADER)
> >         bNumFormats                         1
> >         wTotalLength                   0x01ef
> >         bEndPointAddress                  130
> >         bmInfo                              0
> >         bTerminalLink                       3
> >         bStillCaptureMethod                 2
> >         bTriggerSupport                     1
> >         bTriggerUsage                       0
> >         bControlSize                        1
> >         bmaControls( 0)                     0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            11
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  6 (FORMAT_MJPEG)
> >         bFormatIndex                        1
> >         bNumFrameDescriptors                9
> >         bFlags                              1
> >           Fixed-size samples: Yes
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 1 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >         bCopyProtect                        0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            50
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  7 (FRAME_MJPEG)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x00
> >           Still image unsupported
> >         wWidth                           1920
> >         wHeight                          1080
> >         dwMinBitRate                248832000
> >         dwMaxBitRate                1492992000
> >         dwMaxVideoFrameBufferSize     6220800
> >         dwDefaultFrameInterval         333333
> >         bFrameIntervalType                  6
> >         dwFrameInterval( 0)            333333
> >         dwFrameInterval( 1)            400000
> >         dwFrameInterval( 2)            500000
> >         dwFrameInterval( 3)            666666
> >         dwFrameInterval( 4)           1000000
> >         dwFrameInterval( 5)           2000000
> >
> >       ......
> >
> >       VideoStreaming Interface Descriptor:
> >         bLength                            42
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
> >         bEndpointAddress                    0
> >         bNumImageSizePatterns               9
> >         wWidth( 0)                       1920
> >         wHeight( 0)                      1080
> >         wWidth( 1)                       2048
> >         wHeight( 1)                      1536
> >         wWidth( 2)                       1280
> >         wHeight( 2)                       720
> >         wWidth( 3)                       2592
> >         wHeight( 3)                      1944
> >         wWidth( 4)                       1280
> >         wHeight( 4)                      1024
> >         wWidth( 5)                       1280
> >         wHeight( 5)                       960
> >         wWidth( 6)                       1600
> >         wHeight( 6)                      1200
> >         wWidth( 7)                        800
> >         wHeight( 7)                       600
> >         wWidth( 8)                        640
> >         wHeight( 8)                       480
> >         bNumCompressionPatterns             0
> >       VideoStreaming Interface Descriptor:
> >         bLength                             6
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 13 (COLORFORMAT)
> >         bColorPrimaries                     1 (BT.709,sRGB)
> >         bTransferCharacteristics            1 (BT.709)
> >         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       1
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x82  EP 2 IN
> >         bmAttributes            5
> >           Transfer Type            Isochronous
> >           Synch Type               Asynchronous
> >           Usage Type               Data
> >         wMaxPacketSize     0x1400  3x 1024 bytes
> >         bInterval               1
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       2
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x82  EP 2 IN
> >         bmAttributes            5
> >           Transfer Type            Isochronous
> >           Synch Type               Asynchronous
> >           Usage Type               Data
> >         wMaxPacketSize     0x0b84  2x 900 bytes
> >         bInterval               1
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       3
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x82  EP 2 IN
> >         bmAttributes            5
> >           Transfer Type            Isochronous
> >           Synch Type               Asynchronous
> >           Usage Type               Data
> >         wMaxPacketSize     0x0c00  2x 1024 bytes
> >         bInterval               1
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       4
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x82  EP 2 IN
> >         bmAttributes            5
> >           Transfer Type            Isochronous
> >           Synch Type               Asynchronous
> >           Usage Type               Data
> >         wMaxPacketSize     0x0c00  2x 1024 bytes
> >         bInterval               1
> > Device Qualifier (for other device speed):
> >   bLength                10
> >   bDescriptorType         6
> >   bcdUSB               2.00
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0        64
> >   bNumConfigurations      1
> > Device Status:     0x0000
> >   (Bus Powered)
> >
> > Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Ricardo, do you have any more remarks about this patch ?

LGTM, I forgot to send the trailer sorry

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Not sure if Laurent wants the whole lsusb -v as the commit message os
as a cover letter.

Both work for me.

>
>
> Regards,
>
> Hans
>
>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
> >  drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index deadbcea5e22..9b1dedf9773b 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -3023,6 +3023,15 @@ static const struct usb_device_id uvc_ids[] = {
> >         .bInterfaceSubClass   = 1,
> >         .bInterfaceProtocol   = 0,
> >         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_STATUS_INTERVAL) },
> > +     /* Alcor Corp. Slave camera */
> > +     { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > +       .idVendor             = 0x1b17,
> > +       .idProduct            = 0x6684,
> > +       .bInterfaceClass      = USB_CLASS_VIDEO,
> > +       .bInterfaceSubClass   = 1,
> > +       .bInterfaceProtocol   = 0,
> > +       .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_OVERFLOW_BANDWIDTH) },
> >       /* MSI StarCam 370i */
> >       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index e3567aeb0007..56f23c363870 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -262,6 +262,16 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> >
> >               ctrl->dwMaxPayloadTransferSize = bandwidth;
> >       }
> > +
> > +     if (stream->intf->num_altsetting > 1 &&
> > +         ctrl->dwMaxPayloadTransferSize > stream->maxpsize &&
> > +         stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH) {
> > +             dev_warn(&stream->intf->dev,
> > +                      "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
> > +                      ctrl->dwMaxPayloadTransferSize,
> > +                      stream->maxpsize);
> > +             ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> > +     }
> >  }
> >
> >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 5e388f05f3fc..8b43d725c259 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -77,6 +77,7 @@
> >  #define UVC_QUIRK_DISABLE_AUTOSUSPEND        0x00008000
> >  #define UVC_QUIRK_INVALID_DEVICE_SOF 0x00010000
> >  #define UVC_QUIRK_MJPEG_NO_EOF               0x00020000
> > +#define UVC_QUIRK_OVERFLOW_BANDWIDTH 0x00040000
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> >
> > base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
>
>


-- 
Ricardo Ribalda
