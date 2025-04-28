Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B66D266B67
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846903; cv=none; b=gkQx7DFzm/zep/r3oYYAaOKU9J8+rNrdR1ctExAwuuwLMxKerdYqnadE87hDOhHM4ZVxRHEIaA6xgZ3mbmeMzEGmcWOyOCuKNPSm3lwVB4LfVnIud2ha7e4I3V59piCegw97XBVuIiZStGEi6NlsyqT87ODQ8Y8CPCmSAmi0cL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846903; c=relaxed/simple;
	bh=l3dVdh9wzuSTOKDHUFz0b9/AIs71l6IsH7JSLxyvWm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2GLPxPSCQ1r6d6YL02yHQ3RIlMZojTuunMEWRH3xWe+d11uR1TdtJOy0VadhEOqvlAuJTFgkQM5CvQ5aNsgo2YVQ7Zu9yrpi6e3mz4+i/GSz3PbN2BuA6yWzdsfGoiHtJChkzt/f8JOLZpaIWjCShlKHpAgfMWBIvgux6ZLh0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eMehDfog; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eMehDfog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745846900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg0xq41qt97xR3ZvTPk2wgbDhcDx4hFTu+2DD4oLNRw=;
	b=eMehDfogYox/1aL/NTNmtvgwZ/CofAgsXYlDCNslihpjuGFKeQmD2sPuk9IqGH9XuK6qb7
	f3Nugla7YmAcpJguRhyonGXOn/erl7PsoeUYU1ZjArv1vgt7dQCuOdWn4ukXp4ois7R5Lr
	5ibtQgbQp+I06l2bfOKZ0jK3v02tcAQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-Tuy-v-nMMrWGf4GJNaXrRw-1; Mon, 28 Apr 2025 09:28:19 -0400
X-MC-Unique: Tuy-v-nMMrWGf4GJNaXrRw-1
X-Mimecast-MFC-AGG-ID: Tuy-v-nMMrWGf4GJNaXrRw_1745846898
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb98b5b0bdso430178966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745846898; x=1746451698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg0xq41qt97xR3ZvTPk2wgbDhcDx4hFTu+2DD4oLNRw=;
        b=KN8a8F6YL0k40EikgRyReWJ0aGJ8/go+XJMeKQLBvMlaESOz6Ynal5gZthJNYC1kDj
         Gf/EQO28L5VwccprfmrWhLwPZiVxyjUb8Gkly8WGcZAgLyPrtQf4KYKV/XJ97b4DOguz
         aE8yPvCJHfgf3HV5hh4DkbbBFNuzsNny7H4BYIB9YjpFvB5hdc2lroqyfXzBmylx5qHJ
         sxr0j9WiCITThn1NygrarUCkgoechj3Ipc5mDU2gB2sEw14i3flg0Gi9H9o2a5hFRatE
         14BLg6CalsPqsjdVai2X1Szu791OQhQjK6ZLCasZy+4z6+xUZBiGiwsvyy5MSuiNfdsc
         1CIg==
X-Forwarded-Encrypted: i=1; AJvYcCViLDX2fZiKGCyxgmhyi0oDN9+LRQuWeFPUsA0u4mpONhg+c+1yTy9G5PY9xdn+C8zBOoPEjEVhw8YfPXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3bGErdJIZ4vjOt1UBaOoePQS2kTg+ugNv0tZ9AeETBdcPBs+T
	CYOIl0qwFTHxQl2MpRTXLCpG+JySClXVR48pOXLfE0PLqNhB1ZrYqPtU6HfKQZCMFdT6zLSXATN
	xQCJK9Km0DECKsq7ZiDKfLf5HUUQ7F/IuOlDV7HPFboYorgntzt5KUSITLX6eGA==
