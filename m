Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F28C1805A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032962; cv=none; b=C2/qsjRV5LsN1lSzz9cnNAZil5o8JP317oPBU9unlhgHJ27GQa9P5GCj9xRcbd5sIEl0lFCpkTIyX5swid8klXViwnq6/05PVgKUFN/rfIXiMlCrHJBaUIWCZCOn+OPYKOeocRen6H+6Y3exoLq47JnYnpQIbLAQRFRWQS4knPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032962; c=relaxed/simple;
	bh=AtdrqVblIwyRJjpzu+7s+0vuEiFQZDNTmIIOvwzzaZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEWQqYuVj0m5gohViRMXZkbHJ3Tnk9T7U0wc568W2zMdFCa6maUhcHs3FmEX//sUsvTgdWSALn/OYPk0TcpF4xf/evusmHQ020J5XBFpqkjr24mhED+p1c8xFAGx+1k0y0wLa4c5JDH8dJRxeH/7GtMRKR1uEmYY8YKfvw6jtwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JCCtk2h0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JCCtk2h0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744032959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=in81QoQ/dvpBmuwPHViwGcLpcDK61w2q9cor9eg0Gws=;
	b=JCCtk2h0sS69M9baQDm0gk3T9CRqUcvBNWIYkELWzkjvSOMeZSL/Ehj/nDIXn/Qh0VGPJW
	ej85kszmKPSukR04DovJWeqfk1LuvXM1jFIT5vksuwBUWgynE3TeaP3vp0j7siXJyrAH4K
	N1BZ47EPrzutNH65r1nuJj7bRRVY3eQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-ONXlbWMWPlSM7noBaITgVw-1; Mon, 07 Apr 2025 09:35:56 -0400
X-MC-Unique: ONXlbWMWPlSM7noBaITgVw-1
X-Mimecast-MFC-AGG-ID: ONXlbWMWPlSM7noBaITgVw_1744032956
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d08915f61so24484385e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032955; x=1744637755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=in81QoQ/dvpBmuwPHViwGcLpcDK61w2q9cor9eg0Gws=;
        b=LsFkFApa2J68jb3ML4Z1MkFJ4S6pToYRHRMYZdjFWW9GXcs5tEt4aD4gl/7P0tD+Q8
         guAUJrr5BwDP8G/nHY2AGr56uNms6RMliuRU1RSrf0k6ASNXwOhP9WJd+iVyR9/qFJSg
         ozHS8fTUvw0KXl1aIE2eZtcOs+yhw6XTKavKPYV2erSk+8bJWEF1wZFnLmAPGTzmObiq
         mN7hfUTkIofpGit21/88j7p9TLBnsUCc3/3nH2+9IJWLgP1eMjJ0PEZdlBnKPh4eeAyy
         Ke+dtFZ84ZKImo1uiAEOpU5sBG/pHD8tdA+4JOjO+mKLurRPtsg7HG6wryzYMhGmpDIZ
         ByjA==
X-Forwarded-Encrypted: i=1; AJvYcCU+mFClI/52iVc/LTmNN+wTLyrTGFNm3SHEaMMz/YMiX+8vJdibj5fjin+QcrzqU2xn7fLk+JpsVRWbRW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys25LQt6Jp237Jq3De84sOf8N5vBWraL90LDchJuLioZxRj5Vt
	0JpuveK8R59B1iOvIWna6t70UV4/wReL9xq7+eDb9hpH6fDbebMMrjTsl7T2syLYlG0bPDJ8D6J
	rBaLuoyGiF1ZiDSpZsrDkV5TBArKFuCJ02ze55RNkG9h+Ftbb5yYm+xUnbQhIsg==
X-Gm-Gg: ASbGncsUAZO5PzdVU0QiJq7bPquIDD2Gl3wi7sL7aHTqTeYos573XjQ6vwsv3XO0JYU
	S/fc5w0cG1uYMC5NsjP86i4KddG0QekNUdib4W6kX9rE2uoRMhpjwDDJ+blCwiCDxrD3D5+m3r9
	DCtFQL04qcJhCnTwrYCRUX9rMVGbyezFb6NxRD15hIiJioWUenB17aD/EGJKwAMu3KmGmbe3nMf
	E+1FtJ/AMPuK1U0M20Dwp2UTOroOUHfJzFfEuAnSRvxLfIzB94PQtoQgBajlXipbwa0eUn5q4sC
	/FlqVa9zm3KcpIhBJGI=
X-Received: by 2002:a05:600c:310b:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-43ed0bde9bcmr125232345e9.13.1744032955503;
        Mon, 07 Apr 2025 06:35:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqPE09HvV1TzW6HsrZAUhDGd6C6eKqSvet6ej3keISmgUBcZKAzeGW/v0ETt6uMYcpLNkm4A==
