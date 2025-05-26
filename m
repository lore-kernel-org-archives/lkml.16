Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250344409
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265704; cv=none; b=umjRLUFwHkxrAiS7SzEi0hXR1jzcDUB575wPIcDuLkFzLsOee5ZWZaLrfiid+CALF01/cTRZLuUGz/LHDNohV8i6osb5snFfPPT2SQ+7lMcQfuqyTdm5InslLLoWvQdQ2LTYtYBpDp4E09V5s+GL9CD5IiezfyLTX+Jun5vIGTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265704; c=relaxed/simple;
	bh=dMVFJSgTq8Jl8+oMoAoLUzJ4wYIzRrFgNDspYVegFcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QsYy9r3oNuOT9JNd7j1ZgKBL7mKHnMRFETQ1EmmCjscgheJe9zgWqODfVmjE+8Wowx9xCJOSC0z5VTrR/HT5jzkEWQA27RFzQaJYAld30w/+Iq8b+98AARLIdwBIsAdj9WUNJhUMt2f2JVd4rUWNZ3KjdMuQBSFuzY9Kzlsqcxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dts+8Fxi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dts+8Fxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748265702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+U6AvG4mqTA6HeLDMPefzAqkAK/pe7N2MgT3F8Vb04=;
	b=dts+8Fxi6hUlRIHKzV+TuiaHcSfE2k/0iH3TLwBihASP2/fLEXliEVYg3mA6ayEiN6OCYd
	LQA+dSBJ9RRvv6ZW4BY6wZYAItPL5B8UOnEpnXzIxeZoWDcYleE+uMI/zII5J15GzwUhga
	XfQQRIJTSuBF09dIDS9n0Omf1wzFNyU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-NiEgH9IbOQWrgZw4ZxSwYQ-1; Mon, 26 May 2025 09:21:40 -0400
X-MC-Unique: NiEgH9IbOQWrgZw4ZxSwYQ-1
X-Mimecast-MFC-AGG-ID: NiEgH9IbOQWrgZw4ZxSwYQ_1748265699
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acbbb000796so146423066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265699; x=1748870499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+U6AvG4mqTA6HeLDMPefzAqkAK/pe7N2MgT3F8Vb04=;
        b=I/3PnImWZuFJQH8nEiwbbBBhSRb4KSwQ58InQVdUQzj2kWeLeYBv3YsC+emHqyun3I
         1XvZ9pf7ckOv9lhcEwP2G2TEdkmw6vuh+c+VNXueVexdOXf8bwBd7Jbhmy9uI5fLL/tJ
         wrs9BhRRC50ltGhN4MSXjqm7+EJ7oU6p36lFh1m9/ABAEr9tILYOmXADIo2U0eogtzHf
         pskReGPCkFFmPTBY5w0f/9C/jXtrn0flAOTHFPZNGQW8h1jAfiFPlOG67xWZoFA6s9CL
         /OrLvLI6T+JGPdNOcvZ9QiaAapmMWwTYrV31SyA0U7Rt0MM328N853Vim5C3hyJVBrd7
         7V4w==
X-Forwarded-Encrypted: i=1; AJvYcCWJHO/Yxy0SP7ywjwPHMMyny2t0jeNVKLWgqxQzrTP0aioVjXFu1mGNYr8fLqg/pKJRkKtcm753We9LjdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyycLEpElrYGiAoaCZHO01B5WWBQLxdPcOZtExqlOfgrThLCMDC
	sDYLxIlUll4zSdEt/XR41azaARqLN+oSCXCoryOfrxeeuG/S2OCLjR2poGIC1go6/VXp4ExorHc
	DleoBIfyMdnZIC8hNRMMVvMLu05hwAFgn10XS+56hd52qzc1BbuTp5tjoLSSqWQLsYw==
