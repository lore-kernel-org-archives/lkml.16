Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADE6502BE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546018; cv=none; b=hBfSXOqvRyXSHXK3721Drahkrq4v5kb3QaAS/DEMD2Es+t6LKyeCV4GG1ZUXEDSt2gYxV48aFcUhXkHRj7jnLouJH82iSvOzLFMv+Yt+EZseiplCbvZOuLy6BhSpmaWqrs2wB1s1T/ATqAie9q2r0xkeQU/DFPmPf+r9Lh79so4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546018; c=relaxed/simple;
	bh=bY6kWgoeHMO+pQ1hmESq/ka/7uYffdd8ryGj98Lx5C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgHs05i/scP2kQFYRQzLoubSvgxZoIW9VBT8dXDHcs75F/Yj6wM7GF9CmIOoMyO7C3QgJ7ar4/wmufJQKnZLoKrY0W9UmSODE7lx4Qx8GVAff0/OmEM1mTKgiByTilgQKEWqWHji8/3AXLyj1RyuPyjsF+2kLp6sE2n3XMWxDjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Mr8y+sTv; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Mr8y+sTv"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0ad744811so49131806d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746546015; x=1747150815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rT47EbPl5rmGmBtm4poGbS4wq2tYGccwoLr0keQJKRg=;
        b=Mr8y+sTvf/MHed5vx3q5CrD25GWfGDmRaTT1wjbnkMqDBwfGD0EbCsdcR2RkhMafy+
         yvk10fEnCd5G6oZ0TRWirTq7RSiyupnWl4k3mswsOXn42LT1zxdglfanlcmyiE87KGMY
         Y3TwInkJ/PX9gTWhjR3/1xwTuBrXoQjV31Gmex22LmSiZ37V6h7VdjpZnSWYxLgNNpNL
         RVA5dL99+djyGlrOzZ+p9QLesl2LI4tmSDvuM9jVy05Zmo1c7DIm0Wx43afc7QKSI6A1
         QG+OoEyPrzrSb4XyCENRK0aMgF1RVVaaXqAYsW42Yc/UemiqX3f5n5x/LzCvAPFerWF7
         oAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546015; x=1747150815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rT47EbPl5rmGmBtm4poGbS4wq2tYGccwoLr0keQJKRg=;
        b=D3LbdCLjfbjbG3DSTFpsFhhbMw0yisN0yY0qyPkLrhGL97FsNtg12jnqKr6Mdznc5p
         fejkSJpTGHEufN2rp9FPGStIII7GejYPVP6i0dej/1XbEHBK+zNI4kZ8vJ+33ln5SbW9
         2ltuR85Ute6x1+jFH5FB9vGi191HIxa8dbkvFf4znZwZ/0cE3tATMBiXP40Jj+utABNk
         K06gMvLFgiIl6GdQrXXcWFnLsVZWuZnbraLAUdXUhW55IU7hjsyuRp0kK4W6rRYapWkZ
         nUviwXStuL7ti/8LjaJ3ng1yj9HvOSLTbNRrjFn6eBCt8/6ZujO9edHkNhOXZLZsFMQC
         bQcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNZQHT/XlI/6PmmQKy/GdN4UHO6SwpZbQ5+XFtmNrMkr27x2ZsFtxptC+L71jNeSqzdO4mFxOqs8GCfDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkegY9RxlzyX+29ldE26Ng58QB7VQUaLkXK+mQw0GVOz2+0S09
	8oMRcaNdRCMrPN2L8hrwCBSHuovrY95xouJ+XHkEecx2IHAhKapxoZiZZr+pg8I=
X-Gm-Gg: ASbGnct7w+knH8ttC+JDYdLyl76nNKWikigShtTns5SZTY7UAUWfM0n1Rplbs2sRrl+
	pjJaiSx9P5pRCdN/NqL5387+cdSTJwYajeguKsz//Iy5Ana3DhNrtpEW4wPrU0PFoBtBofkK5mv
	WCG5TPAEw8pBXhHry4pDmyTVOaBYbMPb6bbDNaOEf7tlfIcrB/1JLlHrZwAdP3P/iXdxbf/arMr
	WeIcuqDNpVz6TCSUBsawsF+ifl2Jvg4SRCfL+/rLg1+yM6RlXFQaKM/svMpfzKEHXhhtqjVW71U
	mxJ+R/6PO5HC8CTfNAXRq5Mqa4K39+xWmaAiwK80eip3vDaL9uG+CcjxSWCpn5fGwVX/DDjl200
	tOar8qTrArGQTC0Yu6e4bQu7i5eSJpA==
X-Google-Smtp-Source: AGHT+IEQ/a7j5Q9dt/+TXCErTmGmvU74xW7gWFXsaqhe3tHBRjnQSeuP9g4SIDonoyL/nuksjNTl4g==
X-Received: by 2002:ad4:5aa7:0:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6f528c3b587mr198664136d6.4.1746546015230;
        Tue, 06 May 2025 08:40:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3c4492sm71689566d6.35.2025.05.06.08.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:40:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCKP0-000000008dJ-1HMo;
	Tue, 06 May 2025 12:40:14 -0300
Date: Tue, 6 May 2025 12:40:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mostafa Saleh <smostafa@google.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Support contiguous bit in
 translation tables
Message-ID: <20250506154014.GM2260621@ziepe.ca>
References: <20250430231924.1481493-1-danielmentz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430231924.1481493-1-danielmentz@google.com>

On Wed, Apr 30, 2025 at 11:19:24PM +0000, Daniel Mentz wrote:
> The contiguous bit in translation table entries can be used as a hint to
> SMMU that a group of adjacent translation table entries have consistent
> attributes and point to a contiguous and properly aligned output address
> range. This enables SMMU to predict the properties of the remaining
> translation table entries in the same group without accessing them. It
> also allows an SMMU implementation to make more efficient use of its TLB
> by using a single TLB entry to cover all translation table entries in
> the same group.
> 
> In the case of 4KB granule size, there are 16 translation table entries
> in one group.
> 
> This change sets the contiguous bit for such groups of entries that are
> completely covered by a single call to map_pages. As it stands, the code
> wouldn't set the contiguous bit if a group of adjacent descriptors is
> completed by separate calls to map_pages.

Nor should it

This seems like a pretty hacky implementation, it doesn't set the
pgsize bitmap to indicate support and it doesn't have a safety check
on unmap to protect against partial unmap of a huge page.

Wouldn't it be better to use the pgsize bit map and rely on the core
code to tell a contig page size is being used and then it can
trivially set the PTE bit without having to do all this extra work?

Jason
