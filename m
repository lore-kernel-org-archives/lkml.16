Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28E23535F
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751218099; cv=none; b=L9LSu869tBF5boqDvtz2mAkYTgeKeidxiZqkQ54b1ngo/hyHPGuvHtqHCKbvQJBW8d3fSAzizeHV9r0VEO5Yo6JbHrgCl830bfp3JPIrkx9a/Y1lHaOuR467NaETJhraMW1Lt5Y9PuH/W7NTQwVzu6k56weqX7jPXLPA7AW3Byk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751218099; c=relaxed/simple;
	bh=J9YDXD4duvC3Wk7QUO6r6W8l64XMHZU2uOpTsU+NisY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEK6ErK07zh+r5APFpOWQ5W1Ngsx4+C/7BjAS1+CNFm1GT8g3QEStM3Lkqe5tjS1keXcNd2Ir4wIsKvyVpriP0UydTPgVPvJR4x6U7yEh4ZppSB3lJhHs9hep061W5mWxe4mTeQe2OiKZ3ucLipULqnC497x4IbbvFW+sxDSDDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XcPaWi90; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XcPaWi90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751218096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uGHkUjNmjIIMPgTkRg7VREABnqYi+wWbJyf4AWH8+h8=;
	b=XcPaWi90oJGNwjx6kS2PFVlXoLSz3UEhlfY9E5/g6n86JIK25PImY++CKoKzN96d7H9Hzi
	S2dwmE/TZ4tGNgMEvnvKrC8uw49t0MhrdgSLLVDDOVRM7PQD2YGxDu1MS+s0FJMkZDfzey
	75zk1h+QXKG+U/v1aYgRmSyuFbawlG4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-GMirq5RfPhedXEsCezeWLg-1; Sun, 29 Jun 2025 13:28:14 -0400
X-MC-Unique: GMirq5RfPhedXEsCezeWLg-1
X-Mimecast-MFC-AGG-ID: GMirq5RfPhedXEsCezeWLg_1751218093
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d64026baso18145785e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 10:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751218093; x=1751822893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGHkUjNmjIIMPgTkRg7VREABnqYi+wWbJyf4AWH8+h8=;
        b=bHCjvOHpl7rYxHeJa+MS51QXuLwR6FI8NJY7XPx9epp6i+p61qBfRIU5AsiLtJIk0l
         g2IRP8pKBi9TCv/qAXNfyl2xqechpiKECaMiqzcP3TneXafMhQ3JJBuMAEc3ZXLUvC0u
         GKObABS5TILUKXQTHTBKQ1Hx5fp+t53pGH2wvzIG2y74VlnIOEoMtWvsJsJBjGwoyFjS
         lpvRIjWgLVp6GhcQZhj0KaF5StqnqCJRW0PfbmmYQxpl2yLDfFzvbg0pnyA0HJhb0taD
         jvUnzP+By2JMHVpXFaVvqapmdlhT+qwJT4cpl6uBiDYAjJhf5odWoAQfHqzZD9FpzJ7c
         QN/A==
X-Gm-Message-State: AOJu0YwYNGjHLt4nZn9RdiC/1RY22EeHNXua37KRFKDXcW/7gHfdiDP5
	n/LneGYNl2wIlfz5LZeNB+8R25m3Kp7KaJc0CF/qf9VLyL9R1e+Qnhhy+NBRKZFYdDA/bbUvlWc
	KbzhL7LvpgRY5EAN8MAz4WUCrNJqS+rO6XbggWHomxao7Wc5o7bA0ydEmIL6VKlkHbQ==
X-Gm-Gg: ASbGnctW3TXTMqohFT5rru43nfQjkYuDjVlMPRHvL4hrX9kIJ5BHZqg3XfCM/Iy/7Id
	xUOKwR9cHf2MzFanbDig5YCysQKvxGpnwaIilPIptiRgQyRuO45cg7ym3l86mgnbF0v0SsB0diV
	KyaShhynQu/zuVtma6E1dUP35ju07s+cM7TuJXxQrIkPiVo2rIXwNiwOnebE8Ta92RHQL6/ZV3k
	AGCULoXYMG5EQeORfo8iUdEd4DFrLgTYfISHkqMZw9QHhtlMI1BmUUqKuBCnrcULoBYWjJTUqNE
	I5gMHPJKmGqLVJWj
