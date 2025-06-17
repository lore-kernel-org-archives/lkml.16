Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683772DE1E0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162874; cv=none; b=QdPZLq00xM/95/8FWYc2aVBX6QicIoLxmadWjdOGUPaHaTVEY43uHifSPiT5zX6NMPIeLpA3BvMvD07gYY38JIu1446vNkAU5IOtDqBxLQGaQK+W6wcBijOXok/3+tXPC/DrJn6pMN9aNsABOvGhYj+qzkIlogVjix31bloGd8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162874; c=relaxed/simple;
	bh=+iFEKsrNEpT2xbTy++KT2dWotgeE2bVlaPMJ1iFaUdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8rQ6VBVfftZ3XE0EkH+eChkSbz116w37dkn1gA5jMehDR0oueqes0CHQyGOVbH6KhUp+ILBzY/NlhxUuOAEdyeYKStTxXlHA/eNZMvrEsbibz13PiNTqZg9b7Iv7/6HzGCozGwIl1CuFBFw6QBERsuoAENFvAASi3eLl76nkLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S2CwKANI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S2CwKANI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750162871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hWbGPsCL+dHyM0VVvvwNT45eKA8G9B5bfX+3auMPkdM=;
	b=S2CwKANIfJ649Xm/Nj0zKnAk2wpq55hnB0JTRNMuIY95amn8J0a0ih7Fs54X5gRu/JhJo7
	ZnTKFTuxZ4mCFN/cId5WoSBXcLpvoLJLk1Mz7Kw0f5vQqWWBfJZiYy04sZLAcQ8X49uIef
	Yv1KwZ/hdYQAFvRjtfRJIjIA2HZnse4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-ApzKROTePlKgz5m4jSg7jg-1; Tue, 17 Jun 2025 08:21:09 -0400
X-MC-Unique: ApzKROTePlKgz5m4jSg7jg-1
X-Mimecast-MFC-AGG-ID: ApzKROTePlKgz5m4jSg7jg_1750162869
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso2725481f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750162868; x=1750767668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWbGPsCL+dHyM0VVvvwNT45eKA8G9B5bfX+3auMPkdM=;
        b=oyCFfkqRWmp8LzmJBXPT2naMVI7NF7uwE3VumXs3X5jTdZjttQ+t2aZAiaQEU+PArK
         GRHIg2G9s+VoLivB6/jMqeOl6b1/y45g6G0M9dsMJ4qVxfIGKSC65lnzqIYvBK+tZZPm
         YbuyVNdXMyQcYdBqd/CgMomnSQeD462RJlNRWRbKIerTHua81QJR+/Rla+xklJiyeH+i
         jW4T75jrGSsp8TMeLhVI26YTL11Ns58F+uBL8RRLOZyN4dICtASd0iA4EQTeV2edrQxm
         xuXl5O9yUCZHIGTdh4xsPA5BrKMbdLMFWyTdj6mRkKi83zt/US3rIqyggil5Vf7jMll4
         a8+g==
X-Forwarded-Encrypted: i=1; AJvYcCWBhLfx6vHTf0HQvcOp3OHLh9YJxOP5e/m7wJqQIbG2B165CKFGaq33/3BB2Wd3ThSuPDBcC3tBMjfCTMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3pMGvTWQJ+SKtDSJ8UljigeHihVZmvSYOO08OV9t24kuchh05
	2yZFfZpaPpqQCqU9mD4fViKCYRj0BfgqyLQtdysBjliAXn35QKAeZzhw57aour4Ew7knuZAmiyh
	PUOejNlDfYCbPH+PNEpVLUqAVNpds7I3Ne7vXxxKjbhnGCSiFb9Kpm//XkWeN2A98tA==
