Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3B620E032
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267846; cv=none; b=D0zZl8hss2+FXgQTyxViS+MRWwIGNg9JTJ/XfJg1wkX5uBWSPhf9ZR4OZTx6OG1MTGoBRmkpDoXGvBXE4HDZ/9kjWyRqzFofaOlcba+vvx+Zb0LiGXlz+k/RXj4wuWEKsZKu1zPl/gGS+Lo9XPQW/F/90hH06Q72HGa839wkcjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267846; c=relaxed/simple;
	bh=Tn6aoQKc3aa7Te5ssMfmlg1TIGUDpo7hBrg6GnUEEI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/lA8TnYQrvgwtNhRQwXah/vO+jybsKi0n3s05CbYoqNI3Fi/K7RQdlSI+3YIFPqRg9VrZTLLUxYiOPRYhwEyWyzC4Am3+TN1h/8FQUK3swHsX0q6q49Xv2P1lbNJaY+3H3scYqutpiRQiWX6iQlCV6uHZrXTru5aGte9EQFPq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ep2m8QXk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ep2m8QXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751267843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXgKDsO9IF1jvtOwtc1YPzsL5+C5UReXJZt+iIzw2Mo=;
	b=Ep2m8QXkYuEtbGYQuVKlcmcL13uteGtXpug5ftNTyf0/D8+AbYde+Zo2hv/i6M7mwC2Los
	UooW3fnzNUyqj/yUTc/A+9n++s7bb0uhIsNR6vDv9fes6UaWdOS9wYWKw0PakOkqD5iuGI
	h4Axqvgo3CDi2dE8hazLVEFvkBGmJms=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-b_XiDMaXNGSXG9EjkbNsPA-1; Mon, 30 Jun 2025 03:17:22 -0400
X-MC-Unique: b_XiDMaXNGSXG9EjkbNsPA-1
X-Mimecast-MFC-AGG-ID: b_XiDMaXNGSXG9EjkbNsPA_1751267841
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-60835716983so3703995a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751267841; x=1751872641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXgKDsO9IF1jvtOwtc1YPzsL5+C5UReXJZt+iIzw2Mo=;
        b=IvHD7tvBEVuA4t/pc1h2SLKbNsMgMqZ9tdsI3xQt+2jBzdlnOzxshHNVNf3WGlLd1P
         bFFSKEHZ6rMf0RWBEjoiDMuHNhS5mC0dJObtBf9sprUabWLOLt3M9b2BkrfP6zM6pYRa
         PiCtb+ZIMX/zD93G03q5Ppczk3kUeD6ynjfpZMCyKPYUJPVJeiMIdTr14gTSYvdiyU53
         i14V4qIENnBIUJAUMtoKzPOshyJ+7p7tzLOcAgSHeXCqyhJl06yUytPOFJJaJAH8/qC+
         9fj5J5ZznYBMqfC0PtwvAmx6Hfow2Y4uUny218Va4qXUV7eS6S6RFTwWBK44LdN0IyAA
         MaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAD9D50Ikq3h0e93p3Z8/qZ5SY3GMLBy+j/Mph387A4c5xKfpEfoR9Z1gJlBmChFBzmfM2/bLzjaCaPmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPF9fDoaQi1p7qydLZW1vu2DsfVIqLsGCk6eBymJn32GqmUOC
	EBRmvYaHRKuuJwsG643lNz3nOlyOTz58isToik70jpfeGb/w77M953o7e5EJ6GN6ugIvhS9YIy+
	8kigQ9B1y8aLg1gFV5fxwizXv1MfPfHolN6hNYand+iXJsEJVREYyxuz9omgRUgj5Hg==
X-Gm-Gg: ASbGncvgsTb7J4BBnGfrKHqWujueP8LC0zIoxDJUbvY081kxmeOxd+5a8+PxZFd9jFC
	StT4741WpzcsnMDlnCNlB7VupTI6qfRqnq225HVYcklwUNC+eY2/Y0iNHtJG+VKdFjC7j8/hJD2
	zgtutU3iah3NbulHGrcQgXCYY1VJM14Q924yIReJL/0T9hM9w8RezOyC/t2k3sTi+NrJksZhZEd
	FzSLEf8xHFSFZcjmA5gnORCGZGe+jIZGG0l5f7UNP4Vod6H2dTJQAb6af7J71NEL/1XnNDcwV0N
	L4BSmt4xwOY=
X-Received: by 2002:a17:907:7b89:b0:ae0:e88c:581b with SMTP id a640c23a62f3a-ae3501a1ae4mr1165185766b.53.1751267841027;
        Mon, 30 Jun 2025 00:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKxfKBywT4IQk61EMh763CcXX3O2d6CwAncqtW/koAuBxomT/ER0VDAIzBM2QUWavfZMolHw==
X-Received: by 2002:a17:907:7b89:b0:ae0:e88c:581b with SMTP id a640c23a62f3a-ae3501a1ae4mr1165183566b.53.1751267840551;
        Mon, 30 Jun 2025 00:17:20 -0700 (PDT)
Received: from redhat.com ([31.187.78.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae360e6ce54sm567534666b.37.2025.06.30.00.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 00:17:20 -0700 (PDT)
Date: Mon, 30 Jun 2025 03:17:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Parav Pandit <parav@nvidia.com>, virtualization@lists.linux.dev,
	stefanha@redhat.com, alok.a.tiwari@oracle.com
Subject: Re: [PATCH RFC] pci: report surprise removal events
Message-ID: <20250630031347-mutt-send-email-mst@kernel.org>
References: <11cfcb55b5302999b0e58b94018f92a379196698.1751136072.git.mst@redhat.com>
 <aGFBW7wet9V4WENC@wunner.de>
 <20250629132113-mutt-send-email-mst@kernel.org>
 <aGHOzj3_MQ3x7hAD@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGHOzj3_MQ3x7hAD@kbusch-mbp>

On Sun, Jun 29, 2025 at 05:39:58PM -0600, Keith Busch wrote:
> On Sun, Jun 29, 2025 at 01:28:08PM -0400, Michael S. Tsirkin wrote:
> > On Sun, Jun 29, 2025 at 03:36:27PM +0200, Lukas Wunner wrote:
> > > On Sat, Jun 28, 2025 at 02:58:49PM -0400, Michael S. Tsirkin wrote:
> > > 
> > > 1/ The device_lock() will reintroduce the issues solved by 74ff8864cc84.
> > 
> > I see. What other way is there to prevent dev->driver from going away,
> > though? I guess I can add a new spinlock and take it both here and when
> > dev->driver changes? Acceptable?
> 
> You're already holding the pci_bus_sem here, so the final device 'put'
> can't have been called yet, so the device is valid and thread safe in
> this context. I think maintaining the desired lifetime of the
> instantiated driver is just a matter of reference counting within your
> driver.
> 
> Just a thought on your patch, instead of introducing a new callback, you
> could call the existing '->error_detected()' callback with the
> previously set 'pci_channel_io_perm_failure' status. That would totally
> work for nvme to kick its cleanup much quicker than the blk_mq timeout
> handling we currently rely on for this scenario.

That's even easier, sure. However, Lukas raised the issue that
pci_dev_set_disconnected must be fast, and drivers might do silly things
in their callbacks. So, I was working on adding ability to schedule work
on such an event, so prevent such misuse.

At the same time, it's somewhat hard to abstract it all away in
a driver independent manner, a callback is certainly easier.

WDYT?

-- 
MST

