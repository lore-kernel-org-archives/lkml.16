Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2001218A6BA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738773885; cv=none; b=mACPW7u9SfyJDt3CaA31rLkxy9ub2QTF8ESR9vnwCMrYXFHefm2QPp3DYUdfcYf6QcpDwCKtuJLrk22I+onRk/Nerq+oz9LFqUm443WnA6XP9OeB67ENHGm4pwDpn/JHsJMuvG3W0XmxqBSD+0EdSlHXQLo2skijLt1O4Z0eTcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738773885; c=relaxed/simple;
	bh=bBU+pt61zyAtW2Ud1OYyE3Ce2NAzO80oqdMnELCX/GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4Tk1/9wyID2G+S4e0LjSDc+4ablgBgnC5M0nxfPtBtubksdSGMKgTvkmatZGu52I/a68/JJcz5x98E7LKuoLbtypG26wGNUTYm0zSXiZykKikGOnSz7Z8SHcPpsX4SVTBoSgxB8FDhAerO36QTjVmNvZhghu3y0xv7/eaMOemc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QeiPBh2J; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QeiPBh2J"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4678cd314b6so13301cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738773882; x=1739378682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjoGXlkAkW/LVx7Wgz5EofRxkYv+KJC4KXFoMOpGEvk=;
        b=QeiPBh2JbO6rVhZA1hyLVAaaLxWulf6Xwy/FPxBtxqntRjb11SzXtv6WVKtXESqYPJ
         Hp2N+jYFF/CnMdhnJQy0K560vNFnv4SULoXWWWl3nlcPSGmj5IH59oAtBNIhefa+1UH3
         LbRWEm9RWjExsJoJ/xwSqyGcpWdR+TfhtIlUmSwIi/qgty773D+/ViasyThjwRNq0o31
         9k32m3JchRNlW0V463rOKK+ceZxa1A5DW7o4eEUHddPevLJPSulRIOGIYRMarPMn7cKh
         FOKsIlIvWqJ+DvBX/8cnaz4advKktJKo8A6ZRXL21zU3dNeA6R0pafilgDYF2hx2ccZZ
         oCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738773882; x=1739378682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjoGXlkAkW/LVx7Wgz5EofRxkYv+KJC4KXFoMOpGEvk=;
        b=dkVfAU4PME3ePw0SkuYX43q+3oQqrYKlVU5KiXoXUi1HuwxnHRJea6gX4Xp9D3y6PU
         eUcgNkPIIpth40fMxmTFVOV9AvHnjJT2l4kVcv7kNzW7Gxi2C8il7+hR3a3ep2fLDWws
         l09sSRQxfDzEVCjxbhqQNuWjzWoDOS6ngm95Vjt0CWn876nx8b9Kq02T/f7QQO2XtL5K
         qlOvZxBDoWvSyOqMGeZ/5WWvaxDEk4uxH7DiBuwcBNVrlxf7XaF0ErxzMy8VOt6xNUkx
         nMATzJlBoI5QU3HnpwdLDVxMxdeZI6mub8zKxuZ/JS80IQxxn3wgQMqsSWXGARpqLrcc
         gXOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr8v5iKH7CYS4pqte3WVrSXJhsXaeLDzeAFZvq8Yf7jGGcKqJMtHHHij64L9hVaF4XE2MeY03rrOiM76g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd6TOU/GKOUhpuslQS2Pi2A4Xgax2Cecs3woT4VMQt2c9niyGs
	OTGIiPtUA3Cx7AYE6nhDxD91hHfIavZTBPekXQ77JcqI/XX2HIFzfZtZAXINrA==
X-Gm-Gg: ASbGncsNghV9DNVzM4eZiDF/U9BbHjmCZrqaj5T7KRc8ryaDxR0jO2EyhsVfC0vhQil
	fBBmwMb+upehxPAsM/lEHAaeu9dxcFw9dq7e+PhgeDzz8HPVN+UbTa3GbOQ7NAUeC3/x9RpoDdD
	psoebbaLZUF9A+H1EXnzlHpEw1OsqD7hVsuPJpxyD+xZ+1NFxCFg001sUfYpfHx1p979xLpALNc
	FWPqZl5eLdJZCLP+eeEUX8F7qiHVFvENO5SGw/lDMfYh9Iubi2iVKoL1gEKwZ9VDLiDeL09p6/a
	Q5bJqd+woHal3l0FHNg5QIolf/RuimWn/MIf85HMgtbvHt2iJdkC4Hlq7jzyvgcWz+FLcFLJaHT
	MJm6n3wKa
X-Google-Smtp-Source: AGHT+IEJJIFFkoN3GGHuFCIeaeqDpk11sq27Z6ttoSKnjS+COwjd8IQQqwUcMadaS0VY1/XoRDycYQ==
X-Received: by 2002:a05:622a:81:b0:46e:23bc:8589 with SMTP id d75a77b69052e-470281b8dcdmr57411681cf.13.1738773881979;
        Wed, 05 Feb 2025 08:44:41 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-21.harvard-secure.wrls.harvard.edu. [65.112.8.21])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0ceacesm71401691cf.31.2025.02.05.08.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:44:41 -0800 (PST)
Date: Wed, 5 Feb 2025 11:44:39 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Roy Luo <royluo@google.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org, elder@kernel.org, crwulff@gmail.com,
	paul@crapouillou.net, jkeeping@inmusicbrands.com,
	yuanlinyu@hihonor.com, sumit.garg@linaro.org, balbi@ti.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: core: flush gadget workqueue after
 device removal
Message-ID: <f083ad19-bea8-4a51-834c-14d6810699fe@rowland.harvard.edu>
References: <20250204233642.666991-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204233642.666991-1-royluo@google.com>

On Tue, Feb 04, 2025 at 11:36:42PM +0000, Roy Luo wrote:
> device_del() can lead to new work being scheduled in gadget->work
> workqueue. This is observed, for example, with the dwc3 driver with the
> following call stack:
>   device_del()
>     gadget_unbind_driver()
>       usb_gadget_disconnect_locked()
>         dwc3_gadget_pullup()
> 	  dwc3_gadget_soft_disconnect()
> 	    usb_gadget_set_state()
> 	      schedule_work(&gadget->work)
> 
> Move flush_work() after device_del() to ensure the workqueue is cleaned
> up.
> 
> Fixes: 5702f75375aa9 ("usb: gadget: udc-core: move sysfs_notify() to a workqueue")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/udc/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index a6f46364be65..4b3d5075621a 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1543,8 +1543,8 @@ void usb_del_gadget(struct usb_gadget *gadget)
>  
>  	kobject_uevent(&udc->dev.kobj, KOBJ_REMOVE);
>  	sysfs_remove_link(&udc->dev.kobj, "gadget");
> -	flush_work(&gadget->work);
>  	device_del(&gadget->dev);
> +	flush_work(&gadget->work);
>  	ida_free(&gadget_id_numbers, gadget->id_number);
>  	cancel_work_sync(&udc->vbus_work);
>  	device_unregister(&udc->dev);
> 
> base-commit: f286757b644c226b6b31779da95a4fa7ab245ef5
> -- 
> 2.48.1.362.g079036d154-goog
> 
