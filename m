Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09E2E4982
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480929; cv=none; b=RvMuFRIn3URLBQBA0vJFg3L4MOmFbrXuBKARtvYFT4Wi+m08Qi070a012MXrCzYOiliLy+BaZw3C0OYu4DcsziMM1Ps041P5TjkeZptOMGWf/QI3k1dEzn+xt2M89IppgcBrOYvE797naOYtBOGtShdU4R+3BHr13mkUZilujzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480929; c=relaxed/simple;
	bh=avUNtvZK0fUa7aGIuYOyPWZE1iep4kiK5Bl0okgHHA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtF3HGiewwvnlo1ucUaN1WgK6xd6aorANyF5n1zhFbPJdGkSkyy8s4t59j4NcdLymxZ7GrOi1WYhHuOTzS8rpGiobX6dtkxCZZXxlVsSOw8QSYdI1peceUfLEBzlmmSppbJD9mSvzmIKqNRvC30H5OQEpx7yP1Hsw1ZydTdgclA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CKnVJuhy; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CKnVJuhy"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748d982e97cso4797677b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1751480927; x=1752085727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=46MgjvV3epJBZdXixG7o02s3aaxSYe96C/POTn0IK/4=;
        b=CKnVJuhyqDW5v+l53C2hT1fONwq8LkyRwXuQlUE8TP6Tiuk0uDEcbyM/pfua9Mr4fv
         VoQLwFamC0UsbQLQXU+FPEQ6YYgc0AotqxO44BpFok8cZc1iGCHD66Lkng7cdHwyXdDG
         lOythuhDKPjjxAuQ4QG0BugwYUOzZyPHJTEUrZOuqvq4z8FxtZoBsUIkTppRmGzy4eNc
         AcUB8HTx3a7IOIuw6DKfxGD1lNDBBDnBJV6GF0U7vKieP5rrTvqad41ycewnoFwpZktl
         /hxOhLLqySNtYZgMUdO+kAT7DyTv3V4sl9J3Jqhw33GoiG2KbLWvIMlVUu1af4PtFzLi
         1D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751480927; x=1752085727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46MgjvV3epJBZdXixG7o02s3aaxSYe96C/POTn0IK/4=;
        b=SZBd1BZZxgFzCDZ/MyrswB7tM5nMb3/wExhDAY18/hoQofu5RtmVWotdo1gaiVIRSz
         szGK2JaIocfd0omPpen9DgvIBp0sarIR0rEWfDmAmk/vTs1HFEZeq+Qf7Lg4oYxPkLVI
         304ojzq/foYVKrE+EdN19a8mqT3wv8ZAmCHzHNSescj/XkROsbUW2CNxOePhNHA9Gq+L
         /QyBUPWxPX5veY7zKU9tpOsYaiwU4s/qWo30IQq/jsyQi+dNGNCNYAlTEv6JdPRYJDzw
         oc8H6IimMbNbg/RDr+jRNNWLnG4+5SqSjgFL4HlpCHOpuxDK6CJmm8/6ZRX2RjRVKJr/
         pn7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoTcw4WmUIvRNpycFWIzEFSaRSIRWIVFOGo6cpqy+jdE1bxlAZxA6cJHsYaz4xhR9mmmVIqklI33l3RhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysS9df/Y2bX/i62eTPB2TIq9zEvDoCHRcIGKDLvdYNoY/KR9Er
	T9zad6po0YAp7A7yFoylS7UcjCMLNDIh2QwabHW3ySzTMXvrT/HI2XYeqZSAiaKaHZg=
X-Gm-Gg: ASbGncvLubXT5RaEe4EIM2XgDKATntDIyqTPomUj8R1nGxRMdlzZIfvEh3ALHq1xFHp
	YzvCFu/8A5+dCbFYUFMMWdZaIVzRwV4ZGfCvxy72j8IFnNUXOZWtCeGF1jvt71oWhjN72UIL+LX
	zFwKG4ERjzUt5A8PVf3OWb42O4ey3CC9G/oHHvsH7+qmxV95BClgZXCkonNDxowUfEeBFK+ezUu
	il+L5DMzD7KAF82dm7BQwDAGM1hGueIL+sgUEw6pTd83qzJ8U5CwffLOBWrZCn/VMksMACePlyc
	dyXd5aJeLq1cjHmUCFlp0uPbgZgJwfYC/o3z
X-Google-Smtp-Source: AGHT+IF4ph0eWwg5euxsmabv0EeGQqiK9nx2/cAAJmk4J0EcaWCQHAieQ9iQbzhIPW0jSUPpbcOaPg==
X-Received: by 2002:a05:6a00:855:b0:748:eb38:8830 with SMTP id d2e1a72fcca58-74ca0c2788emr646222b3a.13.1751480927563;
        Wed, 02 Jul 2025 11:28:47 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef308sm14319981b3a.157.2025.07.02.11.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:28:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uX2CK-000000051mO-3Dtn;
	Wed, 02 Jul 2025 15:28:44 -0300
Date: Wed, 2 Jul 2025 15:28:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: lizhe.67@bytedance.com
Cc: alex.williamson@redhat.com, david@redhat.com, peterx@redhat.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] vfio/type1: optimize vfio_unpin_pages_remote() for
 large folio
Message-ID: <20250702182844.GE904431@ziepe.ca>
References: <20250630072518.31846-1-lizhe.67@bytedance.com>
 <20250630072518.31846-5-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630072518.31846-5-lizhe.67@bytedance.com>

On Mon, Jun 30, 2025 at 03:25:18PM +0800, lizhe.67@bytedance.com wrote:
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index a02bc340c112..7cacfb2cefe3 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -802,17 +802,29 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
>  	return pinned;
>  }
>  
> +static inline void put_valid_unreserved_pfns(unsigned long start_pfn,
> +		unsigned long npage, int prot)
> +{
> +	unpin_user_page_range_dirty_lock(pfn_to_page(start_pfn), npage,
> +					 prot & IOMMU_WRITE);
> +}

I don't think you need this wrapper.

This patch and the prior look OK

Jason
