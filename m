Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA720102D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221787; cv=none; b=I0ODnNqXc9caYhAogFUoXqNcXz1864kC4FluH7JyI+ulzOG4PGlux88h8jj/5sdOyYIh2xw4LQLp6DW30Xgo8e4ViElfFePlg2ldYMEdH19gloeFh65XpX+gJ1w6AdDf1KuM3q66URfeZ1A1KdbnKnsR99qTiygzmj2G5073H+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221787; c=relaxed/simple;
	bh=EfetSGfqB81IHkN/PGxR2QwCQXA/JyJpHsnfb7Zgb8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5iJdN1f7BJsVPWJGMUrCnFuHiX2SneQp6UcdK39YMJaLXvazgaGwzXF+FUKcd11mKG9Wa1ZZQkyqMw7wtXhnUFgRZ4VBXOOIp1pDYR9by/u0sT4DVRVpi+ONILh/7MlE3dSUZgcaSODFle9E2xb7K6XTga/Y2VY8UiFQ2CbXks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aNof1HXb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aNof1HXb"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5fbed53b421so10742499a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747221783; x=1747826583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btVpNFKgUcPUatiYhN505Sc3nSf9yR9Iw/noU9VBOO0=;
        b=aNof1HXbRXUR1cH1MIz/DrVjWmj9beSY3mN2uy0ppmjZ7oZEiwamT++74sUtBaBBRo
         OPIjo7nc0f7nkcwA2jf7KFTiwNiAK02GB8SD5y01g2vOK375MOVkTHVQs73yWV10MLeJ
         xlXJFccreWu3mi7pjk1O8kWAhmq9RV8vq8ekbNZiLkKthTaEoXfcubm/XdUrH67QyFZd
         WSCIj8CTjaJraMP0P+q4NDnzi+xbXQWZVcrVH4y/90+qTCxCrGjOgtZYJiu5otZM5iD2
         NT7lw+WoBCkx+qdD4eCfueUujEfnHJjTbb/SOzH58TzlZ+8Vo/OGn0ajd/MTNe7T3BEN
         SwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747221783; x=1747826583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btVpNFKgUcPUatiYhN505Sc3nSf9yR9Iw/noU9VBOO0=;
        b=FbXglrBR7QQr5yyu43wEpd127V5HsJRw/gsfCEn0/xbOG+2OkFeoz8tRaWsEAL1pRP
         pFPjF0iITmnDvJ4uhOdKoH9uQIKJ6ifMdqqsCtBS4Xlx0tmKrLsgQeqbrGrvW5m876hr
         /+dA78gKlvd2BvItMYsZaBdmFaGtwH66DAjtNSYGD15xv+f/Ugupuf5oHWKWsIysKXBO
         wXdXaCz0NBI73sYUV7Vny6DrDoCWCkKS3wyte+FCp049t8pRZICyLQKp3uCV8IUg70vH
         k0GI6ywAUpj+OtnhFihShQxcuzoiqo2l5YpLqz2J3LHkWGsVW1WOoCu+Ijqw/bDhFfOX
         kbiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLK9ybCOediJPCLZsv+SyqUP42k4e2LPIKVmE5/LTuuwLE9dnV1BPInjp9jPzOizOwrMXflGb0I/4BCYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9a1rrEu0xucwBE5rEBXglEH6s3KMmTZVDxeOMBESB3dX/uMt
	FJmcU/m/r5FEdYHvOQeb1YymWvwDzezxCjENPAyxHerDRkmBqIMgwPL0L7aSppbYx3U0IpYhFvd
	E
X-Gm-Gg: ASbGncutgd5I9i51YcAwQm3RlHYH4/UWC+XGg13KL8u70jkt9abJphoU9iAIJelW/Yf
	zldkRfdPr5XUzvab7V34aje3ELXfrgi0lj8VU9+wfzpEkJUF91IrzNPn8qsbWOGzSiFPciTtGyL
	iJYnFEwTVJYyoLq4ZHf27gar1D3tKelVWncfU3Wn9C9nm3Nz7r2MkGmkVNfSSKP0BjrGYj8b11E
	sJ61EI1Ni4y8T6QRURSdJvyKGHmgbEKOCdNWStlT/up53/4Yufvu29OjTaiSyBk+D4OdcIb3I1U
	00EWi3gYEUw5+2HQvhxem19PisPIE0/FzF2OFBfcDx+GmZVdwpAWyRHpzsJYDLvSkYp7aVBeLEC
	99afWtkpNd+LxF3z/Zi/ApOq/AxCT
X-Google-Smtp-Source: AGHT+IFd1ZVLlqOazM0JM6spYOaDAtNpkRG4R/J+DRb7NLGEkcdjusWFkZMkSqwh1fAuoOXWtmztPQ==
X-Received: by 2002:a05:6402:4304:b0:5f6:218d:34e6 with SMTP id 4fb4d7f45d1cf-5ff988dc0famr2575205a12.26.1747221783487;
        Wed, 14 May 2025 04:23:03 -0700 (PDT)
Received: from ?IPV6:2001:a61:133d:b101:9ea2:16fa:3380:8e40? ([2001:a61:133d:b101:9ea2:16fa:3380:8e40])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d700e6fsm8527536a12.62.2025.05.14.04.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 04:23:03 -0700 (PDT)
Message-ID: <51fe78fb-5d73-458f-b3d1-fc84cd6c5869@suse.com>
Date: Wed, 14 May 2025 13:23:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: David Wang <00107082@163.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, oneukum@suse.com
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250513113817.11962-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13.05.25 13:38, David Wang wrote:
> ---

Hi,

still an issue after a second review.
I should have noticed earlier.

> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -23,6 +23,7 @@ static void urb_destroy(struct kref *kref)
>   
>   	if (urb->transfer_flags & URB_FREE_BUFFER)
>   		kfree(urb->transfer_buffer);
> +	kfree(urb->hcpriv_mempool);

What if somebody uses usb_init_urb()?
  
>   	kfree(urb);
>   }
> @@ -1037,3 +1038,25 @@ int usb_anchor_empty(struct usb_anchor *anchor)
>   
>   EXPORT_SYMBOL_GPL(usb_anchor_empty);
>   
> +/**
> + * urb_hcpriv_mempool_zalloc - alloc memory from mempool for hcpriv
> + * @urb: pointer to URB being used
> + * @size: memory size requested by current host controller
> + * @mem_flags: the type of memory to allocate
> + *
> + * Return: NULL if out of memory, otherwise memory are zeroed
> + */
> +void *urb_hcpriv_mempool_zalloc(struct urb *urb, size_t size, gfp_t mem_flags)
> +{
> +	if (urb->hcpriv_mempool_size < size) {
> +		kfree(urb->hcpriv_mempool);
> +		urb->hcpriv_mempool_size = size;
> +		urb->hcpriv_mempool = kmalloc(size, mem_flags);

That could use kzalloc().

	Regards
		Oliver

