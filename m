Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0972C171092
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060413; cv=none; b=CrBpPVXO1zqOyNLaYRNjiRfAdcIHyh1ElPICFrd1cwNy+6iHOZarvvkk3rX/T38LUi4JTF7mZ9zUQlX65RKDyei/joOJubUwrbPYuk+K6wTuA0YKfGxz/04//Y1znAgf/W+2EOkBpC50IzABXVColSjKURGwpd233T5KXQXfqAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060413; c=relaxed/simple;
	bh=PSw7YUvWQ511vtCso1nhryBLXwAKE0/7I3Ocjek5sbg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AhLC3jQS79rKY6j7MLqx6EWoUCD4D9Wz4r9oFojOCxP5jwxhS4vI4Z52RCAPIuPwGpXSN3mwaflTTRdVprr2nFQ8xSrGPF3DJElnBePKQYwmGrSfCG6JboJMcKjnB3blENwiqrKcfaaTQtvEP2s8MomIdv+NBLN7y7f3p/ILaN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CvxktNPJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CvxktNPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751060411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDjE0Jm2Bp/JA1Dp+nDAFKb5/t9DkPnadkmyEIXEj6A=;
	b=CvxktNPJuCvDqWOeJd70Ol6VBcInBXnnMlO/WGe9JTFuaHI/sMz2bppu9mDa31tYNFlb0h
	ATWdFID7lj+mPIoWdP272NNVGSNzZA+RWQYrLiABj44s30gYAGlMkpuSSmOrO7uW1ri8zW
	xswC4qgKlaJjU0AApj6pek4SEpIY+7I=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-YV8t4CbbPHyFY4IIuOVIVA-1; Fri, 27 Jun 2025 17:40:09 -0400
X-MC-Unique: YV8t4CbbPHyFY4IIuOVIVA-1
X-Mimecast-MFC-AGG-ID: YV8t4CbbPHyFY4IIuOVIVA_1751060409
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cff09d29dso49446539f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751060409; x=1751665209;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDjE0Jm2Bp/JA1Dp+nDAFKb5/t9DkPnadkmyEIXEj6A=;
        b=qL2od3frLFYN4a52XZw6IHUUhIXUeYuG+zyQMb6SUFm/ao657TtlOmOIXYQEeL8p3L
         sOMjEnkEI1aqIBTh789bufBS90W3jgxEe/DuuXX01P28yGlo4Tk7AdMkuYmaR/h3Q6vH
         6iFIYTJer6xUcqh2Bb/CKtQbEuVq6lhRSilqNDchHfw9wHB9h+R5xbARw0AcHzMZMn2X
         F7dgLBkHm8+xwKHrRAw4QayZuy9Gk8eBkLjp83huNc0P5l8r22juQC7L5knBMbsBBLoK
         uZ+d4O3PwW+fxlsfJxCDulmM1kAKgb2DVl/8qkMx3ToLWswoytl+1JOZagU438XPhbue
         q/gg==
X-Forwarded-Encrypted: i=1; AJvYcCVk5Y1wqW4DdWaRODxrXOFeqKyxOLhzVFrdoIqT/qG8HdfMc+yRYrYLvYs5tjPDYE4A0cbgi8Hb/nwjog4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxFlX4pjZcezxVPQK7MymX5QrFrckCECg3pTyYm2Y95vLfVqww
	Y3aOgplvV0NJ/0SO7u2OYENXc6OCBbyuQbPZFgl2Hx5XdBScPMG4X3KJSsjyFDAbpW6qYOe/CJ6
	+Q9jSQz/Y241srBhmioj0meXoI6eujnSOdMyQ4TcAJYgtRGE1Zw0ia572BqFFA5kruA==
X-Gm-Gg: ASbGncs1zR85qlXVF9NlFaikxQQm1cdX/2/qfbb4f8N/05RUkpNWRazyBPeWu0EZ3gA
	wD5X9SZxkY4hvMg1m3aZ80I8ut+Lqt95pqQWRO0LMKv3AT7CPoF+oCVr9xdJRLefNr8qSdlmvcL
	yEXcv5oOr7BVgwk3VKHLIoeBFX3Cbfbh4xnafwzSmHQPkB9l4EwGfVRXTuKDhXo0Ra+ZezSmmNp
	A3dakeQHPBSjcv4DGvRb+Jppdbjkjiu46CdAxZECqNAnGY7+Ti3P5M1emrTyw6/2RMUViWx2xUW
	WRi6PxVmp1eJpN2wfWoPK4gkQQ==
X-Received: by 2002:a05:6602:6b06:b0:86c:f806:37a3 with SMTP id ca18e2360f4ac-8769653c05cmr27735039f.3.1751060408652;
        Fri, 27 Jun 2025 14:40:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc5oHxFgpr5XzaS4ACG0vI5/HTTlrKCZnLrhk6AbDfKukH/RckMxcnZs/SWEE2JDvGko58GA==
X-Received: by 2002:a05:6602:6b06:b0:86c:f806:37a3 with SMTP id ca18e2360f4ac-8769653c05cmr27734539f.3.1751060408141;
        Fri, 27 Jun 2025 14:40:08 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5020489907esm716965173.37.2025.06.27.14.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 14:40:06 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:40:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: lizhe.67@bytedance.com
Cc: jgg@ziepe.ca, david@redhat.com, peterx@redhat.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] vfio/type1: introduce a new member has_rsvd for
 struct vfio_dma
Message-ID: <20250627154003.6cbd5e53.alex.williamson@redhat.com>
In-Reply-To: <20250620032344.13382-3-lizhe.67@bytedance.com>
References: <20250620032344.13382-1-lizhe.67@bytedance.com>
	<20250620032344.13382-3-lizhe.67@bytedance.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 11:23:43 +0800
lizhe.67@bytedance.com wrote:

> From: Li Zhe <lizhe.67@bytedance.com>
> 
> Introduce a new member has_rsvd for struct vfio_dma. This member is
> used to indicate whether there are any reserved or invalid pfns in
> the region represented by this vfio_dma. If it is true, it indicates
> that there is at least one pfn in this region that is either reserved
> or invalid.
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index e952bf8bdfab..8827e315e3d8 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -93,6 +93,10 @@ struct vfio_dma {
>  	bool			iommu_mapped;
>  	bool			lock_cap;	/* capable(CAP_IPC_LOCK) */
>  	bool			vaddr_invalid;
> +	/*
> +	 * Any reserved or invalid pfns within this range?
> +	 */
> +	bool			has_rsvd;

Nit, the topic isn't so complex to make a brief comment:

	bool			has_rsvd;	/* has 1 or more rsvd pfns */

Thanks,
Alex

>  	struct task_struct	*task;
>  	struct rb_root		pfn_list;	/* Ex-user pinned pfn list */
>  	unsigned long		*bitmap;
> @@ -785,6 +789,7 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
>  	}
>  
>  out:
> +	dma->has_rsvd |= rsvd;
>  	ret = vfio_lock_acct(dma, lock_acct, false);
>  
>  unpin_out:

