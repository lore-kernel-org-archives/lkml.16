Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CBD179A3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750726569; cv=none; b=ZXbxr+Ms2ulVE/JrvVmFdR0qXJyspQjRAKaMJRxcIbrvqHvn8mEr8W+uJdc7CUb3iodKhG3jSGDhAaeUrA5H5VBly42j1ngo8fEpzd3cJS03poWM0yZeZt+5i5O5VfnKj/jKGIGYxLlP3CwfzNtHd43FeJGHviGg9POw+AQ0uHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750726569; c=relaxed/simple;
	bh=7O+ajiUDfZzafBBNiM6e5tJhCUr430Qh1/kaNQGaM+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drrPAy4ku7NJnRb9XPTCsHkg/EXfznlhAa/FiIiwebCdnwcTwUz8X6WFTktsrZRvdyRxejqddgAtPsLArG3lZj8oopY2COYVUW/kUz8o1ytHoOGxTiEOCD38BBf95aeV8tQWIkwOWJzv9TJ9GwJUooXCW/xvy4dIbuzceeW934w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WJhg3xAw; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WJhg3xAw"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d38d562a55so629778185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750726566; x=1751331366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8pDtojTuV6LFOjfDU1WAEP2YMGFUVnVXeIZSV015Tk=;
        b=WJhg3xAwDnEtmpOKHPAQl9ExlKfP22au9D1+PsZVs5aOzR6wChf5v4eCZjsIToE9Ab
         ScpGHEceuSn6Gtjm0iv3fsHGTgJPjZDj7w7o73tH9DSMR7vfI5tjKgIu2JosoX/n8ZkP
         eUZxpj87u0uyoPuA6IAVDHr9WE9krzPT4LrZz0FuNbRhlkJI0FABQyoNk1w7K5d8iu7U
         v16dPOpMYTrdsozdToA5QzFCfuUt1r5nRX6a2LoYbTaZRAV0PUSeGGlPa2C0hLdh1vSf
         aLv99SUSDpOy+4NiBi5LgC3h/Vg+IO12vlPNBK1hLy/f3C1wpGuJQv7dxo5qPqTDrJOW
         SG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750726567; x=1751331367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8pDtojTuV6LFOjfDU1WAEP2YMGFUVnVXeIZSV015Tk=;
        b=s6y6wEstlDLp7GXx0CheC2t4dgIAM6es+xJomPhQIr+BklGOjZN6F88M048zjcd9Ra
         f10UYo50qElPfkfKm0/OXvp6dM2t794O4vDHcvc3sIQMj5dZJbz2ykMbPK7K8PyFnb19
         24Pm5z16izxQoAjArgjsMsRdHIx8ngmLoYzOlhYuNYtmVUeoxl9Ff+JToN2s2eLF2gFI
         ERsvirpTYb2gNZp/ITGEFgT93FU7u7qT/xvuYn8Tf6/FT1OuBiIBo3Y3Lr0OXiRa1O43
         sq3ihRUsnQtKEBa7xPRwP1oA6PFWWtYESLP+FIIp7UuGL7358+0xNUuH/T+rFK45RnSQ
         3uXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiOoRF8napWgihTcHHOslk4RscOHFj/LEhmo5iP3xR229BmjgFHXkhItnq28t/yszmtZyHqQlNfX8Mm+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNV6dTotsc2umIvousTmps4B9BFCH5QTCtPadPjZTMHKURNh72
	bzScGrb4JlysYlol+06EqLErsoXveKWS7jrJSDaD/eHk+Atipqksc/XXm/zagQFqlc8=
X-Gm-Gg: ASbGncvv3JdcfI6Q1SdCzRRmghR9pwnOG0vDswGjBo8SGMG13VY5UxJQDTPH232eSOM
	H++gZNnx4IyHcXYbm0aR0CNtZcaKE5a/AUc+OHonQy9Ttnf9+dOag9tY6HdBYFYxAMTxXkVTWCZ
	ZTFfyEp/BidhVwrWh2GGHGXtC4yDj0oRbao7yE5nej6VmhaA3/VI3bcG7lGQOvZbcBYyVDLVNbB
	ghTHQf1LA1A2xWtvGF49SxZ5yjW/09TEIjfm64lTYkEQyN/4FCMHVxRrw8X1pspLs0yJi80f55R
	etijTKlySZbooIuJ2sy3JdXNteTExAT6hGSopfx6zWKW504oVPjEfq5ZlYD1cI9AkyXF16KJpsy
	sKpm5jTfx4Cud6/08IQYtAMUcwTKmnVxKlSlqZg==
X-Google-Smtp-Source: AGHT+IGX6hq2GvuJ1K/s8jNlp2hlgIbEh4pTewUT8bxyCxJMmW0ogtWNidvI1vHbIFzO1aMASc52bQ==
X-Received: by 2002:a05:620a:3183:b0:7d2:2822:3f79 with SMTP id af79cd13be357-7d3f98dfd21mr1951957585a.13.1750726566656;
        Mon, 23 Jun 2025 17:56:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd093e087bsm51501256d6.20.2025.06.23.17.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 17:56:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uTrxF-00000000aHE-1Uw0;
	Mon, 23 Jun 2025 21:56:05 -0300
Date: Mon, 23 Jun 2025 21:56:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Alex Mastro <amastro@fb.com>, peterx@redhat.com, kbusch@kernel.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: print vfio-device name to fdinfo
Message-ID: <20250624005605.GA72557@ziepe.ca>
References: <20250623-vfio-fdinfo-v1-1-c9cec65a2922@fb.com>
 <20250623161831.12109402.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623161831.12109402.alex.williamson@redhat.com>

On Mon, Jun 23, 2025 at 04:18:31PM -0600, Alex Williamson wrote:
> > Alternatively, if we wanted to normalize show_fdinfo formatting, this
> > could instead hoist the print formatting up into vfio_main.c, and call
> > an optional vfio_device_ops->instance_name() to get the name. I opted
> > not to do this here due to unfamiliarity with other vfio drivers, but am
> > open to changing it.
> 
> TBH, I don't think we need a callback, just use dev_name() in
> vfio_main.

IMHO this should really be the name of /dev/vfio/XX file and not
something made up like event fd uses.

The file was opened via /dev/vfio/XX, that is what lsof should report..

For the legacy route this effectively gives you the iommu group.

For the new route this will give you the struct device.

The userspace can deduce more information, like the actual PCI BDF, by
mapping the name through sysfs.

I would have guessed this is already happening automatically as part
of the cdev mechanism? Maybe we broken it when we changed the inode to
use unmap mapping range?

> The group interface always requires the name, in some cases
> it can require further information, but we seem to have forgotten that
> in the cdev interface anyway :-\

?

Jason
