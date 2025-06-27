Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073928A1E3
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060467; cv=none; b=Sd568J0Lp7hs7cGwIbOzaZNl+Pxpq0AkJVUAarfIeZTJ7VVYIfDhMr2WssWLqKAuHbVHe9oC7n5TlgY3gOkXefpmCYFvOC6rcaTErTB2+R0AvFZLs/RM/RYfo6JTqma+D+89+uiBVGREf4ueyfBi0oLBAolU7V0b+/9qPNwFCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060467; c=relaxed/simple;
	bh=IqUPu+qg9sK5TF/ONuynkNsPXpFLxC7WTe9/O7FmF6o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L/+rVkdTWViUNWSrisN9Xmh0YSUTEQ/cHe86j7xuXufOLQUB7kfOLKoxWGdOoS18Hs2fR2aeOI7+CVIIXD39N9pYQ6G0xiKqYoySSuNs7NzINZUAMAyOkKfVLkKiV1lwH2TB1gbPu8SDRfKbpbXr4ULGrXEAyR1Swp7z8ytIx40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RKE2ruhZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RKE2ruhZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751060464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0xGAel75XXbnqolX1Sol4ZBrPxTic65nLbHbUl0AD4=;
	b=RKE2ruhZAYu8vNxQ+Mh06CsRe7prEnxx/70IKgfakXIt3vUSJ1NfiiWUp+dl0bqRlq5xOr
	xM2/VHVjgsDN7yrNtYPwWT5XCVRKdqNX1/vU2xEXItA9qmmI0H/DruvS9tEsBSMU4zHWKU
	ALsSeS0af4LMwCnaGWODnhfyh+I/1HM=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-cbai2ZSOOt-6lD4SOqTl4w-1; Fri, 27 Jun 2025 17:41:03 -0400
X-MC-Unique: cbai2ZSOOt-6lD4SOqTl4w-1
X-Mimecast-MFC-AGG-ID: cbai2ZSOOt-6lD4SOqTl4w_1751060463
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-87373f99cd5so3242939f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751060462; x=1751665262;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0xGAel75XXbnqolX1Sol4ZBrPxTic65nLbHbUl0AD4=;
        b=TM0h+2tqJuodP8zZe3MAVhzcopcjOKk3X5tx2dtF/7S1RXVcOlwq7uDn3qZk8DL8wJ
         VuE5TYDWcLleHXqND6va3McjkrXGKP8DecaIIRb9E2zRucC8GBwgQeEMOzrk+Mp2Ohkv
         EdxU9iqYLKm9ov6/hKMcaC3BWF9q4dzDsuJix7+f63UOZ/FFVCFEOVjsh747YkFktJ9U
         s10jP181pF2Zr50cIl7qJQS+q6L3eXms8TFhKGp67cxIpo4D8gdSFwnn79paTQ+bi/mS
         jNi7s18WtCHi/TcQ9ERE7YIM6F/mip2P29vpUdRQ7L6FY8s1RF8+zRKzyWJOyv8Bk0tK
         wYwg==
X-Forwarded-Encrypted: i=1; AJvYcCURGcDdptUin+8ET0A5bLK+R6MfkJHC/saMQgufd+8a0G0nZSJcjdAWwJ+5YWv55zR0l0mMYF2UsgK7+Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcCAaAhAuO3Bpj947jxx69eAsa1ew+Yb9cmxTQAnYr2RzPFBEP
	Qa+YpvLqJUVrVbcOL8pyFxRVVbTCDKOeICsWDY8ZIR1jwD9Dnd4Dwvc1w1P8gThGirlmXKid3uC
	B9E2gdhoex6Xh6UQdIElwC/IXhv1KNej/pgFFOCAJ0Ch579jR+Leb64m9EEQ8HY8vEQ==
X-Gm-Gg: ASbGncv3obJrvVDz1L9nvVyD7R8UoBLUs2dmWhAbGlaoYvsOOdpcawWvTVpPI1UvRQv
	DEAxg7JJ9hqVV3PHw9IhuQPL72hsSeAMSG9oM7PdSSYCEuRXgH0RNNlWjb8SuwEsLFdjhu18a3C
	zuXaszA/5JAZtkQ8Evs3iZ521tPdpZ4rPZ3+HmSYXGw5uGBiIHHUFOO1vGdpJhKGkhS29DAvOrx
	EIBHPlmDQm4rw85tgt+r2UBquxSzN3jkp3dx8tOrBwUyJpwT3ZXpIUIK3Ek4ckWM4N32h268wWr
	fcP+esrr8aS8kYdEPQHV+SMFnw==
X-Received: by 2002:a05:6602:3a13:b0:876:9870:92e8 with SMTP id ca18e2360f4ac-876987093aemr4619039f.1.1751060462613;
        Fri, 27 Jun 2025 14:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcc6o5L+EH5s3y9O32PFIOvsVsoPdfQruBa6++XvBeY6vYzanbj3YXtZkPOKwtPxVRDrxEdA==
X-Received: by 2002:a05:6602:3a13:b0:876:9870:92e8 with SMTP id ca18e2360f4ac-876987093aemr4618139f.1.1751060462175;
        Fri, 27 Jun 2025 14:41:02 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87687a18c14sm67333139f.15.2025.06.27.14.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 14:41:01 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:40:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: lizhe.67@bytedance.com
Cc: jgg@ziepe.ca, david@redhat.com, peterx@redhat.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] vfio/type1: batch vfio_find_vpfn() in function
 vfio_unpin_pages_remote()
Message-ID: <20250627154059.0e134073.alex.williamson@redhat.com>
In-Reply-To: <20250620032344.13382-2-lizhe.67@bytedance.com>
References: <20250620032344.13382-1-lizhe.67@bytedance.com>
	<20250620032344.13382-2-lizhe.67@bytedance.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 11:23:42 +0800
lizhe.67@bytedance.com wrote:

> From: Li Zhe <lizhe.67@bytedance.com>
> 
> This patch is based on patch 'vfio/type1: optimize
> vfio_pin_pages_remote() for large folios'[1].

The above and the below link are only necessary in the cover letter, or
below the --- marker below, they don't really make sense in the
committed log.

Anyway, aside from that and one nit on 2/ (sent separately), the series
looks ok to me and I hope David and Jason will chime in with A-b/R-b
give the previous discussions.

Given the build bot error[1] I'd suggest resending all your work in a
single series, the previous map optimization and the unmap optimization
here.  That way the dependency is already included, and it's a good
nudge for acks.  Thanks,

Alex


[1]https://lore.kernel.org/all/202506250037.VfdBAPP3-lkp@intel.com/

> 
> The function vpfn_pages() can help us determine the number of vpfn
> nodes on the vpfn rb tree within a specified range. This allows us
> to avoid searching for each vpfn individually in the function
> vfio_unpin_pages_remote(). This patch batches the vfio_find_vpfn()
> calls in function vfio_unpin_pages_remote().
> 
> [1]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 28ee4b8d39ae..e952bf8bdfab 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -805,16 +805,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
>  				    unsigned long pfn, unsigned long npage,
>  				    bool do_accounting)
>  {
> -	long unlocked = 0, locked = 0;
> +	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
>  	long i;
>  
> -	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
> -		if (put_pfn(pfn++, dma->prot)) {
> +	for (i = 0; i < npage; i++)
> +		if (put_pfn(pfn++, dma->prot))
>  			unlocked++;
> -			if (vfio_find_vpfn(dma, iova))
> -				locked++;
> -		}
> -	}
>  
>  	if (do_accounting)
>  		vfio_lock_acct(dma, locked - unlocked, true);

