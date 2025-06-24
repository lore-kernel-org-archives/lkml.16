Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE701EEA5D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763862; cv=none; b=VkIcmg9337Pk3TZr+FBTA0UOQt61eaEsesPdC+vb9OJUZzVO9n0gYsgKyG9OUP8Zr6WvatbvQMLipGvNtBDC7RBB+QNa8mqdjTssDPvGzTSisChqXyt9bpV1Fg8yZOyVo1w1lYLEzR54eJNjNTydk1CmYvICKf32cNCJoHH6M1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763862; c=relaxed/simple;
	bh=TWCQSXlqS0oYCQKX5vXnBkXZqPX6pMuj8xu6/6UTIFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jx3uF4orJf+lysdlNNaC+Rq1ISawk2jOgs3jhnPUfLQOsFgnVenYI4W6rqCKEeIJyzBqI+v5m8QBmscWNXMQaFfSkhOZXQe3zn1NYw10G13/fcAKQCeyiMaF5amZZOoAW/tLfm+04tu3/BS9KJ2b0xeVJ9L8oe6MP/99G7eX1rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=ZhCFvAHr; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="ZhCFvAHr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=4w0jGmjYB58yoIcY+MBPOFLj0Xm9wtH0W0ob4h2UOKs=; b=ZhCFvAHrLOPV6kmO
	BHLy7nWmyO8bsvA1UIQ+DCS3bieKWoaV9A5aJuNy/LcaALgvBqLoehhNMjZjWP3K+3VIV0K+Ojt5h
	LgdhIqNq9UwJuwK26PEt9fITCiWIlHfLSfLoBhI+8vwxyFGiCOHdZB7Nlhuyn1Hp4uZK7uNCOT7be
	BVY/8Sg95OJMNV+2QBr9XTcv1WRs98rKD/Tiemj/fDrmuD57R6bCjzr76hGzx/P8e8kacOFqya0lo
	fFbLkcz4e+4+fL+N0jtwCoxxKa96YA0aVkv884ddNaE23N/B66ITji84Z923tJughN0I6vx5J+WNO
	/OSFVju4YLUCV4j2PA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uU1eW-00Ba2f-2w;
	Tue, 24 Jun 2025 11:17:24 +0000
Date: Tue, 24 Jun 2025 11:17:24 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: alexander.usyskin@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mei: vsc: Remove unused irq functions
Message-ID: <aFqJRIQkw624nQFf@gallifrey>
References: <20250617003450.118751-1-linux@treblig.org>
 <30565c88-fb3c-4970-a7c8-bb81200a13aa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <30565c88-fb3c-4970-a7c8-bb81200a13aa@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 11:16:45 up 57 days, 19:30,  1 user,  load average: 0.02, 0.02, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Hans de Goede (hdegoede@redhat.com) wrote:
> Hi David,
> 
> On 17-Jun-25 2:34 AM, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > vsc_tp_request_irq() and vsc_tp_free_irq() last uses were removed in 2024
> > by
> > commit 9b5e045029d8 ("mei: vsc: Don't stop/restart mei device during system
> > suspend/resume")
> > 
> > Remove them.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Alexander pointed me at this patch because I just posted
> almost the same patch:
> 
> https://lore.kernel.org/lkml/20250623085052.12347-2-hansg@kernel.org/
> 
> Normally I would say lets go with your (David's) version since
> you posted your patch first.
> 
> But your patch is missing the removal of the function prototypes
> from vsc-tp.h, so in this case I think we should go with my version.

Oops, yep that makes sense to me.

Thanks,

Dave

> Regards,
> 
> Hans
> 
> 
> 
> > ---
> >  drivers/misc/mei/vsc-tp.c | 31 -------------------------------
> >  1 file changed, 31 deletions(-)
> > 
> > diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
> > index 267d0de5fade..99a55451e1fc 100644
> > --- a/drivers/misc/mei/vsc-tp.c
> > +++ b/drivers/misc/mei/vsc-tp.c
> > @@ -406,37 +406,6 @@ int vsc_tp_register_event_cb(struct vsc_tp *tp, vsc_tp_event_cb_t event_cb,
> >  }
> >  EXPORT_SYMBOL_NS_GPL(vsc_tp_register_event_cb, "VSC_TP");
> >  
> > -/**
> > - * vsc_tp_request_irq - request irq for vsc_tp device
> > - * @tp: vsc_tp device handle
> > - */
> > -int vsc_tp_request_irq(struct vsc_tp *tp)
> > -{
> > -	struct spi_device *spi = tp->spi;
> > -	struct device *dev = &spi->dev;
> > -	int ret;
> > -
> > -	irq_set_status_flags(spi->irq, IRQ_DISABLE_UNLAZY);
> > -	ret = request_threaded_irq(spi->irq, vsc_tp_isr, vsc_tp_thread_isr,
> > -				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> > -				   dev_name(dev), tp);
> > -	if (ret)
> > -		return ret;
> > -
> > -	return 0;
> > -}
> > -EXPORT_SYMBOL_NS_GPL(vsc_tp_request_irq, "VSC_TP");
> > -
> > -/**
> > - * vsc_tp_free_irq - free irq for vsc_tp device
> > - * @tp: vsc_tp device handle
> > - */
> > -void vsc_tp_free_irq(struct vsc_tp *tp)
> > -{
> > -	free_irq(tp->spi->irq, tp);
> > -}
> > -EXPORT_SYMBOL_NS_GPL(vsc_tp_free_irq, "VSC_TP");
> > -
> >  /**
> >   * vsc_tp_intr_synchronize - synchronize vsc_tp interrupt
> >   * @tp: vsc_tp device handle
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
