Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8FC1B414B
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738428747; cv=none; b=FlYXruQEIwp80qI2FyzBGEYRbsEEhM0J627tHRorMSOf93IM9DTzXoeYJdfT7Pkjmzu9mk6WzwW0mhcQ1JvD4kdrfdslodudohZ3wvX0KENUFLzOmDO6uBiCCgBHJMT6f/GXA5B5o2T5isSS2p1jBDQcFXpBqYoL0x0MU7nVetM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738428747; c=relaxed/simple;
	bh=gCtG/jFGjrcsXe7xZYLZmn1i/3qGDb3fc0Hedn2u03U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1fC08z9eGWPsYDfCyr58cgR46hS8RoNC4dVkY2UWfKpGN+7Jd7La/Wj1AZ//GQR/riH7nm+rT4e20saqN13tLXTW5KLSrYnLlesK+1b1cdbwmk3MW6aJkoQGK5wTnrlYyH4qrPO0LbJLR2n4Zc2/yJgswVIRw5MCp1IEjnrBB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vXI0a4ON; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vXI0a4ON"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dd15d03eacso28186966d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738428744; x=1739033544; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PYpQCJZZSmC5M37Y3PqZdR3AwdY9Yn3FSt/ozL9qEEs=;
        b=vXI0a4ONhbe8vlDK6hr+wWiVKItmVa4Gcbm3nlkrJq91XIsXG7Q2TnkeDrnwLYIeLv
         1cL32J9QefJ7DoiIFwwLIh7EKdpiPqe533a779PcHZDPZSJ6DtAtz0lGw3xLeDb0S/ka
         PfE/wuyNlIxk/cqH2BNwkA8yMOL0WG0Q+woV7QKbbOQkL/KJVYkY4RXJYH6c69ZPHgLw
         mXnS3/JGCHYJRZZpup+GzB7O1VLzioN+T3LSEA655VfO9kxnhWq8cjdD+X4d8Cgusf2m
         huX/tBDXfm5JcY7Je5FNclfmQ98I+6DrmRulC5AUF5Ht/VTJN2UFyBmQLQkT3t5JdS7T
         GnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738428744; x=1739033544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYpQCJZZSmC5M37Y3PqZdR3AwdY9Yn3FSt/ozL9qEEs=;
        b=eH31hGJFmHLPL+P71IC/zaHWFbWXfDw4rDYcIm1AECrppLxqJAn3+Po5cO6CLkb2Rw
         JvKugKcn0RMvsjRoS28Ia85J15WyQAto+dsUcH1Y8Vch5EwZG8Pqo/U9hXUlW+JGWdfT
         LIsGUPheQq0FXtbzYSs9VnVBu7QLhNu3CTDDqlLEUKlMk15dvLISo+oyqBZEdgEUCYs6
         gkZw6zpDtzHSAjjVu2Vco6TMXe9PNDEOnyhBP7JrKey5YvHM9j/rQJEjpiFwp/nAdsOy
         3SU1X0cCFNB/c2NvqGZ+9Cm/ElbBhqvHafpLg6guckREqJG/v/gNKmDRpcLdHNAYddpu
         ge1g==
X-Forwarded-Encrypted: i=1; AJvYcCW8lolj24BSa9RXjXu7sB8oA/0ra+idanghdqf74i5bxJWGwi9g0zvT5ZIBThUazgGzu8Y3OmyasjMRP8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFt0e5EhSCo5NVQdtKyMVmiJgF+RiGsIaboiyv6ASQX+FkFUje
	vW6xpkRMT81O+YMCOWmVZVNDwF1BPZFBa/EYJGM7pBwD+2b2jdX/Pk/RBgrYwQ==
X-Gm-Gg: ASbGnctWmGsVrV9w+7GwiwM1gE3zrSjU3fjS9a7W05s3uZQn4cJ+ZHsCT0jidiS2Imw
	CIMBcyqaJZed9fpOSZ5L7sN+kzObjxu6OuEmqIRUZ3qC3xdbAlMb83aJuv169nADjJRvWI3rYno
	E4tFNw09tKHWLBucc32aJ2XM0rsBhXlFK9c0VhzC0bi3ms+/SJALykHRamzEOSwHNCRVbdCHFzM
	gK7ngt7RKN0zcNHRo9AD9Z3glmt6MMkf/op2WWT3XPYMcGx1e1otpKIJ3oaK8/TfdUWLW7SVY1Z
	iI2AyW7ndL7mF5r8
