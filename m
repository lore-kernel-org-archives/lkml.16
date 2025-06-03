Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B46239E73
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958498; cv=none; b=afuRm0QoxyZ8Qht2XaTnKD9nEYgrP+xvkSFKbUFmOc007uDjWwE/a6BEz235cm7aTGiEKc/WxRvHBh1y57hyTiMbC5gqaTC2Lh1FNrVLmuPBeFeXoqmfUhYCrwlrkUPE+tMHj27PwZdI5RGg3stJWzUWrBKNZe6rkt8y89vQHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958498; c=relaxed/simple;
	bh=y7QlyC6KXPLMJYPeW/fxUEb7YGMf3rqlxQiF8jReTpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTzwVJl2U7TqjoxkH4asALA8XKf99uAcsUsrIHLvDqpuZh6y0GDmUVSH1/Eh1AtvPUqSsOMGcVczmH0C0F0sWR9K0BEYUK0m7qavVVTqNIpV0Pn3v5F86/olcIEShk+/DqRqA8jI5GDMvI1hlfYlBzq4kl46+kqn7KiVVkccwD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AjOqEgfZ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AjOqEgfZ"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7cadd46ea9aso682651785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958496; x=1749563296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
        b=AjOqEgfZCAKJpwstPgw4JUuuLsAGp4nuxZRwWsRx7CMfzOZNcGorTQaU0A+5m3TJgs
         r4OuHdohJGbuNjZ0ZfPjWtHdlHW0OUVT2MLGLWgssYWADyAl4O71jzDVYgB/hFpePHMF
         82h2pWYP3V1Wpd/Dx4GOY6hgM50TO3Sw38gXNjoK5nIiV0BAazMOQed27p1HtLGXrzfG
         Y41CTIjAqO84UvYK8NETu4qxigoFB31sHhGw/l5w/mwTsZm9iCHyHZFq5TAYGiWTz4G9
         jlH6Zb+lGS1JwhW2YHzLp7uXrXNKjo1ZIRmAJZ8hteKsQOdVlximwGQrn5r+EpsPZYxy
         YDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958496; x=1749563296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
        b=StHv9YXLhndQ3nh6dhhqZ6zg7YF6Yqgzxjm8LPwUEnQ/NdV5i/T4YJbtZXLsz6qwdX
         FMmAdI4GddBTxglFv7tR+UTFtvKpLnW9icQifxGsvT2yhiCDFK+N0I0QeB21BbMEhlXX
         eivwuRJ5Y9ERRfHRWN2MgWIsnXCu/bI7oLUkmFyHApaEnG2/qb+HCHFiK4LuJM1wukAM
         vFqSawqxsynQZA5EyLnBsnyvaNh5eyD9WtV6URwFGLamgaqR0tBdqfIzW32biIpuSEi3
         CQzg8jKjEm39dFQrHMik4OAoXrGtBQkvwe2Fu26sJbCohRPfqYDKhyLeNO/eYKfbUBRE
         pdmw==
X-Forwarded-Encrypted: i=1; AJvYcCV2ChTqQoapucNOW/2ixjv9sp53MLSzFYULsPq0Ue0U4+7mR2Bp7pR/s/LWFMSDPtyQvgYzq7SK9aWsS10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRpYYNbgHcGAjfpllq4fwwKmH7BzPUIt9fR5wv78rLl+ObItaa
	5k5Wxs6DkmUmbLyoYWGl2q01EnWPIHbc4pnkGSltaxjIXLprzICBqsPeypJbzKdXtLI=
X-Gm-Gg: ASbGncvKyPb7O554CcxOTFvcAXQzpbMOwVTb4Lar5blGdwhyIBIyTdFUY1B81r0t9nq
	YAk+xp2elHZ5ENKXWO8o8OrKwN+4AGK0budz/0rY2VsDVzSAZBBxGkstppE94LNE+Ud0luM6Q8w
	Bixes+GkkF/GUmxCdQioQBMseYoihAshsPluYoJUsQhFLXbcPLWVgPYU4vVtGq6IKRU5fedDkFn
	74jeuVFImrUclHIj4mrZNswWDdFztNKBN9cUhsAczvtoHTGVkwQhEK0r9gMiwRPdCtu7JVbrpGW
	oc4vkbTl3NA+ycbpDSGB+N5spfmR2SavXxsiwKP+k2zAH2XzspUx94iSiB29B+o4KzKrRZrhvOY
	Ykglvbpynisq1+eaUTTZ8Gy5x9is=
X-Google-Smtp-Source: AGHT+IEC7tetoyd4MWB27Cys7lEZRwLgg/tDNDKGL2nO8t1WlsQDGW4e4zhoToAJp9Wky9F+fr/2kQ==
X-Received: by 2002:a05:620a:290a:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7d0a4e57644mr2655730585a.57.1748958495697;
        Tue, 03 Jun 2025 06:48:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e3fa9sm838696585a.24.2025.06.03.06.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:48:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRzy-00000001hBT-2tOq;
	Tue, 03 Jun 2025 10:48:14 -0300
Date: Tue, 3 Jun 2025 10:48:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <20250603134814.GH386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:08PM +1000, Alistair Popple wrote:
> DAX was the only thing that created pmd_devmap and pud_devmap entries
> however it no longer does as DAX pages are now refcounted normally and
> pXd_trans_huge() returns true for those. Therefore checking both pXd_devmap
> and pXd_trans_huge() is redundant and the former can be removed without
> changing behaviour as it will always be false.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  fs/dax.c                   |  5 ++---
>  include/linux/huge_mm.h    | 10 ++++------
>  include/linux/pgtable.h    |  2 +-
>  mm/hmm.c                   |  4 ++--
>  mm/huge_memory.c           | 30 +++++++++---------------------
>  mm/mapping_dirty_helpers.c |  4 ++--
>  mm/memory.c                | 15 ++++++---------
>  mm/migrate_device.c        |  2 +-
>  mm/mprotect.c              |  2 +-
>  mm/mremap.c                |  5 ++---
>  mm/page_vma_mapped.c       |  5 ++---
>  mm/pagewalk.c              |  8 +++-----
>  mm/pgtable-generic.c       |  7 +++----
>  mm/userfaultfd.c           |  4 ++--
>  mm/vmscan.c                |  3 ---
>  15 files changed, 40 insertions(+), 66 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