X-Gm-Gg: ASbGncsVdhkGTstlcVptCtkGMyCL92tcrBGvE4Xs8Ox3Kk50dAR+ygR5tHnn0cs5/MS
	cDGabZEHrtoKVSksfuTt5+uQl0d+A2kg/TAb6qfRTZRT83vrgWapMK7JUzFTrRqw3v3izDG9UOn
	05Z/iUBH0inihX8EmCHTVPu+ZtX3ASVl9l5veeZohk6fo/RPialyxWx9pYyTw7J44RgxoUWJ9GH
	Vg2Md0bZSXoavP759KeiYBrOWjsT8MmyaC9WZh3FruLaWVJJbEhxpCVs9cjbRzEo9eq5h4luQEP
	9TFj4kcL+v85VJE=
X-Received: by 2002:a17:906:4a8d:b0:ad5:c462:3f60 with SMTP id a640c23a62f3a-ad85b1844f9mr604695166b.16.1748265699374;
        Mon, 26 May 2025 06:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERL/nfhdZ5rD+ue9cJCOb/Exbr9jaPUwtWcnctwrwXHum0txKunLk7ok0Hfc8NLUDMh0IFKw==
X-Received: by 2002:a17:906:4a8d:b0:ad5:c462:3f60 with SMTP id a640c23a62f3a-ad85b1844f9mr604692466b.16.1748265698944;
        Mon, 26 May 2025 06:21:38 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d441fb5sm1695934766b.108.2025.05.26.06.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:21:38 -0700 (PDT)
Message-ID: <8fe337d5-c399-4546-b784-33e651ab608d@redhat.com>
Date: Mon, 26 May 2025 15:21:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uvcvideo: Populate all errors in uvc_probe()
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250523-uvc-followup-v2-1-487541656e83@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250523-uvc-followup-v2-1-487541656e83@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-May-25 16:28, Ricardo Ribalda wrote:
> Now we are replacing most of the error codes with -ENODEV.
> Instead, Populate the error code from the functions called by
> uvc_probe().
> 
> Take this opportunity to replace a generic error code from
> uvc_scan_device() into something more meaningful.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

I have merged this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

now.

Regards,

Hans




> ---
> CodeStyle and refactor patches after the last uvc Pull Request.
> ---
> Changes in v2:
> - Patches 1-3 will be handled by Laurent: https://lore.kernel.org/linux-media/20250523125840.GG12514@pendragon.ideasonboard.com/
> - Properly propagate ret value. Sorry about that :)
> - Link to v1: https://lore.kernel.org/r/20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index da24a655ab68cc0957762f2b67387677c22224d1..04552da114354128b0cc8fb25e1cc645498ac323 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1866,7 +1866,7 @@ static int uvc_scan_device(struct uvc_device *dev)
>  
>  	if (list_empty(&dev->chains)) {
>  		dev_info(&dev->udev->dev, "No valid video chain found.\n");
> -		return -1;
> +		return -ENODEV;
>  	}
>  
>  	/* Add GPIO entity to the first chain. */
> @@ -2239,7 +2239,6 @@ static int uvc_probe(struct usb_interface *intf,
>  	/* Parse the Video Class control descriptor. */
>  	ret = uvc_parse_control(dev);
>  	if (ret < 0) {
> -		ret = -ENODEV;
>  		uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
>  		goto error;
>  	}
> @@ -2275,22 +2274,19 @@ static int uvc_probe(struct usb_interface *intf,
>  		goto error;
>  
>  	/* Scan the device for video chains. */
> -	if (uvc_scan_device(dev) < 0) {
> -		ret = -ENODEV;
> +	ret = uvc_scan_device(dev);
> +	if (ret < 0)
>  		goto error;
> -	}
>  
>  	/* Initialize controls. */
> -	if (uvc_ctrl_init_device(dev) < 0) {
> -		ret = -ENODEV;
> +	ret = uvc_ctrl_init_device(dev);
> +	if (ret < 0)
>  		goto error;
> -	}
>  
>  	/* Register video device nodes. */
> -	if (uvc_register_chains(dev) < 0) {
> -		ret = -ENODEV;
> +	ret = uvc_register_chains(dev);
> +	if (ret < 0)
>  		goto error;
> -	}
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	/* Register the media device node */
> 
> ---
> base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
> change-id: 20250509-uvc-followup-d97ff563df95
> 
> Best regards,

