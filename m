Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8232EAB8F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256058; cv=none; b=A/ZenIrpOui7k9wuBJIFXUJzokP0fCnOWNQNH9EAb4lQGOL2rQ2f4nMM04EI/c+igujJ6DB4ykwRcAA0pPv8aFpkWakSsbRcZX7rz6Fr3h6wI0Hk51AXcIfVt9y86uT6ZWTkcCTUv7b6qj01T4IwH5fl++iokiY0ae8xoolwgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256058; c=relaxed/simple;
	bh=jgVt/SVczRVLibj05dhADNEqt5586mqdr4CTTYtoNFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyHA520eepvKIteyEkyAUK/BtatWCNJ2s43aFgf75OaAka0zmHX71vx4KW3VLlG9TCf0U7GPkQnvOoCsD8JOji6xJsYSryB7Kmg6ftCZpq8IC1fD66L2Esr5hOhKL0t/ZKSsyB327mZ0MDV8xkpVDl+pYH25mM43ac1Jn8kiN/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LgFvDucW; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LgFvDucW"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a58c2430edso9194691cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750256055; x=1750860855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=445YfBoLgx6LDox/kScDprx/fKxzHTT51XDkZHjyT1M=;
        b=LgFvDucWNS3hJwus3xKWv1vyBS2/bpGk+hvBZfypu13o26CumgRQLROc62ZgmTE59J
         zAxPgVQFv+/RK9DKqWieW55hlhTBLcrjDCmNnBbSKfT6wj63vT1iL1Xprh7U+V0q751l
         +sD3hlDmOpLA/UuGAAYo6NOUAHhWPTv8lraH47p3HEyO1sdnkreKQAH7IvkIWt/FLuWJ
         Yj+JP6p18ynBHb7K+1GHzu4WN7RBtszYatiVYfysa+HFjibqM/07u3i8vlg3npDYUPab
         c7fhflzuq0tejFNUX56pZ/+L7B1UwPyMx6gTp6eIcIYuFSX4WFASXwptcURkY23Or18v
         24Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750256055; x=1750860855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=445YfBoLgx6LDox/kScDprx/fKxzHTT51XDkZHjyT1M=;
        b=TVBt+vvhA6BdRZejoGW7mxUy+tOokjZE9e3eVfTJMhYONuS8utrNQzGVTkd7VUuAIc
         LAF6r85g9T1k/+oU5Ybp+9ZD4pqtgCEkqCOUXL1mdez0qJY1YbhNFsNQiSrppjnuqNHd
         dnK34kFiJ6IsEwf5gortnTOlw9UVtX9GHgMTQQQuTdaAIPjVFXox49ARqj2fRsuhFoGN
         Ugm54GBTAHYOqRdh5We9/4aE+RjY7JXIrMtO1/n0j8x4nwbZmosFam1siSnMz2wZwyhi
         M/I2nEghZ+uG73yvZV0EvW0VGKsMvhMalRGoVDlLAkQsGDalTHGkpBRFCeS79f9ZUzIp
         wB5A==
X-Forwarded-Encrypted: i=1; AJvYcCWRHJe4YjflAQBBia0XpI9m04yWfrrNcm52sIY48XGmZYus5XoMcmagderEN/FrppVUOmeJMkexm3YiIbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOuU/YwOhujzCblyK1LUIlUCtOj6Cvye63MHnSwUU32a03tV6/
	RfV4Emtcvw26FnXx8ENu9p73tbGB67Y/3ILcKLSdSBabz7YliNxrYFFOpwhpmGbreQ==
X-Gm-Gg: ASbGncv19FYYKmJPX6/jXcICJaQq7Oi3/zU4AlTTfW9kTqdjP9npIbRD8gzLrG5mO3A
	I/VCxpv+oXGKIURM+7pxr1GpFpZr5Jgw08nPxL/wi1zuZW7CvcvC73gzOjbdDaOVgtmKzoMABEW
	qHFnFObKI1+yUdpvPfnY/6/izco4uX6USAGDQHk9RD2VzcnxowC0WgiBBjHDIddNRsEhzbB2Ds2
	AL/WvifXqQ5ylsRkypeMHIwRKCSC274svZ52rBGL5VrELYPCTl6KaDVbYkQG7kYq5WwPWHL7y8a
	KeJHIIVmP3ydCpLrSxLn7cTMbbSdNP6GGZzd9V7wBvt1dYFbleRZcj2Wgp6GOf5JhGOOyNN3oUS
	upwmW
X-Google-Smtp-Source: AGHT+IHon8Mt+YsDs98sHoA4ASN+0uvnNj4bHx3zdDrXtra2R2s63h6+oRbtKgKxWOhcIXxSFRCvgg==
X-Received: by 2002:a05:622a:28e:b0:4a5:8387:8b8d with SMTP id d75a77b69052e-4a76458bc51mr42956371cf.21.1750256054965;
        Wed, 18 Jun 2025 07:14:14 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4cfe51sm70916891cf.58.2025.06.18.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:14:14 -0700 (PDT)
Date: Wed, 18 Jun 2025 10:14:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, andreyknvl@gmail.com,
	sylv@sylv.io, u.kleine-koenig@baylibre.com, yanzhen@vivo.com,
	namcao@linutronix.de, krzysztof.kozlowski@linaro.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: dummy_hcd: Use USB API functions rather
 than constants
Message-ID: <aec873ff-5d0a-4071-8043-fb901ece9141@rowland.harvard.edu>
References: <20250618065750.816965-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618065750.816965-1-nichen@iscas.ac.cn>

On Wed, Jun 18, 2025 at 02:57:50PM +0800, Chen Ni wrote:
> Use the function usb_endpoint_num() rather than constants.
> 
> The Coccinelle semantic patch is as follows:
> 
> @@ struct usb_endpoint_descriptor *epd; @@
> 
> - (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
> + usb_endpoint_num(epd)

You could make a similar change for usb_endpoint_dir_in() or 
usb_endpoint_dir_out().

Alan Stern

> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 27c9699365ab..21dbfb0b3bac 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -623,7 +623,7 @@ static int dummy_enable(struct usb_ep *_ep,
>  
>  	dev_dbg(udc_dev(dum), "enabled %s (ep%d%s-%s) maxpacket %d stream %s\n",
>  		_ep->name,
> -		desc->bEndpointAddress & 0x0f,
> +		usb_endpoint_num(desc),
>  		(desc->bEndpointAddress & USB_DIR_IN) ? "in" : "out",
>  		usb_ep_type_string(usb_endpoint_type(desc)),
>  		max, str_enabled_disabled(ep->stream_en));
> -- 
> 2.25.1
> 