X-Received: by 2002:a05:600c:6095:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-4538ee504demr102969815e9.7.1751218093061;
        Sun, 29 Jun 2025 10:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9HJ2OfndwPMREYIRxXW8JXGourHIYbXzVyfj8L8gZMgZLg5HRsqQ4PckajVtmi25Hd1plTA==
X-Received: by 2002:a05:600c:6095:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-4538ee504demr102969455e9.7.1751218092114;
        Sun, 29 Jun 2025 10:28:12 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59736sm8185715f8f.74.2025.06.29.10.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:28:11 -0700 (PDT)
Date: Sun, 29 Jun 2025 13:28:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, Parav Pandit <parav@nvidia.com>,
	virtualization@lists.linux.dev, stefanha@redhat.com,
	alok.a.tiwari@oracle.com
Subject: Re: [PATCH RFC] pci: report surprise removal events
Message-ID: <20250629132113-mutt-send-email-mst@kernel.org>
References: <11cfcb55b5302999b0e58b94018f92a379196698.1751136072.git.mst@redhat.com>
 <aGFBW7wet9V4WENC@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGFBW7wet9V4WENC@wunner.de>

On Sun, Jun 29, 2025 at 03:36:27PM +0200, Lukas Wunner wrote:
> On Sat, Jun 28, 2025 at 02:58:49PM -0400, Michael S. Tsirkin wrote:
> > At the moment, in case of a surprise removal, the regular
> > remove callback is invoked, exclusively.
> > This works well, because mostly, the cleanup would be the same.
> > 
> > However, there's a race: imagine device removal was initiated by a user
> > action, such as driver unbind, and it in turn initiated some cleanup and
> > is now waiting for an interrupt from the device. If the device is now
> > surprise-removed, that never arrives and the remove callback hangs
> > forever.
> > 
> > Drivers can artificially add timeouts to handle that, but it can be
> > flaky.
> > 
> > Instead, let's add a way for the driver to be notified about the
> > disconnect. It can then do any necessary cleanup, knowing that the
> > device is inactive.
> [...]
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -549,6 +549,15 @@ static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
> >  	pci_dev_set_io_state(dev, pci_channel_io_perm_failure);
> >  	pci_doe_disconnected(dev);
> >  
> > +	/* Notify driver of surprise removal */
> > +	device_lock(&dev->dev);
> > +
> > +	if (dev->driver && dev->driver->err_handler &&
> > +	    dev->driver->err_handler->disconnect)
> > +		dev->driver->err_handler->disconnect(dev);
> > +
> > +	device_unlock(&dev->dev);
> > +
> >  	return 0;
> >  }

thanks for the feedback. Would appreciate a couple more hints:

> No, that's not good:
> 
> 1/ The device_lock() will reintroduce the issues solved by 74ff8864cc84.

I see. What other way is there to prevent dev->driver from going away,
though? I guess I can add a new spinlock and take it both here and when
dev->driver changes? Acceptable?

> 2/ pci_dev_set_disconnected() needs to be fast so that devices are marked
>    unplugged as quickly as possible.  We want to minimize the time window
>    where MMIO and Config Space reads already return "all ones" and writes
>    go to nirvana, but pci_dev_is_disconnected() still returns false.
>    Hence invoking some driver callback which may take arbitrarily long or
>    even sleeps is not an option.

Well, there's no plan to do that there - just to wake up some wq so
things can be completed. I can add code comments.

> The driver is already notified of removal through invocation of the
> ->remove() callback.  The use case you're describing is arguably
> a corner case.  I do think that a timeout is a better approach
> than the one proposed here.  How long does it take for the interrupt
> to arrive?

It's a virtual device - kind of unpredictable.

>  If it's not just a few msec, consider polling the device
> and breaking out of the pool loop as soon as pci_dev_is_disconnected()
> returns true (or the MMIO read returns PCI_POSSIBLE_ERROR()).

Yes but with no callback, we don't know when to do it.
The config reads in pci_dev_is_disconnected are also expensive
on VMs...

> If/when respinning, please explain the use case in more detail,
> i.e. which driver, which device, pointers to code...
> 
> Thanks!
> 
> Lukas


It's virtio-blk. 

