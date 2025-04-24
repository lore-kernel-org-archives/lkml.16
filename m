Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503A22489A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496108; cv=none; b=nLISKGWA30DjKIvX4ptIgPDJcJdBdDq2u1k2Yfm0e1jcJ5nWKZrwmT9IFEtvve/PnZh9ruA4r9+E/4c9U84W9X8lzz0HQE+m5grcD2EcO9oLQ5q8kzetRc+iNU3TMK3zNDZ6SoKWzfg7al9xokwzm/FuuNcfYiP2b/X6DI+FC8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496108; c=relaxed/simple;
	bh=t4m1Gy9zsGjSppvDn/a5XRWg7SvRp/w7DgqplM900q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLyhVhGYM2H+RZ6uaug2HZulH2M7iDnTaId7IGalLKWIifVc58RWPsEMTZ3RizXQOKTHy6OuOf330ERqiuC6bu8xMOs/kyBgbkcp+lWMCkRelogT+O4mtcxwN0lGdxXy3yI28IXRDh4pI0c7Zy4verH3PnrkF49n11Qnnn0J8rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=mL54jm9M; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="mL54jm9M"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecfc7fb2aaso9165876d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745496105; x=1746100905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oZL+E3RNHbpFWOEVEZ+vdGqOh3AavrEOxiuPbcP0VN0=;
        b=mL54jm9MipqZ/go/LHdmqJ9r7pUIZQdAXLW1m+lC+JRETYnPFv6f6FWwkTBBNK9keN
         IbRXkDkcfMSZMzZnxqbpHiqEhUY8C8EWvs4t09PkgUUt7TvmgHFyOhAs/JIhGj6xW9ij
         HelnhQXrAtkhfws/E7z5ouE8XNB68fgK1gGrE6Cl5joljljzhaT1bjFfkWJtMM9o40y/
         kyvVPsVGufx8Jkj4q6WTJI/p+HHH9EFbDkts1ixEwrkjidi2wiDBkOM1fG6EMzAXOsUU
         wsC+H5Wb7Zcb2i4Q6WXsvYkif+kmEMdAF5cpBf7hOzkomnR/h0ZX7pDpP74TibpZl2cA
         jN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496105; x=1746100905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZL+E3RNHbpFWOEVEZ+vdGqOh3AavrEOxiuPbcP0VN0=;
        b=a6kiFZfYvBSoLTLm+BSLR+UAj+rXAHwKbCq/ktcFCcbIwUwr4v948aak1tdyQo93RO
         VoVsrUVvnOFG/swie7FWEJL+RkXrNLWcLevu55atD+pWxPq5nrZ2em6uroS/HflQG6BQ
         2bR5aZPJ8X9slb6G2lC3GI2hkvSL45FWoLOw6+1xeWYZdTw5r9DzNQx8nXYiey3w/rXd
         8Xtx04Jz4SyLcSIQKvquYApxinPXBDrZs01kplEj/UWfsee1Dt9h8IHg40JOSL5pZ0to
         /Xsnb5fcO/Ypc7kHj4Ffel+pYFXxia10EZx6sjD05Y6f5JNk34MdWJk7qEaj9gUFZSxm
         iJBA==
X-Forwarded-Encrypted: i=1; AJvYcCWe1Fj2XZTsTVFtywTL46EWV1QjtahfnkqMnzfuYuPPrEL7xq9cVX+mb4ut525eCB2/sbsawvnrB5ucP2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvF+RtM/k9sW5rSMV0kO1UwJlKPHGGQFimG8xelMl+9XvYrqz+
	h1pNVGZGmc54X4G0pUaQTa2Dewe0SxLVWMk/rpaH3pEMXekR2Gn1uqtyS4QPx7g=
X-Gm-Gg: ASbGncuwlOayWENsPC6TgrUAs6KXWUL2YFNKi4rwIqk51wszR1vz530M9QqO30PoDoo
	LcPFLnVzq1Vz2byGQA0CTLQosiVKnGaM7A8eS31PFSFrc10c7IgW3CJVO7Gii0bHDARw+OJJXyj
	fhYkzRSialDYQkpcqyUc3D/zC+YLW5iwa1MNBu1NC/fcmYsMU8Hlsh0zp/tbhT8ehyqlpDd82Xs
	NUS3Heq5VH0kJXryAt+vWsXEStFVhjqPvXCBfB5bPGj4BquHxPrzqt7nmLm5edArvFDIpxflfM9
	yEjqehx/4J12aEPJFzrZbbhmSOT3WQbMnemZTEmoet/VQoWPVdmMcis/hsaLg/5SWr9x+aQsrrH
	VAlNQn+7tEc4s2UHXsFA=
X-Google-Smtp-Source: AGHT+IExjEYw2YciNBoIdkd9/pqHrN50d+y5G+B8wJfJbAXK4p9NBvT5uybfEubjkC+mcuj7maAkHA==
X-Received: by 2002:a05:6214:d02:b0:6f2:d260:b2f4 with SMTP id 6a1803df08f44-6f4bfc95a23mr43959916d6.37.1745496104857;
        Thu, 24 Apr 2025 05:01:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c093870bsm8528646d6.45.2025.04.24.05.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:01:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7vGx-00000007T99-2aD0;
	Thu, 24 Apr 2025 09:01:43 -0300
Date: Thu, 24 Apr 2025 09:01:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: jane.chu@oracle.com
Cc: logane@deltatee.com, hch@lst.de, gregkh@linuxfoundation.org,
	willy@infradead.org, kch@nvidia.com, axboe@kernel.dk,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org
Subject: Re: Report: Performance regression from ib_umem_get on zone device
 pages
Message-ID: <20250424120143.GX1213339@ziepe.ca>
References: <fe761ea8-650a-4118-bd53-e1e4408fea9c@oracle.com>
 <20250423232828.GV1213339@ziepe.ca>
 <84867704-1b25-422a-8c56-6422a2ef50a9@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84867704-1b25-422a-8c56-6422a2ef50a9@oracle.com>

On Wed, Apr 23, 2025 at 10:35:06PM -0700, jane.chu@oracle.com wrote:
> 
> On 4/23/2025 4:28 PM, Jason Gunthorpe wrote:
> > > The flow of a single test run:
> > >    1. reserve virtual address space for (61440 * 2MB) via mmap with PROT_NONE
> > > and MAP_ANONYMOUS | MAP_NORESERVE| MAP_PRIVATE
> > >    2. mmap ((61440 * 2MB) / 12) from each of the 12 device-dax to the
> > > reserved virtual address space sequentially to form a continual VA
> > > space
> > Like is there any chance that each of these 61440 VMA's is a single
> > 2MB folio from device-dax, or could it be?
> > 
> > IIRC device-dax does could not use folios until 6.15 so I'm assuming
> > it is not folios even if it is a pmd mapping?
> 
> I just ran the mr registration stress test in 6.15-rc3, much better!
> 
> What's changed?  is it folio for device-dax?  none of the code in
> ib_umem_get() has changed though, it still loops through 'npages' doing

I don't know, it is kind of strange that it changed. If device-dax is
now using folios then it does change the access pattern to the struct
page array somewhat, especially it moves all the writes to the head
page of the 2MB section which maybe impacts the the caching?

Jason
