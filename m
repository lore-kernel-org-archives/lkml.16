Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51844207F
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265563; cv=none; b=FAIi6nTuiVOiOZLdZ4nnUF2RDDIAVQ1oSGjzeQAI8AV4Vbjx0Y36LeZWHhvj6ovXqzOdWxFUW1YkXqBf6z7ANW6Lbf1aDCjufHMmXpPyN770zpgifRjfo5hyLZpVURZVBS1++gk9PNXSp2qrUFovhUBtpjirCZ5bDM689jvgHz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265563; c=relaxed/simple;
	bh=TnHMtSIQdfgTrSYZfOIn+bJceWWCtXySHQoZZwR3tJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfbfIWkVqf+f+fFq2+0ouErFIICMiiWMxTcKE+X7UltWImks/E/tJSQBnUUInZnSiZl7KGD9bH5/4llTJZv+SK0jxxxUTCM9vDOBdEz4aKTZqUefK3flfEnVCq3KNDxiqNtoufss+QgwQEQPniAOj4edJVPa7mL8Q4Ety0yCUJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DKqssMFa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DKqssMFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748265560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/tBZmmo1EqsgCeZ8q0clS1poQRevKNeOHcK0UlnsVk=;
	b=DKqssMFaywngTvHAzKoNo8E3Oab342JwLHPqAOAeCcCkEAp851ZDAxAI5qQj7QP6fjgqAE
	SCe8fJlmqajvUsXRnP9Oxg/RgXKE2U/LIJFA2Zhnlnoh9T2wuWAk+vA2Cr8oW4G3117hrW
	ZfTj3EYkfGDbVfY5zWeERLrpRsNleFs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Z--LIX2LObmUaCd-6Pjx3w-1; Mon, 26 May 2025 09:19:19 -0400
X-MC-Unique: Z--LIX2LObmUaCd-6Pjx3w-1
X-Mimecast-MFC-AGG-ID: Z--LIX2LObmUaCd-6Pjx3w_1748265558
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac79e4764e5so237036466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265558; x=1748870358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/tBZmmo1EqsgCeZ8q0clS1poQRevKNeOHcK0UlnsVk=;
        b=dlYEz4Y53fRV4o/AU4bIaEDC83SvuxcQXo/Jwl14gzxC/H12yHYzHm42f6BGMSZGnF
         WdbI60pY/R9C7l+5hrfIWLqbDaFLrk7IVpg9ZE+J12dICvmVR5H5FXT87QCy7taKGAuv
         HMQ5aBcWR3AgryRTaq/PmEMuqRkFLwEYGhgkL2xb61ksiJNAp+xFMSf3a1AuWflZCZ0Y
         cqvZlnKgjkzE0fF03McqdNvm9CZn5ZrrTNo9C96r7R+98ZKabZXkz+wfjaMWFzrMmu+o
         8OlWaCU+7Mao3i/7TYqILoVg5qrCNaqFET3sblLdcxunYBMqxVIg06UczomePhoGycfD
         uGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMgYHYQq600iqGhJoStqwDoio0e0l6LAjEpyR/KZwQyaBaFJPnEJ8h5ojO62qjM4WgSQfd5STAKA/JhE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV6sX9AMqZ7HIJ8wXpmwZcHhuHw3dCKLApSWGpPy27nJNm/TCR
	58g1+LD3DuUb+nDJHQGfzCN2Hoxnn6wYVdmwPPf3yw2LLPDl9jJVQfz/PKyiIXX8IFGyb5fiRpR
	iM/EMs1fYYdlW/4MUhtQ+ukdyWezudFNky/zvCxzPVNbWo59qnNXIu9634yUfYsv4aw==
X-Gm-Gg: ASbGnctZ/iNiTxQztvDuVd1D8L7I+8OO4HBHK6C0VfGcpXUeGR4mfbt3aXrUBuUL825
	zpjZoyGdVh3CFNfGKN82EQ5YDQOVZhenZ6Xn2+8QQx/WCaxFYTT3mX4XgjkYe3OxQiJPoAxQ5ak
	Q3jRbMqhlC5ZG1K0Y8HpeOB4eyoustEpVDrwiYVqbSgFVRife+TQYY/nVunUzmwFebUfmJPcyTs
	fXp+hmwnTYhsnATP76UT2O7M/Z0qLuhGCboX74mwg4VmuwEmgILoddJBrKg6iPVhU9LERtkfHn8
	nL2T2t2BROkKEgU=