X-Google-Smtp-Source: AGHT+IFFUz1gzgxjmm2jBci03Jh1krPotRpqPAcZQFReDIbnrUfHqEfun0tWgh7gPn+hsXp0/fWqYg==
X-Received: by 2002:ad4:5aeb:0:b0:6d4:1613:be3e with SMTP id 6a1803df08f44-6e25b0a41dcmr103944546d6.22.1738428744006;
        Sat, 01 Feb 2025 08:52:24 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::2aef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254940c8bsm29777996d6.100.2025.02.01.08.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:52:23 -0800 (PST)
Date: Sat, 1 Feb 2025 11:52:20 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Roy Luo <royluo@google.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andre.draszik@linaro.org" <andre.draszik@linaro.org>
Subject: Re: [PATCH v1] usb: dwc3: gadget: fix gadget workqueue use-after-free
Message-ID: <db8819b7-05d5-468d-8974-3dfae25bbb2b@rowland.harvard.edu>
References: <20250122024452.50289-1-royluo@google.com>
 <20250128014400.7jx4segwn53vjnb5@synopsys.com>
 <CA+zupgwLfzDvVF+5psdbuUgZb_mCNqXtxS5=b1RtTAjQKq6AuA@mail.gmail.com>
 <20250131234407.fyv4iu5yadp5xeg2@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131234407.fyv4iu5yadp5xeg2@synopsys.com>

On Fri, Jan 31, 2025 at 11:44:17PM +0000, Thinh Nguyen wrote:
> Cc Alan
> 
> On Fri, Jan 31, 2025, Roy Luo wrote:
> > On Mon, Jan 27, 2025 at 5:44 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> > >
> > > On Wed, Jan 22, 2025, Roy Luo wrote:
> > > > `dwc3_gadget_soft_disconnect` function, called as part of
> > >
> > > The dwc3_gadget_soft_disconnect() isn't directly part of
> > > device_del(&gadget->dev). It should be part of disconnect.
> > >
> > > Can you provide the full sequence of events so I can have more context?
> > > The handling of the flushing of gadget->work should not be part of the
> > > dwc3.
> > 
> > 
> > Yes, it's a part of disconnect, and disconnect is a part of gadget unbind.
> > Let me try my best to explain. Here's the call stack for usb_del_gadget:
> > -> usb_del_gadget
> >     -> flush_work(&gadget->work)
> >     -> device_del
> >         -> bus_remove_device
> >         -> device_release_driver
> >         -> gadget_unbind_driver
> >         -> usb_gadget_disconnect_locked
> >         -> dwc3_gadget_pullup
> >         -> dwc3_gadget_soft_disconnect
> >         -> usb_gadget_set_state
> >         -> schedule_work(&gadget->work)
> > 
> > Then when usb_put_gadget is called, gadget could be freed before
> > gadget->work is executed.
> > -> usb_put_gadget
> > -> put_device
> > -> kobject_put
> > -> device_release
> > -> dwc_gadget_release
> > -> kfree(gadget)
> > 
> 
> Thanks for the details!
> 
> The UDC core is initiating and handling the gadget->work, so the
> flushing of the gadget->work should also be handled there.
> 
> Since the usb_gadget_disconnect_locked() may trigger a state change work
> on unbind, the flushing of the gadget->work should to be moved to
> gadget_unbind_driver() instead:
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index f8c1ef465e45..9e4abd6e40f8 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1568,7 +1568,6 @@ void usb_del_gadget(struct usb_gadget *gadget)
>  
>         kobject_uevent(&udc->dev.kobj, KOBJ_REMOVE);
>         sysfs_remove_link(&udc->dev.kobj, "gadget");
> -       flush_work(&gadget->work);
>         device_del(&gadget->dev);
>         ida_free(&gadget_id_numbers, gadget->id_number);
>         cancel_work_sync(&udc->vbus_work);
> @@ -1694,6 +1693,8 @@ static void gadget_unbind_driver(struct device *dev)
>                 synchronize_irq(gadget->irq);
>         mutex_unlock(&udc->connect_lock);
>  
> +       flush_work(&gadget->work);
> +
>         udc->driver->unbind(gadget);
>  
>         mutex_lock(&udc->connect_lock);

What about instead moving the flush_work() call down just one line, 
after the device_del(&gadget->dev) call rather than before it?

The work queue doesn't need to be flushed every time a driver unbinds 
from the gadget, only when the gadget is about to be deallocated.

Alan Stern
