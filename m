Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA89A1922ED
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649087; cv=none; b=RjkgrsIGUbkHrQ2Lb1BwrsFAi34/KEPvuGKYx65c+pdZaVtJ74WnC+pw/6k3J6pg2fpd5WN8RTRlOiv6VUm2MK/HoAS4Cw7qmYlD6X1tykZF1f6phvQsty5ZQUyNzCpKg+zE9808LtByxHfD8JffGrtQVQdqJ3x/dTKdlQbUpfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649087; c=relaxed/simple;
	bh=vahKKOsLIDOZ64bsLWsKQ3P4MU1oQ5S1vZDGJVQDQVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuTO/HkAZ0leg/Yv/vd0mfrYKZhVrqsJudZwiqrMfgcs5qiNA3ScLMh0qW8FYdolpc24pw2YkOcdb+OzUxWCGdXDMr5jQ/RXFDV0mcorrjYwLxc8unMmC7sxXEZ6TS+3DqJk2UXppg8sbT9e75DfJB1F5LzyLBl38UJJcMlBR8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NrmoZvWA; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NrmoZvWA"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so21891676d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 10:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1751649085; x=1752253885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dy7722iywegXhOE4714PEcfy4nzS/kIHDwpfpiOiUEQ=;
        b=NrmoZvWA500mPNzxqheXYGWO9E2fUtpGYVMc3pd/majVdiSqWgO9MsZW3F9zNj8Jcb
         2Xs6gxlJg38lVAM7SJIUgaMREdmFjnnfIYNGp3/C+kKoW1FvrBvDUQ7RFQWj/J+fFwix
         Lay/gDzTCZ1Kw9bIeAF60/1WnrBfz67RtEj+nsbhkPeUSLxdltGYiK9yyMNdERBsmyHd
         a2wzrqKmm6oLQRYLy3fumtKiF8TGPsFUngFokEUYsBtSVqfteUYXPKwP8k9IrmjIGT6v
         E1JO4+BfqdSBCU0hL4dL/Fp/qpVqDSVcj9GTGEBrlae0pFTwDt4hjLeF5iKnIlv/0gUh
         RhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751649085; x=1752253885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dy7722iywegXhOE4714PEcfy4nzS/kIHDwpfpiOiUEQ=;
        b=sxP7Vig+MZbXrXjHOfRQVkVtzyRieyzCQCh2w6zVb3xaxTrT4w1RC1cLLwuCXPGbSF
         k6759qqgFHuviy7KQoX1YOsE+hh+HQjCG7p6sNNfXASxR2UjQqy2hag3I8qaUdim3aGo
         6sD1I49CLoAbDy65s1BEe2v4JACLlPlGqDDgACPyolQGjmoUWKq2VOLHaD7T+K5zaGpi
         50H8U1GHsObBtPLA7Zad0mz7CgFfEHFhWEPaHrzXc4ySqzmWGxHzFmIaUKOXG1dKtjtt
         pOh+onEZ0Awn2/tHuNkd//TAHQT12DLmg4ocg9cAA8VtgKDec3NhB3f5TWG2CeRnaRCz
         pKSA==
X-Forwarded-Encrypted: i=1; AJvYcCVvIuQwJLxz5xMYkZRf0MIMZKw3UL6uMW2KdmdqJ60rdLzGvy6XSNKao63hqrmgDMXN5TqAU00LLbTLewU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDSlG3vcaC+w3MAySUDtMvJlhtTWf84LqdYsxiws7EV5fmQRmF
	70LFerCULDFzh8h4cuZPI50sZzwqFp3wucHxOhk7idVkdbyBRG+bLvLLFGiMd4Mq49E=
X-Gm-Gg: ASbGncuGy0I8X1zvy62TySug7uKBRhIMS/207Hc6BiRAiVN/20iKYAEsIbbGiMdWKA4
	Tx1tZB+fVdITg4LmaQf8KtDfzkiqRjqKEd6T5iI4WwObfoxEZkPkxKaBfH1IvauRkXS+YFNawJi
	POzWxElfGfE0OlJFzl22Q8Ad3mGWID4fnnNFOm6TgOo4N9hJ1VPOF/skzgJ3TRdvNmhPb4C9BrV
	1SZNHUtQ2lEiLdowj8R9c4AX0EO8Sk9z2a1h5drSkbr/8ckmg/YnpZQ5bbzbLWIlswPEuxeTF/S
	9OobHbAD1BaVqL5e/DFla+8GGenAnADoyotc
X-Google-Smtp-Source: AGHT+IHUyP8Jk6Ior57ZnKsObhf10XeF3HAK2GWVA5IP8bfBE/gUEt+nc/2G02wLrOp5ynhFeb6YBQ==
X-Received: by 2002:a05:6214:5346:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-702c6cdfc66mr46822446d6.5.1751649084732;
        Fri, 04 Jul 2025 10:11:24 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ab9csm15480956d6.87.2025.07.04.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:11:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uXjwZ-00000005zCd-2nMQ;
	Fri, 04 Jul 2025 14:11:23 -0300
Date: Fri, 4 Jul 2025 14:11:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: lizhe.67@bytedance.com, alex.williamson@redhat.com,
	akpm@linux-foundation.org, peterx@redhat.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 5/5] vfio/type1: optimize vfio_unpin_pages_remote()
Message-ID: <20250704171123.GK904431@ziepe.ca>
References: <20250704062602.33500-1-lizhe.67@bytedance.com>
 <20250704062602.33500-6-lizhe.67@bytedance.com>
 <77d99da0-10eb-4a4d-8ad9-c6ec83cb4540@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77d99da0-10eb-4a4d-8ad9-c6ec83cb4540@redhat.com>

On Fri, Jul 04, 2025 at 10:47:00AM +0200, David Hildenbrand wrote:
> >   static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
> >   				    unsigned long pfn, unsigned long npage,
> >   				    bool do_accounting)
> >   {
> >   	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> > -	long i;
> > -	for (i = 0; i < npage; i++)
> > -		if (put_pfn(pfn++, dma->prot))
> > -			unlocked++;
> > +	if (dma->has_rsvd) {
> > +		long i;
> 
> No need to move "long i" here, but also doesn't really matter.

It should also be unsigned long as npage is unsigned

Jason