X-Received: by 2002:a17:907:7e93:b0:ad4:d135:cf68 with SMTP id a640c23a62f3a-ad85b1d7ce3mr797700866b.59.1748265557833;
        Mon, 26 May 2025 06:19:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXuqTVhM5WgSsTu7DeZ7j8SWBqOpvYfIvtpCQyF5ulgJbeJfGnJEfO/Jqx5e0CG2jkVYd8zg==
X-Received: by 2002:a17:907:7e93:b0:ad4:d135:cf68 with SMTP id a640c23a62f3a-ad85b1d7ce3mr797698066b.59.1748265557383;
        Mon, 26 May 2025 06:19:17 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04f263sm1671863966b.1.2025.05.26.06.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:19:16 -0700 (PDT)
Message-ID: <c8d83994-603d-4d25-aa25-e9a893692fea@redhat.com>
Date: Mon, 26 May 2025 15:19:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-4-f79974fc2d20@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250404-uvc-meta-v5-4-f79974fc2d20@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Apr-25 08:37, Ricardo Ribalda wrote:
> If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> MSXU_META quirk.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 54 ++++++++++++++++++++++++++++++++++++
>  include/linux/usb/uvc.h              |  3 ++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index fe2678fc795d7fd5a64e8113199012f34c419176..776d280f34afad515594a873acf075acf0438304 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -10,6 +10,7 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/usb.h>
> +#include <linux/usb/uvc.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/v4l2-ioctl.h>
> @@ -187,11 +188,64 @@ static const struct v4l2_file_operations uvc_meta_fops = {
>  	.mmap = vb2_fop_mmap,
>  };
>  
> +static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> +
> +#define MSXU_CONTROL_METADATA 0x9
> +static int uvc_enable_msxu(struct uvc_device *dev)
> +{
> +	u32 *data __free(kfree) = NULL;
> +	struct uvc_entity *entity;
> +
> +	list_for_each_entry(entity, &dev->entities, list) {
> +		int ret;
> +
> +		if (memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> +			continue;
> +
> +		if (!data)
> +			data = kmalloc(sizeof(*data), GFP_KERNEL);
> +		if (!data)
> +			return -ENOMEM;
> +
> +		ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id,
> +				     dev->intfnum, MSXU_CONTROL_METADATA,
> +				     data, sizeof(*data));
> +		if (ret)
> +			continue;
> +
> +		if (*data) {
> +			dev->quirks |= UVC_QUIRK_MSXU_META;
> +			return 0;
> +		}
> +
> +		ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id,
> +				     dev->intfnum, MSXU_CONTROL_METADATA,
> +				     data, sizeof(*data));
> +		if (ret || !*data)
> +			continue;
> +
> +		ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id,
> +				     dev->intfnum, MSXU_CONTROL_METADATA,
> +				     data, sizeof(*data));
> +		if (!ret) {
> +			dev->quirks |= UVC_QUIRK_MSXU_META;
> +			return 0;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  int uvc_meta_register(struct uvc_streaming *stream)
>  {
>  	struct uvc_device *dev = stream->dev;
>  	struct video_device *vdev = &stream->meta.vdev;
>  	struct uvc_video_queue *queue = &stream->meta.queue;
> +	int ret;
> +
> +	ret = uvc_enable_msxu(dev);
> +	if (ret)
> +		return ret;
>  
>  	stream->meta.format = V4L2_META_FMT_UVC;
>  
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -29,6 +29,9 @@
>  #define UVC_GUID_EXT_GPIO_CONTROLLER \
>  	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
>  	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> +#define UVC_GUID_MSXU_1_5 \
> +	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> +	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
>  
>  #define UVC_GUID_FORMAT_MJPEG \
>  	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> 

