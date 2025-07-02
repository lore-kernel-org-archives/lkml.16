Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28AB2E498F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480883; cv=none; b=alOVdQaTM4+PB/dBOnZ4l7KWpzGxrqXMZTfRIfbT7ZdcsO36Bt710TrgC+gRuJ6BZ33DqoZ+Sm59SJvqHifpo2F2gDorr/W8XQSc+jOekzKhrt6XKnL1KTvQ9Bs3cDd53ISGDn6bpFDI8chxoRvYTF9s2/xuOlTkZJJqPbpBioY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480883; c=relaxed/simple;
	bh=iP5w1PMpBk76Rr3cMYHswVuigC9uaxVExDoGsxa+F3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kp1AIXlEkGBalBlp4M8H52IR5NakG1UzjWciA+GX83l1qF1CYso4TUlEUNc7+TKCtepn0LLIcQ7LfMn2C4uj32xGduq2CNlU7Q7hD3YbQQ1JwcdmrhAn34Pax/ip+FAvIy4rZLr7NY8l4XGSWrogH5v63xtMn0WatCTv0ND+oUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Pwkh4neE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Pwkh4neE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235a3dd4f0dso45217135ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1751480881; x=1752085681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmBw0FwZ2YTZy+oq5MGfO9a+hy7B74rrrKnCKDkET7g=;
        b=Pwkh4neEuoQFSlBmcYtgh/rmjMsTFJNz+tAvQfgLYDCsdXFAzfbuz61FrK2nOnuTC0
         66T9UC8ha1zUMuR4H9rOY/5UXJQTRcDsqYmW4W4E3ppIpHGyxtA/CCTYRfYlJ43WYQ3l
         E4j4cNKBJy8y+0JXy5yYbOWaeBeFb2kJ6udaRvKbaFFKeCt/waEcJC5/mjvhQ9TBiUVQ
         +F6WBGIfU0sitJ1OoXuvKRj4yOxE/HLThNbfncgspS37ifu733CdIW091WvdUb0TYBuZ
         QCdVAfub/WLV5XPOldxGY1ZImOJBLpeZ5cRpcCU/6DDg7japlo4texHpk+818U9R7NZZ
         r4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751480881; x=1752085681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmBw0FwZ2YTZy+oq5MGfO9a+hy7B74rrrKnCKDkET7g=;
        b=dGm8me0jh4q/V9aUBeQ+4soHeAA40IFBc/3Oif6lgCpfKMA+CKBSzG5I/1Wcdz1D1o
         n/cWoBNuFFMljHPrrvfJ9rzzjleG6dqr1dy68TSdVxmZwz0YBuqWhCpfTMg4rryR6tXX
         E+gtDdNPXWcdFavpTwK1eEMW+z6qP5QdGKtYjgL1f/Ma7bplUDMf5C331qEiuREq8Tal
         mRS5gqNKHVd2fFvS1wKtoppvgxocSTFseRSoQGXJ8TQTY41njKl0ZTwm+KBBj3NdjJhC
         boLUP08VsoWMF+I+v6VNvVLQxOBXPse11cJozvTbyXXFLjYen2Fk6vUQgIr/dxZRt0+4
         hvwg==
X-Forwarded-Encrypted: i=1; AJvYcCXWdgzDVQ6uYlf2UDJAv2BWvcERXAd/wy91e/NGzeZ6c/M4kD/RI1/CZ9EZbwQ6nDHJ1RclxluIxRaupI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXRLZ0Ro0eATU62hYuJdOKyd1QDjTnCre7XsZm9zkUFTH5r9RE
	5px+axsVk4RfqnnlZgSRQ2hgGt3z4v6ewdH6DHwzcnN0aEm3SAIu/WCvGtVfNEqRfyQ=
X-Gm-Gg: ASbGnctAx4gE63NYbmgUrvC3BhVdslRqFGtaYotFgx93DGNY3YLPJJbLQrcv+VHLxRa
	lsYh4rm/QfPH4lvfqstghkdgXZSI5+Wd2Uw0Js6C+c9Z5wlrvYukHo4fMP+k63cH5CjXLsZ5Xzt
	SS+5f5j0/ahHt5cvwD7xtZ0cJieA9XTwQvbVW4GpHvQrUbBGUKVVfjkHik6HFmE3fza56eabYaj
	T6lTN8YkpPMQlvPIGJTgvRaX6w9BAM/8+K3S2BVikTsVIsVNIxyYUPk72FTy6DLsAeUPnyEb+SY
	QzvVVGO6oWCuQ4nJYIPwO/OZcxHCC7it52fALSczntP5nRE=
X-Google-Smtp-Source: AGHT+IHRud1650CV6t7XmPGb5CJK0erzfO/DvwwwzByFP8LtNAphgKfboGyxgWUiZX6QKOCKR6whKQ==
X-Received: by 2002:a17:902:e884:b0:236:93cb:48b with SMTP id d9443c01a7336-23c6e5c5a1amr65584895ad.44.1751480881046;
        Wed, 02 Jul 2025 11:28:01 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7986sm142781775ad.164.2025.07.02.11.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:28:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uX2Bb-000000051lx-10Sm;
	Wed, 02 Jul 2025 15:27:59 -0300
Date: Wed, 2 Jul 2025 15:27:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: lizhe.67@bytedance.com
Cc: alex.williamson@redhat.com, david@redhat.com, peterx@redhat.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] vfio/type1: batch vfio_find_vpfn() in function
 vfio_unpin_pages_remote()
Message-ID: <20250702182759.GD904431@ziepe.ca>
References: <20250630072518.31846-1-lizhe.67@bytedance.com>
 <20250630072518.31846-3-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630072518.31846-3-lizhe.67@bytedance.com>

On Mon, Jun 30, 2025 at 03:25:16PM +0800, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> The function vpfn_pages() can help us determine the number of vpfn
> nodes on the vpfn rb tree within a specified range. This allows us
> to avoid searching for each vpfn individually in the function
> vfio_unpin_pages_remote(). This patch batches the vfio_find_vpfn()
> calls in function vfio_unpin_pages_remote().
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index a2d7abd4f2c2..330fff4fe96d 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -804,16 +804,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
>  				    unsigned long pfn, unsigned long npage,
>  				    bool do_accounting)
>  {
> -	long unlocked = 0, locked = 0;
> +	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
>  	long i;

The logic in vpfn_pages?() doesn't seem quite right? Don't we want  to
count the number of pages within the range that fall within the rb
tree?

vpfn_pages() looks like it is only counting the number of RB tree
nodes within the range?

Jason
