Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916C723E344
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687196; cv=none; b=sSdK7n7/NKoI3uUfOi5I3HtuQB3GUO4ESl9aKjJ4fbD8IvpOHNl7WOJ6BxYjaEuIicrRas2NUGVuo07apTDzcV75Z+VmiqHz11AVSHkenFY1an8m+dY6UA/wDoPj/C5S3dzAPrQYGa1ATRed0/dHvAdis9aOROSra08Q+3qFknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687196; c=relaxed/simple;
	bh=MApl8hDY/vc8oo/BxqolS+uxEcYCTa0A39OnfLvElfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6+hHWBLJnkgDe4WdE7dVNEFz0hZa2jFiPz80mFIcxZi2Dv6Tr9+UFLmNc8bgVOmakaZGAqYa6TmSad3QpNtip5SFiS9eODZkAsofUisz8uigikXvRamTXidAo4QXNChbwup818euhHUWYual+e5UHPbqC8FS5dHwIS+4NlohGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mrgo3tME; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mrgo3tME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750687193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rFCUtCrZI3XwUjRd1RBQUfCJP6Am/fmHwP0If9UTQAU=;
	b=Mrgo3tMEI+XvbgoEes3jI/1tIgN8JDbxhWWqlCKX8ljM9bTZQBMaNZg+IIVRcTxyg44eWv
	mivs0cXCFIPevo4P5cI8fz8QdpLCMHgYnR7znmvUf+24R7LRHc+q/UMbeBiaOmE3RxDSd5
	B20tct5Lbxu+0RKMX4xEs9W5wsu8SMA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-oPcu4YcHME6cuwoGDXXE0w-1; Mon, 23 Jun 2025 09:59:52 -0400
X-MC-Unique: oPcu4YcHME6cuwoGDXXE0w-1
X-Mimecast-MFC-AGG-ID: oPcu4YcHME6cuwoGDXXE0w_1750687191
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31f112c90aso2249847a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687191; x=1751291991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFCUtCrZI3XwUjRd1RBQUfCJP6Am/fmHwP0If9UTQAU=;
        b=bWwzaHsYYwqpr2/BMXw25y+UHdjP9x96PXcIqYHQ7G2rJwD1EkHol4frPxev3/er6O
         nRe+jOTGAWsTcba3b/jX2ehtLHlBfMu5+5Lkuu+Dy/Saf1Mzoxd/lXYeOyKM9I5q/DQp
         iZyb3j6x/PskxpB1BGAxI1+I+T7TLNhbV2PvcSb5HcMX0v7DOAYCccspzIaXAj3tYpyL
         6azxQzLTwpRfX/JoVT71hInKvYw5r6mfdUGkCLLeG6ZcgBnNh48357wBK+yOgFFvDZ1N
         KNvgVv1wRLHUlo+1lK+qYUxj8EXUEMerCl40fWX0a8Y9Yi0pLrWVhirT78RmFD86JDD6
         Gq0w==
X-Forwarded-Encrypted: i=1; AJvYcCU7s86tC/UpouM8rmuG/pMBHoxXACRWesAW4xw3W+Kc6Tnh10bnXxetW9Wpc/806l9ox8/gDINnH1F0iAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzebsx17nzVT0diJqibxUOQJi37EGiTY4nxKFQKrjJsGlwbFPvD
	A8D6Y0V94cyVw5OSu96z2lt/kPEas/q7kxKGJkLV3HYSU8waI2l+j1vMc4T4SvTY9VReymWqeod
	ivjR68I1jlQW7XKHYsEOQnjjG4aYQWk/dLMh1SGKjhXk+6tVlW+jZ8uw4ZAmJ2Xk1nQ==
X-Gm-Gg: ASbGncvE8EvQ0wi9n1hqxauaqM9y6MLsemscx3P8MR11khLu8IRq3uaWplNcUbNKDRh
	6OYNQP0BFSUYIgbIDFmrOFA/C8igcT4EzkS9Rd65CJy3PjP5nNva/56xo+2LeNP/i1s048jU+4M
	eAncsofELkUjEtD739ZmTa1OBoQ8MZNvE2bNZEEE5GT80T1CLBjF1CMhAkvSYVoc5oVKz359xxe
	lgdtdSxrl/tbA5i+W7Zk+ByX4/2s02wEr8Jj00UBtXj1GkHmIFmrOhOz5y+r4a6+84PiJTzRN2t
	D7Bgx1wcH31ntg==