X-Gm-Gg: ASbGnct8qg7Xfi6X0A7Jk0jc8Qg3DKec1kPDzSokzd2UlaLbBwE53lpVoD/+taZ4WE0
	G0J9GtYO1y6tOcytqsQGPwtHUd8bGCw9TcOMBh9XGjue3r9T9FAOLvKv6mDN0wGbAlAxuYai3sh
	dEtafGzz1ckJfidxcmgSEAFxROuVB7OyO2gmj+YfHucg/YYhlJPBv+peHUmDZsiiBRcTA5hY865
	Yz5uP8pCFOwK57AQPe9fnaycH5SWH7WNtEspCFwuBDSwPjCkJXryHJG/zsn+6eHgS/xYhHLwGbg
	xXqeYVVAURTRtI8=
X-Received: by 2002:a17:907:9812:b0:acb:5070:dd19 with SMTP id a640c23a62f3a-ace7140871emr986957266b.61.1745846898404;
        Mon, 28 Apr 2025 06:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtlXu0jsASJ3MeiUP+hMifoEhEfHok+6uVTbLwLAPDU6I6D9W4QXDaUyIpZvionOFT+g0NGQ==
X-Received: by 2002:a17:907:9812:b0:acb:5070:dd19 with SMTP id a640c23a62f3a-ace7140871emr986954566b.61.1745846897877;
        Mon, 28 Apr 2025 06:28:17 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed705e5sm628164366b.145.2025.04.28.06.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:28:17 -0700 (PDT)
Message-ID: <5e8025a1-63f2-4120-8160-8848a5cf34ec@redhat.com>
Date: Mon, 28 Apr 2025 15:28:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Fix deferred probing error
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
 <20250313-uvc-eprobedefer-v3-1-a1d312708eef@chromium.org>
 <20250422180630.GJ17813@pendragon.ideasonboard.com>
 <CANiDSCuO+dHOBtW4yvy1n25QWEs-WdQ9H8Lh2rUtcPbUq3hBkQ@mail.gmail.com>
 <20250422230513.GX17813@pendragon.ideasonboard.com>
 <CANiDSCssyAVoyvsiO8thGwUFc_boA_jhBxYDif32Hxh40fhf-Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCssyAVoyvsiO8thGwUFc_boA_jhBxYDif32Hxh40fhf-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 23-Apr-25 01:18, Ricardo Ribalda wrote:
> On Wed, 23 Apr 2025 at 07:05, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> On Wed, Apr 23, 2025 at 06:50:10AM +0800, Ricardo Ribalda wrote:
>>> On Wed, 23 Apr 2025 at 02:06, Laurent Pinchart wrote:
>>>> On Thu, Mar 13, 2025 at 12:20:39PM +0000, Ricardo Ribalda wrote:
>>>>> uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
>>>>> have not yet been probed. This return code should be propagated to the
>>>>> caller of uvc_probe() to ensure that probing is retried when the required
>>>>> GPIOs become available.
>>>>>
>>>>> Currently, this error code is incorrectly converted to -ENODEV,
>>>>> causing some internal cameras to be ignored.
>>>>>
>>>>> This commit fixes this issue by propagating the -EPROBE_DEFER error.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
>>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>> ---
>>>>>  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
>>>>>  1 file changed, 19 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>>>> index deadbcea5e227c832976fd176c7cdbfd7809c608..e966bdb9239f345fd157588ebdad2b3ebe45168d 100644
>>>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>>>> @@ -2231,13 +2231,16 @@ static int uvc_probe(struct usb_interface *intf,
>>>>>  #endif
>>>>>
>>>>>       /* Parse the Video Class control descriptor. */
>>>>> -     if (uvc_parse_control(dev) < 0) {
>>>>> +     ret = uvc_parse_control(dev);
>>>>> +     if (ret < 0) {
>>>>> +             ret = -ENODEV;
>>>>
>>>> Why do you set ret to -ENODEV here...
>>>>
>>>>>               uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
>>>>>               goto error;
>>>>>       }
>>>>>
>>>>>       /* Parse the associated GPIOs. */
>>>>> -     if (uvc_gpio_parse(dev) < 0) {
>>>>> +     ret = uvc_gpio_parse(dev);
>>>>> +     if (ret < 0) {
>>>>>               uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
>>>>>               goto error;
>>>>>       }
>>>>> @@ -2263,24 +2266,32 @@ static int uvc_probe(struct usb_interface *intf,
>>>>>       }
>>>>>
>>>>>       /* Register the V4L2 device. */
>>>>> -     if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
>>>>> +     ret = v4l2_device_register(&intf->dev, &dev->vdev);
>>>>> +     if (ret < 0)
>>>>
>>>> ... but not here ? The code below is also not very consistant.
>>>
>>> For all the "external" functions I was looking into populating their
>>> error code to probe(). Other drivers (check vivid for example) do
>>> exactly this.
>>>
>>> There is more value in returning the real cause of the error (ENOMEM,
>>> EINVAL) that the plain ENODEV.
>>
>> Yes, I got that, my question was why you override the return value of
>> e.g. uvc_parse_control() or uvc_scan_device() with -ENODEV, but not for
>> e.g. uvc_gpio_parse() or v4l2_device_register(). There's no explanation
>> in the commit message regarding why they're treated differently.
> 
> Because it is less risky that way. There are plenty of examples where
> the framework functions return code is passed to probe().
> 
> The uvc_* functions might or might not work this way. When I do that
> assessment for every function I can post a different patch. I thought
> that this approach was safer, especially if we are cc-ing stable.
> 
> A note in the commit message would have been a nice thing to have I agree :).

I agree with Laurent that just properly propagating the error code of
all functions, without overriding the return value with another -EXXXX code
in some places seems a better and cleaner way to handle this.

In the end the return value of uvc_probe() does not matter that much,
the only difference is that for errors other then -ENODEV the driver-core
will print an extra error message. But we should not fail to probe anyways.

If we get bug reports about this we can revisit, but for simplicity and
consistency reasons I would prefer to just always return the error of
the called function as is.

Regards,

Hans




>>>>>               goto error;
>>>>>
>>>>>       /* Scan the device for video chains. */
>>>>> -     if (uvc_scan_device(dev) < 0)
>>>>> +     if (uvc_scan_device(dev) < 0) {
>>>>> +             ret = -ENODEV;
>>>>>               goto error;
>>>>> +     }
>>>>>
>>>>>       /* Initialize controls. */
>>>>> -     if (uvc_ctrl_init_device(dev) < 0)
>>>>> +     if (uvc_ctrl_init_device(dev) < 0) {
>>>>> +             ret = -ENODEV;
>>>>>               goto error;
>>>>> +     }
>>>>>
>>>>>       /* Register video device nodes. */
>>>>> -     if (uvc_register_chains(dev) < 0)
>>>>> +     if (uvc_register_chains(dev) < 0) {
>>>>> +             ret = -ENODEV;
>>>>>               goto error;
>>>>> +     }
>>>>>
>>>>>  #ifdef CONFIG_MEDIA_CONTROLLER
>>>>>       /* Register the media device node */
>>>>> -     if (media_device_register(&dev->mdev) < 0)
>>>>> +     ret = media_device_register(&dev->mdev);
>>>>> +     if (ret < 0)
>>>>>               goto error;
>>>>>  #endif
>>>>>       /* Save our data pointer in the interface data. */
>>>>> @@ -2314,7 +2325,7 @@ static int uvc_probe(struct usb_interface *intf,
>>>>>  error:
>>>>>       uvc_unregister_video(dev);
>>>>>       kref_put(&dev->ref, uvc_delete);
>>>>> -     return -ENODEV;
>>>>> +     return ret;
>>>>>  }
>>>>>
>>>>>  static void uvc_disconnect(struct usb_interface *intf)
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 
> 
> 