X-Received: by 2002:a05:600c:310b:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-43ed0bde9bcmr125232055e9.13.1744032955145;
        Mon, 07 Apr 2025 06:35:55 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm130625395e9.39.2025.04.07.06.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:35:54 -0700 (PDT)
Message-ID: <3d85d4eb-15b6-431f-9244-23583a26166f@redhat.com>
Date: Mon, 7 Apr 2025 15:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] media: uvcvideo: Fix bandwidth issue for Alcor camera
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenchangcheng <chenchangcheng@kylinos.cn>
References: <20250324022120.216923-1-ccc194101@163.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250324022120.216923-1-ccc194101@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 24-Mar-25 03:21, chenchangcheng wrote:
> From: chenchangcheng <chenchangcheng@kylinos.cn>
> 
> Some broken device return wrong dwMaxPayloadTransferSize fields,
> as follows:
> [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
> [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
> 
> The maximum packet size of the device is 3 * 1024, according to the
> logs above, the device needs to apply for a bandwidth of 0x2a0000.
> 
> Bus 001 Device 008: ID 1b17:6684 Alcor Corp. Slave camera
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1b17
>   idProduct          0x6684
>   bcdDevice            1.05
>   iManufacturer           1 Alcor Corp.
>   iProduct                2 Slave camera
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x02ad
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              200mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0
>       iFunction               4 Slave camera
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0
>       iInterface              4 Slave camera
>       VideoControl Interface Descriptor:
> 
>       ....
> 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval               7
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       VideoStreaming Interface Descriptor:
>         bLength                            14
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         1
>         wTotalLength                   0x01ef
>         bEndPointAddress                  130
>         bmInfo                              0
>         bTerminalLink                       3
>         bStillCaptureMethod                 2
>         bTriggerSupport                     1
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>       VideoStreaming Interface Descriptor:
>         bLength                            11
>         bDescriptorType                    36
>         bDescriptorSubtype                  6 (FORMAT_MJPEG)
>         bFormatIndex                        1
>         bNumFrameDescriptors                9
>         bFlags                              1
>           Fixed-size samples: Yes
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 1 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                248832000
>         dwMaxBitRate                1492992000
>         dwMaxVideoFrameBufferSize     6220800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
> 
> 	......
> 
>       VideoStreaming Interface Descriptor:
>         bLength                            42
>         bDescriptorType                    36
>         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
>         bEndpointAddress                    0
>         bNumImageSizePatterns               9
>         wWidth( 0)                       1920
>         wHeight( 0)                      1080
>         wWidth( 1)                       2048
>         wHeight( 1)                      1536
>         wWidth( 2)                       1280
>         wHeight( 2)                       720
>         wWidth( 3)                       2592
>         wHeight( 3)                      1944
>         wWidth( 4)                       1280
>         wHeight( 4)                      1024
>         wWidth( 5)                       1280
>         wHeight( 5)                       960
>         wWidth( 6)                       1600
>         wHeight( 6)                      1200
>         wWidth( 7)                        800
>         wHeight( 7)                       600
>         wWidth( 8)                        640
>         wHeight( 8)                       480
>         bNumCompressionPatterns             0
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       1
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x1400  3x 1024 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       2
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0b84  2x 900 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       3
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0c00  2x 1024 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       4
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0c00  2x 1024 bytes
>         bInterval               1
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> Device Status:     0x0000
>   (Bus Powered)
> 
> Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Ricardo, do you have any more remarks about this patch ?


Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
>  drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index deadbcea5e22..9b1dedf9773b 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3023,6 +3023,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_STATUS_INTERVAL) },
> +	/* Alcor Corp. Slave camera */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x1b17,
> +	  .idProduct		= 0x6684,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_OVERFLOW_BANDWIDTH) },
>  	/* MSI StarCam 370i */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..56f23c363870 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -262,6 +262,16 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  
>  		ctrl->dwMaxPayloadTransferSize = bandwidth;
>  	}
> +
> +	if (stream->intf->num_altsetting > 1 &&
> +	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize &&
> +	    stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH) {
> +		dev_warn(&stream->intf->dev,
> +			 "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
> +			 ctrl->dwMaxPayloadTransferSize,
> +			 stream->maxpsize);
> +		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> +	}
>  }
>  
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5e388f05f3fc..8b43d725c259 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -77,6 +77,7 @@
>  #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
>  #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
> +#define UVC_QUIRK_OVERFLOW_BANDWIDTH	0x00040000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
> 
> base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1