X-Received: by 2002:a05:6300:4041:b0:21f:5283:4fa5 with SMTP id adf61e73a8af0-2202915816fmr18004417637.3.1750687191004;
        Mon, 23 Jun 2025 06:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6NpXKYqUvcSGG47iYa+FuC9QWAsS+KzKQzU8hUE6O+IEN8c6C91PazULTEaTIjQTXiq6Egg==
X-Received: by 2002:a05:6300:4041:b0:21f:5283:4fa5 with SMTP id adf61e73a8af0-2202915816fmr18004375637.3.1750687190506;
        Mon, 23 Jun 2025 06:59:50 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f12423e3sm6894018a12.47.2025.06.23.06.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:59:50 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:59:44 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aFld0LpB429q9oCT@x1.local>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <20250620190342.1780170-2-peterx@redhat.com>
 <1e6fcebf-f74e-46ad-912b-d7df13527aea@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1e6fcebf-f74e-46ad-912b-d7df13527aea@redhat.com>

On Mon, Jun 23, 2025 at 10:25:33AM +0200, David Hildenbrand wrote:
> On 20.06.25 21:03, Peter Xu wrote:
> 
> Hi Peter,

Hey David,

> 
> > Introduce a generic userfaultfd API for vm_operations_struct, so that one
> > vma, especially when as a module, can support userfaults without modifying
> 
> The sentence is confusing ("vma ... as a module").
> 
> Did you mean something like ".. so that a vma that is backed by a
> special-purpose in-memory filesystem like shmem or hugetlb can support
> userfaultfd without modifying the uffd core; this is required when the
> in-memory filesystem is built as a module."

I wanted to avoid mentioning of "in-memory file systems" here.

How about an updated commit like this?

  Currently, most of the userfaultfd features are implemented directly in the
  core mm.  It will invoke VMA specific functions whenever necessary.  So far
  it is fine because it almost only interacts with shmem and hugetlbfs.

  This patch introduces a generic userfaultfd API for vm_operations_struct,
  so that any type of file (including kernel modules that can be compiled
  separately from the kernel core) can support userfaults without modifying
  the core files.

  After this API applied, if a module wants to support userfaultfd, the
  module should only need to touch its own file and properly define
  vm_uffd_ops, instead of changing anything in core mm.

  ...

> 
> > the core files.  More importantly, when the module can be compiled out of
> > the kernel.
> > 
> > So, instead of having core mm referencing modules that may not ever exist,
> > we need to have modules opt-in on core mm hooks instead.
> > 
> > After this API applied, if a module wants to support userfaultfd, the
> > module should only need to touch its own file and properly define
> > vm_uffd_ops, instead of changing anything in core mm.
> 
> Talking about modules that much is a bit confusing. I think this is more
> about cleanly supporting in-memory filesystems, without the need to
> special-case each and every one of them; can be viewed a cleanup independent
> of the module requirement from guest_memfd.

Yes.  But if we don't need to support kernel modules actually we don't need
this.. IMHO it's so far really about cleanly support kernel modules, which
can even be out-of-tree (though that's not my purpose of the change..).

Please help check if above updated commit message would be better.

> 
> > 
> > Note that such API will not work for anonymous. Core mm will process
> > anonymous memory separately for userfault operations like before.
> > 
> > This patch only introduces the API alone so that we can start to move
> > existing users over but without breaking them.
> > 
> > Currently the uffd_copy() API is almost designed to be the simplistic with
> > minimum mm changes to move over to the API.
> > 
> 
> Is there a way to move part of the actual implementation (how this is all
> wired up) from patch #4 into this patch, to then only remove the old
> shmem/hugetlb hooks (that are effectively unused) in patch #4?

Not much I really removed on the hooks, but I was trying to reuse almost
existing functions.  Here hugetlb is almost untouched on hooks, then I
reused the shmem existing function for uffd_copy() rather than removing it
(I did need to remove the definition in the shmem header though becuse it's
not needed to be exported).

The major thing got removed in patch 4 was some random checks over uffd ops
and vma flags.  I intentionally made them all in patch 4 to make review
possible.  Otherwise it can be slightly awkward to reason what got removed
without knowing what is protecting those checks.

Thanks,

-- 
Peter Xu