X-Gm-Gg: ASbGncuYQ98/+rMvrH3j3IQA1S7OnSS0NBMrUzpiM+e/ySrXDgPg8Rno+oy8DsEQX4W
	nI0tKUBdEDWu6ij9alvNb7CL9sxD8rJrEcj1ZBwkbpkEJi4E7la99H0gEZVazEASVWM9r+wzgdS
	pJSRLMp404yu1Z9DhYMcc/47Qx+xefrQddCpvoC88Pb/VyE4mZhO1tZqKUinMaQxFaWpmqIW/Od
	apEOy9fmGo3f8dO9JnYuDp7vgcmHSp6sAD58faeDvlY8UwmD4nKxh4dWoVINVckg5lnspTwnvt3
	2CCO9KpX157AdNIVNzoFPvWw9hmpxPIJ7D/eMZ1JH4L7Gm3NjLfdFw==
X-Received: by 2002:a5d:64c2:0:b0:3a4:fbd9:58e6 with SMTP id ffacd0b85a97d-3a572e56e89mr10226295f8f.50.1750162868608;
        Tue, 17 Jun 2025 05:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ6HFIcgPA61VTLE6MxwcViqBvvaSiTLm55w5wu/A8YbCBmIm2sEb6MdwAS+c2/XoeDsQZRA==
X-Received: by 2002:a5d:64c2:0:b0:3a4:fbd9:58e6 with SMTP id ffacd0b85a97d-3a572e56e89mr10226267f8f.50.1750162868192;
        Tue, 17 Jun 2025 05:21:08 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089c2sm14026313f8f.59.2025.06.17.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:21:07 -0700 (PDT)
Date: Tue, 17 Jun 2025 14:21:05 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: luca abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
 <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
 <f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
 <20250507222549.183e0b4a@nowhere>
 <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
 <20250523214603.043833e3@nowhere>
 <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
 <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
 <8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>

On 02/06/25 16:59, Marcel Ziswiler wrote:
> Hi Juri
> 
> On Thu, 2025-05-29 at 11:39 +0200, Juri Lelli wrote:

...

> > It should help us to better understand your setup and possibly reproduce
> > the problem you are seeing.

OK, it definitely took a while (apologies), but I think I managed to
reproduce the issue you are seeing.

I added SCHED_FLAG_RECLAIM support to rt-app [1], so it's easier for me
to play with the taskset and got to the following two situations when
running your coreX taskset on CPU1 of my system (since the issue is
already reproducible, I think it's OK to ignore the other tasksets as
they are running isolated on different CPUs anyway).

This is your coreX taskset, in which the last task is the bad behaving one that
will run without/with RECLAIM in the test.

|sched_deadline = sched_period | sched_runtime | CP max run time 90% of sched_runtime | utilisation | reclaim |
| -- | -- | -- | -- | -- |
|  5 ms  | 0.15 ms | 0.135 ms |  3.00% | no |
| 10 ms  | 1.8 ms  | 1.62 ms  | 18.00% | no |
| 10 ms  | 2.1 ms  | 1.89 ms  | 21.00% | no |
| 14 ms  | 2.3 ms  | 2.07 ms  | 16.43% | no |
| 50 ms  | 8.0 ms  | 7.20 ms  | 16:00% | no |
| 10 ms  | 0.5 ms  | **1      |  5.00% | no |

Without reclaim everything looks good (apart from the 1st tasks that I
think suffers a bit from the granularity/precision of rt-app runtime
loop):

https://github.com/jlelli/misc/blob/main/deadline-no-reclaim.png

Order is the same as above, last tasks gets constantly throttled and
makes no harm to the rest.

With reclaim (only last misbehaving task) we indeed seem to have a problem:

https://github.com/jlelli/misc/blob/main/deadline-reclaim.png

Essentially all other tasks are experiencing long wakeup delays that
cause deadline misses. The bad behaving task seems to be able to almost
monopolize the CPU. Interesting to notice that, even if I left max
available bandwidth to 95%, the CPU is busy at 100%.

So, yeah, Luca, I think we have a problem. :-)

Will try to find more time soon and keep looking into this.

Thanks,
Juri

1 - https://github.com/jlelli/rt-app/tree/reclaim

