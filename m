Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9340B2836A6
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552585; cv=none; b=dodaeEoDFwrFqtvVVGRaV2L4tkcXrm3fj7X6dAxVrnrImzd6wJKxsUii8z9ugyiUoPvhQyCOZfBqHktKYeqADJR0qTRIRqvNlyyN+dHi/gPRChtyT5AwYS4mWAJfbjMDB219RMjDTCzLrr2tqCpFApHjrPdh8NjwSe6LgxuSfBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552585; c=relaxed/simple;
	bh=P5P11usWkDjq0CdPX0+FsxN/e9x+8gnH+2D4IK1ObN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKcijxKGhgs1H+hl3of3dcX3HDnJHMNPXaS7EGOWA+Ki1IY65F9HveQ0EcVqanVwFiOppJcT5xKlc2MHjcuVVq+BAIi1KhHG5EXdirmR86h2ri1Ns3FDR4LPFw9+wpw0NUASLde9MLKRPDyErchpPy9f0TlkOP+g+xWj+8Jb+qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LQ4zi+Bj; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LQ4zi+Bj"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5e39d1e0eso649494085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746552582; x=1747157382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OaMyDCrAoG//6LMBGGysI9lA09I32hvxiR+VhJh6OEo=;
        b=LQ4zi+BjTVywfI5t+zUIG0xEqebQNrD+v78GSMWl8BA4Z+fWIl4mnqf9/kdueqE+oD
         KkDqEU3CJyieWe1azVLYv6QKkXxsr0T68gaeLpoqU1Isfk/XHF2jmabHSPP8CZTS36c3
         41+Ylp5ALAHFm5D5aM9FJz0GShBVjczfatWvV4ffIfpBjeayqWY7NEbEBiQOntSw0QhV
         4hfoIyLZotiGktafNQm1fw2RVFvaSBbaI+lL2vNpSE/pILHxlt+aFGrCEs1f6Yiyjqui
         Ag7FOOXkwePX4ywpvtRiFuI1z/LgSM1P97WG+63XJALqvpwDtysdSPvIE8dx7fHk9fkt
         oDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552582; x=1747157382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaMyDCrAoG//6LMBGGysI9lA09I32hvxiR+VhJh6OEo=;
        b=G5mkfwsnY5Lvf/adfe1LyazppXgm2RDq2vTZeqfvrp6BifohfPav5m0XzN3QxEQTjs
         TrONNtPM1vjYG8L73rssl4orIdvohD7qK6PSOf7buGaIlH42UkmJe942KFuPQ9QFdYPy
         nLSzDvttEy6i/NQTJvvFYX6KeALAKRglNuSnNdk0q3ZudIQveQZWeGfOGpdGOGyej092
         6pmYYHC0QmKNuk9m9TD+xcdYCi6SG+jgKgmKH7yG1mVJdiuA7iCIu7nfV1gzf7UYSnBv
         qwZNnv6d7ozR8rG6I52jz8tQZwEVVuWZxTvpJ0eP+lIPeON+BDCBFP/tuVMEF+tU8U1d
         D4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV5fJXjbP3QQ9A9F6OUIcfE4pfO5oLPfs/ngfLm5UYPRDn8fYB31kEdHuW4uX+Ah0dtEl8Cdq8cLJatEDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1eXv9+8ZIlStfkKYhSOiOQmiRH10u/4ZSRmiuDSuuJCd1HFUs
	URXxYiHefTPEXozJW32y9Dx+fn0wFWcnW38N7lysLI7TNm2lcpRQxnvqU0JqKFo=
X-Gm-Gg: ASbGnct346IQ53kB5G/H9UrrBVrMrBPdmECNnRZriMDrW48gDwc+j5sK1/yKSjfczXS
	E8WtOZiSJH5Czlxtn6opJFJXOz3FlQ40745llHBi2jkCaSzs/Tlw8zfcQUQTeDIJuol75xzQs//
	t802dWbWMFGRClS28H4yJFlfbsoWsEaPs9IBfvfjLrTjPr0GnbbWBsEH5KT0taJLKLbaKZTrj07
	+cDKBl5ygNmgVOD+7YnZMP3pjy32OPD0A6ZKcedYli4ubUSO1mjTtC1oa7C6LPCz35CImCoATaf
	QbsqKMzrTujCZBUMiBIEPcN8JAyPzpOx8jyFnaz9/hTjzWC4RzQ6YYLD8t6pCCsPD9wyzaO645G
	HGI3O3O0F5zTqmYKYaXw=
X-Google-Smtp-Source: AGHT+IFMZ5fIINTPeKhkWdgeEHlC4vrkCQlZ8NYfWErLZxx+U/X8plflWy2yROICiyb87lWzQQaofQ==
X-Received: by 2002:a05:620a:46aa:b0:7ca:e989:23fd with SMTP id af79cd13be357-7caf73a1866mr28024085a.24.1746552582447;
        Tue, 06 May 2025 10:29:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7caf75b5334sm3266885a.80.2025.05.06.10.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:29:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCM6v-00000000LGb-2K8I;
	Tue, 06 May 2025 14:29:41 -0300
Date: Tue, 6 May 2025 14:29:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iommu/vt-d: Replace spin_lock with mutex to
 protect domain ida
Message-ID: <20250506172941.GB33739@ziepe.ca>
References: <20250430021135.2370244-1-baolu.lu@linux.intel.com>
 <20250430021135.2370244-3-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430021135.2370244-3-baolu.lu@linux.intel.com>

On Wed, Apr 30, 2025 at 10:11:35AM +0800, Lu Baolu wrote:
> The domain ID allocator is currently protected by a spin_lock. However,
> ida_alloc_range can potentially block if it needs to allocate memory to
> grow its internal structures.
> 
> Replace the spin_lock with a mutex which allows sleep on block. Thus,
> the memory allocation flags can be updated from GFP_ATOMIC to GFP_KERNEL
> to allow blocking memory allocations if necessary.
> 
> Introduce a new mutex, did_lock, specifically for protecting the domain
> ida. The existing spinlock will remain for protecting other intel_iommu
> fields.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  drivers/iommu/intel/dmar.c  |  1 +
>  drivers/iommu/intel/iommu.c | 12 ++++--------
>  drivers/iommu/intel/iommu.h |  2 ++
>  3 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
